/*
 * Copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM.
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

#ifndef _COREV_UTIL_H
#define _COREV_UTIL_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifdef COREV_EMUL

static inline uint32_t __builtin_riscv_cv_pack(uint32_t rs1, uint32_t rs2)
{
    return ((rs1 & 0xffffu) << 16) | (rs2 & 0xffffu);
}

static inline uint32_t __builtin_riscv_cv_add_h(uint32_t rs1, uint32_t rs2)
{
    uint32_t lo = ((rs1 & 0xffffu) + (rs2 & 0xffffu)) & 0xffffu;
    uint32_t hi = (((rs1 >> 16) & 0xffffu) + ((rs2 >> 16) & 0xffffu)) & 0xffffu;

    return (hi << 16) | lo;
}

static inline int32_t __builtin_riscv_cv_sdotsp_h(uint32_t rs1, uint32_t rs2, int32_t acc)
{
    int32_t a0 = (int16_t)(rs1 & 0xffffu);
    int32_t a1 = (int16_t)(rs1 >> 16);
    int32_t b0 = (int16_t)(rs2 & 0xffffu);
    int32_t b1 = (int16_t)(rs2 >> 16);

    uint32_t result = (uint32_t)acc;
    result += (uint32_t)(a0 * b0);
    result += (uint32_t)(a1 * b1);

    return (int32_t)result;
}

static inline int32_t __builtin_riscv_cv_sdotsp_b(uint32_t rs1, uint32_t rs2, int32_t acc)
{
    int32_t a0 = (int8_t)(rs1);
    int32_t a1 = (int8_t)(rs1 >> 8);
    int32_t a2 = (int8_t)(rs1 >> 16);
    int32_t a3 = (int8_t)(rs1 >> 24);

    int32_t b0 = (int8_t)(rs2);
    int32_t b1 = (int8_t)(rs2 >> 8);
    int32_t b2 = (int8_t)(rs2 >> 16);
    int32_t b3 = (int8_t)(rs2 >> 24);

    uint32_t result = (uint32_t)acc;
    result += (uint32_t)(a0 * b0);
    result += (uint32_t)(a1 * b1);
    result += (uint32_t)(a2 * b2);
    result += (uint32_t)(a3 * b3);

    return (int32_t)result;
}

#else
static inline uint32_t __builtin_riscv_cv_pack(uint32_t rs1, uint32_t rs2)
{
    uint32_t result;
    asm("cv.pack %0, %1, %2" : "=r"(result) : "r"(rs1), "r"(rs2));
    return result;
}
static inline uint32_t __builtin_riscv_cv_add_h(uint32_t rs1, uint32_t rs2)
{
    uint32_t result;
    asm("cv.add.h %0, %1, %2" : "=r"(result) : "r"(rs1), "r"(rs2));
    return result;
}
static inline int32_t __builtin_riscv_cv_sdotsp_h(uint32_t rs1, uint32_t rs2, int32_t acc)
{
    asm("cv.sdotsp.h %0, %1, %2" : "+r"(acc) : "r"(rs1), "r"(rs2));
    return acc;
}
static inline int32_t __builtin_riscv_cv_sdotsp_b(uint32_t rs1, uint32_t rs2, int32_t acc)
{
    asm("cv.sdotsp.b %0, %1, %2" : "+r"(acc) : "r"(rs1), "r"(rs2));
    return acc;
}
#endif

#endif /* _COREV_UTIL_H */
