#!/bin/bash
# TODO: docs and license

set -e

source common.sh

##################
# Default config #
##################

VERBOSE=0

# TFLM
ENABLE_TFLM=0

# TVM
ENABLE_TVM=0

# Host x86
ENABLE_HOST=0

# Spike
ENABLE_SPIKE=0

# OVPSim
ENABLE_OVPSIM=0

# ETISS
ENABLE_ETISS=0

# RISC-V GCC
ENABLE_DEFAULT=0
ENABLE_PEXT=0
ENABLE_VEXT=0

MODELS=""

VLEN=512 # Vector length parameter passed to simulator


###################
# Cmdline parsing #
###################

# Process all options supplied on the command line
while getopts ':v:h-:' 'OPTKEY'; do
    case ${OPTKEY} in
        -)
        case "${OPTARG}" in
            'enable-tflm')
                ENABLE_TFLM=1
                ;;
            'enable-tvm')
                ENABLE_TVM=1
                ;;
            'enable-host')
                ENABLE_HOST=1
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
            *)
                    if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                        echo "Unknown option --${OPTARG}" >&2
                    fi
                    ;;
            esac;;
        'v')
            VERBOSE=1
            ;;
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

shift $(( OPTIND - 1 ))
[[ "${1}" == "--" ]] && shift

NUM_MODELS=0
for i in $(seq 1 1 $#)
do
  MODEL=${@:$i:1}
  MODELS="$MODELS $MODEL"
  NUM_MODELS=$(expr $NUM_MODELS + 1)
done

if [[ "$NUM_MODELS" -eq 0 ]]
then
  echo "No models passed to the script. Aborting..." >&2
  exit 1
fi

# check choices
if [[ "$ENABLE_TFLM" -eq 0 && "$ENABLE_TVM" -eq 0 ]]
then
    echo "Either --enable-tflm or --enable-tvm have to be used." >&2
    exit 1
fi


source $VENV_DIR/bin/activate

COMPILE_THREADS=$(expr `nproc` / $NUM_MODELS)

BACKEND_ARGS=""
TARGET_ARGS_DEFAULT=""
TARGET_ARGS_VEXT=""
TARGET_ARGS_PEXT=""
CONFIG_ARGS="--config mlif.num_threads=$COMPILE_THREADS"
# FEATURE_ARGS="--feature debug --feature validate"
#FEATURE_ARGS="--feature debug"
FEATURE_ARGS=""

if [[ "$ENABLE_TFLM" -eq 1 ]]
then
    BACKEND_ARGS="$BACKEND_ARGS --backend tflmi"
    FEATURE_ARGS="$FEATURE_ARGS --feature muriscvnn"
fi

if [[ "$ENABLE_TVM" -eq 1 ]]
then
    BACKEND_ARGS="$BACKEND_ARGS --backend tvmaotplus"
    FEATURE_ARGS="$FEATURE_ARGS --feature muriscvnnbyoc"
fi

if [[ "$ENABLE_HOST" -eq 1 ]]
then
    TARGET_ARGS_DEFAULT="$TARGET_ARGS --target host_x86"
fi

if [[ "$ENABLE_SPIKE" -eq 1 ]]
then
    TARGET_ARGS_DEFAULT="$TARGET_ARGS --target spike"
    TARGET_ARGS_VEXT="$TARGET_ARGS --target spike"
    TARGET_ARGS_PEXT="$TARGET_ARGS --target spike"
fi

if [[ "$ENABLE_OVPSIM" -eq 1 ]]
then
    TARGET_ARGS_DEFAULT="$TARGET_ARGS --target ovpsim"
    TARGET_ARGS_VEXT="$TARGET_ARGS --target ovpsim"
    TARGET_ARGS_PEXT="$TARGET_ARGS --target ovpsim"
fi

if [[ "$ENABLE_ETISS" -eq 1 ]]
then
    TARGET_ARGS_DEFAULT="$TARGET_ARGS --target etiss_pulpino"
fi

EXTRA_ARGS=""

if [[ "$VERBOSE" -eq 1 ]]
then
  EXTRA_ARGS="$EXTRA_ARGS -v"
fi


if [[ "$ENABLE_DEFAULT" -eq 1 ]]
then
    # run, default
    [[ "$VERBOSE" -eq 1 ]] && echo mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_DEFAULT $FEATURE_ARGS $CONFIG_ARGS $EXTRA_ARGS
    mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_DEFAULT $FEATURE_ARGS $CONFIG_ARGS $EXTRA_ARGS
fi


if [[ "$ENABLE_PEXT" -eq 1 ]]
then
    # run, pext
    [[ "$VERBOSE" -eq 1 ]] && echo mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_PEXT $FEATURE_ARGS $CONFIG_ARGS --feature pext $EXTRA_ARGS
    mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_PEXT $FEATURE_ARGS $CONFIG_ARGS --feature pext $EXTRA_ARGS
fi

if [[ "$ENABLE_VEXT" -eq 1 ]]
then
    # run, vext
    [[ "$VERBOSE" -eq 1 ]] && echo mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_VEXT $FEATURE_ARGS $CONFIG_ARGS --feature vext --config vext.vlen=$VLEN $EXTRA_ARGS
    mlonmcu flow run $MODELS -H $WORKSPACE_DIR --parallel --progress $BACKEND_ARGS $TARGET_ARGS_VEXT $FEATURE_ARGS $CONFIG_ARGS --feature vext --config vext.vlen=$VLEN $EXTRA_ARGS
fi
