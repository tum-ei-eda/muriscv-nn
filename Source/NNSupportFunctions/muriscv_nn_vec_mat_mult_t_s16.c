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
 * s16 vector(lhs) by matrix (transposed) multiplication
 *
 * Refer header file for details.
 *
 * Used by muriscv_nn_vec_mat_mult_t_s16()
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
                                                const int32_t activation_max)
{

    // TODO(fabianpedd): Vectorize using V extension, P extension (probably) makes no sense here
    for (int i_row_loop_cnt = 0; i_row_loop_cnt < rhs_rows; i_row_loop_cnt++)
    {
        const q15_t *lhs_ptr = lhs;
        const q7_t *rhs_ptr_0 = &rhs[0];

        q63_t result = 0;

        if (bias)
        {
            result = *bias++;
        }
        for (int32_t rhs_cols_idx = 0; rhs_cols_idx < rhs_cols; ++rhs_cols_idx)
        {
            const q63_t rhs_value0 = (int8_t)*rhs_ptr_0;
            const q63_t lhs_value = *lhs_ptr;

            result += lhs_value * rhs_value0;

            ++rhs_ptr_0;
            ++lhs_ptr;
        }

        // Quantize down
        result = muriscv_nn_requantize_s64(result, dst_multiplier, dst_shift);

        // Clamp the result
        result = ((result) > (activation_min) ? (result) : (activation_min));
        result = ((result) < (activation_max) ? (result) : (activation_max));

        *dst++ = (q15_t)result;
        rhs += rhs_cols;
    }

    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of NNBasicMath group
 */
