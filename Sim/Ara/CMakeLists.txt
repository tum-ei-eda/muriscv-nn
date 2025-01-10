#
# Copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM.
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the License); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set(ARA_DIR ${CMAKE_CURRENT_LIST_DIR}/ara CACHE STRING "Root of ara repo.")
set(ARA_NR_LANES 4 CACHE STRING "Number of lanes.")
SET(ARA_APPS_DIR ${ARA_DIR}/apps)
SET(ARA_COMMON_DIR ${ARA_APPS_DIR}/common)
SET(ARA_CRT_INCLUDES ${ARA_COMMON_DIR})
MESSAGE(STATUS "ARA_DIR=${ARA_DIR}")
MESSAGE(STATUS "ARA_COMMON_DIR=${ARA_COMMON_DIR}")

SET(ARA_CRT_SRCS
    ${ARA_COMMON_DIR}/crt0.S
    ${ARA_COMMON_DIR}/string.c
    ${ARA_COMMON_DIR}/printf.c
    ${ARA_COMMON_DIR}/serial.c
    ${ARA_COMMON_DIR}/util.c
    ${ARA_COMMON_DIR}/
)

# Builds the ara C runtime
add_library(ara_crt STATIC)

target_include_directories(ara_crt PUBLIC ${ARA_CRT_INCLUDES})
target_sources(ara_crt PRIVATE ${ARA_CRT_SRCS})
