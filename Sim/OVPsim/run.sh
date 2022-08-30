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

# Positional arguments:
# $1 - path to binary file
# $2 - arch string, i.e. rv32gc or rv32gcv or rv32gcp
# $3 - VLEN, from 64 to 1024 (only applicable if arch string is rv32gcv)
# $4 - enable floating point and vector unit by default, either 0 or 1 (only applicable if arch string is rv32gcv)
# Example call to invoke OVPsim:
# ./run.sh my_binary.elf rv32gcv 256 0

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $2 == "rv32gcv" ]]; then
  $SCRIPT_DIR/bin/riscvOVPsimPlus \
    --program $1 \
    --variant RVB32I \
    --override riscvOVPsim/cpu/add_Extensions=MAFDCV \
    --override riscvOVPsim/cpu/unaligned=T \
    --override riscvOVPsim/cpu/vector_version=1.0 \
    --override riscvOVPsim/cpu/VLEN=$3 \
    --override riscvOVPsim/cpu/ELEN=32 \
    --override riscvOVPsim/cpu/mstatus_FS=$4 \
    --override riscvOVPsim/cpu/mstatus_VS=$4
  # --trace
  # --port 3333
  # --gdbconsole

elif [[ $2 == "rv32gcp" ]]; then
  $SCRIPT_DIR/bin/riscvOVPsimPlus \
    --program $1 \
    --variant RVB32I \
    --override riscvOVPsim/cpu/add_Extensions=MAFDCBP \
    --override riscvOVPsim/cpu/dsp_version=0.9.6 \
    --override riscvOVPsim/cpu/bitmanip_version=0.94 \
    --override riscvOVPsim/cpu/unaligned=T \
    --override riscvOVPsim/cpu/mstatus_FS=$4

elif [[ $2 == "rv32gc" ]]; then
  $SCRIPT_DIR/bin/riscvOVPsimPlus \
    --program $1 \
    --variant RVB32I \
    --override riscvOVPsim/cpu/add_Extensions=MAFDC \
    --override riscvOVPsim/cpu/unaligned=T \
    --override riscvOVPsim/cpu/mstatus_FS=$4

elif [[ $2 == "rv32imv" || $2 == "rv32imzve32x" ]]; then
  $SCRIPT_DIR/bin/riscvOVPsimPlus \
    --program $1 \
    --variant RVB32I \
    --override riscvOVPsim/cpu/add_Extensions=MV \
    --override riscvOVPsim/cpu/unaligned=T \
    --override riscvOVPsim/cpu/vector_version=1.0 \
    --override riscvOVPsim/cpu/VLEN=$3 \
    --override riscvOVPsim/cpu/ELEN=32 \
    --override riscvOVPsim/cpu/mstatus_VS=$4

elif [[ $2 == "rv32im" ]]; then
  $SCRIPT_DIR/bin/riscvOVPsimPlus \
    --program $1 \
    --variant RVB32I \
    --override riscvOVPsim/cpu/add_Extensions=MV \
    --override riscvOVPsim/cpu/unaligned=T

else
  echo "Unsupported arch string $2"
fi
