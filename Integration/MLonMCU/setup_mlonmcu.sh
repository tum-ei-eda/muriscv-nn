#!/usr/bin/env bash

set -e

source common.sh

###################
# Cmdline parsing #
###################


# Process all options supplied on the command line
while getopts ':h-:' 'OPTKEY'; do
    case ${OPTKEY} in
        -)
        case "${OPTARG}" in
            'enable-tflm')
                ENABLE_TFLM=1
                ;;
            'enable-tvm')
                ENABLE_TVM=1
                ;;
            'enable-spike')
                ENABLE_SPIKE=1
                ;;
            'enable-etiss')
                ENABLE_ETISS=1
                ;;
            'enable-ovpsim')
                ENABLE_OVPSIM=1
                ;;
            'enable-default')
                ENABLE_DEFAULT=1
                ;;
            'enable-vext')
                ENABLE_VEXT=1
                ;;
            'enable-pext')
                ENABLE_PEXT=1
                ;;
            'enable-gcc')
                ENABLE_GCC=1
                ;;
            'enable-llvm')
                ENABLE_LLVM=1
                ;;
            'enable-rv64')
                ENABLE_RV64=1
                ;;
            'local-etiss')
                LOCAL_ETISS=1
                ;;
            'local-spike')
                LOCAL_SPIKE=1
                ;;
            'local-ovpsim')
                LOCAL_OVPSIM=1
                ;;
            'local-gcc')
                LOCAL_GCC=1
                ;;
            'local-llvm')
                LOCAL_LLVM=1
                ;;
            'prebuilt-tvm')
                PREBUILT_TVM=1
                ;;
            *)
                    if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                        echo "Unknown option --${OPTARG}" >&2
                    fi
                    ;;
            esac;;
        'h')
            echo "HELP"
            exit 0
            ;;
        '?')
            echo "INVALID OPTION -- ${OPTARG}" >&2
            exit 1
            ;;
        ':')
            echo "MISSING ARGUMENT for option -- ${OPTARG}" >&2
            exit 1
            ;;
        *)
            echo "UNIMPLEMENTED OPTION -- ${OPTKEY}" >&2
            exit 1
            ;;
    esac
done

# check choices
if [[ "$ENABLE_TFLM" -eq 0 && "$ENABLE_TVM" -eq 0 ]]
then
    echo "Either --enable-tflm or --enable-tvm have to be used." >&2
    exit 1
fi

if [[ "$ENABLE_SPIKE" -eq 1 ]]
then
    if [[ "$LOCAL_SPIKE" -eq 1 ]]
    then
        if [[ ! -f $SCRIPT_DIR/../../Sim/Spike/bin/spike ]]
        then
            echo "Could not find local spike installation in $SCRIPT_DIR/../../Sim/Spike/bin/spike. Please either set LOCAL_SPIKE=0 or download spike!" >&2
            exit 1
        fi
    fi
fi

if [[ "$ENABLE_ETISS" -eq 1 ]]
then
    if [[ "$LOCAL_ETISS" -eq 1 ]]
    then
        if [[ ! -f $SCRIPT_DIR/../../Sim/ETISS/etiss-master/build/bin/bare_etiss_processor ]]
        then
            echo "Could not find local etiss installation in $SCRIPT_DIR/../../Sim/ETISS/etiss-master/build/bin/. Please either set LOCAL_ETISS=0 or download etiss!" >&2
            exit 1
        fi
    fi
fi

if [[ "$ENABLE_OVPSIM" -eq 1 ]]
then
    if [[ "$LOCAL_OVPSIM" -eq 1 ]]
    then
        if [[ ! -f $SCRIPT_DIR/../../Sim/OVPsim/bin/riscvOVPsimPlus ]]
        then
            echo "Could not find local ovpsim installation in $SCRIPT_DIR/../../Sim/OVPsim/bin/. Please install ovpsim first!" >&2
            exit 1
        fi
    fi
fi

if [[ "$LOCAL_GCC" -eq 1 ]]
then
    if [[ "$ENABLE_DEFAULT" -eq 1 ]]
    then
        if [[ ! -d $SCRIPT_DIR/../../Toolchain/rv32gc/ ]]
        then
            echo "Could not find local rv32gc installation in $SCRIPT_DIR/../../Toolchain/. Please download it first!" >&2
            exit 1
        fi
    fi
    if [[ "$ENABLE_PEXT" -eq 1 ]]
    then
        if [[ ! -d $SCRIPT_DIR/../../Toolchain/rv32gcp/ ]]
        then
            echo "Could not find local rv32gcp installation in $SCRIPT_DIR/../../Toolchain/. Please download it first!" >&2
            exit 1
        fi
    fi
    if [[ "$ENABLE_VEXT" -eq 1 ]]
    then
        if [[ ! -d $SCRIPT_DIR/../../Toolchain/rv32gcv/ ]]
        then
            echo "Could not find local rv32gcv installation in $SCRIPT_DIR/../../Toolchain/. Please download it first!" >&2
            exit 1
        fi
    fi
fi

if [[ "$LOCAL_LLVM" -eq 1 ]]
then
    if [[ ! -d $SCRIPT_DIR/../../Toolchain/llvm/ ]]
    then
        echo "Could not find local llvm installation in $SCRIPT_DIR/../../Toolchain/. Please download it first!" >&2
        exit 1
    fi
fi

################
# Setup Python #
################

virtualenv -p python3 $VENV_DIR

source $VENV_DIR/bin/activate

# install mlonmcu from repository
pip install git+https://github.com/tum-ei-eda/mlonmcu.git@${MLONMCU_REF}


if [[ "$PREBUILT_TVM" -eq 1 ]]
then
    # pip install "tlcpack-nightly==$TLCPACK_VERSION" -f https://tlcpack.ai/wheels
    # pip install "tlcpack-nightly" -f https://tlcpack.ai/wheels
    pip install "apache-tvm>=0.12.0" --pre
fi


#################
# Setup MLonMCU #
#################

# Initialize an environment from template


TEMPLATE_ARGS="-c enable_tflm=$ENABLE_TFLM enable_tvm=$ENABLE_TVM enable_spike=$ENABLE_SPIKE enable_etiss=$ENABLE_ETISS enable_ovpsim=$ENABLE_OVPSIM enable_default=$ENABLE_DEFAULT enable_pext=$ENABLE_PEXT enable_vext=$ENABLE_VEXT local_etiss=$LOCAL_ETISS local_spike=$LOCAL_SPIKE local_ovpsim=$LOCAL_OVPSIM mlif_ref=$MLIF_REF tflm_ref=$TFLM_REF tvm_ref=$TVM_REF etiss_ref=$ETISS_REF spike_ref=$SPIKE_REF spikepk_ref=$SPIKEPK_REF prebuilt_tvm=$PREBUILT_TVM enable_gcc=$ENABLE_GCC enable_llvm=$ENABLE_LLVM local_gcc=$LOCAL_GCC local_llvm=$LOCAL_LLVM enable_rv64=$ENABLE_RV64"
echo "TEMPLATE_ARGS=$TEMPLATE_ARGS"


mlonmcu init $WORKSPACE_DIR -t environment.yml.j2 --non-interactive --clone-models --allow-exists $TEMPLATE_ARGS

# Install environment-specific Python pkgs
mlonmcu setup -g -H $WORKSPACE_DIR
pip install -r $WORKSPACE_DIR/requirements_addition.txt

# Install dependencies (this might take a long time)
mlonmcu setup -H $WORKSPACE_DIR -v
