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

#include "../../TestData/maxpooling/test_data.h"
#include "../../TestData/maxpooling_1/test_data.h"
#include "../../TestData/maxpooling_2/test_data.h"
#include "../../TestData/maxpooling_3/test_data.h"
#include "../../TestData/maxpooling_4/test_data.h"
#include "../../TestData/maxpooling_5/test_data.h"
#include "../../TestData/maxpooling_6/test_data.h"
#include "../../TestData/maxpooling_7/test_data.h"
#include "../../Utils/validate.h"

#define REPEAT_NUM 2

void setUp(void) { /* set stuff up here */ }

void tearDown(void) { /* clean stuff up here */ }


void maxpooling_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_OUTPUT_W * MAXPOOLING_OUTPUT_H * MAXPOOLING_INPUT_C * MAXPOOLING_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_input_tensor;

    input_dims.n = MAXPOOLING_BATCH_SIZE;
    input_dims.w = MAXPOOLING_INPUT_W;
    input_dims.h = MAXPOOLING_INPUT_H;
    input_dims.c = MAXPOOLING_INPUT_C;
    filter_dims.w = MAXPOOLING_FILTER_W;
    filter_dims.h = MAXPOOLING_FILTER_H;
    output_dims.w = MAXPOOLING_OUTPUT_W;
    output_dims.h = MAXPOOLING_OUTPUT_H;
    output_dims.c = MAXPOOLING_INPUT_C;

    pool_params.padding.w = MAXPOOLING_PADDING_W;
    pool_params.padding.h = MAXPOOLING_PADDING_H;
    pool_params.stride.w = MAXPOOLING_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_output,
                     MAXPOOLING_OUTPUT_W * MAXPOOLING_OUTPUT_H * MAXPOOLING_INPUT_C * MAXPOOLING_BATCH_SIZE));
    }
}

void maxpooling_1_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_1_OUTPUT_W * MAXPOOLING_1_OUTPUT_H * MAXPOOLING_1_INPUT_C * MAXPOOLING_1_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_1_input_tensor;

    input_dims.n = MAXPOOLING_1_BATCH_SIZE;
    input_dims.w = MAXPOOLING_1_INPUT_W;
    input_dims.h = MAXPOOLING_1_INPUT_H;
    input_dims.c = MAXPOOLING_1_INPUT_C;
    filter_dims.w = MAXPOOLING_1_FILTER_W;
    filter_dims.h = MAXPOOLING_1_FILTER_H;
    output_dims.w = MAXPOOLING_1_OUTPUT_W;
    output_dims.h = MAXPOOLING_1_OUTPUT_H;
    output_dims.c = MAXPOOLING_1_INPUT_C;

    pool_params.padding.w = MAXPOOLING_1_PADDING_W;
    pool_params.padding.h = MAXPOOLING_1_PADDING_H;
    pool_params.stride.w = MAXPOOLING_1_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_1_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_1_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_1_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_1_output,
                     MAXPOOLING_1_OUTPUT_W * MAXPOOLING_1_OUTPUT_H * MAXPOOLING_1_INPUT_C * MAXPOOLING_1_BATCH_SIZE));
    }
}

void maxpooling_2_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_2_OUTPUT_W * MAXPOOLING_2_OUTPUT_H * MAXPOOLING_2_INPUT_C * MAXPOOLING_2_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_2_input_tensor;

    input_dims.n = MAXPOOLING_2_BATCH_SIZE;
    input_dims.w = MAXPOOLING_2_INPUT_W;
    input_dims.h = MAXPOOLING_2_INPUT_H;
    input_dims.c = MAXPOOLING_2_INPUT_C;
    filter_dims.w = MAXPOOLING_2_FILTER_W;
    filter_dims.h = MAXPOOLING_2_FILTER_H;
    output_dims.w = MAXPOOLING_2_OUTPUT_W;
    output_dims.h = MAXPOOLING_2_OUTPUT_H;
    output_dims.c = MAXPOOLING_2_INPUT_C;

    pool_params.padding.w = MAXPOOLING_2_PADDING_W;
    pool_params.padding.h = MAXPOOLING_2_PADDING_H;
    pool_params.stride.w = MAXPOOLING_2_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_2_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_2_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_2_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_2_output,
                     MAXPOOLING_2_OUTPUT_W * MAXPOOLING_2_OUTPUT_H * MAXPOOLING_2_INPUT_C * MAXPOOLING_2_BATCH_SIZE));
    }
}

void maxpooling_3_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_3_OUTPUT_W * MAXPOOLING_3_OUTPUT_H * MAXPOOLING_3_INPUT_C * MAXPOOLING_3_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_3_input_tensor;

    input_dims.n = MAXPOOLING_3_BATCH_SIZE;
    input_dims.w = MAXPOOLING_3_INPUT_W;
    input_dims.h = MAXPOOLING_3_INPUT_H;
    input_dims.c = MAXPOOLING_3_INPUT_C;
    filter_dims.w = MAXPOOLING_3_FILTER_W;
    filter_dims.h = MAXPOOLING_3_FILTER_H;
    output_dims.w = MAXPOOLING_3_OUTPUT_W;
    output_dims.h = MAXPOOLING_3_OUTPUT_H;
    output_dims.c = MAXPOOLING_3_INPUT_C;

    pool_params.padding.w = MAXPOOLING_3_PADDING_W;
    pool_params.padding.h = MAXPOOLING_3_PADDING_H;
    pool_params.stride.w = MAXPOOLING_3_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_3_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_3_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_3_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_3_output,
                     MAXPOOLING_3_OUTPUT_W * MAXPOOLING_3_OUTPUT_H * MAXPOOLING_3_INPUT_C * MAXPOOLING_3_BATCH_SIZE));
    }
}

void maxpooling_4_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_4_OUTPUT_W * MAXPOOLING_4_OUTPUT_H * MAXPOOLING_4_INPUT_C * MAXPOOLING_4_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_4_input_tensor;

    input_dims.n = MAXPOOLING_4_BATCH_SIZE;
    input_dims.w = MAXPOOLING_4_INPUT_W;
    input_dims.h = MAXPOOLING_4_INPUT_H;
    input_dims.c = MAXPOOLING_4_INPUT_C;
    filter_dims.w = MAXPOOLING_4_FILTER_W;
    filter_dims.h = MAXPOOLING_4_FILTER_H;
    output_dims.w = MAXPOOLING_4_OUTPUT_W;
    output_dims.h = MAXPOOLING_4_OUTPUT_H;
    output_dims.c = MAXPOOLING_4_INPUT_C;

    pool_params.padding.w = MAXPOOLING_4_PADDING_W;
    pool_params.padding.h = MAXPOOLING_4_PADDING_H;
    pool_params.stride.w = MAXPOOLING_4_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_4_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_4_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_4_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_4_output,
                     MAXPOOLING_4_OUTPUT_W * MAXPOOLING_4_OUTPUT_H * MAXPOOLING_4_INPUT_C * MAXPOOLING_4_BATCH_SIZE));
    }
}

void maxpooling_5_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_5_OUTPUT_W * MAXPOOLING_5_OUTPUT_H * MAXPOOLING_5_INPUT_C * MAXPOOLING_5_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_5_input_tensor;

    input_dims.n = MAXPOOLING_5_BATCH_SIZE;
    input_dims.w = MAXPOOLING_5_INPUT_W;
    input_dims.h = MAXPOOLING_5_INPUT_H;
    input_dims.c = MAXPOOLING_5_INPUT_C;
    filter_dims.w = MAXPOOLING_5_FILTER_W;
    filter_dims.h = MAXPOOLING_5_FILTER_H;
    output_dims.w = MAXPOOLING_5_OUTPUT_W;
    output_dims.h = MAXPOOLING_5_OUTPUT_H;
    output_dims.c = MAXPOOLING_5_INPUT_C;

    pool_params.padding.w = MAXPOOLING_5_PADDING_W;
    pool_params.padding.h = MAXPOOLING_5_PADDING_H;
    pool_params.stride.w = MAXPOOLING_5_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_5_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_5_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_5_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_5_output,
                     MAXPOOLING_5_OUTPUT_W * MAXPOOLING_5_OUTPUT_H * MAXPOOLING_6_INPUT_C * MAXPOOLING_5_BATCH_SIZE));
    }
}

void maxpooling_6_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_6_OUTPUT_W * MAXPOOLING_6_OUTPUT_H * MAXPOOLING_6_INPUT_C * MAXPOOLING_6_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_6_input_tensor;

    input_dims.n = MAXPOOLING_6_BATCH_SIZE;
    input_dims.w = MAXPOOLING_6_INPUT_W;
    input_dims.h = MAXPOOLING_6_INPUT_H;
    input_dims.c = MAXPOOLING_6_INPUT_C;
    filter_dims.w = MAXPOOLING_6_FILTER_W;
    filter_dims.h = MAXPOOLING_6_FILTER_H;
    output_dims.w = MAXPOOLING_6_OUTPUT_W;
    output_dims.h = MAXPOOLING_6_OUTPUT_H;
    output_dims.c = MAXPOOLING_6_INPUT_C;

    pool_params.padding.w = MAXPOOLING_6_PADDING_W;
    pool_params.padding.h = MAXPOOLING_6_PADDING_H;
    pool_params.stride.w = MAXPOOLING_6_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_6_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_6_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_6_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_6_output,
                     MAXPOOLING_6_OUTPUT_W * MAXPOOLING_6_OUTPUT_H * MAXPOOLING_6_INPUT_C * MAXPOOLING_6_BATCH_SIZE));
    }
}

void maxpooling_7_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int8_t output[MAXPOOLING_7_OUTPUT_W * MAXPOOLING_7_OUTPUT_H * MAXPOOLING_7_INPUT_C * MAXPOOLING_7_BATCH_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_7_input_tensor;

    input_dims.n = MAXPOOLING_7_BATCH_SIZE;
    input_dims.w = MAXPOOLING_7_INPUT_W;
    input_dims.h = MAXPOOLING_7_INPUT_H;
    input_dims.c = MAXPOOLING_7_INPUT_C;
    filter_dims.w = MAXPOOLING_7_FILTER_W;
    filter_dims.h = MAXPOOLING_7_FILTER_H;
    output_dims.w = MAXPOOLING_7_OUTPUT_W;
    output_dims.h = MAXPOOLING_7_OUTPUT_H;
    output_dims.c = MAXPOOLING_7_INPUT_C;

    pool_params.padding.w = MAXPOOLING_7_PADDING_W;
    pool_params.padding.h = MAXPOOLING_7_PADDING_H;
    pool_params.stride.w = MAXPOOLING_7_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_7_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_7_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_7_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(expected, result);
        TEST_ASSERT_TRUE(
            validate(output,
                     maxpooling_7_output,
                     MAXPOOLING_7_OUTPUT_W * MAXPOOLING_7_OUTPUT_H * MAXPOOLING_7_INPUT_C * MAXPOOLING_7_BATCH_SIZE));
    }
}

void maxpooling_param_fail_muriscv_nn_max_pool_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_ARG_ERROR;
    int8_t output[MAXPOOLING_7_OUTPUT_W * MAXPOOLING_7_OUTPUT_H * MAXPOOLING_7_INPUT_C * MAXPOOLING_7_BATCH_SIZE] = {0};

    muriscv_nn_context ctx = {};
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpooling_7_input_tensor;

    input_dims.n = -3;
    input_dims.w = MAXPOOLING_7_INPUT_W;
    input_dims.h = MAXPOOLING_7_INPUT_H;
    input_dims.c = MAXPOOLING_7_INPUT_C;
    filter_dims.w = MAXPOOLING_7_FILTER_W;
    filter_dims.h = MAXPOOLING_7_FILTER_H;
    output_dims.w = MAXPOOLING_7_OUTPUT_W;
    output_dims.h = MAXPOOLING_7_OUTPUT_H;
    output_dims.c = MAXPOOLING_7_INPUT_C;

    pool_params.padding.w = MAXPOOLING_7_PADDING_W;
    pool_params.padding.h = MAXPOOLING_7_PADDING_H;
    pool_params.stride.w = MAXPOOLING_7_STRIDE_W;
    pool_params.stride.h = MAXPOOLING_7_STRIDE_H;

    pool_params.activation.min = MAXPOOLING_7_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOLING_7_ACTIVATION_MAX;

    muriscv_nn_status result =
        muriscv_nn_max_pool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    TEST_ASSERT_EQUAL(expected, result);
}


int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(maxpooling_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_1_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_2_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_3_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_4_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_5_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_6_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_7_muriscv_nn_max_pool_s8);
    RUN_TEST(maxpooling_param_fail_muriscv_nn_max_pool_s8);

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
