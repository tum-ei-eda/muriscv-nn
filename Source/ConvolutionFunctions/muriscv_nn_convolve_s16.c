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

#if defined(USE_VEXT)
#include <riscv_vector.h>
#elif defined(USE_PEXT)
#include <rvp_intrinsic.h>
#endif

#include <string.h>

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
 * Basic s16 convolution function.
 *
 * Refer header file for details. Optimal use case for the DSP/MVE implementation is when input and output channels
 * are multiples of 4 or atleast greater than 4.
 *
 */

muriscv_nn_status muriscv_nn_convolve_s16(const muriscv_nn_context *ctx,
                                          const muriscv_nn_conv_params *conv_params,
                                          const muriscv_nn_per_channel_quant_params *quant_params,
                                          const muriscv_nn_dims *input_dims,
                                          const q15_t *input_data,
                                          const muriscv_nn_dims *filter_dims,
                                          const q7_t *filter_data,
                                          const muriscv_nn_dims *bias_dims,
                                          const muriscv_nn_bias_data *bias_data,
                                          const muriscv_nn_dims *output_dims,
                                          q15_t *output_data)
{
    (void)bias_dims;
    (void)ctx;

    const int32_t input_batches = input_dims->n;
    const int32_t input_x = input_dims->w;
    const int32_t input_y = input_dims->h;
    const int32_t input_ch = input_dims->c;
    const int32_t kernel_x = filter_dims->w;
    const int32_t kernel_y = filter_dims->h;
    const int32_t output_x = output_dims->w;
    const int32_t output_y = output_dims->h;
    const int32_t output_ch = output_dims->c;

    const int32_t pad_x = conv_params->padding.w;
    const int32_t pad_y = conv_params->padding.h;
    const int32_t stride_x = conv_params->stride.w;
    const int32_t stride_y = conv_params->stride.h;
    const int32_t dilation_x = conv_params->dilation.w;
    const int32_t dilation_y = conv_params->dilation.h;

    const int32_t out_activation_min = conv_params->activation.min;
    const int32_t out_activation_max = conv_params->activation.max;
    int32_t *output_mult = quant_params->multiplier;
    int32_t *output_shift = quant_params->shift;

    for (int i_batch = 0; i_batch < input_batches; i_batch++)
    {
        /* Run the following code as reference implementation for Cortex-M0 and Cortex-M3 */
        for (int32_t i_out_ch = 0; i_out_ch < output_ch; i_out_ch++)
        {
            const q31_t reduced_multiplier = REDUCE_MULTIPLIER(output_mult[i_out_ch]);

            for (int32_t base_idx_y = -pad_y, i_out_y = 0; i_out_y < output_y; base_idx_y += stride_y, i_out_y++)
            {
                for (int32_t base_idx_x = -pad_x, i_out_x = 0; i_out_x < output_x; base_idx_x += stride_x, i_out_x++)
                {
                    int64_t conv_out_acc = 0;

                    const int32_t start_y_max = (-base_idx_y + dilation_y - 1) / dilation_y;
                    const int32_t ker_y_start = MAX(0, start_y_max);
                    const int32_t start_x_max = (-base_idx_x + dilation_x - 1) / dilation_x;
                    const int32_t ker_x_start = MAX(0, start_x_max);
                    const int32_t end_min_y = (input_y - base_idx_y + dilation_y - 1) / dilation_y;
                    const int32_t ker_y_end = MIN(kernel_y, end_min_y);
                    const int32_t end_min_x = (input_x - base_idx_x + dilation_x - 1) / dilation_x;
                    const int32_t ker_x_end = MIN(kernel_x, end_min_x);

                    for (int32_t i_ker_y = ker_y_start; i_ker_y < ker_y_end; i_ker_y++)
                    {
                        for (int32_t i_ker_x = ker_x_start; i_ker_x < ker_x_end; i_ker_x++)
                        {
                            const int32_t in_row = base_idx_y + dilation_y * i_ker_y;
                            const int32_t in_col = base_idx_x + dilation_x * i_ker_x;

                            for (int32_t i_input_ch = 0; i_input_ch < input_ch; i_input_ch++)
                            {
                                conv_out_acc += input_data[(in_row * input_x + in_col) * input_ch + i_input_ch] *
                                    filter_data[i_out_ch * input_ch * kernel_y * kernel_x +
                                                (i_ker_y * kernel_x + i_ker_x) * input_ch + i_input_ch];
                            }
                        }
                    }

                    if (bias_data)
                    {
                        const int64_t *bias_s64 = (const int64_t *)bias_data->data;
                        const int32_t *bias_s32 = (const int32_t *)bias_data->data;
                        const bool is_int32_bias = bias_data->is_int32_bias;
                        
                        int64_t bias;
                        if (is_int32_bias)
                        {
                            bias = (int64_t)bias_s32[i_out_ch];

                        }
                        else
                        {
                        
                           bias = (int64_t)bias_s64[i_out_ch];
                        }

                        
                        conv_out_acc += bias;
                    }

                    int32_t conv_out =
                        muriscv_nn_requantize_s64(conv_out_acc, reduced_multiplier, output_shift[i_out_ch]);
                    conv_out = MAX(conv_out, out_activation_min);
                    conv_out = MIN(conv_out, out_activation_max);
                    output_data[i_out_ch + (i_out_y * output_x + i_out_x) * output_ch] = (int16_t)conv_out;
                }
            }
        }
        /* Advance to the next batch */
        input_data += (input_x * input_y * input_ch);
        output_data += (output_x * output_y * output_ch);
    }

    /* Return to application */
    return MURISCV_NN_SUCCESS;
}
/**
 * @} end of NNConv group
 */
