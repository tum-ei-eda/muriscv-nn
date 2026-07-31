#!/usr/bin/env bash

set -u

NOOP=${NOOP:-0}
BUILD_DIR=${BUILD_DIR:-build}
AUTO_CONFIGURE=${AUTO_CONFIGURE:-1}
CMAKE=${CMAKE:-cmake}
CLANG_TIDY=${CLANG_TIDY:-clang-tidy}

status=0

repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "error: this script must be run inside a Git repository." >&2
  exit 2
}

cd "$repo_root" || exit 2

clang_format_config="$repo_root/.clang-format"

if [[ ! -f "$clang_format_config" ]]; then
  echo "error: clang-format configuration not found: $clang_format_config" >&2
  exit 2
fi

find_newest_clang_format() {
  local candidate
  local version
  local best_command=""
  local best_version=""

  # Search both the unversioned command and commonly used versioned names.
  while IFS= read -r candidate; do
    command -v "$candidate" >/dev/null 2>&1 || continue

    version=$(
      "$candidate" --version 2>/dev/null |
        sed -nE 's/.*version[[:space:]]+([0-9]+([.][0-9]+)*).*/\1/p' |
        head -n1
    )

    [[ -n "$version" ]] || continue

    if [[ -z "$best_version" ]] ||
      [[ "$(printf '%s\n%s\n' "$best_version" "$version" | sort -V | tail -n1)" == "$version" &&
        "$version" != "$best_version" ]]; then
      best_command=$candidate
      best_version=$version
    fi
  done < <(
    {
      printf '%s\n' clang-format
      compgen -c | grep -E '^clang-format-[0-9]+([.][0-9]+)*$' || true
    } | sort -u
  )

  if [[ -z "$best_command" ]]; then
    return 1
  fi

  printf '%s\n' "$best_command"
}

CLANG_FORMAT=${CLANG_FORMAT:-}

if [[ -z "$CLANG_FORMAT" ]]; then
  if ! CLANG_FORMAT=$(find_newest_clang_format); then
    echo "error: clang-format was not found in PATH." >&2
    exit 2
  fi
elif ! command -v "$CLANG_FORMAT" >/dev/null 2>&1; then
  echo "error: requested clang-format executable not found: $CLANG_FORMAT" >&2
  exit 2
fi

echo "Using $("$CLANG_FORMAT" --version)"

format_files=()
source_files=()

while IFS= read -r -d '' file; do
  format_files+=("$file")

  case "$file" in
    *.c | *.cc | *.cpp | *.cxx | *.C)
      source_files+=("$file")
      ;;
  esac
done < <(
  git ls-files -z -- \
    '*.c' \
    '*.cc' \
    '*.cpp' \
    '*.cxx' \
    '*.C' \
    '*.h' \
    '*.hh' \
    '*.hpp' \
    '*.hxx' \
    '*.inc'
)

if (( ${#format_files[@]} == 0 )); then
  echo "No tracked C or C++ files found."
  exit 0
fi

if [[ "$NOOP" == "0" ]]; then
  echo "Formatting C/C++ files..."

  if ! "$CLANG_FORMAT" \
    --style=file:"$clang_format_config" \
    -i \
    -- "${format_files[@]}"; then
    status=1
  fi
else
  echo "Checking C/C++ formatting..."

  for file in "${format_files[@]}"; do
    formatted_file=$(mktemp) || {
      echo "error: failed to create temporary file." >&2
      exit 2
    }

    if ! "$CLANG_FORMAT" \
      --style=file:"$clang_format_config" \
      -- "$file" >"$formatted_file"; then
      echo "error: clang-format failed for: $file" >&2
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
      0)
        ;;
      1)
        status=1
        ;;
      *)
        echo "error: diff failed for: $file" >&2
        status=1
        ;;
    esac
  done
fi

compile_commands="$BUILD_DIR/compile_commands.json"

if [[ ! -f "$compile_commands" ]]; then
  if [[ "$AUTO_CONFIGURE" == "0" ]]; then
    echo "error: compilation database not found: $compile_commands" >&2
    echo "       Set AUTO_CONFIGURE=1 or configure the build directory manually." >&2
    exit 2
  fi

  if ! command -v "$CMAKE" >/dev/null 2>&1; then
    echo "error: CMake executable not found: $CMAKE" >&2
    exit 2
  fi

  echo "Creating compilation database in: $BUILD_DIR"

  if ! "$CMAKE" \
    -S "$repo_root" \
    -B "$BUILD_DIR" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON; then
    echo "error: CMake configuration failed." >&2
    exit 2
  fi
fi

if [[ ! -f "$compile_commands" ]]; then
  echo "error: CMake did not create: $compile_commands" >&2
  exit 2
fi

if ! command -v "$CLANG_TIDY" >/dev/null 2>&1; then
  echo "error: clang-tidy was not found: $CLANG_TIDY" >&2
  exit 2
fi

if (( ${#source_files[@]} == 0 )); then
  echo "No tracked C/C++ source files found for clang-tidy."
  exit "$status"
fi

echo "Running $("$CLANG_TIDY" --version | head -n1)..."

for file in "${source_files[@]}"; do
  if ! "$CLANG_TIDY" \
    -p "$BUILD_DIR" \
    "$file"; then
    status=1
  fi
done

exit "$status"
