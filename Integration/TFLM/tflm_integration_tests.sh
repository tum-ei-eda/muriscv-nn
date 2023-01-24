#!/bin/bash
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

# Runs integration tests on TFLM. It's important to note that failing tests are
# not natively detected. Only tests that throw build errors or cause simulation
# exceptions are caught. Inspect the test output manually in order to ensure
# error free operation.

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of tests to run
TESTS=(hello_world_test magic_wand_test micro_speech_test network_tester_test person_detection_test)

# List of benchmarks to run
BENCHMARKS=(keyword_benchmark keyword_benchmark_8bit person_detection_benchmark)

# Path to muRISCV-NN, TFLM and Toolchain
MURISCV_NN_PATH=${SCRIPT_DIR}/../..


cd ${SCRIPT_DIR}
TFLM_PATH=${SCRIPT_DIR}/tflite-micro


# Compiliation parameters
TARGET=muriscv_nn             # don't change
OPTIMIZED_KERNEL_DIR=cmsis_nn # don't change
if [ $# -eq 0 ]
  then
    echo "No arguments supplied, using default configuration"
    USE_VEXT=ON                  # ON/OFF
    USE_PEXT=OFF                # ON/OFF
    BUILD_TYPE=Release            # Debug/Release
    TOOLCHAIN=llvm            # gcc/llvm (gcc requires normal/full version of the rv32gcv toolchain, not the lite version)
    TARGET_ARCH=rv32gcv           # rv32gcv for vector support
    GCC_TOOLCHAIN_ROOT=${MURISCV_NN_PATH}/Toolchain/rv32gcv
    VLEN=512               # Vector length parameter passed to simulator
    SIMULATOR=OVPsim            # Spike/OVPsim
    else
    USE_VEXT=$1                  # ON/OFF
    USE_PEXT=$2                # ON/OFF
    BUILD_TYPE=$3            # Debug/Release
    TOOLCHAIN=$4            # gcc/llvm (gcc requires normal/full version of the rv32gcv toolchain, not the lite version)
    TARGET_ARCH=$5           # rv32gcv for vector support
    GCC_TOOLCHAIN_ROOT=${MURISCV_NN_PATH}/Toolchain/$5
    VLEN=$6               # Vector length parameter passed to simulator
    SIMULATOR=$7            # Spike/OVPsim
    
fi


# TODO(fabianpedd): check whether the args above actually get passed to the code, such as USE_VEXT

cd ${TFLM_PATH}


make -f tensorflow/lite/micro/tools/make/Makefile clean

for test in "${TESTS[@]}"; do
#USE_PEXT originally missing
  make -j$(nproc) -f tensorflow/lite/micro/tools/make/Makefile \
    TARGET=${TARGET} \
    TARGET_ARCH=${TARGET_ARCH} \
    OPTIMIZED_KERNEL_DIR=${OPTIMIZED_KERNEL_DIR} \
    MURISCV_NN_PATH=${MURISCV_NN_PATH} \
    USE_VEXT=${USE_VEXT} \
    USE_PEXT=${USE_PEXT} \
    TOOLCHAIN=${TOOLCHAIN} \
    GCC_TOOLCHAIN_ROOT=${GCC_TOOLCHAIN_ROOT} \
    BUILD_TYPE=${BUILD_TYPE} \
    ${test}
    
    ${MURISCV_NN_PATH}/Sim/${SIMULATOR}/run.sh \
        ${TFLM_PATH}/gen/${TARGET}_${TARGET_ARCH}_${BUILD_TYPE}/bin/${test} \
        ${TARGET_ARCH} ${VLEN} 1
    
done

make -f tensorflow/lite/micro/tools/make/Makefile clean
for bm in "${BENCHMARKS[@]}"; do
  make -j$(nproc) -f tensorflow/lite/micro/tools/make/Makefile \
    TARGET=${TARGET} \
    TARGET_ARCH=${TARGET_ARCH} \
    OPTIMIZED_KERNEL_DIR=${OPTIMIZED_KERNEL_DIR} \
    MURISCV_NN_PATH=${MURISCV_NN_PATH} \
    USE_VEXT=${USE_VEXT} \
    USE_PEXT=${USE_PEXT} \
    TOOLCHAIN=${TOOLCHAIN} \
    GCC_TOOLCHAIN_ROOT=${GCC_TOOLCHAIN_ROOT} \
    BUILD_TYPE=${BUILD_TYPE} \
    ${bm}
    
    ${MURISCV_NN_PATH}/Sim/${SIMULATOR}/run.sh \
    ${TFLM_PATH}/gen/${TARGET}_${TARGET_ARCH}_${BUILD_TYPE}/bin/${bm} \
    ${TARGET_ARCH} ${VLEN} 1
done
