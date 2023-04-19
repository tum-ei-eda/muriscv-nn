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

# List of integration tests to run
TESTS=(aww ic toy vww)

# List of build types
BUILDS=(mlf mlf_vext mlf_pext)

echo "Download and install TVM sources."
python3.8 -m venv .venv
source .venv/bin/activate
pip install tlcpack-nightly -f https://tlcpack.ai/wheels
pip install -r requirements.txt
pip install typing-extensions

echo "Generate TVM kernel from models."
for test in "${TESTS[@]}"; do
  for build in "${BUILDS[@]}"; do

    TVMC_TARGET_ARGS="--target cmsis-nn,c"

    if [[ ${build} == "mlf_vext" ]]; then
      TVMC_TARGET_ARGS="${TVMC_TARGET_ARGS} --target-cmsis-nn-mcpu cortex-m55"
    elif [[ ${build} == "mlf_pext" ]]; then
      TVMC_TARGET_ARGS="${TVMC_TARGET_ARGS} --target-cmsis-nn-mcpu cortex-m33"
    fi

    tvmc compile ${test}/${test}.tflite \
      --verbose \
      --runtime crt \
      --executor aot \
      --pass-config "tir.disable_vectorize=1" \
      --pass-config "tir.usmp.enable=1" \
      --pass-config "tir.usmp.algorithm=hill_climb" \
      --opt-level 3 \
      --output-format mlf \
      --runtime-crt-system-lib 0 \
      --target-c-constants-byte-alignment 4 \
      --target-c-workspace-byte-alignment 4 \
      --executor aot \
      --executor-aot-unpacked-api 1 \
      --executor-aot-interface-api c \
      ${TVMC_TARGET_ARGS} \
      --output ${test}/${test}.tar

    mkdir -p ${test}/${build}
    tar xf ${test}/${test}.tar -C ${test}/${build}
    rm ${test}/${test}.tar
  done
done
