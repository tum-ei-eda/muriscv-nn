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
#endif

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

// static void compare_and_replace_if_larger(int16_t *base, const int16_t *target, int32_t length)
// {
//     q15_t *dst = base;
//     const q15_t *src = target;
//
//     while (length--)
//     {
//         if (*src > *dst)
//         {
//             *dst++ = *src++;
//         }
//     }
// }
//
// static void clamp_output(int16_t *source, int32_t length, const int16_t act_min, const int16_t act_max)
// {
//     while (length--)
//     {
//         int16_t comp = *source;
//         comp = MAX(comp, act_min);
//         comp = MIN(comp, act_max);
//         *source++ = comp;
//     }
// }
//
// /**
//  *  @ingroup groupNN
//  */
//
// /**
//  * @addtogroup Pooling
//  * @{
//  */
//
// /*
//  * Optimized s16 max pooling function
//  *
//  * Refer to header file for details.
//  *
//  */
//
// muriscv_nn_status muriscv_nn_maxpool_s16(const muriscv_nn_context *ctx,
//                                          const muriscv_nn_pool_params *pool_params,
//                                          const muriscv_nn_dims *input_dims,
//                                          const int16_t *src,
//                                          const muriscv_nn_dims *filter_dims,
//                                          const muriscv_nn_dims *output_dims,
//                                          int16_t *dst)
// {
//     const int32_t input_y = input_dims->h;
//     const int32_t input_x = input_dims->w;
//     const int32_t output_y = output_dims->h;
//     const int32_t output_x = output_dims->w;
//     const int32_t stride_y = pool_params->stride.h;
//     const int32_t stride_x = pool_params->stride.w;
//     const int32_t kernel_y = filter_dims->h;
//     const int32_t kernel_x = filter_dims->w;
//     const int32_t pad_y = pool_params->padding.h;
//     const int32_t pad_x = pool_params->padding.w;
//     const int16_t act_min = pool_params->activation.min;
//     const int16_t act_max = pool_params->activation.max;
//     const int32_t channel_in = input_dims->c;
//     (void)ctx;
//     int16_t *dst_base = dst;
//
//     for (int i_y = 0, base_idx_y = -pad_y; i_y < output_y; base_idx_y += stride_y, i_y++)
//     {
//         for (int i_x = 0, base_idx_x = -pad_x; i_x < output_x; base_idx_x += stride_x, i_x++)
//         {
//             /* Condition for kernel start dimension: (base_idx_<x,y> + kernel_<x,y>_start) >= 0 */
//             const int32_t ker_y_start = MAX(0, -base_idx_y);
//             const int32_t ker_x_start = MAX(0, -base_idx_x);
//
//             /* Condition for kernel end dimension: (base_idx_<x,y> + kernel_<x,y>_end) < dim_src_<width,height> */
//             const int32_t kernel_y_end = MIN(kernel_y, input_y - base_idx_y);
//             const int32_t kernel_x_end = MIN(kernel_x, input_x - base_idx_x);
//
//             int count = 0;
//
//             for (int k_y = ker_y_start; k_y < kernel_y_end; k_y++)
//             {
//                 for (int k_x = ker_x_start; k_x < kernel_x_end; k_x++)
//                 {
//                     const int16_t *start = src + channel_in * (k_x + base_idx_x + (k_y + base_idx_y) * input_x);
//
//                     if (count == 0)
//                     {
//                         memcpy(dst, start, channel_in * sizeof(int16_t));
//                         count++;
//                     }
//                     else
//                     {
//                         compare_and_replace_if_larger(dst, start, channel_in);
//                     }
//                 }
//             }
//             /* 'count' is expected to be non-zero here. */
//             dst += channel_in;
//         }
//     }
//
//     clamp_output(dst_base, output_x * output_y * channel_in, act_min, act_max);
//
//     return MURISCV_NN_SUCCESS;
// }

static void compare_and_replace_if_larger(int16_t *base, const int16_t *target, int32_t length)
{
#if defined(USE_VEXT)

    /* We are operating on vl elements at a time. */
    for (size_t cnt = length, vl = 0; cnt > 0; cnt -= vl, base += vl, target += vl)
    {
        /* Set the vl using 16bit elements and a vector grouping of 8. */
        vl = vsetvl_e16m8(cnt);

        /* Load the vector groups from memory. */
        vint16m8_t op_1 = vle16_v_i16m8(base, vl);
        vint16m8_t op_2 = vle16_v_i16m8(target, vl);

        /* Apply max operation on whole vector group at once. */
        vint16m8_t max = vmax_vv_i16m8(op_1, op_2, vl);

        /* Store result back to memory. */
        vse16_v_i16m8(base, max, vl);
    }

#else /* defined(USE_VEXT) */

    for (int32_t i = 0; i < length; i++)
    {
        if (target[i] > base[i])
        {
            base[i] = target[i];
        }
    }

#endif /* defined(USE_VEXT) */
}

static void clamp_output(int16_t *source, int32_t length, const int16_t act_min, const int16_t act_max)
{
#if defined(USE_VEXT)

    /* We are operating on vl elements at a time. */
    for (size_t cnt = length, vl = 0; cnt > 0; cnt -= vl, source += vl)
    {
        /* Set the vl using 16bit elements and a vector grouping of 8. */
        vl = vsetvl_e16m8(cnt);

        /* Load the vector group from memory. */
        vint16m8_t val = vle16_v_i16m8(source, vl);

        /* Apply activation on whole vector group at once. */
        val = vmax_vx_i16m8(val, act_min, vl);
        val = vmin_vx_i16m8(val, act_max, vl);

        /* Store results back to memory. */
        vse16_v_i16m8(source, val, vl);
    }

#else /* defined(USE_VEXT) */

    for (int32_t i = 0; i < length; i++)
    {
        source[i] = MIN(MAX(source[i], act_min), act_max);
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
 * Optimized s16 max pooling function
 *
 * Refer to header file for details.
 *
 */

muriscv_nn_status muriscv_nn_max_pool_s16(const muriscv_nn_context *ctx,
                                         const muriscv_nn_pool_params *pool_params,
                                         const muriscv_nn_dims *input_dims,
                                         const int16_t *src,
                                         const muriscv_nn_dims *filter_dims,
                                         const muriscv_nn_dims *output_dims,
                                         int16_t *dst)
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
    const int16_t act_min = pool_params->activation.min;
    const int16_t act_max = pool_params->activation.max;
    const int32_t channel_in = input_dims->c;
    (void)ctx;
    int16_t *dst_base = dst;

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
                    const int16_t *start = src + channel_in * (k_x + base_idx_x + (k_y + base_idx_y) * input_x);

                    if (count == 0)
                    {
                        memcpy(dst, start, channel_in * sizeof(int16_t));
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
