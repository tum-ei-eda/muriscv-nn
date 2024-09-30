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

SKIP_INSTALL=OFF;
SPIKE_REF=master
PK_REF=master  # Working commit: 1a52fa44aba49307137ea2ad5263613da33a877b

while getopts 'sh-:' flag; do
  case "${flag}" in
    s) SKIP_INSTALL=ON ;;
    -)
        case "${OPTARG}" in
            spike_ref)
                val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                SPIKE_REF=${val}
                ;;
            spike_ref=*)
                val=${OPTARG#*=}
                SPIKE_REF=${val}
                ;;
            pk_ref)
                val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                PK_REF=${val}
                ;;
            pk_ref=*)
                val=${OPTARG#*=}
                PK_REF=${val}
                ;;
            *)
                if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                    echo "Unknown option --${OPTARG}. Use -h to see valid options." >&2
                    exit 1
                fi
                ;;
        esac;;
    h | *)
        echo "usage: $0 [-s] [--spike-ref[=]<value>] [--pk-ref[=]<value>]"
       echo "-s : Skip apt install step (non-sudo mode)"
       echo "--spike-ref : Branch/commit/tag of riscv-isa-sim repo"
       echo "--pk-ref : Branch/commit/tag of riscv-pk repo"
       exit 1
       ;;
 esac
done


#Install Dependencies

if [ "${SKIP_INSTALL}" == OFF ]; then
    echo "Downloading dependencies"
    sudo apt-get install libboost-all-dev
    sudo apt-get install device-tree-compiler
fi

export PATH_ORIG=$PATH

#check for rv32gcv and rv32imv
cd ../../Toolchain
if [ ! -d ./rv32gcv ]; then
    echo "MISSING rv32gcv in Toolchains folder.  Downloading prebuilt GCC with script now."
    ./download_rv32gcv.sh
fi
if [ ! -d ./rv32imv ]; then

    echo "MISSING rv32imv in Toolchains folder.  Downloading prebuilt GCC with script now."
    ./download_rv32imv.sh
fi
cd ../Sim/Spike

#Build Spike
echo "Building spike"
test -d riscv-isa-sim || git clone https://github.com/riscv-software-src/riscv-isa-sim.git
cd riscv-isa-sim
git checkout $SPIKE_REF
export RISCV=$PWD/../../../Toolchain/rv32gcv
export PATH=$PATH:$RISCV/bin
echo $PATH
mkdir -p build
cd build
../configure --prefix=$RISCV
make -j$(nproc)
sudo make install

#build PK for ilp32d
cd ../..
echo "Building pk_ilp32d"
test -d riscv-pk || git clone https://github.com/riscv-software-src/riscv-pk.git
cd riscv-pk
git checkout $PK_REF
export RISCV=$PWD/../../../Toolchain/rv32gcv
export PATH=$PATH:$RISCV/bin
echo $PATH
mkdir -p build
cd build
../configure --prefix=$RISCV --host=riscv32-unknown-elf --with-arch=rv32gcv_zicsr_zifencei --with-abi=ilp32d
make -j$(nproc)
sudo make install

#Copy spike and pk_ilp32d to bin folder
echo "Copying Spike and pk_ilp32d"
cd ../../bin
cp ../riscv-isa-sim/build/spike spike
cp ../riscv-pk/build/pk pk_ilp32d
cd ..

#Build PK for ilp32
echo "Building pk_ilp32"
cd riscv-pk
rm -r build
export RISCV=$PWD/../../../Toolchain/rv32imv
export PATH=$PATH_ORIG:$RISCV/bin
echo $PATH
mkdir -p build
cd build
../configure --prefix=$RISCV --host=riscv32-unknown-elf --with-arch=rv32imv --with-abi=ilp32
make -j $(nproc)
sudo make install

#copy ilp32 to bin folder
cd ../../bin
cp ../riscv-pk/build/pk pk_ilp32
