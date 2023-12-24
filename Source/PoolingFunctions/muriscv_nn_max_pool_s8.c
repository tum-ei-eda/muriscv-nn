/*
 * Copyright (C) 2010-2021 Arm Limited or its affiliates.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Modifications copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM
 */

#if defined(USE_VEXT)
#include <riscv_vector.h>
#elif defined(USE_PEXT)
#include <rvp_intrinsic.h>
#endif

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

static inline void compare_and_replace_if_larger(int8_t *base, const int8_t *target, int32_t length)
{
#if defined(USE_VEXT)

    /* We are operating on vl elements at a time. */
    for (size_t cnt = length, vl = 0; cnt > 0; cnt -= vl, base += vl, target += vl)
    {
        /* Set the vl using 8bit elements and a vector grouping of 8. */
        vl = vsetvl_e8m8(cnt);

        /* Load the vector groups from memory. */
        vint8m8_t op_1 = vle8_v_i8m8(base, vl);
        vint8m8_t op_2 = vle8_v_i8m8(target, vl);

        /* Apply max operation on whole vector group at once. */
        vint8m8_t max = vmax_vv_i8m8(op_1, op_2, vl);

        /* Store result back to memory. */
        vse8_v_i8m8(base, max, vl);
    }

#else /* defined(USE_VEXT) */

    size_t idx = 0;

#if defined(USE_PEXT)
    while ((length & ~0x07) > idx)
    {
        // if (target[idx] > base[idx])
        // {
        //     base[idx] = target[idx];
        // }
        // if (target[idx + 1] > base[idx + 1])
        // {
        //     base[idx + 1] = target[idx + 1];
        // }
        // if (target[idx + 2] > base[idx + 2])
        // {
        //     base[idx + 2] = target[idx + 2];
        // }
        // if (target[idx + 3] > base[idx + 3])
        // {
        //     base[idx + 3] = target[idx + 3];
        // }

        int32_t *b = (int32_t *)(base + idx);
        int32_t *t = (int32_t *)(target + idx);
        *b = __rv_smax8(*b, *t);
        *(b + 1) = __rv_smax8(*(b + 1), *(t + 1));

        idx += 8;
    }
    // TODO(fabianpedd): Smth very inefficient is happening when we have large uneven lengths and thus enter both while
    // loops. Entering only one of them is very efficient.
#endif /* defined(USE_PEXT) */

    while (length > idx)
    {
        if (target[idx] > base[idx])
        {
            base[idx] = target[idx];
        }
        idx++;
    }

#endif /* defined(USE_VEXT) */
}

static inline void clamp_output(int8_t *source, int32_t length, const int32_t act_min, const int32_t act_max)
{
#if defined(USE_VEXT)

    /* We are operating on vl elements at a time. */
    for (size_t cnt = length, vl = 0; cnt > 0; cnt -= vl, source += vl)
    {
        /* Set the vl using 8bit elements and a vector grouping of 8. */
        vl = vsetvl_e8m8(cnt);

        /* Load the vector group from memory. */
        vint8m8_t val = vle8_v_i8m8(source, vl);

        /* Apply activation on whole vector group at once. */
        val = vmax_vx_i8m8(val, act_min, vl);
        val = vmin_vx_i8m8(val, act_max, vl);

        /* Store results back to memory. */
        vse8_v_i8m8(source, val, vl);
    }

#else /* defined(USE_VEXT) */
    size_t idx = 0;

#if defined(USE_PEXT)
    int32_t max_packed = PACK_Q7x4_32x1(act_max, act_max, act_max, act_max);
    int32_t min_packed = PACK_Q7x4_32x1(act_min, act_min, act_min, act_min);
    while ((length & ~0x07) > idx)
    {
        // source[idx] = MIN(MAX(source[idx], act_min), act_max);
        // source[idx + 1] = MIN(MAX(source[idx + 1], act_min), act_max);
        // source[idx + 2] = MIN(MAX(source[idx + 2], act_min), act_max);
        // source[idx + 3] = MIN(MAX(source[idx + 3], act_min), act_max);

        int32_t *s = (int32_t *)(source + idx);
        *s = __rv_smin8(__rv_smax8(*s, min_packed), max_packed);
        *(s+1) = __rv_smin8(__rv_smax8(*(s+1), min_packed), max_packed);

        idx += 8;
    }
#endif /* defined(USE_PEXT) */

    while (length > idx)
    {
        source[idx] = MIN(MAX(source[idx], act_min), act_max);
        idx++;
    }

#endif /* defined(USE_VEXT) */
}

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup Pooling
 * @{
 */

/*
 * Optimized s8 max pooling function
 *
 * Refer to header file for details.
 *
 */

muriscv_nn_status muriscv_nn_max_pool_s8(const muriscv_nn_context *ctx,
                                        const muriscv_nn_pool_params *pool_params,
                                        const muriscv_nn_dims *input_dims,
                                        const q7_t *src,
                                        const muriscv_nn_dims *filter_dims,
                                        const muriscv_nn_dims *output_dims,
                                        q7_t *dst)
{
    const int32_t input_y = input_dims->h;
    const int32_t input_x = input_dims->w;
    const int32_t output_y = output_dims->h;
    const int32_t output_x = output_dims->w;
    const int32_t stride_y = pool_params->stride.h;
    const int32_t stride_x = pool_params->stride.w;
    const int32_t kernel_y = filter_dims->h;
    const int32_t kernel_x = filter_dims->w;
    const int32_t pad_y = pool_params->padding.h;
    const int32_t pad_x = pool_params->padding.w;
    const int32_t act_min = pool_params->activation.min;
    const int32_t act_max = pool_params->activation.max;
    const int32_t channel_in = input_dims->c;
    (void)ctx;
    int8_t *dst_base = dst;

    for (int32_t i_y = 0, base_idx_y = -pad_y; i_y < output_y; base_idx_y += stride_y, i_y++)
    {
        for (int32_t i_x = 0, base_idx_x = -pad_x; i_x < output_x; base_idx_x += stride_x, i_x++)
        {
            /* Condition for kernel start dimension: (base_idx_<x,y> + kernel_<x,y>_start) >= 0 */
            const int32_t ker_y_start = MAX(0, -base_idx_y);
            const int32_t ker_x_start = MAX(0, -base_idx_x);

            /* Condition for kernel end dimension: (base_idx_<x,y> + kernel_<x,y>_end) < dim_src_<width,height> */
            const int32_t kernel_y_end = MIN(kernel_y, input_y - base_idx_y);
            const int32_t kernel_x_end = MIN(kernel_x, input_x - base_idx_x);

            int32_t count = 0;

            for (int32_t k_y = ker_y_start; k_y < kernel_y_end; k_y++)
            {
                for (int32_t k_x = ker_x_start; k_x < kernel_x_end; k_x++)
                {
                    const int8_t *start = src + channel_in * (k_x + base_idx_x + (k_y + base_idx_y) * input_x);

                    if (count == 0)
                    {
                        memcpy(dst, start, channel_in);
                        count++;
                    }
                    else
                    {
                        compare_and_replace_if_larger(dst, start, channel_in);
                    }
                }
            }
            /* 'count' is expected to be non-zero here. */
            dst += channel_in;
        }
    }

    clamp_output(dst_base, output_x * output_y * channel_in, act_min, act_max);

    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of Pooling group
 */
