/*
 * Copyright (C) 2021-2023 Chair of Electronic Design Automation, TUM
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
 */

#ifndef _ARM_NN_TYPES_H
#define _ARM_NN_TYPES_H

#include "muriscv_nn_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define cmsis_nn_tile muriscv_nn_tile
#define cmsis_nn_context muriscv_nn_context
#define cmsis_nn_dims muriscv_nn_dims
#define cmsis_nn_bias_data muriscv_nn_bias_data
#define cmsis_nn_per_channel_quant_params muriscv_nn_per_channel_quant_params
#define cmsis_nn_per_tensor_quant_params muriscv_nn_per_tensor_quant_params
#define cmsis_nn_quant_params muriscv_nn_quant_params
#define cmsis_nn_activation muriscv_nn_activation
#define cmsis_nn_conv_params muriscv_nn_conv_params
#define cmsis_nn_dw_conv_params muriscv_nn_dw_conv_params
#define cmsis_nn_pool_params muriscv_nn_pool_params
#define cmsis_nn_fc_params muriscv_nn_fc_params
#define cmsis_nn_svdf_params muriscv_nn_svdf_params
#define cmsis_nn_softmax_lut_s16 muriscv_nn_softmax_lut_s16
#define cmsis_nn_bmm_params muriscv_nn_bmm_params

#define cmsis_nn_lstm_params muriscv_nn_lstm_params
#define cmsis_nn_lstm_context muriscv_nn_lstm_context
#define cmsis_nn_lstm_dims muriscv_nn_lstm_dims

#define cmsis_nn_transpose_conv_params muriscv_nn_transpose_conv_params

#define cmsis_nn_lstm_gate muriscv_nn_lstm_gate

#define ARM_SIGMOID MURISCV_SIGMOID
#define ARM_TANH MURISCV_TANH



#ifdef __cplusplus
}
#endif

#endif /* _ARM_NN_TYPES_H */
