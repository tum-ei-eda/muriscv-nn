# ML on MCU Integration

This directory contains a test script to verify the integration of muRISCV-NN in the [MLonMCU](https://github.com/tum-ei-eda/mlonmcu) project.

## Prerequisites

To reduce the download time for external dependencies, it is assumed that all the required toolchain files and simulator files are already populated in their expected directory. This can be achived as follows:

```
cd muriscvn-nn
DIR=$(pwd)

# Toolchain
cd $DIR/Toolchain && ./download_rv32gc.sh
cd $DIR/Toolchain && ./download_rv32gcp.sh
cd $DIR/Toolchain && ./download_rv32gcv.sh

# Sim
cd $DIR/Sim/Spike/bin && ./download.sh
cd $DIR/Sim/OVPsim/bin && ./download.sh
cd $DIR/Sim/ETISS/bin && virtualenv -p python3.8 .venv && source .venv/bin/activate && python setup_etiss.py && deactivate
```

Further the script use Python3.8 and assumes that the Virtualenv package is installed on the machine.

## Usage

Just execute:

```
./mlonmcu_integration_tests.sh
```

This might take a lot of time! Feel free to disable some models or targets inside the script to reduce the runtime.
