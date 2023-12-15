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
 * Title:        muriscv_nn_depthwise_conv_get_buffer_sizes_s16.c
 * Description:  Collection of get buffer size functions for the various s16 convolution layer functions.
 *
 * $Date:        13 January 2023
 * $Revision:    V.1.0.0
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup NNconv
 */

/**
 * @addtogroup GetBufferSizeNNConv
 * @{
 */
__STATIC_INLINE int32_t muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_mve(const muriscv_nn_dims *input_dims,
                                                                        const muriscv_nn_dims *filter_dims)
{
    /* The + 8 accounts for a worst case out of bounds read of the lhs buffers in the *_nt_t_* function.  */
    return 4 * input_dims->c * filter_dims->w * filter_dims->h * sizeof(int16_t) + 8;
}

__STATIC_INLINE int32_t muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_dsp(const muriscv_nn_dims *input_dims,
                                                                        const muriscv_nn_dims *filter_dims)
{
    return input_dims->c * filter_dims->w * filter_dims->h * sizeof(int16_t);
}

int32_t muriscv_nn_depthwise_conv_fast_s16_get_buffer_size(const muriscv_nn_dims *input_dims, const muriscv_nn_dims *filter_dims)
{
//#if defined(USE_PEXT)
//    #if defined(USE_VEXT)
//    return muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_mve(input_dims, filter_dims);
//    #else // USE_PEXT
    return muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_dsp(input_dims, filter_dims);
//    #endif
//#else
//    (void)input_dims;
//    (void)filter_dims;
//    return 0;
//#endif
}

int32_t muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                       const muriscv_nn_dims *input_dims,
                                                       const muriscv_nn_dims *filter_dims,
                                                       const muriscv_nn_dims *output_dims)
{
    (void)output_dims;

    int32_t size = 0;

    if (USE_FAST_DW_CONV_S16_FUNCTION(dw_conv_params, filter_dims, input_dims))
    {
        size = muriscv_nn_depthwise_conv_fast_s16_get_buffer_size(input_dims, filter_dims);
    }

    return size;
}

int32_t muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size_mve(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                           const muriscv_nn_dims *input_dims,
                                                           const muriscv_nn_dims *filter_dims,
                                                           const muriscv_nn_dims *output_dims)
{
    (void)output_dims;

    int32_t size = 0;

    if (USE_FAST_DW_CONV_S16_FUNCTION(dw_conv_params, filter_dims, input_dims))
    {
        size = muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_mve(input_dims, filter_dims);
    }

    return size;
}

int32_t muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size_dsp(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                           const muriscv_nn_dims *input_dims,
                                                           const muriscv_nn_dims *filter_dims,
                                                           const muriscv_nn_dims *output_dims)
{
    (void)output_dims;

    int32_t size = 0;

    if (USE_FAST_DW_CONV_S16_FUNCTION(dw_conv_params, filter_dims, input_dims))
    {
        size = muriscv_nn_depthwise_conv_fast_s16_get_buffer_size_dsp(input_dims, filter_dims);
    }

    return size;
}

/**
 * @} end of GetBufferSizeNNConv group
 */
