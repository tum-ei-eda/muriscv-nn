# TVM Integration

This directory contains a test script to verify the integration of muRISCV-NN in the [TVM](https://github.com/apache/tvm) ML compiler project.

## Prerequisites

To reduce the download time for external dependencies, it is assumed that all the required toolchain files and simulator files are already populated in their expected directory. This can be achived as follows:

```
cd muriscvn-nn
DIR=$(pwd)

# Toolchain
cd $DIR/Toolchain && ./download_rv32gc.sh
cd $DIR/Toolchain && ./download_rv32gcp.sh
cd $DIR/Toolchain && ./download_rv32gcv.sh

# Sim (comment in others if required)
# cd $DIR/Sim/Spike/bin && ./download.sh
# cd $DIR/Sim/ETISS/bin && virtualenv -p python3.8 .venv && source .venv/bin/activate && python setup_etiss.py && deactivate
cd $DIR/Sim/OVPsim/bin && ./download.sh
```

## Usage

Just execute:

```
./tvm_integration_tests.sh
```

This might take a lot of time! Feel free to disable some models or simulators inside the script to reduce the runtime.
