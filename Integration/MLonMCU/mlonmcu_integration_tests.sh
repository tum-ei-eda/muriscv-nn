#!/bin/bash
# TODO: docs and license

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

WORKSPACE_DIR=$SCRIPT_DIR/workspace
MURISCVNN_DIR=$SCRIPT_DIR/../..
TOOLCHAINS_DIR=$MURISCVNN_DIR/Toolchain
SIM_DIR=$MURISCVNN_DIR/Sim

# MODELS="aww vww resnet toycar"
MODELS="toycar"

VLEN=512                      # Vector length parameter passed to simulator

VENV_DIR=$SCRIPT_DIR/.venv

# install mlonmcu
    virtualenv -p python3.8 $VENV_DIR
    source $VENV_DIR/bin/activate
    pip install -r requirements.txt

mlonmcu init $WORKSPACE_DIR -t environment.yml.j2  --non-interactive --clone-models --allow-exists

mlonmcu setup -H $WORKSPACE_DIR

BACKEND_ARGS="--backend tflmi"
TARGET_ARGS_DEFAULT="--target host_x86 --target etiss_pulpino --target spike --target ovpsim"
TARGET_ARGS_PEXT_VEXT="--target spike --target ovpsim"
CONFIG_ARGS="--config mlif.num_threads=2"
FEATURE_ARGS="--feature debug --feature validate"

# run, default
mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_DEFAULT $FEATURE_ARGS $CONFIG_ARGS --feature muriscvnn

# run, pext
mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_PEXT_VEXT $FEATURE_ARGS $CONFIG_ARGS --feature muriscvnn --feature pext

# run, vext
mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_PEXT_VEXT $FEATURE_ARGS $CONFIG_ARGS --feature muriscvnn --feature vext --config vext.vlen=$VLEN
