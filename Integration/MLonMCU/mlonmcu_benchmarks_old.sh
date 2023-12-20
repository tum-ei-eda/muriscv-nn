#!/bin/bash
# TODO: docs and license

set -e

source common.sh

source $VENV_DIR/bin/activate

TIMESTAMP=$(date +%Y%m%dT%H%M%S)

export MLONMCU_HOME=$WORKSPACE_DIR

PARALLEL=$(($(nproc) / 4))

python gen_muriscnn_benchmarks.py -b tflmi -t spike --vlen 64 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f pext --toolchain gcc --scalar-default-only --label ${TIMESTAMP}-tflm-gcc --baseline 1
python gen_muriscnn_benchmarks.py -b tvmaot -t spike --vlen 64 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f pext --autotuned --toolchain gcc --scalar-default-only --label ${TIMESTAMP}-tvm-gcc --baseline 4
