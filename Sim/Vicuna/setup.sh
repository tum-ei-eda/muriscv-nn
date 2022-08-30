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

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# TODO(fabianpedd): Add these to the script (taken from here https://vicuna.readthedocs.io/en/latest/01_user/prerequisites.html)
# sudo apt-get install srecord llvm-14 clang-14
# sudo apt-get install git perl python3 g++ flex bison ccache libfl2 libfl-dev zlib1g zlib1g-dev

echo "Download and setup Vicuna."
if [ ! -d "vicuna" ]; then
  git clone git@github.com:vproc/vicuna.git
  cd vicuna
  git submodule update --init --recursive
  cd -
fi

echo "Download and setup Verilator."
if [ ! -d "verilator" ]; then
  git clone https://github.com/verilator/verilator
  cd verilator
  git checkout tags/v4.210
  autoconf
  ./configure --prefix ${SCRIPT_DIR}/verilator/install
  make all
  make install
fi
