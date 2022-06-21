# Workflows on GitHub Actions
The files in this directory contain workflows that run on top of GitHub Actions. They are executed once every day and when someone pushes to the `main` branch.

We have a number of workflow files that each correspond to a single status badge in the root `README.md`. Each workflow file executes a single bash script from the [`/Scripts`](/Scripts) directory. 

## Design Space
There are multiple variables/dimensions we can change/we need to consider when running the tests:
- `USE_VEXT` - `ÒN`/`OFF`
- `USE_PEXT` - `ÒN`/`OFF` (currently no support for Packed extension)
- `TOOLCHAIN` - `LLVM`/`GCC`/`x86` (`LLVM` is the only toolchain that currently supports the Vector extension)
- `SIMULATOR` - `OVPsim`/`Spike`/`ETISS`
- `VLEN` - `64`/`128`/`256`/`512`/`1024`
- `OS` - `Ubuntu 18.04`/`Ubuntu 20.04` (currently running all tests on `Ubuntu 18.04`, except integration tests)
- TODO(fabianpedd): `BUILD_TYPE` - `Release`/`Debug`
Ideally, we would want to do exhaustive tests, i.e. test every possible combination of the parameters. But this is not possible since there exist too many combinations. So we will need to choose a subset that best covers our needs wisely.

## Structure
We have a number of workflow files that each correspond to a single status badge in the root `README.md`. Each workflow file contains a number of workflows that can logically be grouped together:
- `build.yml` basic code build
    - `build-scalar-llvm` - `USE_VEXT=OFF` / `TOOLCHAIN=LLVM`
    - `build-scalar-gcc` - `USE_VEXT=OFF` / `TOOLCHAIN=GCC`
    - `build-scalar-x86` - `USE_VEXT=OFF` / `TOOLCHAIN=x86`
    - `build-vector-llvm` - `USE_VEXT=ON` / `TOOLCHAIN=LLVM` (`VLEN` has no impact on the build, as the Vector is `VLEN` agnostic)
- `test_ovpsim.yml` unit tests on `OVPsim`
    - `test-scalar-x86` - `USE_VEXT=OFF` / `TOOLCHAIN=x86` (not actually run OVPsim, but natively on host machine)
    - `test-scalar-llvm` - `USE_VEXT=OFF` / `TOOLCHAIN=LLVM`
    - `test-scalar-gcc` - `USE_VEXT=OFF` / `TOOLCHAIN=GCC`
    - `test-vector-llvm` - `USE_VEXT=ON` / `TOOLCHAIN=LLVM` / `VLEN=64` and `VLEN=512`
- `test_spike.yml` unit tests on `Spike`
    - `test-scalar-llvm` - `USE_VEXT=OFF` / `TOOLCHAIN=LLVM`
    - `test-scalar-gcc` - `USE_VEXT=OFF` / `TOOLCHAIN=GCC`
    - `test-vector-llvm` - `USE_VEXT=ON` / `TOOLCHAIN=LLVM` / `VLEN=64` and `VLEN=512`
- `tflm_integration_ovpsim.yml` integration tests with TFLM on OVPsim
    - ...
- `tflm_integration_spike.yml` integration tests with TFLM on Spike
    - ...
