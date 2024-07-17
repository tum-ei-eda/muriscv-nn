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

include(add_unit_test)

# Get and build the Unity test framework
include(FetchContent)
set(FETCHCONTENT_QUIET FALSE)
FetchContent_Declare(
  unity
  GIT_REPOSITORY https://github.com/ThrowTheSwitch/Unity
  GIT_TAG v2.5.2
  GIT_PROGRESS TRUE
)
add_definitions(-DUNITY_INCLUDE_CONFIG_H)
FetchContent_MakeAvailable(unity)
target_include_directories(unity PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Tests/TestData>
                                        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Tests/Utils>
                                        $<BUILD_INTERFACE:${unity_SOURCE_DIR}/src>)

if(${SIMULATOR} STREQUAL "Vicuna")
  target_include_directories(unity PRIVATE $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Sim/Vicuna>)
endif()

add_subdirectory(TestCases)
