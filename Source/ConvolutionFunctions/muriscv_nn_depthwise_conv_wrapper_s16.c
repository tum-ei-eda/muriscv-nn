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

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup NNConv
 * @{
 */

/*
 *  s16 Depthwise conv wrapper function
 *
 *  Refer header file for details.
 *
 */
muriscv_nn_status muriscv_nn_depthwise_conv_wrapper_s16(const muriscv_nn_context *ctx,
                                                        const muriscv_nn_dw_conv_params *dw_conv_params,
                                                        const muriscv_nn_per_channel_quant_params *quant_params,
                                                        const muriscv_nn_dims *input_dims,
                                                        const q15_t *input,
                                                        const muriscv_nn_dims *filter_dims,
                                                        const q7_t *filter,
                                                        const muriscv_nn_dims *bias_dims,
                                                        const int64_t *bias,
                                                        const muriscv_nn_dims *output_dims,
                                                        q15_t *output)
{
    // TODO(fabianpedd): Implement optimized variants calling
    // muriscv_nn_depthwise_conv_fast_s16()

    muriscv_nn_status status = MURISCV_NN_SUCCESS;

    // if (dw_conv_params->ch_mult == 1 && dw_conv_params->dilation.w == 1 && dw_conv_params->dilation.h == 1 &&
    //     filter_dims->w * filter_dims->h * input_dims->c < 512)
    // {
    //     status = muriscv_nn_depthwise_conv_fast_s16(ctx,
    //                                          dw_conv_params,
    //                                          quant_params,
    //                                          input_dims,
    //                                          input,
    //                                          filter_dims,
    //                                          filter,
    //                                          bias_dims,
    //                                          bias,
    //                                          output_dims,
    //                                          output);
    // }
    // else
    {
        status = muriscv_nn_depthwise_conv_s16(ctx,
                                               dw_conv_params,
                                               quant_params,
                                               input_dims,
                                               input,
                                               filter_dims,
                                               filter,
                                               bias_dims,
                                               bias,
                                               output_dims,
                                               output);
    }

    /* Return to application */
    return status;
}

int32_t muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(const muriscv_nn_dw_conv_params *dw_conv_params,
                                                              const muriscv_nn_dims *input_dims,
                                                              const muriscv_nn_dims *filter_dims,
                                                              const muriscv_nn_dims *output_dims)
{
    (void)dw_conv_params;
    (void)input_dims;
    (void)filter_dims;
    (void)output_dims;
    int32_t size = 0;

    // TODO(fabianpedd): Uncomment when implementing above

    // if (dw_conv_params->ch_mult == 1 && dw_conv_params->dilation.w == 1 && dw_conv_params->dilation.h == 1 &&
    //     filter_dims->w * filter_dims->h * input_dims->c < 512)
    // {
    //     size = muriscv_nn_depthwise_conv_fast_s16_get_buffer_size(input_dims, filter_dims);
    // }

    return size;
}

/**
 * @} end of NNConv group
 */
