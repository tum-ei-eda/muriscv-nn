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

#include "../../TestData/test_muriscv_nn_avgpool_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_avgpool_0_s8(void)
{
    int8_t output[AVGPOOL_0_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_0_input;

    input_dims.n = AVGPOOL_0_INPUT_BATCHES;
    input_dims.w = AVGPOOL_0_INPUT_W;
    input_dims.h = AVGPOOL_0_INPUT_H;
    input_dims.c = AVGPOOL_0_IN_CH;
    filter_dims.w = AVGPOOL_0_FILTER_X;
    filter_dims.h = AVGPOOL_0_FILTER_Y;
    output_dims.w = AVGPOOL_0_OUTPUT_W;
    output_dims.h = AVGPOOL_0_OUTPUT_H;
    output_dims.c = AVGPOOL_0_OUT_CH;

    pool_params.padding.w = AVGPOOL_0_PAD_X;
    pool_params.padding.h = AVGPOOL_0_PAD_Y;
    pool_params.stride.w = AVGPOOL_0_STRIDE_X;
    pool_params.stride.h = AVGPOOL_0_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_0_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_0_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_0_OUTPUT_W, AVGPOOL_0_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_0_output_ref, AVGPOOL_0_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_avgpool_1_s8(void)
{
    int8_t output[AVGPOOL_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_1_input;

    input_dims.n = AVGPOOL_1_INPUT_BATCHES;
    input_dims.w = AVGPOOL_1_INPUT_W;
    input_dims.h = AVGPOOL_1_INPUT_H;
    input_dims.c = AVGPOOL_1_IN_CH;
    filter_dims.w = AVGPOOL_1_FILTER_X;
    filter_dims.h = AVGPOOL_1_FILTER_Y;
    output_dims.w = AVGPOOL_1_OUTPUT_W;
    output_dims.h = AVGPOOL_1_OUTPUT_H;
    output_dims.c = AVGPOOL_1_OUT_CH;

    pool_params.padding.w = AVGPOOL_1_PAD_X;
    pool_params.padding.h = AVGPOOL_1_PAD_Y;
    pool_params.stride.w = AVGPOOL_1_STRIDE_X;
    pool_params.stride.h = AVGPOOL_1_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_1_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_1_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_1_OUTPUT_W, AVGPOOL_1_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_1_output_ref, AVGPOOL_1_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_avgpool_2_s8(void)
{
    int8_t output[AVGPOOL_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_2_input;

    input_dims.n = AVGPOOL_2_INPUT_BATCHES;
    input_dims.w = AVGPOOL_2_INPUT_W;
    input_dims.h = AVGPOOL_2_INPUT_H;
    input_dims.c = AVGPOOL_2_IN_CH;
    filter_dims.w = AVGPOOL_2_FILTER_X;
    filter_dims.h = AVGPOOL_2_FILTER_Y;
    output_dims.w = AVGPOOL_2_OUTPUT_W;
    output_dims.h = AVGPOOL_2_OUTPUT_H;
    output_dims.c = AVGPOOL_2_OUT_CH;

    pool_params.padding.w = AVGPOOL_2_PAD_X;
    pool_params.padding.h = AVGPOOL_2_PAD_Y;
    pool_params.stride.w = AVGPOOL_2_STRIDE_X;
    pool_params.stride.h = AVGPOOL_2_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_2_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_2_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_2_OUTPUT_W, AVGPOOL_2_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_2_output_ref, AVGPOOL_2_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_avgpool_3_s8(void)
{
    int8_t output[AVGPOOL_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_3_input;

    input_dims.n = AVGPOOL_3_INPUT_BATCHES;
    input_dims.w = AVGPOOL_3_INPUT_W;
    input_dims.h = AVGPOOL_3_INPUT_H;
    input_dims.c = AVGPOOL_3_IN_CH;
    filter_dims.w = AVGPOOL_3_FILTER_X;
    filter_dims.h = AVGPOOL_3_FILTER_Y;
    output_dims.w = AVGPOOL_3_OUTPUT_W;
    output_dims.h = AVGPOOL_3_OUTPUT_H;
    output_dims.c = AVGPOOL_3_OUT_CH;

    pool_params.padding.w = AVGPOOL_3_PAD_X;
    pool_params.padding.h = AVGPOOL_3_PAD_Y;
    pool_params.stride.w = AVGPOOL_3_STRIDE_X;
    pool_params.stride.h = AVGPOOL_3_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_3_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_3_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_3_OUTPUT_W, AVGPOOL_3_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_3_output_ref, AVGPOOL_3_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_avgpool_4_s8(void)
{
    int8_t output[AVGPOOL_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_4_input;

    input_dims.n = AVGPOOL_4_INPUT_BATCHES;
    input_dims.w = AVGPOOL_4_INPUT_W;
    input_dims.h = AVGPOOL_4_INPUT_H;
    input_dims.c = AVGPOOL_4_IN_CH;
    filter_dims.w = AVGPOOL_4_FILTER_X;
    filter_dims.h = AVGPOOL_4_FILTER_Y;
    output_dims.w = AVGPOOL_4_OUTPUT_W;
    output_dims.h = AVGPOOL_4_OUTPUT_H;
    output_dims.c = AVGPOOL_4_OUT_CH;

    pool_params.padding.w = AVGPOOL_4_PAD_X;
    pool_params.padding.h = AVGPOOL_4_PAD_Y;
    pool_params.stride.w = AVGPOOL_4_STRIDE_X;
    pool_params.stride.h = AVGPOOL_4_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_4_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_4_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_4_OUTPUT_W, AVGPOOL_4_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_4_output_ref, AVGPOOL_4_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_avgpool_5_s8(void)
{
    int8_t output[AVGPOOL_5_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int8_t *input_data = avgpool_5_input;

    input_dims.n = AVGPOOL_5_INPUT_BATCHES;
    input_dims.w = AVGPOOL_5_INPUT_W;
    input_dims.h = AVGPOOL_5_INPUT_H;
    input_dims.c = AVGPOOL_5_IN_CH;
    filter_dims.w = AVGPOOL_5_FILTER_X;
    filter_dims.h = AVGPOOL_5_FILTER_Y;
    output_dims.w = AVGPOOL_5_OUTPUT_W;
    output_dims.h = AVGPOOL_5_OUTPUT_H;
    output_dims.c = AVGPOOL_5_OUT_CH;

    pool_params.padding.w = AVGPOOL_5_PAD_X;
    pool_params.padding.h = AVGPOOL_5_PAD_Y;
    pool_params.stride.w = AVGPOOL_5_STRIDE_X;
    pool_params.stride.h = AVGPOOL_5_STRIDE_Y;

    pool_params.activation.min = AVGPOOL_5_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOL_5_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s8_get_buffer_size(AVGPOOL_5_OUTPUT_W, AVGPOOL_5_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s8(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, avgpool_5_output_ref, AVGPOOL_5_DST_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_avgpool_0_s8);
    RUN_TEST(test_muriscv_nn_avgpool_1_s8);
    RUN_TEST(test_muriscv_nn_avgpool_2_s8);
    RUN_TEST(test_muriscv_nn_avgpool_3_s8);
    RUN_TEST(test_muriscv_nn_avgpool_4_s8);
    RUN_TEST(test_muriscv_nn_avgpool_5_s8);

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
