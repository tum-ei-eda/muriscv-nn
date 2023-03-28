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
IMV_FLAGS=""
SIM_FLAGS=""
VLEN=""

while getopts 't:vpib:s:l:h' flag; do
  case "${flag}" in
    t) TOOLCHAIN="${OPTARG}" ;;
    v) USE_VEXT=ON
       GCC_PREFIX=${TC_DIR}/rv32gcv ;;
    p) USE_PEXT=ON 
       GCC_PREFIX=${TC_DIR}/rv32gcp ;;
    i) USE_IMV=ON 
       GCC_PREFIX=${TC_DIR}/rv32imv ;;
    b) BUILD_TYPE="${OPTARG}" ;;
    s) SIM_FLAGS="-DSIMULATOR=${OPTARG}";;
    l) VLEN="-DVLEN=${OPTARG}";;
    * | h) echo "Provide correct arguments.  Ex:  ./build.sh -t (GCC/LLVM/x86) -v -i -b (Release/Debug)"
       echo "-t : toolchain to use"
       echo "-v : enable/disable VEXT"
       echo "-p : enable/disable PEXT"
       echo "-i : enable/disable IMV"
       echo "-b : build type" 
       echo "-s : simualtor target"
       echo "-l : Vector Length"
       exit 1;;
  esac
done

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

################################################################################
#################### Check for Dependencies for Build ##########################
################################################################################
if [ "${TOOLCHAIN}" == "LLVM" ];then
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
    
    if [ "${USE_IMV}" == "ON" ];then
        IMV_FLAGS="-DRISCV_ARCH=rv32imzve32x -DRISCV_ABI=ilp32"
    fi
    
elif [ "${TOOLCHAIN}" == "GCC" ];then
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
fi       
  

################################################################################
################## Build based on Desired Configuration ########################
################################################################################  
  
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
echo $1
echo ${TC_DIR}/$2
cmake -B ${BUILD_DIR} -S .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DTOOLCHAIN=${TOOLCHAIN} -DRISCV_GCC_PREFIX=${GCC_PREFIX} -DUSE_VEXT=${USE_VEXT} -DUSE_PEXT=${USE_PEXT} ${IMV_FLAGS} ${SIM_FLAGS} ${VLEN}
make -j $(nproc) -C ${BUILD_DIR}

exit 0
