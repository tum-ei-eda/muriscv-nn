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

# Contains toolchain configurations and settings for using LLVM/Clang

# Path to your RISC-V GCC compiler (only used to get the headers and libraries, actual compiler is LLVM/Clang)
set(RISCV_GCC_PREFIX "/opt/riscv" CACHE PATH "Install location of GCC RISC-V toolchain.")
set(RISCV_GCC_BASENAME "riscv32-unknown-elf" CACHE STRING "Base name of the toolchain executables.")

set(RISCV_LLVM_PREFIX "/opt/llvm/bin" CACHE PATH "Install location of LLVM RISC-V toolchain.")

set(CMAKE_C_COMPILER ${RISCV_LLVM_PREFIX}/clang)
set(CMAKE_CXX_COMPILER ${RISCV_LLVM_PREFIX}/clang)
set(CMAKE_ASM_COMPILER ${RISCV_LLVM_PREFIX}/clang)
set(CMAKE_OBJCOPY ${RISCV_LLVM_PREFIX}/llvm-objcopy)
set(CMAKE_OBJDUMP ${RISCV_LLVM_PREFIX}/llvm-objdump)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --target=riscv32 -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --target=riscv32 -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}")

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --target=riscv32 -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -fuse-ld=lld -mcmodel=${RISCV_CMODEL}")
