#!/bin/bash
#
# Copyright (C) 2023 Chair of Electronic Design Automation, TUM.
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

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

USE_PEXT=OFF
USE_VEXT=OFF
VLEN=1024
ELEN=64
RV_ARCH=rv32gc
BENCHMARK=NONE
TOOLCHAIN=GCC
SKIP_BUILD=OFF



#Parse Input Args
while getopts 'pvl:b:t:se:h' flag; do
  case "${flag}" in
    p) USE_PEXT=ON 
       RV_ARCH=rv32gcp ;;
  ``v) USE_VEXT=ON 
       RV_ARCH=rv32gcv ;;
    s) SKIP_BUILD=ON ;;
    l) VLEN="${OPTARG}" 
        if [ "${VLEN}" == 0 ]; then
          echo "Set VLEN to 1024 to make Spike not error when VEXT is not used"
          VLEN=1024
        fi  ;;
    e) ELEN="${OPTARG}" ;;
    b) BENCHMARK="${OPTARG}" ;;
    t) TOOLCHAIN="${OPTARG}" ;;
    * | h) echo "Add -p to compile with rv32gcp"
           echo "Add -v to compile with rv32gcv"
           echo "Specify VLEN with -l {VLEN}"
           echo "Use -b {aww/vww/toy/ic} to select tvm benchmark to run"
           echo "Use -t {GCC/LLVM} to select toolchain.  PEXT is only supported with GCC"
           exit 1 ;;
  esac
done

if [ "${BENCHMARK}" == "NONE" ]; then
    echo "ERROR: NO BENCHMARK SELECTED:  Please select a benchmark with -b {aww/vww/toy/ic}"
    exit 1
fi
if [ "${USE_VEXT}" == "ON" ] && [ "${USE_PEXT}" == "ON" ]; then
    echo "ERROR: ONLY CHOOSE EITHER rv32gcv or rv32gcp"
    exit 1
fi
if [ "${TOOLCHAIN}" == "LLVM" ] && [ "${USE_PEXT}" == "ON" ]; then
    echo "ERROR: PEXT is only supported with GCC"
    exit 1
fi

echo "*** Checking if TVM has been setup ***"
if [ ! -d ./aww/mlf ]; then
    ./setup_tvm.sh
fi

if [ "${TOOLCHAIN}" == "LLVM" ]; then
  echo "*** Checking for LLVM ***"
  cd ../../Toolchain
    # Download LLVM 18 (which includes vector support)
  if [ -d llvm ]; then
    echo "Found LLVM compiler in the Toolchain directory."
  else
    echo "No LLVM compiler in the Toolchain directory found. Downloading one..."
      ./download_llvm.sh 18   
  fi

else
  echo "*** Checking for GCC Binaries ***"
  cd ../../Toolchain

  if [ ! -d ./${RV_ARCH} ]; then
      
      echo "MISSING ${RV_ARCH} in Toolchains folder.  Downloading prebuilt GCC with script now."
      ./download_${RV_ARCH}.sh
  fi
fi

echo "*** Checking for Spike and PK binaries ***"
cd ../Sim/Spike/bin

if [ ! -f spike ]; then
    echo "MISSING Spike in Sim/Spike/bin folder.  Downloading prebuilt Spike and PK with script now."
    ./download.sh
fi


if [ "${SKIP_BUILD}" == OFF ]; then

  echo "*** Deleting Current Build Directory ***"
  cd ../../..
  if [  -d ./build ]; then
    sudo rm -r build
  fi

  echo "*** Building ${BENCHMARK} ***"

  mkdir build
  cd build
  cmake -DRISCV_GCC_PREFIX=$(pwd)/../Toolchain/${RV_ARCH}/ -DRISCV_LLVM_PREFIX=$(pwd)/../Toolchain/llvm/bin/ -DENABLE_INTG_TESTS=ON -DTOOLCHAIN=${TOOLCHAIN} -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} -DDISABLE_TFLM_INTG_TESTS=ON ..
  make all

else
  echo "*** Skipping Build ***"
  cd ../../../build
fi

echo "*** Running with Spike ***"
cd ../Sim/Spike
./run.sh $(pwd)/../../build/Integration/tvm/${BENCHMARK}/${BENCHMARK}_tvm.elf ${RV_ARCH} ${VLEN} ${ELEN}











