<p align="center">
  <img width="800" src="./muriscv_nn_badge.png">
</p>

[![GitHub license](https://img.shields.io/github/license/tum-ei-eda/mlonmcu.svg)](https://github.com/tum-ei-eda/mlonmcu/blob/main/LICENSE)
[![CI Build](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/build.yml/badge.svg)](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/build.yml)
[![CI Unit Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/unit_tests.yml/badge.svg)](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/unit_tests.yml)
[![CI Integration Tests](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/integration_tests.yml/badge.svg)](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/integration_tests.yml)
[![CI Benchmarks](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/benchmark_test.yml/badge.svg)](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/benchmark_test.yml)
[![CI CMSIS-NN AutoSync](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/sync_with_cmsis.yml/badge.svg)](https://github.com/tum-ei-eda/muriscv-nn/actions/workflows/sync_with_cmsis.yml)


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
In order to ensure functional correctness on an individual kernel level, we provide a suite of unit tests in [`Tests/`](./Tests). The unit tests use the same data as upstream CMSIS-NN, thus ensuring functional equivalency.

## Toolchain
muRISCV-NN supports both the [RISC-V GNU Compiler](https://github.com/riscv-collab/riscv-gnu-toolchain) vector toolchain and [LLVM](https://llvm.org/) (which has built-in RISC-V vector support). We provide pre-compiled toolchains in the [`Toolchain/`](./Toolchain) directory. Additionally, we also offer instructions on how to compile and install your own toolchain.

## Compatibility

See [`COMPATIBILITY.md`](COMPATIBILITY.md) for details on supported Toolchains, Simulators, Frameworks and CMSIS-NN versions.

## Performance

See https://github.com/tum-ei-eda/muriscv-nn/wiki for detailed benchmark results.

## Publications

- **muRISCV-NN: Challenging Zve32x Autovectorization with TinyML Inference Library for RISC-V Vector Extension** (https://dl.acm.org/doi/10.1145/3637543.3652878)

  *CF '24 Companion: Proceedings of the 21st ACM International Conference on Computing Frontiers Workshops and Special Sessions*

  BibTeX:

  ```bibtex
  @inproceedings{10.1145/3637543.3652878,
    author = {van Kempen, Philipp and Jones, Jefferson Parker and Mueller-Gritschneder, Daniel and Schlichtmann, Ulf},
    title = {muRISCV-NN: Challenging Zve32x Autovectorization with TinyML Inference Library for RISC-V Vector Extension},
    year = {2024},
    isbn = {9798400704925},
    publisher = {Association for Computing Machinery},
    address = {New York, NY, USA},
    url = {https://doi.org/10.1145/3637543.3652878},
    doi = {10.1145/3637543.3652878},
    abstract = {With the rapid adoption of deep learning workloads to resource-constrained edge devices, efficient and data-parallel computing paradigms are becoming increasingly important. The RISC-V ISA provides a set of vector extensions featuring powerful data computation capabilities to accelerate deep learning workloads at the edge. However, the RISC-V ecosystem lacks a lightweight, open-source, and vendor-agnostic compute library to support these extensions on embedded platforms. After porting the existing ARM Cortex-M specific kernel implementation to the RISC-V vector ISA, we optimized the operator implementations to make the most out of the data-level parallelism provided by supported targets. In comparison to programs vectorized by LLVM's built-in auto-vectorizer, we see an up to 60\% advantage in runtime for convolutional models and large vectors while introducing less ROM overheads. Furthermore, muRISCV-NN integrates well with existing ML deployment frameworks, is bit-accurate to CMSIS-NN, and can, thus, be used as a drop-in replacement with minimal changes to the compilation flow.},
    booktitle = {Proceedings of the 21st ACM International Conference on Computing Frontiers Workshops and Special Sessions},
    pages = {75–78},
    numpages = {4},
    keywords = {Compilers, Neural Network Inference, RISC-V, Vectorization},
    location = {Ischia, Italy},
    series = {CF '24 Companion}
  }
  ```


- **From Simulation to RVV Hardware: Evaluating the muRISCV-NN TinyML Inference Library on the CanMV K230 Platform** (https://mediatum.ub.tum.de/1747602?show_id=1759366&style=full_text)

  *Student research internship*

  Disclaimer: HW got provided by RISC-V International® (See https://riscv.org/risc-v-developer-boards/details/ for details)

  BibTeX:

  ```bibtex
  @mastersthesis{,
	  author = {Witteler, Benedikt},
	  title = {From Simulation to RVV Hardware: Evaluating the muRISCV-NN TinyML Inference Library on the CanMV K230 Platform},
	  year = {2024},
	  school = {Technische Universität München},
	  month = {Oct}
  }
  ```


## Acknowledgment

<img src="./BMBF_gefoerdert_2017_en.jpg" alt="drawing" height="75" align="left" >

This research is partially funded by the German Federal Ministry of Education and Research (BMBF) within
the project [Scale4Edge](https://www.edacentrum.de/scale4edge/) (grant number 16ME0127).
