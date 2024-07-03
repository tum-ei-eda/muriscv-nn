// Modifications copyright (C) 2024 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2022, 2024 Arm Limited and/or its affiliates <open-source-office.com>
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
 * Title:        muriscv_nn_lstm_calculate_gate_s16.c
 * Description:  Update single gate for an incremental step of LSTM function.
 *
 * $Date:        26 March 2024
 * $Revision:    V.1.0.0
 *
 * Target Processor:  Cortex-M cores
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_tables.h"
#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"
/**
 * @ingroup groupSupport
 */

/**
 * @addtogroup supportLSTM
 * @{
 */

/*
 * Calculates a single LSTM gate, int16x8_16 version.
 * Refer to header file for details
 */
muriscv_nn_status muriscv_nn_lstm_calculate_gate_s16(const int16_t *data_in,
                                                   const int16_t *hidden_in,
                                                   const muriscv_nn_lstm_gate *gate,
                                                   const muriscv_nn_lstm_params *params,
                                                   int16_t *output,
                                                   const int32_t batch_offset)
{

    memset(output, 0, params->hidden_size * params->batch_size * sizeof(int16_t));

    muriscv_nn_vec_mat_mul_result_acc_s16(data_in,
                                      gate->input_weights,
                                      gate->input_effective_bias,
                                      output,
                                      gate->input_multiplier,
                                      gate->input_shift,
                                      params->input_size,
                                      params->hidden_size,
                                      params->batch_size,
                                      batch_offset);

    if (hidden_in)
    {

        muriscv_nn_vec_mat_mul_result_acc_s16(hidden_in,
                                          gate->hidden_weights,
                                          gate->hidden_effective_bias,
                                          output,
                                          gate->hidden_multiplier,
                                          gate->hidden_shift,
                                          params->hidden_size,
                                          params->hidden_size,
                                          params->batch_size,
                                          batch_offset);
    }

    muriscv_nn_activation_s16(output, output, params->hidden_size * params->batch_size, 0, gate->activation_type);

    return MURISCV_NN_SUCCESS;
}
/**
 * @} end of supportLSTM group
 */