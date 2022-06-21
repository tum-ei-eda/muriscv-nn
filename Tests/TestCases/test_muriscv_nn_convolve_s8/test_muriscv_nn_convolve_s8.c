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

#include "../../TestData/test_muriscv_nn_convolve_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

// BASIC
void test_muriscv_nn_convolve_0_s8(void)
{
    q7_t output[CONV_0_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_0_biases;
    const q7_t *kernel_data = conv_0_weights;
    const q7_t *input_data = conv_0_input;
    const q7_t *output_ref = conv_0_output_ref;

    input_dims.n = CONV_0_INPUT_BATCHES;
    input_dims.w = CONV_0_INPUT_W;
    input_dims.h = CONV_0_INPUT_H;
    input_dims.c = CONV_0_IN_CH;
    filter_dims.w = CONV_0_FILTER_X;
    filter_dims.h = CONV_0_FILTER_Y;
    output_dims.w = CONV_0_OUTPUT_W;
    output_dims.h = CONV_0_OUTPUT_H;
    output_dims.c = CONV_0_OUT_CH;

    conv_params.padding.w = CONV_0_PAD_X;
    conv_params.padding.h = CONV_0_PAD_Y;
    conv_params.stride.w = CONV_0_STRIDE_X;
    conv_params.stride.h = CONV_0_STRIDE_Y;

    conv_params.dilation.w = CONV_0_DILATION_X;
    conv_params.dilation.h = CONV_0_DILATION_Y;

    conv_params.input_offset = CONV_0_INPUT_OFFSET;
    conv_params.output_offset = CONV_0_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_0_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_0_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_0_output_mult;
    quant_params.shift = (int32_t *)conv_0_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_0_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_0_DST_SIZE, TOLERANCE));
}

// STRIDE2PAD1
void test_muriscv_nn_convolve_1_s8(void)
{
    q7_t output[CONV_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_1_biases;
    const q7_t *kernel_data = conv_1_weights;
    const q7_t *input_data = conv_1_input;
    const q7_t *output_ref = conv_1_output_ref;

    input_dims.n = CONV_1_INPUT_BATCHES;
    input_dims.w = CONV_1_INPUT_W;
    input_dims.h = CONV_1_INPUT_H;
    input_dims.c = CONV_1_IN_CH;
    filter_dims.w = CONV_1_FILTER_X;
    filter_dims.h = CONV_1_FILTER_Y;
    output_dims.w = CONV_1_OUTPUT_W;
    output_dims.h = CONV_1_OUTPUT_H;
    output_dims.c = CONV_1_OUT_CH;

    conv_params.padding.w = CONV_1_PAD_X;
    conv_params.padding.h = CONV_1_PAD_Y;
    conv_params.stride.w = CONV_1_STRIDE_X;
    conv_params.stride.h = CONV_1_STRIDE_Y;

    conv_params.dilation.w = CONV_1_DILATION_X;
    conv_params.dilation.h = CONV_1_DILATION_Y;

    conv_params.input_offset = CONV_1_INPUT_OFFSET;
    conv_params.output_offset = CONV_1_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_1_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_1_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_1_output_mult;
    quant_params.shift = (int32_t *)conv_1_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_1_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_1_DST_SIZE, TOLERANCE));
}

// CONV_2
void test_muriscv_nn_convolve_2_s8(void)
{
    q7_t output[CONV_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_2_biases;
    const q7_t *kernel_data = conv_2_weights;
    const q7_t *input_data = conv_2_input;
    const q7_t *output_ref = conv_2_output_ref;

    input_dims.n = CONV_2_INPUT_BATCHES;
    input_dims.w = CONV_2_INPUT_W;
    input_dims.h = CONV_2_INPUT_H;
    input_dims.c = CONV_2_IN_CH;
    filter_dims.w = CONV_2_FILTER_X;
    filter_dims.h = CONV_2_FILTER_Y;
    output_dims.w = CONV_2_OUTPUT_W;
    output_dims.h = CONV_2_OUTPUT_H;
    output_dims.c = CONV_2_OUT_CH;

    conv_params.padding.w = CONV_2_PAD_X;
    conv_params.padding.h = CONV_2_PAD_Y;
    conv_params.stride.w = CONV_2_STRIDE_X;
    conv_params.stride.h = CONV_2_STRIDE_Y;

    conv_params.dilation.w = CONV_2_DILATION_X;
    conv_params.dilation.h = CONV_2_DILATION_Y;

    conv_params.input_offset = CONV_2_INPUT_OFFSET;
    conv_params.output_offset = CONV_2_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_2_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_2_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_2_output_mult;
    quant_params.shift = (int32_t *)conv_2_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_2_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_2_DST_SIZE, TOLERANCE));
}

// CONV_3
void test_muriscv_nn_convolve_3_s8(void)
{
    q7_t output[CONV_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_3_biases;
    const q7_t *kernel_data = conv_3_weights;
    const q7_t *input_data = conv_3_input;
    const q7_t *output_ref = conv_3_output_ref;

    input_dims.n = CONV_3_INPUT_BATCHES;
    input_dims.w = CONV_3_INPUT_W;
    input_dims.h = CONV_3_INPUT_H;
    input_dims.c = CONV_3_IN_CH;
    filter_dims.w = CONV_3_FILTER_X;
    filter_dims.h = CONV_3_FILTER_Y;
    output_dims.w = CONV_3_OUTPUT_W;
    output_dims.h = CONV_3_OUTPUT_H;
    output_dims.c = CONV_3_OUT_CH;

    conv_params.padding.w = CONV_3_PAD_X;
    conv_params.padding.h = CONV_3_PAD_Y;
    conv_params.stride.w = CONV_3_STRIDE_X;
    conv_params.stride.h = CONV_3_STRIDE_Y;

    conv_params.dilation.w = CONV_3_DILATION_X;
    conv_params.dilation.h = CONV_3_DILATION_Y;

    conv_params.input_offset = CONV_3_INPUT_OFFSET;
    conv_params.output_offset = CONV_3_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_3_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_3_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_3_output_mult;
    quant_params.shift = (int32_t *)conv_3_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_3_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_3_DST_SIZE, TOLERANCE));
}

// CONV_4
void test_muriscv_nn_convolve_4_s8(void)
{
    q7_t output[CONV_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_4_biases;
    const q7_t *kernel_data = conv_4_weights;
    const q7_t *input_data = conv_4_input;
    const q7_t *output_ref = conv_4_output_ref;

    input_dims.n = CONV_4_INPUT_BATCHES;
    input_dims.w = CONV_4_INPUT_W;
    input_dims.h = CONV_4_INPUT_H;
    input_dims.c = CONV_4_IN_CH;
    filter_dims.w = CONV_4_FILTER_X;
    filter_dims.h = CONV_4_FILTER_Y;
    output_dims.w = CONV_4_OUTPUT_W;
    output_dims.h = CONV_4_OUTPUT_H;
    output_dims.c = CONV_4_OUT_CH;

    conv_params.padding.w = CONV_4_PAD_X;
    conv_params.padding.h = CONV_4_PAD_Y;
    conv_params.stride.w = CONV_4_STRIDE_X;
    conv_params.stride.h = CONV_4_STRIDE_Y;

    conv_params.dilation.w = CONV_4_DILATION_X;
    conv_params.dilation.h = CONV_4_DILATION_Y;

    conv_params.input_offset = CONV_4_INPUT_OFFSET;
    conv_params.output_offset = CONV_4_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_4_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_4_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_4_output_mult;
    quant_params.shift = (int32_t *)conv_4_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_4_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_4_DST_SIZE, TOLERANCE));
}

// CONV_2X2_DILATION
void test_muriscv_nn_convolve_5_s8(void)
{
    q7_t output[CONV_5_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_5_biases;
    const q7_t *kernel_data = conv_5_weights;
    const q7_t *input_data = conv_5_input;
    const q7_t *output_ref = conv_5_output_ref;

    input_dims.n = CONV_5_INPUT_BATCHES;
    input_dims.w = CONV_5_INPUT_W;
    input_dims.h = CONV_5_INPUT_H;
    input_dims.c = CONV_5_IN_CH;
    filter_dims.w = CONV_5_FILTER_X;
    filter_dims.h = CONV_5_FILTER_Y;
    output_dims.w = CONV_5_OUTPUT_W;
    output_dims.h = CONV_5_OUTPUT_H;
    output_dims.c = CONV_5_OUT_CH;

    conv_params.padding.w = CONV_5_PAD_X;
    conv_params.padding.h = CONV_5_PAD_Y;
    conv_params.stride.w = CONV_5_STRIDE_X;
    conv_params.stride.h = CONV_5_STRIDE_Y;

    conv_params.dilation.w = CONV_5_DILATION_X;
    conv_params.dilation.h = CONV_5_DILATION_Y;

    conv_params.input_offset = CONV_5_INPUT_OFFSET;
    conv_params.output_offset = CONV_5_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_5_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_5_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_5_output_mult;
    quant_params.shift = (int32_t *)conv_5_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_5_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_5_DST_SIZE, TOLERANCE));
}

// CONV_2X2_DILATION_5X5
void test_muriscv_nn_convolve_6_s8(void)
{
    q7_t output[CONV_6_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_6_biases;
    const q7_t *kernel_data = conv_6_weights;
    const q7_t *input_data = conv_6_input;
    const q7_t *output_ref = conv_6_output_ref;

    input_dims.n = CONV_6_INPUT_BATCHES;
    input_dims.w = CONV_6_INPUT_W;
    input_dims.h = CONV_6_INPUT_H;
    input_dims.c = CONV_6_IN_CH;
    filter_dims.w = CONV_6_FILTER_X;
    filter_dims.h = CONV_6_FILTER_Y;
    output_dims.w = CONV_6_OUTPUT_W;
    output_dims.h = CONV_6_OUTPUT_H;
    output_dims.c = CONV_6_OUT_CH;

    conv_params.padding.w = CONV_6_PAD_X;
    conv_params.padding.h = CONV_6_PAD_Y;
    conv_params.stride.w = CONV_6_STRIDE_X;
    conv_params.stride.h = CONV_6_STRIDE_Y;

    conv_params.dilation.w = CONV_6_DILATION_X;
    conv_params.dilation.h = CONV_6_DILATION_Y;

    conv_params.input_offset = CONV_6_INPUT_OFFSET;
    conv_params.output_offset = CONV_6_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_6_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_6_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_6_output_mult;
    quant_params.shift = (int32_t *)conv_6_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_6_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_6_DST_SIZE, TOLERANCE));
}

// CONV_3X3_DILATION_5X5
void test_muriscv_nn_convolve_7_s8(void)
{
    q7_t output[CONV_7_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_7_biases;
    const q7_t *kernel_data = conv_7_weights;
    const q7_t *input_data = conv_7_input;
    const q7_t *output_ref = conv_7_output_ref;

    input_dims.n = CONV_7_INPUT_BATCHES;
    input_dims.w = CONV_7_INPUT_W;
    input_dims.h = CONV_7_INPUT_H;
    input_dims.c = CONV_7_IN_CH;
    filter_dims.w = CONV_7_FILTER_X;
    filter_dims.h = CONV_7_FILTER_Y;
    output_dims.w = CONV_7_OUTPUT_W;
    output_dims.h = CONV_7_OUTPUT_H;
    output_dims.c = CONV_7_OUT_CH;

    conv_params.padding.w = CONV_7_PAD_X;
    conv_params.padding.h = CONV_7_PAD_Y;
    conv_params.stride.w = CONV_7_STRIDE_X;
    conv_params.stride.h = CONV_7_STRIDE_Y;

    conv_params.dilation.w = CONV_7_DILATION_X;
    conv_params.dilation.h = CONV_7_DILATION_Y;

    conv_params.input_offset = CONV_7_INPUT_OFFSET;
    conv_params.output_offset = CONV_7_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_7_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_7_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_7_output_mult;
    quant_params.shift = (int32_t *)conv_7_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_7_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_7_DST_SIZE, TOLERANCE));
}

// CONV_2X3_DILATION
void test_muriscv_nn_convolve_8_s8(void)
{
    q7_t output[CONV_8_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_8_biases;
    const q7_t *kernel_data = conv_8_weights;
    const q7_t *input_data = conv_8_input;
    const q7_t *output_ref = conv_8_output_ref;

    input_dims.n = CONV_8_INPUT_BATCHES;
    input_dims.w = CONV_8_INPUT_W;
    input_dims.h = CONV_8_INPUT_H;
    input_dims.c = CONV_8_IN_CH;
    filter_dims.w = CONV_8_FILTER_X;
    filter_dims.h = CONV_8_FILTER_Y;
    output_dims.w = CONV_8_OUTPUT_W;
    output_dims.h = CONV_8_OUTPUT_H;
    output_dims.c = CONV_8_OUT_CH;

    conv_params.padding.w = CONV_8_PAD_X;
    conv_params.padding.h = CONV_8_PAD_Y;
    conv_params.stride.w = CONV_8_STRIDE_X;
    conv_params.stride.h = CONV_8_STRIDE_Y;

    conv_params.dilation.w = CONV_8_DILATION_X;
    conv_params.dilation.h = CONV_8_DILATION_Y;

    conv_params.input_offset = CONV_8_INPUT_OFFSET;
    conv_params.output_offset = CONV_8_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_8_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_8_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_8_output_mult;
    quant_params.shift = (int32_t *)conv_8_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_8_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_8_DST_SIZE, TOLERANCE));
}

// CONV_3X2_DILATION
void test_muriscv_nn_convolve_9_s8(void)
{
    q7_t output[CONV_9_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_9_biases;
    const q7_t *kernel_data = conv_9_weights;
    const q7_t *input_data = conv_9_input;
    const q7_t *output_ref = conv_9_output_ref;

    input_dims.n = CONV_9_INPUT_BATCHES;
    input_dims.w = CONV_9_INPUT_W;
    input_dims.h = CONV_9_INPUT_H;
    input_dims.c = CONV_9_IN_CH;
    filter_dims.w = CONV_9_FILTER_X;
    filter_dims.h = CONV_9_FILTER_Y;
    output_dims.w = CONV_9_OUTPUT_W;
    output_dims.h = CONV_9_OUTPUT_H;
    output_dims.c = CONV_9_OUT_CH;

    conv_params.padding.w = CONV_9_PAD_X;
    conv_params.padding.h = CONV_9_PAD_Y;
    conv_params.stride.w = CONV_9_STRIDE_X;
    conv_params.stride.h = CONV_9_STRIDE_Y;

    conv_params.dilation.w = CONV_9_DILATION_X;
    conv_params.dilation.h = CONV_9_DILATION_Y;

    conv_params.input_offset = CONV_9_INPUT_OFFSET;
    conv_params.output_offset = CONV_9_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_9_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_9_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_9_output_mult;
    quant_params.shift = (int32_t *)conv_9_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_9_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_9_DST_SIZE, TOLERANCE));
}

// CONV_DILATION_GOLDEN
void test_muriscv_nn_convolve_10_s8(void)
{
    q7_t output[CONV_10_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_10_biases;
    const q7_t *kernel_data = conv_10_weights;
    const q7_t *input_data = conv_10_input;
    const q7_t *output_ref = conv_10_output_ref;

    input_dims.n = CONV_10_INPUT_BATCHES;
    input_dims.w = CONV_10_INPUT_W;
    input_dims.h = CONV_10_INPUT_H;
    input_dims.c = CONV_10_IN_CH;
    filter_dims.w = CONV_10_FILTER_X;
    filter_dims.h = CONV_10_FILTER_Y;
    output_dims.w = CONV_10_OUTPUT_W;
    output_dims.h = CONV_10_OUTPUT_H;
    output_dims.c = CONV_10_OUT_CH;

    conv_params.padding.w = CONV_10_PAD_X;
    conv_params.padding.h = CONV_10_PAD_Y;
    conv_params.stride.w = CONV_10_STRIDE_X;
    conv_params.stride.h = CONV_10_STRIDE_Y;

    conv_params.dilation.w = CONV_10_DILATION_X;
    conv_params.dilation.h = CONV_10_DILATION_Y;

    conv_params.input_offset = CONV_10_INPUT_OFFSET;
    conv_params.output_offset = CONV_10_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_10_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_10_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_10_output_mult;
    quant_params.shift = (int32_t *)conv_10_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_10_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_10_DST_SIZE, TOLERANCE));
}

// CONV_1_X_N_1
void test_muriscv_nn_convolve_11_s8(void)
{
    q7_t output[CONV_11_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_11_biases;
    const q7_t *kernel_data = conv_11_weights;
    const q7_t *input_data = conv_11_input;
    const q7_t *output_ref = conv_11_output_ref;

    input_dims.n = CONV_11_INPUT_BATCHES;
    input_dims.w = CONV_11_INPUT_W;
    input_dims.h = CONV_11_INPUT_H;
    input_dims.c = CONV_11_IN_CH;
    filter_dims.w = CONV_11_FILTER_X;
    filter_dims.h = CONV_11_FILTER_Y;
    output_dims.w = CONV_11_OUTPUT_W;
    output_dims.h = CONV_11_OUTPUT_H;
    output_dims.c = CONV_11_OUT_CH;

    conv_params.padding.w = CONV_11_PAD_X;
    conv_params.padding.h = CONV_11_PAD_Y;
    conv_params.stride.w = CONV_11_STRIDE_X;
    conv_params.stride.h = CONV_11_STRIDE_Y;

    conv_params.dilation.w = CONV_11_DILATION_X;
    conv_params.dilation.h = CONV_11_DILATION_Y;

    conv_params.input_offset = CONV_11_INPUT_OFFSET;
    conv_params.output_offset = CONV_11_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_11_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_11_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_11_output_mult;
    quant_params.shift = (int32_t *)conv_11_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_11_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_11_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_1_x_n_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_1_x_n_s8(&ctx,
                                          &conv_params,
                                          &quant_params,
                                          &input_dims,
                                          input_data,
                                          &filter_dims,
                                          kernel_data,
                                          &bias_dims,
                                          bias_data,
                                          &output_dims,
                                          output);
    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_ARG_ERROR, result);
}

// CONV_1_X_N_2
void test_muriscv_nn_convolve_12_s8(void)
{
    q7_t output[CONV_12_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_12_biases;
    const q7_t *kernel_data = conv_12_weights;
    const q7_t *input_data = conv_12_input;
    const q7_t *output_ref = conv_12_output_ref;

    input_dims.n = CONV_12_INPUT_BATCHES;
    input_dims.w = CONV_12_INPUT_W;
    input_dims.h = CONV_12_INPUT_H;
    input_dims.c = CONV_12_IN_CH;
    filter_dims.w = CONV_12_FILTER_X;
    filter_dims.h = CONV_12_FILTER_Y;
    output_dims.w = CONV_12_OUTPUT_W;
    output_dims.h = CONV_12_OUTPUT_H;
    output_dims.c = CONV_12_OUT_CH;

    conv_params.padding.w = CONV_12_PAD_X;
    conv_params.padding.h = CONV_12_PAD_Y;
    conv_params.stride.w = CONV_12_STRIDE_X;
    conv_params.stride.h = CONV_12_STRIDE_Y;

    conv_params.dilation.w = CONV_12_DILATION_X;
    conv_params.dilation.h = CONV_12_DILATION_Y;

    conv_params.input_offset = CONV_12_INPUT_OFFSET;
    conv_params.output_offset = CONV_12_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_12_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_12_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_12_output_mult;
    quant_params.shift = (int32_t *)conv_12_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_12_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_12_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_1_x_n_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_1_x_n_s8(&ctx,
                                          &conv_params,
                                          &quant_params,
                                          &input_dims,
                                          input_data,
                                          &filter_dims,
                                          kernel_data,
                                          &bias_dims,
                                          bias_data,
                                          &output_dims,
                                          output);
    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_ARG_ERROR, result);
}

// CONV_1_X_N_3
void test_muriscv_nn_convolve_13_s8(void)
{
    q7_t output[CONV_13_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_13_biases;
    const q7_t *kernel_data = conv_13_weights;
    const q7_t *input_data = conv_13_input;
    const q7_t *output_ref = conv_13_output_ref;

    input_dims.n = CONV_13_INPUT_BATCHES;
    input_dims.w = CONV_13_INPUT_W;
    input_dims.h = CONV_13_INPUT_H;
    input_dims.c = CONV_13_IN_CH;
    filter_dims.w = CONV_13_FILTER_X;
    filter_dims.h = CONV_13_FILTER_Y;
    output_dims.w = CONV_13_OUTPUT_W;
    output_dims.h = CONV_13_OUTPUT_H;
    output_dims.c = CONV_13_OUT_CH;

    conv_params.padding.w = CONV_13_PAD_X;
    conv_params.padding.h = CONV_13_PAD_Y;
    conv_params.stride.w = CONV_13_STRIDE_X;
    conv_params.stride.h = CONV_13_STRIDE_Y;

    conv_params.dilation.w = CONV_13_DILATION_X;
    conv_params.dilation.h = CONV_13_DILATION_Y;

    conv_params.input_offset = CONV_13_INPUT_OFFSET;
    conv_params.output_offset = CONV_13_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_13_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_13_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_13_output_mult;
    quant_params.shift = (int32_t *)conv_13_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_13_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_13_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_1_x_n_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_1_x_n_s8(&ctx,
                                          &conv_params,
                                          &quant_params,
                                          &input_dims,
                                          input_data,
                                          &filter_dims,
                                          kernel_data,
                                          &bias_dims,
                                          bias_data,
                                          &output_dims,
                                          output);
    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_ARG_ERROR, result);
}

// CONV_OUT_ACTIVATION
void test_muriscv_nn_convolve_14_s8(void)
{
    q7_t output[CONV_14_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_14_biases;
    const q7_t *kernel_data = conv_14_weights;
    const q7_t *input_data = conv_14_input;
    const q7_t *output_ref = conv_14_output_ref;

    input_dims.n = CONV_14_INPUT_BATCHES;
    input_dims.w = CONV_14_INPUT_W;
    input_dims.h = CONV_14_INPUT_H;
    input_dims.c = CONV_14_IN_CH;
    filter_dims.w = CONV_14_FILTER_X;
    filter_dims.h = CONV_14_FILTER_Y;
    output_dims.w = CONV_14_OUTPUT_W;
    output_dims.h = CONV_14_OUTPUT_H;
    output_dims.c = CONV_14_OUT_CH;

    conv_params.padding.w = CONV_14_PAD_X;
    conv_params.padding.h = CONV_14_PAD_Y;
    conv_params.stride.w = CONV_14_STRIDE_X;
    conv_params.stride.h = CONV_14_STRIDE_Y;

    conv_params.dilation.w = CONV_14_DILATION_X;
    conv_params.dilation.h = CONV_14_DILATION_Y;

    conv_params.input_offset = CONV_14_INPUT_OFFSET;
    conv_params.output_offset = CONV_14_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_14_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_14_OUT_ACTIVATION_MAX;

    quant_params.multiplier = (int32_t *)conv_14_output_mult;
    quant_params.shift = (int32_t *)conv_14_output_shift;

    int32_t buf_size = muriscv_nn_convolve_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s8(&ctx,
                                                      &conv_params,
                                                      &quant_params,
                                                      &input_dims,
                                                      input_data,
                                                      &filter_dims,
                                                      kernel_data,
                                                      &bias_dims,
                                                      bias_data,
                                                      &output_dims,
                                                      output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_14_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s8_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s8(&ctx,
                                            &conv_params,
                                            &quant_params,
                                            &input_dims,
                                            input_data,
                                            &filter_dims,
                                            kernel_data,
                                            &bias_dims,
                                            bias_data,
                                            &output_dims,
                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, output_ref, CONV_14_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_1_x_n_s8_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_1_x_n_s8(&ctx,
                                          &conv_params,
                                          &quant_params,
                                          &input_dims,
                                          input_data,
                                          &filter_dims,
                                          kernel_data,
                                          &bias_dims,
                                          bias_data,
                                          &output_dims,
                                          output);
    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_ARG_ERROR, result);
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_convolve_0_s8);
    RUN_TEST(test_muriscv_nn_convolve_1_s8);
    RUN_TEST(test_muriscv_nn_convolve_2_s8);
    RUN_TEST(test_muriscv_nn_convolve_3_s8);
    RUN_TEST(test_muriscv_nn_convolve_4_s8);
    RUN_TEST(test_muriscv_nn_convolve_5_s8);
    RUN_TEST(test_muriscv_nn_convolve_6_s8);
    RUN_TEST(test_muriscv_nn_convolve_7_s8);
    RUN_TEST(test_muriscv_nn_convolve_8_s8);
    RUN_TEST(test_muriscv_nn_convolve_9_s8);
    RUN_TEST(test_muriscv_nn_convolve_10_s8);
    RUN_TEST(test_muriscv_nn_convolve_11_s8);
    RUN_TEST(test_muriscv_nn_convolve_12_s8);
    RUN_TEST(test_muriscv_nn_convolve_13_s8);
    RUN_TEST(test_muriscv_nn_convolve_14_s8);

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
