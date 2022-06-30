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

#include "../../TestData/dw_int16xint8/test_data.h"
#include "../../TestData/dw_int16xint8_dilation/test_data.h"
#include "../../TestData/dw_int16xint8_mult4/test_data.h"
#include "../../Utils/validate.h"

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void dw_int16xint8_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q15_t output[DW_INT16XINT8_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = dw_int16xint8_biases;
    const q15_t *input_data = dw_int16xint8_input;
    const q7_t *kernel_data = dw_int16xint8_weights;
    const q15_t *output_ref = dw_int16xint8_output_ref;
    const int32_t output_ref_size = DW_INT16XINT8_DST_SIZE;

    input_dims.n = DW_INT16XINT8_INPUT_BATCHES;
    input_dims.w = DW_INT16XINT8_INPUT_W;
    input_dims.h = DW_INT16XINT8_INPUT_H;
    input_dims.c = DW_INT16XINT8_IN_CH;
    filter_dims.w = DW_INT16XINT8_FILTER_X;
    filter_dims.h = DW_INT16XINT8_FILTER_Y;
    output_dims.w = DW_INT16XINT8_OUTPUT_W;
    output_dims.h = DW_INT16XINT8_OUTPUT_H;
    output_dims.c = DW_INT16XINT8_OUT_CH;

    dw_conv_params.padding.w = DW_INT16XINT8_PAD_X;
    dw_conv_params.padding.h = DW_INT16XINT8_PAD_Y;
    dw_conv_params.stride.w = DW_INT16XINT8_STRIDE_X;
    dw_conv_params.stride.h = DW_INT16XINT8_STRIDE_Y;
    dw_conv_params.dilation.w = DW_INT16XINT8_DILATION_X;
    dw_conv_params.dilation.h = DW_INT16XINT8_DILATION_Y;

    dw_conv_params.ch_mult = DW_INT16XINT8_CH_MULT;

    dw_conv_params.input_offset = DW_INT16XINT8_INPUT_OFFSET;
    dw_conv_params.output_offset = DW_INT16XINT8_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DW_INT16XINT8_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DW_INT16XINT8_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)dw_int16xint8_output_mult;
    quant_params.shift = (int32_t *)dw_int16xint8_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s16(&ctx,
                                                             &dw_conv_params,
                                                             &quant_params,
                                                             &input_dims,
                                                             input_data,
                                                             &filter_dims,
                                                             dw_int16xint8_weights,
                                                             &bias_dims,
                                                             bias_data,
                                                             &output_dims,
                                                             output);
    free(ctx.buf);
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

void dw_int16xint8_dilation_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q15_t output[DW_INT16XINT8_DILATION_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = dw_int16xint8_dilation_biases;
    const q15_t *input_data = dw_int16xint8_dilation_input;
    const q7_t *kernel_data = dw_int16xint8_dilation_weights;
    const q15_t *output_ref = dw_int16xint8_dilation_output_ref;
    const int32_t output_ref_size = DW_INT16XINT8_DILATION_DST_SIZE;

    input_dims.n = DW_INT16XINT8_DILATION_INPUT_BATCHES;
    input_dims.w = DW_INT16XINT8_DILATION_INPUT_W;
    input_dims.h = DW_INT16XINT8_DILATION_INPUT_H;
    input_dims.c = DW_INT16XINT8_DILATION_IN_CH;
    filter_dims.w = DW_INT16XINT8_DILATION_FILTER_X;
    filter_dims.h = DW_INT16XINT8_DILATION_FILTER_Y;
    output_dims.w = DW_INT16XINT8_DILATION_OUTPUT_W;
    output_dims.h = DW_INT16XINT8_DILATION_OUTPUT_H;
    output_dims.c = DW_INT16XINT8_DILATION_OUT_CH;

    dw_conv_params.padding.w = DW_INT16XINT8_DILATION_PAD_X;
    dw_conv_params.padding.h = DW_INT16XINT8_DILATION_PAD_Y;
    dw_conv_params.stride.w = DW_INT16XINT8_DILATION_STRIDE_X;
    dw_conv_params.stride.h = DW_INT16XINT8_DILATION_STRIDE_Y;
    dw_conv_params.dilation.w = DW_INT16XINT8_DILATION_DILATION_X;
    dw_conv_params.dilation.h = DW_INT16XINT8_DILATION_DILATION_Y;

    dw_conv_params.ch_mult = DW_INT16XINT8_DILATION_CH_MULT;

    dw_conv_params.input_offset = DW_INT16XINT8_DILATION_INPUT_OFFSET;
    dw_conv_params.output_offset = DW_INT16XINT8_DILATION_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DW_INT16XINT8_DILATION_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DW_INT16XINT8_DILATION_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)dw_int16xint8_dilation_output_mult;
    quant_params.shift = (int32_t *)dw_int16xint8_dilation_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s16(&ctx,
                                                             &dw_conv_params,
                                                             &quant_params,
                                                             &input_dims,
                                                             input_data,
                                                             &filter_dims,
                                                             dw_int16xint8_dilation_weights,
                                                             &bias_dims,
                                                             bias_data,
                                                             &output_dims,
                                                             output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

void dw_int16xint8_mult4_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q15_t output[DW_INT16XINT8_MULT4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const q63_t *bias_data = dw_int16xint8_mult4_biases;
    const q15_t *input_data = dw_int16xint8_mult4_input;
    const q7_t *kernel_data = dw_int16xint8_mult4_weights;
    const q15_t *output_ref = dw_int16xint8_mult4_output_ref;
    const int32_t output_ref_size = DW_INT16XINT8_MULT4_DST_SIZE;

    input_dims.n = DW_INT16XINT8_MULT4_INPUT_BATCHES;
    input_dims.w = DW_INT16XINT8_MULT4_INPUT_W;
    input_dims.h = DW_INT16XINT8_MULT4_INPUT_H;
    input_dims.c = DW_INT16XINT8_MULT4_IN_CH;
    filter_dims.w = DW_INT16XINT8_MULT4_FILTER_X;
    filter_dims.h = DW_INT16XINT8_MULT4_FILTER_Y;
    output_dims.w = DW_INT16XINT8_MULT4_OUTPUT_W;
    output_dims.h = DW_INT16XINT8_MULT4_OUTPUT_H;
    output_dims.c = DW_INT16XINT8_MULT4_OUT_CH;

    dw_conv_params.padding.w = DW_INT16XINT8_MULT4_PAD_X;
    dw_conv_params.padding.h = DW_INT16XINT8_MULT4_PAD_Y;
    dw_conv_params.stride.w = DW_INT16XINT8_MULT4_STRIDE_X;
    dw_conv_params.stride.h = DW_INT16XINT8_MULT4_STRIDE_Y;
    dw_conv_params.dilation.w = DW_INT16XINT8_MULT4_DILATION_X;
    dw_conv_params.dilation.h = DW_INT16XINT8_MULT4_DILATION_Y;

    dw_conv_params.ch_mult = DW_INT16XINT8_MULT4_CH_MULT;

    dw_conv_params.input_offset = DW_INT16XINT8_MULT4_INPUT_OFFSET;
    dw_conv_params.output_offset = DW_INT16XINT8_MULT4_OUTPUT_OFFSET;
    dw_conv_params.activation.min = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MIN;
    dw_conv_params.activation.max = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)dw_int16xint8_mult4_output_mult;
    quant_params.shift = (int32_t *)dw_int16xint8_mult4_output_shift;

    ctx.buf = NULL;
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_depthwise_conv_s16(&ctx,
                                                             &dw_conv_params,
                                                             &quant_params,
                                                             &input_dims,
                                                             input_data,
                                                             &filter_dims,
                                                             dw_int16xint8_mult4_weights,
                                                             &bias_dims,
                                                             bias_data,
                                                             &output_dims,
                                                             output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);
    ctx.buf = malloc(buf_size);

    result = muriscv_nn_depthwise_conv_wrapper_s16(&ctx,
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
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(dw_int16xint8_muriscv_nn_depthwise_conv_s16);
    RUN_TEST(dw_int16xint8_dilation_muriscv_nn_depthwise_conv_s16);
    RUN_TEST(dw_int16xint8_mult4_muriscv_nn_depthwise_conv_s16);

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
