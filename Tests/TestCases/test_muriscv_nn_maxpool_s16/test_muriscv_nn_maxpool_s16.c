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
#include <unity.h>

#include "../../TestData/maxpool_int16/test_data.h"
#include "../../TestData/maxpool_int16_1/test_data.h"
#include "../../TestData/maxpool_int16_2/test_data.h"
#include "../../Utils/validate.h"

#define REPEAT_NUM 2

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void maxpool_int16_muriscv_nn_maxpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[MAXPOOL_INT16_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = maxpool_int16_input;

    input_dims.n = MAXPOOL_INT16_INPUT_BATCHES;
    input_dims.w = MAXPOOL_INT16_INPUT_W;
    input_dims.h = MAXPOOL_INT16_INPUT_H;
    input_dims.c = MAXPOOL_INT16_IN_CH;
    filter_dims.w = MAXPOOL_INT16_FILTER_X;
    filter_dims.h = MAXPOOL_INT16_FILTER_Y;
    output_dims.w = MAXPOOL_INT16_OUTPUT_W;
    output_dims.h = MAXPOOL_INT16_OUTPUT_H;
    output_dims.c = MAXPOOL_INT16_OUT_CH;

    pool_params.padding.w = MAXPOOL_INT16_PAD_X;
    pool_params.padding.h = MAXPOOL_INT16_PAD_Y;
    pool_params.stride.w = MAXPOOL_INT16_STRIDE_X;
    pool_params.stride.h = MAXPOOL_INT16_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_INT16_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_INT16_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(validate_s16(output, maxpool_int16_output_ref, MAXPOOL_INT16_DST_SIZE));
    }
}

void maxpool_int16_1_muriscv_nn_maxpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[MAXPOOL_INT16_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = maxpool_int16_1_input;

    input_dims.n = MAXPOOL_INT16_1_INPUT_BATCHES;
    input_dims.w = MAXPOOL_INT16_1_INPUT_W;
    input_dims.h = MAXPOOL_INT16_1_INPUT_H;
    input_dims.c = MAXPOOL_INT16_1_IN_CH;
    filter_dims.w = MAXPOOL_INT16_1_FILTER_X;
    filter_dims.h = MAXPOOL_INT16_1_FILTER_Y;
    output_dims.w = MAXPOOL_INT16_1_OUTPUT_W;
    output_dims.h = MAXPOOL_INT16_1_OUTPUT_H;
    output_dims.c = MAXPOOL_INT16_1_OUT_CH;

    pool_params.padding.w = MAXPOOL_INT16_1_PAD_X;
    pool_params.padding.h = MAXPOOL_INT16_1_PAD_Y;
    pool_params.stride.w = MAXPOOL_INT16_1_STRIDE_X;
    pool_params.stride.h = MAXPOOL_INT16_1_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_INT16_1_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_INT16_1_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(validate_s16(output, maxpool_int16_1_output_ref, MAXPOOL_INT16_1_DST_SIZE));
    }
}

void maxpool_int16_2_muriscv_nn_maxpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[MAXPOOL_INT16_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = maxpool_int16_2_input;

    input_dims.n = MAXPOOL_INT16_2_INPUT_BATCHES;
    input_dims.w = MAXPOOL_INT16_2_INPUT_W;
    input_dims.h = MAXPOOL_INT16_2_INPUT_H;
    input_dims.c = MAXPOOL_INT16_2_IN_CH;
    filter_dims.w = MAXPOOL_INT16_2_FILTER_X;
    filter_dims.h = MAXPOOL_INT16_2_FILTER_Y;
    output_dims.w = MAXPOOL_INT16_2_OUTPUT_W;
    output_dims.h = MAXPOOL_INT16_2_OUTPUT_H;
    output_dims.c = MAXPOOL_INT16_2_OUT_CH;

    pool_params.padding.w = MAXPOOL_INT16_2_PAD_X;
    pool_params.padding.h = MAXPOOL_INT16_2_PAD_Y;
    pool_params.stride.w = MAXPOOL_INT16_2_STRIDE_X;
    pool_params.stride.h = MAXPOOL_INT16_2_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_INT16_2_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_INT16_2_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(validate_s16(output, maxpool_int16_2_output_ref, MAXPOOL_INT16_2_DST_SIZE));
    }
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(maxpool_int16_muriscv_nn_maxpool_s16);
    RUN_TEST(maxpool_int16_1_muriscv_nn_maxpool_s16);
    RUN_TEST(maxpool_int16_2_muriscv_nn_maxpool_s16);

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
