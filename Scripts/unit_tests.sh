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

# This script tests whether muRISCV-NN code passes the unit tests
# User selects desired configuration and simulator.

# Prevent silent failures
set -euo pipefail

source config.sh


################################################################################
#################### Interpret Command Line Arguments ##########################
################################################################################
USE_PORTABLE=OFF
USE_VEXT=OFF
USE_PEXT=OFF
USE_IMV=OFF
BUILD_FLAGS=""
SIM_FLAGS=""
SIM=""
VLEN=""
ELEN=""
BUILD_TYPE="Release"

while getopts 't:xvpis:b:l:e:h' flag; do
  case "${flag}" in
    t) TOOLCHAIN="${OPTARG}" ;;
    x) USE_PORTABLE=ON
       BUILD_FLAGS="${BUILD_FLAGS} -x" ;;
    v) USE_VEXT=ON
       BUILD_FLAGS="${BUILD_FLAGS} -v" ;;
    p) USE_PEXT=ON
       BUILD_FLAGS="${BUILD_FLAGS} -p" ;;
    i) USE_IMV=ON
       BUILD_FLAGS="${BUILD_FLAGS} -i" ;;
    s) SIM="${OPTARG}"
       SIM_FLAGS="-s ${SIM}" ;;
    b) BUILD_TYPE="${OPTARG}" ;;
    l) VLEN="-l ${OPTARG}";;
    e) ELEN="-e ${OPTARG}";;
    * | h) echo "Provide correct arguments.  Ex:  ./unit_tests.sh -t (GCC/LLVM/x86) -v -s (Spike/OVPsim) -l 1024"
       echo "-t : toolchain to use"
       echo "-x : enable portable mode"
       echo "-v : enable/disable VEXT"
       echo "-p : enable/disable PEXT"
       echo "-i : enable/disable IMV"
       echo "-b : build type"
       echo "-s : Select simulator.  If unused, executes natively"
       echo "-l : Vector Length"
       echo "-e : Element width"
       exit;;
  esac
done



################################################################################
#################### Check for Invalid Configuration ###########################
################################################################################
if [ $# -eq 0 ];then
    echo "No input arguments supplied.  Run ./unit_tests.sh -h to see required input"
    exit 1
elif [ "${SIM}" == "" ] && ([ "${USE_VEXT}" == "ON" ] || [ "${USE_PEXT}" == "ON" ]);then
    if [ "${USE_PORTABLE}" != "ON" ];
    then
        echo "Native execution does not support VEXT or PEXT.  Please select a simulator with the -s flag"
        exit 1
    fi
elif [ "${VLEN}" == "" ] && ([ "${USE_VEXT}" == "ON" ] || [ "${USE_IMV}" == "ON" ]); then
    echo "Please specify a vector length"
    exit 1
elif [ "${ELEN}" == "" ] && ([ "${USE_VEXT}" == "ON" ] || [ "${USE_IMV}" == "ON" ]); then
    echo "Please specify a vector element width"
    exit 1
fi


################################################################################
#################### Check for Dependencies for Sim ############################
################################################################################
if [ "${SIM}" == "OVPsim" ];then

    # Download OVPsim
    if [ -f ${SIM_BIN_PATH_OVP} ]; then
      echo "Found an OVPsim instance in the Sim directory."
    else
      echo "No OVPsim in the Sim directory found."
      exit 1
      # (
      #   cd ${SIM_BIN_DIR_OVP}
      #   ./download.sh
      # )
    fi

elif [ "${SIM}" == "Spike" ];then
    # Download Spike
    echo "SIM_BIN_PATH_SPIKE=${SIM_BIN_PATH_SPIKE}"
    if [ -f ${SIM_BIN_PATH_SPIKE} ]; then
      echo "Found an Spike instance in the Sim directory."
    else
      echo "No Spike in the Sim directory found."
      exit 1
      # (
      #   cd ${SIM_BIN_DIR_SPIKE}
      #   ./download.sh
      # )
      # Install Spike dependencies
      sudo apt-get install libboost-all-dev
      sudo apt-get install device-tree-compiler
    fi
fi
################################################################################
############# Build and Test on Desired Configuration  #########################
################################################################################

echo -t ${TOOLCHAIN} ${BUILD_FLAGS} ${BUILD_TYPE} ${SIM_FLAGS}


if ./build.sh -t ${TOOLCHAIN} ${BUILD_FLAGS} ${SIM_FLAGS} ${VLEN} ${ELEN} -b ${BUILD_TYPE};then
    make -j $(nproc) -C ${BUILD_DIR}
    (
      cd ${BUILD_DIR}
      ctest --verbose
    )
else
    echo "Build Error.  Check configuration with ./build.sh script"
fi

exit 0
