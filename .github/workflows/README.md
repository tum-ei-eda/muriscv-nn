# Workflows on GitHub Actions
The files in this directory contain workflows that run on top of GitHub Actions. They are executed once every day and when someone pushes to the `main` branch.

We have a number of workflow files that each correspond to a single status badge in the root `README.md`. Each workflow file executes a single bash script from the [`/Scripts`](/Scripts) directory. 

## Design Space
There are multiple variables/dimensions we can change/we need to consider when running the tests:
- `USE_VEXT` - `ÒN`/`OFF`
- `USE_PEXT` - `ÒN`/`OFF`
- `TOOLCHAIN` - `LLVM`/`GCC`/`x86` (`LLVM` and 'GCC' are the only toolchain that currently supports the Vector extension)
- `SIMULATOR` - `OVPsim`/`Spike`/`ETISS`
- `VLEN` - `64`/`128`/`256`/`512`/`1024`
- `OS` - `Ubuntu 18.04`/`Ubuntu 20.04` (currently running all tests on `Ubuntu 20.04`)
- TODO(fabianpedd): `BUILD_TYPE` - `Release`/`Debug`
Ideally, we would want to do exhaustive tests, i.e. test every possible combination of the parameters. But this is not possible since there exist too many combinations. So we will need to choose a subset that best covers our needs wisely.

## Structure
We have a number of workflow files that each correspond to a single status badge in the root `README.md`. Each workflow file contains a number of workflows that can logically be grouped together:
- `build.yml` basic code build
    - `build-scalar-llvm` - `USE_VEXT=OFF` / `TOOLCHAIN=LLVM`
    - `build-scalar-gcc` - `USE_VEXT=OFF` / `TOOLCHAIN=GCC`
    - `build-scalar-x86` - `USE_VEXT=OFF` / `TOOLCHAIN=x86`
    - `build-vector-llvm` - `USE_VEXT=ON` / `TOOLCHAIN=LLVM` (`VLEN` has no impact on the build, as the Vector is `VLEN` agnostic)
- 'download_dependencies.yml' 
    - Downloads and caches precompiled GCC binaries
- 'build_spike.yml' 
    - Downloads, builds, and caches Spike and pk
- 'unit_tests.yml'
    -  Runs unit tests for scalar, P, and V extensions
    -  Runs on x86, Spike, and OVPsim
- 'OVPsim_integration_tests.yml'
    -  Runs integration tests for TFLM on OVPsim
- 'spike_integration_tests.yml'
    -  Runs integration tests for TFLM on spike
- 'quick_benchmarks.yml'
    -  Runs aww benchmark on Spike for standard TFLM, muriscv-nn scalar, VEXT len=64, and PEXT
    -  Benchmark results are saved as an artifact
- 'benchmark_tests.yml'
    -  Runs aww, vww, toycar, and resnet benchmarks on Spike for TFLM and TVM backedns.  Runs standard, muriscv-nn scalar, VEXT len=64 and len=1024, and PEXT
    -   Results for each benchmark are saved as artifacts and compiled into a new page in the Wiki
    
  
