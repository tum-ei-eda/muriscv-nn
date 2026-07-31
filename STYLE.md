# Code Style and Static Checks

This repository provides local helper scripts and GitHub Actions checks for formatting, linting, workflow validation, and license headers.

Run local checks before pushing changes. The CI workflow in `.github/workflows/style.yml` runs automatically on pushes and pull requests and can also be started manually with `workflow_dispatch`.

## Quick start

Run all available local checks individually:

```bash
NOOP=1 ./Scripts/lint_cpp.sh
NOOP=1 ./Scripts/lint_cmake.sh
NOOP=1 ./Scripts/lint_python.sh
./Scripts/lint_ci.sh
```

Use `NOOP=0` for scripts that support automatic formatting:

```bash
NOOP=0 ./Scripts/lint_cpp.sh
NOOP=0 ./Scripts/lint_cmake.sh
NOOP=0 ./Scripts/lint_python.sh
```

`NOOP=0` modifies files in place. `NOOP=1` does not modify files; it prints formatting differences where supported and exits with a non-zero status when changes are required.

Always review automatically generated changes before committing:

```bash
git diff --stat
git diff
```

## C and C++

### Local formatting and checks

Use:

```bash
./Scripts/lint_cpp.sh
```

The script:

- Finds the configured or newest available `clang-format` executable.
- Uses the top-level `.clang-format` file.
- Checks tracked C and C++ source and header files.
- Uses `clang-tidy` for compile-database-based static checks.
- Requires a CMake compilation database at `BUILD_DIR/compile_commands.json`.
- Can configure the build directory automatically when the compilation database is missing.

Apply formatting and run checks:

```bash
NOOP=0 ./Scripts/lint_cpp.sh
```

Check without modifying files:

```bash
NOOP=1 ./Scripts/lint_cpp.sh
```

Select a build directory:

```bash
BUILD_DIR=build NOOP=1 ./Scripts/lint_cpp.sh
```

Require an existing compilation database instead of configuring one automatically:

```bash
AUTO_CONFIGURE=0 BUILD_DIR=build NOOP=1 ./Scripts/lint_cpp.sh
```

Select specific executables when needed:

```bash
CLANG_FORMAT=clang-format-20 \
CLANG_TIDY=clang-tidy-20 \
NOOP=1 ./Scripts/lint_cpp.sh
```

For reproducible results, use the same Clang major version locally and in CI. Different `clang-format` releases can produce different output from the same `.clang-format` file.

### CI behavior

The `clang-format` job:

1. Checks out the repository.
2. Configures CMake with:

   ```bash
   cmake -B build -S . \
     -DCMAKE_BUILD_TYPE=Release \
     -DTOOLCHAIN=x86 \
     -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
   ```

3. Runs `cpp-linter/cpp-linter-action` using:
   - The repository `.clang-format` file.
   - The repository `.clang-tidy` file, when present.
   - `build/compile_commands.json`.

The local script may check every tracked C or C++ file, while the CI action may check only files changed in the push or pull request depending on its configuration. Therefore, a full local formatting run can produce changes even when CI passes.

To enforce formatting across the entire repository in CI, configure the action with:

```yaml
with:
  files-changed-only: false
  lines-changed-only: false
```

A large repository-wide formatting update should preferably be committed separately from functional changes.

## CMake

### Local formatting

Use:

```bash
./Scripts/lint_cmake.sh
```

The script checks tracked `CMakeLists.txt` and `*.cmake` files using `cmake-format` and the top-level `.cmake-format.yaml` configuration.

Apply formatting in place:

```bash
NOOP=0 ./Scripts/lint_cmake.sh
```

Print formatting differences without modifying files and fail when changes are required:

```bash
NOOP=1 ./Scripts/lint_cmake.sh
```

Install the required tool in the active Python environment when necessary:

```bash
python3 -m pip install cmakelang
```

### CI behavior

The `cmake-format` job runs `PuneetMatharu/cmake-format-lint-action` with:

```text
--config-files .cmake-format.yaml --
```

The job also prints `git status` after the action. A status command alone does not fail when files were modified. The formatting action itself must run in check mode or otherwise return a non-zero status for CI to enforce clean formatting.

When changing this job, prefer an explicit check-only invocation so that CI fails whenever formatting would modify a file.

## Python

### Local formatting and linting

Use:

```bash
./Scripts/lint_python.sh
```

The script verifies that `black` and `flake8` are installed for the selected Python interpreter. It then:

- Runs Black in formatting or check mode.
- Runs flake8 in check-only mode.
- Returns a non-zero status when either tool reports a problem.

Install the tools in the active virtual environment:

```bash
python3 -m pip install black flake8
```

Apply Black formatting, then run flake8:

```bash
NOOP=0 ./Scripts/lint_python.sh
```

Print Black's proposed changes without modifying files, then run flake8:

```bash
NOOP=1 ./Scripts/lint_python.sh
```

Select a specific Python interpreter:

```bash
PYTHON=/path/to/venv/bin/python NOOP=1 ./Scripts/lint_python.sh
```

`flake8` does not automatically fix findings. Resolve its diagnostics manually.

### CI behavior

The `python-format` job:

1. Checks out the repository.
2. Sets up Python 3.10.
3. Installs `black` and `flake8`.
4. Runs both through `wearerequired/lint-action`.

Keep local and CI tool versions aligned when reproducible formatting is important. Unpinned package installation can cause behavior to change when new Black or flake8 releases are published.

## Shell scripts

### Local checking

The CI workflow checks shell scripts with ShellCheck. To run the equivalent check locally, install ShellCheck and run it on tracked shell scripts:

```bash
shellcheck $(git ls-files '*.sh')
```

ShellCheck reports correctness, portability, and quoting issues. It does not generally act as an automatic formatter.

For shell formatting, use a dedicated formatter such as `shfmt` separately:

```bash
shfmt -d Scripts/*.sh
```

Apply `shfmt` changes only after reviewing the repository's preferred shell style:

```bash
shfmt -w Scripts/*.sh
```

### CI behavior

The `shell-format` job uses `azohra/shell-linter` and then prints `git status`.

As with the CMake job, `git status` alone does not fail when a formatter modifies files. The linter action must return a non-zero status for CI enforcement, or the workflow must explicitly test that the working tree remains clean.

A generic clean-tree assertion is:

```bash
test -z "$(git status --untracked-files=no --porcelain)" || {
  echo "Formatting or linting modified tracked files."
  git status --untracked-files=no --porcelain
  exit 1
}
```

## GitHub Actions workflows

### Local validation

Use:

```bash
./Scripts/lint_ci.sh
```

With no arguments, the script asks `actionlint` to discover and check workflows under `.github/workflows`:

```bash
./Scripts/lint_ci.sh
```

Check a specific workflow:

```bash
./Scripts/lint_ci.sh .github/workflows/benchmark_test.yml
```

The script can download `actionlint` into a repository-local cache when it is not already available.

Disable automatic installation:

```bash
AUTO_INSTALL=0 ./Scripts/lint_ci.sh
```

Pin a specific actionlint version:

```bash
ACTIONLINT_VERSION=1.7.12 ./Scripts/lint_ci.sh
```

Select an existing executable explicitly:

```bash
ACTIONLINT=/path/to/actionlint ./Scripts/lint_ci.sh
```

`actionlint` validates GitHub Actions workflow syntax and semantics. It is not an automatic YAML formatter.

Use a separate YAML formatter when desired, but review its changes carefully because GitHub Actions expressions, quoting, and multiline shell blocks can be sensitive to generic YAML rewriting.

### CI behavior

The `actionlint` job:

1. Checks out the repository.
2. Downloads actionlint using the project's download script.
3. Runs actionlint with colored output.

For deterministic CI behavior, pin the actionlint release rather than always downloading the latest version.

## License headers

The `license-check` CI job installs `licenseheaders`, downloads the Apache 2.0 template, and applies it to configured file extensions.

The job checks these extensions:

```text
py cmake yml sh md
```

It uses the following metadata:

```text
Owner:   TUM Department of Electrical and Computer Engineering
Project: muRISCV-NN
Year:    2023
URL:     https://github.com/tum-ei-eda/muriscv-nn.git
```

After running `licenseheaders`, CI explicitly checks whether tracked files changed. It fails if headers need to be added or updated.

To reproduce this locally:

```bash
python3 -m pip install licenseheaders
wget https://raw.githubusercontent.com/johann-petrak/licenseheaders/master/templates/apache-2.tmpl

licenseheaders \
  -t apache-2.tmpl \
  -y '2023' \
  -o 'TUM Department of Electrical and Computer Engineering' \
  -n 'muRISCV-NN' \
  -u 'https://github.com/tum-ei-eda/muriscv-nn.git' \
  -d . \
  -E py cmake yml sh md

git diff --check
git diff
```

This command modifies files in place. Review all changes before committing them.

## Exit codes and CI use

All local lint scripts should follow these conventions:

- Exit `0` when all checks pass.
- Exit `1` when formatting or lint findings are present.
- Exit `2` for missing tools, invalid configuration, or setup failures.

They can therefore be used directly in a CI shell step:

```bash
NOOP=1 ./Scripts/lint_cpp.sh
NOOP=1 ./Scripts/lint_cmake.sh
NOOP=1 ./Scripts/lint_python.sh
./Scripts/lint_ci.sh
```

## Recommended development workflow

Before committing:

```bash
NOOP=0 ./Scripts/lint_cpp.sh
NOOP=0 ./Scripts/lint_cmake.sh
NOOP=0 ./Scripts/lint_python.sh
./Scripts/lint_ci.sh
shellcheck $(git ls-files '*.sh')
```

Then review the result:

```bash
git diff --check
git diff --stat
git diff
```

Before pushing, run the non-modifying checks:

```bash
NOOP=1 ./Scripts/lint_cpp.sh
NOOP=1 ./Scripts/lint_cmake.sh
NOOP=1 ./Scripts/lint_python.sh
./Scripts/lint_ci.sh
shellcheck $(git ls-files '*.sh')
```

A local pass reduces iteration time, but the GitHub Actions workflow remains the authoritative check for pull requests.
