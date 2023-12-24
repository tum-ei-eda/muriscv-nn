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

# Downloads the "full" version of the rv32gcp GCC toolchain
# to be used as a standalone compiler!
# wget https://syncandshare.lrz.de/dl/fiEWVnVB583VkX9FCNVPyZ/rv32gcp.tar.xz
# wget https://syncandshare.lrz.de/dl/fiNvP4mzVQ8uDvgT9Yf2bqNk/rv32gcp.tar.xz
# mkdir -p rv32gcp
# tar -xvf rv32gcp.tar.xz -C rv32gcp
# rm rv32gcp.tar.xz
./download_helper.sh rv32gcp/ GCC pext 2022.04.28 rv32gcp_ilp32d
