/*
 * Copyright (C) 2010-2022 Arm Limited or its affiliates.
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

#if defined(USE_PEXT)
#include <rvp_intrinsic.h>
#endif

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup NNConv
 * @{
 */

/*
 * Optimized s8 depthwise convolution function with constraint that
 * in_channel == out_channel and kernel_x == kernel_y == 3 with pads at most 1
 *
 *  Refer prototype header file for details.
 *
 */

muriscv_nn_status muriscv_nn_depthwise_conv_3x3_s8(const muriscv_nn_context *ctx,
                                                   const muriscv_nn_dw_conv_params *dw_conv_params,
                                                   const muriscv_nn_per_channel_quant_params *quant_params,
                                                   const muriscv_nn_dims *input_dims,
                                                   const q7_t *input,
                                                   const muriscv_nn_dims *filter_dims,
                                                   const q7_t *kernel,
                                                   const muriscv_nn_dims *bias_dims,
                                                   const int32_t *bias,
                                                   const muriscv_nn_dims *output_dims,
                                                   q7_t *output)
{
    // TODO(fabianpedd): Accelerate this using the vector extension. While ARM can't do this efficently, we most likely
    // can using discountinous loads and length agnostic vectors

    (void)ctx;
    (void)bias_dims;

    const int32_t input_x = input_dims->w;
    const int32_t input_y = input_dims->h;
    const int32_t input_ch = input_dims->c;
    const int32_t output_ch = output_dims->c;
    const int32_t pad_x = dw_conv_params->padding.w;
    const int32_t pad_y = dw_conv_params->padding.h;
    const int32_t stride_x = dw_conv_params->stride.w;
    const int32_t stride_y = dw_conv_params->stride.h;
    const int32_t *output_shift = quant_params->shift;
    const int32_t *output_mult = quant_params->multiplier;
    const int32_t output_x = output_dims->w;
    const int32_t output_y = output_dims->h;
    const int32_t output_offset = dw_conv_params->output_offset;
    const int32_t input_offset = dw_conv_params->input_offset;
    const int32_t output_activation_min = dw_conv_params->activation.min;
    const int32_t output_activation_max = dw_conv_params->activation.max;

#if defined(USE_PEXT)
    const uint32_t input_offset_s16x2 = __rv_packu(input_offset, input_offset);
#endif

    /* Check input constraints input_ch == output_ch */
    if (input_ch != output_ch)
    {
        return MURISCV_NN_ARG_ERROR;
    }
    /* Check input constraints pad_x <= 1 */
    if (pad_x > 1 || filter_dims->w != 3 || filter_dims->h != 3)
    {
        return MURISCV_NN_ARG_ERROR;
    }

    for (int32_t in_h = -pad_y, out_h = 0, out_idx = 0; out_h < output_y; in_h += stride_y, ++out_h)
    {
        for (int32_t in_w = -pad_x, out_w = 0, ker_h_start = MAX(0, -in_h); out_w < output_x; in_w += stride_x, ++out_w)
        {
            int32_t in_ch = 0;
            int32_t ker_w_start = MAX(0, -in_w);

            for (; in_ch <= (input_ch - 4); in_ch += 4)
            {
                int32_t out_buff0 = bias[in_ch + 0];
                int32_t out_buff1 = bias[in_ch + 1];
                int32_t out_buff2 = bias[in_ch + 2];
                int32_t out_buff3 = bias[in_ch + 3];

                const int8_t *input_ptr = input + (in_h + ker_h_start) * (input_ch * input_x) + in_w * input_ch + in_ch;
                const int8_t *kernel_ptr = kernel + ker_h_start * (input_ch * 3) + in_ch;

                for (int32_t ker_h = ker_h_start; ker_h < MIN(3, input_y - in_h); ++ker_h)
                {
                    int32_t in_val = 0;
                    int32_t ker_val = 0;

#if defined(USE_PEXT)
                    int32_t in_val01 = 0;
                    int32_t in_val23 = 0;
                    int32_t ker_val01 = 0;
                    int32_t ker_val23 = 0;

                    if (ker_w_start == 0)
                    {
                        in_val = muriscv_nn_read_q7x4(input_ptr);
                        ker_val = muriscv_nn_read_q7x4(kernel_ptr);

                        in_val01 = __rv_add16(__rv_sunpkd810(in_val), input_offset_s16x2);
                        in_val23 = __rv_add16(__rv_sunpkd832(in_val), input_offset_s16x2);

                        ker_val01 = __rv_sunpkd810(ker_val);
                        ker_val23 = __rv_sunpkd832(ker_val);

                        out_buff0 = __rv_kmabb(out_buff0, in_val01, ker_val01);
                        out_buff1 = __rv_kmatt(out_buff1, in_val01, ker_val01);
                        out_buff2 = __rv_kmabb(out_buff2, in_val23, ker_val23);
                        out_buff3 = __rv_kmatt(out_buff3, in_val23, ker_val23);
                    }

                    in_val = muriscv_nn_read_q7x4(input_ptr + input_ch);
                    ker_val = muriscv_nn_read_q7x4(kernel_ptr + input_ch);

                    in_val01 = __rv_add16(__rv_sunpkd810(in_val), input_offset_s16x2);
                    in_val23 = __rv_add16(__rv_sunpkd832(in_val), input_offset_s16x2);

                    ker_val01 = __rv_sunpkd810(ker_val);
                    ker_val23 = __rv_sunpkd832(ker_val);

                    out_buff0 = __rv_kmabb(out_buff0, in_val01, ker_val01);
                    out_buff1 = __rv_kmatt(out_buff1, in_val01, ker_val01);
                    out_buff2 = __rv_kmabb(out_buff2, in_val23, ker_val23);
                    out_buff3 = __rv_kmatt(out_buff3, in_val23, ker_val23);

                    if ((input_x - in_w) >= 3)
                    {
                        in_val = muriscv_nn_read_q7x4(input_ptr + (input_ch << 1));
                        ker_val = muriscv_nn_read_q7x4(kernel_ptr + (input_ch << 1));

                        in_val01 = __rv_add16(__rv_sunpkd810(in_val), input_offset_s16x2);
                        in_val23 = __rv_add16(__rv_sunpkd832(in_val), input_offset_s16x2);

                        ker_val01 = __rv_sunpkd810(ker_val);
                        ker_val23 = __rv_sunpkd832(ker_val);

                        out_buff0 = __rv_kmabb(out_buff0, in_val01, ker_val01);
                        out_buff1 = __rv_kmatt(out_buff1, in_val01, ker_val01);
                        out_buff2 = __rv_kmabb(out_buff2, in_val23, ker_val23);
                        out_buff3 = __rv_kmatt(out_buff3, in_val23, ker_val23);
                    }

#else // if defined(USE_PEXT)
                    if (ker_w_start == 0)
                    {
                        in_val = muriscv_nn_read_q7x4(input_ptr);
                        ker_val = muriscv_nn_read_q7x4(kernel_ptr);

                        out_buff0 += ((int8_t)in_val + input_offset) * (int8_t)ker_val;
                        out_buff1 += ((int8_t)(in_val >> 8) + input_offset) * (int8_t)(ker_val >> 8);
                        out_buff2 += ((int8_t)(in_val >> 16) + input_offset) * (int8_t)(ker_val >> 16);
                        out_buff3 += ((int8_t)(in_val >> 24) + input_offset) * (int8_t)(ker_val >> 24);
                    }

                    in_val = muriscv_nn_read_q7x4(input_ptr + input_ch);
                    ker_val = muriscv_nn_read_q7x4(kernel_ptr + input_ch);

                    out_buff0 += ((int8_t)in_val + input_offset) * (int8_t)ker_val;
                    out_buff1 += ((int8_t)(in_val >> 8) + input_offset) * (int8_t)(ker_val >> 8);
                    out_buff2 += ((int8_t)(in_val >> 16) + input_offset) * (int8_t)(ker_val >> 16);
                    out_buff3 += ((int8_t)(in_val >> 24) + input_offset) * (int8_t)(ker_val >> 24);

                    if ((input_x - in_w) >= 3)
                    {
                        in_val = muriscv_nn_read_q7x4(input_ptr + (input_ch << 1));
                        ker_val = muriscv_nn_read_q7x4(kernel_ptr + (input_ch << 1));

                        out_buff0 += ((int8_t)in_val + input_offset) * (int8_t)ker_val;
                        out_buff1 += ((int8_t)(in_val >> 8) + input_offset) * (int8_t)(ker_val >> 8);
                        out_buff2 += ((int8_t)(in_val >> 16) + input_offset) * (int8_t)(ker_val >> 16);
                        out_buff3 += ((int8_t)(in_val >> 24) + input_offset) * (int8_t)(ker_val >> 24);
                    }
#endif

                    input_ptr += (input_ch * input_x);
                    kernel_ptr += (input_ch * 3);
                }

                out_buff0 = muriscv_nn_requantize(out_buff0, output_mult[in_ch + 0], output_shift[in_ch + 0]);
                out_buff1 = muriscv_nn_requantize(out_buff1, output_mult[in_ch + 1], output_shift[in_ch + 1]);
                out_buff2 = muriscv_nn_requantize(out_buff2, output_mult[in_ch + 2], output_shift[in_ch + 2]);
                out_buff3 = muriscv_nn_requantize(out_buff3, output_mult[in_ch + 3], output_shift[in_ch + 3]);

                out_buff0 += output_offset;
                out_buff1 += output_offset;
                out_buff2 += output_offset;
                out_buff3 += output_offset;

                out_buff0 = MIN(MAX(out_buff0, output_activation_min), output_activation_max);
                out_buff1 = MIN(MAX(out_buff1, output_activation_min), output_activation_max);
                out_buff2 = MIN(MAX(out_buff2, output_activation_min), output_activation_max);
                out_buff3 = MIN(MAX(out_buff3, output_activation_min), output_activation_max);

                output[out_idx++] = (int8_t)out_buff0;
                output[out_idx++] = (int8_t)out_buff1;
                output[out_idx++] = (int8_t)out_buff2;
                output[out_idx++] = (int8_t)out_buff3;
            }

            // Leftover
            for (; in_ch < input_ch; ++in_ch)
            {
                int32_t out_buff = bias[in_ch];

                const int8_t *input_ptr = input + (in_h + ker_h_start) * (input_ch * input_x) + in_w * input_ch + in_ch;
                const int8_t *kernel_ptr = kernel + ker_h_start * (input_ch * 3) + in_ch;

                for (int32_t ker_h = ker_h_start; ker_h < MIN(3, input_y - in_h); ++ker_h)
                {
                    if (ker_w_start == 0)
                    {
                        out_buff += (*(input_ptr) + input_offset) * *(kernel_ptr);
                    }

                    out_buff += (*(input_ptr + input_ch) + input_offset) * *(kernel_ptr + input_ch);

                    if ((input_x - in_w) >= 3)
                    {
                        out_buff += (*(input_ptr + (input_ch << 1)) + input_offset) * *(kernel_ptr + (input_ch << 1));
                    }

                    input_ptr += (input_ch * input_x);
                    kernel_ptr += (input_ch * 3);
                }

                out_buff = muriscv_nn_requantize(out_buff, output_mult[in_ch], output_shift[in_ch]);
                out_buff += output_offset;
                out_buff = MIN(MAX(out_buff, output_activation_min), output_activation_max);
                output[out_idx++] = (int8_t)out_buff;
            }
        }
    }

    /* Return to application */
    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of NNConv group
 */
