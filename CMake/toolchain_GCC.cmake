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

# Contains toolchain configurations and settings for using GCC

# Path to your RISC-V GCC compiler
set(RISCV_GCC_PREFIX "/opt/riscv" CACHE PATH "Install location of GCC RISC-V toolchain.")
set(RISCV_GCC_BASENAME "riscv32-unknown-elf" CACHE STRING "Base name of the toolchain executables.")
set(TC_PREFIX "${RISCV_GCC_PREFIX}/bin/${RISCV_GCC_BASENAME}-")

set(CMAKE_C_COMPILER ${TC_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${TC_PREFIX}g++)
set(CMAKE_ASM_COMPILER ${TC_PREFIX}gcc)
set(CMAKE_LINKER ${TC_PREFIX}ld)
set(CMAKE_OBJCOPY ${TC_PREFIX}objcopy)
set(CMAKE_OBJDUMP ${TC_PREFIX}objdump)
set(CMAKE_AR ${TC_PREFIX}ar)
set(CMAKE_RANLIB ${TC_PREFIX}ranlib)
set(CMAKE_STRIP ${TC_PREFIX}strip)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI} -mcmodel=${RISCV_CMODEL}")
