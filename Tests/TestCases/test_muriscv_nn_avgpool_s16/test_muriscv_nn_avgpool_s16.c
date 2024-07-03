// Modifications copyright (C) 2024 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2010-2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
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

#include "muriscv_nn_functions.h"
#include "unity.h"

#include "../../TestData/avgpooling_int16/test_data.h"
#include "../../TestData/avgpooling_int16_1/test_data.h"
#include "../../TestData/avgpooling_int16_2/test_data.h"
#include "../../TestData/avgpooling_int16_3/test_data.h"
#include "../../Utils/validate.h"

void avgpooling_int16_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[AVGPOOLING_INT16_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = avgpooling_int16_input;

    input_dims.n = AVGPOOLING_INT16_INPUT_BATCHES;
    input_dims.w = AVGPOOLING_INT16_INPUT_W;
    input_dims.h = AVGPOOLING_INT16_INPUT_H;
    input_dims.c = AVGPOOLING_INT16_IN_CH;
    filter_dims.w = AVGPOOLING_INT16_FILTER_X;
    filter_dims.h = AVGPOOLING_INT16_FILTER_Y;
    output_dims.w = AVGPOOLING_INT16_OUTPUT_W;
    output_dims.h = AVGPOOLING_INT16_OUTPUT_H;
    output_dims.c = AVGPOOLING_INT16_OUT_CH;

    pool_params.padding.w = AVGPOOLING_INT16_PAD_X;
    pool_params.padding.h = AVGPOOLING_INT16_PAD_Y;
    pool_params.stride.w = AVGPOOLING_INT16_STRIDE_X;
    pool_params.stride.h = AVGPOOLING_INT16_STRIDE_Y;

    pool_params.activation.min = AVGPOOLING_INT16_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOLING_INT16_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_OUTPUT_W, AVGPOOLING_INT16_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    if (ctx.buf)
    {
        // The caller is responsible to clear the scratch buffers for security reasons if applicable.
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, avgpooling_int16_output_ref, AVGPOOLING_INT16_DST_SIZE));
}

void avgpooling_int16_1_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[AVGPOOLING_INT16_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = avgpooling_int16_1_input;

    input_dims.n = AVGPOOLING_INT16_1_INPUT_BATCHES;
    input_dims.w = AVGPOOLING_INT16_1_INPUT_W;
    input_dims.h = AVGPOOLING_INT16_1_INPUT_H;
    input_dims.c = AVGPOOLING_INT16_1_IN_CH;
    filter_dims.w = AVGPOOLING_INT16_1_FILTER_X;
    filter_dims.h = AVGPOOLING_INT16_1_FILTER_Y;
    output_dims.w = AVGPOOLING_INT16_1_OUTPUT_W;
    output_dims.h = AVGPOOLING_INT16_1_OUTPUT_H;
    output_dims.c = AVGPOOLING_INT16_1_OUT_CH;

    pool_params.padding.w = AVGPOOLING_INT16_1_PAD_X;
    pool_params.padding.h = AVGPOOLING_INT16_1_PAD_Y;
    pool_params.stride.w = AVGPOOLING_INT16_1_STRIDE_X;
    pool_params.stride.h = AVGPOOLING_INT16_1_STRIDE_Y;

    pool_params.activation.min = AVGPOOLING_INT16_1_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOLING_INT16_1_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_1_OUTPUT_W, AVGPOOLING_INT16_1_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, avgpooling_int16_1_output_ref, AVGPOOLING_INT16_1_DST_SIZE));
}

void avgpooling_int16_2_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[AVGPOOLING_INT16_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = avgpooling_int16_2_input;

    input_dims.n = AVGPOOLING_INT16_2_INPUT_BATCHES;
    input_dims.w = AVGPOOLING_INT16_2_INPUT_W;
    input_dims.h = AVGPOOLING_INT16_2_INPUT_H;
    input_dims.c = AVGPOOLING_INT16_2_IN_CH;
    filter_dims.w = AVGPOOLING_INT16_2_FILTER_X;
    filter_dims.h = AVGPOOLING_INT16_2_FILTER_Y;
    output_dims.w = AVGPOOLING_INT16_2_OUTPUT_W;
    output_dims.h = AVGPOOLING_INT16_2_OUTPUT_H;
    output_dims.c = AVGPOOLING_INT16_2_OUT_CH;

    pool_params.padding.w = AVGPOOLING_INT16_2_PAD_X;
    pool_params.padding.h = AVGPOOLING_INT16_2_PAD_Y;
    pool_params.stride.w = AVGPOOLING_INT16_2_STRIDE_X;
    pool_params.stride.h = AVGPOOLING_INT16_2_STRIDE_Y;

    pool_params.activation.min = AVGPOOLING_INT16_2_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOLING_INT16_2_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_2_OUTPUT_W, AVGPOOLING_INT16_2_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, avgpooling_int16_2_output_ref, AVGPOOLING_INT16_2_DST_SIZE));
}

void avgpooling_int16_3_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[AVGPOOLING_INT16_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = avgpooling_int16_3_input;

    input_dims.n = AVGPOOLING_INT16_3_INPUT_BATCHES;
    input_dims.w = AVGPOOLING_INT16_3_INPUT_W;
    input_dims.h = AVGPOOLING_INT16_3_INPUT_H;
    input_dims.c = AVGPOOLING_INT16_3_IN_CH;
    filter_dims.w = AVGPOOLING_INT16_3_FILTER_X;
    filter_dims.h = AVGPOOLING_INT16_3_FILTER_Y;
    output_dims.w = AVGPOOLING_INT16_3_OUTPUT_W;
    output_dims.h = AVGPOOLING_INT16_3_OUTPUT_H;
    output_dims.c = AVGPOOLING_INT16_3_OUT_CH;

    pool_params.padding.w = AVGPOOLING_INT16_3_PAD_X;
    pool_params.padding.h = AVGPOOLING_INT16_3_PAD_Y;
    pool_params.stride.w = AVGPOOLING_INT16_3_STRIDE_X;
    pool_params.stride.h = AVGPOOLING_INT16_3_STRIDE_Y;

    pool_params.activation.min = AVGPOOLING_INT16_3_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOLING_INT16_3_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, avgpooling_int16_3_output_ref, AVGPOOLING_INT16_3_DST_SIZE));
}

void buffer_size_mve_muriscv_nn_avgpool_s16(void)
{
//#if defined(USE_VEXT)
//    const int32_t buf_size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
//    const int32_t mve_buf_size =
//        muriscv_nn_avgpool_s16_get_buffer_size_mve(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
//
//    TEST_ASSERT_EQUAL(buf_size, mve_buf_size);
//#endif
}

void buffer_size_dsp_muriscv_nn_avgpool_s16(void)
{
//#if defined(USE_PEXT) && !defined(USE_VEXT)
//    const int32_t buf_size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
//    const int32_t dsp_buf_size =
//        muriscv_nn_avgpool_s16_get_buffer_size_dsp(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
//
//    TEST_ASSERT_EQUAL(buf_size, dsp_buf_size);
//#endif
}

void avgpooling_int16_param_fail_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_ARG_ERROR;
    int16_t output[AVGPOOLING_INT16_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const int16_t *input_data = avgpooling_int16_3_input;

    input_dims.n = 0;
    input_dims.w = AVGPOOLING_INT16_3_INPUT_W;
    input_dims.h = AVGPOOLING_INT16_3_INPUT_H;
    input_dims.c = AVGPOOLING_INT16_3_IN_CH;
    filter_dims.w = AVGPOOLING_INT16_3_FILTER_X;
    filter_dims.h = AVGPOOLING_INT16_3_FILTER_Y;
    output_dims.w = AVGPOOLING_INT16_3_OUTPUT_W;
    output_dims.h = AVGPOOLING_INT16_3_OUTPUT_H;
    output_dims.c = AVGPOOLING_INT16_3_OUT_CH;

    pool_params.padding.w = AVGPOOLING_INT16_3_PAD_X;
    pool_params.padding.h = AVGPOOLING_INT16_3_PAD_Y;
    pool_params.stride.w = AVGPOOLING_INT16_3_STRIDE_X;
    pool_params.stride.h = AVGPOOLING_INT16_3_STRIDE_Y;

    pool_params.activation.min = AVGPOOLING_INT16_3_OUT_ACTIVATION_MIN;
    pool_params.activation.max = AVGPOOLING_INT16_3_OUT_ACTIVATION_MAX;

    ctx.size = muriscv_nn_avgpool_s16_get_buffer_size(AVGPOOLING_INT16_3_OUTPUT_W, AVGPOOLING_INT16_3_IN_CH);
    ctx.buf = malloc(ctx.size);

    muriscv_nn_status result =
        muriscv_nn_avgpool_s16(&ctx, &pool_params, &input_dims, input_data, &filter_dims, &output_dims, output);

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
}
