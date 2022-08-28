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

set(TEST_NAME aww)

add_executable(${TEST_NAME}_tflm)

target_include_directories(${TEST_NAME}_tflm PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(${TEST_NAME}_tflm PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.h
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.h
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

target_link_libraries(${TEST_NAME}_tflm PRIVATE tflm)

add_muriscv_nn_intg_test(${TEST_NAME}_tflm)
