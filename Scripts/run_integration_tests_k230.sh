#!/bin/bash

# Configuration
BUILD_SCRIPT="./build_k230.sh"
BUILD_DIR="../build_k230_NOVEXT"
REMOTE_USER="root"
REMOTE_IP="192.168.0.117"
UART_DEVICE="/dev/ttyACM1"
BAUD_RATE="115200"

UART_SCRIPT="run_uart_commands.py"
OUTPUT_LOG="../k230_benchmarks/k230_out.log"

USE_VEXT=""
BENCHMARK=NONE
TOOLCHAIN=K230
ML_FRAMEWORK=NONE
SKIP_BUILD=OFF
MAKE_RECOMPILE=OFF

#Parse Input Args
while getopts 'vsmb:t:f:i:o:h' flag; do
  case "${flag}" in
    v) USE_VEXT="-v"
        BUILD_DIR="../build_k230_VEXT" ;;
    s) SKIP_BUILD=ON ;;
    m) MAKE_RECOMPILE=ON ;;
    b) BENCHMARK="${OPTARG}" ;;
    t) TOOLCHAIN="${OPTARG}" ;;
    o) OS="${OPTARG}";;
    f) ML_FRAMEWORK="${OPTARG}" ;;
    i) REMOTE_IP="${OPTARG}" ;;
    * | h) echo "Add -v to compile with vector extension"
           echo "Use -s to skip build (built previously)"
           echo "Use -m together to skip fresh build and only recompile by calling make"
           echo "Use -b {aww/vww/toy/ic} to select tvm benchmark to run, default: aww"
           echo "Use -t {GCC/LLVM/K230} to select toolchain. Currently only support for K230 special toolchain"
           echo "-o : Operating System (OS) running on K230 board"
           exit 1 ;;
  esac
done

if [ "${OS}" == "" ]; then
    echo "ERROR: NO OPERATING SYSTEM (OS) SELECTED:  Please select an OS with - {RTOS/Linux}"
    exit 1
fi
if [ "${BENCHMARK}" == "NONE" ]; then
    echo "ERROR: NO BENCHMARK SELECTED:  Please select a benchmark with -b {aww/vww/toy/ic}"
    exit 1
fi
if [ "${ML_FRAMEWORK}" == "NONE" ]; then
    echo "ERROR: NO ML FRAMEWORK SELECTED:  Please select a framework with -f {tflm/tvm}"
    exit 1
fi

ELF_BASE_NAME="${BENCHMARK}_${ML_FRAMEWORK}"
ELF_NAME="${ELF_BASE_NAME}.elf"
ELF_FILE="${BUILD_DIR}/Integration/${ML_FRAMEWORK}/${BENCHMARK}/${ELF_NAME}"

if [ "${USE_VEXT}" == "" ]; then
  ELF_DEST_NAME="${ELF_BASE_NAME}_NOVEXT.elf"
else
  ELF_DEST_NAME="${ELF_BASE_NAME}_VEXT.elf"
fi

# Build
if [ "${MAKE_RECOMPILE}" == ON ]; then
    make -j $(nproc) -C ${BUILD_DIR}

    if [ $? -eq 0 ]; then
    echo "Recompilation successful!"
    else
    echo "Recompilation failed! Exiting..."
    exit 1
    fi

elif [ "${SKIP_BUILD}" == OFF ]; then
    ${BUILD_SCRIPT} -t ${TOOLCHAIN} ${USE_VEXT} -a -o ${OS}

    if [ $? -eq 0 ]; then
    echo "Build successful!"
    else
    echo "Build failed! Exiting..."
    exit 1
    fi
fi


if [ "${OS}" == "RTOS" ]; then
    REMOTE_DIR="/sharefs/app"
else
    REMOTE_DIR="/home"
fi


# SCP the ELF file to the remote server
echo "Transferring ELF file to $REMOTE_IP..."
scp "${ELF_FILE}" "${REMOTE_USER}@${REMOTE_IP}:${REMOTE_DIR}/${ELF_DEST_NAME}" 
if [[ $? -ne 0 ]]; then
    echo "SCP transfer failed. Exiting."
    exit 1
fi
echo "ELF file transferred successfully."

# Get file size
FILE_SIZE=$(stat --format="%s" "$ELF_FILE")

# Run benchmark
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sudo python3 "${SCRIPTS_DIR}/${UART_SCRIPT}" "${UART_DEVICE}" "${BAUD_RATE}" "${REMOTE_DIR}" "${ELF_DEST_NAME}" "${FILE_SIZE}" "${OUTPUT_LOG}"

if [[ $? -ne 0 ]]; then
    echo ""
    echo "Serial communication and benchmark execution failed. (If your running on Windows with WSL, enable the serial ports inside the VM by running 'usbipd attach --wsl --busid <bus_id>' in a PowerShell)"
    exit 1
fi

exit 0