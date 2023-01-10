#!/bin/bash
# TODO: docs and license

set -e

source common.sh

source $VENV_DIR/bin/activate

export MLONMCU_HOME=$WORKSPACE_DIR
python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 64 --vlen 1024 --post -p --parallel -f muriscvnn --autotuned
