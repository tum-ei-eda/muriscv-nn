# TFLM Integration
[TensorFlow Lite for Microcontrollers](https://www.tensorflow.org/lite/microcontrollers) (TFLM) is designed to run machine learning models on microcontrollers and other embedded devices. It provides [a mechanism](https://github.com/tensorflow/tflite-micro/blob/main/tensorflow/lite/micro/docs/optimized_kernel_implementations.md) to supply hardware-specific optimized kernels. The muRISCV-NN library can act as such and make its kernels available for use by TFLM. This is especially appealing for RISC-V devices that offer the vector "V" or packed "P" extension.

muRISCV-NN heritage stems for ARM's CMSIS-NN library. Because TFLM already offers integration with the optimized [CMSIS-NN kernels](https://github.com/tensorflow/tflite-micro/tree/main/tensorflow/lite/micro/kernels/cmsis_nn) getting TFLM to use the muRISCV-NN kernels is quite straightforward. This is also thanks to the [CMSIS-NN wrappers](./Include/CMSIS) provided by muRISCV.

## Use
- Clone the [TFLM GitHub repository](https://github.com/tensorflow/tflite-micro) `git clone git@github.com:tensorflow/tflite-micro.git` (into "here" `TFLM/`)
- Change into the TFLM directory `cd tflite-micro`
- Apply the `muriscv_nn` patch `git apply ../muriscv_nn.patch`
- Run the TFLM integration tests `../tflm_integration_tests.sh`
