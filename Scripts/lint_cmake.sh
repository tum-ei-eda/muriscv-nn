#!/usr/bin/env bash

NOOP=${NOOP:-0}
status=0

while IFS= read -r -d '' file; do
  if [[ "$NOOP" == "0" ]]; then
    if ! cmake-format \
      --config-files .cmake-format.yaml \
      -i \
      -- "$file"; then
      echo "Failed to format: $file" >&2
      status=1
    fi
    continue
  fi

  formatted_file=$(mktemp) || exit 2

  if ! cmake-format \
    --config-files .cmake-format.yaml \
    -- "$file" >"$formatted_file"; then
    echo "Failed to format: $file" >&2
    rm -f "$formatted_file"
    status=1
    continue
  fi

  diff -u \
    --label "$file" \
    --label "$file (formatted)" \
    "$file" "$formatted_file"

  diff_status=$?
  rm -f "$formatted_file"

  case "$diff_status" in
    0) ;;
    1) status=1 ;;
    *)
      echo "Failed to diff: $file" >&2
      status=1
      ;;
  esac
done < <(
  git ls-files -z \
    'CMakeLists.txt' \
    '**/CMakeLists.txt' \
    '*.cmake' \
    '**/*.cmake'
)

echo RC=$status

exit "$status"
