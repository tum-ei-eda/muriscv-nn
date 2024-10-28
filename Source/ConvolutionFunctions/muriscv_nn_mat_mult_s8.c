// Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2010-2022 Arm Limited and/or its affiliates <open-source-office@arm.com>
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

/* ----------------------------------------------------------------------
 * Project:      CMSIS NN Library
 * Title:        muriscv_nn_mat_mult_s8.c
 * Description:  General Matrix-multiplication function
 *
 * $Date:        26 October 2022
 * $Revision:    V.2.0.8
 *
 * Target Processor:  Cortex-M cores
 * -------------------------------------------------------------------- */

#include "muriscv_nn_support_functions.h"

/*
 * s8 General matrix multiplication function with per-channel requantization for upto 4 column batches.
 *
 * Refer header file for details.
 *
 */

int8_t *muriscv_nn_mat_mult_s8(const int8_t *input_row,
                               const int8_t *input_col,
                               const uint16_t output_ch,
                               const uint16_t col_batches,
                               const int32_t *output_shift,
                               const int32_t *output_mult,
                               const int32_t out_offset,
                               const int32_t col_offset,
                               const int32_t row_offset,
                               const int16_t activation_min,
                               const int16_t activation_max,
                               const uint16_t row_len,
                               const int32_t *const bias,
                               int8_t *out)
{
#if defined(USE_VEXT) || defined(USE_PORTABLE_VEXT)
    // Our old implementation
    (void)row_offset;

    // TODO(fabianpedd): unroll the batch loop 4x similiar to how its done in
    // the arm implementation. Use smaller groups (i8m1 and i16m2 for example).
    // This should ideally be optimized to the respective memory available on
    // a certain system (cache and/or RAM size).
    for (uint16_t i_col_batch = 0; i_col_batch < col_batches; i_col_batch++)
    {
        for (uint16_t i_out_ch = 0; i_out_ch < output_ch; i_out_ch++)
        {
            const int8_t *ip_r0 = input_row + (i_out_ch * row_len);
            const int8_t *ip_c0 = input_col + (i_col_batch * row_len);

#if defined(USE_VEXT)
            volatile size_t vl = vsetvl_e32m8(row_len);
            vint32m8_t res_0 = vmv_v_x_i32m8(0, vl);

            uint16_t row_len_cnt = row_len;
            while (row_len_cnt > 0)
            {
                vl = vsetvl_e32m8(row_len_cnt);

                vint32m8_t r0 = vsext_vf4_i32m8(vle8_v_i8m2(ip_r0, vl), vl);

                vint32m8_t c0 = vsext_vf4_i32m8(vle8_v_i8m2(ip_c0, vl), vl);
                c0 = vadd_vx_i32m8(c0, col_offset, vl);

                res_0 = vmacc_vv_i32m8(res_0, r0, c0, vl);
                ip_r0 += vl;
                ip_c0 += vl;
                row_len_cnt -= vl;
            }

            vl = vsetvl_e32m1(1);
            vint32m1_t red_0 = vundefined_i32m1();
            if (bias)
            {
                red_0 = vle32_v_i32m1(&bias[i_out_ch], vl);
            }
            else
            {
                red_0 = vmv_v_x_i32m1(0, vl);
            }

            vl = vsetvl_e32m8(row_len);
            red_0 = __riscv_vredsum_vs_i32m8_i32m1(res_0, red_0, vl);
            q31_t acc_0 = vmv_x_s_i32m1_i32(red_0);
#else

            int32_t res_0 = 0;

            uint16_t row_len_cnt = row_len;
            while (row_len_cnt > 0)
            {
                int32_t r0 = (int32_t)(*ip_r0);
                int32_t c0 = (int32_t)(*ip_c0);
                c0 += col_offset;
                res_0 += r0 * c0;
                ip_r0++;
                ip_c0++;
                row_len_cnt--;
            }

            q31_t acc_0 = res_0;
            if (bias)
            {
                acc_0 += bias[i_out_ch];
            }
#endif

            acc_0 = muriscv_nn_requantize(acc_0, output_mult[i_out_ch], output_shift[i_out_ch]);
            acc_0 += out_offset;
            acc_0 = MAX(acc_0, activation_min);
            acc_0 = MIN(acc_0, activation_max);
            out[i_out_ch] = (q7_t)acc_0;
        }
        out += output_ch;
    }
    return out;
//    NEW ARM IMPLEMENTATION
//    (void)row_offset;
//    if (col_batches == 4)
//    {
//        for (int i_out_ch = 0; i_out_ch < output_ch; i_out_ch++)
//        {
//            int32_t row_len_tmp = row_len;
//            const int8_t *ip_r0 = input_row + (i_out_ch * row_len);
//            const int8_t *ip_c0 = input_col;
//            const int8_t *ip_c1 = input_col + row_len;
//            const int8_t *ip_c2 = input_col + (2 * row_len);
//            const int8_t *ip_c3 = input_col + (3 * row_len);
//
//            int32_t acc_0 = 0;
//            int32_t acc_1 = 0;
//            int32_t acc_2 = 0;
//            int32_t acc_3 = 0;
//            const int32_t row_loop_cnt = (row_len + 7) / 8;
//
//            for (int i_row_loop = 0; i_row_loop < row_loop_cnt; i_row_loop++)
//            {
//                mve_pred16_t p = vctp16q((uint32_t)row_len_tmp);
//                const int16x8_t offset = vdupq_x_n_s16(col_offset, p);
//                row_len_tmp -= 8;
//
//                int16x8_t c0 = vldrbq_s16(ip_c0);
//                ip_c0 += 8;
//                c0 = vaddq_s16(c0, offset);
//
//                int16x8_t c1 = vldrbq_s16(ip_c1);
//                ip_c1 += 8;
//                c1 = vaddq_s16(c1, offset);
//
//                int16x8_t c2 = vldrbq_s16(ip_c2);
//                ip_c2 += 8;
//                c2 = vaddq_s16(c2, offset);
//
//                int16x8_t c3 = vldrbq_s16(ip_c3);
//                ip_c3 += 8;
//                c3 = vaddq_s16(c3, offset);
//
//                int16x8_t r0 = vldrbq_z_s16(ip_r0, p);
//                ip_r0 += 8;
//
//                acc_0 = vmladavaq_p_s16(acc_0, r0, c0, p);
//                acc_1 = vmladavaq_p_s16(acc_1, r0, c1, p);
//                acc_2 = vmladavaq_p_s16(acc_2, r0, c2, p);
//                acc_3 = vmladavaq_p_s16(acc_3, r0, c3, p);
//            }
//
//            int32x4_t res = {acc_0, acc_1, acc_2, acc_3};
//            if (bias)
//            {
//                res = vaddq_n_s32(res, bias[i_out_ch]);
//            }
//            res = muriscv_nn_requantize_mve(res, output_mult[i_out_ch], output_shift[i_out_ch]);
//            res = vaddq_n_s32(res, out_offset);
//
//            res = vmaxq_s32(res, vdupq_n_s32(activation_min));
//            res = vminq_s32(res, vdupq_n_s32(activation_max));
//
//            const uint32x4_t scatter_offset = {0, output_ch, output_ch * 2, output_ch * 3};
//            vstrbq_scatter_offset_s32(&out[i_out_ch], scatter_offset, res);
//        }
//        out += 4 * output_ch;
//    }
//    else
//    {
//        for (int i_col_batch = (col_batches & ~0x3); i_col_batch < (col_batches & 0x3); i_col_batch++)
//        {
//            for (int i_out_ch = 0; i_out_ch < output_ch; i_out_ch++)
//            {
//                int32_t row_len_tmp = row_len;
//
//                const int8_t *ip_r0 = input_row + (i_out_ch * row_len);
//                const int8_t *ip_c0 = input_col + (i_col_batch * row_len);
//                int32_t acc_0 = 0;
//                const int32_t row_loop_cnt = (row_len + 7) / 8;
//
//                for (int i_row_loop = 0; i_row_loop < row_loop_cnt; i_row_loop++)
//                {
//                    const mve_pred16_t p = vctp16q((uint32_t)row_len_tmp);
//                    const int16x8_t offset = vdupq_x_n_s16(col_offset, p);
//                    row_len_tmp -= 8;
//
//                    int16x8_t c0 = vldrbq_s16(ip_c0);
//                    ip_c0 += 8;
//                    c0 = vaddq_s16(c0, offset);
//
//                    int16x8_t r0 = vldrbq_z_s16(ip_r0, p);
//                    ip_r0 += 8;
//                    acc_0 = vmladavaq_p_s16(acc_0, r0, c0, p);
//                }
//
//                if (bias)
//                {
//                    acc_0 += bias[i_out_ch];
//                }
//                acc_0 = muriscv_nn_requantize(acc_0, output_mult[i_out_ch], output_shift[i_out_ch]);
//                acc_0 += out_offset;
//                acc_0 = MAX(acc_0, activation_min);
//                acc_0 = MIN(acc_0, activation_max);
//                out[i_out_ch] = (int8_t)acc_0;
//            }
//            out += output_ch;
//        }
//    }
//    return out;
//
#else
    (void)input_row;
    (void)input_col;
    (void)output_ch;
    (void)col_batches;
    (void)output_shift;
    (void)output_mult;
    (void)out_offset;
    (void)col_offset;
    (void)row_offset;
    (void)activation_min;
    (void)activation_max;
    (void)row_len;
    (void)bias;
    (void)out;
    return NULL;
#endif
}
