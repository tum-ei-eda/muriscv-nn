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
#include <string.h>
#include <unity.h>

#include "../../TestData/svdf_int8/test_data.h"
#include "../../TestData/svdf_int8_2/test_data.h"
#include "../../Utils/validate.h"

#define REPEAT_NUM (1)

void setUp(void)
{ /* set stuff up here */
}

void tearDown(void)
{ /* clean stuff up here */
}


void svdf_int8_muriscv_nn_s8(void)
{
    const int32_t output_ref_size = SVDF_INT8_DST_SIZE;
    const int8_t *output_ref = svdf_int8_output_ref;
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    muriscv_nn_context input_ctx;
    muriscv_nn_context output_ctx;
    muriscv_nn_svdf_params svdf_int8_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims weights_feature_dims;
    muriscv_nn_dims weights_time_dims;
    muriscv_nn_dims state_dims;
    muriscv_nn_dims output_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_per_tensor_quant_params input_quant_params;
    muriscv_nn_per_tensor_quant_params output_quant_params;
    int8_t output_data[SVDF_INT8_DST_SIZE] = {1};
    const int8_t *weights_feature_data = svdf_int8_weights_feature;
    const int8_t *weights_time_data = svdf_int8_weights_time;

    input_dims.n = SVDF_INT8_INPUT_BATCHES;
    input_dims.h = SVDF_INT8_INPUT_SIZE;
    weights_feature_dims.n = SVDF_INT8_FEATURE_BATCHES;
    weights_time_dims.h = SVDF_INT8_TIME_BATCHES;

    input_quant_params.multiplier = SVDF_INT8_MULTIPLIER_IN;
    input_quant_params.shift = SVDF_INT8_SHIFT_1;
    output_quant_params.multiplier = SVDF_INT8_MULTIPLIER_OUT;
    output_quant_params.shift = SVDF_INT8_SHIFT_2;

    svdf_int8_params.input_activation.min = SVDF_INT8_IN_ACTIVATION_MIN;
    svdf_int8_params.input_activation.max = SVDF_INT8_IN_ACTIVATION_MAX;
    svdf_int8_params.output_activation.min = SVDF_INT8_OUT_ACTIVATION_MIN;
    svdf_int8_params.output_activation.max = SVDF_INT8_OUT_ACTIVATION_MAX;
    svdf_int8_params.input_offset = SVDF_INT8_INPUT_OFFSET;
    svdf_int8_params.output_offset = SVDF_INT8_OUTPUT_OFFSET;
    svdf_int8_params.rank = SVDF_INT8_RANK;

    const int input_round_size = SVDF_INT8_INPUT_BATCHES * SVDF_INT8_INPUT_SIZE;
    const int number_inputs = sizeof(svdf_int8_input_sequence) / input_round_size;
    const int32_t number_units = SVDF_INT8_FEATURE_BATCHES / SVDF_INT8_RANK;
    const int scratch_size = SVDF_INT8_INPUT_BATCHES * SVDF_INT8_FEATURE_BATCHES * sizeof(int32_t);
    const int scratch_size_out = SVDF_INT8_INPUT_BATCHES * number_units * sizeof(int32_t);

    muriscv_nn_context ctx;
    const int32_t buf_size = muriscv_nn_svdf_s8_get_buffer_size(&weights_feature_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

#if defined(USE_VEXT)
    int32_t *kernel_sum_buf = ctx.buf;
    muriscv_nn_vector_sum_s8(kernel_sum_buf, input_dims.h, weights_feature_dims.n, weights_feature_data, 1, 0, NULL);
#endif

    // + SVDF_INT8_TIME_BATCHES additional bytes to make sure it is not overwritten
    const int state_data_size = sizeof(svdf_int8_state) + SVDF_INT8_TIME_BATCHES;
    const int8_t initial_data = 66;

    input_ctx.buf = malloc(scratch_size);
    output_ctx.buf = malloc(scratch_size_out);

    int8_t *input_data = malloc(input_round_size);
    int8_t *state_data = malloc(state_data_size);

    memset(state_data, initial_data, state_data_size);

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        memcpy(state_data, svdf_int8_state, sizeof(svdf_int8_state));
        for (int j = 0; j < number_inputs; j++)
        {
            memcpy(input_data, svdf_int8_input_sequence + j * input_round_size, input_round_size);
            muriscv_nn_status result = muriscv_nn_svdf_s8(&ctx,
                                                     &input_ctx,
                                                     &output_ctx,
                                                     &svdf_int8_params,
                                                     &input_quant_params,
                                                     &output_quant_params,
                                                     &input_dims,
                                                     input_data,
                                                     &state_dims,
                                                     state_data,
                                                     &weights_feature_dims,
                                                     weights_feature_data,
                                                     &weights_time_dims,
                                                     weights_time_data,
                                                     &bias_dims,
                                                     svdf_int8_biases,
                                                     &output_dims,
                                                     output_data);
            TEST_ASSERT_EQUAL(expected, result);
        }

        TEST_ASSERT_TRUE(validate(output_data, output_ref, output_ref_size));
    }

    if (ctx.buf)
    {
        // The caller is responsible to clear the scratch buffers for security reasons if applicable.
        memset(ctx.buf, 0, buf_size);
        free(ctx.buf);
    }

    // Make sure state data is not written outside boundary
    for (int i = sizeof(svdf_int8_state); i < state_data_size; i++)
    {
        TEST_ASSERT_EQUAL(state_data[i], initial_data);
    }

    free(state_data);
    free(input_data);
    free(input_ctx.buf);
    free(output_ctx.buf);
}

void svdf_int8_2_muriscv_nn_s8(void)
{
    const int32_t output_ref_size = SVDF_INT8_2_DST_SIZE;
    const int8_t *output_ref = svdf_int8_2_output_ref;
    const muriscv_nn_status expected = MURISCV_NN_SUCCESS;
    muriscv_nn_context input_ctx;
    muriscv_nn_context output_ctx;
    muriscv_nn_svdf_params svdf_int8_2_params;
    muriscv_nn_dims input_dims;
    muriscv_nn_dims weights_feature_dims;
    muriscv_nn_dims weights_time_dims;
    muriscv_nn_dims state_dims;
    muriscv_nn_dims output_dims;
    muriscv_nn_dims bias_dims;
    muriscv_nn_per_tensor_quant_params input_quant_params;
    muriscv_nn_per_tensor_quant_params output_quant_params;
    int8_t output_data[SVDF_INT8_2_DST_SIZE] = {1};
    const int8_t *weights_feature_data = svdf_int8_2_weights_feature;
    const int8_t *weights_time_data = svdf_int8_2_weights_time;

    input_dims.n = SVDF_INT8_2_INPUT_BATCHES;
    input_dims.h = SVDF_INT8_2_INPUT_SIZE;
    weights_feature_dims.n = SVDF_INT8_2_FEATURE_BATCHES;
    weights_time_dims.h = SVDF_INT8_2_TIME_BATCHES;

    input_quant_params.multiplier = SVDF_INT8_2_MULTIPLIER_IN;
    input_quant_params.shift = SVDF_INT8_2_SHIFT_1;
    output_quant_params.multiplier = SVDF_INT8_2_MULTIPLIER_OUT;
    output_quant_params.shift = SVDF_INT8_2_SHIFT_2;

    svdf_int8_2_params.input_activation.min = SVDF_INT8_2_IN_ACTIVATION_MIN;
    svdf_int8_2_params.input_activation.max = SVDF_INT8_2_IN_ACTIVATION_MAX;
    svdf_int8_2_params.output_activation.min = SVDF_INT8_2_OUT_ACTIVATION_MIN;
    svdf_int8_2_params.output_activation.max = SVDF_INT8_2_OUT_ACTIVATION_MAX;
    svdf_int8_2_params.input_offset = SVDF_INT8_2_INPUT_OFFSET;
    svdf_int8_2_params.output_offset = SVDF_INT8_2_OUTPUT_OFFSET;
    svdf_int8_2_params.rank = SVDF_INT8_2_RANK;

    const int input_round_size = SVDF_INT8_2_INPUT_BATCHES * SVDF_INT8_2_INPUT_SIZE;
    const int number_inputs = sizeof(svdf_int8_2_input_sequence) / input_round_size;
    const int32_t number_units = SVDF_INT8_2_FEATURE_BATCHES / SVDF_INT8_2_RANK;
    const int scratch_size = SVDF_INT8_2_INPUT_BATCHES * SVDF_INT8_2_FEATURE_BATCHES * sizeof(int32_t);
    const int scratch_size_out = SVDF_INT8_2_INPUT_BATCHES * number_units * sizeof(int32_t);

    muriscv_nn_context ctx;
    const int32_t buf_size = muriscv_nn_svdf_s8_get_buffer_size(&weights_feature_dims);
    ctx.buf = malloc(buf_size);
    ctx.size = buf_size;

#if defined(USE_VEXT)
    int32_t *kernel_sum_buf = ctx.buf;
    muriscv_nn_vector_sum_s8(kernel_sum_buf, input_dims.h, weights_feature_dims.n, weights_feature_data, 1, 0, NULL);
#endif

    const int state_data_size = sizeof(svdf_int8_2_state);

    input_ctx.buf = malloc(scratch_size);
    output_ctx.buf = malloc(scratch_size_out);

    int8_t *input_data = malloc(input_round_size);
    int8_t *state_data = malloc(state_data_size);

    for (int i = 0; i < REPEAT_NUM; i++)
    {
        memcpy(state_data, svdf_int8_2_state, sizeof(svdf_int8_2_state));
        for (int j = 0; j < number_inputs; j++)
        {
            memcpy(input_data, svdf_int8_2_input_sequence + j * input_round_size, input_round_size);
            muriscv_nn_status result = muriscv_nn_svdf_s8(&ctx,
                                                     &input_ctx,
                                                     &output_ctx,
                                                     &svdf_int8_2_params,
                                                     &input_quant_params,
                                                     &output_quant_params,
                                                     &input_dims,
                                                     input_data,
                                                     &state_dims,
                                                     state_data,
                                                     &weights_feature_dims,
                                                     weights_feature_data,
                                                     &weights_time_dims,
                                                     weights_time_data,
                                                     &bias_dims,
                                                     svdf_int8_2_biases,
                                                     &output_dims,
                                                     output_data);
            TEST_ASSERT_EQUAL(expected, result);
        }

        TEST_ASSERT_TRUE(validate(output_data, output_ref, output_ref_size));
    }

    if (ctx.buf)
    {
        // The caller is responsible to clear the scratch buffers for security reasons if applicable.
        memset(ctx.buf, 0, buf_size);
        free(ctx.buf);
    }

    free(state_data);
    free(input_data);
    free(input_ctx.buf);
    free(output_ctx.buf);
}




int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(svdf_int8_muriscv_nn_s8);
    RUN_TEST(svdf_int8_2_muriscv_nn_s8);

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
