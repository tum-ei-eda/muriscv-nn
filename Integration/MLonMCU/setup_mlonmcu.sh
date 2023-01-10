#!/usr/bin/env bash

set -e

source common.sh

##################
# Default config #
##################

# MLonMCU
MLONMCU_REF=main
# MLONMCU_REF=068212b7a6d392f8d032ccc867d3b06b50356ca3
MLIF_REF=2ab749d3747c04f3b01973ef955bda5be0964f0f

# TFLM
TFLM_REF=f050eec7e32a0895f7658db21a4bdbd0975087a5
ENABLE_TFLM=0

# TVM
TVM_REF=76b9ce9b1f7d2b7e64b4b9c9d456a02b8a010473
ENABLE_TVM=0
# TLCPACK_VERSION="0.10.0"
PREBUILT_TVM=1

# Spike
SPIKE_REF=0bc176b3fca43560b9e8586cdbc41cfde073e17a
SPIKEPK_REF=7e9b671c0415dfd7b562ac934feb9380075d4aa2
LOCAL_SPIKE=0
ENABLE_SPIKE=0

# OVPSim
LOCAL_OVPSIM=1
ENABLE_OVPSIM=0

# ETISS
ETISS_REF=4d2d26fb1fdb17e1da3a397c35d6f8877bf3ceab
LOCAL_ETISS=1
ENABLE_ETISS=0

# RISC-V GCC
LOCAL_GCC=1
ENABLE_DEFAULT=1
ENABLE_PEXT=1
ENABLE_VEXT=1

# LLVM
# Not supported


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
            'local-etiss')
                LOCAL_ETISS=1
                ;;
            'local-spike')
                LOCAL_SPIKE=1
                ;;
            'local-ovpsim')
                LOCAL_OVPSIM=1
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

if [[ "$LOCAL_SPIKE" -eq 1 ]]
then
    if [[ ! -f $SCRIPT_DIR/../../Sim/Spike/bin/spike ]]
    then
        echo "Could not find local spike installation in $SCRIPT_DIR/../../Sim/Spike/bin/spike. Please either set LOCAL_SPIKE=0 or download spike!" >&2
        exit 1
    fi
fi
if [[ "$LOCAL_ETISS" -eq 1 ]]
then
    if [[ ! -f $SCRIPT_DIR/../../Sim/ETISS/etiss-master/build/bin/bare_etiss_processor ]]
    then
        echo "Could not find local etiss installation in $SCRIPT_DIR/../../Sim/ETISS/etiss-master/build/bin/. Please either set LOCAL_SPIKE=0 or download spike!" >&2
        exit 1
    fi
fi
if [[ "$LOCAL_OVPSIM" -eq 1 ]]
then
    if [[ ! -f $SCRIPT_DIR/../../Sim/OVPsim/bin/riscvOVPsimPlus ]]
    then
        echo "Could not find local ovpsim installation in $SCRIPT_DIR/../../OVPsim/bin/. Please either set LOCAL_SPIKE=0 or download spike!" >&2
        exit 1
    fi
fi

################
# Setup Python #
################

virtualenv -p python3.8 $VENV_DIR
source $VENV_DIR/bin/activate

# install mlonmcu from repository
pip install git+https://github.com/tum-ei-eda/mlonmcu.git@${MLONMCU_REF}


if [[ "$PREBUILD_TVM" == "true" ]]
then
    # pip install "tlcpack-nightly==$TLCPACK_VERSION" -f https://tlcpack.ai/wheels
    pip install "tlcpack-nightly" -f https://tlcpack.ai/wheels
fi


#################
# Setup MLonMCU #
#################

# Initialize an environment from template


TEMPLATE_ARGS="-c enable_tflm=$ENABLE_TFLM enable_tvm=$ENABLE_TVM enable_spike=$ENABLE_SPIKE enable_etiss=$ENABLE_ETISS enable_ovpsim=$ENABLE_OVPSIM enable_default=$ENABLE_DEFAULT enable_pext=$ENABLE_PEXT enable_vext=$ENABLE_VEXT local_etiss=$LOCAL_ETISS local_spike=$LOCAL_SPIKE local_ovpsim=$LOCAL_OVPSIM mlif_ref=$MLIF_REF tflm_ref=$TFLM_REF tvm_ref=$TVM_REF etiss_ref=$ETISS_REF spike_ref=$SPIKE_REF spikepk_ref=$SPIKEPK_REF prebuilt_tvm=$PREBUILT_TVM"
echo "TEMPLATE_ARGS=$TEMPLATE_ARGS"


mlonmcu init $WORKSPACE_DIR -t environment.yml.j2 --non-interactive --clone-models --allow-exists $TEMPLATE_ARGS

# Install environment-specific Python pkgs
mlonmcu setup -g -H $WORKSPACE_DIR
pip install -r $WORKSPACE_DIR/requirements_addition.txt

# Install dependencies (this might take a long time)
mlonmcu setup -H $WORKSPACE_DIR -v
