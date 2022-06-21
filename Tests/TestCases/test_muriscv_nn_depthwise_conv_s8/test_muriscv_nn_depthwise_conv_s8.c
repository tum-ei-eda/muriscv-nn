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

#include "../../TestData/test_muriscv_nn_depthwise_conv_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

const int32_t *get_bias_address(const int32_t *bias, int32_t size)
{
    const int32_t *return_bias = NULL;
    for (int i = 0; i < size; i++)
    {
        if (bias[i] != 0)
        {
            return_bias = bias;
            break;
        }
    }
    return return_bias;
}

// BASIC
void test_muriscv_nn_depthwise_conv_0_s8(void)
{
    q7_t output[DEPTHWISE_CONV_0_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_0_biases, DEPTHWISE_CONV_0_OUT_CH);
    const q7_t *input_data = depthwise_conv_0_input;

    input_dims.n = DEPTHWISE_CONV_0_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_0_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_0_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_0_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_0_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_0_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_0_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_0_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_0_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_0_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_0_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_0_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_0_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_0_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_0_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_0_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_0_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_0_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_0_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_0_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_0_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_0_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_0_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_0_output_ref, DEPTHWISE_CONV_0_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_0_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_0_output_ref, DEPTHWISE_CONV_0_DST_SIZE, TOLERANCE));
}

// STRIDE2PAD1
void test_muriscv_nn_depthwise_conv_1_s8(void)
{
    q7_t output[DEPTHWISE_CONV_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_1_biases, DEPTHWISE_CONV_1_OUT_CH);
    const q7_t *input_data = depthwise_conv_1_input;

    input_dims.n = DEPTHWISE_CONV_1_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_1_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_1_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_1_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_1_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_1_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_1_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_1_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_1_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_1_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_1_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_1_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_1_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_1_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_1_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_1_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_1_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_1_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_1_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_1_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_1_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_1_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_1_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_1_output_ref, DEPTHWISE_CONV_1_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_1_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_1_output_ref, DEPTHWISE_CONV_1_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_2
void test_muriscv_nn_depthwise_conv_2_s8(void)
{
    q7_t output[DEPTHWISE_CONV_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_2_biases, DEPTHWISE_CONV_2_OUT_CH);
    const q7_t *input_data = depthwise_conv_2_input;

    input_dims.n = DEPTHWISE_CONV_2_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_2_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_2_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_2_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_2_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_2_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_2_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_2_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_2_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_2_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_2_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_2_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_2_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_2_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_2_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_2_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_2_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_2_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_2_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_2_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_2_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_2_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_2_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_2_output_ref, DEPTHWISE_CONV_2_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_2_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_2_output_ref, DEPTHWISE_CONV_2_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_OUT_ACTIVATION
void test_muriscv_nn_depthwise_conv_3_s8(void)
{
    q7_t output[DEPTHWISE_CONV_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_3_biases, DEPTHWISE_CONV_3_OUT_CH);
    const q7_t *input_data = depthwise_conv_3_input;

    input_dims.n = DEPTHWISE_CONV_3_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_3_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_3_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_3_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_3_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_3_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_3_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_3_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_3_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_3_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_3_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_3_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_3_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_3_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_3_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_3_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_3_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_3_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_3_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_3_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_3_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_3_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_3_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_3_output_ref, DEPTHWISE_CONV_3_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_3_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_3_output_ref, DEPTHWISE_CONV_3_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_MULT_BATCHES
void test_muriscv_nn_depthwise_conv_4_s8(void)
{
    q7_t output[DEPTHWISE_CONV_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_4_biases, DEPTHWISE_CONV_4_OUT_CH);
    const q7_t *input_data = depthwise_conv_4_input;

    input_dims.n = DEPTHWISE_CONV_4_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_4_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_4_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_4_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_4_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_4_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_4_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_4_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_4_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_4_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_4_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_4_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_4_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_4_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_4_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_4_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_4_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_4_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_4_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_4_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_4_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_4_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_4_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_4_output_ref, DEPTHWISE_CONV_4_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_4_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_4_output_ref, DEPTHWISE_CONV_4_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_NULL_BIAS_0
void test_muriscv_nn_depthwise_conv_5_s8(void)
{
    q7_t output[DEPTHWISE_CONV_5_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_5_biases, DEPTHWISE_CONV_5_OUT_CH);
    const q7_t *input_data = depthwise_conv_5_input;

    input_dims.n = DEPTHWISE_CONV_5_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_5_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_5_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_5_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_5_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_5_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_5_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_5_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_5_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_5_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_5_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_5_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_5_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_5_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_5_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_5_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_5_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_5_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_5_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_5_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_5_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_5_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_5_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_5_output_ref, DEPTHWISE_CONV_5_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_5_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_5_output_ref, DEPTHWISE_CONV_5_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_NULL_BIAS_1
void test_muriscv_nn_depthwise_conv_6_s8(void)
{
    q7_t output[DEPTHWISE_CONV_6_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_6_biases, DEPTHWISE_CONV_6_OUT_CH);
    const q7_t *input_data = depthwise_conv_6_input;

    input_dims.n = DEPTHWISE_CONV_6_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_6_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_6_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_6_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_6_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_6_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_6_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_6_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_6_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_6_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_6_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_6_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_6_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_6_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_6_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_6_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_6_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_6_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_6_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_6_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_6_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_6_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_6_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_6_output_ref, DEPTHWISE_CONV_6_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_6_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_6_output_ref, DEPTHWISE_CONV_6_DST_SIZE, TOLERANCE));
}

// DEPTHWISE_DILATION
void test_muriscv_nn_depthwise_conv_7_s8(void)
{
    q7_t output[DEPTHWISE_CONV_7_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = get_bias_address(depthwise_conv_7_biases, DEPTHWISE_CONV_7_OUT_CH);
    const q7_t *input_data = depthwise_conv_7_input;

    input_dims.n = DEPTHWISE_CONV_7_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_CONV_7_INPUT_W;
    input_dims.h = DEPTHWISE_CONV_7_INPUT_H;
    input_dims.c = DEPTHWISE_CONV_7_IN_CH;
    filter_dims.w = DEPTHWISE_CONV_7_FILTER_X;
    filter_dims.h = DEPTHWISE_CONV_7_FILTER_Y;
    output_dims.w = DEPTHWISE_CONV_7_OUTPUT_W;
    output_dims.h = DEPTHWISE_CONV_7_OUTPUT_H;
    output_dims.c = DEPTHWISE_CONV_7_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_CONV_7_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_CONV_7_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_CONV_7_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_CONV_7_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_CONV_7_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_CONV_7_DILATION_Y;
    dw_conv_params.ch_mult = DEPTHWISE_CONV_7_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_CONV_7_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_CONV_7_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_CONV_7_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_CONV_7_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_conv_7_output_mult;
    quant_params.shift = (int32_t *)depthwise_conv_7_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s8(&ctx,
                                                            &dw_conv_params,
                                                            &quant_params,
                                                            &input_dims,
                                                            input_data,
                                                            &filter_dims,
                                                            depthwise_conv_7_weights,
                                                            &bias_dims,
                                                            bias_data,
                                                            &output_dims,
                                                            output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_7_output_ref, DEPTHWISE_CONV_7_DST_SIZE, TOLERANCE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    TEST_ASSERT_EQUAL(0, buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
                                                  &quant_params,
                                                  &input_dims,
                                                  input_data,
                                                  &filter_dims,
                                                  depthwise_conv_7_weights,
                                                  &bias_dims,
                                                  bias_data,
                                                  &output_dims,
                                                  output);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_conv_7_output_ref, DEPTHWISE_CONV_7_DST_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_depthwise_conv_0_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_1_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_2_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_3_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_4_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_5_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_6_s8);
    RUN_TEST(test_muriscv_nn_depthwise_conv_7_s8);

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
