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

set -e

# Downloads the "lite" version of the rv32gcv GCC toolchain to be used in
# conjunction with LLVM. In order to reduce size it only contains headers
# and libraries, no binaries!
wget https://syncandshare.lrz.de/dl/fi3U4poNbe5DuUgqRsosK4/llvm16.tar.xz
mkdir -p llvm
tar -xvf llvm16.tar.xz -C llvm
rm llvm16.tar.xz
