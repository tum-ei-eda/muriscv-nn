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

if [ "$#" -lt 5 ]; then
    echo "Illegal number of parameters!"
    echo "Usage: ./download_helper.sh DEST {GCC|LLVM} {default|vext|pext} {2023.12.14|...} {rv32gc_ilp32d|...} [DIST [RELEASE]]"
    exit 1
fi


dest=$1  # Where to unpack the files
toolchain=$2  # i.e. GCC/LLVM
toolchain_lower=$(echo $toolchain | tr "[:upper:]" "[:lower:]")
mode=$3  # i.e. default/vext/pext/corev/...
version=$4  # i.e. 2023.12.14
lib=$5
basename=${6:-riscv32-unknown-elf}
dist_lower=${7:-$(lsb_release -d | cut -f2 | cut -d' ' -f1 | tr "[:upper:]" "[:lower:]")}
release=${8:-$(lsb_release -r --short)}
ext=${9:-tar.xz}
cpu_arch=$(uname -p)

if [[ "$toolchain_lower" == "llvm" ]]
then
    # TODO: label?
    archive=clang+llvm-$version-$cpu_arch-linux-gnu-$dist_lower-$release.$ext
elif [[ "$toolchain_lower" == "gcc" || "$toolchain_lower" == "gnu" ]]
then
    # TODO: cpu_arch & version
    archive=$basename-$dist_lower-$release-$lib.$ext
    toolchain_lower=gnu
else
    echo "Unsupported toolchain: $toolchain_lower"
    exit 1
fi
URL=https://github.com/PhilippvK/riscv-tools/releases/download/${toolchain_lower}_${version}/$archive
echo "URL=$URL"
wget --progress=dot:giga $URL
mkdir -p $dest
tar -xvf $archive -C $dest
rm $archive
