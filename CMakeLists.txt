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

cmake_minimum_required(VERSION 3.10)
message(STATUS "CMake Version ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}")

# Choose a simulator to run on.
set(SIMULATOR "Spike" CACHE STRING "Specify the simulator.")
set_property(CACHE SIMULATOR PROPERTY STRINGS OVPsim Spike ETISS Vicuna)
if("${SIMULATOR}" STREQUAL "Vicuna")
  set(SIM_VICUNA "ON")
endif()

# Choose which toolchain you want to use, either GCC or LLVM (or x86 for native build)
set(TOOLCHAIN "GCC" CACHE STRING "Specify which toolchain to use.")
set_property(CACHE TOOLCHAIN PROPERTY STRINGS LLVM GCC x86 NONE)

option(USE_PORTABLE "Use the Portable Kernels" OFF)
# RISC-V extensions for HW acceleration
option(USE_VEXT "Use the RISC-V V Vector Extension" OFF)
option(USE_PEXT "Use the RISC-V P Packed Extension" OFF)

# Set the desired architecture and application binary interface.
# For more info, see here https://www.sifive.com/blog/all-aboard-part-1-compiler-args
# Useful combinations are:
# - rv32gc / ilp32d -> scalar only
# - rv32gcv / ilp32d -> vector support
# - rv32gcp / ilp32d -> packed support
# - rv32imzve32x / ilp32 -> integer only and embedded vector support (GCC only supports rv32imv!)
if("${SIMULATOR}" STREQUAL "Vicuna") # Vicuna only supports a reduced set of extensions
  if(USE_VEXT)
    set(RISCV_ARCH "rv32im_zicsr_zifencei_zve32x" CACHE STRING "march argument to the compiler, using the vector extension")
  elseif(USE_PEXT)
    message(FATAL_ERROR "Vicuna does not support packed instructions.")
  else()
    set(RISCV_ARCH "rv32im" CACHE STRING "march argument to the compiler, using only scalar instructions")
  endif()
  set(RISCV_ABI "ilp32" CACHE STRING "mabi argument to the compiler")
  set(RISCV_CMODEL "medany" CACHE STRING "mcmodel argument to the compiler")
else() # All other (instruction level) simulator support the full RISC-V ISA
  if(USE_VEXT)
    set(RISCV_ARCH "rv32gcv" CACHE STRING "march argument to the compiler, using the vector extension")
  elseif(USE_PEXT)
    set(RISCV_ARCH "rv32gcp" CACHE STRING "march argument to the compiler, using the packed extension")
  else()
    set(RISCV_ARCH "rv32gc" CACHE STRING "march argument to the compiler, using only scalar instructions")
  endif()
  set(RISCV_ABI "ilp32d" CACHE STRING "mabi argument to the compiler")
  set(RISCV_CMODEL "medlow" CACHE STRING "mcmodel argument to the compiler")
endif()

# Tell CMake about our processor
set(CMAKE_SYSTEM_PROCESSOR ${RISCV_ARCH})
# The Generic system name is used for bare-metal targets (without OS) in CMake
set(CMAKE_SYSTEM_NAME Generic)

# Choose a vector length for the simulator to use.
# IMPORTANT: The code itself is completely vector length agnostic! It can run
# on any vector length and does not use this information during build. This is
# simply a convenient option to configure the unit tests.
# HINT: Because spike only supports VLEN >= 64 we do not allow for VLEN=32.
set(VLEN "1024" CACHE STRING "Specify the vector length. ONLY used to configure the simulator for tests.")
set(ELEN "64" CACHE STRING "Specify the max vector element width.")  # TODO: adjust compiler flags accordingly
set_property(CACHE VLEN PROPERTY STRINGS 32 64 128 256 512 1024)

# Enable tests by default
option(ENABLE_UNIT_TESTS "Enable unit tests" ON)
option(ENABLE_INTG_TESTS "Enable integration tests" OFF)

# Configure CMake
if(NOT ${TOOLCHAIN} STREQUAL "NONE")
  set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/CMake/toolchain_${TOOLCHAIN}.cmake")
endif()
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

# ETISS is a special snowflake
if("${SIMULATOR}" STREQUAL "ETISS")
  file(GLOB_RECURSE PUPLINO_TARGET_CMAKE "${CMAKE_CURRENT_SOURCE_DIR}/Sim/ETISS/PulpinoTarget.cmake")
  include(${PUPLINO_TARGET_CMAKE})
endif()

project(muriscvnn LANGUAGES C CXX ASM DESCRIPTION "muRISCV-NN, a CMSIS-NN port for RISC-V.")

# See whats going in CMake while getting the build process up and running
set(CMAKE_VERBOSE_MAKEFILE ON)

# Using C and C++ 11
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

if(USE_VEXT AND USE_PEXT)
  message(FATAL_ERROR "V/P-Extension can not be enabled simultaneously.")
elseif(USE_VEXT)
  if(USE_PORTABLE)
    add_definitions(-DUSE_PORTABLE_VEXT)
  else()
    add_definitions(-DUSE_VEXT)
  endif()
elseif(USE_PEXT)
  if(USE_PORTABLE)
    add_definitions(-DUSE_PORTABLE_PEXT)
  else()
    add_definitions(-DUSE_PEXT)
  endif()
endif()

# Let preprocessor know which simulator we will be running on
string(TOUPPER "${SIMULATOR}" SIMULATOR_UP)
add_definitions(-DSIM_${SIMULATOR_UP})

# Set build mode, Debug by default
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Set some compiler options for easier debug or faster builds
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -g -ggdb")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -ggdb")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Os")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Os")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wshadow -Wno-format -std=c11") # TODO(fabianpedd): at a later point add -pedantic and -Werror
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=c++11")

# Lets stick to standard .elf file ending for now
set(CMAKE_EXECUTABLE_SUFFIX_C .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)

add_subdirectory(Source)

add_subdirectory(Sim)

if(${ENABLE_UNIT_TESTS} OR ${ENABLE_INTG_TESTS})
  enable_testing()
endif()

if(${ENABLE_UNIT_TESTS})
  add_subdirectory(Tests)
endif()

if(${ENABLE_INTG_TESTS})
  add_subdirectory(Integration)
endif()
