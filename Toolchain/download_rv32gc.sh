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

# Downloads the "full" version of the rv32gc GCC toolchain
# to be used as a standalone compiler!
# wget https://syncandshare.lrz.de/dl/fiN6bFDEbHgzj2TDCuowwFWS/rv32gc.tar.xz
# mkdir -p rv32gc
# tar -xvf rv32gc.tar.xz -C rv32gc
# rm rv32gc.tar.xz
./download_helper.sh rv32gc/ GCC default 2023.12.14 rv32gc_ilp32d
