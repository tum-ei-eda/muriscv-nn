// Modifications copyright (C) 2024 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2023-2024 Arm Limited and/or its affiliates <open-source-office@arm.com>
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
 */

/* ----------------------------------------------------------------------
 * Project:      MURISCV NN Library
 * Title:        muriscv_nn_convolve_get_buffer_sizes_s4.c
 * Description:  Collection of get buffer size functions for the various s4 convolution layer functions.
 *
 * $Date:        10 April 2024
 * $Revision:    V.1.1.0
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */

#include "Internal/muriscv_nn_compiler.h"
#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup NNConv
 */

/**
 * @addtogroup GetBufferSizeNNConv
 * @{
 */

__STATIC_INLINE int32_t muriscv_nn_convolve_s4_get_buffer_size_mve(const muriscv_nn_dims *input_dims,
                                                            const muriscv_nn_dims *filter_dims)
{
    int32_t col_length = input_dims->c * filter_dims->w * filter_dims->h;
    // Get number of complete lanes with int8 elements (multiple of 16) for given col_length. This is dependent on
    // implementation of muriscv_nn_mat_mult_nt_t_s4
    col_length = (col_length + 15) / 16;
    // 4 -> number of im2col buffers, 16 -> 16 elements per Q register
    return 4 * col_length * 16 * (int32_t)sizeof(int8_t);
}

__STATIC_INLINE int32_t muriscv_nn_convolve_1_x_n_s4_get_buffer_size_mve(const muriscv_nn_conv_params *conv_params,
                                                                  const muriscv_nn_dims *input_dims,
                                                                  const muriscv_nn_dims *filter_dims,
                                                                  const muriscv_nn_dims *output_dims)
{
    const int32_t input_x = input_dims->w;
    const int32_t pad_x = conv_params->padding.w;
    const int32_t kernel_x = filter_dims->w;
    const int32_t output_x = output_dims->w;
    const int32_t stride_x = conv_params->stride.w;
    const int32_t total_pad = ((output_x - 1) * stride_x + kernel_x - input_x);
    const int32_t asym_pad = total_pad % 2;

    const int32_t right_pad_num = pad_x + asym_pad != 0 ? MAX(1, (pad_x + asym_pad + stride_x - 1) / stride_x) : 0;
    const int32_t left_pad_num = pad_x != 0 ? MAX(1, (pad_x + stride_x - 1) / stride_x) : 0;
    const int32_t no_pad_num = MAX(output_x - (right_pad_num + left_pad_num), 0);

    if (right_pad_num + no_pad_num + left_pad_num != output_x)
    {
        return muriscv_nn_convolve_s4_get_buffer_size_mve(input_dims, filter_dims);
    }

    return 0;
}

int32_t muriscv_nn_convolve_s4_get_buffer_size(const muriscv_nn_dims *input_dims, const muriscv_nn_dims *filter_dims)
{
    const int32_t rhs_cols = filter_dims->w * filter_dims->h * input_dims->c;
    return (2 * rhs_cols) * (int32_t)sizeof(int16_t);
}

int32_t muriscv_nn_convolve_1_x_n_s4_get_buffer_size(const muriscv_nn_conv_params *conv_params,
                                              const muriscv_nn_dims *input_dims,
                                              const muriscv_nn_dims *filter_dims,
                                              const muriscv_nn_dims *output_dims)
{
//#if !defined(USE_VEXT)
    (void)conv_params;
    (void)output_dims;

    return muriscv_nn_convolve_s4_get_buffer_size(input_dims, filter_dims);
//#else
//    return muriscv_nn_convolve_1_x_n_s4_get_buffer_size_mve(conv_params, input_dims, filter_dims, output_dims);
//#endif
}

int32_t muriscv_nn_convolve_1x1_s4_fast_get_buffer_size(const muriscv_nn_dims *input_dims)
{
    (void)input_dims;
    return 0;
}

/*
 * Get the required buffer size for muriscv_nn_convolve_wrapper_s4. This is the
 * recommended convolve wrapper s4 function.
 *
 * Refer to header file for details.
 *
 */
int32_t muriscv_nn_convolve_wrapper_s4_get_buffer_size(const muriscv_nn_conv_params *conv_params,
                                                const muriscv_nn_dims *input_dims,
                                                const muriscv_nn_dims *filter_dims,
                                                const muriscv_nn_dims *output_dims)
{
//#if defined(USE_VEXT)
//    return muriscv_nn_convolve_wrapper_s8_get_buffer_size_mve(conv_params, input_dims, filter_dims, output_dims);
//#else
    (void)output_dims;
    if ((conv_params->padding.w == 0) && (conv_params->padding.h == 0) && (filter_dims->w == 1) &&
        (filter_dims->h == 1) && (conv_params->dilation.w == 1 && conv_params->dilation.h == 1))
    {
        if ((conv_params->stride.w == 1) && (conv_params->stride.h == 1))
        {
            return muriscv_nn_convolve_1x1_s4_fast_get_buffer_size(input_dims);
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return muriscv_nn_convolve_s4_get_buffer_size(input_dims, filter_dims);
    }
//#endif
}

int32_t muriscv_nn_convolve_wrapper_s4_get_buffer_size_mve(const muriscv_nn_conv_params *conv_params,
                                                    const muriscv_nn_dims *input_dims,
                                                    const muriscv_nn_dims *filter_dims,
                                                    const muriscv_nn_dims *output_dims)

{
    (void)output_dims;
    if ((conv_params->padding.w == 0) && (conv_params->padding.h == 0) && (filter_dims->w == 1) &&
        (filter_dims->h == 1) && (conv_params->dilation.w == 1 && conv_params->dilation.h == 1))
    {
        if ((conv_params->stride.w == 1) && (conv_params->stride.h == 1))
        {
            return muriscv_nn_convolve_1x1_s4_fast_get_buffer_size(input_dims);
        }
        else
        {
            return 0;
        }
    }
    else if ((input_dims->h == 1) && (conv_params->dilation.w == 1) && (filter_dims->h == 1) &&
             (conv_params->stride.w * input_dims->c % 4 == 0))
    {
        return muriscv_nn_convolve_1_x_n_s4_get_buffer_size_mve(conv_params, input_dims, filter_dims, output_dims);
    }
    else
    {
        return muriscv_nn_convolve_s4_get_buffer_size_mve(input_dims, filter_dims);
    }
}

int32_t muriscv_nn_convolve_wrapper_s4_get_buffer_size_dsp(const muriscv_nn_conv_params *conv_params,
                                                    const muriscv_nn_dims *input_dims,
                                                    const muriscv_nn_dims *filter_dims,
                                                    const muriscv_nn_dims *output_dims)
{
    return muriscv_nn_convolve_wrapper_s4_get_buffer_size(conv_params, input_dims, filter_dims, output_dims);
}
/**
 * @} end of GetBufferSizeNNConv group
 */
