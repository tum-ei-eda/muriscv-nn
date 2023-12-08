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

#if defined(USE_VEXT)
#include <riscv_vector.h>
#endif

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/*
 * s8 General matrix multiplication function with per-channel requantization for upto 4 column batches.
 *
 * Refer header file for details.
 *
 * Used by muriscv_nn_convolve_s8()
 *
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
                             const int16_t activation_min,
                             const int16_t activation_max,
                             const uint16_t row_len,
                             const int32_t *const bias,
                             q7_t *out)
{
printf("##MAT_MULT_S8 CALLED##\n");
#if defined(USE_VEXT)

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

            size_t vl = vsetvl_e32m8(row_len);
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
            red_0 = vredsum_vs_i32m8_i32m1(red_0, res_0, red_0, vl);
            q31_t acc_0 = vmv_x_s_i32m1_i32(red_0);

            acc_0 = muriscv_nn_requantize(acc_0, output_mult[i_out_ch], output_shift[i_out_ch]);
            acc_0 += out_offset;
            acc_0 = MAX(acc_0, activation_min);
            acc_0 = MIN(acc_0, activation_max);
            out[i_out_ch] = (q7_t)acc_0;
        }
        out += output_ch;
    }
    return out;

#else /* defined(USE_VEXT) */

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

#endif  /* defined(USE_VEXT) */
}
