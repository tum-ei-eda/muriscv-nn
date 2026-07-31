cmake_minimum_required(VERSION 3.16)

project(
  muriscv_nn_subproject_smoke
  LANGUAGES C
)

if(NOT DEFINED MURISCV_NN_SOURCE_DIR)
  message(FATAL_ERROR
          "MURISCV_NN_SOURCE_DIR must point to the muRISCV-NN repository")
endif()

# Keep the native smoke test minimal.
set(SIMULATOR "")
set(USE_VEXT OFF)
set(USE_PEXT OFF)
set(USE_PORTABLE OFF)

set(ACTIVATION ON CACHE BOOL "" FORCE)
set(BASICMATHSNN OFF CACHE BOOL "" FORCE)
set(CONCATENATION OFF CACHE BOOL "" FORCE)
set(CONVOLUTION OFF CACHE BOOL "" FORCE)
set(FULLYCONNECTED OFF CACHE BOOL "" FORCE)
set(LSTM OFF CACHE BOOL "" FORCE)
set(NNSUPPORT OFF CACHE BOOL "" FORCE)
set(POOLING OFF CACHE BOOL "" FORCE)
set(RESHAPE OFF CACHE BOOL "" FORCE)
set(SOFTMAX OFF CACHE BOOL "" FORCE)
set(SVDF OFF CACHE BOOL "" FORCE)

# This is the important part: integrate the library implementation directly,
# without processing muRISCV-NN's top-level project() call.
add_subdirectory(
  "${MURISCV_NN_SOURCE_DIR}/Source"
  "${CMAKE_CURRENT_BINARY_DIR}/muriscv-nn"
)

add_executable(muriscv_nn_subproject_smoke smoke.c)
target_link_libraries(muriscv_nn_subproject_smoke PRIVATE muriscvnn)

enable_testing()

add_test(
  NAME muriscv_nn_subproject_smoke
  COMMAND muriscv_nn_subproject_smoke
)
