#!/usr/bin/env bash

set -u

# Use "latest" by default, or pin this for reproducible CI results:
#   ACTIONLINT_VERSION=1.7.12 ./Scripts/lint_ci.sh
ACTIONLINT_VERSION=${ACTIONLINT_VERSION:-latest}

# Automatically download actionlint when it is not installed.
AUTO_INSTALL=${AUTO_INSTALL:-1}

repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "error: this script must be run inside a Git repository." >&2
  exit 2
}

install_dir=${ACTIONLINT_INSTALL_DIR:-"$repo_root/.cache/actionlint"}
cached_actionlint="$install_dir/actionlint"

find_actionlint() {
  if [[ -n "${ACTIONLINT:-}" ]]; then
    if [[ -x "$ACTIONLINT" ]] || command -v "$ACTIONLINT" >/dev/null 2>&1; then
      printf '%s\n' "$ACTIONLINT"
      return 0
    fi

    echo "error: ACTIONLINT does not identify an executable: $ACTIONLINT" >&2
    return 1
  fi

  if command -v actionlint >/dev/null 2>&1; then
    command -v actionlint
    return 0
  fi

  if [[ -x "$cached_actionlint" ]]; then
    printf '%s\n' "$cached_actionlint"
    return 0
  fi

  return 1
}

install_actionlint() {
  local installer

  if [[ "$AUTO_INSTALL" == "0" ]]; then
    echo "error: actionlint was not found." >&2
    echo "       Install it manually or rerun with AUTO_INSTALL=1." >&2
    return 1
  fi

  if ! command -v curl >/dev/null 2>&1; then
    echo "error: curl is required to install actionlint." >&2
    return 1
  fi

  if ! command -v mktemp >/dev/null 2>&1; then
    echo "error: mktemp is required to install actionlint." >&2
    return 1
  fi

  mkdir -p "$install_dir" || {
    echo "error: could not create install directory: $install_dir" >&2
    return 1
  }

  installer=$(mktemp) || {
    echo "error: could not create a temporary file." >&2
    return 1
  }

  cleanup_installer() {
    rm -f "$installer"
  }
  trap cleanup_installer RETURN

  echo "actionlint was not found; installing version '$ACTIONLINT_VERSION'..."
  echo "Install directory: $install_dir"

  if ! curl \
    --fail \
    --location \
    --silent \
    --show-error \
    --output "$installer" \
    https://raw.githubusercontent.com/rhysd/actionlint/main/scripts/download-actionlint.bash; then
    echo "error: failed to download the actionlint installer." >&2
    return 1
  fi

  if ! bash "$installer" "$ACTIONLINT_VERSION" "$install_dir"; then
    echo "error: actionlint installation failed." >&2
    return 1
  fi

  if [[ ! -x "$cached_actionlint" ]]; then
    echo "error: installer did not create: $cached_actionlint" >&2
    return 1
  fi
}

if ! actionlint_cmd=$(find_actionlint); then
  install_actionlint || exit 2
  actionlint_cmd=$cached_actionlint
fi

echo "Using: $("$actionlint_cmd" -version)"
echo

cd "$repo_root" || exit 2

if (( $# > 0 )); then
  # Check only paths explicitly supplied by the caller.
  "$actionlint_cmd" "$@"
  exit $?
fi

# With no file arguments, actionlint discovers all workflows under
# .github/workflows itself.
"$actionlint_cmd"
