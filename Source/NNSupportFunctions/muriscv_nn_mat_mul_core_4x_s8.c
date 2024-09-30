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

#if defined(USE_VEXT) || defined(USE_PORTABLE_VEXT)

    for (int i = 0; i < out_ch; i++)
    {
        const int8_t *col_base = col_base_ref + i * row_elements;
        const int8_t *ip_row_0 = row_base;
        const int8_t *ip_row_1 = row_base + offset;
        const int8_t *ip_row_2 = row_base + (2 * offset);
        const int8_t *ip_row_3 = row_base + (3 * offset);

#if defined(USE_VEXT)
        volatile size_t vl = vsetvl_e32m4(row_elements);

        // First loop iteration unrolled to initialize accumulators with vmul
        vint32m4_t col_val_init = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(col_base, vl), vl);
        vint32m4_t sum_tmp_v = __riscv_vmul_vv_i32m4(col_val_init, __riscv_vmv_v_x_i32m4(1, vl), vl);

        vint32m4_t row_val_init = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_0, vl), vl);
        vint32m4_t acc_n0_v = __riscv_vmul_vv_i32m4(col_val_init, row_val_init, vl);

        row_val_init = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_1, vl), vl);
        vint32m4_t acc_n1_v = __riscv_vmul_vv_i32m4(col_val_init, row_val_init, vl);

        row_val_init = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_2, vl), vl);
        vint32m4_t acc_n2_v = __riscv_vmul_vv_i32m4(col_val_init, row_val_init, vl);

        row_val_init = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_3, vl), vl);
        vint32m4_t acc_n3_v = __riscv_vmul_vv_i32m4(col_val_init, row_val_init, vl);

        size_t loop_cnt = row_elements - vl;
        size_t loop_ptr = vl;
        while (loop_cnt > 0)
        {
            vl = vsetvl_e32m4(loop_cnt);

            vint32m4_t col_val = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(col_base + loop_ptr, vl), vl);
            sum_tmp_v = __riscv_vmacc_vv_i32m4(sum_tmp_v,
                                               col_val,
                                               __riscv_vmv_v_x_i32m4(1, vl),
                                               vl); // TODO(fabianpedd): Should be a tail undisturbed add

            vint32m4_t row_val = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_0 + loop_ptr, vl), vl);
            acc_n0_v = __riscv_vmacc_vv_i32m4(acc_n0_v, col_val, row_val, vl);

            row_val = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_1 + loop_ptr, vl), vl);
            acc_n1_v = __riscv_vmacc_vv_i32m4(acc_n1_v, col_val, row_val, vl);

            row_val = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_2 + loop_ptr, vl), vl);
            acc_n2_v = __riscv_vmacc_vv_i32m4(acc_n2_v, col_val, row_val, vl);

            row_val = __riscv_vsext_vf4_i32m4(__riscv_vle8_v_i8m1(ip_row_3 + loop_ptr, vl), vl);
            acc_n3_v = __riscv_vmacc_vv_i32m4(acc_n3_v, col_val, row_val, vl);

            loop_cnt -= vl;
            loop_ptr += vl;
        }

        vl = vsetvl_e32m4(row_elements);

        vint32m1_t reduct_0 = vmv_v_x_i32m1(0, vl);
        reduct_0 = __riscv_vredsum_vs_i32m4_i32m1(sum_tmp_v, reduct_0, vl);
        int32_t sum_tmp = vmv_x_s_i32m1_i32(reduct_0);

        reduct_0 = vmv_v_x_i32m1(0, vl);
        reduct_0 = __riscv_vredsum_vs_i32m4_i32m1(acc_n0_v, reduct_0, vl);

        vint32m1_t reduct_1 = vmv_v_x_i32m1(0, vl);
        reduct_1 = __riscv_vredsum_vs_i32m4_i32m1(acc_n1_v, reduct_1, vl);

        vint32m1_t reduct_2 = vmv_v_x_i32m1(0, vl);
        reduct_2 = __riscv_vredsum_vs_i32m4_i32m1(acc_n2_v, reduct_2, vl);

        vint32m1_t reduct_3 = vmv_v_x_i32m1(0, vl);
        reduct_3 = __riscv_vredsum_vs_i32m4_i32m1(acc_n3_v, reduct_3, vl);

        vl = vsetvl_e32m4(4);
        vint32m4_t acc_vec = __riscv_vlmul_ext_v_i32m1_i32m4(reduct_0);
        acc_vec = __riscv_vslideup_vx_i32m4(acc_vec, __riscv_vlmul_ext_v_i32m1_i32m4(reduct_1), (size_t)1, vl);
        acc_vec = __riscv_vslideup_vx_i32m4(acc_vec, __riscv_vlmul_ext_v_i32m1_i32m4(reduct_2), (size_t)2, vl);
        acc_vec = __riscv_vslideup_vx_i32m4(acc_vec, __riscv_vlmul_ext_v_i32m1_i32m4(reduct_3), (size_t)3, vl);

        // int32_t res[4] = {0}; //Why are these here?
        // vse32_v_i32m4(res, acc_vec, vl);

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
#else
        int32_t col_val_init = (int32_t)*col_base;
        int32_t sum_tmp = col_val_init;
        int32_t acc_n0 = col_val_init * (int32_t)*ip_row_0;
        int32_t acc_n1 = col_val_init * (int32_t)*ip_row_1;
        int32_t acc_n2 = col_val_init * (int32_t)*ip_row_2;
        int32_t acc_n3 = col_val_init * (int32_t)*ip_row_3;
        size_t loop_cnt = row_elements - 1;
        size_t loop_ptr = 1;
        while (loop_cnt > 0)
        {
            int32_t col_val = (int32_t) * (col_base + loop_ptr);
            sum_tmp += col_val;

            acc_n0 += col_val * *(ip_row_0 + loop_ptr);
            acc_n1 += col_val * *(ip_row_1 + loop_ptr);
            acc_n2 += col_val * *(ip_row_2 + loop_ptr);
            acc_n3 += col_val * *(ip_row_3 + loop_ptr);

            loop_cnt -= 1;
            loop_ptr += 1;
        }

        sum_tmp *= conv_params->input_offset;
        if (bias)
            sum_tmp += bias[i];

        acc_n0 = acc_n0 + sum_tmp;
        acc_n1 = acc_n1 + sum_tmp;
        acc_n2 = acc_n2 + sum_tmp;
        acc_n3 = acc_n3 + sum_tmp;
        acc_n0 = muriscv_nn_requantize(acc_n0, quant_params->multiplier[i], quant_params->shift[i]);
        acc_n1 = muriscv_nn_requantize(acc_n1, quant_params->multiplier[i], quant_params->shift[i]);
        acc_n2 = muriscv_nn_requantize(acc_n2, quant_params->multiplier[i], quant_params->shift[i]);
        acc_n3 = muriscv_nn_requantize(acc_n3, quant_params->multiplier[i], quant_params->shift[i]);
        acc_n0 += conv_params->output_offset;
        acc_n1 += conv_params->output_offset;
        acc_n2 += conv_params->output_offset;
        acc_n3 += conv_params->output_offset;
        acc_n0 = MAX(acc_n0, conv_params->activation.min);
        acc_n1 = MAX(acc_n1, conv_params->activation.min);
        acc_n2 = MAX(acc_n2, conv_params->activation.min);
        acc_n3 = MAX(acc_n3, conv_params->activation.min);
        acc_n0 = MIN(acc_n0, conv_params->activation.max);
        acc_n1 = MIN(acc_n1, conv_params->activation.max);
        acc_n2 = MIN(acc_n2, conv_params->activation.max);
        acc_n3 = MIN(acc_n3, conv_params->activation.max);
        *(output + 0) = (int8_t)acc_n0;
        *(output + 1 * out_ch) = (int8_t)acc_n1;
        *(output + 2 * out_ch) = (int8_t)acc_n2;
        *(output + 3 * out_ch) = (int8_t)acc_n3;
#endif

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
