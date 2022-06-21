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

#include "../../TestData/test_muriscv_nn_maxpool_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0
#define REPEAT_NUM 2

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_maxpool_0_s8(void)
{
    int8_t output[MAXPOOL_0_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_0_input;

    input_dims.n = MAXPOOL_0_INPUT_BATCHES;
    input_dims.w = MAXPOOL_0_INPUT_W;
    input_dims.h = MAXPOOL_0_INPUT_H;
    input_dims.c = MAXPOOL_0_IN_CH;
    filter_dims.w = MAXPOOL_0_FILTER_X;
    filter_dims.h = MAXPOOL_0_FILTER_Y;
    output_dims.w = MAXPOOL_0_OUTPUT_W;
    output_dims.h = MAXPOOL_0_OUTPUT_H;
    output_dims.c = MAXPOOL_0_OUT_CH;

    pool_params.padding.w = MAXPOOL_0_PAD_X;
    pool_params.padding.h = MAXPOOL_0_PAD_Y;
    pool_params.stride.w = MAXPOOL_0_STRIDE_X;
    pool_params.stride.h = MAXPOOL_0_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_0_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_0_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_0_output_ref, MAXPOOL_0_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_1_s8(void)
{
    int8_t output[MAXPOOL_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_1_input;

    input_dims.n = MAXPOOL_1_INPUT_BATCHES;
    input_dims.w = MAXPOOL_1_INPUT_W;
    input_dims.h = MAXPOOL_1_INPUT_H;
    input_dims.c = MAXPOOL_1_IN_CH;
    filter_dims.w = MAXPOOL_1_FILTER_X;
    filter_dims.h = MAXPOOL_1_FILTER_Y;
    output_dims.w = MAXPOOL_1_OUTPUT_W;
    output_dims.h = MAXPOOL_1_OUTPUT_H;
    output_dims.c = MAXPOOL_1_OUT_CH;

    pool_params.padding.w = MAXPOOL_1_PAD_X;
    pool_params.padding.h = MAXPOOL_1_PAD_Y;
    pool_params.stride.w = MAXPOOL_1_STRIDE_X;
    pool_params.stride.h = MAXPOOL_1_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_1_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_1_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_1_output_ref, MAXPOOL_1_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_2_s8(void)
{
    int8_t output[MAXPOOL_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_2_input;

    input_dims.n = MAXPOOL_2_INPUT_BATCHES;
    input_dims.w = MAXPOOL_2_INPUT_W;
    input_dims.h = MAXPOOL_2_INPUT_H;
    input_dims.c = MAXPOOL_2_IN_CH;
    filter_dims.w = MAXPOOL_2_FILTER_X;
    filter_dims.h = MAXPOOL_2_FILTER_Y;
    output_dims.w = MAXPOOL_2_OUTPUT_W;
    output_dims.h = MAXPOOL_2_OUTPUT_H;
    output_dims.c = MAXPOOL_2_OUT_CH;

    pool_params.padding.w = MAXPOOL_2_PAD_X;
    pool_params.padding.h = MAXPOOL_2_PAD_Y;
    pool_params.stride.w = MAXPOOL_2_STRIDE_X;
    pool_params.stride.h = MAXPOOL_2_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_2_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_2_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_2_output_ref, MAXPOOL_2_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_3_s8(void)
{
    int8_t output[MAXPOOL_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_3_input;

    input_dims.n = MAXPOOL_3_INPUT_BATCHES;
    input_dims.w = MAXPOOL_3_INPUT_W;
    input_dims.h = MAXPOOL_3_INPUT_H;
    input_dims.c = MAXPOOL_3_IN_CH;
    filter_dims.w = MAXPOOL_3_FILTER_X;
    filter_dims.h = MAXPOOL_3_FILTER_Y;
    output_dims.w = MAXPOOL_3_OUTPUT_W;
    output_dims.h = MAXPOOL_3_OUTPUT_H;
    output_dims.c = MAXPOOL_3_OUT_CH;

    pool_params.padding.w = MAXPOOL_3_PAD_X;
    pool_params.padding.h = MAXPOOL_3_PAD_Y;
    pool_params.stride.w = MAXPOOL_3_STRIDE_X;
    pool_params.stride.h = MAXPOOL_3_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_3_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_3_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_3_output_ref, MAXPOOL_3_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_4_s8(void)
{
    int8_t output[MAXPOOL_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_4_input;

    input_dims.n = MAXPOOL_4_INPUT_BATCHES;
    input_dims.w = MAXPOOL_4_INPUT_W;
    input_dims.h = MAXPOOL_4_INPUT_H;
    input_dims.c = MAXPOOL_4_IN_CH;
    filter_dims.w = MAXPOOL_4_FILTER_X;
    filter_dims.h = MAXPOOL_4_FILTER_Y;
    output_dims.w = MAXPOOL_4_OUTPUT_W;
    output_dims.h = MAXPOOL_4_OUTPUT_H;
    output_dims.c = MAXPOOL_4_OUT_CH;

    pool_params.padding.w = MAXPOOL_4_PAD_X;
    pool_params.padding.h = MAXPOOL_4_PAD_Y;
    pool_params.stride.w = MAXPOOL_4_STRIDE_X;
    pool_params.stride.h = MAXPOOL_4_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_4_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_4_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_4_output_ref, MAXPOOL_4_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_5_s8(void)
{
    int8_t output[MAXPOOL_5_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_5_input;

    input_dims.n = MAXPOOL_5_INPUT_BATCHES;
    input_dims.w = MAXPOOL_5_INPUT_W;
    input_dims.h = MAXPOOL_5_INPUT_H;
    input_dims.c = MAXPOOL_5_IN_CH;
    filter_dims.w = MAXPOOL_5_FILTER_X;
    filter_dims.h = MAXPOOL_5_FILTER_Y;
    output_dims.w = MAXPOOL_5_OUTPUT_W;
    output_dims.h = MAXPOOL_5_OUTPUT_H;
    output_dims.c = MAXPOOL_5_OUT_CH;

    pool_params.padding.w = MAXPOOL_5_PAD_X;
    pool_params.padding.h = MAXPOOL_5_PAD_Y;
    pool_params.stride.w = MAXPOOL_5_STRIDE_X;
    pool_params.stride.h = MAXPOOL_5_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_5_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_5_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_5_output_ref, MAXPOOL_5_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_6_s8(void)
{
    int8_t output[MAXPOOL_6_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_6_input;

    input_dims.n = MAXPOOL_6_INPUT_BATCHES;
    input_dims.w = MAXPOOL_6_INPUT_W;
    input_dims.h = MAXPOOL_6_INPUT_H;
    input_dims.c = MAXPOOL_6_IN_CH;
    filter_dims.w = MAXPOOL_6_FILTER_X;
    filter_dims.h = MAXPOOL_6_FILTER_Y;
    output_dims.w = MAXPOOL_6_OUTPUT_W;
    output_dims.h = MAXPOOL_6_OUTPUT_H;
    output_dims.c = MAXPOOL_6_OUT_CH;

    pool_params.padding.w = MAXPOOL_6_PAD_X;
    pool_params.padding.h = MAXPOOL_6_PAD_Y;
    pool_params.stride.w = MAXPOOL_6_STRIDE_X;
    pool_params.stride.h = MAXPOOL_6_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_6_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_6_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_6_output_ref, MAXPOOL_6_DST_SIZE, TOLERANCE));
    }
}

void test_muriscv_nn_maxpool_7_s8(void)
{
    int8_t output[MAXPOOL_7_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = maxpool_7_input;

    input_dims.n = MAXPOOL_7_INPUT_BATCHES;
    input_dims.w = MAXPOOL_7_INPUT_W;
    input_dims.h = MAXPOOL_7_INPUT_H;
    input_dims.c = MAXPOOL_7_IN_CH;
    filter_dims.w = MAXPOOL_7_FILTER_X;
    filter_dims.h = MAXPOOL_7_FILTER_Y;
    output_dims.w = MAXPOOL_7_OUTPUT_W;
    output_dims.h = MAXPOOL_7_OUTPUT_H;
    output_dims.c = MAXPOOL_7_OUT_CH;

    pool_params.padding.w = MAXPOOL_7_PAD_X;
    pool_params.padding.h = MAXPOOL_7_PAD_Y;
    pool_params.stride.w = MAXPOOL_7_STRIDE_X;
    pool_params.stride.h = MAXPOOL_7_STRIDE_Y;

    pool_params.activation.min = MAXPOOL_7_OUT_ACTIVATION_MIN;
    pool_params.activation.max = MAXPOOL_7_OUT_ACTIVATION_MAX;

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        muriscv_nn_status result =
            muriscv_nn_maxpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

        TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
        TEST_ASSERT_TRUE(validate(output, maxpool_7_output_ref, MAXPOOL_7_DST_SIZE, TOLERANCE));
    }
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_maxpool_0_s8);
    RUN_TEST(test_muriscv_nn_maxpool_1_s8);
    RUN_TEST(test_muriscv_nn_maxpool_2_s8);
    RUN_TEST(test_muriscv_nn_maxpool_3_s8);
    RUN_TEST(test_muriscv_nn_maxpool_4_s8);
    RUN_TEST(test_muriscv_nn_maxpool_5_s8);
    RUN_TEST(test_muriscv_nn_maxpool_6_s8);
    RUN_TEST(test_muriscv_nn_maxpool_7_s8);

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
