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
#
# This script tests whether muRISCV-NN builds in all configurations
# Provide desired build configuration as command line arguments
#
# Prevent silent failures
set -euo pipefail

source config.sh

################################################################################
#################### Interpret Command Line Arguments ##########################
################################################################################
USE_VEXT=OFF
USE_PEXT=OFF
USE_IMV=OFF
GCC_PREFIX=${TC_DIR}/rv32gc
LLVM_PREFIX=${TC_DIR}/llvm/bin/
IMV_FLAGS=""
SIM_FLAGS=""
VLEN=""
ELEN=""
INTG_TESTS=OFF

while getopts 't:vpiab:s:l:e:h' flag; do
  case "${flag}" in
    v) USE_VEXT=ON
       GCC_PREFIX=${TC_DIR}/rv32gcv ;;
    p) USE_PEXT=ON
       GCC_PREFIX=${TC_DIR}/rv32gcp ;;
    i) USE_IMV=ON
       GCC_PREFIX=${TC_DIR}/rv32imv ;;
    t) TOOLCHAIN="${OPTARG}" ;;
    b) BUILD_TYPE="${OPTARG}" ;;
    s) SIM_FLAGS="-DSIMULATOR=${OPTARG}";;
    l) VLEN="-DVLEN=${OPTARG}";;
    e) ELEN="-DELEN=${OPTARG}";;
    a) INTG_TESTS=ON ;;
    * | h) echo "Provide correct arguments.  Ex:  ./build.sh -t (GCC/LLVM/x86/K230) -v -i -b (Release/Debug)"
       echo "-t : toolchain to use"
       echo "-v : enable/disable VEXT"
       echo "-p : enable/disable PEXT"
       echo "-i : enable/disable IMV"
       echo "-b : build type"
       echo "-s : simualtor target"
       echo "-l : Vector Length"
       echo "-e : Element Width"
       echo "-a : enable/disable integration tests"
       exit 1;;
  esac
done

# For K230 build, set toolchain for first build of the muricvnn library
if [ "${TOOLCHAIN}" == "K230" ]; then
  if [ "${USE_VEXT}" == "ON" ]; then
    GCC_PREFIX=${TC_DIR}/rv64gcv_lp64d_linux_musl_medany
  else
    GCC_PREFIX=${TC_DIR}/rv64gc_lp64d_linux_musl_medany
  fi
fi

################################################################################
#################### Check for Invalid Configuration ###########################
################################################################################
if [ $# -eq 0 ];then
    echo "No input arguments supplied.  Run ./build.sh -h to see required input"
    exit 1
elif [ "${USE_VEXT}" == "ON" ] && [ "${USE_PEXT}" == "ON" ];then
    echo "MURISCV-NN currently does not support both VEXT and PEXT at the same time.  Please disable one of these"
    exit 1
elif [ "${USE_IMV}" == "ON" ] && [ "${USE_PEXT}" == "ON" ];then
    echo "Using rv32imv only supports VEXT.  Please disable PEXT"
    exit 1
elif [ "${TOOLCHAIN}" == "x86" ] && ([ "${USE_PEXT}" == "ON" ] || [ "${USE_VEXT}" == "ON" ] || [ "${USE_IMV}" == "ON" ]);then
    echo "Using x86 does not support VEXT or PEXT.  Please disable these."
    exit 1
elif [ "${TOOLCHAIN}" == "LLVM" ] && [ "${USE_PEXT}" == "ON" ];then
    echo "Using LLVM does not support PEXT.  Please disable it."
    exit 1
fi
# TODO: No checks for K230 HW build

################################################################################
#################### Check for Dependencies for Build ##########################
################################################################################
if [ "${TOOLCHAIN}" == "LLVM" ];then
     # Download LLVM 18 (which includes vector support)
    if [ -d ${TC_DIR}/llvm ]; then
      echo "Found LLVM compiler in the Toolchain directory."
    else
      echo "No LLVM compiler in the Toolchain directory found. Downloading one..."
        cd ${TC_DIR}
        ./download_llvm.sh 18
    fi
fi

#Need to check for GCC for either compiler or newlib headers for LLVM
if [ "${USE_VEXT}" == "ON" ] && [ "${USE_IMV}" == "OFF" ] ;then

    if [ -d ${TC_DIR_RV32GCV} ]; then
      echo "Found rv32gcv GCC compiler in the Toolchain directory."
    else
      echo "No rv32gcv GCC compiler in the Toolchain directory found. Downloading one..."
      (
        cd ${TC_DIR}
        ./download_rv32gcv.sh
      )
    fi

  elif [ "${USE_PEXT}" == "ON" ];then
    if [ -d ${TC_DIR_RV32GCP} ]; then
      echo "Found rv32gcp GCC compiler in the Toolchain directory."
    else
      echo "No rv32gcp GCC compiler in the Toolchain directory found. Downloading one..."
      (
        cd ${TC_DIR}
        ./download_rv32gcp.sh
      )
    fi
elif [ "${USE_IMV}" == "ON" ];then
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
    IMV_FLAGS="-DRISCV_ARCH=rv32imv -DRISCV_ABI=ilp32"

  else
    if [ -d ${TC_DIR_RV32GC} ]; then
      echo "Found rv32gc GCC compiler in the Toolchain directory."
    else
      echo "No rv32gc GCC compiler in the Toolchain directory found. Downloading one..."
      (
        cd ${TC_DIR}
        ./download_rv32gc.sh
      )
    fi
  fi
# TODO: No checks for K230 HW build



################################################################################
################## Build based on Desired Configuration ########################
################################################################################

if [ "${TOOLCHAIN}" == "K230" ]; then
  # Build directories for different build configurations
  if [ "${USE_VEXT}" == "ON" ]; then
    BUILD_DIR_K230=${BUILD_DIR}_k230_VEXT
    BUILD_DIR=${BUILD_DIR}_muriscvnn_VEXT
  else
    BUILD_DIR_K230=${BUILD_DIR}_k230_NOVEXT
    BUILD_DIR=${BUILD_DIR}_muriscvnn_NOVEXT
  fi

  # Build libmuriscvnn.a (with newer GCC compiler)
  rm -rf ${BUILD_DIR}
  mkdir -p ${BUILD_DIR}
  echo $1
  echo ${TC_DIR}/$2
  cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=${TOOLCHAIN} -DRISCV_GCC_PREFIX=${GCC_PREFIX}/ -DRISCV_LLVM_PREFIX=${LLVM_PREFIX}  -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} -DENABLE_LIB_BUILD=ON ${IMV_FLAGS} ${SIM_FLAGS} ${VLEN} ${ELEN}
  make muriscvnn -j $(nproc) -C ${BUILD_DIR}

  # Build unit / integration tests linking libmuriscvnn.a (with vendor compiler)
  # Change Toolchange
  GCC_PREFIX=${TC_DIR}/riscv64-linux-musleabi_for_x86_64-pc-linux-gnu

  # Then build
  rm -rf ${BUILD_DIR_K230}
  mkdir -p ${BUILD_DIR_K230}
  echo $1
  echo ${TC_DIR}/$2
  cmake -B ${BUILD_DIR_K230} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=${TOOLCHAIN} -DRISCV_GCC_PREFIX=${GCC_PREFIX}/ -DRISCV_LLVM_PREFIX=${LLVM_PREFIX}  -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} -DENABLE_LIB_BUILD=OFF -DENABLE_INTG_TESTS=${INTG_TESTS} -DDISABLE_TVM_INTG_TESTS=ON ${IMV_FLAGS} ${SIM_FLAGS} ${VLEN} ${ELEN}
  make -j $(nproc) -C ${BUILD_DIR_K230}
else
  # If not K230, build everything with one toolchain
  rm -rf ${BUILD_DIR}
  mkdir -p ${BUILD_DIR}
  echo $1
  echo ${TC_DIR}/$2
  cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=${TOOLCHAIN} -DRISCV_GCC_PREFIX=${GCC_PREFIX}/ -DRISCV_LLVM_PREFIX=${LLVM_PREFIX}  -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} ${IMV_FLAGS} ${SIM_FLAGS} ${VLEN} ${ELEN}
  make -j $(nproc) -C ${BUILD_DIR}
fi

exit 0
