<!--
Copyright (c) 2023 TUM Department of Electrical and Computer Engineering - Chair of Electronic Design Automation.

This file is part of muRISCV-NN.
See https://github.com/tum-ei-eda/muriscv-nn for further info.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
# TFLM Integration
[TensorFlow Lite for Microcontrollers](https://www.tensorflow.org/lite/microcontrollers) (TFLM) is designed to run machine learning models on microcontrollers and other embedded devices. It provides [a mechanism](https://github.com/tensorflow/tflite-micro/blob/main/tensorflow/lite/micro/docs/optimized_kernel_implementations.md) to supply hardware-specific optimized kernels. The muRISCV-NN library can act as such and make its kernels available for use by TFLM. This is especially appealing for RISC-V devices that offer the RISC-V vector "V" or packed "P" extension.

muRISCV-NN heritage stems for ARM's CMSIS-NN library. Because TFLM already offers integration with the optimized [CMSIS-NN kernels](https://github.com/tensorflow/tflite-micro/tree/main/tensorflow/lite/micro/kernels/cmsis_nn) getting TFLM to use the muRISCV-NN kernels is quite straightforward. This is also thanks to the [CMSIS-NN wrappers](./Include/CMSIS) provided by muRISCV-NN.

## Prerequisites

To reduce the download time for external dependencies, it is assumed that all the required toolchain files and simulator files are already populated in their expected directory. This can be achieved as follows:

```
cd muriscv-nn
DIR=$(pwd)

# Toolchain (comment in others if required)
# cd $DIR/Toolchain && ./download_rv32gc.sh
# cd $DIR/Toolchain && ./download_rv32gcp.sh
cd $DIR/Toolchain && ./download_rv32gcv.sh

# Sim (comment in others if required)
# cd $DIR/Sim/Spike/bin && ./download.sh
# cd $DIR/Sim/ETISS/bin && virtualenv -p python3.8 .venv && source .venv/bin/activate && python setup_etiss.py && deactivate
cd $DIR/Sim/OVPsim/bin && ./download.sh
```

## Usage
- Clone the [TFLM GitHub repository](https://github.com/tensorflow/tflite-micro) `git clone git@github.com:tensorflow/tflite-micro.git` (into "here" `TFLM/`)
- Change into the TFLM directory `cd tflite-micro`
- Apply the `muriscv_nn` patch `git apply ../muriscv_nn.patch`
- Run the TFLM integration tests `../tflm_integration_tests.sh`
