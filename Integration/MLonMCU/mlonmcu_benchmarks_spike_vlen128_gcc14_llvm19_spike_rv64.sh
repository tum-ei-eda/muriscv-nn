#!/bin/bash
# TODO: docs and license

set -e

source common.sh

source $VENV_DIR/bin/activate

TIMESTAMP=$(date +%Y%m%dT%H%M%S)

export MLONMCU_HOME=$WORKSPACE_DIR

PARALLEL=$(($(nproc) / 2))

MODELS=(aww vww resnet toycar)

for MODEL in "${MODELS[@]}"
do
    python gen_muriscnn_benchmarks.py $MODEL -b tflmi -t $TARGET --vlen 128 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f auto_vectorize --toolchain gcc --toolchain llvm --label ${TIMESTAMP}-${TARGET}-${MODEL}-tflm-gccllvm --opt 3 --opt s --unroll 0 --unroll 1 --custom-unroll 0 --custom-unroll 1 --portable --baseline 0 --skip-default
done
