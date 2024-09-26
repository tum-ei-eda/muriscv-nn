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

USE_PORTABLE=OFF
USE_PEXT=OFF
USE_VEXT=OFF
VLEN=1024
ELEN=64
RV_ARCH=rv32gc
BENCHMARK=NONE
TOOLCHAIN=GCC
SKIP_BUILD=OFF
SIMULATOR=Spike



#Parse Input Args
while getopts 'xpvl:b:t:Se:s:h' flag; do
  case "${flag}" in
    x) USE_PORTABLE=ON ;;
    p) USE_PEXT=ON
       RV_ARCH=rv32gcp ;;
  ``v) USE_VEXT=ON
       RV_ARCH=rv32gcv ;;
    S) SKIP_BUILD=ON ;;
    l) VLEN="${OPTARG}"
        if [ "${VLEN}" == 0 ]; then
          echo "Set VLEN to 1024 to make Spike not error when VEXT is not used"
          VLEN=1024
        fi  ;;
    e) ELEN="${OPTARG}" ;;
    b) BENCHMARK="${OPTARG}" ;;
    t) TOOLCHAIN="${OPTARG}" ;;
    s) SIMULATOR="${OPTARG}" ;;
    * | h) echo "Add -x to enable portable mode"
           echo "Add -p to compile with rv32gcp"
           echo "Add -v to compile with rv32gcv"
           echo "Specify VLEN with -l {VLEN}"
           echo "Specify ELEN with -l {ELEN}"
           echo "Use -b {aww/vww/toy/ic} to select tvm benchmark to run"
           echo "Use -t {GCC/LLVM} to select toolchain.  PEXT is only supported with GCC"
           echo "Add -S to skip build step"
           echo "Add -s {Spike,ETISS,Native} to pick simulator"
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

echo "*** Checking if TFLITE has been setup ***"
if [ ! -d ./tflite-micro ]; then
    ./download_tflm.sh
fi

if [[ $SIMULATOR != "Native" ]]
then
  if [ "${TOOLCHAIN}" == "LLVM" ]; then
    echo "*** Checking for LLVM ***"
    cd $SCRIPT_DIR/../../Toolchain
      # Download LLVM 17 (which includes vector support)
    if [ -d llvm ]; then
      echo "Found LLVM compiler in the Toolchain directory."
    else
      echo "No LLVM compiler in the Toolchain directory found. Downloading one..."
        ./download_llvm.sh 18
    fi

  else
    echo "*** Checking for GCC Binaries ***"
    cd $SCRIPT_DIR/../../Toolchain

    if [ ! -d ./${RV_ARCH} ]; then

        echo "MISSING ${RV_ARCH} in Toolchains folder.  Downloading prebuilt GCC with script now."
        ./download_${RV_ARCH}.sh
    fi
  fi
fi

if [[ $SIMULATOR == "Spike" ]]  # TODO: move to sim dir
then
  echo "*** Checking for Spike and PK binaries ***"
  cd $SCRIPT_DIR/../../Sim/Spike/bin

  if [ ! -f spike ]; then
      echo "MISSING Spike in Sim/Spike/bin folder.  Downloading prebuilt Spike and PK with script now."
      #./download.sh
  fi
fi


if [ "${SKIP_BUILD}" == OFF ]; then

  echo "*** Deleting Current Build Directory ***"
  if [  -d $SCRIPT_DIR/../../build ]; then
    rm -rf $SCRIPT_DIR/../../build
  fi

  echo "*** Building ${BENCHMARK} ***"

  mkdir $SCRIPT_DIR/../../build
  cd $SCRIPT_DIR/../../build
  if [[ $SIMULATOR == "Native" ]]
  then
    cmake -DENABLE_INTG_TESTS=ON -DTOOLCHAIN=${TOOLCHAIN} -DDISABLE_TVM_INTG_TESTS=ON -DENABLE_UNIT_TESTS=OFF ..
  else
    cmake -DRISCV_GCC_PREFIX=$(pwd)/../Toolchain/${RV_ARCH}/ -DRISCV_LLVM_PREFIX=$(pwd)/../Toolchain/llvm/bin/ -DENABLE_INTG_TESTS=ON -DTOOLCHAIN=${TOOLCHAIN} -DUSE_PORTABLE=${USE_PORTABLE} -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} -DDISABLE_TVM_INTG_TESTS=ON -DENABLE_UNIT_TESTS=OFF -DVLEN=${VLEN} -DELEN=${ELEN} ..
  fi
  make all -j`nproc`

else
  echo "*** Skipping Build ***"
fi

echo "*** Running with $SIMULATOR ***"
cd $SCRIPT_DIR/../../build
ctest --verbose -R ${BENCHMARK}_tflm
