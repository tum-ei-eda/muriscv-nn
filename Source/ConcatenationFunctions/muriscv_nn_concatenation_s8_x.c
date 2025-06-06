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

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup Concatenation
 * @{
 */

/*
 *  s8 version of concatenation along the X axis
 *
 * Refer to header file for details.
 *
 */
void muriscv_nn_concatenation_s8_x(const int8_t *input,
                                   const uint16_t input_x,
                                   const uint16_t input_y,
                                   const uint16_t input_z,
                                   const uint16_t input_w,
                                   int8_t *output,
                                   const uint16_t output_x,
                                   const uint32_t offset_x)
{
    const uint32_t num_iterations = input_y * input_z * input_w;

    output += offset_x;

    // Copy per row
    for (uint32_t i = 0; i < num_iterations; ++i)
    {
        /* Will use RVV instructions when available */
        muriscv_nn_memcpy(output, input, input_x);
        input += input_x;
        output += output_x;
    }
}

/**
 * @} end of Concatenation group
 */
