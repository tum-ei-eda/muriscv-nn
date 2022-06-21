# Scripts

This directory contains a number of helpful scripts, mainly for automated builds and tests.

## Tests

#### Design Space
There are multiple variables/dimensions we can change/we need to consider when running the tests:
- `BUILD_TYPE` - `Release`/`Debug` (currently only building and testing in release mode)
- `USE_VEXT` - `ÒN`/`OFF`
- `USE_PEXT` - `ÒN`/`OFF` (`USE_VEXT` and `USE_PEXT` can't be used in conjunction)
- `TOOLCHAIN` - `LLVM`/`GCC`/`x86` (`x86` runs natively and thus neither supports `USE_VEXT` or `USE_PEXT`)
- `SIMULATOR` - `OVPsim`/`Spike`/`ETISS`
- `VLEN` - `64`/`128`/`256`/`512`/`1024`
- `OS` - `Ubuntu 18.04`/`Ubuntu 20.04` Keep in mind that the OS here refers to the host OS where the simulators run on. The RISC-V code itself runs bare metal. (currently running all tests on `Ubuntu 18.04`, except integration tests)
Ideally, we would want to do exhaustive tests, i.e. test every possible combination of the parameters. But this is not possible since there exist too many combinations. So we will need to choose a subset that best covers our needs wisely.
