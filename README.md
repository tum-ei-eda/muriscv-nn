<p align="center">
  <img width="800" src="./muriscv_nn_badge.png">
</p>

[![GitHub license](https://img.shields.io/github/license/tum-ei-eda/mlonmcu.svg)](https://github.com/tum-ei-eda/mlonmcu/blob/main/LICENSE)
![Build](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/build.yml/badge.svg)
![Scalar Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_scalar.yml/badge.svg)
![Vector V Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_vector.yml/badge.svg)
![Packed P Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/test_packed.yml/badge.svg)
<!-- ![TFLM Integration Tests]https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/tflm_integration_ovpsim.yml/badge.svg)-->

# muRISCV-NN
muRISCV-NN is a collection of efficient deep learning kernels for embedded platforms and microcontrollers. It is based on ARM's [CMSIS-NN](https://github.com/ARM-software/CMSIS_5/tree/develop/CMSIS/NN) library but targets the [RISC-V ISA](https://en.wikipedia.org/wiki/RISC-V) instead.

It offers accelerated kernels using the [RISC-V "V" vector](https://github.com/riscv/riscv-v-spec) extension v1.0, and the [RISC-V packed "P"](https://github.com/riscv/riscv-p-spec) extension v0.9.6.

## Integration
muRISCV-NN aims to stay functionally equivalent to CMSIS-NN so that no functional difference should be noticeable to users of either CMSIS-NN or muRISCV-NN. This way, muRISCV-NN acts as a drop-in replacement for CMSIS-NN and can be used with embedded deep learning frameworks such as [TensorFlow Lite for Microcontrollers](https://github.com/tensorflow/tflite-micro) (TFLM) or [microTVM](https://github.com/apache/tvm).

We provide integration for both [TFLM](./Integration/tflm) and [microTVM](./Integration/tvm) in the [`Integration/`](./Integration) directory. Using these deep learning frameworks, we are able to run the complete suit of [MLPerf Tiny Deep Learning Benchmarks](https://github.com/mlcommons/tiny) consisting of MobileNet, ResNet, and AutoEncoder models.

## Simulation
You can simulate muRISCV-NN using a number of different simulators. We provide support for instruction-level simulators (such as [Spike](https://github.com/riscv-software-src/riscv-isa-sim) or [riscvOVPsim](https://github.com/riscv-admin/riscv-ovpsim)), as well as register transfer level (RTL) implementations ([Vicuna](https://github.com/vproc/vicuna) running on [Verilator](https://github.com/verilator/verilator)).

Please refer to the [`Sim/`](./Sim) directory for more information on each simulator and its corresponding files.

## Tests
In order to ensure functional correctness on an individual kernel level, we provide a suite of unit tests in [`Tests/`](./Tests). The unit tests use the same data as upstream [CMSIS-NN](https://github.com/ARM-software/CMSIS_5/tree/develop/CMSIS/NN), thus ensuring functional equivalency.

## Toolchain
muRISCV-NN supports both the [RISC-V GNU Compiler](https://github.com/riscv-collab/riscv-gnu-toolchain) vector toolchain and [LLVM](https://llvm.org/) (which has built-in RISC-V vector support). We provide pre-compiled toolchains in the [`Toolchain/`](./Toolchain) directory. Additionally, we also offer instructions on how to compile and install your own toolchain.

## Upstream CMSIS-NN
muRISCV-NN is not a GIT fork "in the traditional sense". Instead, we aim to pull in changes from "upstream" CMSIS-NN manually on a regular basis in order to stay consistent and up-to-date. A direct fork would not make much sense, as our code differs too much in functionality and naming compared to CMSIS-NN.

The latest upstream CMSIS-NN commit muRISCV-NN is based on is `8ec46de` (only respecting commits affecting the [`CMSIS/NN/`](https://github.com/ARM-software/CMSIS_5/tree/develop/CMSIS/NN) directory).

## Performance
When running ResNet on [TensorFlow Lite for Microcontrollers](https://github.com/tensorflow/tflite-micro) (TFLM), muRISCV-NN delivers close to **100x** dynamic instruction count reduction:

|Kernels    |Extension |VLEN |Dynamic Instr. [x10^6] |
|-----------|----------|-----|-----------------------|
|Baseline   |-         |-    |688                    |
|muRISCV-NN |-         |-    |62.5                   |
|muRISCV-NN |P-Ext.    |-    |49.5                   |
|muRISCV-NN |V-Ext.    |64   |12.3                   |
|muRISCV-NN |V-Ext.    |128  |9.67                   |
|muRISCV-NN |V-Ext.    |256  |8.41                   |
|muRISCV-NN |V-Ext.    |512  |7.47                   |
|muRISCV-NN |V-Ext.    |1024 |7.21                   |

Stay tuned for more performance numbers in the near future!

## Disclaimer
This is a work in progress, and we apologize if things are not (yet) working as they should. If you run into issues, please let us know! 
