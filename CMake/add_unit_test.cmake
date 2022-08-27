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

# Simple macro that will create a test executable and register it with CTest
macro(add_muriscv_nn_unit_test TEST_NAME)

    # Move the "test" string from back to front in order to match test file name
    string(REGEX REPLACE "([^ ]*)_test$" "test_\\1" TEST_FILE_NAME ${TEST_NAME})

    # Create test executable
    if(${SIMULATOR} STREQUAL "ETISS")
        ADD_EXECUTABLE_PULPINO(${TEST_NAME}
            ${CMAKE_SOURCE_DIR}/Tests/TestCases/${TEST_FILE_NAME}/${TEST_FILE_NAME}.c)
    else()
        add_executable(${TEST_NAME}
            ${CMAKE_SOURCE_DIR}/Tests/TestCases/${TEST_FILE_NAME}/${TEST_FILE_NAME}.c)
    endif()

    # Take care of include directories and linking
    target_include_directories(${TEST_NAME} PUBLIC
                               ${CMAKE_SOURCE_DIR}/Include
                               ${CMAKE_SOURCE_DIR}/Tests/TestData
                               ${CMAKE_SOURCE_DIR}/Tests/Utils
                               ${unity_SOURCE_DIR}/src)
    target_link_libraries(${TEST_NAME} PUBLIC
                          ${MURISCVNN_LIB}
                          unity)

    # Register test with CTest and provide command to execute
    if(DEFINED RISCV_ARCH)
        if(${SIMULATOR} STREQUAL "OVPsim")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${CMAKE_SOURCE_DIR}/Sim/OVPsim/run.sh ./${TEST_NAME}.elf ${RISCV_ARCH} ${VLEN} 1
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        elseif(${SIMULATOR} STREQUAL "Spike")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${CMAKE_SOURCE_DIR}/Sim/Spike/run.sh ./${TEST_NAME}.elf ${RISCV_ARCH} ${VLEN}
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        elseif(${SIMULATOR} STREQUAL "ETISS")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${CMAKE_SOURCE_DIR}/Sim/ETISS/run.sh ./${TEST_NAME}
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        else()
            message(SEND_ERROR "Could not add test for specified simulator ${SIMULATOR}!")
        endif()
    else()
        add_test(NAME ${TEST_NAME}
                 COMMAND ./${TEST_NAME}.elf
                 WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    endif()

    if(${SIMULATOR} STREQUAL "ETISS")
        # TODO(fabianpedd): make ETISS tests fail after 2 second for now
        set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 2)
    else()
        # Tests should not take longer than 15 seconds
        set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 15)
    endif()

    # Create assembly dump from binary file
    add_custom_command(TARGET ${TEST_NAME} POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -S "$<TARGET_FILE:${TEST_NAME}>" # or just -d
                                  > "$<TARGET_FILE:${TEST_NAME}>.lst"
        VERBATIM)

    message("Successfully added ${TEST_NAME}")

endmacro()
