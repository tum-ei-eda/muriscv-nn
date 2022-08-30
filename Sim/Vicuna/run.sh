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
# $1 - path to textfile containing the path to the binary image

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Add Verilator binary directory to PATH variable
export PATH=${SCRIPT_DIR}/verilator/install/bin:$PATH

# Invoke Verilator Makefile with path to binary image path textfile
make -f ${SCRIPT_DIR}/vicuna/sim/Makefile PROG_PATHS=$1
