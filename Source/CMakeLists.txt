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
# Modifications copyright (C) 2021-2023 Chair of Electronic Design Automation, TUM
#

# Select which parts of muRISCV-NN should be compiled.
# There are some dependencies between the parts but they are not tracked
# by this cmake. So, enabling some functions may require to enable some
# other ones.
option(CONCATENATION        "Concatenation"         ON)
option(FULLYCONNECTED       "Fully Connected"       ON)
option(CONVOLUTION          "Convolutions"          ON)
option(ACTIVATION           "Activations"           ON)
option(POOLING              "Pooling"               ON)
option(SOFTMAX              "Softmax"               ON)
option(BASICMATHSNN         "Basic Maths for NN"    ON)
option(RESHAPE              "Reshape"               ON)
option(SVDF                 "SVDF"                  ON)
option(NNSUPPORT            "NN Support"            ON)
option(LSTM                 "LSTM Support"          ON)

set(MURISCVNN_LIB "muriscvnn")

add_library(${MURISCVNN_LIB} STATIC)

target_include_directories(${MURISCVNN_LIB} PUBLIC
  ${PROJECT_SOURCE_DIR}/Include
  ${PROJECT_SOURCE_DIR}/Include/CMSIS/NN/Include)

if(SIMULATOR)
  # TODO(fabianpedd): We currently need to include the Vicuna headers in order to redirect printf
  if(${SIMULATOR} STREQUAL "Vicuna")
    target_include_directories(${MURISCVNN_LIB} PUBLIC ${CMAKE_SOURCE_DIR}/Sim/Vicuna)
  endif()
endif()

if(BASICMATHSNN)
  add_subdirectory(BasicMathFunctions)
endif()

if(CONCATENATION)
  add_subdirectory(ConcatenationFunctions)
endif()

if(FULLYCONNECTED)
  add_subdirectory(FullyConnectedFunctions)
endif()

if(CONVOLUTION)
  add_subdirectory(ConvolutionFunctions)
endif()

if(ACTIVATION)
  add_subdirectory(ActivationFunctions)
endif()

if(POOLING)
  add_subdirectory(PoolingFunctions)
endif()

if(SOFTMAX)
  add_subdirectory(SoftmaxFunctions)
endif()

if(SVDF)
  add_subdirectory(SVDFunctions)
endif()

if(RESHAPE)
  add_subdirectory(ReshapeFunctions)
endif()

if(LSTM)
  add_subdirectory(LSTMFunctions)
endif()

# Keep NNSUPPORT at the end
if(NNSUPPORT)
  add_subdirectory(NNSupportFunctions)
endif()
