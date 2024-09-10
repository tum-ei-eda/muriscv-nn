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
            ${PROJECT_SOURCE_DIR}/Tests/TestCases/${TEST_FILE_NAME}/${TEST_FILE_NAME}.c)
    else()
        add_executable(${TEST_NAME}
            ${PROJECT_SOURCE_DIR}/Tests/TestCases/${TEST_FILE_NAME}/${TEST_FILE_NAME}.c)
    endif()

    target_link_libraries(${TEST_NAME} PUBLIC muriscvnn unity)

    # Register test with CTest and provide command to execute

    #if(DEFINED RISCV_ARCH)  #does not work for x86 operation, this variable is still defined.  in x86 case, test is run on Spike and fails
    if(NOT ${TOOLCHAIN} STREQUAL "x86")
        if(${SIMULATOR} STREQUAL "OVPsim")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${PROJECT_SOURCE_DIR}/Sim/OVPsim/run.sh ./${TEST_NAME}.elf ${RISCV_ARCH} ${VLEN} ${ELEN} 1
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        elseif(${SIMULATOR} STREQUAL "Spike")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${PROJECT_SOURCE_DIR}/Sim/Spike/run.sh ./${TEST_NAME}.elf ${RISCV_ARCH} ${VLEN} ${ELEN}
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        elseif(${SIMULATOR} STREQUAL "ETISS")
            add_test(NAME ${TEST_NAME}
                     COMMAND ${PROJECT_SOURCE_DIR}/Sim/ETISS/run.sh ./${TEST_NAME}
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        elseif(${SIMULATOR} STREQUAL "Vicuna")
            set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${PROJECT_SOURCE_DIR}/Sim/Vicuna/vicuna/sw/lld_link.ld")
            target_link_options(${TEST_NAME} PRIVATE "-nostartfiles")
            target_link_libraries(${TEST_NAME} PRIVATE vicuna_crt)

            add_custom_command(TARGET ${TEST_NAME} POST_BUILD
              COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:${TEST_NAME}>"
                                                 "$<TARGET_FILE:${TEST_NAME}>.bin" VERBATIM)

            add_custom_command(TARGET ${TEST_NAME} POST_BUILD
              COMMAND srec_cat "$<TARGET_FILE:${TEST_NAME}>.bin" -binary -offset 0x0000 -byte-swap 4 -o
                               "$<TARGET_FILE:${TEST_NAME}>.vmem" -vmem VERBATIM)

            add_custom_command(TARGET ${TEST_NAME} POST_BUILD
              COMMAND realpath "$<TARGET_FILE:${TEST_NAME}>.vmem" >
                               "$<TARGET_FILE:${TEST_NAME}>.path" VERBATIM)

            add_test(NAME ${TEST_NAME}
                     COMMAND ${PROJECT_SOURCE_DIR}/Sim/Vicuna/run.sh "$<TARGET_FILE:${TEST_NAME}>.path"
                     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
        else()
            message(FATAL_ERROR "Could not add test for specified simulator ${SIMULATOR}!")
        endif()
    else()
        add_test(NAME ${TEST_NAME}
                 COMMAND ./${TEST_NAME}.elf
                 WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    endif()

    if(${SIMULATOR} STREQUAL "ETISS")
        # TODO(fabianpedd): make ETISS tests fail after 2 second for now
        set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 2)
    elseif(${SIMULATOR} STREQUAL "Vicuna")
        # TODO(fabianpedd): Vicuna needs extra time since its RTL
        set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 10000)
    else()
        # Tests should not take longer than 15 seconds
        set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 15)
    endif()

    # Create assembly dump from binary file
    add_custom_command(TARGET ${TEST_NAME} POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -S "$<TARGET_FILE:${TEST_NAME}>" # or just -d
                                  > "$<TARGET_FILE:${TEST_NAME}>.lst"
        VERBATIM)

    message(STATUS "Successfully added ${TEST_NAME}")

endmacro()
