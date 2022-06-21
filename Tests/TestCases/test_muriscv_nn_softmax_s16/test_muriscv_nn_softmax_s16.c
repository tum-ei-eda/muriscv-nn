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
#include <stdio.h>
#include <stdlib.h>
#include <unity.h>

#include "../../TestData/test_muriscv_nn_softmax_s16/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0
#define REPEAT_NUM 2

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_softmax_1_s16(void)
{
    const int32_t num_rows = SOFTMAX_1_NUM_ROWS;
    const int32_t row_size = SOFTMAX_1_ROW_SIZE;
    const int32_t mult = SOFTMAX_1_INPUT_MULT;
    const int32_t shift = SOFTMAX_1_INPUT_LEFT_SHIFT;
    const muriscv_nn_softmax_lut_s16 softmax_params = {.exp_lut = softmax_s16_exp_lut,
                                                       .one_by_one_lut = softmax_s16_one_by_one_lut};
    const q15_t *input_data = softmax_1_input;
    int16_t output[SOFTMAX_1_DST_SIZE];

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s16(input_data, num_rows, row_size, mult, shift, &softmax_params, output);
        TEST_ASSERT_TRUE(validate_s16(output, softmax_1_output_ref, SOFTMAX_1_DST_SIZE, TOLERANCE));
    }
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_softmax_1_s16);

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
