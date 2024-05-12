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

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

#define ACCUM_BITS 12

// TODO(fabianpedd): Implement SIMD acceleration

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup Softmax
 * @{
 */

void muriscv_nn_softmax_s8(const int8_t *input,
                           const int32_t num_rows,
                           const int32_t row_size,
                           const int32_t mult,
                           const int32_t shift,
                           const int32_t diff_min,
                           int8_t *output)
{
    muriscv_nn_softmax_common_s8(input, num_rows, row_size, mult, shift, diff_min, false, (void *)output);
}

/**
 * @} end of Softmax group
 */
