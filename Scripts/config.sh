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

# This script contains configurations to be used with other scripts

# Prevent silent failures
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BUILD_TYPE=Release
VLENS=(64 128 512) # Skipping some VLENS to save time (64 128 256 512 1024 2048)

BUILD_DIR=../build

TC_DIR=../Toolchain
TC_DIR_RV32GC=${TC_DIR}/rv32gc
TC_DIR_RV32GCV=${TC_DIR}/rv32gcv
TC_DIR_RV32GCP=${TC_DIR}/rv32gcp
TC_DIR_RV32IMV=${TC_DIR}/rv32im_zve32x

SIM_DIR=../Sim
SIM_BIN_DIR_OVP=${SIM_DIR}/OVPsim/bin
SIM_BIN_DIR_SPIKE=${SIM_DIR}/Spike/bin
SIM_BIN_PATH_OVP=${SIM_BIN_DIR_OVP}/riscvOVPsimPlus
SIM_BIN_PATH_SPIKE=${SIM_BIN_DIR_SPIKE}/spike
