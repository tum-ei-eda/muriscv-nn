#!/bin/bash
# TODO: docs and license

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BUILD_DIR=$SCRIPT_DIR/build
GEN_DIR=$SCRIPT_DIR/gen
ELF_DIR=$SCRIPT_DIR/elf
MURISCVNN_DIR=$SCRIPT_DIR/../..
TOOLCHAINS_DIR=$MURISCVNN_DIR/Toolchain
SIM_DIR=$MURISCVNN_DIR/Sim

mkdir -p $BUILD_DIR
mkdir -p $GEN_DIR

$SCRIPT_DIR/download_models.sh

MODELS=($SCRIPT_DIR/models/*.tflite)

# Compiliation parameters
TARGET=c
EXTRA_TARGET=cmsis-nn
BUILD_TYPE=Release            # Debug/Release
VLEN=512                      # Vector length parameter passed to simulator
SIMULATOR=OVPsim

VENV_DIR=$SCRIPT_DIR/.venv

function install_tvm () {
    echo "Installing TVM into virtual environment..."
    virtualenv -p python3.8 $VENV_DIR
    source $VENV_DIR/bin/activate
    # pip install "tlcpack-nightly[tvmc]" -f https://tlcpack.ai/wheels
    pip install "tlcpack-nightly" -f https://tlcpack.ai/wheels
    pip install -r requirements.txt
}

function build_muriscvnn() {
    echo "Building muRISCV-NN lib..."
    USE_VEXT=$1
    USE_PEXT=$2
    BUILD=$3
    if [[ "${USE_VEXT}" == "ON" ]]; then
        PREFIX=$TOOLCHAINS_DIR/rv32gcv
    elif [[ "${USE_PEXT}" == "ON" ]]; then
        PREFIX=$TOOLCHAINS_DIR/rv32gcp
    else
        PREFIX=$TOOLCHAINS_DIR/rv32gc
    fi
    mkdir -p $BUILD
    # TODO: replace with Scripts/build.sh
    cmake $MURISCVNN_DIR -B$BUILD -DUSE_VEXT=$USE_VEXT -DUSE_PEXT=$USE_PEXT -DTOOLCHAIN=GCC -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DRISCV_GCC_PREFIX=$PREFIX -DENABLE_TESTS=OFF
    make -C $BUILD -j`nproc`
}

function build_model () {
    echo "Building model via TVMC..."
    MODEL=$1
    USE_VEXT=$2
    USE_PEXT=$3
    MODEL_BASE="$(basename $MODEL .tflite)"
    if [[ "${USE_VEXT}" == "ON" ]]; then
        MCPU=cortex-m55
    elif [[ "${USE_PEXT}" == "ON" ]]; then
        MCPU=cortex-m33
    else
        MCPU=
    fi
    OUT_DIR=$GEN_DIR/mlf_$MODEL_BASE
    TVMC_TARGET_ARGS="--target $EXTRA_TARGET,$TARGET"
    if [[ ! -z $MCPU ]]; then
        TVMC_TARGET_ARGS="$TVMC_TARGET_ARGS --target-cmsis-nn-mcpu $MCPU"
        OUT_DIR="${OUT_DIR}_${MCPU}"
    fi

    tvmc compile $MODEL --runtime crt --executor aot --pass-config "tir.disable_vectorize=1" --pass-config "tir.usmp.enable=1" --pass-config "tir.usmp.algorithm=hill_climb" --opt-level 3 -f mlf --runtime-crt-system-lib 0 --target-c-constants-byte-alignment 4 --target-c-workspace-byte-alignment 4 --target-c-executor aot --target-c-unpacked-api 1 --target-c-interface-api c $TVMC_TARGET_ARGS --output $OUT_DIR.tar

    mkdir -p $OUT_DIR

    tar xf $OUT_DIR.tar -C $OUT_DIR
    rm $OUT_DIR.tar
}

function compile_model () {
    echo "Compiling Target SW..."
    MLF=$1
    USE_VEXT=$2
    USE_PEXT=$3
    ELF=$4

    # Build TVM runtime
    cd $MLF/runtime
    # TODO: find out why this does not work: PREFIX=/work/git/prj/muric/muriscv-nn/Toolchain/rv32gc/bin/riscv32-unknown-elf-
    # TODO: get rid of warning stuff
    if [[ "${USE_VEXT}" == "ON" ]]; then
        PREFIX=$TOOLCHAINS_DIR/rv32gcv
        BUILD=$BUILD_DIR/muriscvnn_vext
    elif [[ "${USE_PEXT}" == "ON" ]]; then
        PREFIX=$TOOLCHAINS_DIR/rv32gcp
        BUILD=$BUILD_DIR/muriscvnn_pext
    else
        PREFIX=$TOOLCHAINS_DIR/rv32gc
        BUILD=$BUILD_DIR/muriscvnn_default
    fi
    PREFIX="$PREFIX/bin/riscv32-unknown-elf"
    make common -j$(nproc) \
        CRT_CONFIG=$SCRIPT_DIR/crt_config.h \
        CC=$PREFIX-gcc \
        CXX=$PREFIX-g++ \
        RANLIB=$PREFIX-ranlib \
        EXTRA_CFLAGS="-Wno-error=incompatible-pointer-types"
   cd -

   KERNEL_SRCS=$(find $MLF/codegen/host/src -name "*.c")

   # Build target SW and kernels
   # TODO: convert into makefile
   $PREFIX-gcc -o $ELF $SCRIPT_DIR/sw/main.c ${KERNEL_SRCS} \
       -I${MLF}/runtime/include/ \
       -I${MLF}/codegen/host/include \
       -I${MURISCVNN_DIR}/Include/CMSIS/NN/Include/ \
       -I${MURISCVNN_DIR}/Include/ \
       -L${BUILD}/Source/ \
       -L${MLF}/runtime/build/ \
       -lmuriscv_nn \
       -lcommon \
       -Wno-implicit-function-declaration \
       -Wno-incompatible-pointer-types \
       -Wno-attributes

}

function run_model () {
    echo "Running Model..."
    ELF=$1
    USE_VEXT=$2
    USE_PEXT=$3
    if [[ "${USE_VEXT}" == "ON" ]]; then
        ARCH=rv32gcv
    elif [[ "${USE_PEXT}" == "ON" ]]; then
        ARCH=rv32gcp
    else
        ARCH=rv32gc
    fi

    # Host?
    # $ELF

    $SIM_DIR/$SIMULATOR/run.sh $ELF $ARCH $VLEN 1
}

install_tvm

build_muriscvnn OFF OFF $BUILD_DIR/muriscvnn_default
build_muriscvnn ON OFF $BUILD_DIR/muriscvnn_vext
build_muriscvnn OFF ON $BUILD_DIR/muriscvnn_pext

for model in "${MODELS[@]}"; do
   model_base=$(basename $model .tflite)
   echo "=== Model: ${model_base} ==="

   # default
   echo "\n--- default ---"
   build_model $model OFF OFF
   compile_model $GEN_DIR/mlf_${model_base}/ OFF OFF $ELF_DIR/${model_base}_default.elf
   run_model $ELF_DIR/${model_base}_default.elf OFF OFF

   # vext -> mvei
   echo "\n--- vext ---"
   build_model $model ON OFF
   compile_model $GEN_DIR/mlf_${model_base}/ ON OFF $ELF_DIR/${model_base}_vext.elf
   run_model $ELF_DIR/${model_base}_vext.elf ON OFF

   # pext -> dsp
   echo "\n--- pext ---"
   build_model $model OFF ON
   compile_model $GEN_DIR/mlf_${model_base}/ OFF ON $ELF_DIR/${model_base}_pext.elf
   run_model $ELF_DIR/${model_base}_pext.elf OFF ON
done

