#!/bin/bash
# TODO: docs and license

set -e

source common.sh

source $VENV_DIR/bin/activate

export MLONMCU_HOME=$WORKSPACE_DIR
# python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel -f muriscvnn --autotuned
# python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel -f muriscvnn -f vext -f pext --autotuned --toolchain gcc --toolchain llvm
python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel -f muriscvnn -f vext -f pext -f auto_vectorize --autotuned --toolchain llvm
# python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 -p --parallel -f muriscvnn --autotuned toycar
# python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 --vlen 1024 --post -p --parallel -f muriscvnn --autotuned toycar
# python gen_muriscnn_benchmarks.py -b tflmi -b tvmaot -t spike --vlen 128 --vlen 1024 -p --parallel -f muriscvnn --autotuned toycar
