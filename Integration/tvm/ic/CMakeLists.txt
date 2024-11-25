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

set(TEST_NAME ic)

add_executable(${TEST_NAME}_tvm)

if(USE_VEXT)
  set(MLF_DIR mlf_vext)
elseif(USE_PEXT)
  set(MLF_DIR mlf_pext)
else()
  set(MLF_DIR mlf)
endif()

#For Vicuna, need to include additional directories
if(${SIMULATOR} STREQUAL "Vicuna")
  target_include_directories(${TEST_NAME}_tvm PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/runtime/include
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/include
    ${PROJECT_SOURCE_DIR}/Include
    ${PROJECT_SOURCE_DIR}/Include/CMSIS/NN/Include

    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/vicuna/sw/lib
    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/crt

  )

  target_sources(${TEST_NAME}_tvm PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.h
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.h
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.h

    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/vicuna/sw/lib/uart.c
    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/vicuna/sw/lib/uart.h

    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/crt/vicuna_crt.c
    ${PROJECT_SOURCE_DIR}/Sim/Vicuna/crt/vicuna_crt.h
  )
else()
  target_include_directories(${TEST_NAME}_tvm PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/runtime/include
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/include
    ${PROJECT_SOURCE_DIR}/Include
    ${PROJECT_SOURCE_DIR}/Include/CMSIS/NN/Include
  )

  target_sources(${TEST_NAME}_tvm PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${MLF_DIR}/codegen/host/src/default_lib2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_input_data.h
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_model_settings.h
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/${TEST_NAME}_data/${TEST_NAME}_output_data_ref.h
  )
endif()
target_compile_options(${TEST_NAME}_tvm PRIVATE -Wno-incompatible-pointer-types)

target_link_libraries(${TEST_NAME}_tvm PRIVATE muriscvnn)

add_muriscv_nn_intg_test(${TEST_NAME}_tvm)
