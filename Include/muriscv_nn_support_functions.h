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
 * Modifications copyright (C) 2021-2023 Chair of Electronic Design Automation, TUM
 */

#ifndef _MURISCV_NN_SUPPORT_FUNCTIONS_H
#define _MURISCV_NN_SUPPORT_FUNCTIONS_H

#if defined(USE_VEXT)
#include <riscv_vector.h>
#ifdef __clang__
#if __clang_major__ >= 16

#define vsmul_vx_i32m8 __riscv_vsmul_vx_i32m8
#define vand_vx_i32m8 __riscv_vand_vx_i32m8
#define vmv_v_x_i32m8 __riscv_vmv_v_x_i32m8
#define vsra_vx_i32m8 __riscv_vsra_vx_i32m8
#define vmslt_vx_i32m8_b4 __riscv_vmslt_vx_i32m8_b4
#define vadd_vx_i32m8_m(a, b, c, d, e) __riscv_vadd_vx_i32m8_m(a, b, d, e)
#define vmsgt_vv_i32m8_b4 __riscv_vmsgt_vv_i32m8_b4
#define vsmul_vx_i32m4 __riscv_vsmul_vx_i32m4
#define vand_vx_i32m4 __riscv_vand_vx_i32m4
#define vmv_v_x_i32m4 __riscv_vmv_v_x_i32m4
#define vsra_vx_i32m4 __riscv_vsra_vx_i32m4
#define vmslt_vx_i32m4_b8 __riscv_vmslt_vx_i32m4_b8
#define vadd_vx_i32m4_m(a, b, c, d, e) __riscv_vadd_vx_i32m4_m(a, b, d, e)
#define vadd_vx_i32m4 __riscv_vadd_vx_i32m4
#define vmsgt_vv_i32m4_b8 __riscv_vmsgt_vv_i32m4_b8
#define vreinterpret_v_i32m2_u32m2 __riscv_vreinterpret_v_i32m2_u32m2
#define vneg_v_i32m2 __riscv_vneg_v_i32m2
#define vsmul_vv_i32m2 __riscv_vsmul_vv_i32m2
#define vsra_vv_i32m2 __riscv_vsra_vv_i32m2
#define vsub_vx_i32m2 __riscv_vsub_vx_i32m2
#define vsll_vv_i32m2 __riscv_vsll_vv_i32m2
#define vmv_v_x_i32m2 __riscv_vmv_v_x_i32m2
#define vsra_vx_i32m2 __riscv_vsra_vx_i32m2
#define vmslt_vx_i32m2_b16 __riscv_vmslt_vx_i32m2_b16
#define vadd_vx_i32m2_m(a, b, c, d, e) __riscv_vadd_vx_i32m2_m(a, b, d, e)
#define vand_vv_i32m2 __riscv_vand_vv_i32m2
#define vmsgt_vv_i32m2_b16 __riscv_vmsgt_vv_i32m2_b16
#define vsetvl_e8m8 __riscv_vsetvl_e8m8
#define vsetvl_e32m4 __riscv_vsetvl_e32m4
#define vle8_v_i8m8 __riscv_vle8_v_i8m8
#define vse8_v_i8m8 __riscv_vse8_v_i8m8
#define vadd_vv_i32m8 __riscv_vadd_vv_i32m8
#define vadd_vx_i32m2 __riscv_vadd_vx_i32m2
#define vadd_vx_i32m8 __riscv_vadd_vx_i32m8
#define vle16_v_i16m4 __riscv_vle16_v_i16m4
#define vle16_v_i16m8 __riscv_vle16_v_i16m8
#define vle32_v_i32m2 __riscv_vle32_v_i32m2
#define vle8_v_i8m2 __riscv_vle8_v_i8m2
#define vle8_v_i8mf2 __riscv_vle8_v_i8mf2
#define vmacc_vv_i32m2 __riscv_vmacc_vv_i32m2
#define vmacc_vv_i32m8 __riscv_vmacc_vv_i32m8
#define vmax_vv_i16m8 __riscv_vmax_vv_i16m8
#define vmax_vv_i8m8 __riscv_vmax_vv_i8m8
#define vmax_vx_i16m8 __riscv_vmax_vx_i16m8
#define vmax_vx_i8m8 __riscv_vmax_vx_i8m8
#define vmin_vx_i8m8 __riscv_vmin_vx_i8m8
#define vmnot_m_b4 __riscv_vmnot_m_b4
#define vmsgt_vx_i32m8_b4 __riscv_vmsgt_vx_i32m8_b4
#define vmul_vv_i32m8 __riscv_vmul_vv_i32m8
#define vmv_v_x_i32m1 __riscv_vmv_v_x_i32m1
#define vmv_v_x_i8m8 __riscv_vmv_v_x_i8m8
#define vredsum_vs_i32m8_i32m1(a, b, c, d) __riscv_vredsum_vs_i32m8_i32m1(b, c, d)
#define vse16_v_i16m8 __riscv_vse16_v_i16m8
#define vsetvl_e16m4 __riscv_vsetvl_e16m4
#define vsetvl_e16m8 __riscv_vsetvl_e16m8
#define vsetvl_e32m1 __riscv_vsetvl_e32m1
#define vsetvl_e32m2 __riscv_vsetvl_e32m2
#define vsetvl_e32m8 __riscv_vsetvl_e32m8
#define vsetvl_e8m2 __riscv_vsetvl_e8m2
#define vsext_vf2_i32m8 __riscv_vsext_vf2_i32m8
#define vsext_vf4_i32m2 __riscv_vsext_vf4_i32m2
#define vsext_vf4_i32m8 __riscv_vsext_vf4_i32m8
#define vsll_vx_i32m8 __riscv_vsll_vx_i32m8
#define vundefined_i32m1 __riscv_vundefined_i32m1
#define vadd_vv_i32m2 __riscv_vadd_vv_i32m2
#define vdiv_vx_i32m8 __riscv_vdiv_vx_i32m8
#define vle32_v_i32m1 __riscv_vle32_v_i32m1
#define vmax_vx_i32m2 __riscv_vmax_vx_i32m2
#define vmax_vx_i32m8 __riscv_vmax_vx_i32m8
#define vmin_vx_i16m8 __riscv_vmin_vx_i16m8
#define vmin_vx_i32m2 __riscv_vmin_vx_i32m2
#define vmin_vx_i32m8 __riscv_vmin_vx_i32m8
#define vmul_vx_i32m2 __riscv_vmul_vx_i32m2
#define vmv_x_s_i32m1_i32 __riscv_vmv_x_s_i32m1_i32
#define vnclip_wx_i16m4 __riscv_vnclip_wx_i16m4
#define vnclip_wx_i8m2 __riscv_vnclip_wx_i8m2
#define vredsum_vs_i32m2_i32m1(a, b, c, d) __riscv_vredsum_vs_i32m2_i32m1(b, c, d)
#define vse8_v_i8mf2 __riscv_vse8_v_i8mf2
#define vsub_vx_i32m8_m(a, b, c, d, e) __riscv_vsub_vx_i32m8_m(a, b, d, e)
#define vnclip_wx_i16m1 __riscv_vnclip_wx_i16m1
#define vnclip_wx_i8mf2 __riscv_vnclip_wx_i8mf2
#define vse16_v_i16m4 __riscv_vse16_v_i16m4
#define vse8_v_i8m2 __riscv_vse8_v_i8m2
#define vslide1up_vx_i32m4 __riscv_vslide1up_vx_i32m4
#define vmin_vx_i32m4 __riscv_vmin_vx_i32m4
#define vse32_v_i32m4 __riscv_vse32_v_i32m4
#define vmax_vx_i32m4 __riscv_vmax_vx_i32m4
#define vnclip_wx_i8m1 __riscv_vnclip_wx_i8m1
#define vnclip_wx_i16m2 __riscv_vnclip_wx_i16m2
#define vsse8_v_i8m1 __riscv_vsse8_v_i8m1
#endif
#endif

#elif defined(USE_PEXT)
#include <rvp_intrinsic.h>
#endif

#include <stdbool.h>
#include <string.h>

#include "muriscv_nn_math_types.h"
#include "muriscv_nn_types.h"
#include "muriscv_nn_util.h"

#ifdef __cplusplus
extern "C" {
#endif

// TODO(fabianpedd): write some comments explaining these macros...
#define LEFT_SHIFT(_shift) (_shift > 0 ? _shift : 0)
#define RIGHT_SHIFT(_shift) (_shift > 0 ? 0 : -_shift)
#define MASK_IF_ZERO(x) (x) == 0 ? ~0 : 0
#define MASK_IF_NON_ZERO(x) (x) != 0 ? ~0 : 0
#define SELECT_USING_MASK(mask, a, b) ((mask) & (a)) ^ (~(mask) & (b))

#if defined(USE_PEXT)
#define MAX(A, B) __rv_max(A, B)
#define MIN(A, B) __rv_min(A, B)
#else
#define MAX(A, B) ((A) > (B) ? (A) : (B))
#define MIN(A, B) ((A) < (B) ? (A) : (B))
#endif

#define CLAMP(x, h, l) MAX(MIN((x), (h)), (l))
#define REDUCE_MULTIPLIER(_mult) ((_mult < 0x7FFF0000) ? ((_mult + (1 << 15)) >> 16) : 0x7FFF)

/**
 * @brief definition to pack four 8 bit values.
 */
#if defined(USE_PEXT)
#define PACK_Q7x4_32x1(v0, v1, v2, v3) ((__rv_packu((uint8_t)(v0), (uint8_t)(v2))) | ((__rv_packu((uint8_t)(v1), (uint8_t)(v3))) << 8))
#else
#define PACK_Q7x4_32x1(v0, v1, v2, v3)                                                                                 \
    ((((int32_t)(v0) << 0) & (int32_t)0x000000FF) | (((int32_t)(v1) << 8) & (int32_t)0x0000FF00) |                     \
     (((int32_t)(v2) << 16) & (int32_t)0x00FF0000) | (((int32_t)(v3) << 24) & (int32_t)0xFF000000))
#endif




/**
 * @brief definition to pack two 16 bit values.
 */
#define PACK_Q15x2_32x1(v0, v1) (((int32_t)v0 & (int32_t)0xFFFF) | ((int32_t)v1 << 16))

/**
 * @brief Union for SIMD access of q31/q15/q7 types
 */
union muriscv_nn_word
{
    q31_t word;
    /**< q31 type */
    q15_t half_words[2];
    /**< q15 type */
    q7_t bytes[4];
    /**< q7 type */
};

/**
 * @brief Union for data type long long
 */
struct muriscv_nn_double
{
    uint32_t low;
    int32_t high;
};

union muriscv_nn_long_long
{
    int64_t long_long;
    struct muriscv_nn_double word;
};

static inline void muriscv_nn_q7_to_q15_with_offset(const q7_t *src, q15_t *dst, uint32_t block_size, q15_t offset)
{

    // TODO(fabianpedd): Vectorize

    /* Run the below code for scalar reference cores */
    /* Loop over block_size number of values */
    int block_cnt = block_size;

    while (block_cnt > 0)
    {
        *dst++ = (q15_t)*src++ + offset;

        /* Decrement the loop counter */
        block_cnt--;
    }
}

/**
 * @brief General Matrix-multiplication function with per-channel requantization.
 * @param[in]       input_row    pointer to row operand
 * @param[in]       input_col    pointer to col operand
 * @param[in]       output_ch    number of rows of input_row
 * @param[in]       col_batches  number of column batches. Range: 1 to 4
 * @param[in]       output_shift  pointer to per output channel requantization shift parameter.
 * @param[in]       output_mult   pointer to per output channel requantization multiplier parameter.
 * @param[in]       out_offset    output tensor offset.
 * @param[in]       col_offset    input tensor(col) offset.
 * @param[in]       row_offset    kernel offset(row). Not used.
 * @param[in]       out_activation_min   minimum value to clamp the output to. Range : int8
 * @param[in]       out_activation_max   maximum value to clamp the output to. Range : int8
 * @param[in]       row_len       number of elements in each row
 * @param[in]       bias          per output channel bias. Range : int32
 * @param[in,out]   out           pointer to output
 * @return     The function returns one of the two
 *              1. The incremented output pointer for a successful operation or
 *              2. NULL if implementation is not available.
 *
 * @details   Supported framework: TensorFlow Lite
 */
q7_t *muriscv_nn_mat_mult_s8(const q7_t *input_row,
                             const q7_t *input_col,
                             const uint16_t output_ch,
                             const uint16_t col_batches,
                             const int32_t *output_shift,
                             const int32_t *output_mult,
                             const int32_t out_offset,
                             const int32_t col_offset,
                             const int32_t row_offset,
                             const int16_t out_activation_min,
                             const int16_t out_activation_max,
                             const uint16_t row_len,
                             const int32_t *const bias,
                             q7_t *out);

/**
 * @brief Matrix-multiplication function for convolution with per-channel requantization for 16 bits convolution.
 * @param[in]       input_a     pointer to operand A
 * @param[in]       input_b     pointer to operand B, always consists of 2 vectors.
 * @param[in]       output_ch   number of rows of A
 * @param[in]       out_shift  pointer to per output channel requantization shift parameter.
 * @param[in]       out_mult   pointer to per output channel requantization multiplier parameter.
 * @param[in]       activation_min   minimum value to clamp the output to. Range : int16
 * @param[in]       activation_max   maximum value to clamp the output to. Range : int16
 * @param[in]       num_col_a   number of columns of A
 * @param[in]       output_bias per output channel bias. Range : int64
 * @param[in,out]   out_0       pointer to output
 * @return     The function returns one of the two
 *              1. The incremented output pointer for a successful operation or
 *              2. NULL if implementation is not available.
 *
 * @details   This function does the matrix multiplication of weight matrix for all output channels
 *            with 2 columns from im2col and produces two elements/output_channel. The outputs are
 *            clamped in the range provided by activation min and max.
 *            Supported framework: TensorFlow Lite micro.
 */
q15_t *muriscv_nn_mat_mult_kernel_s16(const q7_t *input_a,
                                      const q15_t *input_b,
                                      const int32_t output_ch,
                                      const int32_t *out_shift,
                                      const int32_t *out_mult,
                                      const int16_t activation_min,
                                      const int16_t activation_max,
                                      const int32_t num_col_a,
                                      const int64_t *const output_bias,
                                      q15_t *out_0);

/**
 * @brief General Matrix-multiplication without requantization for one row & one column
 * @param[in]       row_elements  number of row elements
 * @param[in]       row_base      pointer to row operand
 * @param[in]       col_base      pointer to col operand
 * @param[out]      sum_col       pointer to store sum of column elements
 * @param[out]      output        pointer to store result of multiply-accumulate
 * @return     The function returns the multiply-accumulated result of the row by column.
 *
 * @details Pseudo-code
 *      *output = 0
 *      sum_col = 0
 *      for (i = 0; i < row_elements; i++)
 *          *output += row_base[i] * col_base[i]
 *          sum_col += col_base[i]
 *
 */
muriscv_nn_status muriscv_nn_mat_mul_core_1x_s8(int32_t row_elements,
                                                const int8_t *row_base,
                                                const int8_t *col_base,
                                                int32_t *const sum_col,
                                                int32_t *const output);

/**
 * @brief Matrix-multiplication with requantization & activation function for four rows and one column
 * @param[in]       row_elements  number of row elements
 * @param[in]       offset        offset between rows. Can be the same as row_elements.
 *                                For e.g, in a 1x1 conv scenario with stride as 1.
 * @param[in]       row_base      pointer to row operand
 * @param[in]       col_base      pointer to col operand
 * @param[in]       out_ch        Number of output channels
 * @param[in]       conv_params   Pointer to convolution parameters like offsets and activation values
 * @param[in]       quant_params  Pointer to per-channel quantization parameters
 * @param[in]       bias          Pointer to per-channel bias
 * @param[out]      output        Pointer to output where int8 results are stored.
 *
 * @return     The function returns the updated output pointer or NULL if implementation is not available.
 *
 * @details Compliant to TFLM int8 specification.
 */
int8_t *muriscv_nn_mat_mul_core_4x_s8(const int32_t row_elements,
                                      const int32_t offset,
                                      const int8_t *row_base,
                                      const int8_t *col_base,
                                      const int32_t out_ch,
                                      const muriscv_nn_conv_params *conv_params,
                                      const muriscv_nn_per_channel_quant_params *quant_params,
                                      const int32_t *bias,
                                      int8_t *output);

/**
 * @brief General Matrix-multiplication function with per-channel requantization.
 *        This function assumes:
 *        - LHS input matrix NOT transposed (nt)
 *        - RHS input matrix transposed (t)
 *
 *  @note This operation also performs the broadcast bias addition before the requantization
 *
 * @param[in]  lhs                Pointer to the LHS input matrix
 * @param[in]  rhs                Pointer to the RHS input matrix
 * @param[in]  bias               Pointer to the bias vector. The length of this vector is equal to the number of
 * output columns (or RHS input rows)
 * @param[out] dst                Pointer to the output matrix with "m" rows and "n" columns
 * @param[in]  dst_multipliers    Pointer to the multipliers vector needed for the per-channel requantization.
 *                                The length of this vector is equal to the number of output columns (or RHS input
 * rows)
 * @param[in]  dst_shifts         Pointer to the shifts vector needed for the per-channel requantization. The length
 * of this vector is equal to the number of output columns (or RHS input rows)
 * @param[in]  lhs_rows           Number of LHS input rows
 * @param[in]  rhs_rows           Number of RHS input rows
 * @param[in]  rhs_cols           Number of LHS/RHS input columns
 * @param[in]  lhs_offset         Offset to be applied to the LHS input value
 * @param[in]  dst_offset         Offset to be applied the output result
 * @param[in]  activation_min     Minimum value to clamp down the output. Range : int8
 * @param[in]  activation_max     Maximum value to clamp up the output. Range : int8
 *
 * @return     The function returns <code>MURISCV_NN_SUCCESS</code>
 *
 */
muriscv_nn_status muriscv_nn_mat_mult_nt_t_s8(const q7_t *lhs,
                                              const q7_t *rhs,
                                              const q31_t *bias,
                                              q7_t *dst,
                                              const int32_t *dst_multipliers,
                                              const int32_t *dst_shifts,
                                              const int32_t lhs_rows,
                                              const int32_t rhs_rows,
                                              const int32_t rhs_cols,
                                              const int32_t lhs_offset,
                                              const int32_t dst_offset,
                                              const int32_t activation_min,
                                              const int32_t activation_max);

/**
 * @brief s8 Vector by Matrix (transposed) multiplication
 *
 * @param[in]      lhs             Input left-hand side vector
 * @param[in]      rhs             Input right-hand side matrix (transposed)
 * @param[in]      bias            Input bias
 * @param[out]     dst             Output vector
 * @param[in]      lhs_offset      Offset to be added to the input values of the left-hand side vector.
 *                                 Range: -127 to 128
 * @param[in]      rhs_offset      Not used
 * @param[in]      dst_offset      Offset to be added to the output values. Range: -127 to 128
 * @param[in]      dst_multiplier  Output multiplier
 * @param[in]      dst_shift       Output shift
 * @param[in]      rhs_cols        Number of columns in the right-hand side input matrix
 * @param[in]      rhs_rows        Number of rows in the right-hand side input matrix
 * @param[in]      activation_min  Minimum value to clamp the output to. Range: int8
 * @param[in]      activation_max  Maximum value to clamp the output to. Range: int8
 * @param[in]      address_offset  Memory position offset for dst. First output is stored at 'dst', the
 *                                 second at 'dst + address_offset' and so on. Default value is typically 1.
 *
 * @return         The function returns <code>MURISCV_NN_SUCCESS</code>
 *
 */
muriscv_nn_status muriscv_nn_vec_mat_mult_t_s8(const q7_t *lhs,
                                               const q7_t *rhs,
                                               const q31_t *bias,
                                               q7_t *dst,
                                               const int32_t lhs_offset,
                                               const int32_t rhs_offset,
                                               const int32_t dst_offset,
                                               const int32_t dst_multiplier,
                                               const int32_t dst_shift,
                                               const int32_t rhs_cols,
                                               const int32_t rhs_rows,
                                               const int32_t activation_min,
                                               const int32_t activation_max,
                                               const int32_t address_offset);

/**
 * @brief s16 Vector by Matrix (transposed) multiplication
 *
 * @param[in]      lhs             Input left-hand side vector
 * @param[in]      rhs             Input right-hand side matrix (transposed)
 * @param[in]      bias            Input bias
 * @param[out]     dst             Output vector
 * @param[in]      dst_multiplier  Output multiplier
 * @param[in]      dst_shift       Output shift
 * @param[in]      rhs_cols        Number of columns in the right-hand side input matrix
 * @param[in]      rhs_rows        Number of rows in the right-hand side input matrix
 * @param[in]      activation_min  Minimum value to clamp the output to. Range: int16
 * @param[in]      activation_max  Maximum value to clamp the output to. Range: int16
 *
 * @return         The function returns <code>MURISCV_NN_SUCCESS</code>
 *
 */
muriscv_nn_status muriscv_nn_vec_mat_mult_t_s16(const q15_t *lhs,
                                                const q7_t *rhs,
                                                const q63_t *bias,
                                                q15_t *dst,
                                                const int32_t dst_multiplier,
                                                const int32_t dst_shift,
                                                const int32_t rhs_cols,
                                                const int32_t rhs_rows,
                                                const int32_t activation_min,
                                                const int32_t activation_max);

/**
 * @brief s8 Vector by Matrix (transposed) multiplication with s16 output
 *
 * @param[in]      lhs             Input left-hand side vector
 * @param[in]      rhs             Input right-hand side matrix (transposed)
 * @param[out]     dst             Output vector
 * @param[in]      lhs_offset      Offset to be added to the input values of the left-hand side
 *                                 vector. Range: -127 to 128
 * @param[in]      rhs_offset      Not used
 * @param[in]      scatter_offset  Address offset for dst. First output is stored at 'dst', the
 *                                 second at 'dst + scatter_offset' and so on.
 * @param[in]      dst_multiplier  Output multiplier
 * @param[in]      dst_shift       Output shift
 * @param[in]      rhs_cols        Number of columns in the right-hand side input matrix
 * @param[in]      rhs_rows        Number of rows in the right-hand side input matrix
 * @param[in]      activation_min  Minimum value to clamp the output to. Range: int16
 * @param[in]      activation_max  Maximum value to clamp the output to. Range: int16
 *
 * @return         The function returns <code>MURISCV_NN_SUCCESS</code>
 *
 */
muriscv_nn_status muriscv_nn_vec_mat_mult_t_svdf_s8(const q7_t *lhs,
                                                    const q7_t *rhs,
                                                    q15_t *dst,
                                                    const int32_t lhs_offset,
                                                    const int32_t rhs_offset,
                                                    const int32_t scatter_offset,
                                                    const int32_t dst_multiplier,
                                                    const int32_t dst_shift,
                                                    const int32_t rhs_cols,
                                                    const int32_t rhs_rows,
                                                    const int32_t activation_min,
                                                    const int32_t activation_max);

/**
 * @brief Depthwise convolution of transposed rhs matrix with 4 lhs matrices. To be used in padded cases where
 *        the padding is -lhs_offset(Range: int8). Dimensions are the same for lhs and rhs.
 *
 * @param[in]      lhs             Input left-hand side matrix
 * @param[in]      rhs             Input right-hand side matrix (transposed)
 * @param[in]      lhs_offset      LHS matrix offset(input offset). Range: -127 to 128
 * @param[in]      num_ch          Number of channels in LHS/RHS
 * @param[in]      out_shift       Per channel output shift. Length of vector is equal to number of channels
 * @param[in]      out_mult        Per channel output multiplier. Length of vector is equal to number of channels
 * @param[in]      out_offset      Offset to be added to the output values. Range: -127 to 128
 * @param[in]      activation_min  Minimum value to clamp the output to. Range: int8
 * @param[in]      activation_max  Maximum value to clamp the output to. Range: int8
 * @param[in]      row_x_col       (row_dimension * col_dimension) of LHS/RHS matrix
 * @param[in]      output_bias     Per channel output bias. Length of vector is equal to number of channels
 * @param[in]      out             Output pointer
 *
 * @return         The function returns one of the two
 *                  - Updated output pointer if an implementation is available
 *                  - NULL if no implementation is available.
 *
 * @note           If number of channels is not a multiple of 4, upto 3 elements outside the boundary will be read
 * out for the following.
 *                  - Output shift
 *                  - Output multiplier
 *                  - Output bias
 *                  - rhs
 */
q7_t *muriscv_nn_depthwise_conv_nt_t_padded_s8(const q7_t *lhs,
                                               const q7_t *rhs,
                                               const int32_t lhs_offset,
                                               const uint16_t num_ch,
                                               const int32_t *out_shift,
                                               const int32_t *out_mult,
                                               const int32_t out_offset,
                                               const int32_t activation_min,
                                               const int32_t activation_max,
                                               const uint16_t row_x_col,
                                               const int32_t *const output_bias,
                                               q7_t *out);

/**
 * @brief Depthwise convolution of transposed rhs matrix with 4 lhs matrices. To be used in non-padded cases.
 *        Dimensions are the same for lhs and rhs.
 *
 * @param[in]      lhs             Input left-hand side matrix
 * @param[in]      rhs             Input right-hand side matrix (transposed)
 * @param[in]      lhs_offset      LHS matrix offset(input offset). Range: -127 to 128
 * @param[in]      num_ch          Number of channels in LHS/RHS
 * @param[in]      out_shift       Per channel output shift. Length of vector is equal to number of channels.
 * @param[in]      out_mult        Per channel output multiplier. Length of vector is equal to number of channels.
 * @param[in]      out_offset      Offset to be added to the output values. Range: -127 to 128
 * @param[in]      activation_min  Minimum value to clamp the output to. Range: int8
 * @param[in]      activation_max  Maximum value to clamp the output to. Range: int8
 * @param[in]       row_x_col       (row_dimension * col_dimension) of LHS/RHS matrix
 * @param[in]      output_bias     Per channel output bias. Length of vector is equal to number of channels.
 * @param[in]      out             Output pointer
 *
 * @return         The function returns one of the two
 *                  - Updated output pointer if an implementation is available
 *                  - NULL if no implementation is available.
 *
 * @note           If number of channels is not a multiple of 4, upto 3 elements outside the boundary will be read
 * out for the following.
 *                  - Output shift
 *                  - Output multiplier
 *                  - Output bias
 *                  - rhs
 */
q7_t *muriscv_nn_depthwise_conv_nt_t_s8(const q7_t *lhs,
                                        const q7_t *rhs,
                                        const int32_t lhs_offset,
                                        const uint16_t num_ch,
                                        const int32_t *out_shift,
                                        const int32_t *out_mult,
                                        const int32_t out_offset,
                                        const int32_t activation_min,
                                        const int32_t activation_max,
                                        const uint16_t row_x_col,
                                        const int32_t *const output_bias,
                                        q7_t *out);

/**
 * @brief Matrix-multiplication function for convolution with per-channel requantization.
 * @param[in]       input_a     pointer to operand A
 * @param[in]       input_b     pointer to operand B, always consists of 2 vectors.
 * @param[in]       output_ch   number of rows of A
 * @param[in]       out_shift  pointer to per output channel requantization shift parameter.
 * @param[in]       out_mult   pointer to per output channel requantization multiplier parameter.
 * @param[in]       out_offset      output tensor offset.
 * @param[in]       activation_min   minimum value to clamp the output to. Range : int8
 * @param[in]       activation_max   maximum value to clamp the output to. Range : int8
 * @param[in]       num_col_a   number of columns of A
 * @param[in]       output_bias per output channel bias. Range : int32
 * @param[in,out]   out_0       pointer to output
 * @return     The function returns one of the two
 *              1. The incremented output pointer for a successful operation or
 *              2. NULL if implementation is not available.
 *
 * @details   This function does the matrix multiplication of weight matrix for all output channels
 *            with 2 columns from im2col and produces two elements/output_channel. The outputs are
 *            clamped in the range provided by activation min and max.
 *            Supported framework: TensorFlow Lite micro.
 */
q7_t *muriscv_nn_mat_mult_kernel_s8_s16(const q7_t *input_a,
                                        const q15_t *input_b,
                                        const uint16_t output_ch,
                                        const int32_t *out_shift,
                                        const int32_t *out_mult,
                                        const int32_t out_offset,
                                        const int16_t activation_min,
                                        const int16_t activation_max,
                                        const uint16_t num_col_a,
                                        const int32_t *const output_bias,
                                        q7_t *out_0);

/**
 * @brief Common softmax function for s8 input and s8 or s16 output
 * @param[in]  input          Pointer to the input tensor
 * @param[in]  num_rows       Number of rows in the input tensor
 * @param[in]  row_size       Number of elements in each input row
 * @param[in]  mult           Input quantization multiplier
 * @param[in]  shift          Input quantization shift within the range [0, 31]
 * @param[in]  diff_min       Minimum difference with max in row. Used to check if
 *                            the quantized exponential operation can be performed
 * @param[in]  int16_output   Indicating s8 output if 0 else s16 output
 * @param[out] output         Pointer to the output tensor
 *
 * @note Supported framework: TensorFlow Lite micro (bit-accurate)
 *
 */
void muriscv_nn_softmax_common_s8(const int8_t *input,
                                  const int32_t num_rows,
                                  const int32_t row_size,
                                  const int32_t mult,
                                  const int32_t shift,
                                  const int32_t diff_min,
                                  const bool int16_output,
                                  void *output);

/**
 * @defgroup NNBasicMath Basic Math Functions for Neural Network Computation
 *
 * Basic Math Functions for Neural Network Computation
 *
 */

/**
 @brief         Read 2 q15 elements and post increment pointer. Always uses memcpy for read, consistent speed, regardless of alignment
 @param[in]     in_q15   Pointer to pointer that holds address of input.
 @return        q31 value
*/
static inline q31_t muriscv_nn_read_q15x2_ia_slow(const q15_t **in_q15)
{
    q31_t val;
    memcpy(&val, *in_q15, 4);
    *in_q15 += 2;

    return val;
}

/**
 @brief         Read 2 q15 elements and post increment pointer.  Performs best for word aligned reads, otherwise performs extremely slowly
 @param[in]     in_q15   Pointer to pointer that holds address of input.
 @return        q31 value
*/
static inline q31_t muriscv_nn_read_q15x2_ia_fast(const q15_t **in_q15)
{
    q31_t val;
    val = (*((uint32_t*)(*in_q15)));
    *in_q15 += 2;

    return val;
}
/**
 @brief         Read 2 q15 elements and post increment pointer.  Always performs read on word boundaries
 @param[in]     in_q15           Pointer to pointer that holds address of input.
 @param[in]     alignment        Number of q15 values away from word aligned boundary
 @return        q31 value
*/
static inline q31_t muriscv_nn_read_q15x2_ia_aligned(const q15_t **in_q15, const uint8_t alignment)
{
    q31_t val;
    if(alignment == 0)
    {
         val = (*((uint32_t*)(*in_q15)));       
    }
    else
    {
         val = (uint32_t)((*((uint64_t*)(*in_q15 - 1))) >> 16); 
    }
    *in_q15 += 2;

    return val;
}
/**
  @brief         Read 4 q7 from q7 pointer and post increment pointer.  Performs best for word aligned reads, otherwise performs extremely slowly
  @param[in]     in_q7       Pointer to pointer that holds address of input.
  @return        q31 value
 */
static inline q31_t muriscv_nn_read_q7x4_ia_fast(const q7_t **in_q7)
{
    q31_t val;
    val = (*((q31_t*)(*in_q7)));
    *in_q7 += 4;
    return val;
}
/**
  @brief         Read 4 q7 from q7 pointer and post increment pointer.  Always uses memcpy for read, consistent speed, regardless of alignment
  @param[in]     in_q7       Pointer to pointer that holds address of input.
  @return        q31 value
 */
static inline q31_t muriscv_nn_read_q7x4_ia_slow(const q7_t **in_q7)
{
    q31_t val;
    memcpy(&val, *in_q7, 4);
    *in_q7 += 4;
    return val;
}
/**
  @brief         Read 4 q7 from q7 pointer and post increment pointer.  Always performs read on memory word boundaries
  @param[in]     in_q7            Pointer to pointer that holds address of input.
  @param[in]     alignment        Number of q7 values away from word aligned boundary
  @param[in]     alignment_bits   Number of bits to shift to receive desired value, precalculated for efficency
  @return        q31 value
 */
static inline q31_t muriscv_nn_read_q7x4_ia_aligned(const q7_t **in_q7, const uint8_t alignment, const uint8_t alignment_bits)
{
    q31_t val;
    if (alignment == 0)
    {
        val = (*((q31_t*)(*in_q7)));
    }
    else
    {
        val = (uint32_t)((*((uint64_t*)(*in_q7 - alignment))) >> (alignment_bits));
    }
    *in_q7 += 4;
    return val;
}
/**
  @brief         Read 2 q15 from q15 pointer.
  @param[in]     in_q15   pointer to address of input.
  @return        q31 value
 */
static inline q31_t muriscv_nn_read_q15x2(const q15_t *in_q15)
{
    q31_t val;
    val = (*((uint32_t*)(in_q15)));
    return val;
}

/**
  @brief         Read 4 q7 values.
  @param[in]     in_q7       pointer to address of input.
  @return        q31 value
 */
static inline q31_t muriscv_nn_read_q7x4(const q7_t *in_q7)
{
    q31_t val;
    val = (*((uint32_t*)(in_q7)));

    return val;
}

/**
  @brief         Write four q7 to q7 pointer and increment pointer afterwards.
  @param[in]     in       Double pointer to input value
  @param[in]     value    Four bytes to copy
 */
static inline void muriscv_nn_write_q7x4_ia(q7_t **in, q31_t value)
{
    memcpy(*in, &value, 4);
    *in += 4;
}

/**
  @brief         Write four q7 to q7 pointer and increment pointer afterwards.
  @param[in]     in       Double pointer to input value
  @param[in]     value    Four bytes to copy
 */
static inline void muriscv_nn_write_q7x4(q7_t *in, q31_t value) { memcpy(in, &value, 4); }

/**
  @brief         Write four q7 to q7 pointer and increment pointer afterwards.
  @param[in]     in       Double pointer to input value
  @param[in]     value    Four bytes to copy
 */
static inline void muriscv_nn_write_q7x4_fast(q7_t *in, q31_t value) 
{
    *((uint32_t*)(in)) = value;
}

// Macros for shortening quantization functions' names and avoid long lines
#define MUL_SAT(a, b) muriscv_nn_doubling_high_mult_no_sat((a), (b))

#define MUL_POW2(a, b) muriscv_nn_mult_by_power_of_two((a), (b))
#define DIV_POW2(a, b) muriscv_nn_divide_by_power_of_two((a), (b))

#define EXP_ON_NEG(x) muriscv_nn_exp_on_negative_values((x))
#define ONE_OVER1(x) muriscv_nn_one_over_one_plus_x_for_x_in_0_1((x))

/**
 * @brief           Doubling high multiply without saturation. This is intended
 *                  for requantization where the scale is a positive integer
 *
 * @param[in]       m1        Multiplicand. Range: {Q31_MIN, Q31_MAX}
 * @param[in]       m2        Multiplier Range: {Q31_MIN, Q31_MAX}
 * @return          Result of multiplication.
 * @note            The result of this matches that of neon instruction
 *                  VQRDMULH for m1 in range {Q31_MIN, Q31_MAX} and m2 in
 *                  range {Q31_MIN + 1, Q31_MAX}. Saturation occurs when
 *                  m1 equals m2 equals Q31_MIN and that is not handled by
 *                  this function.
 *
 */
static inline q31_t muriscv_nn_doubling_high_mult_no_sat(const q31_t m1, const q31_t m2)
{
    q31_t result = 0;
    union muriscv_nn_long_long mult;

    // Rounding offset to add for a right shift of 31
    mult.word.low = 1 << 30;
    mult.word.high = 0;

    // Gets resolved as a SMLAL instruction (probably not on RISC-V)
    mult.long_long = mult.long_long + (q63_t)m1 * m2;

    // Utilize all of the upper 32 bits. This is the doubling step
    // as well.
    result = (int32_t)(mult.long_long >> 31);

    return result;
}

/**
 * @brief           Rounding divide by power of two.
 * @param[in]       dividend - Dividend
 * @param[in]       exponent - Divisor = power(2, exponent)
 *                             Range: [0, 31]
 * @return          Rounded result of division. Midpoint is rounded away from zero.
 *
 */
static inline q31_t muriscv_nn_divide_by_power_of_two(const q31_t dividend, const q31_t exponent)
{
    q31_t result = 0;
    const q31_t remainder_mask = (1 << exponent) - 1;
    int32_t remainder = remainder_mask & dividend;

    // Basic division
    result = dividend >> exponent;

    // Adjust 'result' for rounding (mid point away from zero)
    q31_t threshold = remainder_mask >> 1;
    if (result < 0)
    {
        threshold++;
    }
    if (remainder > threshold)
    {
        result++;
    }

    return result;
}

/**
 * @brief           Requantize a given value.
 * @param[in]       val         Value to be requantized
 * @param[in]       multiplier  multiplier. Range {Q31_MIN + 1, Q32_MAX}
 * @param[in]       shift       left or right shift for 'val * multiplier'
 *
 * @return          Returns (val * multiplier)/(2 ^ shift)
 *
 */
static inline q31_t muriscv_nn_requantize(const q31_t val, const q31_t multiplier, const q31_t shift)
{

#ifdef MURISCV_NN_USE_SINGLE_ROUNDING
    const int64_t total_shift = 31 - shift;
    const int64_t new_val = val * (int64_t)multiplier;

    int32_t result = new_val >> (total_shift - 1);
    result = (result + 1) >> 1;

    return result;
#else
    return muriscv_nn_divide_by_power_of_two(
        muriscv_nn_doubling_high_mult_no_sat(val * (1 << LEFT_SHIFT(shift)), multiplier), RIGHT_SHIFT(shift));
#endif
}

#if defined(USE_VEXT)

// TODO(fabianpedd): Clean these muriscv_nn_requantize functions up and find a consitent naming scheme that respects
// types and vector/scalar arguments

/**
 * @brief           Requantize a given vector of values.
 * @param[in]       val         Vector of value to be requantized
 * @param[in]       multiplier  multiplier. Range {Q31_MIN + 1, Q32_MAX}
 * @param[in]       shift       left or right shift for 'val * multiplier'
 *
 * @return          Returns (val * multiplier)/(2 ^ shift) for every vector entry
 *
 */
static inline vint32m8_t
muriscv_nn_requantize_vec(const vint32m8_t val, const q31_t multiplier, const q31_t shift, size_t vl)
{
    // TODO(fabianpedd): implement MURISCV_NN_USE_SINGLE_ROUNDING

    vint32m8_t val_internal = vsmul_vx_i32m8(val, multiplier * (1 << LEFT_SHIFT(shift)), vl);

    // TODO(fabianpedd): close, but sometimes off by 1 bit.
    // in1_off = vssra_vx_i32m8(in1_off, RIGHT_SHIFT(input_1_shift), vl);

    const q31_t remainder_mask = (1 << RIGHT_SHIFT(shift)) - 1;
    vint32m8_t remainder = vand_vx_i32m8(val_internal, remainder_mask, vl);
    vint32m8_t threshold = vmv_v_x_i32m8(remainder_mask >> 1, vl);

    val_internal = vsra_vx_i32m8(val_internal, RIGHT_SHIFT(shift), vl);

    vbool4_t mask = vmslt_vx_i32m8_b4(val_internal, 0, vl);
    threshold = vadd_vx_i32m8_m(mask, threshold, threshold, 1, vl);

    mask = vmsgt_vv_i32m8_b4(remainder, threshold, vl);
    val_internal = vadd_vx_i32m8_m(mask, val_internal, val_internal, 1, vl);

    return val_internal;
}

static inline vint32m4_t
muriscv_nn_requantize_vint32m4(const vint32m4_t val, const q31_t multiplier, const q31_t shift, size_t vl)
{
    // TODO(fabianpedd): implement MURISCV_NN_USE_SINGLE_ROUNDING

    vint32m4_t val_internal = vsmul_vx_i32m4(val, multiplier * (1 << LEFT_SHIFT(shift)), vl);

    // TODO(fabianpedd): close, but sometimes off by 1 bit.
    // in1_off = vssra_vx_i32m4(in1_off, RIGHT_SHIFT(input_1_shift), vl);

    const q31_t remainder_mask = (1 << RIGHT_SHIFT(shift)) - 1;
    vint32m4_t remainder = vand_vx_i32m4(val_internal, remainder_mask, vl);
    vint32m4_t threshold = vmv_v_x_i32m4(remainder_mask >> 1, vl);

    val_internal = vsra_vx_i32m4(val_internal, RIGHT_SHIFT(shift), vl);

    vbool8_t mask = vmslt_vx_i32m4_b8(val_internal, 0, vl);
    threshold = vadd_vx_i32m4_m(mask, threshold, threshold, 1, vl);

    mask = vmsgt_vv_i32m4_b8(remainder, threshold, vl);
    val_internal = vadd_vx_i32m4_m(mask, val_internal, val_internal, 1, vl);

    return val_internal;
}

static inline vint32m2_t
muriscv_nn_requantize_vint32m2(vint32m2_t val, vint32m2_t multiplier, vint32m2_t shift, size_t vl)
{
    // TODO(fabianpedd): implement MURISCV_NN_USE_SINGLE_ROUNDING

    // shift = -shift;
    vuint32m2_t u_shift = vreinterpret_v_i32m2_u32m2(vneg_v_i32m2(shift, vl));

    // int32_t dividend = (int32_t)(((int64_t)multiplier * val + (1 << 30)) >> 31);
    vint32m2_t dividend = vsmul_vv_i32m2(val, multiplier, vl);

    // int32_t result = dividend >> shift;
    vint32m2_t result = vsra_vv_i32m2(dividend, u_shift, vl);

    // int32_t remainder_mask = (1 << shift) - 1;
    vint32m2_t remainder_mask = vsub_vx_i32m2(vsll_vv_i32m2(vmv_v_x_i32m2(1, vl), u_shift, vl), 1, vl);

    // int32_t threshold = remainder_mask >> 1;
    vint32m2_t threshold = vsra_vx_i32m2(remainder_mask, 1, vl);

    // if (result < 0) threshold++;
    vbool16_t mask = vmslt_vx_i32m2_b16(result, 0, vl);
    threshold = vadd_vx_i32m2_m(mask, threshold, threshold, 1, vl);

    // int32_t remainder = remainder_mask & dividend;
    vint32m2_t remainder = vand_vv_i32m2(remainder_mask, dividend, vl);

    // if (remainder > threshold) result++;
    mask = vmsgt_vv_i32m2_b16(remainder, threshold, vl);
    result = vadd_vx_i32m2_m(mask, result, result, 1, vl);

    return result;
}
#endif

/**
 * @brief           Requantize a given 64 bit value.
 * @param[in]       val                 Value to be requantized in the range {-(1<<47)} to {(1<<47) - 1}
 * @param[in]       reduced_multiplier  Reduced multiplier in the range {NN_Q31_MIN + 1, Q32_MAX} to {Q16_MIN + 1,
 * Q16_MAX}
 * @param[in]       shift               Left or right shift for 'val * multiplier' in the range {-31} to {7}
 *
 * @return          Returns (val * multiplier)/(2 ^ shift)
 *
 */
static inline q31_t muriscv_nn_requantize_s64(const q63_t val, const q31_t reduced_multiplier, const q31_t shift)
{
    // TODO(fabianpedd): Implement vector version
    const q63_t new_val = val * reduced_multiplier;

    q31_t result = new_val >> (14 - shift); // 64->32 bit reduction
    result = (result + 1) >> 1;             // Last shift position and insert round

    return result;
}

/**
 * @brief           memcpy optimized for RVV
 * @param[in, out]  dst         Destination pointer
 * @param[in]       src         Source pointer
 * @param[in]       block_size  Number of bytes to copy
 *
 */
static inline void muriscv_nn_memcpy(int8_t *dst, const int8_t *src, size_t block_size)
{
#if defined(USE_VEXT)
    for (size_t vl; block_size > 0; block_size -= vl, src += vl, dst += vl)
    {
        vl = vsetvl_e8m8(block_size);
        vint8m8_t vec_src = vle8_v_i8m8(src, vl);
        vse8_v_i8m8(dst, vec_src, vl);
    }
#else
    memcpy(dst, src, block_size);
#endif
}

/**
 * @brief           memset optimized for RVV
 * @param[in, out]  dst         Destination pointer
 * @param[in]       src         Value to set
 * @param[in]       block_size  Number of bytes to set
 *
 */
static inline void muriscv_nn_memset(int8_t *dst, const int8_t val, size_t block_size)
{
#if defined(USE_VEXT)
    for (size_t vl; block_size > 0; block_size -= vl, dst += vl)
    {
        vl = vsetvl_e8m8(block_size);
        vint8m8_t vec_src = vmv_v_x_i8m8(val, vl);
        vse8_v_i8m8(dst, vec_src, vl);
    }
#else
    memset(dst, val, block_size);
#endif
}

// @note The following functions are used only for softmax layer, scaled bits = 5 assumed

static inline int32_t muriscv_nn_exp_on_negative_values(int32_t val)
{
    int32_t mask = 0;
    int32_t shift = 24;

    const int32_t val_mod_minus_quarter = (val & ((1 << shift) - 1)) - (1 << shift);
    const int32_t remainder = val_mod_minus_quarter - val;
    const int32_t x = (val_mod_minus_quarter << 5) + (1 << 28);
    const int32_t x2 = MUL_SAT(x, x);

    int32_t result = 1895147668 +
        MUL_SAT(1895147668, x + DIV_POW2(MUL_SAT(DIV_POW2(MUL_SAT(x2, x2), 2) + MUL_SAT(x2, x), 715827883) + x2, 1));

#define SELECT_IF_NON_ZERO(x)                                                                                          \
    {                                                                                                                  \
        mask = MASK_IF_NON_ZERO(remainder & (1 << shift++));                                                           \
        result = SELECT_USING_MASK(mask, MUL_SAT(result, x), result);                                                  \
    }

    SELECT_IF_NON_ZERO(1672461947)
    SELECT_IF_NON_ZERO(1302514674)
    SELECT_IF_NON_ZERO(790015084)
    SELECT_IF_NON_ZERO(290630308)
    SELECT_IF_NON_ZERO(39332535)
    SELECT_IF_NON_ZERO(720401)
    SELECT_IF_NON_ZERO(242)

#undef SELECT_IF_NON_ZERO

    mask = MASK_IF_ZERO(val);
    return SELECT_USING_MASK(mask, Q31_MAX, result);
}

static inline q31_t muriscv_nn_mult_by_power_of_two(const int32_t val, const int32_t exp)
{
    const int32_t thresh = ((1 << (31 - exp)) - 1);
    int32_t result = val << exp;
    result = SELECT_USING_MASK(MASK_IF_NON_ZERO(val > thresh), Q31_MAX, result);
    result = SELECT_USING_MASK(MASK_IF_NON_ZERO(val < -thresh), Q31_MIN, result);
    return result;
}

static inline int32_t muriscv_nn_one_over_one_plus_x_for_x_in_0_1(int32_t val)
{
    const int64_t sum = (int64_t)val + (int64_t)Q31_MAX;
    const int32_t half_denominator = (int32_t)((sum + (sum >= 0 ? 1 : -1)) / 2L);
    int32_t x = 1515870810 + MUL_SAT(half_denominator, -1010580540);

    const int32_t shift = (1 << 29);
    x += MUL_POW2(MUL_SAT(x, shift - MUL_SAT(half_denominator, x)), 2);
    x += MUL_POW2(MUL_SAT(x, shift - MUL_SAT(half_denominator, x)), 2);
    x += MUL_POW2(MUL_SAT(x, shift - MUL_SAT(half_denominator, x)), 2);

    return MUL_POW2(x, 1);
}

// Support functions for LSTM
/**
 * @brief Update LSTM function for an iteration step
 *
 * param[in]    input                           Input data
 * param[in]    input_to_input_weight           Input to input gate weights
 * param[in]    input_to_forget_weight          Input to forget gate weights
 * param[in]    input_to_cell_weight            Input to cell gate weights
 * param[in]    input_to_output_weight          Input to output weights
 * param[in]    recurrent_to_input_weight       Recurrent signal to input weights
 * param[in]    recurrent_to_forget_weight      Recurrent signal to forget gate weights
 * param[in]    recurrent_to_cell_weight        Recurrent signal to cell gate weighst
 * param[in]    recurrent_to_output_weight      Recurrent signal to output weights
 * param[in]    lstm                            LSTM parameters
 * param[in]    n_batch                         Batch size
 * param[in]    n_cell                          Cell size
 * param[in]    n_input                         Input size
 * param[in]    n_output                        Output size
 * param[out]   output_state                    Output state
 * param[out]   cell_state                      Internal state
 * param[out]   output                          Output signal
 * param[in] *scratch_buffers                   Struct containing scratch buffers
 */
muriscv_nn_status muriscv_nn_lstm_step_s8_s16(const int8_t *input,
                                            const int8_t *input_to_input_weight,
                                            const int8_t *input_to_forget_weight,
                                            const int8_t *input_to_cell_weight,
                                            const int8_t *input_to_output_weight,
                                            const int8_t *recurrent_to_input_weight,
                                            const int8_t *recurrent_to_forget_weight,
                                            const int8_t *recurrent_to_cell_weight,
                                            const int8_t *recurrent_to_output_weight,
                                            const muriscv_nn_lstm_params *lstm,
                                            const int n_batch,
                                            const int n_cell,
                                            const int n_input,
                                            const int n_output,
                                            int8_t *output_state,
                                            int16_t *cell_state,
                                            int8_t *output,
                                            muriscv_nn_lstm_context *scratch_buffers);

/**
 * @brief         Updates a LSTM gate for an iteration step of LSTM function, int8x8_16 version.
 *
 * param[in]    input                           Input data
 * param[in]    input_to_gate_weights           Input to gate weights
 * param[in]    input_to_gate_bias              Input to gate weights
 * param[in]    input_to_gate_scaling           Input to gate scaling
 * param[in]    activation                      Actival min and max values
 * param[in]    output_state                    Output state
 * param[in]    recurrent_to_gate_weights       Recurrent to gate weights
 * param[in]    recurrent_to_gate_bias          Recurrent to gate bias
 * param[in]    recurrent_to_gate_scaling       Recurrent to gate scaling
 * param[in]    n_batch                         Batch size
 * param[in]    n_input                         Input size
 * param[out]   n_output                        Output size
 * param[in]    activation_type                 Activation type (sigmoid or tanh)
 * param[out]   n_cell                          Cell size
 */
void muriscv_nn_lstm_calculate_gate_s8_s16(const int8_t *input,
                                       const int8_t *input_to_gate_weights,
                                       const int32_t *input_to_gate_bias,
                                       const muriscv_nn_scaling input_to_gate_scaling,
                                       const int8_t *output_state,
                                       const int8_t *recurrent_to_gate_weights,
                                       const int32_t *recurrent_to_gate_bias,
                                       const muriscv_nn_scaling recurrent_to_gate_scaling,
                                       const int32_t n_batch,
                                       const int32_t n_input,
                                       const int32_t n_output,
                                       const int32_t n_cell,
                                       const muriscv_nn_activation_type activation_type,
                                       int16_t *gate);

/**
 * @brief       Update cell state for a single LSTM iteration step, int8x8_16 version.
 * @param[in]   n_block             total number of cells for all batches
 * @param[in]   cell_state_scale    Scaling factor of cell state
 * @param[in]   cell_state          Input/output vector, size n_batch*n_cell
 * @param[in]   input_gate          Input vector of size n_block
 * @param[in]   forget_gate         Input/scratch vector of size n_block, always modified
 * @param[in]   cell_gate           Input vector of size, n_block
 */
void muriscv_nn_lstm_update_cell_state_s16(const int32_t n_block,
                                       const int32_t cell_state_scale,
                                       int16_t *cell_state,
                                       const int16_t *input_gate,
                                       const int16_t *forget_gate,
                                       const int16_t *cell_gate);

/**
 * @brief       Calculate the output state tensor of an LSTM step, s8 input/output and s16 weight version.
 *
 * @param[in]       n_batch                     The number of distinct vectors in each array
 * @param[in]       n_cell                      Number of cells
 * @param[in,out]   cell_state                  Cell state, size n_batch*n_cell
 * @param[in]       cell_state_scale            Scaling of cell_state
 * @param[in]       output_gate                 Output gate
 * @param[in]       hidden_scale                Effective scaling of cell_state .* output_gate
 * @param[in]       hidden_offset               Zero point for cell_state .* output_gate
 * @param[out]      output_state                Output state
 * @param[in]       cell_gate_scratch           Scratch buffer
 */
void muriscv_nn_lstm_update_output_s8_s16(const int n_batch,
                                      const int n_cell,
                                      int16_t *cell_state,
                                      const int32_t cell_state_scale,
                                      const int16_t *output_gate,
                                      const muriscv_nn_scaling hidden_scale,
                                      const int32_t hidden_offset,
                                      int8_t *output_state,
                                      int16_t *cell_gate_scratch);
                                      
/**
 * @brief The result of the multiplication is accumulated to the passed result buffer.
 * Multiplies a matrix by a "batched" vector (i.e. a matrix with a batch dimension composed by input vectors independent
 * from each other).
 *
 * @param[in]   lhs_in           Batched vector
 * @param[in]   rhs_in           Weights - input matrix (H(Rows)xW(Columns))
 * @param[in]   bias             Bias vector
 * @param[out]  dst              Output
 * @param[in]   dst_offset       Output offset
 * @param[in]   dst_multiplier   Multiplier for quantization
 * @param[in]   dst_shift        Shift for quantization
 * @param[in]   rhs_cols         Vector/matarix column length
 * @param[in]   rhs_rows         Row count of matrix
 * @param[in]   batch            Batch size
 */
void muriscv_nn_vec_mat_mul_result_acc_s8(const int8_t *lhs_in,
                                      const int8_t *rhs_in,
                                      const int32_t *bias,
                                      int16_t *dst,
                                      const int32_t dst_offset,
                                      const int32_t dst_multiplier,
                                      const int32_t dst_shift,
                                      const int32_t rhs_cols,
                                      const int32_t rhs_rows,
                                      const int32_t batch);

/**
 * @brief s16 elementwise multiplication with s8 output
 * @param[in]       input_1_vect        pointer to input vector 1
 * @param[in]       input_2_vect        pointer to input vector 2
 * @param[in,out]   output              pointer to output vector
 * @param[in]       out_offset          output offset
 * @param[in]       out_mult            output multiplier
 * @param[in]       out_shift           output shift
 * @param[in]       block_size          number of samples
 * @return          The function returns MURISCV_NN_SUCCESS
 *
 * @details   Supported framework: TensorFlow Lite micro
 */
muriscv_nn_status muriscv_nn_elementwise_mul_s16_s8(const int16_t *input_1_vect,
                                               const int16_t *input_2_vect,
                                               int8_t *output,
                                               const int32_t out_offset,
                                               const int32_t out_mult,
                                               const int32_t out_shift,
                                               const int32_t block_size);



#ifdef __cplusplus
}
#endif

#endif /* _MURISCV_NN_SUPPORT_FUNCTIONS_H */
