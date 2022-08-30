/*
 * Copyright (C) 2022 Chair of Electronic Design Automation, TUM
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

#ifndef _VICUNA_CRT_H
#define _VICUNA_CRT_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>

#include "vicuna/sw/lib/runtime.h"
#include "vicuna/sw/lib/uart.h"

// TODO(fabianpedd): This is all very hacky and needs to be properly fixed at some point
#define printf uart_printf
// TODO(fabianpedd): For some reason the Newlib malloc/free on Vicuna are not working. Need to figure out why...
#define malloc vicuna_malloc
#define free vicuna_free

void *vicuna_malloc(size_t size);

void vicuna_free(void *ptr);

#ifdef __cplusplus
}
#endif

#endif /* _VICUNA_CRT_H */
