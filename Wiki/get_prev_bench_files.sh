#!/bin/bash

set -e


BASE=$1
LIMIT=${2:-10000000}


BASE_DATE=$(printf '%s\n' "$BASE" | cut -d'-' -f2-4)
# echo BASE_DATE=$BASE_DATE
REST=$(printf '%s\n' "$BASE" | cut -d'-' -f5-)
# echo REST=$REST

mapfile -t FILES < <(
    for file in Benchmarks-*-"$REST"; do
        [[ -e "$file" ]] || continue
        [[ "$file" == *"$BASE_DATE"* ]] && continue
        printf '%s\n' "$file"
    done | sort -r | head -n "$LIMIT"
)

printf '%s\n' "${FILES[@]}"
