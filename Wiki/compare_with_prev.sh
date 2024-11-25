#!/bin/bash

set -e

DIR=$(dirname $(readlink -f $0))

BASE=$1
LIMIT=${2:-10000000}

BASE=${BASE/.md/.csv}
NEW=${BASE/Benchmarks/Compare}
NEW2=${NEW/.csv/.md}

FILES=$($DIR/get_prev_bench_files.sh $BASE $LIMIT)
COUNT=$(echo $FILES | wc -w)

if [[ $COUNT -gt 0 ]]
then
    python3 $DIR/compare_benchmarks.py $BASE $FILES --output $NEW --rel --join outer --metric "Run Cycles" "ROM code" --ignore auto
    python3 $DIR/compare_benchmarks.py $BASE $FILES --output $NEW2 --rel --join outer --metric "Run Cycles" "ROM code" --ignore auto
fi
