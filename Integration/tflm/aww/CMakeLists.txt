# add_executable(aww)
#
# target_include_directories(aww PRIVATE
#   ${CMAKE_CURRENT_SOURCE_DIR}
# )
#
# target_sources(aww PRIVATE
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_input_data.cc
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_input_data.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_data.cc
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_data.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_settings.cc
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_settings.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_output_data_ref.cc
#   ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_output_data_ref.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
# )
#
# target_link_libraries(aww PRIVATE tflm)

add_executable(aww)

target_include_directories(aww PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(aww PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_input_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_input_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_settings.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_model_settings.h
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_output_data_ref.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/aww_data/aww_output_data_ref.h
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

target_link_libraries(aww PRIVATE tflm)


set(TEST_NAME aww)

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

# if(${SIMULATOR} STREQUAL "ETISS")
#     # TODO(fabianpedd): make ETISS tests fail after 2 second for now
#     set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 2)
# else()
#     # Tests should not take longer than 15 seconds
#     set_tests_properties(${TEST_NAME} PROPERTIES TIMEOUT 15)
# endif()

# Create assembly dump from binary file
add_custom_command(TARGET ${TEST_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJDUMP} -S "$<TARGET_FILE:${TEST_NAME}>" # or just -d
                              > "$<TARGET_FILE:${TEST_NAME}>.lst"
    VERBATIM)

message(STATUS "Successfully added ${TEST_NAME}")
