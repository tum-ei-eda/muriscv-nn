// Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
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
 */

/* ----------------------------------------------------------------------
 * Project:      CMSIS NN Library
 * Title:        muriscv_nn_depthwise_conv_get_buffer_sizes_s8.c
 * Description:  Collection of get buffer size functions for the various s8 convolution layer functions.
 *
 * $Date:        30 October 2023
 * $Revision:    V.1.1.0
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup NNConv
 */

/**
 * @addtogroup GetBufferSizeNNConv
 * @{
 */

int32_t muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_mve(const muriscv_nn_dims *input_dims,
                                                             const muriscv_nn_dims *filter_dims)
{
    (void)input_dims;
    return (4 * CH_IN_BLOCK_MVE * filter_dims->w * filter_dims->h) * (int32_t)sizeof(int8_t);
}

int32_t muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_dsp(const muriscv_nn_dims *input_dims,
                                                             const muriscv_nn_dims *filter_dims)
{
    return (input_dims->c * filter_dims->w * filter_dims->h) * sizeof(int16_t);
}

int32_t muriscv_nn_depthwise_conv_s8_opt_get_buffer_size(const muriscv_nn_dims *input_dims,
                                                         const muriscv_nn_dims *filter_dims)
{
#if defined(USE_VEXT) || defined(USE_PORTABLE_VEXT)
    return muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_mve(input_dims, filter_dims);
#elif defined(USE_PEXT)
    return muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_dsp(input_dims, filter_dims);
#else
    (void)input_dims;
    (void)filter_dims;
    return 0;
#endif
}

int32_t muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                             const muriscv_nn_dims *input_dims,
                                                             const muriscv_nn_dims *filter_dims,
                                                             const muriscv_nn_dims *output_dims)
{
    int32_t size = 0;

    if (input_dims->c == output_dims->c && input_dims->n == 1 && dw_conv_params->dilation.w == 1 &&
        dw_conv_params->dilation.h == 1)
    {
#if !defined(USE_VEXT) && !defined(USE_PORTABLE_VEXT)
        if (filter_dims->w == 3 && filter_dims->h == 3 && dw_conv_params->padding.h <= 1 &&
            dw_conv_params->padding.w <= 1)
        {
            return size;
        }
#endif
        size = muriscv_nn_depthwise_conv_s8_opt_get_buffer_size(input_dims, filter_dims);
    }

    return size;
}

int32_t muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size_dsp(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                                 const muriscv_nn_dims *input_dims,
                                                                 const muriscv_nn_dims *filter_dims,
                                                                 const muriscv_nn_dims *output_dims)
{
    int32_t size = 0;

    if (input_dims->c == output_dims->c && input_dims->n == 1 && dw_conv_params->dilation.w == 1 &&
        dw_conv_params->dilation.h == 1)
    {
        if (filter_dims->w == 3 && filter_dims->h == 3 && dw_conv_params->padding.h <= 1 &&
            dw_conv_params->padding.w <= 1)
        {
            return size;
        }
        size = muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_dsp(input_dims, filter_dims);
    }

    return size;
}

int32_t muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size_mve(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                                 const muriscv_nn_dims *input_dims,
                                                                 const muriscv_nn_dims *filter_dims,
                                                                 const muriscv_nn_dims *output_dims)
{
    int32_t size = 0;

    if (input_dims->c == output_dims->c && input_dims->n == 1 && dw_conv_params->dilation.w == 1 &&
        dw_conv_params->dilation.h == 1)
    {
        size = muriscv_nn_depthwise_conv_s8_opt_get_buffer_size_mve(input_dims, filter_dims);
    }

    return size;
}

/**
 * @} end of GetBufferSizeNNConv group
 */
