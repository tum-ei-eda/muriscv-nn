#
# Copyright (C) 2021-2022 Chair of Electronic Design Automation, TUM.
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the License); you may not use this file except in compliance with the
# License. You may obtain a copy of the License at
#
# www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an
# AS IS BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#

add_library(tflm STATIC)

# option(TF_LITE_STATIC_MEMORY "Turn off static memory" OFF)

# Enables the CMSIS-NN wrappers (make sure to use the correct TFLM source tree!)
option(USE_CMSIS_NN_WRAPPER "Build TensorFlow Lite Micro with CMSIS-NN wrapper" ON)

# Needed to run TensorFlow code with RISC-V toolchain
add_definitions(-DTF_LITE_USE_GLOBAL_MAX)
add_definitions(-DTF_LITE_USE_GLOBAL_MIN)
add_definitions(-DTF_LITE_STATIC_MEMORY)
add_definitions(-DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS)
add_definitions(-DTFLITE_EMULATE_FLOAT)
add_definitions(-fno-rtti) # Needed for GCC to resolve virtual delete function scope issue
add_definitions(-fno-exceptions) # Needed for GCC to resolve virtual delete function scope issue
# add_definitions(-DTF_LITE_STRIP_ERROR_STRINGS)

# TODO(fabianpedd): Figure out if these flags are actually needed -DTF_LITE_MCU_DEBUG_LOG -DTF_LITE_USE_CTIME

set(TF_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/tensorflow"
    CACHE PATH "TensorFlow source directory"
)
set(THIRD_PARTY_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/third_party"
    CACHE PATH "TF third_party directory"
)
set(TFL_SRC ${TF_DIR}/lite)
set(TFLM_SRC ${TFL_SRC}/micro)

if(USE_CMSIS_NN_WRAPPER)
  set(TFLM_OPTIMIZED_KERNEL cmsis_nn)
  add_definitions(-DCMSIS_NN)
endif()

set(TFLM_EXTRA_KERNEL_LIBS "")
set(TFLM_EXTRA_KERNEL_INCS "")

if(TFLM_OPTIMIZED_KERNEL)
  # Suboptimal but we do not want to hardcode every kernel which should be replaced...
  file(GLOB TFLM_EXTRA_KERNEL_SRCS ${TFLM_SRC}/kernels/${TFLM_OPTIMIZED_KERNEL}/*.cc)
  string(TOUPPER "${TFLM_OPTIMIZED_KERNEL}" TFLM_OPTIMIZED_KERNEL_UPPER)
endif()

set(TFLM_REFERENCE_KERNEL_SRCS
    ${TFLM_SRC}/kernels/add.cc
    ${TFLM_SRC}/kernels/batch_matmul.cc
    ${TFLM_SRC}/kernels/conv.cc
    ${TFLM_SRC}/kernels/depthwise_conv.cc
    ${TFLM_SRC}/kernels/fully_connected.cc
    ${TFLM_SRC}/kernels/mul.cc
    ${TFLM_SRC}/kernels/pooling.cc
    ${TFLM_SRC}/kernels/softmax.cc
    ${TFLM_SRC}/kernels/svdf.cc
    ${TFLM_SRC}/kernels/transpose_conv.cc
    ${TFLM_SRC}/kernels/unidirectional_sequence_lstm.cc
    # TODO: drop headers
    ${TFLM_SRC}/kernels/hard_swish.cc
    ${TFLM_SRC}/kernels/add_common.cc
    ${TFLM_SRC}/kernels/detection_postprocess_flexbuffers_generated_data.h
    ${TFLM_SRC}/kernels/lstm_eval.h
    ${TFLM_SRC}/kernels/dequantize.cc
    ${TFLM_SRC}/kernels/kernel_util.h
    ${TFLM_SRC}/kernels/concatenation.cc
    ${TFLM_SRC}/kernels/space_to_batch_nd.cc
    ${TFLM_SRC}/kernels/resize_nearest_neighbor.cc
    ${TFLM_SRC}/kernels/softmax.h
    ${TFLM_SRC}/kernels/pack.cc
    ${TFLM_SRC}/kernels/broadcast_args.cc
    ${TFLM_SRC}/kernels/maximum_minimum.cc
    ${TFLM_SRC}/kernels/mul_common.cc
    ${TFLM_SRC}/kernels/quantize.cc
    ${TFLM_SRC}/kernels/hard_swish_common.cc
    ${TFLM_SRC}/kernels/softmax_common.cc
    ${TFLM_SRC}/kernels/cumsum.cc
    ${TFLM_SRC}/kernels/dequantize.h
    ${TFLM_SRC}/kernels/prelu.h
    ${TFLM_SRC}/kernels/pad.cc
    ${TFLM_SRC}/kernels/floor.cc
    ${TFLM_SRC}/kernels/split_v.cc
    # ${TFLM_SRC}/kernels/svdf_common.cc
    ${TFLM_SRC}/kernels/logistic.h
    ${TFLM_SRC}/kernels/shape.cc
    ${TFLM_SRC}/kernels/micro_tensor_utils.h
    ${TFLM_SRC}/kernels/conv_test.h
    ${TFLM_SRC}/kernels/batch_to_space_nd.cc
    ${TFLM_SRC}/kernels/circular_buffer_flexbuffers_generated_data.h
    # ${TFLM_SRC}/kernels/micro_utils.h
    ${TFLM_SRC}/kernels/kernel_runner.cc
    ${TFLM_SRC}/kernels/leaky_relu.cc
    ${TFLM_SRC}/kernels/sub.h
    ${TFLM_SRC}/kernels/logistic.cc
    # ${TFLM_SRC}/kernels/unidirectional_sequence_lstm.cc
    ${TFLM_SRC}/kernels/floor_div.cc
    ${TFLM_SRC}/kernels/kernel_runner.h
    ${TFLM_SRC}/kernels/hard_swish.h
    ${TFLM_SRC}/kernels/ceil.cc
    ${TFLM_SRC}/kernels/strided_slice.cc
    ${TFLM_SRC}/kernels/depthwise_conv_common.cc
    ${TFLM_SRC}/kernels/logical.h
    ${TFLM_SRC}/kernels/fully_connected.h
    ${TFLM_SRC}/kernels/circular_buffer.h
    ${TFLM_SRC}/kernels/pooling_common.cc
    ${TFLM_SRC}/kernels/micro_ops.h
    ${TFLM_SRC}/kernels/kernel_util.cc
    ${TFLM_SRC}/kernels/assign_variable.cc
    ${TFLM_SRC}/kernels/sub_common.cc
    ${TFLM_SRC}/kernels/reduce.cc
    ${TFLM_SRC}/kernels/unpack.cc
    ${TFLM_SRC}/kernels/ethosu.cc
    ${TFLM_SRC}/kernels/activations_common.cc
    ${TFLM_SRC}/kernels/ethosu.h
    ${TFLM_SRC}/kernels/conv.h
    ${TFLM_SRC}/kernels/squared_difference.cc
    ${TFLM_SRC}/kernels/l2norm.cc
    ${TFLM_SRC}/kernels/l2_pool_2d.cc
    ${TFLM_SRC}/kernels/round.cc
    ${TFLM_SRC}/kernels/tanh.cc
    ${TFLM_SRC}/kernels/add_n.cc
    ${TFLM_SRC}/kernels/dequantize_common.cc
    ${TFLM_SRC}/kernels/broadcast_to.cc
    ${TFLM_SRC}/kernels/circular_buffer.cc
    ${TFLM_SRC}/kernels/space_to_depth.cc
    ${TFLM_SRC}/kernels/add.h
    ${TFLM_SRC}/kernels/quantize_common.cc
    ${TFLM_SRC}/kernels/logical.cc
    ${TFLM_SRC}/kernels/split.cc
    ${TFLM_SRC}/kernels/if.cc
    ${TFLM_SRC}/kernels/expand_dims.cc
    ${TFLM_SRC}/kernels/logical_common.cc
    ${TFLM_SRC}/kernels/lstm_eval.cc
    ${TFLM_SRC}/kernels/sub.cc
    ${TFLM_SRC}/kernels/prelu_common.cc
    ${TFLM_SRC}/kernels/slice.cc
    ${TFLM_SRC}/kernels/gather.cc
    ${TFLM_SRC}/kernels/squeeze.cc
    ${TFLM_SRC}/kernels/floor_mod.cc
    ${TFLM_SRC}/kernels/depth_to_space.cc
    ${TFLM_SRC}/kernels/quantize.h
    ${TFLM_SRC}/kernels/mul.h
    ${TFLM_SRC}/kernels/fully_connected_common.cc
    ${TFLM_SRC}/kernels/gather_nd.cc
    ${TFLM_SRC}/kernels/reduce_common.cc
    ${TFLM_SRC}/kernels/conv_common.cc
    ${TFLM_SRC}/kernels/mirror_pad.cc
    ${TFLM_SRC}/kernels/activations.h
    ${TFLM_SRC}/kernels/micro_tensor_utils.cc
    ${TFLM_SRC}/kernels/activations.cc
    ${TFLM_SRC}/kernels/fill.cc
    ${TFLM_SRC}/kernels/resize_bilinear.cc
    # ${TFLM_SRC}/kernels/svdf.h
    ${TFLM_SRC}/kernels/call_once.cc
    ${TFLM_SRC}/kernels/prelu.cc
    ${TFLM_SRC}/kernels/reshape.cc
    ${TFLM_SRC}/kernels/lstm_shared.h
    ${TFLM_SRC}/kernels/zeros_like.cc
    ${TFLM_SRC}/kernels/neg.cc
    ${TFLM_SRC}/kernels/elementwise.cc
    ${TFLM_SRC}/kernels/read_variable.cc
    ${TFLM_SRC}/kernels/div.cc
    ${TFLM_SRC}/kernels/while.cc
    ${TFLM_SRC}/kernels/exp.cc
    ${TFLM_SRC}/kernels/reduce.h
    ${TFLM_SRC}/kernels/detection_postprocess.cc
    ${TFLM_SRC}/kernels/depthwise_conv.h
    ${TFLM_SRC}/kernels/circular_buffer_common.cc
    ${TFLM_SRC}/kernels/leaky_relu_common.cc
    ${TFLM_SRC}/kernels/activation_utils.h
    ${TFLM_SRC}/kernels/arg_min_max.cc
    ${TFLM_SRC}/kernels/comparisons.cc
    ${TFLM_SRC}/kernels/log_softmax.cc
    ${TFLM_SRC}/kernels/cast.cc
    ${TFLM_SRC}/kernels/leaky_relu.h
    # ${TFLM_SRC}/kernels/transpose_conv.cc
    ${TFLM_SRC}/kernels/pooling.h
    ${TFLM_SRC}/kernels/elu.cc
    ${TFLM_SRC}/kernels/var_handle.cc
    # ${TFLM_SRC}/kernels/unidirectional_sequence_lstm_test_config.h
    ${TFLM_SRC}/kernels/transpose.cc
    ${TFLM_SRC}/kernels/logistic_common.cc
    ${TFLM_SRC}/kernels/reshape_common.cc
    ${TFL_SRC}/kernels/op_macros.h
    ${TFL_SRC}/kernels/kernel_util.h
    ${TFL_SRC}/kernels/kernel_util.cc
    ${TFL_SRC}/kernels/internal/tensor_ctypes.h
    ${TFL_SRC}/kernels/internal/tensor_ctypes.cc
    ${TFL_SRC}/kernels/internal/strided_slice_logic.h
    ${TFL_SRC}/kernels/internal/common.h
    ${TFL_SRC}/kernels/internal/types.h
    ${TFL_SRC}/kernels/internal/min.h
    ${TFL_SRC}/kernels/internal/optimized/neon_check.h
    ${TFL_SRC}/kernels/internal/portable_tensor.h
    ${TFL_SRC}/kernels/internal/quantization_util.cc
    ${TFL_SRC}/kernels/internal/reference/portable_tensor_utils_impl.h
    ${TFL_SRC}/kernels/internal/reference/softmax.h
    ${TFL_SRC}/kernels/internal/reference/slice.h
    ${TFL_SRC}/kernels/internal/reference/log_softmax.h
    ${TFL_SRC}/kernels/internal/reference/process_broadcast_shapes.h
    ${TFL_SRC}/kernels/internal/reference/broadcast_to.h
    ${TFL_SRC}/kernels/internal/reference/transpose.h
    ${TFL_SRC}/kernels/internal/reference/depthwiseconv_float.h
    ${TFL_SRC}/kernels/internal/reference/dequantize.h
    ${TFL_SRC}/kernels/internal/reference/prelu.h
    ${TFL_SRC}/kernels/internal/reference/logistic.h
    ${TFL_SRC}/kernels/internal/reference/comparisons.h
    ${TFL_SRC}/kernels/internal/reference/depthwiseconv_uint8.h
    ${TFL_SRC}/kernels/internal/reference/space_to_depth.h
    ${TFL_SRC}/kernels/internal/reference/ceil.h
    ${TFL_SRC}/kernels/internal/reference/sub.h
    ${TFL_SRC}/kernels/internal/reference/transpose_conv.h
    ${TFL_SRC}/kernels/internal/reference/depth_to_space.h
    ${TFL_SRC}/kernels/internal/reference/hard_swish.h
    ${TFL_SRC}/kernels/internal/reference/strided_slice.h
    ${TFL_SRC}/kernels/internal/reference/fully_connected.h
    ${TFL_SRC}/kernels/internal/reference/floor_mod.h
    ${TFL_SRC}/kernels/internal/reference/batch_to_space_nd.h
    ${TFL_SRC}/kernels/internal/reference/binary_function.h
    ${TFL_SRC}/kernels/internal/reference/requantize.h
    ${TFL_SRC}/kernels/internal/reference/conv.h
    ${TFL_SRC}/kernels/internal/reference/broadcast_args.h
    ${TFL_SRC}/kernels/internal/reference/concatenation.h
    ${TFL_SRC}/kernels/internal/reference/elu.h
    ${TFL_SRC}/kernels/internal/reference/add.h
    ${TFL_SRC}/kernels/internal/reference/pad.h
    ${TFL_SRC}/kernels/internal/reference/add_n.h
    ${TFL_SRC}/kernels/internal/reference/div.h
    ${TFL_SRC}/kernels/internal/reference/cumsum.h
    ${TFL_SRC}/kernels/internal/reference/exp.h
    ${TFL_SRC}/kernels/internal/reference/space_to_batch_nd.h
    ${TFL_SRC}/kernels/internal/reference/neg.h
    ${TFL_SRC}/kernels/internal/reference/batch_matmul.h
    ${TFL_SRC}/kernels/internal/reference/resize_nearest_neighbor.h
    ${TFL_SRC}/kernels/internal/reference/fill.h
    ${TFL_SRC}/kernels/internal/reference/quantize.h
    ${TFL_SRC}/kernels/internal/reference/mul.h
    ${TFL_SRC}/kernels/internal/reference/tanh.h
    ${TFL_SRC}/kernels/internal/reference/arg_min_max.h
    ${TFL_SRC}/kernels/internal/reference/portable_tensor_utils.cc
    ${TFL_SRC}/kernels/internal/reference/l2normalization.h
    ${TFL_SRC}/kernels/internal/reference/round.h
    ${TFL_SRC}/kernels/internal/reference/reduce.h
    ${TFL_SRC}/kernels/internal/reference/portable_tensor_utils.h
    ${TFL_SRC}/kernels/internal/reference/floor_div.h
    ${TFL_SRC}/kernels/internal/reference/leaky_relu.h
    ${TFL_SRC}/kernels/internal/reference/resize_bilinear.h
    ${TFL_SRC}/kernels/internal/reference/pooling.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/logistic.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/mean.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/transpose_conv.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/fully_connected.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/conv.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/add.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/mul.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/tanh.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/l2normalization.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/depthwise_conv.h
    ${TFL_SRC}/kernels/internal/reference/integer_ops/pooling.h
    ${TFL_SRC}/kernels/internal/reference/maximum_minimum.h
    ${TFL_SRC}/kernels/internal/reference/floor.h
    ${TFL_SRC}/kernels/internal/reference/lstm_cell.h
    ${TFL_SRC}/kernels/internal/compatibility.h
    ${TFL_SRC}/kernels/internal/runtime_shape.h
    ${TFL_SRC}/kernels/internal/max.h
    ${TFL_SRC}/kernels/internal/quantization_util.h
    ${TFL_SRC}/kernels/internal/portable_tensor_utils.h
    ${TFL_SRC}/kernels/internal/portable_tensor_utils.cc
    ${TFL_SRC}/kernels/internal/cppmath.h
    ${TFL_SRC}/kernels/internal/common.cc
    ${TFL_SRC}/kernels/padding.h
)

foreach(src ${TFLM_EXTRA_KERNEL_SRCS})
  get_filename_component(src_name ${src} NAME)
  if(${src_name} MATCHES ".*_test.*")
    list(REMOVE_ITEM TFLM_EXTRA_KERNEL_SRCS ${src})
  else()
    set(src_path "${TFLM_SRC}/kernels/${src_name}")
    list(FIND TFLM_REFERENCE_KERNEL_SRCS ${src_path} TFLM_KERNEL_SRCS_FOUND_INDEX)
    if(${TFLM_KERNEL_SRCS_FOUND_INDEX} GREATER_EQUAL 0)
      message(STATUS "Replacing TFLM version of ${src_name} by optimized variant...")
      list(REMOVE_ITEM TFLM_REFERENCE_KERNEL_SRCS ${src_path})
      message(STATUS "REPLACE ${src_path}")
    endif()
  endif()
endforeach()

set(TFLM_THIRD_PARTY_SRCS
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/util.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/vector.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/flexbuffers.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/struct.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/array.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/buffer_ref.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/default_allocator.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/verifier.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/buffer.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/vector_downward.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/flatbuffers.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/table.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/stl_emulation.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/base.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/flatbuffer_builder.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/string.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/allocator.h
    ${THIRD_PARTY_DIR}/flatbuffers/include/flatbuffers/detached_buffer.h
    ${THIRD_PARTY_DIR}/gemmlowp/internal/detect_platform.h
    ${THIRD_PARTY_DIR}/gemmlowp/fixedpoint/fixedpoint_neon.h
    ${THIRD_PARTY_DIR}/gemmlowp/fixedpoint/fixedpoint_sse.h
    ${THIRD_PARTY_DIR}/gemmlowp/fixedpoint/fixedpoint.h
    ${THIRD_PARTY_DIR}/kissfft/tools/kiss_fftr.c
    ${THIRD_PARTY_DIR}/kissfft/tools/kiss_fftr.h
    ${THIRD_PARTY_DIR}/kissfft/_kiss_fft_guts.h
    ${THIRD_PARTY_DIR}/kissfft/kiss_fft.h
    ${THIRD_PARTY_DIR}/kissfft/kiss_fft.c
    ${THIRD_PARTY_DIR}/ruy/ruy/profiler/instrumentation.h
)

set(TFLM_SRCS
    ${TFLM_REFERENCE_KERNEL_SRCS}
    ${TFLM_EXTRA_KERNEL_SRCS}
    ${TFLM_THIRD_PARTY_SRCS}
    ${TFL_SRC}/c/common.h
    ${TFL_SRC}/c/c_api_types.h
    ${TFL_SRC}/core/c/common.h
    ${TFL_SRC}/core/c/common.cc
    ${TFL_SRC}/c/builtin_op_data.h
    ${TFL_SRC}/builtin_ops.h
    ${TFL_SRC}/schema/schema_generated.h
    ${CMAKE_CURRENT_SOURCE_DIR}/tensorflow/compiler/mlir/lite/schema/schema_utils.cc
    ${TFL_SRC}/schema/schema_utils.h
    ${TFL_SRC}/context_util.h
    ${TFLM_SRC}/micro_resource_variable.h
    ${TFLM_SRC}/fake_micro_context.h
    ${TFLM_SRC}/test_helpers.h
    ${TFLM_SRC}/memory_planner/micro_memory_planner.h
    ${TFLM_SRC}/memory_planner/linear_memory_planner.cc
    ${TFLM_SRC}/memory_planner/memory_plan_struct.h
    ${TFLM_SRC}/memory_planner/linear_memory_planner.h
    ${TFLM_SRC}/memory_planner/non_persistent_buffer_planner_shim.h
    ${TFLM_SRC}/memory_planner/greedy_memory_planner.cc
    ${TFLM_SRC}/memory_planner/non_persistent_buffer_planner_shim.cc
    ${TFLM_SRC}/memory_planner/greedy_memory_planner.h
    ${TFLM_SRC}/memory_helpers.h
    ${TFLM_SRC}/micro_allocator.h
    ${TFLM_SRC}/system_setup.h
    ${TFLM_SRC}/memory_helpers.cc
    ${TFLM_SRC}/mock_micro_graph.cc
    ${TFLM_SRC}/system_setup.cc
    ${TFLM_SRC}/flatbuffer_utils.h
    ${TFLM_SRC}/fake_micro_context.cc
    ${TFLM_SRC}/recording_micro_allocator.h
    ${TFLM_SRC}/micro_utils.h
    ${TFLM_SRC}/micro_mutable_op_resolver.h
    ${TFLM_SRC}/debug_log.h
    ${TFLM_SRC}/micro_profiler.h
    ${TFLM_SRC}/test_helpers.cc
    ${TFLM_SRC}/micro_resource_variable.cc
    ${TFLM_SRC}/micro_context.cc
    ${TFLM_SRC}/micro_profiler.cc
    ${TFLM_SRC}/micro_utils.cc
    ${TFLM_SRC}/micro_interpreter.h
    ${TFLM_SRC}/micro_allocation_info.cc
    # ${TFLM_SRC}/micro_string.cc
    ${TFLM_SRC}/mock_micro_graph.h
    ${TFLM_SRC}/compatibility.h
    ${TFLM_SRC}/flatbuffer_utils.cc
    ${TFLM_SRC}/tflite_bridge/micro_error_reporter.cc
    ${TFLM_SRC}/micro_time.h
    ${TFLM_SRC}/micro_allocation_info.h
    ${TFLM_SRC}/micro_interpreter_graph.cc
    ${TFLM_SRC}/micro_interpreter_context.cc
    ${TFLM_SRC}/arena_allocator/single_arena_buffer_allocator.cc
    ${TFLM_SRC}/arena_allocator/single_arena_buffer_allocator.h
    ${TFLM_SRC}/arena_allocator/persistent_arena_buffer_allocator.h
    ${TFLM_SRC}/arena_allocator/ibuffer_allocator.h
    ${TFLM_SRC}/arena_allocator/persistent_arena_buffer_allocator.cc
    ${TFLM_SRC}/arena_allocator/recording_single_arena_buffer_allocator.cc
    ${TFLM_SRC}/arena_allocator/recording_single_arena_buffer_allocator.h
    ${TFLM_SRC}/arena_allocator/non_persistent_arena_buffer_allocator.cc
    ${TFLM_SRC}/arena_allocator/non_persistent_arena_buffer_allocator.h
    # ${TFLM_SRC}/micro_string.h ${TFLM_SRC}/all_ops_resolver.h ${TFLM_SRC}/micro_graph.cc
    # ${TFLM_SRC}/all_ops_resolver.cc
    ${TFLM_SRC}/recording_micro_interpreter.h
    ${TFLM_SRC}/micro_context.h
    ${TFLM_SRC}/micro_allocator.cc
    ${TFLM_SRC}/tflite_bridge/micro_error_reporter.h
    ${TFLM_SRC}/micro_interpreter.cc
    ${TFLM_SRC}/micro_time.cc
    ${TFLM_SRC}/test_helper_custom_ops.h
    ${TFLM_SRC}/micro_graph.h
    ${TFLM_SRC}/recording_micro_allocator.cc
    ${TFLM_SRC}/debug_log.cc
    ${TFLM_SRC}/micro_op_resolver.h
    ${TFLM_SRC}/micro_op_resolver.cc
    ${TFLM_SRC}/micro_arena_constants.h
    ${TFLM_SRC}/test_helper_custom_ops.cc
    ${TFLM_SRC}/micro_log.h
    ${TFLM_SRC}/micro_log.cc
    ${TFLM_SRC}/tflite_bridge/flatbuffer_conversions_bridge.h
    ${TFLM_SRC}/tflite_bridge/flatbuffer_conversions_bridge.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/tensorflow/compiler/mlir/lite/core/api/error_reporter.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/tensorflow/compiler/mlir/lite/core/api/error_reporter.h
    # ${TFL_SRC}/core/api/op_resolver.cc
    ${TFL_SRC}/core/api/flatbuffer_conversions.cc
    ${TFL_SRC}/core/api/tensor_utils.h
    # ${TFL_SRC}/core/api/op_resolver.h
    ${TFL_SRC}/core/api/tensor_utils.cc
    ${TFL_SRC}/core/api/flatbuffer_conversions.h
    ${TFL_SRC}/portable_type_to_tflitetype.h
    ${TFL_SRC}/builtin_op_data.h
)

# For backwards compatibility, we drop non-existance files here.
foreach(src ${TFLM_SRCS})
  if(NOT EXISTS ${src})
    list(REMOVE_ITEM TFLM_SRCS ${src})
    message(STATUS "REMOVE ${src}")
  endif()
endforeach()

target_sources(tflm PRIVATE ${TFLM_SRCS})

target_include_directories(
  tflm
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
         ${THIRD_PARTY_DIR}/ruy
         ${THIRD_PARTY_DIR}/gemmlowp
         ${THIRD_PARTY_DIR}/kissfft
         ${THIRD_PARTY_DIR}/flatbuffers
         ${THIRD_PARTY_DIR}/flatbuffers/include
         ${PROJECT_SOURCE_DIR}/Include
         ${PROJECT_SOURCE_DIR}/Include/CMSIS/NN
)

if(${TOOLCHAIN} STREQUAL "LLVM")
  target_link_libraries(tflm PRIVATE muriscvnn m stdc++)
else()
  target_link_libraries(tflm PRIVATE muriscvnn)
endif()

option(DISABLE_TFLM_AWW_INTG_TESTS "Enable tflm integration tests for aww model" OFF)
option(DISABLE_TFLM_IC_INTG_TESTS "Enable tflm integration tests for ic model" OFF)
option(DISABLE_TFLM_TOY_INTG_TESTS "Enable tflm integration tests for toy model" OFF)
option(DISABLE_TFLM_vWW_INTG_TESTS "Enable tflm integration tests for vww model" OFF)

if(NOT DISABLE_TFLM_AWW_INTG_TESTS)
  add_subdirectory(aww)
endif()
if(NOT DISABLE_TFLM_IC_INTG_TESTS)
  add_subdirectory(ic)
endif()
if(NOT DISABLE_TFLM_TOY_INTG_TESTS)
  add_subdirectory(toy)
endif()
if(NOT DISABLE_TFLM_VWW_INTG_TESTS)
  add_subdirectory(vww)
endif()
