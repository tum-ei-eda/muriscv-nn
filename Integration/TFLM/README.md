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
