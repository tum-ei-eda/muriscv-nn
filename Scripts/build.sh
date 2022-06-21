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

set -e
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
#################### Build scalar code rv32gc ##################################
################################################################################

# Configure and build with LLVM
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=LLVM -DRISCV_GCC_PREFIX=${TC_DIR_RV32GC} -DUSE_VEXT=OFF -DUSE_PEXT=OFF
make -j $(nproc) -C ${BUILD_DIR}

# Configure and build with GCC
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=GCC -DRISCV_GCC_PREFIX=${TC_DIR_RV32GC} -DUSE_VEXT=OFF -DUSE_PEXT=OFF
make -j $(nproc) -C ${BUILD_DIR}

# Configure and build natively
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=x86 -DRISCV_GCC_PREFIX=${TC_DIR_RV32GC} -DUSE_VEXT=OFF -DUSE_PEXT=OFF
make -j $(nproc) -C ${BUILD_DIR}

################################################################################
#################### Build V vector code rv32gcv ###############################
################################################################################

# Configure and build with LLVM
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=LLVM -DRISCV_GCC_PREFIX=${TC_DIR_RV32GCV} -DUSE_VEXT=ON -DUSE_PEXT=OFF
make -j $(nproc) -C ${BUILD_DIR}

# Configure and build with GCC
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=GCC -DRISCV_GCC_PREFIX=${TC_DIR_RV32GCV} -DUSE_VEXT=ON -DUSE_PEXT=OFF
make -j $(nproc) -C ${BUILD_DIR}

################################################################################
#################### Build P packed code rv32gcv ###############################
################################################################################

# Configure and build with GCC
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=GCC -DRISCV_GCC_PREFIX=${TC_DIR_RV32GCP} -DUSE_VEXT=OFF -DUSE_PEXT=ON
make -j $(nproc) -C ${BUILD_DIR}
