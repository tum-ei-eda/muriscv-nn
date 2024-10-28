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
 * s8 matrix multiplication to process 1 row
 *
 * Refer header file for details.
 *
 */

muriscv_nn_status muriscv_nn_mat_mul_core_1x_s8(int32_t row_elements,
                                                const int8_t *row_base,
                                                const int8_t *col_base,
                                                int32_t *const sum_col,
                                                int32_t *const output)
{
    int32_t acc_n0 = 0;
    int32_t sum_tmp = 0;
#if defined(USE_VEXT)
    int8_t *row_ptr = (int8_t *)row_base;
    int8_t *col_ptr = (int8_t *)col_base;
    int32_t loop_cnt = row_elements;

    volatile size_t vl = vsetvl_e32m8(row_elements);
    vint32m8_t acc = vmv_v_x_i32m8(0, vl);
    vint32m8_t sum = vmv_v_x_i32m8(0, vl);

    while (loop_cnt > 0)
    {
        vl = vsetvl_e32m8(loop_cnt);
        vint32m8_t col_val = vsext_vf4_i32m8(vle8_v_i8m2(col_ptr, vl), vl);
        vint32m8_t row_val = vsext_vf4_i32m8(vle8_v_i8m2(row_ptr, vl), vl);

        acc = vmacc_vv_i32m8(acc, col_val, row_val, vl);
        sum = vmacc_vv_i32m8(sum, col_val, vmv_v_x_i32m8(1, vl), vl); // TODO(fabianpedd): Should be a tail undisturbed add

        loop_cnt -= vl;
        row_ptr += vl;
        col_ptr += vl;
    }

    vl = vsetvl_e32m8(row_elements);

    vint32m1_t reduct = vmv_v_x_i32m1(0, vl);
    reduct = __riscv_vredsum_vs_i32m8_i32m1(acc, reduct, vl);
    acc_n0 = vmv_x_s_i32m1_i32(reduct);

    reduct = vmv_v_x_i32m1(0, vl);
    reduct = __riscv_vredsum_vs_i32m8_i32m1(sum, reduct, vl);
    sum_tmp = vmv_x_s_i32m1_i32(reduct);
#else
    for (int i = 0; i < row_elements; i++)
    {
        sum_tmp += col_base[i];
        acc_n0 += row_base[i] * col_base[i];
    }
#endif

    *sum_col = sum_tmp;
    *output = acc_n0;
    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of NNBasicMath group
 */
