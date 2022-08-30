# Scripts
This directory contains a number of helpful scripts, mainly for automated builds and tests.

## Build
Tests whether the code builds with the provided toolchains and configurations.

## Tests
We run through all unit tests in order to ensure basic functional correctness (obviously tests can never prove full functional correctness).

## Integration
Runs integration tests using popular DL frameworks.

## Design Space
There are multiple variables/dimensions we can change/we need to consider when running the tests:
- `BUILD_TYPE` - `Release`/`Debug` (currently only building and testing in release mode)
- `USE_VEXT` - `ÒN`/`OFF`
- `USE_PEXT` - `ÒN`/`OFF` (`USE_VEXT` and `USE_PEXT` can't be used in conjunction)
- `TOOLCHAIN` - `LLVM`/`GCC`/`x86` (`x86` runs natively and thus neither supports `USE_VEXT` or `USE_PEXT`)
- `SIMULATOR` - `OVPsim`/`Spike`/`ETISS`...
- `VLEN` - `64`/`128`/`256`/`512`/`1024`...
- `RISCV_ARCH` - `rv32gc` / `rv32gcv` / `rv32gcp` ...
- `RISCV_ABI` - `ilp32d` / `ilp32`
- Host `OS` - `Ubuntu 18.04`/`Ubuntu 20.04` (currently running all tests on `Ubuntu 18.04`, except integration tests)  

Ideally, we would want to do exhaustive tests, i.e. test every possible combination of the parameters. But this is not possible since there exist too many combinations. So we will need to choose a subset that best covers our needs.
