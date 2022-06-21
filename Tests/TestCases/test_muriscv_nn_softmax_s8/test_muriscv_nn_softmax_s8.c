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

#include "../../TestData/test_muriscv_nn_softmax_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0
#define REPEAT_NUM 2

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_softmax_1_s8(void)
{
    const int32_t num_rows = SOFTMAX_1_NUM_ROWS;
    const int32_t row_size = SOFTMAX_1_ROW_SIZE;
    const int32_t mult = SOFTMAX_1_INPUT_MULT;
    const int32_t shift = SOFTMAX_1_INPUT_LEFT_SHIFT;
    const int32_t diff_min = SOFTMAX_1_DIFF_MIN;
    const int8_t *input_data = softmax_1_input;
    int8_t output[SOFTMAX_1_DST_SIZE];

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
        TEST_ASSERT_TRUE(validate(output, softmax_1_output_ref, SOFTMAX_1_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_softmax_1_invalid_diff_min_s8(void)
{
    const int8_t softmax_expect_invalid_output[] = {-128, -128, -128, -128, -128};
    const int32_t num_rows = SOFTMAX_1_NUM_ROWS;
    const int32_t row_size = SOFTMAX_1_ROW_SIZE;
    const int32_t mult = SOFTMAX_1_INPUT_MULT;
    const int32_t shift = SOFTMAX_1_INPUT_LEFT_SHIFT;
    const int32_t diff_min = 0x7FFFFFFF;
    const int8_t *input_data = softmax_1_input;
    int8_t output[SOFTMAX_1_DST_SIZE];

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
        TEST_ASSERT_TRUE(validate(output, softmax_expect_invalid_output, SOFTMAX_1_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_softmax_2_s8(void)
{
  const int32_t num_rows = SOFTMAX_2_NUM_ROWS;
  const int32_t row_size = SOFTMAX_2_ROW_SIZE;
  const int32_t mult = SOFTMAX_2_INPUT_MULT;
  const int32_t shift = SOFTMAX_2_INPUT_LEFT_SHIFT;
  const int32_t diff_min = SOFTMAX_2_DIFF_MIN;
  const int8_t *input_data = softmax_2_input;
  int8_t output[SOFTMAX_2_DST_SIZE];

  for (int i = 0; i < REPEAT_NUM; i++)
  {
    muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
    TEST_ASSERT_TRUE(validate(output, softmax_2_output_ref, SOFTMAX_2_DST_SIZE, TOLERANCE));
  }
}

void test_muriscv_nn_softmax_2_invalid_diff_min_s8(void)
{
    const int8_t softmax_expect_invalid_output[] = {-128, -128, -128, -128, -128, -128, -128, -128, -128, -128};
    const int32_t num_rows = SOFTMAX_2_NUM_ROWS;
    const int32_t row_size = SOFTMAX_2_ROW_SIZE;
    const int32_t mult = SOFTMAX_2_INPUT_MULT;
    const int32_t shift = SOFTMAX_2_INPUT_LEFT_SHIFT;
    const int32_t diff_min = 0x7FFFFFFF;
    const int8_t *input_data = softmax_2_input;
    int8_t output[SOFTMAX_2_DST_SIZE];

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_softmax_s8(input_data, num_rows, row_size, mult, shift, diff_min, output);
        TEST_ASSERT_TRUE(validate(output, softmax_expect_invalid_output, SOFTMAX_2_DST_SIZE, TOLERANCE));
    }
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_softmax_1_s8);
    RUN_TEST(test_muriscv_nn_softmax_1_invalid_diff_min_s8);
    RUN_TEST(test_muriscv_nn_softmax_2_s8);
    RUN_TEST(test_muriscv_nn_softmax_2_invalid_diff_min_s8);

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
