/*
 * Copyright (C) 2020-2022 Arm Limited or its affiliates.
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
 * Modifications copyright (C) 2021-2024 Chair of Electronic Design Automation, TUM
 */

#ifndef _MURISCV_NN_TYPES_H
#define _MURISCV_NN_TYPES_H

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/** Enum for specifying activation function types */
typedef enum
{
    MURISCV_SIGMOID = 0, /**< Sigmoid activation function */
    MURISCV_TANH = 1,    /**< Tanh activation function */
} muriscv_nn_activation_type;

/** MURISCV-NN object to contain the width and height of a tile */
typedef struct
{
    int32_t w; /**< Width */
    int32_t h; /**< Height */
} muriscv_nn_tile;

/** MURISCV-NN object used for the function context. */
typedef struct
{
    void *buf;    /**< Pointer to a buffer needed for the optimization */
    int32_t size; /**< Buffer size */
} muriscv_nn_context;

/** MURISCV-NN object used to hold bias data for int16 variants. */
typedef struct
{
    const void *data;         /**< Pointer to bias data */
    const bool is_int32_bias; /**< Indicate type of bias data. True means int32 else int64 */
} muriscv_nn_bias_data;

/** MURISCV-NN object to contain the dimensions of the tensors */
typedef struct
{
    int32_t n; /**< Generic dimension to contain either the batch size or output channels.
                     Please refer to the function documentation for more information */
    int32_t h; /**< Height */
    int32_t w; /**< Width */
    int32_t c; /**< Input channels */
} muriscv_nn_dims;

/** MURISCV-NN object to contain LSTM specific input parameters related to dimensions */
typedef struct
{
    int32_t max_time;
    int32_t num_inputs;
    int32_t num_batches;
    int32_t num_outputs;
} muriscv_nn_lstm_dims;

/** MURISCV-NN object for the per-channel quantization parameters */
typedef struct
{
    int32_t *multiplier; /**< Multiplier values */
    int32_t *shift;      /**< Shift values */
} muriscv_nn_per_channel_quant_params;

/** MURISCV-NN object for the per-tensor quantization parameters */
typedef struct
{
    int32_t multiplier; /**< Multiplier value */
    int32_t shift;      /**< Shift value */
} muriscv_nn_per_tensor_quant_params;

/** MURISCV-NN object for quantization parameters.
 *  This struct supports both per-tensor and per-channels requantization
 *  and is recommended for new operators.
 */
typedef struct
{
    int32_t *multiplier;    /**< Multiplier values */
    int32_t *shift;         /**< Shift values */
    int32_t is_per_channel; /** Indicating if per channel or per tensor quantization */
} muriscv_nn_quant_params;

/** MURISCV-NN object for the quantized Relu activation */
typedef struct
{
    int32_t min; /**< Min value used to clamp the result */
    int32_t max; /**< Max value used to clamp the result */
} muriscv_nn_activation;

/** MURISCV-NN object for the convolution layer parameters */
typedef struct
{
    int32_t input_offset;  /**< Negative of the Zero value for the input tensor */
    int32_t output_offset; /**< negative of the Zero value for the output tensor */
    muriscv_nn_tile stride;
    muriscv_nn_tile padding;
    muriscv_nn_tile dilation;
    muriscv_nn_activation activation;
} muriscv_nn_conv_params;

/** MURISCV-NN object for the transpose convolution layer parameters */
typedef struct
{
    int32_t input_offset;  /**< The negative of the zero value for the input tensor */
    int32_t output_offset; /**< The negative of the zero value for the output tensor */
    muriscv_nn_tile stride;
    muriscv_nn_tile padding;
    muriscv_nn_tile padding_offsets;
    muriscv_nn_tile dilation;
    muriscv_nn_activation activation;
} muriscv_nn_transpose_conv_params;

/** MURISCV-NN object for Depthwise convolution layer parameters */
typedef struct
{
    int32_t input_offset;  /**< negative of the Zero value for the input tensor */
    int32_t output_offset; /**< negative of the Zero value for the output tensor */
    int32_t ch_mult;       /**< Channel Multiplier. ch_mult * in_ch = out_ch */
    muriscv_nn_tile stride;
    muriscv_nn_tile padding;
    muriscv_nn_tile dilation;
    muriscv_nn_activation activation;
} muriscv_nn_dw_conv_params;

/** MURISCV-NN object for pooling layer parameters */
typedef struct
{
    muriscv_nn_tile stride;
    muriscv_nn_tile padding;
    muriscv_nn_activation activation;
} muriscv_nn_pool_params;

/** MURISCV-NN object for Fully Connected layer parameters */
typedef struct
{
    int32_t input_offset;  /**< Zero value for the input tensor */
    int32_t filter_offset; /**< Zero value for the filter tensor. Not used */
    int32_t output_offset; /**< Zero value for the output tensor */
    muriscv_nn_activation activation;
} muriscv_nn_fc_params;

/** MURISCV-NN object for Batch Matmul layer parameters */
typedef struct
{
    const bool adj_x;
    const bool adj_y;
    muriscv_nn_fc_params fc_params;
} muriscv_nn_bmm_params;

/** MURISCV-NN object for Transpose layer parameters */
typedef struct
{
    const int32_t num_dims;
    const uint32_t *permutations; /**< The dimensions applied to the input dimensions */
} muriscv_nn_transpose_params;

/** MURISCV-NN object for SVDF layer parameters */
typedef struct
{
    int32_t rank;
    int32_t input_offset;  /**< Zero value for the input tensor */
    int32_t output_offset; /**< Zero value for the output tensor */
    muriscv_nn_activation input_activation;
    muriscv_nn_activation output_activation;
} muriscv_nn_svdf_params;

/** MURISCV-NN object for Softmax s16 layer parameters */
typedef struct
{
    const int16_t *exp_lut;
    const int16_t *one_by_one_lut;
} muriscv_nn_softmax_lut_s16;

/** MURISCV-NN object for quantization parameters */
typedef struct
{
    int32_t multiplier; /**< Multiplier value */
    int32_t shift;      /**< Shift value */
} muriscv_nn_scaling;

/** MURISCV-NN object for LSTM gate parameters*/
typedef struct
{
    int32_t input_multiplier;
    int32_t input_shift;
    const void *input_weights;
    const void *input_effective_bias; /**< Bias added with precomputed kernel_sum * lhs_offset*/

    int32_t hidden_multiplier;
    int32_t hidden_shift;
    const void *hidden_weights;
    const void *hidden_effective_bias; /**< Precomputed kernel_sum * lhs_offset*/

    const void *bias;
    muriscv_nn_activation_type activation_type;
} muriscv_nn_lstm_gate;

/** Parameters for integer LSTM, as defined in TFLM */
typedef struct
{
    int32_t time_major; /**< 0 if first dimension is batch, else first dimension is time */
    int32_t batch_size;
    int32_t time_steps;
    int32_t input_size; /**< Size of new data input into the LSTM cell*/
    int32_t
        hidden_size; /**< Size of output from the LSTM cell, used as output and recursively into the next time step*/

    int32_t input_offset;

    int32_t forget_to_cell_multiplier;
    int32_t forget_to_cell_shift;
    int32_t input_to_cell_multiplier;
    int32_t input_to_cell_shift;
    int32_t cell_clip; /**< Min/max value of cell output*/
    int32_t cell_scale_power;

    int32_t output_multiplier;
    int32_t output_shift;
    int32_t output_offset;

    muriscv_nn_lstm_gate forget_gate;
    muriscv_nn_lstm_gate input_gate;
    muriscv_nn_lstm_gate cell_gate;
    muriscv_nn_lstm_gate output_gate;

} muriscv_nn_lstm_params;

/** MURISCV-NN object for LSTM scratch buffers*/
typedef struct
{
    void *temp1;
    void *temp2;
    void *cell_state;
} muriscv_nn_lstm_context;


#ifdef __cplusplus
}
#endif

#endif /* _MURISCV_NN_TYPES_H */
