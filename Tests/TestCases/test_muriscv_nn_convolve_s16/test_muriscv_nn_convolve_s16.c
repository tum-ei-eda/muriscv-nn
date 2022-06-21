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

#include "../../TestData/test_muriscv_nn_convolve_s16/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_convolve_0_s16(void)
{
    q15_t output[CONV_0_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = conv_0_biases;
    const q7_t *kernel_data = conv_0_weights;
    const q15_t *input_data = conv_0_input;
    const q15_t *output_ref = conv_0_output_ref;

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

    int32_t buf_size = muriscv_nn_convolve_s16_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_0_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_0_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_convolve_1_s16(void)
{
    q15_t output[CONV_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = conv_1_biases;
    const q7_t *kernel_data = conv_1_weights;
    const q15_t *input_data = conv_1_input;
    const q15_t *output_ref = conv_1_output_ref;

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

    int32_t buf_size = muriscv_nn_convolve_s16_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_1_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_1_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_convolve_2_s16(void)
{
    q15_t output[CONV_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = conv_2_biases;
    const q7_t *kernel_data = conv_2_weights;
    const q15_t *input_data = conv_2_input;
    const q15_t *output_ref = conv_2_output_ref;

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

    int32_t buf_size = muriscv_nn_convolve_s16_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_2_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_2_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_convolve_3_s16(void)
{
    q15_t output[CONV_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = conv_3_biases;
    const q7_t *kernel_data = conv_3_weights;
    const q15_t *input_data = conv_3_input;
    const q15_t *output_ref = conv_3_output_ref;

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

    int32_t buf_size = muriscv_nn_convolve_s16_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_3_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_3_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_convolve_4_s16(void)
{
    q15_t output[CONV_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = conv_4_biases;
    const q7_t *kernel_data = conv_4_weights;
    const q15_t *input_data = conv_4_input;
    const q15_t *output_ref = conv_4_output_ref;

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

    int32_t buf_size = muriscv_nn_convolve_s16_get_buffer_size(&input_dims, &filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_4_DST_SIZE, TOLERANCE));

    buf_size = muriscv_nn_convolve_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_convolve_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, CONV_4_DST_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_convolve_0_s16);
    RUN_TEST(test_muriscv_nn_convolve_1_s16);
    RUN_TEST(test_muriscv_nn_convolve_2_s16);
    RUN_TEST(test_muriscv_nn_convolve_3_s16);
    RUN_TEST(test_muriscv_nn_convolve_4_s16);

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
