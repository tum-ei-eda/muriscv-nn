#!/bin/bash

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "Hey, you should source this script, not execute it!"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR=$SCRIPT_DIR/workspace
MURISCVNN_DIR=$SCRIPT_DIR/../..
TOOLCHAINS_DIR=$MURISCVNN_DIR/Toolchain
SIM_DIR=$MURISCVNN_DIR/Sim
VENV_DIR=$SCRIPT_DIR/venv
