// Modifications copyright (C) 2024 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2024 Arm Limited and/or its affiliates <open-source-office.com>
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
 * Title:        muriscv_nn_lstm_step_s16.c
 * Description:  Update LSTM function for a single iteration step.
 *
 * $Date:        26 March 2024
 * $Revision:    V.1.0.0
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */
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
 * Calculate the output state tensor of an LSTM step, s16 input/output/weights and s16 internal buffers version.
 * Refer to header file for details.
 */
muriscv_nn_status muriscv_nn_lstm_step_s16(const int16_t *data_in,
                                         const int16_t *hidden_in,
                                         int16_t *hidden_out,
                                         const muriscv_nn_lstm_params *params,
                                         muriscv_nn_lstm_context *buffers,
                                         const int32_t batch_offset)
{
    int16_t *forget_gate = buffers->temp1;
    int16_t *input_gate = buffers->temp1;
    int16_t *cell_gate = buffers->temp2;
    int16_t *output_gate = buffers->temp1;
    int16_t *hidden_temp = buffers->temp2;

    int16_t *cell_state = buffers->cell_state;

    muriscv_nn_lstm_calculate_gate_s16(data_in, hidden_in, &params->forget_gate, params, forget_gate, batch_offset);

    // Calculate first term of cell state in place early to maximise reuse of scratch-buffers
    muriscv_nn_elementwise_mul_s16(forget_gate,
                            cell_state,
                            0,
                            0,
                            cell_state,
                            0,
                            params->forget_to_cell_multiplier,
                            params->forget_to_cell_shift,
                            NN_Q15_MIN,
                            NN_Q15_MAX,
                            params->hidden_size * params->batch_size);

    muriscv_nn_lstm_calculate_gate_s16(data_in, hidden_in, &params->input_gate, params, input_gate, batch_offset);

    muriscv_nn_lstm_calculate_gate_s16(data_in, hidden_in, &params->cell_gate, params, cell_gate, batch_offset);

    // Reminder of cell state calculation, multiply and add to previous result.
    muriscv_nn_elementwise_mul_acc_s16(forget_gate,
                                cell_gate,
                                0,
                                0,
                                cell_state,
                                0,
                                params->input_to_cell_multiplier,
                                params->input_to_cell_shift,
                                -params->cell_clip,
                                params->cell_clip,
                                params->hidden_size * params->batch_size);

    muriscv_nn_lstm_calculate_gate_s16(data_in, hidden_in, &params->output_gate, params, output_gate, batch_offset);

    // Calculate hidden state directly to output.
    muriscv_nn_activation_s16(
        cell_state, hidden_temp, params->hidden_size * params->batch_size, params->cell_scale_power + 12, ARM_TANH);
    muriscv_nn_elementwise_mul_s16_batch_offset(output_gate,
                                         hidden_temp,
                                         hidden_out,
                                         params->output_offset,
                                         params->output_multiplier,
                                         params->output_shift,
                                         params->hidden_size,
                                         params->batch_size,
                                         batch_offset);

    return MURISCV_NN_SUCCESS;
}
/**
 * @} end of supportLSTM group
 */
