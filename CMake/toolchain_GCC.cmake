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

# The Generic system name is used for bare-metal targets (without OS) in CMake
set(CMAKE_SYSTEM_NAME Generic)

# Fully featured RISC-V core with vector extension
set(CMAKE_SYSTEM_PROCESSOR rv32mafdcv)

# Lets stick to standard .elf file ending for now
set(CMAKE_EXECUTABLE_SUFFIX_C .elf)

# Path to your RISC-V GCC compiler supporting the vector extension
set(RISCV_GCC_PREFIX "/opt/riscv" CACHE PATH "Install location of GCC RISC-V toolchain.")
set(RISCV_GCC_BASENAME "riscv32-unknown-elf" CACHE STRING "Base name of the toolchain executables.")
set(TC_PREFIX "${RISCV_GCC_PREFIX}/bin/${RISCV_GCC_BASENAME}-")

# Set the desired architecture and application binary interface
# For more info on these, see here https://www.sifive.com/blog/all-aboard-part-1-compiler-args
if(USE_VEXT)
  set(RISCV_ARCH "rv32gcv" CACHE STRING "march argument to the compiler, using the vector extension")
elseif(USE_PEXT)
  set(RISCV_ARCH "rv32gcp" CACHE STRING "march argument to the compiler, using the packed extension")
else()
  set(RISCV_ARCH "rv32gc" CACHE STRING "march argument to the compiler, using only scalar instructions")
endif()

set(RISCV_ABI "ilp32d" CACHE STRING "mabi argument to the compiler")

set(CMAKE_C_COMPILER ${TC_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${TC_PREFIX}g++)
set(CMAKE_ASM_COMPILER ${TC_PREFIX}gcc)
set(CMAKE_LINKER ${TC_PREFIX}ld)
set(CMAKE_OBJCOPY ${TC_PREFIX}objcopy)
set(CMAKE_OBJDUMP ${TC_PREFIX}objdump)
set(CMAKE_AR ${TC_PREFIX}ar)
set(CMAKE_RANLIB ${TC_PREFIX}ranlib)
set(CMAKE_STRIP ${TC_PREFIX}strip)

add_definitions(-march=${RISCV_ARCH})
add_definitions(-mabi=${RISCV_ABI})

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=${RISCV_ARCH} -mabi=${RISCV_ABI}")
