#!/usr/bin/env bash
#
# Copyright (C) 2026 Chair of Electronic Design Automation, TUM.
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Smoke test for integrating muRISCV-NN as a CMake subproject.
#
# The test configures a small native x86 consumer project which:
#
#   1. Adds muRISCV-NN with add_subdirectory().
#   2. Includes a public muRISCV-NN header.
#   3. Links against the muriscvnn target.
#   4. Executes a small runtime test.
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Reuse the repository's default build type.
source "${SCRIPT_DIR}/config.sh"

CMAKE="${CMAKE:-cmake}"
CTEST="${CTEST:-ctest}"

SMOKE_SOURCE_DIR="${SMOKE_SOURCE_DIR:-${REPO_DIR}/Tests/Subproject}"
SMOKE_BUILD_DIR="${SMOKE_BUILD_DIR:-${REPO_DIR}/build/subproject-smoke}"

################################################################################
############################ Check dependencies ################################
################################################################################

if ! command -v "${CMAKE}" >/dev/null 2>&1; then
  echo "error: CMake executable not found: ${CMAKE}" >&2
  exit 2
fi

if ! command -v "${CTEST}" >/dev/null 2>&1; then
  echo "error: CTest executable not found: ${CTEST}" >&2
  exit 2
fi

if [[ ! -f "${SMOKE_SOURCE_DIR}/CMakeLists.txt" ]]; then
  echo "error: smoke-test project not found:" >&2
  echo "       ${SMOKE_SOURCE_DIR}/CMakeLists.txt" >&2
  exit 2
fi

if [[ ! -f "${SMOKE_SOURCE_DIR}/smoke.c" ]]; then
  echo "error: smoke-test source not found:" >&2
  echo "       ${SMOKE_SOURCE_DIR}/smoke.c" >&2
  exit 2
fi

################################################################################
############################ Configure and build ###############################
################################################################################

echo "Configuring muRISCV-NN CMake subproject smoke test"
echo "  Source:     ${SMOKE_SOURCE_DIR}"
echo "  Build:      ${SMOKE_BUILD_DIR}"
echo "  muRISCV-NN: ${REPO_DIR}"
echo "  Build type: ${BUILD_TYPE}"

rm -rf "${SMOKE_BUILD_DIR}"

"${CMAKE}" \
  -S "${SMOKE_SOURCE_DIR}" \
  -B "${SMOKE_BUILD_DIR}" \
  -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" \
  -DMURISCV_NN_SOURCE_DIR="${REPO_DIR}"

echo "Building muRISCV-NN CMake subproject smoke test"

"${CMAKE}" \
  --build "${SMOKE_BUILD_DIR}" \
  --parallel "$(nproc)"

################################################################################
################################ Run the test ##################################
################################################################################

echo "Running muRISCV-NN CMake subproject smoke test"

"${CTEST}" \
  --test-dir "${SMOKE_BUILD_DIR}" \
  --output-on-failure

echo "muRISCV-NN CMake subproject smoke test passed."
