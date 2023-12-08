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
 * @ingroup groupSupport
 */

/**
 * @addtogroup NNBasicMath
 * @{
 */

/*
 * s8 matrix multiplication to process 4 rows and one column
 *
 * Refer header file for details.
 *
 */

int8_t *muriscv_nn_mat_mul_core_4x_s8(const int32_t row_elements,
                                      const int32_t offset,
                                      const int8_t *row_base,
                                      const int8_t *col_base_ref,
                                      const int32_t out_ch,
                                      const muriscv_nn_conv_params *conv_params,
                                      const muriscv_nn_per_channel_quant_params *quant_params,
                                      const int32_t *bias,
                                      int8_t *output)
{
#if defined(USE_VEXT)

    for (int i = 0; i < out_ch; i++)
    {
        const int8_t *col_base = col_base_ref + i * row_elements;
        const int8_t *ip_row_0 = row_base;
        const int8_t *ip_row_1 = row_base + offset;
        const int8_t *ip_row_2 = row_base + (2 * offset);
        const int8_t *ip_row_3 = row_base + (3 * offset);

        size_t vl = vsetvl_e32m2(row_elements);
        vint32m2_t sum_tmp_v = vmv_v_x_i32m2(0, vl);
        vint32m2_t acc_n0_v = vmv_v_x_i32m2(0, vl);
        vint32m2_t acc_n1_v = vmv_v_x_i32m2(0, vl);
        vint32m2_t acc_n2_v = vmv_v_x_i32m2(0, vl);
        vint32m2_t acc_n3_v = vmv_v_x_i32m2(0, vl);

        size_t loop_cnt = row_elements;
        size_t loop_ptr = 0;
        while (loop_cnt > 0)
        {
            vl = vsetvl_e32m2(loop_cnt);

            vint32m2_t col_val = vsext_vf4_i32m2(vle8_v_i8mf2(col_base + loop_ptr, vl), vl);
            sum_tmp_v = vmacc_vv_i32m2(sum_tmp_v, col_val, vmv_v_x_i32m2(1, vl), vl);  // TODO(fabianpedd): Should be a tail undisturbed add

            vint32m2_t row_val = vsext_vf4_i32m2(vle8_v_i8mf2(ip_row_0 + loop_ptr, vl), vl);
            acc_n0_v = vmacc_vv_i32m2(acc_n0_v, col_val, row_val, vl);

            row_val = vsext_vf4_i32m2(vle8_v_i8mf2(ip_row_1 + loop_ptr, vl), vl);
            acc_n1_v = vmacc_vv_i32m2(acc_n1_v, col_val, row_val, vl);

            row_val = vsext_vf4_i32m2(vle8_v_i8mf2(ip_row_2 + loop_ptr, vl), vl);
            acc_n2_v = vmacc_vv_i32m2(acc_n2_v, col_val, row_val, vl);

            row_val = vsext_vf4_i32m2(vle8_v_i8mf2(ip_row_3 + loop_ptr, vl), vl);
            acc_n3_v = vmacc_vv_i32m2(acc_n3_v, col_val, row_val, vl);

            loop_cnt -= vl;
            loop_ptr += vl;
        }

        vl = vsetvl_e32m2(row_elements);

        vint32m1_t reduct = vmv_v_x_i32m1(0, vl);
        reduct = vredsum_vs_i32m2_i32m1(reduct, acc_n0_v, reduct, vl);
        int32_t acc_n0 = vmv_x_s_i32m1_i32(reduct);

        reduct = vmv_v_x_i32m1(0, vl);
        reduct = vredsum_vs_i32m2_i32m1(reduct, acc_n1_v, reduct, vl);
        int32_t acc_n1 = vmv_x_s_i32m1_i32(reduct);

        reduct = vmv_v_x_i32m1(0, vl);
        reduct = vredsum_vs_i32m2_i32m1(reduct, acc_n2_v, reduct, vl);
        int32_t acc_n2 = vmv_x_s_i32m1_i32(reduct);

        reduct = vmv_v_x_i32m1(0, vl);
        reduct = vredsum_vs_i32m2_i32m1(reduct, acc_n3_v, reduct, vl);
        int32_t acc_n3 = vmv_x_s_i32m1_i32(reduct);

        reduct = vmv_v_x_i32m1(0, vl);
        reduct = vredsum_vs_i32m2_i32m1(reduct, sum_tmp_v, reduct, vl);
        int32_t sum_tmp = vmv_x_s_i32m1_i32(reduct);

        vl = vsetvl_e32m4(4);
        vint32m4_t acc_vec = vmv_v_x_i32m4(0, vl);
        acc_vec = vslide1up_vx_i32m4(acc_vec, acc_n3, vl);
        acc_vec = vslide1up_vx_i32m4(acc_vec, acc_n2, vl);
        acc_vec = vslide1up_vx_i32m4(acc_vec, acc_n1, vl);
        acc_vec = vslide1up_vx_i32m4(acc_vec, acc_n0, vl);

        int32_t res[4] = {0};
        vse32_v_i32m4(res, acc_vec, vl);

        sum_tmp *= conv_params->input_offset;
        if (bias)
            sum_tmp += bias[i];

        acc_vec = vadd_vx_i32m4(acc_vec, sum_tmp, vl);
        acc_vec = muriscv_nn_requantize_vint32m4(acc_vec, quant_params->multiplier[i], quant_params->shift[i], vl);
        acc_vec = vadd_vx_i32m4(acc_vec, conv_params->output_offset, vl);
        acc_vec = vmax_vx_i32m4(acc_vec, conv_params->activation.min, vl);
        acc_vec = vmin_vx_i32m4(acc_vec, conv_params->activation.max, vl);
        vint8m1_t acc_packed = vnclip_wx_i8m1(vnclip_wx_i16m2(acc_vec, 0, vl), 0, vl);
        vsse8_v_i8m1(output, out_ch, acc_packed, vl);

        output++;
    }

    return output + 3 * out_ch;

#else
    (void)row_elements;
    (void)offset;
    (void)row_base;
    (void)col_base_ref;
    (void)out_ch;
    (void)conv_params;
    (void)quant_params;
    (void)bias;
    (void)output;
    return NULL;
#endif
}

/**
 * @} end of NNBasicMath group
 */
