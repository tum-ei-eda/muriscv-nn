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

#include "../../TestData/kernel1x1/test_data.h"
#include "../../Utils/validate.h"

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

// TODO(fabianpedd): Use tests from convolve_s8 here too

void kernel1x1_muriscv_nn_convolve_1x1_s8_fast(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q7_t output[KERNEL1X1_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_conv_params conv_params;
    muriscv_nn_per_channel_quant_params quant_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_dims output_dims;

    const q31_t *bias_data = kernel1x1_biases;
    const q7_t *input_data = kernel1x1_input;

    input_dims.n = KERNEL1X1_INPUT_BATCHES;
    input_dims.w = KERNEL1X1_INPUT_W;
    input_dims.h = KERNEL1X1_INPUT_H;
    input_dims.c = KERNEL1X1_IN_CH;
    filter_dims.w = KERNEL1X1_FILTER_X;
    filter_dims.h = KERNEL1X1_FILTER_Y;
    output_dims.w = KERNEL1X1_OUTPUT_W;
    output_dims.h = KERNEL1X1_OUTPUT_H;
    output_dims.c = KERNEL1X1_OUT_CH;

    conv_params.padding.w = KERNEL1X1_PAD_X;
    conv_params.padding.h = KERNEL1X1_PAD_Y;
    conv_params.stride.w = KERNEL1X1_STRIDE_X;
    conv_params.stride.h = KERNEL1X1_STRIDE_Y;

    conv_params.input_offset = KERNEL1X1_INPUT_OFFSET;
    conv_params.output_offset = KERNEL1X1_OUTPUT_OFFSET;
    conv_params.activation.min = KERNEL1X1_OUT_ACTIVATION_MIN;
    conv_params.activation.max = KERNEL1X1_OUT_ACTIVATION_MAX;
    quant_params.multiplier = (int32_t *)kernel1x1_output_mult;
    quant_params.shift = (int32_t *)kernel1x1_output_shift;

    const int32_t buf_size = muriscv_nn_convolve_1x1_s8_fast_get_buffer_size(&input_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = 0;

    muriscv_nn_status result = muriscv_nn_convolve_1x1_s8_fast(&ctx,
                                                               &conv_params,
                                                               &quant_params,
                                                               &input_dims,
                                                               input_data,
                                                               &filter_dims,
                                                               kernel1x1_weights,
                                                               &bias_dims,
                                                               bias_data,
                                                               &output_dims,
                                                               output);

    free(ctx.buf);
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate(output, kernel1x1_output_ref, KERNEL1X1_DST_SIZE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(kernel1x1_muriscv_nn_convolve_1x1_s8_fast);

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
