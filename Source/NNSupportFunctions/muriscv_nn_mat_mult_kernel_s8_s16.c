
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

#include "muriscv_nn_support_functions.h"

/*
 * Matrix-multiplication function for convolution with per-channel requantization.
 *
 * Refer header file for details.
 *
 * Used by muriscv_nn_convolve_s8()
 *
 */
q7_t *muriscv_nn_mat_mult_kernel_s8_s16(const q7_t *input_a,
                                        const q15_t *input_b,
                                        const uint16_t output_ch,
                                        const int32_t *out_shift,
                                        const int32_t *out_mult,
                                        const int32_t out_offset,
                                        const int16_t activation_min,
                                        const int16_t activation_max,
                                        const uint16_t num_col_a,
                                        const int32_t *const output_bias,
                                        q7_t *out_0)
{
    // TODO(fabianpedd): Check if vectorization makes sense here?


#if !defined(USE_VEXT)
    /* set up the second output pointers */
    q7_t *out_1 = out_0 + output_ch;
    const int32_t *bias = output_bias;
    #if defined(USE_PEXT)
    const q7_t b1_align = num_col_a % 2;
    #endif
    uint16_t row_count = output_ch / 2;
    const q7_t *ip_a0 = input_a;
    /* this loop over rows in A */
    while (row_count)
    {
        /* setup pointers for B */
        const q15_t *ip_b0 = input_b;
        const q15_t *ip_b1 = ip_b0 + num_col_a;


        /* align the second pointer for A */
        const q7_t *ip_a1 = ip_a0 + num_col_a;
        


        q31_t ch_0_out_0 = 0;
        q31_t ch_0_out_1 = 0;
        q31_t ch_1_out_0 = 0;
        q31_t ch_1_out_1 = 0;
        /* Init accumulator with bias for channel N and N + 1 */
        if (bias)
        {
            ch_0_out_0 = *bias;
            ch_0_out_1 = *bias++;
            ch_1_out_0 = *bias;
            ch_1_out_1 = *bias++;
        }

#if defined(USE_PEXT)
        uint16_t col_count = num_col_a / 4;
           
        const q7_t a0_align  = (uint32_t)ip_a0 % 4;
        const q7_t a1_align  = (uint32_t)ip_a1 % 4;    
        
        /* accumulate over the vector */
        while (col_count)
        {
            //Access always word aligned
            q31_t b0 = muriscv_nn_read_q15x2_ia_fast(&ip_b0);
            
            //Access is word aligned when num_col_a is even              
            q31_t b1 = muriscv_nn_read_q15x2_ia_aligned(&ip_b1, b1_align);
            
            //access word aligned when location is multiple of 4
            q31_t inA = muriscv_nn_read_q7x4_ia_aligned(&ip_a0, a0_align);

            
              
            q31_t a01 = __rv_sunpkd810(inA);
            q31_t a02 = __rv_sunpkd832(inA);
            
            //access word aligned when location is multiple of 4
            inA = muriscv_nn_read_q7x4_ia_aligned(&ip_a1, a1_align);
            
            q31_t a11 = __rv_sunpkd810(inA);
            q31_t a12 = __rv_sunpkd832(inA);

            ch_0_out_0 = __rv_kmada(ch_0_out_0, a01, b0);
            ch_0_out_1 = __rv_kmada(ch_0_out_1, a01, b1);
            ch_1_out_0 = __rv_kmada(ch_1_out_0, a11, b0);
            ch_1_out_1 = __rv_kmada(ch_1_out_1, a11, b1);

            //access always word aligned
            b0 = muriscv_nn_read_q15x2_ia_fast(&ip_b0);
            //Access is word aligned when num_col_a is even         
            b1 = muriscv_nn_read_q15x2_ia_aligned(&ip_b1, b1_align);
            
            
            ch_0_out_0 = __rv_kmada(ch_0_out_0, a02, b0);
            ch_0_out_1 = __rv_kmada(ch_0_out_1, a02, b1);
            ch_1_out_0 = __rv_kmada(ch_1_out_0, a12, b0);
            ch_1_out_1 = __rv_kmada(ch_1_out_1, a12, b1);

            col_count--;
        } /* while over col_count */
        col_count = num_col_a & 0x3;
#else
        uint16_t col_count = num_col_a;
#endif
        while (col_count)
        {
            q7_t a0 = *ip_a0++;
            q15_t b0 = *ip_b0++;
            q7_t a1 = *ip_a1++;
            q15_t b1 = *ip_b1++;

            ch_0_out_0 += a0 * b0;
            ch_0_out_1 += a0 * b1;
            ch_1_out_0 += a1 * b0;
            ch_1_out_1 += a1 * b1;
            col_count--;
        } /* while over col_count */

        ch_0_out_0 = muriscv_nn_requantize(ch_0_out_0, *out_mult, *out_shift);
        ch_0_out_0 += out_offset;
        ch_0_out_0 = MAX(ch_0_out_0, activation_min);
        ch_0_out_0 = MIN(ch_0_out_0, activation_max);
        *out_0++ = (q7_t)ch_0_out_0;

        ch_0_out_1 = muriscv_nn_requantize(ch_0_out_1, *out_mult, *out_shift);
        ch_0_out_1 += out_offset;
        ch_0_out_1 = MAX(ch_0_out_1, activation_min);
        ch_0_out_1 = MIN(ch_0_out_1, activation_max);
        *out_1++ = (q7_t)ch_0_out_1;
        out_mult++;
        out_shift++;

        ch_1_out_0 = muriscv_nn_requantize(ch_1_out_0, *out_mult, *out_shift);
        ch_1_out_0 += out_offset;
        ch_1_out_0 = MAX(ch_1_out_0, activation_min);
        ch_1_out_0 = MIN(ch_1_out_0, activation_max);
        *out_0++ = (q7_t)ch_1_out_0;

        ch_1_out_1 = muriscv_nn_requantize(ch_1_out_1, *out_mult, *out_shift);
        ch_1_out_1 += out_offset;
        ch_1_out_1 = MAX(ch_1_out_1, activation_min);
        ch_1_out_1 = MIN(ch_1_out_1, activation_max);
        *out_1++ = (q7_t)ch_1_out_1;
        out_mult++;
        out_shift++;

        /* skip row */
        ip_a0 += num_col_a;
        row_count--;
    }

    /* compute the last odd numbered row if any */
    if (output_ch & 0x1)
    {
        /* setup pointers for B */
        const q15_t *ip_b0 = input_b;
        const q15_t *ip_b1 = ip_b0 + num_col_a;

        q31_t ch_0_out_0 = 0;
        q31_t ch_0_out_1 = 0;

        /* load the bias */
        if (bias)
        {
            ch_0_out_0 = *bias;
            ch_0_out_1 = *bias++;
        }

#if defined(USE_PEXT)
        uint16_t col_count = num_col_a >> 2;
        while (col_count)
        {
            //possible optimization here
            q31_t b0 = muriscv_nn_read_q15x2_ia_fast(&ip_b0);
            q31_t b1 = muriscv_nn_read_q15x2_ia_fast(&ip_b1);

            q31_t inA = muriscv_nn_read_q7x4_ia_fast(&ip_a0);
            q31_t a01 = __rv_sunpkd810(inA);
            q31_t a02 = __rv_sunpkd832(inA);

            ch_0_out_0 = __rv_kmada(ch_0_out_0, a01, b0);
            ch_0_out_1 = __rv_kmada(ch_0_out_1, a01, b1);

            b0 = muriscv_nn_read_q15x2_ia_fast(&ip_b0);
            b1 = muriscv_nn_read_q15x2_ia_fast(&ip_b1);
            ch_0_out_0 = __rv_kmada(ch_0_out_0, a02, b0);
            ch_0_out_1 = __rv_kmada(ch_0_out_1, a02, b1);

            col_count--;
        }
        col_count = num_col_a & 0x3;
#else
        uint16_t col_count = num_col_a;
#endif
        //possible optimization here
        while (col_count)
        {
            q7_t a0 = *ip_a0++;
            q15_t b0 = *ip_b0++;
            q15_t b1 = *ip_b1++;

            ch_0_out_0 += a0 * b0;
            ch_0_out_1 += a0 * b1;
            col_count--;
        }
        ch_0_out_0 = muriscv_nn_requantize(ch_0_out_0, *out_mult, *out_shift);
        ch_0_out_0 += out_offset;
        ch_0_out_0 = MAX(ch_0_out_0, activation_min);
        ch_0_out_0 = MIN(ch_0_out_0, activation_max);
        *out_0++ = (q7_t)ch_0_out_0;

        ch_0_out_1 = muriscv_nn_requantize(ch_0_out_1, *out_mult, *out_shift);
        ch_0_out_1 += out_offset;
        ch_0_out_1 = MAX(ch_0_out_1, activation_min);
        ch_0_out_1 = MIN(ch_0_out_1, activation_max);
        *out_1++ = (q7_t)ch_0_out_1;
        out_mult++;
        out_shift++;
    }

    out_0 += output_ch;

    /* return the new output pointer with offset */
    return out_0;
#else
    (void)input_a;
    (void)input_b;
    (void)output_ch;
    (void)out_shift;
    (void)out_mult;
    (void)out_offset;
    (void)activation_min;
    (void)activation_max;
    (void)num_col_a;
    (void)output_bias;
    (void)out_0;
    /* To be completed */
    return NULL;
#endif
}
