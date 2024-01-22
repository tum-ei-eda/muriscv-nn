#!/bin/bash
# TODO: docs and license

set -e

source common.sh

source $VENV_DIR/bin/activate

TIMESTAMP=$(date +%Y%m%dT%H%M%S)

export MLONMCU_HOME=$WORKSPACE_DIR

PARALLEL=$(($(nproc) / 2))

python gen_muriscnn_benchmarks.py -b tflmi -t spike --vlen 128 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f pext -f auto_vectorize --toolchain gcc --label ${TIMESTAMP}-tflm-gcc --baseline 0
python gen_muriscnn_benchmarks.py -b tflmi -t spike --vlen 128 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f auto_vectorize --toolchain llvm --label ${TIMESTAMP}-tflm-llvm --baseline 0
python gen_muriscnn_benchmarks.py -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f pext -f auto_vectorize --autotuned --toolchain gcc --label ${TIMESTAMP}-tvm-gcc --baseline 0
python gen_muriscnn_benchmarks.py -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel $PARALLEL -f muriscvnn -f vext -f auto_vectorize --autotuned --toolchain llvm --label ${TIMESTAMP}-tvm-llvm --baseline 0
