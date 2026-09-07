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
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of integration tests to run
read -r -a TESTS <<< "${TVM_TESTS:-aww ic toy vww}"

# List of build types
read -r -a BUILDS <<< "${TVM_BUILDS:-mlf mlf_vext mlf_pext}"

echo "Download and install TVM sources."
python3 -m venv .venv
source .venv/bin/activate
TVM_VERSION=${TVM_VERSION:-"0.16.0"}
# Prefer the local development fork when it is available. Set TVM_SOURCE_DIR
# explicitly to select a different source checkout.
TVM_SOURCE_DIR=${TVM_SOURCE_DIR:-"$PWD/tvm_fork"}
if [[ -d "$TVM_SOURCE_DIR/python/tvm" ]]; then
  export PYTHONPATH="$TVM_SOURCE_DIR/python"
  export TVM_LIBRARY_PATH="$TVM_SOURCE_DIR/build"
  python -m pip install -r requirements.txt
  python -c 'import tvm; print("Using TVM:", tvm.__file__)'
elif [[ "$TVM_VERSION" == "stable" ]]
then
  echo "no stable release available for TVM"
  exit 1
elif [[ "$TVM_VERSION" == "nightly" ]]
then
  echo "no nightly release available for TVM"
  exit 1
elif [[ "$TVM_VERSION" != "" ]]
then
  python -m pip install "tvm==$TVM_VERSION" -r requirements.txt \
    --pre -f https://philippvk.github.io/tlc-pack.github.io/wheels
else  # same as stable
  echo "no version specified for TVM"
  exit 1
fi
python -m pip check

# Extract the numeric version in case the output contains additional text.
INSTALLED_TVMC_VERSION="$(
  python -m tvm.driver.tvmc --version |
    grep -oE '[0-9]+\.[0-9]+\.[0-9]+' |
    head -n 1
)"

if [[ -z "$INSTALLED_TVMC_VERSION" ]]; then
  echo "Unable to determine the installed TVMC version."
  exit 1
fi

echo "Installed TVMC version: $INSTALLED_TVMC_VERSION"

version_at_least() {
  local installed="$1"
  local required="$2"

  [[ "$(printf '%s\n' "$required" "$installed" |
        sort -V |
        head -n 1)" == "$required" ]]
}

if version_at_least "$INSTALLED_TVMC_VERSION" "0.18.0"; then
  echo "TVM vesion >= 0.18.0"
  TVMC_ALIGNMENT_ARGS=( --executor-aot-constant-byte-alignment 4 --executor-aot-workspace-byte-alignment 4 )
else
  echo "TVM vesion < 0.18.0"
  TVMC_ALIGNMENT_ARGS=( --target-c-constants-byte-alignment 4 --target-c-workspace-byte-alignment 4 )
fi

echo "Generate TVM kernel from models."
for test in "${TESTS[@]}"; do
  for build in "${BUILDS[@]}"; do

    TVMC_TARGET_ARGS="--target cmsis-nn,c"
    if [[ "${TVM_DEBUG_LAST_ERROR:-1}" == "1" ]]; then
      TVMC_TARGET_ARGS="${TVMC_TARGET_ARGS} --target-cmsis-nn-debug_last_error 1"
    fi

    if [[ ${build} == "mlf_vext" ]]; then
      TVMC_TARGET_ARGS="${TVMC_TARGET_ARGS} --target-cmsis-nn-mcpu cortex-m55"
    elif [[ ${build} == "mlf_pext" ]]; then
      TVMC_TARGET_ARGS="${TVMC_TARGET_ARGS} --target-cmsis-nn-mcpu cortex-m33"
    fi

    python -m tvm.driver.tvmc compile "${test}/${test}.tflite" \
      --verbose \
      --runtime crt \
      --executor aot \
      --pass-config "tir.disable_vectorize=1" \
      --pass-config "tir.usmp.enable=1" \
      --pass-config "tir.usmp.algorithm=hill_climb" \
      --opt-level 3 \
      --output-format mlf \
      --runtime-crt-system-lib 0 \
      "${TVMC_ALIGNMENT_ARGS[@]}" \
      --executor aot \
      --executor-aot-unpacked-api 1 \
      --executor-aot-interface-api c \
      ${TVMC_TARGET_ARGS} \
      --output "${test}/${test}.tar"

    mkdir -p "${test}/${build}"
    tar xf "${test}/${test}.tar" -C "${test}/${build}"
    rm "${test}/${test}.tar"
  done
done
