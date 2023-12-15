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

#ifndef _MURISCV_NN_MATH_TYPES_H
#define _MURISCV_NN_MATH_TYPES_H

#ifdef __cplusplus
extern "C" {
#endif

#include <float.h>
#include <limits.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

/**
 * @brief 8-bit fractional data type in 1.7 format.
 */
typedef int8_t q7_t;

/**
 * @brief 16-bit fractional data type in 1.15 format.
 */
typedef int16_t q15_t;

/**
 * @brief 32-bit fractional data type in 1.31 format.
 */
typedef int32_t q31_t;

/**
 * @brief 64-bit fractional data type in 1.63 format.
 */
typedef int64_t q63_t;

/**
 * @brief 32-bit floating-point type definition.
 */
typedef float float32_t;

/**
 * @brief 64-bit floating-point type definition.
 */
typedef double float64_t;

/**
 * @brief 32x4 vector type definition.
 */
typedef uint32_t int32x4_t;

/**
 * @brief 16_bit vector type definition
 */
typedef uint16_t mve_pred16_t;

/**
 * @brief Add typedefs for min and max values.
 */
#define F64_MAX ((float64_t)DBL_MAX)
#define F32_MAX ((float32_t)FLT_MAX)
#define F64_MIN (-DBL_MAX)
#define F32_MIN (-FLT_MAX)

#define F64_ABSMAX ((float64_t)DBL_MAX)
#define F32_ABSMAX ((float32_t)FLT_MAX)
#define F64_ABSMIN ((float64_t)0.0)
#define F32_ABSMIN ((float32_t)0.0)

#define Q31_MAX ((q31_t)(0x7FFFFFFFL))
#define Q15_MAX ((q15_t)(0x7FFF))
#define Q7_MAX ((q7_t)(0x7F))
#define Q31_MIN ((q31_t)(0x80000000L))
#define Q15_MIN ((q15_t)(0x8000))
#define Q7_MIN ((q7_t)(0x80))

#define Q31_ABSMAX ((q31_t)(0x7FFFFFFFL))
#define Q15_ABSMAX ((q15_t)(0x7FFF))
#define Q7_ABSMAX ((q7_t)(0x7F))
#define Q31_ABSMIN ((q31_t)0)
#define Q15_ABSMIN ((q15_t)0)
#define Q7_ABSMIN ((q7_t)0)


#define NN_Q31_MAX ((int32_t)(0x7FFFFFFFL))
#define NN_Q15_MAX ((int16_t)(0x7FFF))
#define NN_Q7_MAX ((int8_t)(0x7F))
#define NN_Q31_MIN ((int32_t)(0x80000000L))
#define NN_Q15_MIN ((int16_t)(0x8000))
#define NN_Q7_MIN ((int8_t)(0x80))

/**
 * @brief Error status returned by some functions in the library.
 */
typedef enum
{
    MURISCV_NN_SUCCESS = 0,        /**< No error */
    MURISCV_NN_ARG_ERROR = -1,     /**< One or more arguments are incorrect */
    MURISCV_NN_NO_IMPL_ERROR = -2, /**< No implementation available */
} muriscv_nn_status;

#ifdef __cplusplus
}
#endif

#endif /* _MURISCV_NN_MATH_TYPES_H */
