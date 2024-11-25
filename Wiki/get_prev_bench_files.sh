#!/bin/bash

set -e


BASE=$1
LIMIT=${2:-10000000}


BASE_DATE=$(echo $BASE | cut -d'-' -f2-4)
# echo BASE_DATE=$BASE_DATE
REST=$(echo $BASE | cut -d'-' -f5-)
# echo REST=$REST
FILES=$(ls Benchmarks-*-$REST | grep -v $BASE_DATE | sort -r | head -$LIMIT)
# echo FILES=$FILES
echo $FILES
