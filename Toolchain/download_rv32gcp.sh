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

set -e

# Downloads the "full" version of the rv32gcp GCC toolchain
# to be used as a standalone compiler!
wget https://syncandshare.lrz.de/dl/fiNvP4mzVQ8uDvgT9Yf2bqNk/rv32gcp.tar.xz
mkdir -p rv32gcp
tar -xvf rv32gcp.tar.xz -C rv32gcp
rm rv32gcp.tar.xz
