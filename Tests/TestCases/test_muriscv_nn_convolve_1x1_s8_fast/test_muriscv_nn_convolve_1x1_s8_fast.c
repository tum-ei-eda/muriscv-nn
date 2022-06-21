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

#include "../../TestData/test_muriscv_nn_convolve_1x1_s8_fast/test_data.h"
#include "../../Utils/validate.h"

#define TOLERANCE 0

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

// TODO(fabianpedd): Use tests from convolve_s8 here too

void test_muriscv_nn_convolve_1x1_1_s8_fast(void)
{
    q7_t output[CONV_1X1_FAST_1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = conv_1x1_fast_biases;
    const q7_t *input_data = conv_1x1_fast_input;

    input_dims.n = CONV_1X1_FAST_1_INPUT_BATCHES;
    input_dims.w = CONV_1X1_FAST_1_INPUT_W;
    input_dims.h = CONV_1X1_FAST_1_INPUT_H;
    input_dims.c = CONV_1X1_FAST_1_IN_CH;
    filter_dims.w = CONV_1X1_FAST_1_FILTER_X;
    filter_dims.h = CONV_1X1_FAST_1_FILTER_Y;
    output_dims.w = CONV_1X1_FAST_1_OUTPUT_W;
    output_dims.h = CONV_1X1_FAST_1_OUTPUT_H;
    output_dims.c = CONV_1X1_FAST_1_OUT_CH;

    conv_params.padding.w = CONV_1X1_FAST_1_PAD_X;
    conv_params.padding.h = CONV_1X1_FAST_1_PAD_Y;
    conv_params.stride.w = CONV_1X1_FAST_1_STRIDE_X;
    conv_params.stride.h = CONV_1X1_FAST_1_STRIDE_Y;

    conv_params.input_offset = CONV_1X1_FAST_1_INPUT_OFFSET;
    conv_params.output_offset = CONV_1X1_FAST_1_OUTPUT_OFFSET;
    conv_params.activation.min = CONV_1X1_FAST_1_OUT_ACTIVATION_MIN;
    conv_params.activation.max = CONV_1X1_FAST_1_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)conv_1x1_fast_output_mult;
    quant_params.shift = (int32_t *)conv_1x1_fast_output_shift;

    const int32_t buf_size = muriscv_nn_convolve_1x1_s8_fast_get_buffer_size(&input_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_1x1_s8_fast(&ctx,
                                                               &conv_params,
                                                               &quant_params,
                                                               &input_dims,
                                                               input_data,
                                                               &filter_dims,
                                                               conv_1x1_fast_weights,
                                                               &bias_dims,
                                                               bias_data,
                                                               &output_dims,
                                                               output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(MURISCV_NN_SUCCESS, result);
    TEST_ASSERT_TRUE(validate(output, conv_1x1_fast_output_ref, CONV_1X1_FAST_1_DST_SIZE, TOLERANCE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_muriscv_nn_convolve_1x1_1_s8_fast);

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
