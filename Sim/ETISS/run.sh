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

# Positional arguments:
# $1 - path to binary file
# Example call to invoke ETISS:
# ./run.sh my_binary.elf

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/etiss-master/build/install/bin/run_helper.sh" \
    "$PWD/$1" \
    "-i$SCRIPT_DIR/etiss-master/build/install/examples/bare_etiss_processor/custom_memsegs.ini"
