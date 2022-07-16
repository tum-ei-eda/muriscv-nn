/*
 * Copyright (C) 2019 Nuclei Limited.
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

/* Contains functions that emulate ARM instructions that RISC-V does not have. */

#ifndef _MURISCV_NN_COMPATIBLE_H
#define _MURISCV_NN_COMPATIBLE_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ===== Saturation Operations ===== */
static inline int32_t __SSAT(int32_t val, uint32_t sat)
{
    if ((sat >= 1U) && (sat <= 32U))
    {
        const int32_t max = (int32_t)((1U << (sat - 1U)) - 1U);
        const int32_t min = -1 - max;
        if (val > max)
        {
            return max;
        }
        else if (val < min)
        {
            return min;
        }
    }
    return val;
}

static inline uint32_t __USAT(int32_t val, uint32_t sat)
{
    if (sat <= 31U)
    {
        const uint32_t max = ((1U << sat) - 1U);
        if (val > (int32_t)max)
        {
            return max;
        }
        else if (val < 0)
        {
            return 0U;
        }
    }
    return (uint32_t)val;
}

/* ===== Data Processing Operations ===== */
static inline uint32_t __REV(uint32_t value)
{
    uint32_t result;

    result = ((value & 0xff000000) >> 24) | ((value & 0x00ff0000) >> 8) | ((value & 0x0000ff00) << 8) |
        ((value & 0x000000ff) << 24);
    return result;
}

static inline uint32_t __REV16(uint32_t value)
{
    uint32_t result;
    result = ((value & 0xff000000) >> 8) | ((value & 0x00ff00000) << 8) | ((value & 0x0000ff00) >> 8) |
        ((value & 0x000000ff) << 8);

    return result;
}

static inline int16_t __REVSH(int16_t value)
{
    int16_t result;
    result = ((value & 0xff00) >> 8) | ((value & 0x00ff) << 8);
    return result;
}

static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
    op2 = op2 & 0x1F;
    if (op2 == 0U)
    {
        return op1;
    }
    return (op1 >> op2) | (op1 << (32U - op2));
}

static inline uint32_t __RBIT(uint32_t value)
{
    uint32_t result;
    uint32_t s = (4U /*sizeof(v)*/ * 8U) - 1U; /* extra shift needed at end */

    result = value; /* r will be reversed bits of v; first get LSB of v */
    for (value >>= 1U; value != 0U; value >>= 1U)
    {
        result <<= 1U;
        result |= value & 1U;
        s--;
    }
    result <<= s; /* shift when v's highest bits are zero */
    return result;
}

static inline uint8_t __CLZ(uint32_t data)
{
    uint8_t ret = 0;
    uint32_t temp = ~data;
    while (temp & 0x80000000)
    {
        temp <<= 1;
        ret++;
    }
    return ret;
}

#ifndef BUILDING_FOR_ETISS
// TODO(fabianpedd): Check if this is still needed?
#ifndef fp_barrierf
#define fp_barrierf fp_barrierf
static inline float fp_barrierf(float x)
{
    volatile float y = x;
    return y;
}
#endif
static inline float eval_as_float(float x)
{
    float y = x;
    return y;
}
__attribute__((weak)) float __math_xflowf(uint32_t sign, float y)
{
    return eval_as_float(fp_barrierf(sign ? -y : y) * y);
}
__attribute__((weak)) float __math_oflowf(uint32_t sign) { return __math_xflowf(sign, 0x1p97f); }
#undef fp_barrierf
#endif /* BUILDING_FOR_ETISS */

#ifdef __cplusplus
}
#endif

#endif /* _MURISCV_NN_COMPATIBLE_H */
