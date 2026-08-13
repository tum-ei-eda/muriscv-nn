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

#ifndef _MNN_UTIL_H
#define _MNN_UTIL_H

#include <stdint.h>

#include "corev_utils.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef MNN_EMUL

static inline int32_t __builtin_riscv_mnn_exths_b32(uint32_t rs1)
{
    int16_t hi = (int8_t)((rs1 >> 24) & 0xffu);
    int16_t lo = (int8_t)((rs1 >> 16) & 0xffu);

    return (int32_t)(((uint32_t)(uint16_t)hi << 16) | (uint32_t)(uint16_t)lo);
}

static inline int32_t __builtin_riscv_mnn_exths_b10(uint32_t rs1)
{
    int16_t hi = (int8_t)((rs1 >> 8) & 0xffu);
    int16_t lo = (int8_t)(rs1 & 0xffu);

    return (int32_t)(((uint32_t)(uint16_t)hi << 16) | (uint32_t)(uint16_t)lo);
}

#else
static inline int32_t __builtin_riscv_mnn_exths_b32(uint32_t rs1)
{
    uint32_t unpacked;
    asm("mnn.exths.b32 %0, %1" : "=r"(unpacked) : "r"(rs1));
    return unpacked;
}
static inline int32_t __builtin_riscv_mnn_exths_b10(uint32_t rs1)
{
    uint32_t unpacked;
    asm("mnn.exths.b10 %0, %1" : "=r"(unpacked) : "r"(rs1));
    return unpacked;
}
#endif

#ifdef __cplusplus
}
#endif

#endif /* _MNN_UTIL_H */
