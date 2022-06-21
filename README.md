# muRISCV-NN

![Build](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/build.yml/badge.svg)  
![Scalar Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_scalar.yml/badge.svg)  
![Vector V Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_vector.yml/badge.svg)  
![Packed P Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_packed.yml/badge.svg)  
<!-- ![TFLM Integration Tests]https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/tflm_integration_ovpsim.yml/badge.svg)-->

muRISCV-NN is a collection of efficient deep learning kernels for embedded platforms and microcontrollers. It is based on ARM's [CMSIS-NN](https://github.com/ARM-software/CMSIS_5/tree/develop/CMSIS/NN) library but targets the [RISC-V ISA](https://en.wikipedia.org/wiki/RISC-V). It offers vectorized implementations using the [RISC-V "V" vector extension](https://github.com/riscv/riscv-v-spec), as well SIMD implementations using the [packed "P" extension](https://github.com/riscv/riscv-p-spec).  

muRISCV-NN aims to stay functionally equivalent to CMSIS-NN so that, ideally, no difference (except performance) should be noticeable to users of either CMSIS-NN or muRISCV-NN. This way, muRISCV-NN acts as a drop-in replacement for CMSIS-NN and can be used with, for example, [TensorFlow Lite for Microcontrollers](./TFLM) or [microTVM](https://tvm.apache.org/docs/topic/microtvm/index.html).  

muRISCV-NN is not a GIT fork "in the traditional sense". Instead, we aim to pull in changes from "upstream" CMSIS-NN manually on a regular basis in order to stay consistent and up-to-date. A direct fork would not make much sense, as our code differs too much in functionality and naming compared to CMSIS-NN.

## Simulation
You can simulate/emulate (and test) the code using different simulators. Please refer to the `Sim/` directory for more information on each simulator and its corresponding files.

## Tests
In order to run the unit tests, simply:
- `mkdir build && cd build`
- `cmake .. && make`
- `ctest --verbose`  
*If using the LLVM toolchain, make sure to also have at least the GCC lite toolchain available. Otherwise, you will get errors in the CMake setup.*

Have a look at the [`CMakeLists.txt`](./CMakeLists.txt), as well as the toolchain files in the [`CMake`](./CMake) directory for more information on arguments (like paths) and options (like vector or packed support) to pass to CMake during build config.

## Disclaimer
This is a work in progress, and we apologize if things are not (yet) working as they should. If you run into issues, please let us know!
