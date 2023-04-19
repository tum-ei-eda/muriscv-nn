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

# Prevent silent failures
set -euo pipefail

# Path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Download TFLM sources."
if [ ! -d "tflite-micro" ]; then
  git clone git@github.com:tensorflow/tflite-micro.git
  cd tflite-micro
else
  cd tflite-micro
  git pull
fi

echo "Generate TFLM source tree."
python3 tensorflow/lite/micro/tools/project_generation/create_tflm_tree.py .. --makefile_options=OPTIMIZED_KERNEL_DIR=cmsis_nn

# Use this command to build the source tree without the CMSIS-NN wrapper (also disable USE_CMSIS_NN_WRAPPER in CMakeLists.txt!)
# python3 tensorflow/lite/micro/tools/project_generation/create_tflm_tree.py ..
