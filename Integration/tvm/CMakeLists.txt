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

option(ENABLE_TVM_AWW_INTG_TESTS "Enable tvm integration tests for aww model" ON)
option(ENABLE_TVM_IC_INTG_TESTS "Enable tvm integration tests for ic model" ON)
option(ENABLE_TVM_TOY_INTG_TESTS "Enable tvm integration tests for toy model" ON)
option(ENABLE_TVM_vWW_INTG_TESTS "Enable tvm integration tests for vww model" ON)

if(ENABLE_TVM_AWW_INTG_TESTS)
    add_subdirectory(aww)
endif()
if(ENABLE_TVM_IC_INTG_TESTS)
    add_subdirectory(ic)
endif()
if(ENABLE_TVM_TOY_INTG_TESTS)
    add_subdirectory(toy)
endif()
if(ENABLE_TVM_VWW_INTG_TESTS)
    add_subdirectory(vww)
endif()
