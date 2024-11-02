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

target_sources(${MURISCVNN_LIB} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_nt_t_padded_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_nt_t_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mul_core_1x_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mul_core_4x_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_nt_t_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_svdf_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mul_result_acc_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_nt_t_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_s8_to_s16_unordered_with_offset.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_q7_to_q15_with_offset.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_nt_t_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_tables.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mul_result_acc_s8_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_lstm_step_s8.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_lstm_calculate_gate_s8_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_nt_t_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_lstm_calculate_gate_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mul_result_acc_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_lstm_step_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mul_core_1x_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_depthwise_conv_nt_t_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_mat_mult_nt_interleaved_t_even_s4.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_s16_s16.c
                                        ${CMAKE_CURRENT_SOURCE_DIR}/muriscv_nn_vec_mat_mult_t_per_ch_s8.c)
