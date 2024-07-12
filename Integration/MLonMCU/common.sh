#!/bin/bash

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "Hey, you should source this script, not execute it!"
    exit 1
fi

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export WORKSPACE_DIR=$SCRIPT_DIR/workspace
export MURISCVNN_DIR=$SCRIPT_DIR/../..
export TOOLCHAINS_DIR=$MURISCVNN_DIR/Toolchain
export SIM_DIR=$MURISCVNN_DIR/Sim
export VENV_DIR=$SCRIPT_DIR/venv

########################################
# Default config  for setup_mlonmcu.sh #
########################################

# MLonMCU
# export MLONMCU_REF=3ec39b1881535d7a0727b5afd6b78d816b556b73
export MLONMCU_REF=main
# export MLIF_REF=c7b0e7364c232666ebd5a17476181e3ff9a71d70
export MLIF_REF=main

# TFLM
# export TFLM_REF=47f77ab6876f66a2d5e4b7f0266e374b4260181e
export TFLM_REF=main
export ENABLE_TFLM=0

# TVM
# export TVM_REF=3df798d422c559132cf551b358d6259d96ee41b4
export TVM_REF=main
export ENABLE_TVM=0
export PREBUILT_TVM=1
export PREBUILT_TVM_VERSION="0.12.0"

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
export LOCAL_GCC=1
export LOCAL_LLVM=1
export ENABLE_DEFAULT=1
export ENABLE_PEXT=0
export ENABLE_VEXT=1
export ENABLE_GCC=1
export ENABLE_LLVM=1

# LLVM
# Not supported
