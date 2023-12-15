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
 * Title:        muriscv_nn_depthwise_conv_wrapper_s4.c
 * Description:  Wrapper API to select appropriate depthwise conv s4 API based
 *               on dimensions.
 *
 * $Date:        30 October 2023
 * $Revision:    V.1.0.0
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_functions.h"

/**
 *  @ingroup Public
 */

/**
 * @addtogroup NNConv
 * @{
 */

/*
 *  s4 Depthwise conv wrapper function
 *
 *  Refer header file for details.
 *
 */
muriscv_nn_status muriscv_nn_depthwise_conv_wrapper_s4(const muriscv_nn_context *ctx,
                                                  const muriscv_nn_dw_conv_params *dw_conv_params,
                                                  const muriscv_nn_per_channel_quant_params *quant_params,
                                                  const muriscv_nn_dims *input_dims,
                                                  const int8_t *input,
                                                  const muriscv_nn_dims *filter_dims,
                                                  const int8_t *filter,
                                                  const muriscv_nn_dims *bias_dims,
                                                  const int32_t *bias,
                                                  const muriscv_nn_dims *output_dims,
                                                  int8_t *output)
{
    muriscv_nn_status status = MURISCV_NN_SUCCESS;
    if (1 == dw_conv_params->ch_mult && input_dims->n == 1 && dw_conv_params->dilation.w == 1 &&
        dw_conv_params->dilation.h == 1)
    {
        status = muriscv_nn_depthwise_conv_s4_opt(ctx,
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
    else
    {
        status = muriscv_nn_depthwise_conv_s4(ctx,
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

/**
 * @} end of NNConv group
 */
