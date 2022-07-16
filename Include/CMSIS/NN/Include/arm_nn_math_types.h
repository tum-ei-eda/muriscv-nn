/*
 * Copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM
 *
 Copyright [yyyy] [name of copyright owner]

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 *
 */

#ifndef _ARM_NN_MATH_TYPES_H_
#define _ARM_NN_MATH_TYPES_H_

#include "muriscv_nn_math_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define arm_cmsis_nn_status muriscv_nn_status
#define ARM_CMSIS_NN_SUCCESS MURISCV_NN_SUCCESS
#define ARM_CMSIS_NN_ARG_ERROR MURISCV_NN_ARG_ERROR
#define ARM_CMSIS_NN_NO_IMPL_ERROR MURISCV_NN_NO_IMPL_ERROR

// TODO: Kept only for backwards compatibility
#define arm_status muriscv_nn_status
#define ARM_MATH_SUCCESS MURISCV_NN_SUCCESS

#ifdef __cplusplus
}
#endif

#endif /* _ARM_NN_MATH_TYPES_H_ */
