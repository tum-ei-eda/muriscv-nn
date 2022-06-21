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

#include "../../TestData/test_muriscv_nn_fully_connected_s8/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void test_muriscv_nn_fully_connected_1_s8(void)
{
    q7_t output[FC_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_fc_params fc_params;
    muriscv_nn_per_tensor_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = fc_1_biases;
    const q7_t *kernel_data = fc_1_weights;
    const q7_t *input_data = fc_1_input;

    input_dims.n = FC_1_INPUT_BATCHES;
    input_dims.w = FC_1_INPUT_W;
    input_dims.h = FC_1_INPUT_H;
    input_dims.c = FC_1_IN_CH;
    filter_dims.n = FC_1_ACCUMULATION_DEPTH;
    filter_dims.c = FC_1_OUT_CH;
    output_dims.n = FC_1_INPUT_BATCHES;
    output_dims.c = FC_1_OUT_CH;

    fc_params.input_offset = FC_1_INPUT_OFFSET;
    fc_params.filter_offset = 0;
    fc_params.output_offset = FC_1_OUTPUT_OFFSET;
    fc_params.activation.min = FC_1_OUT_ACTIVATION_MIN;
    fc_params.activation.max = FC_1_OUT_ACTIVATION_MAX;

    quant_params.multiplier = FC_1_OUTPUT_MULTIPLIER;
    quant_params.shift = FC_1_OUTPUT_SHIFT;

    int32_t buf_size = muriscv_nn_fully_connected_s8_get_buffer_size(&filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

    muriscv_nn_status result = muriscv_nn_fully_connected_s8(&ctx,
                                                             &fc_params,
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
    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate(output, fc_1_output_ref, FC_1_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_fully_connected_2_s8(void)
{
    q7_t output[FC_2_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_fc_params fc_params;
    muriscv_nn_per_tensor_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = fc_2_biases;
    const q7_t *kernel_data = fc_2_weights;
    const q7_t *input_data = fc_2_input;

    input_dims.n = FC_2_INPUT_BATCHES;
    input_dims.w = FC_2_INPUT_W;
    input_dims.h = FC_2_INPUT_H;
    input_dims.c = FC_2_IN_CH;
    filter_dims.n = FC_2_ACCUMULATION_DEPTH;
    filter_dims.c = FC_2_OUT_CH;
    output_dims.n = FC_2_INPUT_BATCHES;
    output_dims.c = FC_2_OUT_CH;

    fc_params.input_offset = FC_2_INPUT_OFFSET;
    fc_params.filter_offset = 0;
    fc_params.output_offset = FC_2_OUTPUT_OFFSET;
    fc_params.activation.min = FC_2_OUT_ACTIVATION_MIN;
    fc_params.activation.max = FC_2_OUT_ACTIVATION_MAX;

    quant_params.multiplier = FC_2_OUTPUT_MULTIPLIER;
    quant_params.shift = FC_2_OUTPUT_SHIFT;

    int32_t buf_size = muriscv_nn_fully_connected_s8_get_buffer_size(&filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

    muriscv_nn_status result = muriscv_nn_fully_connected_s8(&ctx,
                                                             &fc_params,
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
    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate(output, fc_2_output_ref, FC_2_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_fully_connected_3_s8(void)
{
    q7_t output[FC_3_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_fc_params fc_params;
    muriscv_nn_per_tensor_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = fc_3_biases;
    const q7_t *kernel_data = fc_3_weights;
    const q7_t *input_data = fc_3_input;

    input_dims.n = FC_3_INPUT_BATCHES;
    input_dims.w = FC_3_INPUT_W;
    input_dims.h = FC_3_INPUT_H;
    input_dims.c = FC_3_IN_CH;
    filter_dims.n = FC_3_ACCUMULATION_DEPTH;
    filter_dims.c = FC_3_OUT_CH;
    output_dims.n = FC_3_INPUT_BATCHES;
    output_dims.c = FC_3_OUT_CH;

    fc_params.input_offset = FC_3_INPUT_OFFSET;
    fc_params.filter_offset = 0;
    fc_params.output_offset = FC_3_OUTPUT_OFFSET;
    fc_params.activation.min = FC_3_OUT_ACTIVATION_MIN;
    fc_params.activation.max = FC_3_OUT_ACTIVATION_MAX;

    quant_params.multiplier = FC_3_OUTPUT_MULTIPLIER;
    quant_params.shift = FC_3_OUTPUT_SHIFT;

    int32_t buf_size = muriscv_nn_fully_connected_s8_get_buffer_size(&filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

    muriscv_nn_status result = muriscv_nn_fully_connected_s8(&ctx,
                                                             &fc_params,
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
    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate(output, fc_3_output_ref, FC_3_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_fully_connected_4_s8(void)
{
    q7_t output[FC_4_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_fc_params fc_params;
    muriscv_nn_per_tensor_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = fc_4_biases;
    const q7_t *kernel_data = fc_4_weights;
    const q7_t *input_data = fc_4_input;

    input_dims.n = FC_4_INPUT_BATCHES;
    input_dims.w = FC_4_INPUT_W;
    input_dims.h = FC_4_INPUT_H;
    input_dims.c = FC_4_IN_CH;
    filter_dims.n = FC_4_ACCUMULATION_DEPTH;
    filter_dims.c = FC_4_OUT_CH;
    output_dims.n = FC_4_INPUT_BATCHES;
    output_dims.c = FC_4_OUT_CH;

    fc_params.input_offset = FC_4_INPUT_OFFSET;
    fc_params.filter_offset = 0;
    fc_params.output_offset = FC_4_OUTPUT_OFFSET;
    fc_params.activation.min = FC_4_OUT_ACTIVATION_MIN;
    fc_params.activation.max = FC_4_OUT_ACTIVATION_MAX;

    quant_params.multiplier = FC_4_OUTPUT_MULTIPLIER;
    quant_params.shift = FC_4_OUTPUT_SHIFT;

    int32_t buf_size = muriscv_nn_fully_connected_s8_get_buffer_size(&filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

    muriscv_nn_status result = muriscv_nn_fully_connected_s8(&ctx,
                                                             &fc_params,
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
    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate(output, fc_4_output_ref, FC_4_DST_SIZE, TOLERANCE));
}

void test_muriscv_nn_fully_connected_5_s8(void)
{
    q7_t output[FC_5_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_fc_params fc_params;
    muriscv_nn_per_tensor_quant_params quant_params;
    muriscv_nn_dims input_dims = {0};
    muriscv_nn_dims filter_dims = {0};
    muriscv_nn_dims bias_dims = {0};
    muriscv_nn_dims output_dims = {0};

    const q31_t *bias_data = fc_5_biases;
    const q7_t *kernel_data = fc_5_weights;
    const q7_t *input_data = fc_5_input;

    input_dims.n = FC_5_INPUT_BATCHES;
    input_dims.w = FC_5_INPUT_W;
    input_dims.h = FC_5_INPUT_H;
    input_dims.c = FC_5_IN_CH;
    filter_dims.n = FC_5_ACCUMULATION_DEPTH;
    filter_dims.c = FC_5_OUT_CH;
    output_dims.n = FC_5_INPUT_BATCHES;
    output_dims.c = FC_5_OUT_CH;

    fc_params.input_offset = FC_5_INPUT_OFFSET;
    fc_params.filter_offset = 0;
    fc_params.output_offset = FC_5_OUTPUT_OFFSET;
    fc_params.activation.min = FC_5_OUT_ACTIVATION_MIN;
    fc_params.activation.max = FC_5_OUT_ACTIVATION_MAX;

    quant_params.multiplier = FC_5_OUTPUT_MULTIPLIER;
    quant_params.shift = FC_5_OUTPUT_SHIFT;

    int32_t buf_size = muriscv_nn_fully_connected_s8_get_buffer_size(&filter_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

    muriscv_nn_status result = muriscv_nn_fully_connected_s8(&ctx,
                                                             &fc_params,
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
    TEST_ASSERT_EQUAL(result, MURISCV_NN_SUCCESS);
    TEST_ASSERT_TRUE(validate(output, fc_5_output_ref, FC_5_DST_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_fully_connected_1_s8);
    RUN_TEST(test_muriscv_nn_fully_connected_2_s8);
    RUN_TEST(test_muriscv_nn_fully_connected_3_s8);
    RUN_TEST(test_muriscv_nn_fully_connected_4_s8);
    RUN_TEST(test_muriscv_nn_fully_connected_5_s8);

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
