/*
 * SPDX-FileCopyrightText: Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-office.com>
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
 * Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
 */

/* ----------------------------------------------------------------------
 * Project:      MURISCV NN Library
 * Title:        muriscv_nn_lstm_update_cell_state_s16.c
 * Description:  Update cell state for an incremental step of LSTM function.
 *
 * $Date:        20 March 2023
 * $Revision:    V.1.2.0
 *
 * Target :  RISCV Architecture
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_support_functions.h"
/**
 * @ingroup groupSupport
 */

/**
 * @addtogroup supportLSTM
 * @{
 */

/*
 * Update cell state for a single LSTM iteration step, int8x8_16 version.
 *
 * Refer to header file for more details
 */
void muriscv_nn_lstm_update_cell_state_s16(const int32_t n_block,
                                       const int32_t cell_state_scale,
                                       int16_t *cell_state,
                                       const int16_t *input_gate,
                                       const int16_t *forget_gate,
                                       const int16_t *cell_gate)
{
    const int32_t cell_scale = 30 + cell_state_scale;
    int32_t loop_count = n_block;
/*
#if defined(USE_VEXT)

    while (loop_count > 0)
    {
        mve_pred16_t p = vctp32q(loop_count);
        loop_count -= 4;

        int32x4_t res_1 = vmulq_s32(vldrhq_z_s32(cell_state, p), vldrhq_z_s32(forget_gate, p));
        forget_gate += 4;
        res_1 = muriscv_divide_by_power_of_two_mve(res_1, 15);
        int32x4_t res_2 = vmulq_s32(vldrhq_z_s32(input_gate, p), vldrhq_z_s32(cell_gate, p));
        input_gate += 4;
        cell_gate += 4;

        res_2 = muriscv_divide_by_power_of_two_mve(res_2, cell_scale);
        res_1 += res_2;

        res_1 = vmaxq_s32(res_1, vdupq_n_s32(Q15_MIN));
        res_1 = vminq_s32(res_1, vdupq_n_s32(Q15_MAX));

        vstrhq_p_s32(cell_state, res_1, p);
        cell_state += 4;
    }
#else
    #if defined(USE_PEXT)
    while (loop_count > 1)
    {
        int32_t cell_state_01 = muriscv_nn_read_s16x2(cell_state);
        int32_t forget_gate_01 = muriscv_nn_read_q15x2_ia_fast(&forget_gate);

        int32_t value_00 = SMULBB(cell_state_01, forget_gate_01);
        int32_t value_01 = SMULTT(cell_state_01, forget_gate_01);
        value_00 = muriscv_nn_divide_by_power_of_two(value_00, 15);
        value_01 = muriscv_nn_divide_by_power_of_two(value_01, 15);

        int32_t input_gate_01 = muriscv_nn_read_q15x2_ia_fast(&input_gate);
        int32_t cell_gate_01 = muriscv_nn_read_q15x2_ia_fast(&cell_gate);

        int32_t value_10 = SMULBB(input_gate_01, cell_gate_01);
        int32_t value_11 = SMULTT(input_gate_01, cell_gate_01);

        value_10 = muriscv_nn_divide_by_power_of_two(value_10, cell_scale);
        value_11 = muriscv_nn_divide_by_power_of_two(value_11, cell_scale);

        value_00 += value_10;
        value_01 += value_11;

        value_00 = CLAMP(value_00, Q15_MAX, Q15_MIN);
        value_01 = CLAMP(value_01, Q15_MAX, Q15_MIN);

        muriscv_nn_write_q15x2_ia(&cell_state, PACK_Q15x2_32x1(value_00, value_01));
        loop_count -= 2;
    }
    #endif
    */
    for (int i = 0; i < loop_count; i++)
    {
        int32_t value = cell_state[i] * forget_gate[i];
        int32_t value_1 = input_gate[i] * cell_gate[i];

        value = muriscv_nn_divide_by_power_of_two(value, 15);
        value_1 = muriscv_nn_divide_by_power_of_two(value_1, cell_scale);

        cell_state[i] = CLAMP(value + value_1, Q15_MAX, Q15_MIN);
    }
    /*
#endif // #if defined(USE_VEXT)*/
}


/**
 * @} end of supportLSTM group
 */
