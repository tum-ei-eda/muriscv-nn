#
# Copyright (C) 2019-2021 Arm Limited.
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
# Modifications copyright (C) 2024 Chair of Electronic Design Automation, TUM
#

target_sources(${MURISCVNN_LIB} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1_x_n_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1x1_s8_fast.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_fast_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_wrapper_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_wrapper_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_3x3_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_fast_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s8_opt.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_wrapper_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_wrapper_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_transpose_conv_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_transpose_conv_get_buffer_sizes_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1x1_s4_fast.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_get_buffer_sizes_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_get_buffer_sizes_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_get_buffer_sizes_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_wrapper_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1x1_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_kernel_s4_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1x1_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s8_core.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_get_buffer_sizes_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_get_buffer_sizes_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_s4_opt.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_kernel_s8_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_get_buffer_sizes_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_wrapper_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_kernel_row_offset_s8_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_kernel_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_1_x_n_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_convolve_even_s4.c)
