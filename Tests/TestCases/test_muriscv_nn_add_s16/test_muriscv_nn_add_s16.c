/*
 * Copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM.
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

#include <muriscv_nn_functions.h>
#include <stdio.h>
#include <stdlib.h>
#include <unity.h>

#include "../../TestData/test_muriscv_nn_add_s16/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_add_1_s16(void)
{
    int16_t output[ADD_1_BLOCK_SIZE] = {0};
    muriscv_nn_status result = muriscv_nn_elementwise_add_s16(add_1_input_1,
                                                              add_1_input_2,
                                                              ADD_1_INPUT_1_OFFSET,
                                                              ADD_1_INPUT_1_MULT,
                                                              ADD_1_INPUT_1_SHIFT,
                                                              ADD_1_INPUT_2_OFFSET,
                                                              ADD_1_INPUT_2_MULT,
                                                              ADD_1_INPUT_2_SHIFT,
                                                              ADD_1_LEFT_SHIFT,
                                                              output,
                                                              ADD_1_OUTPUT_OFFSET,
                                                              ADD_1_OUTPUT_MULT,
                                                              ADD_1_OUTPUT_SHIFT,
                                                              ADD_1_OUT_ACTIVATION_MIN,
                                                              ADD_1_OUT_ACTIVATION_MAX,
                                                              ADD_1_BLOCK_SIZE);

    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate_s16(output, add_1_output_ref, ADD_1_BLOCK_SIZE, TOLERANCE));
}

void test_muriscv_nn_add_2_s16(void)
{
    int16_t output[ADD_2_BLOCK_SIZE] = {0};
    muriscv_nn_status result = muriscv_nn_elementwise_add_s16(add_2_input_1,
                                                              add_2_input_2,
                                                              ADD_2_INPUT_1_OFFSET,
                                                              ADD_2_INPUT_1_MULT,
                                                              ADD_2_INPUT_1_SHIFT,
                                                              ADD_2_INPUT_2_OFFSET,
                                                              ADD_2_INPUT_2_MULT,
                                                              ADD_2_INPUT_2_SHIFT,
                                                              ADD_2_LEFT_SHIFT,
                                                              output,
                                                              ADD_2_OUTPUT_OFFSET,
                                                              ADD_2_OUTPUT_MULT,
                                                              ADD_2_OUTPUT_SHIFT,
                                                              ADD_2_OUT_ACTIVATION_MIN,
                                                              ADD_2_OUT_ACTIVATION_MAX,
                                                              ADD_2_BLOCK_SIZE);

    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate_s16(output, add_2_output_ref, ADD_2_BLOCK_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_add_1_s16);
    RUN_TEST(test_muriscv_nn_add_2_s16);

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
