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

/**
 *  @ingroup groupNN
 */

/**
 * @addtogroup Acti
 * @{
 */

/*
 *  Basic ReLU6 function
 *
 * Refer to header file for details.
 *
 */

void muriscv_nn_relu6_s8(q7_t *data, uint16_t size)
{

#if defined(USE_VEXT)

    /* We are (ab)using a for loop as it keeps things tidier when compared
       to a while loop. We are operating on vl elements at a time. */
    for (size_t cnt = size, vl = 0; cnt > 0; cnt -= vl, data += vl)
    {
        /* Set the vl using 8bit elements and a vector grouping of 8. */
        vl = vsetvl_e8m8(cnt);

        /* Load the vector group from memory. */
        vint8m8_t val = vle8_v_i8m8(data, vl);

        /* Apply activation on whole vector group at once. */
        val = vmax_vx_i8m8(val, 0, vl);
        val = vmin_vx_i8m8(val, 6, vl);

        /* Store results back to memory. */
        vse8_v_i8m8(data, val, vl);
    }

#else /* defined(USE_VEXT) */

    /* Run the following code as reference implementation for cores without vector extension. */
    for (uint16_t i = 0; i < size; i++)
    {
        q7_t ip = MAX(data[i], 0);
        data[i] = MIN(ip, 6);
    }

#endif /* defined(USE_VEXT) */
}

/**
 * @} end of Acti group
 */
