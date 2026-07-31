#!/usr/bin/env bash

set -u

NOOP=${NOOP:-0}
PYTHON=${PYTHON:-python3}

status=0

if ! command -v "$PYTHON" >/dev/null 2>&1; then
  echo "error: Python executable not found: $PYTHON" >&2
  exit 2
fi

for module in black flake8; do
  if ! "$PYTHON" -c "import ${module}" >/dev/null 2>&1; then
    echo "error: Python module '${module}' is not installed in the current environment." >&2
    echo "       Python executable: $("$PYTHON" -c 'import sys; print(sys.executable)')" >&2
    status=2
  fi
done

if (( status != 0 )); then
  exit "$status"
fi

python_files=()

while IFS= read -r -d '' file; do
  python_files+=("$file")
done < <(git ls-files -z -- '*.py')

if (( ${#python_files[@]} == 0 )); then
  echo "No tracked Python files found."
  exit 0
fi

if [[ "$NOOP" == "0" ]]; then
  echo "Formatting Python files with Black..."

  if ! "$PYTHON" -m black -- "${python_files[@]}"; then
    status=1
  fi
else
  echo "Checking Python formatting with Black..."

  # --diff prints the required changes.
  # --check returns nonzero when formatting is required.
  if ! "$PYTHON" -m black --check --diff -- "${python_files[@]}"; then
    status=1
  fi
fi

echo "Checking Python files with flake8..."

if ! "$PYTHON" -m flake8 -- "${python_files[@]}"; then
  status=1
fi

exit "$status"
