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

#include <muriscv_nn_functions.h>
#include <unity.h>

#include "../../TestData/dw_int16xint8/test_data.h"
#include "../../TestData/dw_int16xint8_dilation/test_data.h"
#include "../../TestData/dw_int16xint8_mult4/test_data.h"
#include "../../Utils/validate.h"

void dw_int16xint8_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[DW_INT16XINT8_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const int64_t *bias_data = dw_int16xint8_biases;
    const int16_t *input_data = dw_int16xint8_input;
    const int8_t *kernel_data = dw_int16xint8_weights;
    const int16_t *output_ref = dw_int16xint8_output_ref;
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
    if (ctx.buf)
    {
        // The caller is responsible to clear the scratch buffers for security reasons if applicable.
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
    memset(output, 0, sizeof(output));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);

    TEST_ASSERT_EQUAL(buf_size, 0);

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

    if (ctx.buf)
    {
        memset(ctx.buf, 0, buf_size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

void dw_int16xint8_dilation_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[DW_INT16XINT8_DILATION_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const int64_t *bias_data = dw_int16xint8_dilation_biases;
    const int16_t *input_data = dw_int16xint8_dilation_input;
    const int8_t *kernel_data = dw_int16xint8_dilation_weights;
    const int16_t *output_ref = dw_int16xint8_dilation_output_ref;
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

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
    memset(output, 0, sizeof(output));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);

    TEST_ASSERT_EQUAL(buf_size, 0);

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

    if (ctx.buf)
    {
        memset(ctx.buf, 0, buf_size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

void dw_int16xint8_mult4_muriscv_nn_depthwise_conv_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    int16_t output[DW_INT16XINT8_MULT4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_dw_conv_params dw_conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims = {};
    muriscv_nn_dims output_dims;

    const int64_t *bias_data = dw_int16xint8_mult4_biases;
    const int16_t *input_data = dw_int16xint8_mult4_input;
    const int8_t *kernel_data = dw_int16xint8_mult4_weights;
    const int16_t *output_ref = dw_int16xint8_mult4_output_ref;
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

    if (ctx.buf)
    {
        memset(ctx.buf, 0, ctx.size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
    memset(output, 0, sizeof(output));

    int buf_size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);

    TEST_ASSERT_EQUAL(buf_size, 0);

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

    if (ctx.buf)
    {
        memset(ctx.buf, 0, buf_size);
        free(ctx.buf);
    }
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, output_ref, output_ref_size));
}

void muriscv_nn_depthwise_conv_wrapper_s16_buffer(void)
{
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    muriscv_nn_dw_conv_params dw_conv_params;
    input_dims.n = DW_INT16XINT8_MULT4_INPUT_BATCHES;
    input_dims.w = DW_INT16XINT8_MULT4_INPUT_W;
    input_dims.h = DW_INT16XINT8_MULT4_INPUT_H;
    input_dims.c = DW_INT16XINT8_MULT4_IN_CH;
    filter_dims.w = DW_INT16XINT8_MULT4_FILTER_X;
    filter_dims.h = DW_INT16XINT8_MULT4_FILTER_Y;

    output_dims.w = DW_INT16XINT8_MULT4_OUTPUT_W;
    output_dims.h = DW_INT16XINT8_MULT4_OUTPUT_H;
    output_dims.c = input_dims.c;

    dw_conv_params.padding.w = DW_INT16XINT8_MULT4_PAD_X;
    dw_conv_params.padding.h = DW_INT16XINT8_MULT4_PAD_Y;
    dw_conv_params.stride.w = DW_INT16XINT8_MULT4_STRIDE_X;
    dw_conv_params.stride.h = DW_INT16XINT8_MULT4_STRIDE_Y;
    dw_conv_params.dilation.w = DW_INT16XINT8_MULT4_DILATION_X;
    dw_conv_params.dilation.h = DW_INT16XINT8_MULT4_DILATION_Y;
    dw_conv_params.ch_mult = output_dims.c / input_dims.c;

    int32_t size =
        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);

//#if defined(USE_PEXT)
//    TEST_ASSERT_TRUE(size > 0);
//#else
    TEST_ASSERT_TRUE(size == 0);
//#endif
    input_dims.c = 513;
    output_dims.c = input_dims.c;
    dw_conv_params.ch_mult = output_dims.c / input_dims.c;
    size = muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&dw_conv_params, &input_dims, &filter_dims, &output_dims);

//#if defined(USE_PEXT)
//    TEST_ASSERT_TRUE(size > 0);
//#else
    TEST_ASSERT_TRUE(size == 0);
//#endif
}

void buffer_size_mve_muriscv_nn_depthwise_conv_s16(void)
{
//#if defined(USE_VEXT)
//    muriscv_nn_dw_conv_params conv_params;
//    muriscv_nn_dims input_dims;
//    muriscv_nn_dims filter_dims;
//    muriscv_nn_dims output_dims;
//
//    input_dims.n = DW_INT16XINT8_MULT4_INPUT_BATCHES;
//    input_dims.w = DW_INT16XINT8_MULT4_INPUT_W;
//    input_dims.h = DW_INT16XINT8_MULT4_INPUT_H;
//    input_dims.c = DW_INT16XINT8_MULT4_IN_CH;
//    filter_dims.w = DW_INT16XINT8_MULT4_FILTER_X;
//    filter_dims.h = DW_INT16XINT8_MULT4_FILTER_Y;
//    output_dims.w = DW_INT16XINT8_MULT4_OUTPUT_W;
//    output_dims.h = DW_INT16XINT8_MULT4_OUTPUT_H;
//    output_dims.c = DW_INT16XINT8_MULT4_OUT_CH;
//
//    conv_params.padding.w = DW_INT16XINT8_MULT4_PAD_X;
//    conv_params.padding.h = DW_INT16XINT8_MULT4_PAD_Y;
//    conv_params.stride.w = DW_INT16XINT8_MULT4_STRIDE_X;
//    conv_params.stride.h = DW_INT16XINT8_MULT4_STRIDE_Y;
//    conv_params.dilation.w = DW_INT16XINT8_MULT4_DILATION_X;
//    conv_params.dilation.h = DW_INT16XINT8_MULT4_DILATION_Y;
//    conv_params.ch_mult = DW_INT16XINT8_MULT4_CH_MULT;
//    conv_params.input_offset = DW_INT16XINT8_MULT4_INPUT_OFFSET;
//    conv_params.output_offset = DW_INT16XINT8_MULT4_OUTPUT_OFFSET;
//    conv_params.activation.min = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MIN;
//    conv_params.activation.max = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MAX;
//
//    const int32_t wrapper_buf_size =
//        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
//    const int32_t mve_wrapper_buf_size =
//        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size_mve(&conv_params, &input_dims, &filter_dims, &output_dims);
//
//    TEST_ASSERT_EQUAL(wrapper_buf_size, mve_wrapper_buf_size);
//#endif
}

void buffer_size_dsp_muriscv_nn_depthwise_conv_s16(void)
{
//#if defined(USE_PEXT) && !defined(USE_VEXT)
//    muriscv_nn_dw_conv_params conv_params;
//    muriscv_nn_dims input_dims;
//    muriscv_nn_dims filter_dims;
//    muriscv_nn_dims output_dims;
//
//    input_dims.n = DW_INT16XINT8_MULT4_INPUT_BATCHES;
//    input_dims.w = DW_INT16XINT8_MULT4_INPUT_W;
//    input_dims.h = DW_INT16XINT8_MULT4_INPUT_H;
//    input_dims.c = DW_INT16XINT8_MULT4_IN_CH;
//    filter_dims.w = DW_INT16XINT8_MULT4_FILTER_X;
//    filter_dims.h = DW_INT16XINT8_MULT4_FILTER_Y;
//    output_dims.w = DW_INT16XINT8_MULT4_OUTPUT_W;
//    output_dims.h = DW_INT16XINT8_MULT4_OUTPUT_H;
//    output_dims.c = DW_INT16XINT8_MULT4_OUT_CH;
//
//    conv_params.padding.w = DW_INT16XINT8_MULT4_PAD_X;
//    conv_params.padding.h = DW_INT16XINT8_MULT4_PAD_Y;
//    conv_params.stride.w = DW_INT16XINT8_MULT4_STRIDE_X;
//    conv_params.stride.h = DW_INT16XINT8_MULT4_STRIDE_Y;
//    conv_params.dilation.w = DW_INT16XINT8_MULT4_DILATION_X;
//    conv_params.dilation.h = DW_INT16XINT8_MULT4_DILATION_Y;
//
//    conv_params.ch_mult = DW_INT16XINT8_MULT4_CH_MULT;
//
//    conv_params.input_offset = DW_INT16XINT8_MULT4_INPUT_OFFSET;
//    conv_params.output_offset = DW_INT16XINT8_MULT4_OUTPUT_OFFSET;
//    conv_params.activation.min = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MIN;
//    conv_params.activation.max = DW_INT16XINT8_MULT4_OUT_ACTIVATION_MAX;
//
//    const int32_t wrapper_buf_size =
//        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size(&conv_params, &input_dims, &filter_dims, &output_dims);
//    const int32_t dsp_wrapper_buf_size =
//        muriscv_nn_depthwise_conv_wrapper_s16_get_buffer_size_dsp(&conv_params, &input_dims, &filter_dims, &output_dims);
//
//    TEST_ASSERT_EQUAL(wrapper_buf_size, dsp_wrapper_buf_size);
//#endif
}
