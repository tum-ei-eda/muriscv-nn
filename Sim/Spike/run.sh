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
# Example call to invoke Spike:
# ./run.sh my_binary.elf rv32gcv 256

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $2 == "rv32gcv" || $2 == "rv32gcp" || $2 == "rv32gc" ]]; then
  $SCRIPT_DIR/bin/spike --isa=$2_zicntr_zihpm --varch=vlen:$3,elen:32 $SCRIPT_DIR/bin/pk_ilp32d $1
elif [[ $2 == "rv32imv" || $2 == "rv32im" ]]; then
  $SCRIPT_DIR/bin/spike --isa=$2_zicntr_zihpm --varch=vlen:$3,elen:32 $SCRIPT_DIR/bin/pk_ilp32 $1
elif [[ "rv32imzve32x" ]]; then
  $SCRIPT_DIR/bin/spike --isa="rv32imv_zicntr_zihpm" --varch=vlen:$3,elen:32 $SCRIPT_DIR/bin/pk_ilp32 $1
else
  echo "Unsupported arch string $2"
fi
