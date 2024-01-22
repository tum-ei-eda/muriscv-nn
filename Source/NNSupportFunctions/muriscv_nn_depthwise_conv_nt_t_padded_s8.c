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
 * Depthwise convolution of transposed rhs matrix with 4 lhs matrices. One or more of the rhs matrices are padded.
 * Dimensions are the same for lhs and rhs.
 *
 * Refer header file for details.
 *
 */

muriscv_nn_status muriscv_nn_depthwise_conv_nt_t_padded_s8(const int8_t *lhs,
                                                         const int8_t *rhs,
                                                         const int32_t lhs_offset,
                                                         const int32_t active_ch,
                                                         const int32_t total_ch,
                                                         const int32_t *out_shift,
                                                         const int32_t *out_mult,
                                                         const int32_t out_offset,
                                                         const int32_t activation_min,
                                                         const int32_t activation_max,
                                                         const uint16_t row_x_col,
                                                         const int32_t *const output_bias,
                                                         int8_t *out)
{
#if defined(USE_VEXT)
    const int32_t *bias = output_bias;
    int32_t num_ch_to_process = active_ch, offset = 0;
    while (num_ch_to_process > 0)
    {
        size_t vl = vsetvl_e32m2(num_ch_to_process);
        vint32m2_t out_0 = vmv_v_x_i32m2(0, vl);
        if (bias)
        {
            out_0 = vle32_v_i32m2(bias, vl);
            bias += vl;
        }
        vint32m2_t out_1 = out_0;
        vint32m2_t out_2 = out_0;
        vint32m2_t out_3 = out_0;

        const int8_t *rhs_0 = rhs + offset;
        const int8_t *lhs_0 = lhs + offset;
        const int8_t *lhs_1 = lhs + row_x_col * CH_IN_BLOCK_MVE + offset;        //Maybe VL here instead of num_ch
        const int8_t *lhs_2 = lhs + (row_x_col * CH_IN_BLOCK_MVE * 2) + offset;
        const int8_t *lhs_3 = lhs + (row_x_col * CH_IN_BLOCK_MVE * 3) + offset;
        offset += vl;

        for (int i_row_x_col = 0; i_row_x_col < row_x_col; i_row_x_col++)
        {
            vint32m2_t ker = vsext_vf4_i32m2(vle8_v_i8mf2(rhs_0, vl), vl);

            vint32m2_t ip_0 = vsext_vf4_i32m2(vle8_v_i8mf2(lhs_0, vl), vl);
            ip_0 = vadd_vx_i32m2(ip_0, lhs_offset, vl);
            out_0 = vmacc_vv_i32m2(out_0, ip_0, ker, vl);

            vint32m2_t ip_1 = vsext_vf4_i32m2(vle8_v_i8mf2(lhs_1, vl), vl);
            ip_1 = vadd_vx_i32m2(ip_1, lhs_offset, vl);
            out_1 = vmacc_vv_i32m2(out_1, ip_1, ker, vl);

            vint32m2_t ip_2 = vsext_vf4_i32m2(vle8_v_i8mf2(lhs_2, vl), vl);
            ip_2 = vadd_vx_i32m2(ip_2, lhs_offset, vl);
            out_2 = vmacc_vv_i32m2(out_2, ip_2, ker, vl);

            vint32m2_t ip_3 = vsext_vf4_i32m2(vle8_v_i8mf2(lhs_3, vl), vl);
            ip_3 = vadd_vx_i32m2(ip_3, lhs_offset, vl);
            out_3 = vmacc_vv_i32m2(out_3, ip_3, ker, vl);

            rhs_0 += total_ch;
            lhs_0 += CH_IN_BLOCK_MVE;
            lhs_1 += CH_IN_BLOCK_MVE;
            lhs_2 += CH_IN_BLOCK_MVE;
            lhs_3 += CH_IN_BLOCK_MVE;
        }

        const vint32m2_t mult = vle32_v_i32m2(out_mult, vl);
        const vint32m2_t shift = vle32_v_i32m2(out_shift, vl);
        out_mult += vl;
        out_shift += vl;

        out_0 = muriscv_nn_requantize_vint32m2(out_0, mult, shift, vl);
        out_0 = vadd_vx_i32m2(out_0, out_offset, vl);
        out_0 = vmax_vx_i32m2(out_0, activation_min, vl);
        out_0 = vmin_vx_i32m2(out_0, activation_max, vl);
        vse8_v_i8mf2(out, vnclip_wx_i8mf2(vnclip_wx_i16m1(out_0, 0, vl), 0, vl), vl);

        out_1 = muriscv_nn_requantize_vint32m2(out_1, mult, shift, vl);
        out_1 = vadd_vx_i32m2(out_1, out_offset, vl);
        out_1 = vmax_vx_i32m2(out_1, activation_min, vl);
        out_1 = vmin_vx_i32m2(out_1, activation_max, vl);
        vse8_v_i8mf2(out + total_ch, vnclip_wx_i8mf2(vnclip_wx_i16m1(out_1, 0, vl), 0, vl), vl);

        out_2 = muriscv_nn_requantize_vint32m2(out_2, mult, shift, vl);
        out_2 = vadd_vx_i32m2(out_2, out_offset, vl);
        out_2 = vmax_vx_i32m2(out_2, activation_min, vl);
        out_2 = vmin_vx_i32m2(out_2, activation_max, vl);
        vse8_v_i8mf2(out + 2 * total_ch, vnclip_wx_i8mf2(vnclip_wx_i16m1(out_2, 0, vl), 0, vl), vl);

        out_3 = muriscv_nn_requantize_vint32m2(out_3, mult, shift, vl);
        out_3 = vadd_vx_i32m2(out_3, out_offset, vl);
        out_3 = vmax_vx_i32m2(out_3, activation_min, vl);
        out_3 = vmin_vx_i32m2(out_3, activation_max, vl);
        vse8_v_i8mf2(out + 3 * total_ch, vnclip_wx_i8mf2(vnclip_wx_i16m1(out_3, 0, vl), 0, vl), vl);

        out += vl;
        num_ch_to_process -= vl;
    }
    return MURISCV_NN_SUCCESS;
#else
    (void)lhs;
    (void)rhs;
    (void)lhs_offset;
    (void)active_ch;
    (void)total_ch;
    (void)out_shift;
    (void)out_mult;
    (void)out_offset;
    (void)activation_min;
    (void)activation_max;
    (void)row_x_col;
    (void)output_bias;
    (void)out;
    return MURISCV_NN_NO_IMPL_ERROR;
#endif
}

/**
 * @} end of NNBasicMath group
 */
