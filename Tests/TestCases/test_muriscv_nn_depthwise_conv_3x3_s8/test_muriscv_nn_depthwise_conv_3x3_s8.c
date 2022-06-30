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

#include "../../TestData/depthwise_kernel_3x3/test_data.h"
#include "../../Utils/validate.h"

static const uint16_t dilation = 1;

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q7_t output[DEPTHWISE_KERNEL_3X3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = depthwise_kernel_3x3_biases;
    const q7_t *kernel_data = depthwise_kernel_3x3_weights;
    const q7_t *input_data = depthwise_kernel_3x3_input;

    input_dims.n = DEPTHWISE_KERNEL_3X3_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_KERNEL_3X3_INPUT_W;
    input_dims.h = DEPTHWISE_KERNEL_3X3_INPUT_H;
    input_dims.c = DEPTHWISE_KERNEL_3X3_IN_CH;
    filter_dims.w = DEPTHWISE_KERNEL_3X3_FILTER_X;
    filter_dims.h = DEPTHWISE_KERNEL_3X3_FILTER_Y;
    output_dims.w = DEPTHWISE_KERNEL_3X3_OUTPUT_W;
    output_dims.h = DEPTHWISE_KERNEL_3X3_OUTPUT_H;
    output_dims.c = DEPTHWISE_KERNEL_3X3_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_KERNEL_3X3_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_KERNEL_3X3_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_KERNEL_3X3_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_KERNEL_3X3_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_KERNEL_3X3_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_KERNEL_3X3_DILATION_Y;

    dw_conv_params.ch_mult = DEPTHWISE_KERNEL_3X3_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_KERNEL_3X3_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_KERNEL_3X3_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_kernel_3x3_output_mult;
    quant_params.shift = (int32_t *)depthwise_kernel_3x3_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_3x3_s8(&ctx,
                                                                &dw_conv_params,
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
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_kernel_3x3_output_ref, DEPTHWISE_KERNEL_3X3_DST_SIZE));

    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;
    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
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
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, depthwise_kernel_3x3_output_ref, DEPTHWISE_KERNEL_3X3_DST_SIZE));
}

void depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_1_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_ARG_ERROR;
    q7_t output[DEPTHWISE_KERNEL_3X3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = depthwise_kernel_3x3_biases;
    const q7_t *kernel_data = depthwise_kernel_3x3_weights;
    const q7_t *input_data = depthwise_kernel_3x3_input;

    input_dims.n = DEPTHWISE_KERNEL_3X3_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_KERNEL_3X3_INPUT_W;
    input_dims.h = DEPTHWISE_KERNEL_3X3_INPUT_H;
    input_dims.c = DEPTHWISE_KERNEL_3X3_IN_CH;
    filter_dims.w = DEPTHWISE_KERNEL_3X3_FILTER_X;
    filter_dims.h = DEPTHWISE_KERNEL_3X3_FILTER_Y;
    output_dims.w = DEPTHWISE_KERNEL_3X3_OUTPUT_W;
    output_dims.h = DEPTHWISE_KERNEL_3X3_OUTPUT_H;
    output_dims.c = DEPTHWISE_KERNEL_3X3_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_KERNEL_3X3_PAD_X + 2;
    dw_conv_params.padding.h = DEPTHWISE_KERNEL_3X3_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_KERNEL_3X3_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_KERNEL_3X3_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_KERNEL_3X3_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_KERNEL_3X3_DILATION_Y;

    dw_conv_params.ch_mult = DEPTHWISE_KERNEL_3X3_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_KERNEL_3X3_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_KERNEL_3X3_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_kernel_3x3_output_mult;
    quant_params.shift = (int32_t *)depthwise_kernel_3x3_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_3x3_s8(&ctx,
                                                                &dw_conv_params,
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
    TEST_ASSERT_EQUAL(expected, result);

    const muriscv_nn_status expected_wrapper = MURISCV_NN_SUCCESS;
    const int32_t buf_size =
        muriscv_nn_depthwise_conv_wrapper_s8_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    result = muriscv_nn_depthwise_conv_wrapper_s8(&ctx,
                                                  &dw_conv_params,
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
    TEST_ASSERT_EQUAL(expected_wrapper, result);
}

void depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_2_s8(void)
{
    const muriscv_nn_status expected = MURISCV_NN_ARG_ERROR;
    q7_t output[DEPTHWISE_KERNEL_3X3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = depthwise_kernel_3x3_biases;
    const q7_t *kernel_data = depthwise_kernel_3x3_weights;
    const q7_t *input_data = depthwise_kernel_3x3_input;

    input_dims.n = DEPTHWISE_KERNEL_3X3_INPUT_BATCHES;
    input_dims.w = DEPTHWISE_KERNEL_3X3_INPUT_W;
    input_dims.h = DEPTHWISE_KERNEL_3X3_INPUT_H;
    input_dims.c = DEPTHWISE_KERNEL_3X3_IN_CH;
    filter_dims.w = DEPTHWISE_KERNEL_3X3_FILTER_X + 1;
    filter_dims.h = DEPTHWISE_KERNEL_3X3_FILTER_Y;
    output_dims.w = DEPTHWISE_KERNEL_3X3_OUTPUT_W;
    output_dims.h = DEPTHWISE_KERNEL_3X3_OUTPUT_H;
    output_dims.c = DEPTHWISE_KERNEL_3X3_OUT_CH;

    dw_conv_params.padding.w = DEPTHWISE_KERNEL_3X3_PAD_X;
    dw_conv_params.padding.h = DEPTHWISE_KERNEL_3X3_PAD_Y;
    dw_conv_params.stride.w = DEPTHWISE_KERNEL_3X3_STRIDE_X;
    dw_conv_params.stride.h = DEPTHWISE_KERNEL_3X3_STRIDE_Y;
    dw_conv_params.dilation.w = DEPTHWISE_KERNEL_3X3_DILATION_X;
    dw_conv_params.dilation.h = DEPTHWISE_KERNEL_3X3_DILATION_Y;

    dw_conv_params.ch_mult = DEPTHWISE_KERNEL_3X3_CH_MULT;

    dw_conv_params.input_offset = DEPTHWISE_KERNEL_3X3_INPUT_OFFSET;
    dw_conv_params.output_offset = DEPTHWISE_KERNEL_3X3_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DEPTHWISE_KERNEL_3X3_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)depthwise_kernel_3x3_output_mult;
    quant_params.shift = (int32_t *)depthwise_kernel_3x3_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_3x3_s8(&ctx,
                                                                &dw_conv_params,
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
    TEST_ASSERT_EQUAL(expected, result);
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_s8);
    RUN_TEST(depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_1_s8);
    RUN_TEST(depthwise_kernel_3x3_muriscv_nn_depthwise_conv_3x3_2_s8);

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
