#
# Copyright (C) 2019-2021 Arm Limited.
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
# Modifications copyright (C) 2023 Chair of Electronic Design Automation, TUM
#

target_sources(${MURISCVNN_LIB} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_svdf_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_svdf_state_s16_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_svdf_get_buffer_sizes_s8.c)
