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

#include "muriscv_nn_support_functions.h"

/**
 * @ingroup groupSupport
 */

/**
 * @addtogroup NNBasicMath
 * @{
 */

/*
 * s8 matrix multiplication with the right-hand-side matrix transposed
 *
 * Refer header file for details.
 *
 * Used by muriscv_nn_convolve_1x1_s8_fast()
 *
 */
muriscv_nn_status muriscv_nn_mat_mult_nt_t_s8(const q7_t *lhs,                      
                                              const q7_t *rhs,
                                              const q31_t *bias,
                                              q7_t *dst,
                                              const int32_t *dst_multipliers,
                                              const int32_t *dst_shifts,
                                              const int32_t lhs_rows,
                                              const int32_t rhs_rows,
                                              const int32_t rhs_cols,
                                              const int32_t lhs_offset,
                                              const int32_t dst_offset,
                                              const int32_t activation_min,
                                              const int32_t activation_max,
                                              const int32_t row_address_offset, //CURRENTLY UNUSED, CMSIS USES FOR VECTOR ACCELERATION
                                              const int32_t lhs_cols_offset)
{
#if defined(USE_PEXT)
     // TODO(parkerjones): Find benchmark to test remaining edge cases for PEXT (and maybe implement V-Ext?)
     int32_t activation_max_packed = (__rv_packu((uint8_t)activation_max, (uint8_t)activation_max)) | ((__rv_packu((uint8_t)activation_max, (uint8_t)activation_max)) << 8);
     int32_t activation_min_packed = (__rv_packu((uint8_t)activation_min, (uint8_t)activation_min)) | ((__rv_packu((uint8_t)activation_min, (uint8_t)activation_min)) << 8);
     int32_t dst_offset_packed = (__rv_packu((uint8_t)dst_offset, (uint8_t)dst_offset)) | ((__rv_packu((uint8_t)dst_offset, (uint8_t)dst_offset)) << 8);
     
    for (int32_t rhs_rows_idx = 0; rhs_rows_idx <= (rhs_rows - 4); rhs_rows_idx += 4)
    {
        const q7_t *lhs_ptr = &lhs[0];
        q7_t *dst_ptr = &dst[0];

        q31_t lhs_offset_contribution0 = 0;
        q31_t lhs_offset_contribution1 = 0;
        q31_t lhs_offset_contribution2 = 0;
        q31_t lhs_offset_contribution3 = 0;
        
        //Precalculate row addresses and alignment
        //First row is always aligned
        const q7_t *rhs_0 = rhs;
        const q7_t *rhs_1 = rhs_0 + rhs_cols;
        uint8_t rhs_1_align = (rhs_cols % 4);
        uint8_t rhs_1_alignbits = rhs_1_align << 3;
        const q7_t *rhs_2 = rhs_1 + rhs_cols;
        uint8_t rhs_2_align = (rhs_cols % 2) << 1;
        uint8_t rhs_2_alignbits = rhs_2_align << 3;
        const q7_t *rhs_3 = rhs_2 + rhs_cols;
        uint8_t rhs_3_align = (4 - (rhs_cols % 4)) % 4;
        uint8_t rhs_3_alignbits = rhs_3_align << 3;

        //Sum elements 4 at a time
        for (int32_t x = 0; x < (rhs_cols >> 2); ++x)
        {   
            
            //attempt a better version of this?
            q31_t rhs_element = muriscv_nn_read_q7x4_ia_fast(&rhs_0);
            q31_t rhs_10 = __rv_sunpkd810(rhs_element);
            q31_t rhs_32 = __rv_sunpkd832(rhs_element);
            q31_t result = __rv_add16(rhs_10, rhs_32);
            lhs_offset_contribution0 += ((result << 16) >> 16) + (result >> 16);
            
            rhs_element = muriscv_nn_read_q7x4_ia_aligned(&rhs_1, rhs_1_align, rhs_1_alignbits);
            rhs_10 = __rv_sunpkd810(rhs_element);
            rhs_32 = __rv_sunpkd832(rhs_element);
            result = __rv_add16(rhs_10, rhs_32);
            lhs_offset_contribution1 += ((result << 16) >> 16) + (result >> 16);  
            
            rhs_element = muriscv_nn_read_q7x4_ia_aligned(&rhs_2, rhs_2_align, rhs_2_alignbits);
            rhs_10 = __rv_sunpkd810(rhs_element);
            rhs_32 = __rv_sunpkd832(rhs_element);
            result = __rv_add16(rhs_10, rhs_32);
            lhs_offset_contribution2 += ((result << 16) >> 16) + (result >> 16);       
                  
            rhs_element = muriscv_nn_read_q7x4_ia_aligned(&rhs_3, rhs_3_align, rhs_3_alignbits);
            rhs_10 = __rv_sunpkd810(rhs_element);
            rhs_32 = __rv_sunpkd832(rhs_element);
            result = __rv_add16(rhs_10, rhs_32);
            lhs_offset_contribution3 += ((result << 16) >> 16) + (result >> 16);
            
            
        }
        //Leftover elements
        for (int32_t x = 0; x < (rhs_cols % 4); ++x)
        {   
               
            lhs_offset_contribution0 += rhs_0[x];
            lhs_offset_contribution1 += rhs_1[x];           
            lhs_offset_contribution2 += rhs_2[x];                        
            lhs_offset_contribution3 += rhs_3[x];
         }
         
        lhs_offset_contribution0 *= lhs_offset;
        lhs_offset_contribution1 *= lhs_offset;
        lhs_offset_contribution2 *= lhs_offset;
        lhs_offset_contribution3 *= lhs_offset;
        
        if (bias)
        {
            lhs_offset_contribution0 += bias[rhs_rows_idx];
            lhs_offset_contribution1 += bias[rhs_rows_idx + 1];
            lhs_offset_contribution2 += bias[rhs_rows_idx + 2];
            lhs_offset_contribution3 += bias[rhs_rows_idx + 3];
        }

        int32_t lhs_rows_idx = lhs_rows >> 1;

        while (lhs_rows_idx)
        {
            q31_t res00 = lhs_offset_contribution0;
            q31_t res01 = lhs_offset_contribution1;
            q31_t res02 = lhs_offset_contribution2;
            q31_t res03 = lhs_offset_contribution3;
            q31_t res10 = lhs_offset_contribution0;
            q31_t res11 = lhs_offset_contribution1;
            q31_t res12 = lhs_offset_contribution2;
            q31_t res13 = lhs_offset_contribution3;
            
            
            //Precalculate rhs row pointers
            rhs_0 = rhs;
            rhs_1 = rhs_0 + rhs_cols;
            rhs_2 = rhs_1 + rhs_cols;
            rhs_3 = rhs_2 + rhs_cols;
            
            
            //initialize pointer
            const q7_t *lhs_ptr1 = lhs_ptr + rhs_cols;
            q7_t lhs_0_align, lhs_0_alignbits, lhs_1_align, lhs_1_alignbits;
            
            
            //determine alignment of lhs reads for current two rows
            if( lhs_rows_idx % 2)
            {
                lhs_0_align = 0;
                lhs_0_alignbits = 0;
                lhs_1_align = rhs_1_align;
                lhs_1_align = rhs_1_align;
            }
            else
            {
                lhs_0_align = rhs_2_align;
                lhs_0_alignbits = rhs_2_alignbits;
                lhs_1_align = rhs_3_align;
                lhs_1_align = rhs_3_align;
            }
            
            for (int32_t x = 0; x < (rhs_cols >> 2); ++x)
            {
                
                q31_t in_lhs= muriscv_nn_read_q7x4_ia_aligned(&lhs_ptr, lhs_0_align, lhs_0_alignbits); 

                q31_t in_rhs_0 = muriscv_nn_read_q7x4_ia_fast(&rhs_0);
                q31_t in_rhs_1 = muriscv_nn_read_q7x4_ia_aligned(&rhs_1, rhs_1_align, rhs_1_alignbits);
                q31_t in_rhs_2 = muriscv_nn_read_q7x4_ia_aligned(&rhs_2, rhs_2_align, rhs_2_alignbits);
                q31_t in_rhs_3 = muriscv_nn_read_q7x4_ia_aligned(&rhs_3, rhs_3_align, rhs_3_alignbits);
                
                res00 = __rv_smaqa(res00, in_lhs, in_rhs_0);
                res01 = __rv_smaqa(res01, in_lhs, in_rhs_1);
                res02 = __rv_smaqa(res02, in_lhs, in_rhs_2);
                res03 = __rv_smaqa(res03, in_lhs, in_rhs_3);

                in_lhs = muriscv_nn_read_q7x4_ia_aligned(&lhs_ptr1, lhs_1_align, lhs_1_alignbits);
                
                res10 = __rv_smaqa(res10, in_lhs, in_rhs_0);
                res11 = __rv_smaqa(res11, in_lhs, in_rhs_1);
                res12 = __rv_smaqa(res12, in_lhs, in_rhs_2);
                res13 = __rv_smaqa(res13, in_lhs, in_rhs_3);
                
                
            }
            //leftover columns in rhs.  Case not used by aww vww
            for (int32_t x = 0; x < (rhs_cols % 4); ++x)
            {
                q7_t rhs_value0 = rhs_0[0];
                q7_t rhs_value1 = rhs_1[0];
                q7_t rhs_value2 = rhs_2[0];
                q7_t rhs_value3 = rhs_3[0];
                q7_t lhs_value = lhs_ptr[0];

                
                res00 += lhs_value * rhs_value0;
                res01 += lhs_value * rhs_value1;
                res02 += lhs_value * rhs_value2;
                res03 += lhs_value * rhs_value3;

                lhs_value = lhs_ptr[rhs_cols];
                
                res10 += lhs_value * rhs_value0;
                res11 += lhs_value * rhs_value1;
                res12 += lhs_value * rhs_value2;
                res13 += lhs_value * rhs_value3;

                ++rhs_0;
                ++rhs_1;
                ++rhs_2;
                ++rhs_3;
                ++lhs_ptr;
            }

            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res01 = muriscv_nn_requantize(res01, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);
            res02 = muriscv_nn_requantize(res02, dst_multipliers[rhs_rows_idx + 2], dst_shifts[rhs_rows_idx + 2]);
            res03 = muriscv_nn_requantize(res03, dst_multipliers[rhs_rows_idx + 3], dst_shifts[rhs_rows_idx + 3]);
            res10 = muriscv_nn_requantize(res10, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res11 = muriscv_nn_requantize(res11, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);
            res12 = muriscv_nn_requantize(res12, dst_multipliers[rhs_rows_idx + 2], dst_shifts[rhs_rows_idx + 2]);
            res13 = muriscv_nn_requantize(res13, dst_multipliers[rhs_rows_idx + 3], dst_shifts[rhs_rows_idx + 3]);


            // THIS SECTION HAS ERROR, REWRITE SCALAR

            //add offset
            res00 += dst_offset;
            res01 += dst_offset;
            res02 += dst_offset;
            res03 += dst_offset;
            res10 += dst_offset;
            res11 += dst_offset;
            res12 += dst_offset;
            res13 += dst_offset;

            //clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);
            res01 = MAX(res01, activation_min);
            res01 = MIN(res01, activation_max);
            res02 = MAX(res02, activation_min);
            res02 = MIN(res02, activation_max);
            res03 = MAX(res03, activation_min);
            res03 = MIN(res03, activation_max);
            res10 = MAX(res10, activation_min);
            res10 = MIN(res10, activation_max);
            res11 = MAX(res11, activation_min);
            res11 = MIN(res11, activation_max);
            res12 = MAX(res12, activation_min);
            res12 = MIN(res12, activation_max);
            res13 = MAX(res13, activation_min);
            res13 = MIN(res13, activation_max);





            int32_t packed_out_0 = PACK_Q7x4_32x1(res00, res01, res02, res03);
            int32_t packed_out_1 = PACK_Q7x4_32x1(res10, res11, res12, res13);

            //OLD SIMD CODE
            // Clamp the result
            //packed_out_0 = __rv_smax8(packed_out_0, activation_min_packed);
            //packed_out_0 = __rv_smin8(packed_out_0, activation_max_packed);
            //packed_out_1 = __rv_smax8(packed_out_1, activation_min_packed);
            //packed_out_1 = __rv_smin8(packed_out_1, activation_max_packed);

            /* 
            // Add offset
            packed_out_0 = __rv_add8(packed_out_0, dst_offset_packed);
            packed_out_1 = __rv_add8(packed_out_1, dst_offset_packed); */
            
            

            //when not word aligned, write with memcpy.  Improvment possible, need benchmark that utilizes the unaligned case to test
            if(rhs_rows % 4)
            {
                muriscv_nn_write_q7x4(dst_ptr, packed_out_0);
                dst_ptr += rhs_rows;
                muriscv_nn_write_q7x4(dst_ptr, packed_out_1);
            }
            else
            {
                muriscv_nn_write_q7x4_fast(dst_ptr, packed_out_0);
                dst_ptr += rhs_rows;
                muriscv_nn_write_q7x4_fast(dst_ptr, packed_out_1);
            
            }
            
            dst_ptr += rhs_rows;
            lhs_ptr += rhs_cols;

            lhs_rows_idx--;
        }
        // Left-over rows in LHS
        //This is the only edge case used by vww and aww
        if (lhs_rows % 2)
        {
            const q7_t *rhs_ptr = &rhs[0];

            q31_t res00 = lhs_offset_contribution0;
            q31_t res01 = lhs_offset_contribution1;
            q31_t res02 = lhs_offset_contribution2;
            q31_t res03 = lhs_offset_contribution3;
            
            //precalculate row address pointers
            rhs_0 = rhs;
            rhs_1 = rhs + rhs_cols;
            rhs_2 = rhs_1 + rhs_cols;
            rhs_3 = rhs_2 + rhs_cols;          
                           
            //determine alignment of lhs read
            q7_t lhs_0_align, lhs_0_alignbits; 
            if( lhs_rows % 4 == 1)
            {
                lhs_0_align = 0;
                lhs_0_alignbits = 0;
            }
            else
            {
                lhs_0_align = rhs_2_align;
                lhs_0_alignbits = rhs_2_alignbits;
            }
                    
            for (int32_t x = 0; x < (rhs_cols >> 2); ++x)
            {   
                q31_t in_lhs = muriscv_nn_read_q7x4_ia_aligned(&lhs_ptr, lhs_0_align, lhs_0_alignbits); 
                
                q31_t in_rhs_0 = muriscv_nn_read_q7x4_ia_fast(&rhs_0);              
                q31_t in_rhs_1 = muriscv_nn_read_q7x4_ia_aligned(&rhs_1, rhs_1_align, rhs_1_alignbits);           
                q31_t in_rhs_2 = muriscv_nn_read_q7x4_ia_aligned(&rhs_2, rhs_2_align, rhs_2_alignbits);                
                q31_t in_rhs_3 = muriscv_nn_read_q7x4_ia_aligned(&rhs_3, rhs_3_align, rhs_3_alignbits);
                
                res00 = __rv_smaqa(res00, in_lhs, in_rhs_0);
                res01 = __rv_smaqa(res01, in_lhs, in_rhs_1);
                res02 = __rv_smaqa(res02, in_lhs, in_rhs_2);
                res03 = __rv_smaqa(res03, in_lhs, in_rhs_3);
                
            }
            //for leftover columns.  Possible optimizations, not used by aww/vww
            for (int32_t x = 0; x < (rhs_cols % 4); ++x)
            {
                q7_t rhs_value0 = rhs_ptr[0];
                q7_t rhs_value1 = rhs_ptr[rhs_cols];
                q7_t rhs_value2 = rhs_ptr[2 * rhs_cols];
                q7_t rhs_value3 = rhs_ptr[3 * rhs_cols];
                q7_t lhs_value = lhs_ptr[0];

                res00 += lhs_value * rhs_value0;
                res01 += lhs_value * rhs_value1;
                res02 += lhs_value * rhs_value2;
                res03 += lhs_value * rhs_value3;

                ++rhs_0;
                ++rhs_1;
                ++rhs_2;
                ++rhs_3;
                ++lhs_ptr;
            }
            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res01 = muriscv_nn_requantize(res01, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);
            res02 = muriscv_nn_requantize(res02, dst_multipliers[rhs_rows_idx + 2], dst_shifts[rhs_rows_idx + 2]);
            res03 = muriscv_nn_requantize(res03, dst_multipliers[rhs_rows_idx + 3], dst_shifts[rhs_rows_idx + 3]);


            // THIS SECTION HAS ERROR, REWRITE IN SCALAR

            //add offset
            res00 += dst_offset;
            res01 += dst_offset;
            res02 += dst_offset;
            res03 += dst_offset;

            //clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);
            res01 = MAX(res01, activation_min);
            res01 = MIN(res01, activation_max);
            res02 = MAX(res02, activation_min);
            res02 = MIN(res02, activation_max);
            res03 = MAX(res03, activation_min);
            res03 = MIN(res03, activation_max);

            int32_t packed_out_0 = PACK_Q7x4_32x1(res00, res01, res02, res03);
                        //OLD SIMD CODE
                        //packed_out_0 = __rv_add8(packed_out_0, dst_offset_packed);
                        
                        // Clamp the result

                        

                        //packed_out_0 = __rv_smax8(packed_out_0, activation_min_packed);
                        //packed_out_0 = __rv_smin8(packed_out_0, activation_max_packed);



            //check alignement and write
            if(rhs_rows % 4)
            {
                muriscv_nn_write_q7x4(dst_ptr, packed_out_0);
            }
            else
            {
                muriscv_nn_write_q7x4_fast(dst_ptr, packed_out_0);       
            }
        }
        rhs += 4 * rhs_cols;
        dst += 4;
    }  
    //Leftover rhs_rows
    //Possible optimizations to mimic above, not currently used in either vww or aww, would need a new benchmark to properly gauge performance
    int32_t rhs_rows_idx = rhs_rows % 4;
    while (rhs_rows_idx)
    {
        const q7_t *lhs_ptr = &lhs[0];
        q7_t *dst_ptr = &dst[0];

        for (int32_t lhs_rows_idx = 0; lhs_rows_idx < lhs_rows; ++lhs_rows_idx)
        {
            const q7_t *rhs_ptr = &rhs[0];
            q31_t res00 = 0;
            if (bias)
            {
                res00 = bias[rhs_rows - 1];
            }

            for (int32_t rhs_cols_idx = rhs_cols; rhs_cols_idx != 0; rhs_cols_idx--)
            {
                q31_t rhs_value = rhs_ptr[0];
                q31_t lhs_value = lhs_ptr[0] + lhs_offset;

                res00 += lhs_value * rhs_value;

                ++rhs_ptr;
                ++lhs_ptr;
            }
            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows - 1], dst_shifts[rhs_rows - 1]);

            // Add offset
            res00 += dst_offset;

            // Clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);

            dst_ptr[0] = (q7_t)res00;
            dst_ptr += rhs_rows;
        }
        rhs += rhs_rows;
        rhs_rows_idx -= 1;
    }
    return MURISCV_NN_SUCCESS;
       
#else /* defined(USE_PEXT) */
    for (int32_t rhs_rows_idx = 0; rhs_rows_idx <= (rhs_rows - 2); rhs_rows_idx += 2)
    {
        const q7_t *lhs_ptr = &lhs[0];
        q7_t *dst_ptr = &dst[0];

        q31_t lhs_offset_contribution0 = 0;
        q31_t lhs_offset_contribution1 = 0;

        for (int32_t x = 0; x < rhs_cols; ++x)
        {
            lhs_offset_contribution0 += rhs[x];
            lhs_offset_contribution1 += rhs[x + rhs_cols];
        }

        lhs_offset_contribution0 *= lhs_offset;
        lhs_offset_contribution1 *= lhs_offset;
        if (bias)
        {
            lhs_offset_contribution0 += bias[rhs_rows_idx];
            lhs_offset_contribution1 += bias[rhs_rows_idx + 1];
        }

        int32_t lhs_rows_idx = lhs_rows >> 1;

        while (lhs_rows_idx)
        {
            const q7_t *rhs_ptr = &rhs[0];

            q31_t res00 = lhs_offset_contribution0;
            q31_t res01 = lhs_offset_contribution1;
            q31_t res10 = lhs_offset_contribution0;
            q31_t res11 = lhs_offset_contribution1;

            for (int32_t rhs_cols_idx = rhs_cols; rhs_cols_idx != 0; rhs_cols_idx--)
            {
                q7_t rhs_value0 = rhs_ptr[0];
                q7_t rhs_value1 = rhs_ptr[rhs_cols];
                q7_t lhs_value = lhs_ptr[0];

                res00 += lhs_value * rhs_value0;
                res01 += lhs_value * rhs_value1;

                lhs_value = lhs_ptr[rhs_cols];
                res10 += lhs_value * rhs_value0;
                res11 += lhs_value * rhs_value1;

                ++rhs_ptr;
                ++lhs_ptr;
            }

            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res01 = muriscv_nn_requantize(res01, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);
            res10 = muriscv_nn_requantize(res10, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res11 = muriscv_nn_requantize(res11, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);

            // Add offset
            res00 += dst_offset;
            res01 += dst_offset;
            res10 += dst_offset;
            res11 += dst_offset;

            // Clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);
            res01 = MAX(res01, activation_min);
            res01 = MIN(res01, activation_max);
            res10 = MAX(res10, activation_min);
            res10 = MIN(res10, activation_max);
            res11 = MAX(res11, activation_min);
            res11 = MIN(res11, activation_max);

            dst_ptr[0] = (q7_t)res00;
            dst_ptr[1] = (q7_t)res01;
            dst_ptr += rhs_rows;
            dst_ptr[0] = (q7_t)res10;
            dst_ptr[1] = (q7_t)res11;
            dst_ptr += rhs_rows;

            lhs_ptr += rhs_cols;

            lhs_rows_idx--;
        }

        // Left-over rows
        if (lhs_rows % 2)
        {
            const q7_t *rhs_ptr = &rhs[0];

            q31_t res00 = lhs_offset_contribution0;
            q31_t res01 = lhs_offset_contribution1;

            for (int32_t rhs_cols_idx = rhs_cols; rhs_cols_idx != 0; rhs_cols_idx--)
            {
                q7_t rhs_value0 = rhs_ptr[0];
                q7_t rhs_value1 = rhs_ptr[rhs_cols];
                q7_t lhs_value = lhs_ptr[0];

                res00 += lhs_value * rhs_value0;
                res01 += lhs_value * rhs_value1;

                ++rhs_ptr;
                ++lhs_ptr;
            }

            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows_idx], dst_shifts[rhs_rows_idx]);
            res01 = muriscv_nn_requantize(res01, dst_multipliers[rhs_rows_idx + 1], dst_shifts[rhs_rows_idx + 1]);

            // Add offset
            res00 += dst_offset;
            res01 += dst_offset;

            // Clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);
            res01 = MAX(res01, activation_min);
            res01 = MIN(res01, activation_max);

            dst_ptr[0] = (q7_t)res00;
            dst_ptr[1] = (q7_t)res01;
        }

        rhs += 2 * rhs_cols;
        dst += 2;
    }

    if (rhs_rows % 2)
    {
        const q7_t *lhs_ptr = &lhs[0];
        q7_t *dst_ptr = &dst[0];

        for (int32_t lhs_rows_idx = 0; lhs_rows_idx < lhs_rows; ++lhs_rows_idx)
        {
            const q7_t *rhs_ptr = &rhs[0];
            q31_t res00 = 0;
            if (bias)
            {
                res00 = bias[rhs_rows - 1];
            }

            for (int32_t rhs_cols_idx = rhs_cols; rhs_cols_idx != 0; rhs_cols_idx--)
            {
                q31_t rhs_value = rhs_ptr[0];
                q31_t lhs_value = lhs_ptr[0] + lhs_offset;

                res00 += lhs_value * rhs_value;

                ++rhs_ptr;
                ++lhs_ptr;
            }

            // Quantize down
            res00 = muriscv_nn_requantize(res00, dst_multipliers[rhs_rows - 1], dst_shifts[rhs_rows - 1]);

            // Add offset
            res00 += dst_offset;

            // Clamp the result
            res00 = MAX(res00, activation_min);
            res00 = MIN(res00, activation_max);

            dst_ptr[0] = (q7_t)res00;
            dst_ptr += rhs_rows;
        }
        
    }
    return MURISCV_NN_SUCCESS;
    
    #endif
}

/**
 * @} end of NNBasicMath group
 */
