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

# This script tests whether muRISCV-NN builds in all configurations

# Prevent silent failures
set -euo pipefail

source config.sh

################################################################################
############## Download or install required toolchains #########################
################################################################################

# Install LLVM 14 (which includes vector support)
if clang-14 --version &>/dev/null; then
  echo "LLVM 14 appears to be installed."
else
  echo "No LLVM 14 installation found. Installing LLVM 14..."
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 14
  rm llvm.sh
fi

# Download rv32gc GCC
if [ -d ${TC_DIR_RV32GC} ]; then
  echo "Found rv32gc GCC compiler in the Toolchain directory."
else
  echo "No rv32gc GCC compiler in the Toolchain directory found. Downloading one..."
  (
    cd ${TC_DIR}
    ./download_rv32gc.sh
  )
fi

# Download rv32gcv GCC
if [ -d ${TC_DIR_RV32GCV} ]; then
  echo "Found rv32gcv GCC compiler in the Toolchain directory."
else
  echo "No rv32gcv GCC compiler in the Toolchain directory found. Downloading one..."
  (
    cd ${TC_DIR}
    ./download_rv32gcv.sh
  )
fi

# Download rv32imv GCC
if [ -d ${TC_DIR_RV32IMV} ]; then
  echo "Found rv32imv GCC compiler in the Toolchain directory."
else
  echo "No rv32imv GCC compiler in the Toolchain directory found. Downloading one..."
  (
    cd ${TC_DIR}
    ./download_rv32imv.sh
  )
fi

# Download rv32gcp GCC
if [ -d ${TC_DIR_RV32GCP} ]; then
  echo "Found rv32gcp GCC compiler in the Toolchain directory."
else
  echo "No rv32gcp GCC compiler in the Toolchain directory found. Downloading one..."
  (
    cd ${TC_DIR}
    ./download_rv32gcp.sh
  )
fi

################################################################################
#################### Build code based on user inputs ###########################
################################################################################

if [ $# -eq 0 ];then
    echo "Provide arguments.  Ex:  ./build_one.sh (GCC/LLVM) (rv32gc/rv32gcv/rv32gcp)"
else
    if [ "$2" == "rv32gc" ];then
        USE_VEXT=OFF
        USE_PEXT=OFF
    elif [ "$2" == "rv32gcv" ];then
        USE_VEXT=ON
        USE_PEXT=OFF
    elif [ "$2" == "rv32gcp" ];then
        USE_VEXT=OFF
        USE_PEXT=ON
    fi
    rm -rf ${BUILD_DIR}
    mkdir ${BUILD_DIR}
    echo $1
    echo ${TC_DIR}/$2
    cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=$1 -DRISCV_GCC_PREFIX=${TC_DIR}/$2 -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT}
    make -j $(nproc) -C ${BUILD_DIR}
  
fi
  

#
