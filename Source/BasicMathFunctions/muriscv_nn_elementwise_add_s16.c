/*
 * Copyright (C) 2022 Arm Limited or its affiliates.
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
#include "muriscv_nn_util.h"

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup BasicMath
 * @{
 */

/*
 * s16 elementwise add
 *
 * Refer header file for details.
 *
 */

muriscv_nn_status muriscv_nn_elementwise_add_s16(const int16_t *input_1_vect,
                                                 const int16_t *input_2_vect,
                                                 const int32_t input_1_offset,
                                                 const int32_t input_1_mult,
                                                 const int32_t input_1_shift,
                                                 const int32_t input_2_offset,
                                                 const int32_t input_2_mult,
                                                 const int32_t input_2_shift,
                                                 const int32_t left_shift,
                                                 int16_t *output,
                                                 const int32_t out_offset,
                                                 const int32_t out_mult,
                                                 const int32_t out_shift,
                                                 const int32_t out_activation_min,
                                                 const int32_t out_activation_max,
                                                 const int32_t block_size)
{

    size_t loop_count = block_size;

#if defined(USE_VEXT)

    /* Set fixedpoint rounding to round-to-nearest-up */
    muriscv_nn_set_rounding_mode(RNU);

    while (loop_count > 0)
    {
        /* Determine vector length */
        volatile size_t vl = vsetvl_e16m4(loop_count);

        /* Load vectors */
        vint16m4_t input_1_raw = vle16_v_i16m4(input_1_vect, vl);
        vint16m4_t input_2_raw = vle16_v_i16m4(input_2_vect, vl);

        /* Widen to 32 bit and add offsets */
        vint32m8_t input_1 = vadd_vx_i32m8(vsext_vf2_i32m8(input_1_raw, vl), input_1_offset, vl);
        vint32m8_t input_2 = vadd_vx_i32m8(vsext_vf2_i32m8(input_2_raw, vl), input_2_offset, vl);

        /* Left shift */
        input_1 = vsll_vx_i32m8(input_1, left_shift, vl);
        input_2 = vsll_vx_i32m8(input_2, left_shift, vl);

        /* Requantize input vectors */
        input_1 = muriscv_nn_requantize_vec(input_1, input_1_mult, input_1_shift, vl);
        input_2 = muriscv_nn_requantize_vec(input_2, input_2_mult, input_2_shift, vl);

        /* Actual addition */
        vint32m8_t sum = vadd_vv_i32m8(input_1, input_2, vl);

        /* Requantize vector */
        sum = muriscv_nn_requantize_vec(sum, out_mult, out_shift, vl);

        /* Add output offset */
        sum = vadd_vx_i32m8(sum, out_offset, vl);

        /* Clip */
        sum = vmax_vx_i32m8(sum, out_activation_min, vl);
        sum = vmin_vx_i32m8(sum, out_activation_max, vl);

        /* Pack results back into 16 bit and store */
        vint16m4_t sum_packed = vnclip_wx_i16m4(sum, 0, vl);
        vse16_v_i16m4(output, sum_packed, vl);

        /* Decrement loop counter and bump pointers */
        loop_count -= vl;
        input_1_vect += vl;
        input_2_vect += vl;
        output += vl;
    }

#else  /* defined(USE_VEXT) */

    while (loop_count > 0)
    {
        /* C = A + B */
        int32_t input_1 = (*input_1_vect++ + input_1_offset) << left_shift;
        int32_t input_2 = (*input_2_vect++ + input_2_offset) << left_shift;

        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        int32_t sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift);
        sum += out_offset;

        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);

        *output++ = (int16_t)sum;

        /* Decrement loop counter */
        loop_count--;
    }
#endif /* defined(USE_VEXT) */

    return (MURISCV_NN_SUCCESS);
}

/**
 * @} end of BasicMath group
 */
