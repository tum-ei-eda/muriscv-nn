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
# $1 - path to executable

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Add Verilator binary directory to PATH variable
export PATH=${SCRIPT_DIR}/verilator/install/bin:$PATH

LANES=4
VLEN=4096

mkdir -p ${SCRIPT_DIR}/work
make -C ${SCRIPT_DIR}/ara/hardware verilate -i ROOT_DIR=${SCRIPT_DIR}/ara/hardware veril_library=${SCRIPT_DIR}/work veril_path=${SCRIPT_DIR}/verilator/install/bin/ nr_lanes=${LANES} vlen=${VLEN} bender_defs="--define NR_LANES=${LANES} --define VLEN=${VLEN} --define RVV_ARIANE=1"

${SCRIPT_DIR}/work/Vara_tb_verilator -l "ram,$1"
