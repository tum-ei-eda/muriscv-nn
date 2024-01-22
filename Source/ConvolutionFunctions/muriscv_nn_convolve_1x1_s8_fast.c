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

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup NNConv
 * @{
 */

/*
 * Fast s8 version for 1x1 convolution (non-square shape)
 *
 * Refer header file for details.
 *
 * Used by muriscv_nn_convolve_wrapper_s8()
 *
 */

muriscv_nn_status muriscv_nn_convolve_1x1_s8_fast(const muriscv_nn_context *ctx,
                                                  const muriscv_nn_conv_params *conv_params,
                                                  const muriscv_nn_per_channel_quant_params *quant_params,
                                                  const muriscv_nn_dims *input_dims,
                                                  const q7_t *input_data,
                                                  const muriscv_nn_dims *filter_dims,
                                                  const q7_t *filter_data,
                                                  const muriscv_nn_dims *bias_dims,
                                                  const int32_t *bias_data,
                                                  const muriscv_nn_dims *output_dims,
                                                  q7_t *output_data)
{
    if (input_dims->c % 4 != 0 || conv_params->padding.w != 0 || conv_params->padding.h != 0 ||
        conv_params->stride.w != 1 || conv_params->stride.h != 1)
    {
        return MURISCV_NN_ARG_ERROR;
    }

    (void)ctx;
    (void)filter_dims;
    (void)bias_dims;

#if defined(USE_VEXT)

    const int32_t col_len = input_dims->w * input_dims->h * input_dims->n;
    const int32_t output_ch = output_dims->c;
    const int32_t input_ch = input_dims->c;
    const int32_t input_offset = conv_params->input_offset;
    const int32_t out_offset = conv_params->output_offset;
    const int32_t out_activation_min = conv_params->activation.min;
    const int32_t out_activation_max = conv_params->activation.max;
    int32_t *output_mult = quant_params->multiplier;
    int32_t *output_shift = quant_params->shift;

    for (int i_items = 0; i_items <= (col_len - 4); i_items += 4)
    {

        output_data = muriscv_nn_mat_mul_core_4x_s8(input_ch,
                                                    input_ch,
                                                    input_data + i_items * input_ch,
                                                    filter_data,
                                                    output_ch,
                                                    conv_params,
                                                    quant_params,
                                                    bias_data,
                                                    output_data);
    }

    /* Handle left over elements */
    for (int i_items = (col_len & ~0x3); i_items < col_len; i_items++)
    {
        for (int i_out_ch = 0; i_out_ch < output_ch; i_out_ch++)
        {
            int32_t sum_row = 0;
            int32_t acc;
            (void)muriscv_nn_mat_mul_core_1x_s8(
                input_ch, input_data + i_items * input_ch, filter_data + i_out_ch * input_ch, &sum_row, &acc);
            if (bias_data)
            {
                acc += bias_data[i_out_ch];
            }
            sum_row = (sum_row * input_offset);
            acc += sum_row;
            acc = muriscv_nn_requantize(acc, output_mult[i_out_ch], output_shift[i_out_ch]);
            acc += out_offset;

            acc = MAX(acc, out_activation_min);
            acc = MIN(acc, out_activation_max);
            *output_data++ = acc;
        }
    }

#else

    /* Run the following code as reference implementation for Cortex-M processors with or without DSP extension */
    const int32_t lhs_rows = input_dims->w * input_dims->h * input_dims->n;
    const int32_t rhs_rows = output_dims->c;
    const int32_t rhs_cols = input_dims->c;

    muriscv_nn_mat_mult_nt_t_s8(input_data,
                                filter_data,
                                bias_data,
                                output_data,
                                quant_params->multiplier,
                                quant_params->shift,
                                lhs_rows,
                                rhs_rows,
                                rhs_cols,
                                conv_params->input_offset,
                                conv_params->output_offset,
                                conv_params->activation.min,
                                conv_params->activation.max,
                                0, //TODO: row_address_offset, CMSIS uses for vector acceleration
                                0);//Need to properly use this new feature

#endif

    /* Return to application */
    return MURISCV_NN_SUCCESS;
}
/*
int32_t muriscv_nn_convolve_1x1_s8_fast_get_buffer_size(const muriscv_nn_dims *input_dims)
{
    (void)input_dims;
    return 0;
}*/

/**
 * @} end of NNConv group
 */
