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

muriscv_nn_status muriscv_nn_avgpool_s16(const muriscv_nn_context *ctx,
                                         const muriscv_nn_pool_params *pool_params,
                                         const muriscv_nn_dims *input_dims,
                                         const q15_t *src,
                                         const muriscv_nn_dims *filter_dims,
                                         const muriscv_nn_dims *output_dims,
                                         q15_t *dst)
{
    (void)ctx; /* Only needed for DSP extension */
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

    for (int32_t i_y = 0; i_y < output_y; i_y++)
    {
        for (int32_t i_x = 0; i_x < output_x; i_x++)
        {

#if defined(USE_VEXT)

            /* TODO(fabianpedd): These boundary checks for zero padding ensure
             * that we do not access elements outside the array. Here, in the
             * vectorized version, they are implemented more efficently when
             * compared to the scalar implementation below.
             */
            int32_t k_y_start = MAX(0, i_y * stride_y - pad_y);
            int32_t k_y_end = MIN(i_y * stride_y - pad_y + kernel_y, input_y);

            int32_t k_x_start = MAX(0, i_x * stride_x - pad_x);
            int32_t k_x_end = MIN(i_x * stride_x - pad_x + kernel_x, input_x);

            const int16_t *pSrc = src;
            int16_t *pDst = &dst[ch_src * (i_x + i_y * output_x)];

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
                        const int16_t *pTmp = pSrc + (ch_src * (k_x + k_y * input_x));

                        vint32m8_t r0 = vsext_vf2_i32m8(vle16_v_i16m4(pTmp, vl), vl);
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

                /* Pack results back into 16 bit and store */
                vint16m4_t out_packed = vnclip_wx_i16m4(sum_v, 0, vl);
                vse16_v_i16m4(pDst++, out_packed, vl);

                chCnt--;
                pSrc++;
            }

#else /* defined(USE_VEXT) */

            for (int16_t i_ch_in = 0; i_ch_in < ch_src; i_ch_in++)
            {
                int32_t sum = 0;
                int32_t count = 0;
                for (int16_t k_y = i_y * stride_y - pad_y; k_y < i_y * stride_y - pad_y + kernel_y; k_y++)
                {
                    for (int16_t k_x = i_x * stride_x - pad_x; k_x < i_x * stride_x - pad_x + kernel_x; k_x++)
                    {
                        /* TODO(fabianpedd): Adopt the more efficent boundary check from
                         * the vector implementation above. */
                        if (k_y >= 0 && k_x >= 0 && k_y < input_y && k_x < input_x)
                        {
                            sum += src[i_ch_in + ch_src * (k_x + k_y * input_x)];
                            count++;
                        }
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

    return MURISCV_NN_SUCCESS;
}

/*int32_t muriscv_nn_avgpool_s16_get_buffer_size(const int output_x, const int ch_src)
{
    (void)output_x;
    (void)ch_src;
    return 0;
}*/
/**
 * @} end of Pooling group
 */
