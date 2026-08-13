/*
 * SPDX-FileCopyrightText: Copyright 2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
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
 * Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
 *
 */

/* ----------------------------------------------------------------------
 * Project:      muRISCV NN Library
 * Title:        muriscv_vector_sum_s8
 * Description:  Generic function for calculating vector sums
 *
 * $Date:        19 February 2024
 * $Revision:    V.1.0.0
 *
 * Target :  RISCV V-EXT architectures
 *
 * -------------------------------------------------------------------- */

#include <string.h>
#include <stdint.h>

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup Public
 */

/**
 * @addtogroup FC
 * @{
 */

/*
 * S8 vector sum fuction in preparation for e.g. kernel sums in fully connected and matrix multiplication layer function
 *
 * Refer header file for details.
 *
 */
muriscv_nn_status muriscv_nn_vector_sum_s8(int32_t *vector_sum_buf,
                                           const int32_t vector_cols,
                                           const int32_t vector_rows,
                                           const int8_t *vector_data,
                                           const int32_t lhs_offset,
                                           const int32_t rhs_offset,
                                           const int32_t *bias_data)
{

    if (bias_data)
    {
        memcpy(vector_sum_buf, bias_data, vector_rows * sizeof(int32_t));
    }
    else
    {
        memset(vector_sum_buf, 0, vector_rows * sizeof(int32_t));
    }

    if (lhs_offset)
    {
#if defined(USE_VEXT)
        // ARM CODE.  NEEDS TO BE CONVERTED TO RISCV
        /*
        const int32_t row_loop_cnt = vector_rows / 4;

        for (int i_row_loop_cnt = 0; i_row_loop_cnt < row_loop_cnt; i_row_loop_cnt++)
        {
            const int32_t col_loop_cnt = (vector_cols + 15) / 16;

            const int8_t *vector_0 = vector_data;
            const int8_t *vector_1 = vector_data + vector_cols;
            const int8_t *vector_2 = vector_data + 2 * vector_cols;
            const int8_t *vector_3 = vector_data + 3 * vector_cols;

            int32_t vector_sum_0 = 0;
            int32_t vector_sum_1 = 0;
            int32_t vector_sum_2 = 0;
            int32_t vector_sum_3 = 0;

            uint32_t col_cnt = (uint32_t)vector_cols;

            for (int i = 0; i < col_loop_cnt; i++)
            {
                mve_pred16_t p = vctp8q(col_cnt);
                col_cnt -= 16;

                const int8x16_t ker_0 = vldrbq_z_s8(vector_0, p);
                vector_sum_0 = vaddvaq_s8(vector_sum_0, ker_0);

                const int8x16_t ker_1 = vldrbq_z_s8(vector_1, p);
                vector_sum_1 = vaddvaq_s8(vector_sum_1, ker_1);

                const int8x16_t ker_2 = vldrbq_z_s8(vector_2, p);
                vector_sum_2 = vaddvaq_s8(vector_sum_2, ker_2);

                const int8x16_t ker_3 = vldrbq_z_s8(vector_3, p);
                vector_sum_3 = vaddvaq_s8(vector_sum_3, ker_3);

                vector_0 += 16;
                vector_1 += 16;
                vector_2 += 16;
                vector_3 += 16;
            }
            vector_data += 4 * vector_cols;

            if (rhs_offset)
            {
                vector_sum_0 += vector_cols * rhs_offset;
                vector_sum_1 += vector_cols * rhs_offset;
                vector_sum_2 += vector_cols * rhs_offset;
                vector_sum_3 += vector_cols * rhs_offset;
            }

            vector_sum_0 *= lhs_offset;
            vector_sum_1 *= lhs_offset;
            vector_sum_2 *= lhs_offset;
            vector_sum_3 *= lhs_offset;

            vector_sum_buf[0] = vector_sum_0;
            vector_sum_buf[1] = vector_sum_1;
            vector_sum_buf[2] = vector_sum_2;
            vector_sum_buf[3] = vector_sum_3;
            vector_sum_buf += 4;
        }

        const int32_t loop_cnt = vector_rows % 4;

        for (int i_row_loop_cnt = 0; i_row_loop_cnt < loop_cnt; i_row_loop_cnt++)
        {
            const int32_t col_loop_cnt = (vector_cols + 15) / 16;

            const int8_t *vector_0 = vector_data;

            int32_t vector_sum_0 = 0;

            uint32_t col_cnt = (uint32_t)vector_cols;

            for (int i = 0; i < col_loop_cnt; i++)
            {
                mve_pred16_t p = vctp8q(col_cnt);
                col_cnt -= 16;

                const int8x16_t ker_0 = vldrbq_z_s8(vector_0, p);
                vector_sum_0 = vaddvaq_s8(vector_sum_0, ker_0);

                vector_0 += 16;
            }
            vector_data += vector_cols;
            if (rhs_offset)
            {
                vector_sum_0 += vector_cols * rhs_offset;
            }
            vector_sum_0 *= lhs_offset;

            vector_sum_buf[i_row_loop_cnt] = vector_sum_0;
        }
        */

        // return (MURISCV_NN_NO_IMPL_ERROR);

        // #else
        // TODO: only unroll explicitly if required?
        for (int r = 0; r < vector_rows; ++r)
        {
            const int8_t *p = vector_data + r * vector_cols;
            int32_t remaining = vector_cols;
            int32_t sum = 0;

            while (remaining > 0)
            {
                size_t vl = vsetvl_e8m2(remaining);

                /* Load signed int8 weights */
                vint8m2_t v8 = vle8_v_i8m2(p, vl);

                /* Widen int8 -> int32 */
                vint32m8_t v32 = vsext_vf4_i32m8(v8, vl);

                /* Reduction seed */
                vint32m1_t zero = vmv_v_x_i32m1(0, 1);

                /* Sum all lanes */
                vint32m1_t reduced = __riscv_vredsum_vs_i32m8_i32m1(v32, zero, vl);

                /* Add this vector chunk to scalar accumulator */
                sum += vmv_x_s_i32m1_i32(reduced);

                p += vl;
                remaining -= vl;
            }

            if (rhs_offset)
            {
                sum += vector_cols * rhs_offset;
            }

            vector_sum_buf[r] += sum * lhs_offset;
        }
#elif defined(USE_COREV) || defined(USE_XMNN)
        const uint32_t ones = 0x01010101u;

        const int32_t row_blocks = vector_rows >> 2;

        for (int rb = 0; rb < row_blocks; ++rb)
        {
            const int8_t *p0 = vector_data;
            const int8_t *p1 = vector_data + vector_cols;
            const int8_t *p2 = vector_data + 2 * vector_cols;
            const int8_t *p3 = vector_data + 3 * vector_cols;

            int32_t s0 = 0;
            int32_t s1 = 0;
            int32_t s2 = 0;
            int32_t s3 = 0;

            for (int j = vector_cols >> 2; j != 0; --j)
            {
                uint32_t w0 = *(const uint32_t *)p0;
                uint32_t w1 = *(const uint32_t *)p1;
                uint32_t w2 = *(const uint32_t *)p2;
                uint32_t w3 = *(const uint32_t *)p3;

                s0 = __builtin_riscv_cv_simd_sdotsp_b(w0, ones, s0);
                s1 = __builtin_riscv_cv_simd_sdotsp_b(w1, ones, s1);
                s2 = __builtin_riscv_cv_simd_sdotsp_b(w2, ones, s2);
                s3 = __builtin_riscv_cv_simd_sdotsp_b(w3, ones, s3);

                p0 += 4;
                p1 += 4;
                p2 += 4;
                p3 += 4;
            }

            /* tails here */

            if (rhs_offset)
            {
                const int32_t corr = vector_cols * rhs_offset;
                s0 += corr;
                s1 += corr;
                s2 += corr;
                s3 += corr;
            }

            vector_sum_buf[0] += s0 * lhs_offset;
            vector_sum_buf[1] += s1 * lhs_offset;
            vector_sum_buf[2] += s2 * lhs_offset;
            vector_sum_buf[3] += s3 * lhs_offset;

            vector_sum_buf += 4;
            vector_data += 4 * vector_cols;
        }
#else
        for (int i = 0; i < vector_rows; i++)
        {
            int32_t sum = 0;
            for (int j = 0; j < vector_cols; j++)
            {
                sum += *vector_data++;
            }
            if (rhs_offset)
            {
                sum += vector_cols * rhs_offset;
            }
            *vector_sum_buf++ += sum * lhs_offset;
        }

#endif
    }

    return (MURISCV_NN_SUCCESS);
}

/**
 * @} end of FC group
 */
