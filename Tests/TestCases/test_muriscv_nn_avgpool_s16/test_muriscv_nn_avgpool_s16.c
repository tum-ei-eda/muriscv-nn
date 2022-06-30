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

#include "../../TestData/avgpooling_int16/test_data.h"
#include "../../Utils/validate.h"

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}

void avgpooling_int16_muriscv_nn_avgpool_s16(void)
{
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    q15_t output[AVGPOOLING_INT16_DST_SIZE] = {0};

    muriscv_nn_context ctx;
    muriscv_nn_pool_params pool_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims filter_dims;
    muriscv_nn_dims output_dims;

    const q15_t *input_data = avgpooling_int16_input;

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

    free(ctx.buf);
    TEST_ASSERT_EQUAL(expected, result);
    TEST_ASSERT_TRUE(validate_s16(output, avgpooling_int16_output_ref, AVGPOOLING_INT16_DST_SIZE));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(avgpooling_int16_muriscv_nn_avgpool_s16);

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
