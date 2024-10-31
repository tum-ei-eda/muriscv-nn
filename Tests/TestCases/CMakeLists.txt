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

add_subdirectory(test_muriscv_nn_avgpool_s8)
add_subdirectory(test_muriscv_nn_avgpool_s16)
add_subdirectory(test_muriscv_nn_convolve_1x1_s8_fast)
# add_subdirectory(test_muriscv_nn_convolve_fast_s16) # TODO(fabianpedd): Currently not implemented
add_subdirectory(test_muriscv_nn_convolve_s8)
add_subdirectory(test_muriscv_nn_convolve_s16)
add_subdirectory(test_muriscv_nn_depthwise_conv_3x3_s8)
add_subdirectory(test_muriscv_nn_depthwise_conv_fast_s16)
add_subdirectory(test_muriscv_nn_depthwise_conv_s8)
add_subdirectory(test_muriscv_nn_depthwise_conv_s8_opt)
add_subdirectory(test_muriscv_nn_depthwise_conv_s16)
add_subdirectory(test_muriscv_nn_elementwise_add_s8)
add_subdirectory(test_muriscv_nn_elementwise_add_s16)
add_subdirectory(test_muriscv_nn_elementwise_mul_s8)
add_subdirectory(test_muriscv_nn_elementwise_mul_s16)
add_subdirectory(test_muriscv_nn_fully_connected_s8)
add_subdirectory(test_muriscv_nn_fully_connected_s16)
add_subdirectory(test_muriscv_nn_maxpool_s8)
add_subdirectory(test_muriscv_nn_maxpool_s16)
add_subdirectory(test_muriscv_nn_relu_q7)
add_subdirectory(test_muriscv_nn_relu6_s8)
add_subdirectory(test_muriscv_nn_softmax_s8)
add_subdirectory(test_muriscv_nn_softmax_s8_s16)
add_subdirectory(test_muriscv_nn_softmax_s16)
add_subdirectory(test_muriscv_nn_svdf_s8)
add_subdirectory(test_muriscv_nn_svdf_state_s16_s8)
add_subdirectory(test_muriscv_nn_lstm_unidirectional_s8)
add_subdirectory(test_muriscv_nn_lstm_unidirectional_s16)
