/*
 * Copyright (C) 2010-2022 Arm Limited or its affiliates.
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

#if defined(USE_VEXT)
#include <riscv_vector.h>
#elif defined(USE_PEXT)
#include <rvp_intrinsic.h>
#endif

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup NNConv
 * @{
 */

// TODO(fabianpedd): Vectorize sub parts of depthwise_conv_s8_mult_4() or ideally
// vectorize both functions in this file and combine them in an elegant way

// TODO(fabianpedd): From some quick tests it appears if ch_mult is most often quite a small number. Thus, it doesnt
// really look to be a good target for vectorization. However, what could make sense would be to make this function
// generic (remove the 4 requirement) using the vector extension (and the packed extension with epilog) and make it get
// called when ch_mult > 4, for example...
static void depthwise_conv_s8_mult_4(const int8_t *input,
                                     const int32_t input_x,
                                     const int32_t input_y,
                                     const int32_t input_ch,
                                     const int8_t *kernel,
                                     const int32_t output_ch,
                                     const int32_t ch_mult,
                                     const int32_t kernel_x,
                                     const int32_t kernel_y,
                                     const int32_t pad_x,
                                     const int32_t pad_y,
                                     const int32_t stride_x,
                                     const int32_t stride_y,
                                     const int32_t *bias,
                                     int8_t *output,
                                     const int32_t *output_shift,
                                     const int32_t *output_mult,
                                     const int32_t output_x,
                                     const int32_t output_y,
                                     const int32_t output_offset,
                                     const int32_t input_offset,
                                     const int32_t output_activation_min,
                                     const int32_t output_activation_max)
{
    for (int32_t in_h = -pad_y, out_h = 0, out_idx = 0; out_h < output_y; in_h += stride_y, ++out_h)
    {
        for (int32_t in_w = -pad_x, out_w = 0, ker_h_start = MAX(0, -in_h); out_w < output_x; in_w += stride_x, ++out_w)
        {
            for (int32_t in_ch = 0, out_ch = 0, ker_w_start = MAX(0, -in_w); out_ch < output_ch;
                 ++in_ch, out_ch += ch_mult)
            {
                for (int mult_tile = 0; mult_tile < ch_mult; mult_tile += 4)
                {
                    int32_t out_buff[4] = {0, 0, 0, 0};
                    if (bias)
                    {
                        out_buff[0] = bias[out_ch + 0 + mult_tile];
                        out_buff[1] = bias[out_ch + 1 + mult_tile];
                        out_buff[2] = bias[out_ch + 2 + mult_tile];
                        out_buff[3] = bias[out_ch + 3 + mult_tile];
                    }

                    for (int32_t ker_h = ker_h_start; ker_h < MIN(kernel_y, input_y - in_h); ++ker_h)
                    {
                        int32_t ker_idx = ker_h * (output_ch * kernel_x) + ker_w_start * output_ch + out_ch;
                        int32_t in_idx = (in_h + ker_h) * (input_ch * input_x) + in_w * input_ch + in_ch;
                        for (int32_t ker_w = ker_w_start; ker_w < MIN(kernel_x, input_x - in_w);
                             ++ker_w, ker_idx += output_ch)
                        {
                            int32_t in_val = input[in_idx + ker_w * input_ch] + input_offset;
                            out_buff[0] += in_val * kernel[ker_idx + 0 + mult_tile];
                            out_buff[1] += in_val * kernel[ker_idx + 1 + mult_tile];
                            out_buff[2] += in_val * kernel[ker_idx + 2 + mult_tile];
                            out_buff[3] += in_val * kernel[ker_idx + 3 + mult_tile];
                        }
                    }

                    out_buff[0] = muriscv_nn_requantize(
                        out_buff[0], output_mult[out_ch + 0 + mult_tile], output_shift[out_ch + 0 + mult_tile]);
                    out_buff[1] = muriscv_nn_requantize(
                        out_buff[1], output_mult[out_ch + 1 + mult_tile], output_shift[out_ch + 1 + mult_tile]);
                    out_buff[2] = muriscv_nn_requantize(
                        out_buff[2], output_mult[out_ch + 2 + mult_tile], output_shift[out_ch + 2 + mult_tile]);
                    out_buff[3] = muriscv_nn_requantize(
                        out_buff[3], output_mult[out_ch + 3 + mult_tile], output_shift[out_ch + 3 + mult_tile]);

                    out_buff[0] += output_offset;
                    out_buff[1] += output_offset;
                    out_buff[2] += output_offset;
                    out_buff[3] += output_offset;

                    out_buff[0] = MIN(MAX(out_buff[0], output_activation_min), output_activation_max);
                    out_buff[1] = MIN(MAX(out_buff[1], output_activation_min), output_activation_max);
                    out_buff[2] = MIN(MAX(out_buff[2], output_activation_min), output_activation_max);
                    out_buff[3] = MIN(MAX(out_buff[3], output_activation_min), output_activation_max);

                    output[out_idx++] = (int8_t)out_buff[0];
                    output[out_idx++] = (int8_t)out_buff[1];
                    output[out_idx++] = (int8_t)out_buff[2];
                    output[out_idx++] = (int8_t)out_buff[3];
                }
            }
        }
    }
}

static void depthwise_conv_s8_generic(const q7_t *input,
                                      const uint16_t input_batches,
                                      const uint16_t input_x,
                                      const uint16_t input_y,
                                      const uint16_t input_ch,
                                      const q7_t *kernel,
                                      const uint16_t output_ch,
                                      const uint16_t ch_mult,
                                      const uint16_t kernel_x,
                                      const uint16_t kernel_y,
                                      const uint16_t pad_x,
                                      const uint16_t pad_y,
                                      const uint16_t stride_x,
                                      const uint16_t stride_y,
                                      const int32_t *bias,
                                      q7_t *output,
                                      const int32_t *output_shift,
                                      const int32_t *output_mult,
                                      const uint16_t output_x,
                                      const uint16_t output_y,
                                      const int32_t output_offset,
                                      const int32_t input_offset,
                                      const int32_t output_activation_min,
                                      const int32_t output_activation_max,
                                      const uint16_t dilation_x,
                                      const uint16_t dilation_y)

{
    (void)output_ch;
    int i_out = 0;
    int i_batch;

    for (i_batch = 0; i_batch < input_batches; i_batch++)
    {
        for (int i_out_y = 0; i_out_y < output_y; i_out_y++)
        {
            const int16_t base_idx_y = (i_out_y * stride_y) - pad_y;
            for (int i_out_x = 0; i_out_x < output_x; i_out_x++)
            {
                const int16_t base_idx_x = (i_out_x * stride_x) - pad_x;
                for (int i_input_ch = 0; i_input_ch < input_ch; i_input_ch++)
                {
                    for (int i_ch_mult = 0; i_ch_mult < ch_mult; i_ch_mult++)
                    {
                        const int idx_out_ch = i_ch_mult + i_input_ch * ch_mult;
                        int32_t acc_0 = 0;

                        int ker_y_start;
                        int ker_x_start;
                        int ker_y_end;
                        int ker_x_end;

                        if (dilation_x > 1)
                        {
                            const int32_t start_x_max = (-base_idx_x + dilation_x - 1) / dilation_x;
                            ker_x_start = MAX(0, start_x_max);
                            const int32_t end_min_x = (input_x - base_idx_x + dilation_x - 1) / dilation_x;
                            ker_x_end = MIN(kernel_x, end_min_x);
                        }
                        else
                        {
                            ker_x_start = MAX(0, -base_idx_x);
                            ker_x_end = MIN(kernel_x, input_x - base_idx_x);
                        }

                        if (dilation_y > 1)
                        {
                            const int32_t start_y_max = (-base_idx_y + dilation_y - 1) / dilation_y;
                            ker_y_start = MAX(0, start_y_max);
                            const int32_t end_min_y = (input_y - base_idx_y + dilation_y - 1) / dilation_y;
                            ker_y_end = MIN(kernel_y, end_min_y);
                        }
                        else
                        {
                            ker_y_start = MAX(0, -base_idx_y);
                            ker_y_end = MIN(kernel_y, input_y - base_idx_y);
                        }

                        if (bias)
                        {
                            acc_0 = bias[idx_out_ch];
                        }

                        // TODO(fabianpedd): We currently can't expose enough parallelism to the vector extension using
                        // this naive convolution approach. Thus, the vector extension can only operate on 3-5 values in
                        // parallel and is actually slower than the scalar implementation (due to the vector overhead).
                        // Most kernels are in the range of 3x3 or 5x5. Thus, we would at least need to expose both
                        // kernel dimensions to the vector extension in order to get any significant speedup. This,
                        // however, is very hard to achieve here, as we need to take into account both strides != 1 and
                        // dilation != 1.

                        // #if defined(USE_VEXT)
                        //                         for (int i_ker_y = ker_y_start; i_ker_y < ker_y_end; i_ker_y++)
                        //                         {
                        //                             int8_t *input_idx =
                        //                                 (int8_t *)(((base_idx_y + dilation_y * i_ker_y) * input_x +
                        //                                 base_idx_x) * input_ch +
                        //                                            dilation_x * input_ch * ker_x_start + i_input_ch +
                        //                                            input);
                        //                             int8_t *kernel_idx = (int8_t *)((i_ker_y * kernel_x +
                        //                             ker_x_start) * input_ch * ch_mult +
                        //                                                             idx_out_ch + kernel);
                        //                             size_t loop_count = ker_x_end - ker_x_start;
                        //
                        //                             size_t vl = vsetvl_e32m8(loop_count);
                        //                             vint32m8_t res_0 = vmv_v_x_i32m8(0, vl);
                        //
                        //                             while (loop_count > 0)
                        //                             {
                        //                                 /* Determine vector length */
                        //                                 vl = vsetvl_e32m8(loop_count);
                        //
                        //                                 vint8m2_t input_data_raw = vlse8_v_i8m2(input_idx, input_ch *
                        //                                 dilation_x, vl); vint32m8_t input_data =
                        //                                     vadd_vx_i32m8(vsext_vf4_i32m8(input_data_raw, vl),
                        //                                     input_offset, vl);
                        //
                        //                                 vint8m2_t kernel_data_raw = vlse8_v_i8m2(kernel_idx, input_ch
                        //                                 * ch_mult, vl); vint32m8_t kernel_data =
                        //                                 vsext_vf4_i32m8(kernel_data_raw, vl);
                        //
                        //                                 res_0 = vmacc_vv_i32m8(res_0, input_data, kernel_data, vl);
                        //
                        //                                 /* Decrement loop counter and bump pointers */
                        //                                 loop_count -= vl;
                        //                                 input_idx += vl * input_ch * dilation_x;
                        //                                 kernel_idx += vl * input_ch * ch_mult;
                        //                             }
                        //
                        //                             vl = vsetvl_e32m1(1);
                        //                             vint32m1_t red_0 = vmv_v_x_i32m1(0, vl);
                        //                             vl = vsetvl_e32m8(ker_x_end - ker_x_start);
                        //                             red_0 = __riscv_vredsum_vs_i32m8_i32m1(res_0, red_0, vl);
                        //                             acc_0 += vmv_x_s_i32m1_i32(red_0);
                        //                         }
                        // #else /* defined(USE_VEXT) */

                        // TODO(fabianpedd): I lifted the index calculations from the inner loops to the outer loops.
                        // This slightly improves performance, as far as I could measure.
                        // However, in reality this could turn out not to be as efficient since (I think?!)
                        // more multiplications are required. So on HW with multipliers that need more than a single
                        // cycle this might not perform as well as the reference code from ARM.

                        // ARMs code
                        // for (int i_ker_y = ker_y_start; i_ker_y < ker_y_end; i_ker_y++)
                        // {
                        //     const int32_t idx_y = base_idx_y + dilation_y * i_ker_y;
                        //     for (int i_ker_x = ker_x_start; i_ker_x < ker_x_end; i_ker_x++)
                        //     {
                        //         const int32_t idx_x = base_idx_x + dilation_x * i_ker_x;
                        //         int32_t idx_0 = (idx_y * input_x + idx_x) * input_ch + i_input_ch;
                        //         int32_t ker_idx_0 = (i_ker_y * kernel_x + i_ker_x) * (input_ch * ch_mult) +
                        //         idx_out_ch;
                        //
                        //         acc_0 += (input[idx_0] + input_offset) * kernel[ker_idx_0];
                        //     }
                        // }

                        // My code
                        int8_t *input_idx =
                            (int8_t *)(base_idx_y * input_x * input_ch + base_idx_x * input_ch + i_input_ch + input +
                                       dilation_y * input_x * input_ch * ker_y_start +
                                       dilation_x * input_ch * ker_x_start);
                        int8_t *kernel_idx =
                            (int8_t *)(idx_out_ch + kernel + kernel_x * input_ch * ch_mult * ker_y_start +
                                       input_ch * ch_mult * ker_x_start);

                        for (int i_ker_y = ker_y_start; i_ker_y < ker_y_end; i_ker_y++)
                        {
                            int8_t *input_idx_inner = input_idx;
                            int8_t *kernel_idx_inner = kernel_idx;
                            for (int i_ker_x = ker_x_start; i_ker_x < ker_x_end; i_ker_x++)
                            {
                                acc_0 += (*input_idx_inner + input_offset) * *kernel_idx_inner;

                                input_idx_inner += input_ch * dilation_x;
                                kernel_idx_inner += input_ch * ch_mult;
                            }
                            input_idx += dilation_y * input_x * input_ch;
                            kernel_idx += kernel_x * input_ch * ch_mult;
                        }

                        // #endif /* defined(USE_VEXT) */

                        /* Requantize and clamp output to provided range */
                        acc_0 = muriscv_nn_requantize(acc_0, output_mult[idx_out_ch], output_shift[idx_out_ch]);
                        acc_0 += output_offset;
                        acc_0 = MAX(acc_0, output_activation_min);
                        acc_0 = MIN(acc_0, output_activation_max);

                        output[i_out++] = acc_0;
                    }
                }
            }
        }
        /* Advance to the next batch */
        input += (input_x * input_y * input_ch);
    }
}

/*
 *  Basic s8 depthwise convolution function.
 *
 *  Refer header file for details.
 *  Optimization using DSP extension is not available for the generic case where channel multiplier is > 1.
 *
 */
muriscv_nn_status muriscv_nn_depthwise_conv_s8(const muriscv_nn_context *ctx,
                                               const muriscv_nn_dw_conv_params *dw_conv_params,
                                               const muriscv_nn_per_channel_quant_params *quant_params,
                                               const muriscv_nn_dims *input_dims,
                                               const q7_t *input,
                                               const muriscv_nn_dims *filter_dims,
                                               const q7_t *kernel,
                                               const muriscv_nn_dims *bias_dims,
                                               const int32_t *bias,
                                               const muriscv_nn_dims *output_dims,
                                               q7_t *output)
{
    const uint16_t dilation_x = dw_conv_params->dilation.w;
    const uint16_t dilation_y = dw_conv_params->dilation.h;

    (void)dw_conv_params->dilation;
    (void)bias_dims;
    (void)ctx;

    if (dw_conv_params->ch_mult % 4 == 0 && input_dims->n == 1 && dw_conv_params->dilation.w == 1 &&
        dw_conv_params->dilation.h == 1)
    {
        depthwise_conv_s8_mult_4(input,
                                 input_dims->w,
                                 input_dims->h,
                                 input_dims->c,
                                 kernel,
                                 output_dims->c,
                                 dw_conv_params->ch_mult,
                                 filter_dims->w,
                                 filter_dims->h,
                                 dw_conv_params->padding.w,
                                 dw_conv_params->padding.h,
                                 dw_conv_params->stride.w,
                                 dw_conv_params->stride.h,
                                 bias,
                                 output,
                                 quant_params->shift,
                                 quant_params->multiplier,
                                 output_dims->w,
                                 output_dims->h,
                                 dw_conv_params->output_offset,
                                 dw_conv_params->input_offset,
                                 dw_conv_params->activation.min,
                                 dw_conv_params->activation.max);
    }
    else
    {
        depthwise_conv_s8_generic(input,
                                  input_dims->n,
                                  input_dims->w,
                                  input_dims->h,
                                  input_dims->c,
                                  kernel,
                                  output_dims->c,
                                  dw_conv_params->ch_mult,
                                  filter_dims->w,
                                  filter_dims->h,
                                  dw_conv_params->padding.w,
                                  dw_conv_params->padding.h,
                                  dw_conv_params->stride.w,
                                  dw_conv_params->stride.h,
                                  bias,
                                  output,
                                  quant_params->shift,
                                  quant_params->multiplier,
                                  output_dims->w,
                                  output_dims->h,
                                  dw_conv_params->output_offset,
                                  dw_conv_params->input_offset,
                                  dw_conv_params->activation.min,
                                  dw_conv_params->activation.max,
                                  dilation_x,
                                  dilation_y);
    }

    /* Return to application */
    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of NNConv group
 */
