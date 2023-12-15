// Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
/*
 * SPDX-FileCopyrightText: Copyright 2010-2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
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
 */

/* ----------------------------------------------------------------------
 * Project:      CMSIS NN Library
 * Title:        muriscv_nn_relu_q15.c
 * Description:  Q15 version of ReLU
 *
 * $Date:        31 January 2023
 * $Revision:    V.1.1.1
 *
 * Target :  Arm(R) M-Profile Architecture
 *
 * -------------------------------------------------------------------- */

#include "muriscv_nn_functions.h"
#include "muriscv_nn_support_functions.h"

/**
 *  @ingroup Public
 */

/**
 * @addtogroup Acti
 * @{
 */

/*
 * Q15 ReLu function
 *
 * Refer header file for details.
 *
 */

void muriscv_nn_relu_q15(int16_t *data, uint16_t size)
{

//#if defined(USE_PEXT) && !defined(USE_VEXT)
//    /* Run the following code for M cores with DSP extension */
//
//    uint16_t i = size >> 1;
//    int16_t *input = data;
//    int16_t *output = data;
//    int32_t in;
//    int32_t buf;
//    int32_t mask;
//
//    while (i)
//    {
//        in = muriscv_nn_read_q15x2_ia((const int16_t **)&input);
//
//        /* extract the first bit */
//        buf = ROR(in & 0x80008000, 15);
//
//        /* if MSB=1, mask will be 0xFF, 0x0 otherwise */
//        mask = QSUB16(0x00000000, buf);
//
//        muriscv_nn_write_q15x2_ia(&output, in & (~mask));
//        i--;
//    }
//
//    if (size & 0x1)
//    {
//        if (*input < 0)
//        {
//            *input = 0;
//        }
//        input++;
//    }
//#else
    /* Run the following code as reference implementation for M cores without DSP extension */
    uint16_t i;

    for (i = 0; i < size; i++)
    {
        if (data[i] < 0)
            data[i] = 0;
    }

//#endif /* USE_PEXT */
}

/**
 * @} end of Acti group
 */
