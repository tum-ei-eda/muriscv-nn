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
mode=$3  # i.e. default/vext/pext/corev/...
version=$4  # i.e. 2023.12.14
lib=$5
basename=${6:-riscv32-unknown-elf}
dist=${7:-$(lsb_release -d | cut -f2 | cut -d' ' -f1)}
release=${8:-$(lsb_release -r --short)}
ext=${9:-tar.xz}
archive=$lib.$ext

URL=https://syncandshare.lrz.de/dl/fiWBtDLWz17RBc1Yd4VDW7/$toolchain/$mode/$version/$dist/$release/$archive
echo "URL=$URL"
wget --progress=dot:giga $URL
mkdir -p $dest
tar -xvf $archive -C $dest
rm $archive
#check if gnu subdirectory is present
#if so, remove it
if [  -d ./${dest}/gnu ]; then
    cd ${dest}
    mv gnu/* .
    rm -r gnu
fi
