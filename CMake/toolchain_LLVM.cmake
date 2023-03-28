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

INCLUDE(LookupClang)

SET(CMAKE_C_COMPILER ${CLANG_EXECUTABLE})
SET(CMAKE_CXX_COMPILER ${CLANG++_EXECUTABLE})
SET(CMAKE_ASM_COMPILER ${CLANG_EXECUTABLE})
# set(CMAKE_C_LINKER lld-14) # TODO(fabianpedd): doesnt work, need to use -fuse-ld=lld-14 instead

# set(CMAKE_OBJCOPY llvm-objcopy-14)
# set(CMAKE_OBJDUMP llvm-objdump-14)

# Workarounds for unsupported march strings
STRING(REPLACE "_zicsr" "" RISCV_ARCH_FULL ${RISCV_ARCH_FULL})
STRING(REPLACE "_zifencei" "" RISCV_ARCH_FULL ${RISCV_ARCH_FULL})

SET(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} --target=riscv32 -march=${RISCV_ARCH_FULL} -mabi=${RISCV_ABI}"
)
SET(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}"
)

SET(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} --target=riscv32 -march=${RISCV_ARCH_FULL} -mabi=${RISCV_ABI}"
)
SET(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}"
)

SET(CMAKE_ASM_FLAGS
    "${CMAKE_ASM_FLAGS} --target=riscv32 -march=${RISCV_ARCH_FULL} -mabi=${RISCV_ABI}"
)
SET(CMAKE_ASM_FLAGS
    "${CMAKE_ASM_FLAGS} --gcc-toolchain=${RISCV_GCC_PREFIX} --sysroot=${RISCV_GCC_PREFIX}/${RISCV_GCC_BASENAME}"
)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=lld")
