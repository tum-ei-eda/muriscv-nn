# ML on MCU Integration

This directory contains a test script to verify the integration of muRISCV-NN in the [MLonMCU](https://github.com/tum-ei-eda/mlonmcu) project.

## Prerequisites

To reduce the download time for external dependencies, it is assumed that all the required toolchain files and simulator files are already populated in their expected directory. This can be achieved as follows:

```
cd muriscv-nn
DIR=$(pwd)

# Toolchain (comment in/out others if (not) required)
cd $DIR/Toolchain && ./download_rv32gc.sh && cd -
cd $DIR/Toolchain && ./download_rv32gcp.sh && cd -
cd $DIR/Toolchain && ./download_rv32gcv.sh && cd -

# Sim (comment in/out others if (not) required)
# cd $DIR/Sim/Spike/ && ./build_spike.sh && cd -
# cd $DIR/Sim/ETISS/ && virtualenv -p python3.8 .venv && source .venv/bin/activate && pip install -r requirements.txt && python setup_etiss.py && deactivate && cd -
```

Simulators can also be automatically installed with MLonMCU (recommended).

Further the script use Python3.8 and assumes that the Virtualenv package is installed on the machine.

Now setup MLonMCU and all its dependencies:

```
./setup_mlonmcu.sh --enable-tflm --enable-tvm --enable-spike --enable-vext --enable-gcc --enable-llvm
```

## Usage

### Integration Tests

Just execute:

```
# 4 Models using TFLM on Spike simulator
./mlonmcu_integration_tests.sh --enable-tflm --enable-spike aww vww resnet toycar

# 1 Model using TVm on Spike Simulator
./mlonmcu_integration_tests.sh --enable-tvm --enable-spike toycar
```

This might take a lot of time! Feel free to disable some models or targets inside the script to reduce the runtime.

### Benchmarks

Execute:

```
./mlonmcu_benchmarks.sh
```

See `gen_muriscnn_benchmarks.py` for details.
