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

#include "../../TestData/softmax/test_data.h"
#include "../../Utils/validate.h"

#define REPEAT_NUM 2

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void softmax_muriscv_nn_softmax_s8(void)
{
    const int32_t num_rows = SOFTMAX_NUM_ROWS;
    const int32_t row_size = SOFTMAX_ROW_SIZE;
    const int32_t mult = SOFTMAX_INPUT_MULT;
    const int32_t shift = SOFTMAX_INPUT_LEFT_SHIFT;
    const int32_t diff_min = SOFTMAX_DIFF_MIN;
    const q7_t *input_data = softmax_input;
    int8_t output[SOFTMAX_DST_SIZE];

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
        TEST_ASSERT_TRUE(validate(output, softmax_output_ref, SOFTMAX_DST_SIZE));
    }
}

void softmax_invalid_diff_min_muriscv_nn_softmax_s8(void)
{
    const int32_t num_rows = SOFTMAX_NUM_ROWS;
    const int32_t row_size = SOFTMAX_ROW_SIZE;
    const int32_t mult = SOFTMAX_INPUT_MULT;
    const int32_t shift = SOFTMAX_INPUT_LEFT_SHIFT;
    const int32_t diff_min = 0x7FFFFFFF;
    const q7_t *input_data = softmax_input;
    int8_t output[SOFTMAX_DST_SIZE];

    q7_t *softmax_expect_invalid_output = malloc(SOFTMAX_DST_SIZE);
    for (int i = 0; i < SOFTMAX_DST_SIZE; i++)
    {
        softmax_expect_invalid_output[i] = -128;
    }

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
        TEST_ASSERT_TRUE(validate(output, softmax_expect_invalid_output, SOFTMAX_DST_SIZE));
    }
    free(softmax_expect_invalid_output);
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(softmax_muriscv_nn_softmax_s8);
    RUN_TEST(softmax_invalid_diff_min_muriscv_nn_softmax_s8);

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
