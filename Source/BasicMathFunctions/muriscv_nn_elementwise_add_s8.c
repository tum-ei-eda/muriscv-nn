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
#elif defined(USE_PEXT)
// #include <rvp_intrinsic.h>
#include <riscv-dsp.h>
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
 * s8 elementwise add
 *
 * Refer header file for details.
 *
 */

muriscv_nn_status muriscv_nn_elementwise_add_s8(const int8_t *input_1_vect,
                                                const int8_t *input_2_vect,
                                                const int32_t input_1_offset,
                                                const int32_t input_1_mult,
                                                const int32_t input_1_shift,
                                                const int32_t input_2_offset,
                                                const int32_t input_2_mult,
                                                const int32_t input_2_shift,
                                                const int32_t left_shift,
                                                int8_t *output,
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
        size_t vl = vsetvl_e8m2(loop_count);

        /* Load vectors */
        vint8m2_t input_1_raw = vle8_v_i8m2(input_1_vect, vl);
        vint8m2_t input_2_raw = vle8_v_i8m2(input_2_vect, vl);

        /* Widen to 32 bit and add offsets */
        vint32m8_t input_1 = vadd_vx_i32m8(vsext_vf4_i32m8(input_1_raw, vl), input_1_offset, vl);
        vint32m8_t input_2 = vadd_vx_i32m8(vsext_vf4_i32m8(input_2_raw, vl), input_2_offset, vl);

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

        /* Pack results back into 8 bit and store */
        vint8m2_t sum_packed = vnclip_wx_i8m2(vnclip_wx_i16m4(sum, 0, vl), 0, vl);
        vse8_v_i8m2(output, sum_packed, vl);

        /* Decrement loop counter and bump pointers */
        loop_count -= vl;
        input_1_vect += vl;
        input_2_vect += vl;
        output += vl;
    }

#else /* defined(USE_VEXT) */

#if defined(USE_PEXT)

    int32_t offset_1_packed = (input_1_offset << 16U) | (input_1_offset & 0x0FFFFL);
    int32_t offset_2_packed = (input_2_offset << 16U) | (input_2_offset & 0x0FFFFL);

    loop_count = block_size >> 2;

    while (loop_count > 0)
    {
        /* Load vec 1 */
        int32_t packed = muriscv_nn_read_q7x4_ia(&input_1_vect);
        int32_t a1 = __rv__sunpkd810(packed);
        a1 = __rv__add16(a1, offset_1_packed);
        int32_t b1 = __rv__sunpkd832(packed);
        b1 = __rv__add16(b1, offset_1_packed);

        /* Load vec 2 */
        packed = muriscv_nn_read_q7x4_ia(&input_2_vect);
        int32_t a2 = __rv__sunpkd810(packed);
        a2 = __rv__add16(a2, offset_2_packed);
        int32_t b2 = __rv__sunpkd832(packed);
        b2 = __rv__add16(b2, offset_2_packed);

        /* Sum 1 */
        int32_t input_1 = (a1 & 0x0FFFF) << left_shift;
        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        int32_t input_2 = (a2 & 0x0FFFF) << left_shift;
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        int32_t sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift) + out_offset;
        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);
        int8_t r1 = (q7_t)sum;

        /* Sum 2 */
        input_1 = ((a1 >> 16) & 0x0FFFF) << left_shift;
        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        input_2 = ((a2 >> 16) & 0x0FFFF) << left_shift;
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift) + out_offset;
        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);
        int8_t r2 = (q7_t)sum;

        /* Sum 3 */
        input_1 = (b1 & 0x0FFFF) << left_shift;
        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        input_2 = (b2 & 0x0FFFF) << left_shift;
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift) + out_offset;
        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);
        int8_t r3 = (q7_t)sum;

        /* Sum 4 */
        input_1 = ((b1 >> 16) & 0x0FFFF) << left_shift;
        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        input_2 = ((b2 >> 16) & 0x0FFFF) << left_shift;
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift) + out_offset;
        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);
        int8_t r4 = (q7_t)sum;

        muriscv_nn_write_q7x4_ia(&output, PACK_Q7x4_32x1(r1, r2, r3, r4));

        loop_count--;
    }

    loop_count = block_size & 0x3;

#endif /* defined(USE_PEXT) */

    while (loop_count > 0)
    {
        /* C = A + B */

        int32_t input_1 = (*input_1_vect++ + input_1_offset) << left_shift;
        int32_t input_2 = (*input_2_vect++ + input_2_offset) << left_shift;

        input_1 = muriscv_nn_requantize(input_1, input_1_mult, input_1_shift);
        input_2 = muriscv_nn_requantize(input_2, input_2_mult, input_2_shift);

        int32_t sum = input_1 + input_2;
        sum = muriscv_nn_requantize(sum, out_mult, out_shift) + out_offset;

        sum = MAX(sum, out_activation_min);
        sum = MIN(sum, out_activation_max);

        *output++ = (int8_t)sum;

        /* Decrement loop counter */
        loop_count--;
    }

#endif /* defined(USE_VEXT) */

    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of BasicMath group
 */
