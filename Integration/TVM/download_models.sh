#!/bin/bash
# TODO: docs and license

set -e

# MODELS=(sine_model cifar10 simple_mnist micro_speech magic_wand aww vww resnet toycar)
MODELS=(aww vww resnet toycar)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MODELS_DIR=$SCRIPT_DIR/models
mkdir -p $MODELS_DIR

for model in "${MODELS[@]}"; do
    if [[ ! -f $MODELS_DIR/$model.tflite ]]; then
        echo "Downloading ${model}.tflite ..."
        wget -q https://raw.githubusercontent.com/tum-ei-eda/mlonmcu-models/main/$model/$model.tflite -O $MODELS_DIR/$model.tflite
    fi
done
