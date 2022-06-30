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

#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#define DELTA(x, y) (((x) > (y)) ? ((x) - (y)) : ((y) - (x)))

static inline size_t validate_t(int8_t *act, const int8_t *ref, size_t size, int8_t tolerance)
{
    size_t test_passed = true;
    size_t count = 0;
    size_t total = 0;

    for (size_t i = 0; i < size; ++i)
    {
        total++;
        if (act[i] != ref[i] && DELTA(act[i], ref[i]) > tolerance)
        {
            count++;
            printf("ERROR at pos %d: Act: %d Ref: %d\r\n", i, act[i], ref[i]);
            test_passed = false;
        }
        else
        {
            // printf("PASS at pos %d: %d\r\n", i, act[i]);
        }
        // Reset the output buffer so that following tests can't cheat
        act[i] = 0;
    }

    if (!test_passed)
    {
        printf("%d of %d failed\r\n", count, total);
    }

    return test_passed;
}

static inline size_t validate(int8_t *act, const int8_t *ref, size_t size) { return validate_t(act, ref, size, 0); }

static inline size_t validate_s16_t(int16_t *act, const int16_t *ref, size_t size, int16_t tolerance)
{
    size_t test_passed = true;
    size_t count = 0;
    size_t total = 0;

    for (size_t i = 0; i < size; ++i)
    {
        total++;
        if (act[i] != ref[i] && DELTA(act[i], ref[i]) > tolerance)
        {
            count++;
            printf("ERROR at pos %d: Act: %d Ref: %d\r\n", i, act[i], ref[i]);
            test_passed = false;
        }
        else
        {
            // printf("PASS at pos %d: %d\r\n", i, act[i]);
        }
        // Reset the output buffer so that following tests can't cheat
        act[i] = 0;
    }

    if (!test_passed)
    {
        printf("%d of %d failed\r\n", count, total);
    }

    return test_passed;
}

static inline size_t validate_s16(int16_t *act, const int16_t *ref, size_t size)
{
    return validate_s16_t(act, ref, size, 0);
}
