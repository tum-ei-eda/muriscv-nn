#!/bin/bash
##
## Copyright (c) 2023 TUM Department of Electrical and Computer Engineering - Chair of Electronic Design Automation.
##
## This file is part of muRISCV-NN.
## See https://github.com/tum-ei-eda/muriscv-nn for further info.
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "Hey, you should source this script, not execute it!"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR=$SCRIPT_DIR/workspace
MURISCVNN_DIR=$SCRIPT_DIR/../..
TOOLCHAINS_DIR=$MURISCVNN_DIR/Toolchain
SIM_DIR=$MURISCVNN_DIR/Sim
VENV_DIR=$SCRIPT_DIR/venv

########################################
# Default config  for setup_mlonmcu.sh #
########################################

# MLonMCU
export MLONMCU_REF=91e0539be5ed37dac17e056d48e0d474126b4dc9
# MLONMCU_REF=068212b7a6d392f8d032ccc867d3b06b50356ca3
export MLIF_REF=2ab749d3747c04f3b01973ef955bda5be0964f0f

# TFLM
export TFLM_REF=f050eec7e32a0895f7658db21a4bdbd0975087a5
export ENABLE_TFLM=0

# TVM
export TVM_REF=76b9ce9b1f7d2b7e64b4b9c9d456a02b8a010473
export ENABLE_TVM=0
# TLCPACK_VERSION="0.10.0"
export PREBUILT_TVM=1

# Spike
export SPIKE_REF=0bc176b3fca43560b9e8586cdbc41cfde073e17a
export SPIKEPK_REF=7e9b671c0415dfd7b562ac934feb9380075d4aa2
export LOCAL_SPIKE=0
export ENABLE_SPIKE=0

# OVPSim
export LOCAL_OVPSIM=1
export ENABLE_OVPSIM=0

# ETISS
export ETISS_REF=4d2d26fb1fdb17e1da3a397c35d6f8877bf3ceab
export LOCAL_ETISS=0
export ENABLE_ETISS=0

# RISC-V GCC
LOCAL_GCC=1
ENABLE_DEFAULT=1
ENABLE_PEXT=1
ENABLE_VEXT=1

# LLVM
# Not supported

