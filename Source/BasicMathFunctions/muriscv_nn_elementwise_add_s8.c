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
 * Modifications copyright (C) 2021-2023 Chair of Electronic Design Automation, TUM
 */

#if defined(USE_VEXT)
#include <riscv_vector.h>
#elif defined(USE_PEXT)
#include <rvp_intrinsic.h>
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
        volatile size_t vl = vsetvl_e8m2(loop_count);

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
    
    //Should be using __rv_pack() here.  RVP intrinsics are wrong, invert packu and pack
    //Assumes that all offsets are int8_t
    int32_t input_1_offset_packed = __rv_packu(input_1_offset, input_1_offset);
    int32_t input_2_offset_packed = __rv_packu(input_2_offset, input_2_offset);
    
    int32_t out_offset_packed = __rv_packu(out_offset, out_offset);
    int32_t out_activation_max_packed = __rv_packu(out_activation_max, out_activation_max);
    int32_t out_activation_min_packed = __rv_packu(out_activation_min, out_activation_min);
    
    loop_count = block_size >> 2;
    

    while (loop_count > 0)
    {
        int32_t input_packed = muriscv_nn_read_q7x4_ia_fast(&input_1_vect);
        int32_t input_upper_1 = __rv_sunpkd832(input_packed);
        input_upper_1 = __rv_kadd16(input_upper_1, input_1_offset_packed);
        int32_t input_lower_1 = __rv_sunpkd810(input_packed);
        input_lower_1 = __rv_kadd16(input_lower_1, input_1_offset_packed);

        input_packed = muriscv_nn_read_q7x4_ia_fast(&input_2_vect);
        int32_t input_upper_2 = __rv_sunpkd832(input_packed);
        input_upper_2 = __rv_kadd16(input_upper_2, input_2_offset_packed);
        int32_t input_lower_2 = __rv_sunpkd810(input_packed);
        input_lower_2 = __rv_kadd16(input_lower_2, input_2_offset_packed);


        int32_t input_1_1 = ((input_lower_1 & 0xFFFF)) << left_shift;
        int32_t input_1_2 = ((input_lower_2 & 0xFFFF)) << left_shift;

        int32_t input_2_1 = (((input_lower_1 >> 16) & 0xFFFF)) << left_shift;
        int32_t input_2_2 = (((input_lower_2 >> 16) & 0xFFFF)) << left_shift;

        int32_t input_3_1 = ((input_upper_1 & 0xFFFF)) << left_shift;
        int32_t input_3_2 = ((input_upper_2 & 0xFFFF)) << left_shift;

        int32_t input_4_1 = (((input_upper_1 >> 16) & 0xFFFF)) << left_shift;
        int32_t input_4_2 = (((input_upper_2 >> 16) & 0xFFFF)) << left_shift;

        input_1_1 = muriscv_nn_requantize(input_1_1, input_1_mult, input_1_shift);
        input_1_2 = muriscv_nn_requantize(input_1_2, input_2_mult, input_2_shift);

        input_2_1 = muriscv_nn_requantize(input_2_1, input_1_mult, input_1_shift);
        input_2_2 = muriscv_nn_requantize(input_2_2, input_2_mult, input_2_shift);

        input_3_1 = muriscv_nn_requantize(input_3_1, input_1_mult, input_1_shift);
        input_3_2 = muriscv_nn_requantize(input_3_2, input_2_mult, input_2_shift);

        input_4_1 = muriscv_nn_requantize(input_4_1, input_1_mult, input_1_shift);
        input_4_2 = muriscv_nn_requantize(input_4_2, input_2_mult, input_2_shift);

        int32_t sum_1 = input_1_1 + input_1_2;
        int32_t sum_2 = input_2_1 + input_2_2;
        int32_t sum_3 = input_3_1 + input_3_2;
        int32_t sum_4 = input_4_1 + input_4_2;

        sum_1 = muriscv_nn_requantize(sum_1, out_mult, out_shift);
        sum_3 = muriscv_nn_requantize(sum_3, out_mult, out_shift);

        int32_t sum_1_3_packed = __rv_packu(sum_1, sum_3);
        
        sum_1_3_packed = __rv_kadd16(sum_1_3_packed, out_offset_packed);
        sum_1_3_packed = __rv_smax16(sum_1_3_packed, out_activation_min_packed);
        sum_1_3_packed = __rv_smin16(sum_1_3_packed, out_activation_max_packed);

        sum_2 = muriscv_nn_requantize(sum_2, out_mult, out_shift);
        sum_4 = muriscv_nn_requantize(sum_4, out_mult, out_shift);

        int32_t sum_2_4_packed = __rv_packu(sum_2, sum_4);
        
        sum_2_4_packed = __rv_kadd16(sum_2_4_packed, out_offset_packed);
        sum_2_4_packed = __rv_smax16(sum_2_4_packed, out_activation_min_packed);
        sum_2_4_packed = __rv_smin16(sum_2_4_packed, out_activation_max_packed);

        int32_t packed_out = (sum_1_3_packed & 0x00FF00FF) | ((sum_2_4_packed & 0x00FF00FF) << 8);
        muriscv_nn_write_q7x4_ia(&output, packed_out);

        /* Decrement loop counter */
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
