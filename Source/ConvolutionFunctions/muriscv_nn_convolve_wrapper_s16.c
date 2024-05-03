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
 * Convolution layer
 *
 * Refer header file for details.
 *
 */

muriscv_nn_status muriscv_nn_convolve_wrapper_s16(const muriscv_nn_context *ctx,
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
    // TODO(fabianpedd): Include special cases

    // TODO(fabianpedd): Check special case include logic here

    // #if defined(USE_PEXT) && !defined(USE_VEXT)
    //     if (filter_dims->w * filter_dims->h * input_dims->c < 512 &&
    //         (conv_params->dilation.w == 1 && conv_params->dilation.h == 1))
    //     {
    //         return muriscv_nn_convolve_fast_s16(ctx,
    //                                          conv_params,
    //                                          quant_params,
    //                                          input_dims,
    //                                          input_data,
    //                                          filter_dims,
    //                                          filter_data,
    //                                          bias_dims,
    //                                          bias_data,
    //                                          output_dims,
    //                                          output_data);
    //     }
    //     else
    //     {
    //         return muriscv_nn_convolve_s16(ctx,
    //                                     conv_params,
    //                                     quant_params,
    //                                     input_dims,
    //                                     input_data,
    //                                     filter_dims,
    //                                     filter_data,
    //                                     bias_dims,
    //                                     bias_data,
    //                                     output_dims,
    //                                     output_data);
    //     }
    // #else
    return muriscv_nn_convolve_s16(ctx,
                                   conv_params,
                                   quant_params,
                                   input_dims,
                                   input_data,
                                   filter_dims,
                                   filter_data,
                                   bias_dims,
                                   bias_data,
                                   output_dims,
                                   output_data);
    // #endif
}

/**
 * @} end of NNConv group
 */
