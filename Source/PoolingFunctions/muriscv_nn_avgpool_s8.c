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

muriscv_nn_status muriscv_nn_avgpool_s8(const muriscv_nn_context *ctx,
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
    const int32_t ch_src = input_dims->c;

// #if defined(USE_PEXT)
//
//     if (ctx->buf == NULL && muriscv_nn_avgpool_s8_get_buffer_size(output_dims->w, input_dims->c))
//     {
//         return MURISCV_NN_ARG_ERROR;
//     }
//     q15_t *buffer = (q15_t *)ctx->buf;
//
//     /* Run the following code for cores with P extension
//      */
//     for (int i_y = 0, idx_y = -pad_y; i_y < output_y; idx_y += stride_y, i_y++)
//     {
//         for (int i_x = 0, idx_x = -pad_x; i_x < output_x; idx_x += stride_x, i_x++)
//         {
//             /* Condition for kernel start dimension:
//                       (base_idx_<x,y> + kernel_<x,y>_start) >= 0 */
//             const int32_t kernel_y_start = MAX(0, -idx_y);
//             const int32_t kernel_x_start = MAX(0, -idx_x);
//
//             /* Condition for kernel end dimension:
//                    (base_idx_<x,y> + kernel_<x,y>_end) < dim_src_<width,height> */
//             const int32_t kernel_y_end = MIN(kernel_y, input_y - idx_y);
//             const int32_t kernel_x_end = MIN(kernel_x, input_x - idx_x);
//
//             int count = 0;
//             for (int k_y = kernel_y_start; k_y < kernel_y_end; k_y++)
//             {
//                 for (int k_x = kernel_x_start; k_x < kernel_x_end; k_x++)
//                 {
//                     const q7_t *start = src + ch_src * (k_x + idx_x + (k_y + idx_y) * input_x);
//
//                     for (int i = 0; i < ch_src; i++)
//                     {
//                         buffer[i] += start[i];
//                     }
//                     count++;
//                 }
//             }
//
//             // Prevent static code issue DIVIDE_BY_ZERO.
//             if (count == 0)
//             {
//                 return MURISCV_NN_ARG_ERROR;
//             }
//
//             for (int i = 0; i < ch_src; i++)
//             {
//                 int32_t sum = buffer[i] > 0 ? (buffer[i] + count / 2) : (buffer[i] - count / 2);
//                 sum /= count;
//                 sum = MAX(sum, act_min);
//                 sum = MIN(sum, act_max);
//                 dst[i] = (q7_t)sum;
//             }
//             dst += ch_src;
//         }
//     }
// #else /* defined(USE_PEXT) */

    (void)ctx; /* Only needed for P extension */

    for (int32_t i_y = 0; i_y < output_y; i_y++)
    {
        for (int32_t i_x = 0; i_x < output_x; i_x++)
        {
        
//Vicuna does not currently support the vector divide operation.  Need to use scalar avgpool for now
#if defined(USE_VEXT) && !defined(SIM_VICUNA)

            /* TODO(fabianpedd): These boundary checks for zero padding ensure
             * that we do not access elements outside the array. Here, in the
             * vectorized version, they are implemented more efficently when
             * compared to the scalar implementation below.
             */
            const int32_t k_y_start = MAX(0, i_y * stride_y - pad_y);
            const int32_t k_y_end = MIN(i_y * stride_y - pad_y + kernel_y, input_y);

            const int32_t k_x_start = MAX(0, i_x * stride_x - pad_x);
            const int32_t k_x_end = MIN(i_x * stride_x - pad_x + kernel_x, input_x);

            const int8_t *pSrc = src;
            int8_t *pDst = &dst[ch_src * (i_x + i_y * output_x)];

            /* TODO(fabianpedd): Maybe reorder the loop and move the channel to the innermost loop. This should help get
            rid of the nasty pTmp calculation in the innermost loop. Do the same for the scalar version. */
            int32_t chCnt = ch_src;
            while (chCnt > 0)
            {
                int32_t count = 0;
                size_t vl = vsetvl_e32m8(chCnt);
                vint32m8_t sum_v = vmv_v_x_i32m8(0, vl);

                for (int32_t k_y = k_y_start; k_y < k_y_end; k_y++)
                {
                    for (int32_t k_x = k_x_start; k_x < k_x_end; k_x++)
                    {
                        const int8_t *pTmp = pSrc + (ch_src * (k_x + k_y * input_x));

                        vint32m8_t r0 = vsext_vf4_i32m8(vle8_v_i8m2(pTmp, vl), vl);
                        sum_v = vadd_vv_i32m8(sum_v, r0, vl);

                        count++;
                    }
                }

                // Prevent static code issue DIVIDE_BY_ZERO.
                if (count == 0)
                {
                    return MURISCV_NN_ARG_ERROR;
                }

                /* TODO(fabianpedd): Maybe use fixedpoint instructions instead
                 * in order to reduce instruction count (using rounding mode RNU). */
                vbool4_t mask = vmsgt_vx_i32m8_b4(sum_v, 0, vl);
                sum_v = vadd_vx_i32m8_m(mask, sum_v, sum_v, count / 2, vl);
                mask = vmnot_m_b4(mask, vl);
                sum_v = vsub_vx_i32m8_m(mask, sum_v, sum_v, count / 2, vl);
                sum_v = vdiv_vx_i32m8(sum_v, count, vl);

                sum_v = vmax_vx_i32m8(sum_v, act_min, vl);
                sum_v = vmin_vx_i32m8(sum_v, act_max, vl);

                /* Pack results back into 8 bit and store */
                vint8m2_t out_packed = vnclip_wx_i8m2(vnclip_wx_i16m4(sum_v, 0, vl), 0, vl);
                vse8_v_i8m2(pDst++, out_packed, vl);

                chCnt--;
                pSrc++;
            }

#else /* defined(USE_VEXT) */

            const int32_t k_y_start = MAX(0, i_y * stride_y - pad_y);
            const int32_t k_y_end = MIN(i_y * stride_y - pad_y + kernel_y, input_y);

            const int32_t k_x_start = MAX(0, i_x * stride_x - pad_x);
            const int32_t k_x_end = MIN(i_x * stride_x - pad_x + kernel_x, input_x);

            for (int32_t i_ch_in = 0; i_ch_in < ch_src; i_ch_in++)
            {
                int32_t sum = 0;
                int32_t count = 0;
                for (int32_t k_y = k_y_start; k_y < k_y_end; k_y++)
                {
                    for (int32_t k_x = k_x_start; k_x < k_x_end; k_x++)
                    {
                        sum += src[i_ch_in + ch_src * (k_x + k_y * input_x)];
                        count++;
                    }
                }

                // Prevent static code issue DIVIDE_BY_ZERO.
                if (count == 0)
                {
                    return MURISCV_NN_ARG_ERROR;
                }

                sum = sum > 0 ? (sum + count / 2) / count : (sum - count / 2) / count;
                sum = MAX(sum, act_min);
                sum = MIN(sum, act_max);

                dst[i_ch_in + ch_src * (i_x + i_y * output_x)] = sum;
            }

#endif /* defined(USE_VEXT) */
        }
    }
// #endif /* defined(USE_PEXT) */

    return MURISCV_NN_SUCCESS;
}

/*int32_t muriscv_nn_avgpool_s8_get_buffer_size(const int output_x, const int ch_src)
{
    (void)output_x;

#if defined(USE_PEXT)
    return (ch_src * sizeof(int16_t));
#else
    (void)ch_src;
    return 0;
#endif
}*/
/**
 * @} end of Pooling group
 */
