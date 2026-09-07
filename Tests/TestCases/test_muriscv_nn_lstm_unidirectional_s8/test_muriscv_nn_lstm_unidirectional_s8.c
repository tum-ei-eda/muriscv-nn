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

#include <muriscv_nn_functions.h>
#include <stdlib.h>
#include <unity.h>

#include "../../TestData/lstm_1/test_data.h"
#include "../../TestData/lstm_2/test_data.h"
#include "../../TestData/lstm_one_time_step/test_data.h"
#include "../../TestData/lstm_stateful_batch_major_multibatch/test_data.h"
#include "../../Utils/validate.h"

void setUp(void) { /* set stuff up here */ }

void tearDown(void) { /* clean stuff up here */ }

// update the buffer size if adding a unit test with larger buffer.
#define LARGEST_BUFFER_SIZE LSTM_1_HIDDEN_SIZE *LSTM_1_BATCH_SIZE *LSTM_1_TIME_STEPS

int8_t buffer1[LARGEST_BUFFER_SIZE];
int8_t buffer2[LARGEST_BUFFER_SIZE];
int8_t buffer3[LARGEST_BUFFER_SIZE];

void lstm_1_muriscv_nn_lstm_unidirectional_s8(void)
{
    int8_t output[LSTM_1_BATCH_SIZE * LSTM_1_TIME_STEPS * LSTM_1_HIDDEN_SIZE] = {0};
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    const int8_t *output_ref = &lstm_1_output[0];
    const int32_t output_ref_size = LSTM_1_BATCH_SIZE * LSTM_1_TIME_STEPS * LSTM_1_HIDDEN_SIZE;

    int32_t input_data_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t forget_data_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t cell_data_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t output_data_kernel_sum[LSTM_1_HIDDEN_SIZE];

    int32_t input_hidden_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t forget_hidden_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t cell_hidden_kernel_sum[LSTM_1_HIDDEN_SIZE];
    int32_t output_hidden_kernel_sum[LSTM_1_HIDDEN_SIZE];

    muriscv_nn_vector_sum_s8(&input_data_kernel_sum[0],
                             LSTM_1_INPUT_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_input_gate_input_weights[0],
                             LSTM_1_INPUT_ZERO_POINT,
                             0,
                             &lstm_1_input_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&forget_data_kernel_sum[0],
                             LSTM_1_INPUT_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_forget_gate_input_weights[0],
                             LSTM_1_INPUT_ZERO_POINT,
                             0,
                             &lstm_1_forget_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&cell_data_kernel_sum[0],
                             LSTM_1_INPUT_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_cell_gate_input_weights[0],
                             LSTM_1_INPUT_ZERO_POINT,
                             0,
                             &lstm_1_cell_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&output_data_kernel_sum[0],
                             LSTM_1_INPUT_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_output_gate_input_weights[0],
                             LSTM_1_INPUT_ZERO_POINT,
                             0,
                             &lstm_1_output_gate_bias[0]);

    muriscv_nn_vector_sum_s8(&input_hidden_kernel_sum[0],
                             LSTM_1_HIDDEN_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_input_gate_hidden_weights[0],
                             -LSTM_1_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&forget_hidden_kernel_sum[0],
                             LSTM_1_HIDDEN_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_forget_gate_hidden_weights[0],
                             -LSTM_1_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&cell_hidden_kernel_sum[0],
                             LSTM_1_HIDDEN_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_cell_gate_hidden_weights[0],
                             -LSTM_1_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&output_hidden_kernel_sum[0],
                             LSTM_1_HIDDEN_SIZE,
                             LSTM_1_HIDDEN_SIZE,
                             &lstm_1_output_gate_hidden_weights[0],
                             -LSTM_1_OUTPUT_ZERO_POINT,
                             0,
                             NULL);

    // INPUT GATE
    const muriscv_nn_lstm_gate gate_input = {LSTM_1_INPUT_GATE_INPUT_MULTIPLIER,
                                             LSTM_1_INPUT_GATE_INPUT_SHIFT,
                                             &lstm_1_input_gate_input_weights[0],
                                             &input_data_kernel_sum[0],
                                             LSTM_1_INPUT_GATE_HIDDEN_MULTIPLIER,
                                             LSTM_1_INPUT_GATE_HIDDEN_SHIFT,
                                             &lstm_1_input_gate_hidden_weights[0],
                                             &input_hidden_kernel_sum[0],
                                             &lstm_1_input_gate_bias[0],
                                             MURISCV_SIGMOID};

    // FORGET GATE
    const muriscv_nn_lstm_gate gate_forget = {LSTM_1_FORGET_GATE_INPUT_MULTIPLIER,
                                              LSTM_1_FORGET_GATE_INPUT_SHIFT,
                                              &lstm_1_forget_gate_input_weights[0],
                                              &forget_data_kernel_sum[0],
                                              LSTM_1_FORGET_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_1_FORGET_GATE_HIDDEN_SHIFT,
                                              &lstm_1_forget_gate_hidden_weights[0],
                                              &forget_hidden_kernel_sum[0],
                                              &lstm_1_forget_gate_bias[0],
                                              MURISCV_SIGMOID};

    // CELL GATE
    const muriscv_nn_lstm_gate gate_cell = {LSTM_1_CELL_GATE_INPUT_MULTIPLIER,
                                            LSTM_1_CELL_GATE_INPUT_SHIFT,
                                            &lstm_1_cell_gate_input_weights[0],
                                            &cell_data_kernel_sum[0],
                                            LSTM_1_CELL_GATE_HIDDEN_MULTIPLIER,
                                            LSTM_1_CELL_GATE_HIDDEN_SHIFT,
                                            &lstm_1_cell_gate_hidden_weights[0],
                                            &cell_hidden_kernel_sum[0],
                                            &lstm_1_cell_gate_bias[0],
                                            MURISCV_TANH};

    // OUTPUT GATE
    const muriscv_nn_lstm_gate gate_output = {LSTM_1_OUTPUT_GATE_INPUT_MULTIPLIER,
                                              LSTM_1_OUTPUT_GATE_INPUT_SHIFT,
                                              &lstm_1_output_gate_input_weights[0],
                                              &output_data_kernel_sum[0],
                                              LSTM_1_OUTPUT_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_1_OUTPUT_GATE_HIDDEN_SHIFT,
                                              &lstm_1_output_gate_hidden_weights[0],
                                              &output_hidden_kernel_sum[0],
                                              &lstm_1_output_gate_bias[0],
                                              MURISCV_SIGMOID};

    // LSTM DATA
    const muriscv_nn_lstm_params params = {LSTM_1_TIME_MAJOR,
                                           LSTM_1_BATCH_SIZE,
                                           LSTM_1_TIME_STEPS,
                                           LSTM_1_INPUT_SIZE,
                                           LSTM_1_HIDDEN_SIZE,
                                           LSTM_1_INPUT_ZERO_POINT,
                                           LSTM_1_FORGET_TO_CELL_MULTIPLIER,
                                           LSTM_1_FORGET_TO_CELL_SHIFT,
                                           LSTM_1_INPUT_TO_CELL_MULTIPLIER,
                                           LSTM_1_INPUT_TO_CELL_SHIFT,
                                           LSTM_1_CELL_CLIP,
                                           LSTM_1_CELL_SCALE_POWER,
                                           LSTM_1_OUTPUT_MULTIPLIER,
                                           LSTM_1_OUTPUT_SHIFT,
                                           LSTM_1_OUTPUT_ZERO_POINT,
                                           gate_forget,
                                           gate_input,
                                           gate_cell,
                                           gate_output};

    muriscv_nn_lstm_context buffers;
    buffers.temp1 = buffer1;
    buffers.temp2 = buffer2;
    buffers.cell_state = buffer3;
    buffers.hidden_state = NULL;

    muriscv_nn_status result = muriscv_nn_lstm_unidirectional_s8(lstm_1_input_tensor, output, &params, &buffers);

    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, output_ref_size));
}

void lstm_2_muriscv_nn_lstm_unidirectional_s8(void)
{
    int8_t output[LSTM_2_BATCH_SIZE * LSTM_2_TIME_STEPS * LSTM_2_HIDDEN_SIZE] = {0};
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    const int8_t *output_ref = &lstm_2_output[0];
    const int32_t output_ref_size = LSTM_2_BATCH_SIZE * LSTM_2_TIME_STEPS * LSTM_2_HIDDEN_SIZE;

    int32_t input_data_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t forget_data_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t cell_data_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t output_data_kernel_sum[LSTM_2_HIDDEN_SIZE];

    int32_t input_hidden_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t forget_hidden_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t cell_hidden_kernel_sum[LSTM_2_HIDDEN_SIZE];
    int32_t output_hidden_kernel_sum[LSTM_2_HIDDEN_SIZE];

    muriscv_nn_vector_sum_s8(&input_data_kernel_sum[0],
                             LSTM_2_INPUT_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_input_gate_input_weights[0],
                             LSTM_2_INPUT_ZERO_POINT,
                             0,
                             &lstm_2_input_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&forget_data_kernel_sum[0],
                             LSTM_2_INPUT_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_forget_gate_input_weights[0],
                             LSTM_2_INPUT_ZERO_POINT,
                             0,
                             &lstm_2_forget_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&cell_data_kernel_sum[0],
                             LSTM_2_INPUT_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_cell_gate_input_weights[0],
                             LSTM_2_INPUT_ZERO_POINT,
                             0,
                             &lstm_2_cell_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&output_data_kernel_sum[0],
                             LSTM_2_INPUT_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_output_gate_input_weights[0],
                             LSTM_2_INPUT_ZERO_POINT,
                             0,
                             &lstm_2_output_gate_bias[0]);

    muriscv_nn_vector_sum_s8(&input_hidden_kernel_sum[0],
                             LSTM_2_HIDDEN_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_input_gate_hidden_weights[0],
                             -LSTM_2_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&forget_hidden_kernel_sum[0],
                             LSTM_2_HIDDEN_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_forget_gate_hidden_weights[0],
                             -LSTM_2_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&cell_hidden_kernel_sum[0],
                             LSTM_2_HIDDEN_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_cell_gate_hidden_weights[0],
                             -LSTM_2_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&output_hidden_kernel_sum[0],
                             LSTM_2_HIDDEN_SIZE,
                             LSTM_2_HIDDEN_SIZE,
                             &lstm_2_output_gate_hidden_weights[0],
                             -LSTM_2_OUTPUT_ZERO_POINT,
                             0,
                             NULL);

    // INPUT GATE
    const muriscv_nn_lstm_gate gate_input = {LSTM_2_INPUT_GATE_INPUT_MULTIPLIER,
                                             LSTM_2_INPUT_GATE_INPUT_SHIFT,
                                             &lstm_2_input_gate_input_weights[0],
                                             &input_data_kernel_sum[0],
                                             LSTM_2_INPUT_GATE_HIDDEN_MULTIPLIER,
                                             LSTM_2_INPUT_GATE_HIDDEN_SHIFT,
                                             &lstm_2_input_gate_hidden_weights[0],
                                             &input_hidden_kernel_sum[0],
                                             &lstm_2_input_gate_bias[0],
                                             MURISCV_SIGMOID};

    // FORGET GATE
    const muriscv_nn_lstm_gate gate_forget = {LSTM_2_FORGET_GATE_INPUT_MULTIPLIER,
                                              LSTM_2_FORGET_GATE_INPUT_SHIFT,
                                              &lstm_2_forget_gate_input_weights[0],
                                              &forget_data_kernel_sum[0],
                                              LSTM_2_FORGET_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_2_FORGET_GATE_HIDDEN_SHIFT,
                                              &lstm_2_forget_gate_hidden_weights[0],
                                              &forget_hidden_kernel_sum[0],
                                              &lstm_2_forget_gate_bias[0],
                                              MURISCV_SIGMOID};

    // CELL GATE
    const muriscv_nn_lstm_gate gate_cell = {LSTM_2_CELL_GATE_INPUT_MULTIPLIER,
                                            LSTM_2_CELL_GATE_INPUT_SHIFT,
                                            &lstm_2_cell_gate_input_weights[0],
                                            &cell_data_kernel_sum[0],
                                            LSTM_2_CELL_GATE_HIDDEN_MULTIPLIER,
                                            LSTM_2_CELL_GATE_HIDDEN_SHIFT,
                                            &lstm_2_cell_gate_hidden_weights[0],
                                            &cell_hidden_kernel_sum[0],
                                            &lstm_2_cell_gate_bias[0],
                                            MURISCV_TANH};

    // OUTPUT GATE
    const muriscv_nn_lstm_gate gate_output = {LSTM_2_OUTPUT_GATE_INPUT_MULTIPLIER,
                                              LSTM_2_OUTPUT_GATE_INPUT_SHIFT,
                                              &lstm_2_output_gate_input_weights[0],
                                              &output_data_kernel_sum[0],
                                              LSTM_2_OUTPUT_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_2_OUTPUT_GATE_HIDDEN_SHIFT,
                                              &lstm_2_output_gate_hidden_weights[0],
                                              &output_hidden_kernel_sum[0],
                                              &lstm_2_output_gate_bias[0],
                                              MURISCV_SIGMOID};

    // LSTM DATA
    const muriscv_nn_lstm_params params = {LSTM_2_TIME_MAJOR,
                                           LSTM_2_BATCH_SIZE,
                                           LSTM_2_TIME_STEPS,
                                           LSTM_2_INPUT_SIZE,
                                           LSTM_2_HIDDEN_SIZE,
                                           LSTM_2_INPUT_ZERO_POINT,
                                           LSTM_2_FORGET_TO_CELL_MULTIPLIER,
                                           LSTM_2_FORGET_TO_CELL_SHIFT,
                                           LSTM_2_INPUT_TO_CELL_MULTIPLIER,
                                           LSTM_2_INPUT_TO_CELL_SHIFT,
                                           LSTM_2_CELL_CLIP,
                                           LSTM_2_CELL_SCALE_POWER,
                                           LSTM_2_OUTPUT_MULTIPLIER,
                                           LSTM_2_OUTPUT_SHIFT,
                                           LSTM_2_OUTPUT_ZERO_POINT,
                                           gate_forget,
                                           gate_input,
                                           gate_cell,
                                           gate_output};

    muriscv_nn_lstm_context buffers;
    buffers.temp1 = buffer1;
    buffers.temp2 = buffer2;
    buffers.cell_state = buffer3;
    buffers.hidden_state = NULL;

    muriscv_nn_status result = muriscv_nn_lstm_unidirectional_s8(lstm_2_input_tensor, output, &params, &buffers);

    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, output_ref_size));
}
void lstm_one_time_step_muriscv_nn_lstm_unidirectional_s8(void)
{
    int8_t output[LSTM_ONE_TIME_STEP_BATCH_SIZE * LSTM_ONE_TIME_STEP_TIME_STEPS * LSTM_ONE_TIME_STEP_HIDDEN_SIZE] = {0};
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    const int8_t *output_ref = &lstm_one_time_step_output[0];
    const int32_t output_ref_size =
        LSTM_ONE_TIME_STEP_BATCH_SIZE * LSTM_ONE_TIME_STEP_TIME_STEPS * LSTM_ONE_TIME_STEP_HIDDEN_SIZE;

    int32_t input_data_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t forget_data_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t cell_data_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t output_data_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];

    int32_t input_hidden_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t forget_hidden_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t cell_hidden_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];
    int32_t output_hidden_kernel_sum[LSTM_ONE_TIME_STEP_HIDDEN_SIZE];

    muriscv_nn_vector_sum_s8(&input_data_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_INPUT_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_input_gate_input_weights[0],
                             LSTM_ONE_TIME_STEP_INPUT_ZERO_POINT,
                             0,
                             &lstm_one_time_step_input_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&forget_data_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_INPUT_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_forget_gate_input_weights[0],
                             LSTM_ONE_TIME_STEP_INPUT_ZERO_POINT,
                             0,
                             &lstm_one_time_step_forget_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&cell_data_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_INPUT_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_cell_gate_input_weights[0],
                             LSTM_ONE_TIME_STEP_INPUT_ZERO_POINT,
                             0,
                             &lstm_one_time_step_cell_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&output_data_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_INPUT_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_output_gate_input_weights[0],
                             LSTM_ONE_TIME_STEP_INPUT_ZERO_POINT,
                             0,
                             &lstm_one_time_step_output_gate_bias[0]);

    muriscv_nn_vector_sum_s8(&input_hidden_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_input_gate_hidden_weights[0],
                             -LSTM_ONE_TIME_STEP_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&forget_hidden_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_forget_gate_hidden_weights[0],
                             -LSTM_ONE_TIME_STEP_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&cell_hidden_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_cell_gate_hidden_weights[0],
                             -LSTM_ONE_TIME_STEP_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&output_hidden_kernel_sum[0],
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                             &lstm_one_time_step_output_gate_hidden_weights[0],
                             -LSTM_ONE_TIME_STEP_OUTPUT_ZERO_POINT,
                             0,
                             NULL);

    // INPUT GATE
    const muriscv_nn_lstm_gate gate_input = {LSTM_ONE_TIME_STEP_INPUT_GATE_INPUT_MULTIPLIER,
                                             LSTM_ONE_TIME_STEP_INPUT_GATE_INPUT_SHIFT,
                                             &lstm_one_time_step_input_gate_input_weights[0],
                                             &input_data_kernel_sum[0],
                                             LSTM_ONE_TIME_STEP_INPUT_GATE_HIDDEN_MULTIPLIER,
                                             LSTM_ONE_TIME_STEP_INPUT_GATE_HIDDEN_SHIFT,
                                             &lstm_one_time_step_input_gate_hidden_weights[0],
                                             &input_hidden_kernel_sum[0],
                                             &lstm_one_time_step_input_gate_bias[0],
                                             MURISCV_SIGMOID};

    // FORGET GATE
    const muriscv_nn_lstm_gate gate_forget = {LSTM_ONE_TIME_STEP_FORGET_GATE_INPUT_MULTIPLIER,
                                              LSTM_ONE_TIME_STEP_FORGET_GATE_INPUT_SHIFT,
                                              &lstm_one_time_step_forget_gate_input_weights[0],
                                              &forget_data_kernel_sum[0],
                                              LSTM_ONE_TIME_STEP_FORGET_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_ONE_TIME_STEP_FORGET_GATE_HIDDEN_SHIFT,
                                              &lstm_one_time_step_forget_gate_hidden_weights[0],
                                              &forget_hidden_kernel_sum[0],
                                              &lstm_one_time_step_forget_gate_bias[0],
                                              MURISCV_SIGMOID};

    // CELL GATE
    const muriscv_nn_lstm_gate gate_cell = {LSTM_ONE_TIME_STEP_CELL_GATE_INPUT_MULTIPLIER,
                                            LSTM_ONE_TIME_STEP_CELL_GATE_INPUT_SHIFT,
                                            &lstm_one_time_step_cell_gate_input_weights[0],
                                            &cell_data_kernel_sum[0],
                                            LSTM_ONE_TIME_STEP_CELL_GATE_HIDDEN_MULTIPLIER,
                                            LSTM_ONE_TIME_STEP_CELL_GATE_HIDDEN_SHIFT,
                                            &lstm_one_time_step_cell_gate_hidden_weights[0],
                                            &cell_hidden_kernel_sum[0],
                                            &lstm_one_time_step_cell_gate_bias[0],
                                            MURISCV_TANH};

    // OUTPUT GATE
    const muriscv_nn_lstm_gate gate_output = {LSTM_ONE_TIME_STEP_OUTPUT_GATE_INPUT_MULTIPLIER,
                                              LSTM_ONE_TIME_STEP_OUTPUT_GATE_INPUT_SHIFT,
                                              &lstm_one_time_step_output_gate_input_weights[0],
                                              &output_data_kernel_sum[0],
                                              LSTM_ONE_TIME_STEP_OUTPUT_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_ONE_TIME_STEP_OUTPUT_GATE_HIDDEN_SHIFT,
                                              &lstm_one_time_step_output_gate_hidden_weights[0],
                                              &output_hidden_kernel_sum[0],
                                              &lstm_one_time_step_output_gate_bias[0],
                                              MURISCV_SIGMOID};

    // LSTM DATA
    const muriscv_nn_lstm_params params = {LSTM_ONE_TIME_STEP_TIME_MAJOR,
                                           LSTM_ONE_TIME_STEP_BATCH_SIZE,
                                           LSTM_ONE_TIME_STEP_TIME_STEPS,
                                           LSTM_ONE_TIME_STEP_INPUT_SIZE,
                                           LSTM_ONE_TIME_STEP_HIDDEN_SIZE,
                                           LSTM_ONE_TIME_STEP_INPUT_ZERO_POINT,
                                           LSTM_ONE_TIME_STEP_FORGET_TO_CELL_MULTIPLIER,
                                           LSTM_ONE_TIME_STEP_FORGET_TO_CELL_SHIFT,
                                           LSTM_ONE_TIME_STEP_INPUT_TO_CELL_MULTIPLIER,
                                           LSTM_ONE_TIME_STEP_INPUT_TO_CELL_SHIFT,
                                           LSTM_ONE_TIME_STEP_CELL_CLIP,
                                           LSTM_ONE_TIME_STEP_CELL_SCALE_POWER,
                                           LSTM_ONE_TIME_STEP_OUTPUT_MULTIPLIER,
                                           LSTM_ONE_TIME_STEP_OUTPUT_SHIFT,
                                           LSTM_ONE_TIME_STEP_OUTPUT_ZERO_POINT,
                                           gate_forget,
                                           gate_input,
                                           gate_cell,
                                           gate_output};

    muriscv_nn_lstm_context buffers;
    buffers.temp1 = buffer1;
    buffers.temp2 = buffer2;
    buffers.cell_state = buffer3;
    buffers.hidden_state = NULL;

    muriscv_nn_status result =
        muriscv_nn_lstm_unidirectional_s8(lstm_one_time_step_input_tensor, output, &params, &buffers);

    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, output_ref_size));
}

void lstm_stateful_batch_major_multibatch_arm_lstm_unidirectional_s8(void)
{
    int8_t output[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_BATCH_SIZE * LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_TIME_STEPS *
                  LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE] = {0};
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    const int8_t *output_ref = &lstm_stateful_batch_major_multibatch_output[0];
    const int32_t output_ref_size = LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_BATCH_SIZE *
        LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_TIME_STEPS * LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE;

    int32_t input_data_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t forget_data_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t cell_data_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t output_data_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];

    int32_t input_hidden_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t forget_hidden_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t cell_hidden_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    int32_t output_hidden_kernel_sum[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];

    muriscv_nn_vector_sum_s8(&input_data_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_input_gate_input_weights[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_ZERO_POINT,
                             0,
                             &lstm_stateful_batch_major_multibatch_input_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&forget_data_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_forget_gate_input_weights[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_ZERO_POINT,
                             0,
                             &lstm_stateful_batch_major_multibatch_forget_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&cell_data_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_cell_gate_input_weights[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_ZERO_POINT,
                             0,
                             &lstm_stateful_batch_major_multibatch_cell_gate_bias[0]);
    muriscv_nn_vector_sum_s8(&output_data_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_output_gate_input_weights[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_ZERO_POINT,
                             0,
                             &lstm_stateful_batch_major_multibatch_output_gate_bias[0]);

    muriscv_nn_vector_sum_s8(&input_hidden_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_input_gate_hidden_weights[0],
                             -LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&forget_hidden_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_forget_gate_hidden_weights[0],
                             -LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&cell_hidden_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_cell_gate_hidden_weights[0],
                             -LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT,
                             0,
                             NULL);
    muriscv_nn_vector_sum_s8(&output_hidden_kernel_sum[0],
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                             &lstm_stateful_batch_major_multibatch_output_gate_hidden_weights[0],
                             -LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT,
                             0,
                             NULL);

    // INPUT GATE
    const muriscv_nn_lstm_gate gate_input = {LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_GATE_INPUT_MULTIPLIER,
                                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_GATE_INPUT_SHIFT,
                                             &lstm_stateful_batch_major_multibatch_input_gate_input_weights[0],
                                             &input_data_kernel_sum[0],
                                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_GATE_HIDDEN_MULTIPLIER,
                                             LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_GATE_HIDDEN_SHIFT,
                                             &lstm_stateful_batch_major_multibatch_input_gate_hidden_weights[0],
                                             &input_hidden_kernel_sum[0],
                                             &lstm_stateful_batch_major_multibatch_input_gate_bias[0],
                                             MURISCV_SIGMOID};

    // FORGET GATE
    const muriscv_nn_lstm_gate gate_forget = {LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_GATE_INPUT_MULTIPLIER,
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_GATE_INPUT_SHIFT,
                                              &lstm_stateful_batch_major_multibatch_forget_gate_input_weights[0],
                                              &forget_data_kernel_sum[0],
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_GATE_HIDDEN_SHIFT,
                                              &lstm_stateful_batch_major_multibatch_forget_gate_hidden_weights[0],
                                              &forget_hidden_kernel_sum[0],
                                              &lstm_stateful_batch_major_multibatch_forget_gate_bias[0],
                                              MURISCV_SIGMOID};

    // CELL GATE
    const muriscv_nn_lstm_gate gate_cell = {LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_GATE_INPUT_MULTIPLIER,
                                            LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_GATE_INPUT_SHIFT,
                                            &lstm_stateful_batch_major_multibatch_cell_gate_input_weights[0],
                                            &cell_data_kernel_sum[0],
                                            LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_GATE_HIDDEN_MULTIPLIER,
                                            LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_GATE_HIDDEN_SHIFT,
                                            &lstm_stateful_batch_major_multibatch_cell_gate_hidden_weights[0],
                                            &cell_hidden_kernel_sum[0],
                                            &lstm_stateful_batch_major_multibatch_cell_gate_bias[0],
                                            MURISCV_TANH};

    // OUTPUT GATE
    const muriscv_nn_lstm_gate gate_output = {LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_GATE_INPUT_MULTIPLIER,
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_GATE_INPUT_SHIFT,
                                              &lstm_stateful_batch_major_multibatch_output_gate_input_weights[0],
                                              &output_data_kernel_sum[0],
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_GATE_HIDDEN_MULTIPLIER,
                                              LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_GATE_HIDDEN_SHIFT,
                                              &lstm_stateful_batch_major_multibatch_output_gate_hidden_weights[0],
                                              &output_hidden_kernel_sum[0],
                                              &lstm_stateful_batch_major_multibatch_output_gate_bias[0],
                                              MURISCV_SIGMOID};

    // LSTM DATA
    const muriscv_nn_lstm_params params = {LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_TIME_MAJOR,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_BATCH_SIZE,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_TIME_STEPS,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_SIZE,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_ZERO_POINT,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_TO_CELL_MULTIPLIER,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_FORGET_TO_CELL_SHIFT,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_TO_CELL_MULTIPLIER,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_INPUT_TO_CELL_SHIFT,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_CLIP,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_CELL_SCALE_POWER,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_MULTIPLIER,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_SHIFT,
                                           LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT,
                                           gate_forget,
                                           gate_input,
                                           gate_cell,
                                           gate_output};

    // Allocate hidden state buffer and initialize to zero point (representing real 0.0)
    int8_t hidden_state[LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_BATCH_SIZE *
                        LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_HIDDEN_SIZE];
    memset(hidden_state, LSTM_STATEFUL_BATCH_MAJOR_MULTIBATCH_OUTPUT_ZERO_POINT, sizeof(hidden_state));

    memset(buffer3, 0, sizeof(buffer3));

    muriscv_nn_lstm_context buffers;
    buffers.temp1 = buffer1;
    buffers.temp2 = buffer2;
    buffers.cell_state = buffer3;
    buffers.hidden_state = hidden_state;

    muriscv_nn_status result =
        muriscv_nn_lstm_unidirectional_s8(lstm_stateful_batch_major_multibatch_input_tensor, output, &params, &buffers);

    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, output_ref_size));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(lstm_1_muriscv_nn_lstm_unidirectional_s8);
    RUN_TEST(lstm_2_muriscv_nn_lstm_unidirectional_s8);
    RUN_TEST(lstm_one_time_step_muriscv_nn_lstm_unidirectional_s8);
    RUN_TEST(lstm_stateful_batch_major_multibatch_arm_lstm_unidirectional_s8);

#if defined(__riscv) || defined(__riscv__)
    /* If an error occurred make sure the simulator fails so CTest can detect that. */
    int failures = UNITY_END();
    if (failures != 0)
    {
        __asm__ volatile("unimp");
    }
    return failures;
#else
    return UNITY_END();
#endif
}
