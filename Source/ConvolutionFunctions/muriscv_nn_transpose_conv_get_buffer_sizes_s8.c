/*
 * SPDX-FileCopyrightText: Copyright 2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
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
 * Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
 */

//#include "Internal/arm_nn_compiler.h"?
#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup NNConv
 */

/**
 * @addtogroup GetBufferSizeNNConv
 * @{
 */

/*
 * Get the required buffer size for arm_transpose_conv_s8. This is the recommended transpose conv s8 get buffer size
 * function.
 *
 * Refer to header file for details.
 *
 */
int32_t muriscv_nn_transpose_conv_s8_get_buffer_size(const muriscv_nn_transpose_conv_params *transpose_conv_params,
                                                     const muriscv_nn_dims *input_dims,
                                                     const muriscv_nn_dims *filter_dims,
                                                     const muriscv_nn_dims *out_dims)
{
    // TODO: optimzied variants
    const int32_t size =
        filter_dims->w * filter_dims->h * input_dims->w * input_dims->h * out_dims->c * sizeof(int32_t);
    return size;
}

int32_t muriscv_nn_transpose_conv_s8_get_buffer_size_dsp(const muriscv_nn_transpose_conv_params *transpose_conv_params,
                                                         const muriscv_nn_dims *input_dims,
                                                         const muriscv_nn_dims *filter_dims,
                                                         const muriscv_nn_dims *output_dims)
{
    return muriscv_nn_transpose_conv_s8_get_buffer_size(transpose_conv_params, input_dims, filter_dims, output_dims);
}

int32_t muriscv_nn_transpose_conv_s8_get_buffer_size_mve(const muriscv_nn_transpose_conv_params *transpose_conv_params,
                                                         const muriscv_nn_dims *input_dims,
                                                         const muriscv_nn_dims *filter_dims,
                                                         const muriscv_nn_dims *output_dims)
{
    return muriscv_nn_transpose_conv_s8_get_buffer_size(transpose_conv_params, input_dims, filter_dims, output_dims);
}

int32_t arm_transpose_conv_s8_get_reverse_conv_buffer_size(const muriscv_nn_transpose_conv_params *transpose_conv_params,
                                                           const muriscv_nn_dims *input_dims,
                                                           const muriscv_nn_dims *filter_dims)
{
    const bool reverse_conv_possible =
        ((transpose_conv_params->stride.w <= 2) && (transpose_conv_params->stride.h <= 2));
    const bool reverse_conv_efficient = (input_dims->c > REVERSE_TCOL_EFFICIENT_THRESHOLD);

    if (reverse_conv_possible && reverse_conv_efficient)
    {
        return input_dims->c * filter_dims->w * filter_dims->h * filter_dims->n;
    }
    else
    {
        return 0;
    }
}


/**
 * @} end of GetBufferSizeNNConv group
 */
