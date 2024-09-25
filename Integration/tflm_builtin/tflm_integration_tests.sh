#!/bin/bash
#
# Copyright (C) 2021-2023 Chair of Electronic Design Automation, TUM.
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
TESTS=(hello_world hello_world_test micro_speech micro_speech_test network_tester_test person_detection_test kernel_conv_test kernel_transpose_conv_test unidirectional_sequence_lstm_test kernel_add_test kernel_depthwise_conv_test kernel_fully_connected_test kernel_mul_test kernel_pooling_test kernel_softmax_test kernel_svdf_test)
# TODO: kernel_lstm_eval_test?

# List of benchmarks to run
BENCHMARKS=(keyword_benchmark keyword_benchmark_8bit person_detection_benchmark)

# Path to muRISCV-NN, TFLM and Toolchain
MURISCV_NN_PATH=${SCRIPT_DIR}/../..


cd ${SCRIPT_DIR}
TFLM_PATH=${SCRIPT_DIR}/tflite-micro


# Compiliation parameters
TARGET=muriscv_nn             # don't change
OPTIMIZED_KERNEL_DIR=cmsis_nn # don't change
USE_VEXT=${1:-"OFF"}                # ON/OFF
USE_PEXT=${2:-"OFF"}                # ON/OFF
USE_PORTABLE=${3:-"OFF"}            # ON/OFF
BUILD_TYPE=${4:-"release"}          # debug/release
TOOLCHAIN=${5:-"llvm"}              # gcc/llvm (gcc requires normal/full version of the rv32gcv toolchain, not the lite version)
TARGET_ARCH=${6:-"rv32gc"}          # rv32gc/rv32gcv/...
GCC_TOOLCHAIN_ROOT=${MURISCV_NN_PATH}/Toolchain/$TARGET_ARCH
VLEN=${7:-512}                      # Vector length parameter passed to simulator
ELEN=${8:-64}                       # Maximum vector element width
SIMULATOR=${9:-"Spike"}             # Spike/OVPsim

#If VEXT is disabled, set VLEN to 1024 to prevent simulator complaints
if [ ${USE_VEXT} == OFF ]; then
    VLEN='1024'
    ELEN='64'
fi

cd ${TFLM_PATH}

make -f tensorflow/lite/micro/tools/make/Makefile clean

for test in "${TESTS[@]}"; do
  echo test=${test}
  make -j$(nproc) -f tensorflow/lite/micro/tools/make/Makefile \
    TARGET=${TARGET} \
    TARGET_ARCH=${TARGET_ARCH} \
    OPTIMIZED_KERNEL_DIR=${OPTIMIZED_KERNEL_DIR} \
    MURISCV_NN_PATH=${MURISCV_NN_PATH} \
    USE_PORTABLE=${USE_PORTABLE} \
    USE_VEXT=${USE_VEXT} \
    USE_PEXT=${USE_PEXT} \
    TOOLCHAIN=${TOOLCHAIN} \
    GCC_TOOLCHAIN_ROOT=${GCC_TOOLCHAIN_ROOT} \
    LLVM_TOOLCHAIN_ROOT=${MURISCV_NN_PATH}/Toolchain/llvm/bin \
    BUILD_TYPE=${BUILD_TYPE} \
    ${test}

  ELF=${TFLM_PATH}/gen/${TARGET}_${TARGET_ARCH}_${BUILD_TYPE}_cmsis_nn_${TOOLCHAIN}/bin/${test}
  echo "*** Running with $SIMULATOR ***"
  if [[ $SIMULATOR == "Native" ]]
  then
    $ELF
  elif [[ $SIMULATOR == "Spike" ]]
  then
    $MURISCV_NN_PATH/Sim/Spike/run.sh $ELF ${TARGET_ARCH} ${VLEN} ${ELEN}
  elif [[ $SIMULATOR == "OVPsim" ]]
  then
    $MURISCV_NN_PATH/Sim/OVPsim/run.sh $ELF ${TARGET_ARCH} ${VLEN} ${ELEN} 1
  elif [[ $SIMULATOR == "ETISS" ]]
  then
    $MURISCV_NN_PATH/Sim/ETISS/run.sh $ELF
  else
    echo "Unsupported Simulator: $SIMULATOR"
  fi
done

# make -f tensorflow/lite/micro/tools/make/Makefile clean


for bm in "${BENCHMARKS[@]}"; do
  echo bm=${bm}
  make -j$(nproc) -f tensorflow/lite/micro/tools/make/Makefile \
    TARGET=${TARGET} \
    TARGET_ARCH=${TARGET_ARCH} \
    OPTIMIZED_KERNEL_DIR=${OPTIMIZED_KERNEL_DIR} \
    MURISCV_NN_PATH=${MURISCV_NN_PATH} \
    USE_PORTABLE=${USE_PORTABLE} \
    USE_VEXT=${USE_VEXT} \
    USE_PEXT=${USE_PEXT} \
    TOOLCHAIN=${TOOLCHAIN} \
    GCC_TOOLCHAIN_ROOT=${GCC_TOOLCHAIN_ROOT} \
    LLVM_TOOLCHAIN_ROOT=${MURISCV_NN_PATH}/Toolchain/llvm/bin \
    BUILD_TYPE=${BUILD_TYPE} \
    ${bm}

  ELF=${TFLM_PATH}/gen/${TARGET}_${TARGET_ARCH}_${BUILD_TYPE}_cmsis_nn_${TOOLCHAIN}/bin/${bm} \
  echo "*** Running with $SIMULATOR ***"
  if [[ $SIMULATOR == "Native" ]]
  then
    $ELF
  elif [[ $SIMULATOR == "Spike" ]]
  then
    $MURISCV_NN_PATH/Sim/Spike/run.sh $ELF ${TARGET_ARCH} ${VLEN} ${ELEN}
  elif [[ $SIMULATOR == "OVPsim" ]]
  then
    $MURISCV_NN_PATH/Sim/OVPsim/run.sh $ELF ${TARGET_ARCH} ${VLEN} ${ELEN} 1
  elif [[ $SIMULATOR == "ETISS" ]]
  then
    $MURISCV_NN_PATH/Sim/ETISS/run.sh $ELF
  else
    echo "Unsupported Simulator: $SIMULATOR"
  fi
done
