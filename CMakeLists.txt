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
message("CMake Version ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}")

# Choose a simulator to run the tests on: OVPsim, Spike, ETISS.
set(SIMULATOR "Spike" CACHE STRING "Specify the simulator.")
set_property(CACHE SIMULATOR PROPERTY STRINGS OVPsim Spike ETISS)

# Choose which toolchain you want to use, either GCC or LLVM (or x86 for native build)
set(TOOLCHAIN "GCC" CACHE STRING "Specify which toolchain to use.")
set_property(CACHE TOOLCHAIN PROPERTY STRINGS LLVM GCC x86 NONE)

# RISC-V extensions for HW acceleration
option(USE_VEXT "Use the RISC-V V-Extension" OFF)
option(USE_PEXT "Use the RISC-V P-Extension" OFF)

# Choose a vector length for the simulator to use.
# IMPORTANT: The code itself is completely vector length agnostic! It can run
# on any vector length and does not use this information during build. This is
# simply a convenient option to configure the unit tests.
# HINT: Because spike only supports VLEN >= 64 we do not allow for VLEN=32.
set(VLEN "1024" CACHE STRING "Specify the vector length. ONLY used to configure the simulator for tests.")
set_property(CACHE VLEN PROPERTY STRINGS 64 128 256 512 1024)

# Enable tests by default
option(ENABLE_UNIT_TESTS "Enable unit tests" ON)
option(ENABLE_INTG_TESTS "Enable integration tests" OFF)

# Configure CMake
if(NOT ${TOOLCHAIN} STREQUAL "NONE")
  set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/CMake/toolchain_${TOOLCHAIN}.cmake")
endif()
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

# ETISS is a special snowflake
if(${SIMULATOR} STREQUAL "ETISS")
  file(GLOB_RECURSE PUPLINO_TARGET_CMAKE "${CMAKE_CURRENT_SOURCE_DIR}/Sim/ETISS/PulpinoTarget.cmake")
  include(${PUPLINO_TARGET_CMAKE})
endif()

project(muriscvnn LANGUAGES C CXX ASM DESCRIPTION "muRISCV-NN, a CMSIS-NN port for RISC-V.")

# This is the main library we are building, resolves to project name
set(MURISCVNN_LIB ${CMAKE_PROJECT_NAME})

# See whats going in CMake while getting the build process up and running
set(CMAKE_VERBOSE_MAKEFILE ON)

# Using C and C++ 11
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

if(USE_VEXT AND USE_PEXT)
  message(FATAL_ERROR "V/P-Extension can not be enabled simultaneously.")
elseif(USE_VEXT)
  add_definitions(-DUSE_VEXT)
elseif(USE_PEXT)
  add_definitions(-DUSE_PEXT)
endif()

# Set build mode, Debug by default
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

# Set some compiler options for easier debug or faster builds
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -g -ggdb")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -ggdb")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Ofast")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Ofast")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wshadow -Wno-format -std=c11") # TODO(fabianpedd): at a later point add -pedantic and -Werror
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=c++11")

add_subdirectory(Source)

if(${ENABLE_UNIT_TESTS} OR ${ENABLE_INTG_TESTS})
  enable_testing()
endif()

if(${ENABLE_UNIT_TESTS})
  add_subdirectory(Tests)
endif()

if(${ENABLE_INTG_TESTS})
  add_subdirectory(Integration)
endif()
