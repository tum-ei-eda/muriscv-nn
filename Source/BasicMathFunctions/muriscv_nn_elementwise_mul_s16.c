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
#include "muriscv_nn_util.h"

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup BasicMath
 * @{
 */

/**
 * @brief s16 element wise multiplication of two vectors
 *
 * @note   Refer header file for details.
 *
 */
muriscv_nn_status muriscv_nn_elementwise_mul_s16(const int16_t *input_1_vect,
                                                 const int16_t *input_2_vect,
                                                 const int32_t input_1_offset,
                                                 const int32_t input_2_offset,
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
        vint16m4_t in1 = vle16_v_i16m4(input_1_vect, vl);
        vint16m4_t in2 = vle16_v_i16m4(input_2_vect, vl);

        /* Add offsets */
        vint32m8_t in1_off = vadd_vx_i32m8(vsext_vf2_i32m8(in1, vl), input_1_offset, vl);
        vint32m8_t in2_off = vadd_vx_i32m8(vsext_vf2_i32m8(in2, vl), input_2_offset, vl);

        /* Actual multiplication */
        vint32m8_t out = vmul_vv_i32m8(in1_off, in2_off, vl);

        /* Requantize vector */
        out = muriscv_nn_requantize_vec(out, out_mult, out_shift, vl);

        /* Add output offset */
        out = vadd_vx_i32m8(out, out_offset, vl);

        /* Clip */
        out = vmax_vx_i32m8(out, out_activation_min, vl);
        out = vmin_vx_i32m8(out, out_activation_max, vl);

        /* Pack results back into 16 bit and store */
        vint16m4_t out_packed = vnclip_wx_i16m4(out, 0, vl);
        vse16_v_i16m4(output, out_packed, vl);

        /* Decrement loop counter and bump pointers */
        loop_count -= vl;
        input_1_vect += vl;
        input_2_vect += vl;
        output += vl;
    }

#else /* defined(USE_VEXT) */

    while (loop_count > 0)
    {
        /* C = A * B */

        int32_t input_1 = *input_1_vect++ + input_1_offset;
        int32_t input_2 = *input_2_vect++ + input_2_offset;

        int32_t mul_res = input_1 * input_2;
        mul_res = muriscv_nn_requantize(mul_res, out_mult, out_shift) + out_offset;

        mul_res = MAX(mul_res, out_activation_min);
        mul_res = MIN(mul_res, out_activation_max);

        *output++ = (int16_t)mul_res;

        /* Decrement loop counter */
        loop_count--;
    }

#endif /* defined(USE_VEXT) */

    return MURISCV_NN_SUCCESS;
}

/**
 * @} end of BasicMath group
 */
