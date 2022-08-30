# Toolchain

In order to build muRISCV-NN you can either use the RISC-V [GCC](https://github.com/riscv-collab/riscv-gnu-toolchain) or upstream [LLVM](https://llvm.org/). However, if you want to use the supported RISC-V extensions (V or P) in order to accelerate your code you will need to pay special attention to which version of each toolchain you are using.

- If you just want to compile the **scalar** code without any hardware acceleration you will need a `rv32gc` compiler.
- If you want to use the V **vector** accelerated kernels by activating `USE_VEXT` you will need a `rv32gcv` compiler.
- If you want to use the P **packed** accelerated kernels by activating `USE_PEXT` you will need a `rv32gcp` compiler.

## GCC
GCC has support for both the V vector and the P packed extensions. The easiest way to acquire a GCC toolchain is through the `download.sh` script in the `/Toolchain` directory. This will download precompiled GCC toolchains we provide for you. The `downdload_lite.sh` will download a bare minimum version intended for use with LLVM and can thus not be used as a standalone GCC toolchain.

Once you have your GCC toolchain setup, don't forget to supply the `-march=rv32gcv`/`-march=rv32gcp` and `-mabi=ilp32d` flags when compiling with special instructions. However, no need to worry about this if you don't change anything. CMake takes care of that for you.

## LLVM
Upstream LLVM 14 now has full support for RISC-V and even the RISC-V vector extension. However, it does **not yet support the P packed** extension.

You can install LLVM 14 from [here](https://apt.llvm.org/) and follow the instructions under "Automatic installation script". LLVM still requires you to have a RISC-V GCC toolchain, as LLVM does not provide its own headers and libraries.

Currently, we have to force Clang to use the lld linker, as it otherwise wants to use the x86 native linker (which obviously won't work). I tried using the GCC linker, but LLVM hands it a weird march argument that it doesn't understand `-march=rv32i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v0p10_zvlsseg0p10: unsupported ISA subset z`.

Once you have everything setup you will need to invoke Clang with the following arguments:  
`--target=riscv32 -march=rv32gcv0p10 -mabi=ilp32d -menable-experimental-extensions --sysroot=<path-to-gcc-toolchain>/rv32gcv/riscv32-unknown-elf --gcc-toolchain=<path-to-gcc-toolchain>/rv32gcv -fuse-ld=lld-14`

LLVM 13 also has RISC-V and RISC-V vector support. However, it is only experimental in that version (use LLVM 14 instead if you can!). You need to add `-menable-experimental-extensions` and `-mno-relax` when compiling with LLVM 13. For more info, look [here](https://maskray.me/blog/2021-03-14-the-dark-side-of-riscv-linker-relaxation) and [here](https://www.sifive.com/blog/all-aboard-part-3-linker-relaxation-in-riscv-toolchain).

## Compile your own GCC

### Scalar `rv32gc`
Simply follow the instructions listed in the `README.md` in the [GCC](https://github.com/riscv-collab/riscv-gnu-toolchain) GitHub repo and build your toolchain from the main branch. You can also find GCC binaries through companies like SiFive or Imperas, or even through some package managers.

### Vector `rv32gcv` or `rv32imv`
GCC's RISC-V vector support used to be quite bad. However, thanks to efforts from RISC-V collaborators GCC now supports the latest RISC-V vector 1.0 spec, as well as intrinsics (and autovectorization, but this feature seems to not perform very well yet).  

**Steps**  
- `git clone git@github.com:riscv-collab/riscv-gnu-toolchain.git` and `git checkout rvv-next`
- `export PATH=$PATH:/opt/riscv/bin` (ensure that your have `rwx` to `/opt`)
- `./configure --prefix=/opt/riscv --with-arch=rv32gcv --with-abi=ilp32d`
- `make`

This will take a while and build a `rv32gcv` into `/opt/riscv`.

In order to build `rv32imv` simply replace the configure command with
- `./configure --prefix=/opt/riscv --with-arch=rv32imv --with-abi=ilp32`

### Packed `rv32gcp`
GCC's itself does not yet offer P packed support. However, there are two PRs open for that. See here [GCC](https://github.com/riscv-collab/riscv-gcc/pull/258) and here [binutils](https://github.com/riscv-collab/riscv-binutils-gdb/pull/257).

**Steps**  
- `git clone git@github.com:riscv-collab/riscv-gnu-toolchain.git`
- Change the links and checkout the submodules in the [.gitmodules](https://github.com/riscv-collab/riscv-gnu-toolchain/blob/master/.gitmodules)
```
[submodule "riscv-binutils"]
  path = riscv-binutils
  url = https://github.com/linsinan1995/riscv-binutils-gdb.git
  branch = riscv-binutils-experiment-p-ext
[submodule "riscv-gcc"]
  path = riscv-gcc
  url = https://github.com/linsinan1995/riscv-gcc.git
  branch = riscv-gcc-experiment-p-ext
```
Make sure the two directories now contain the latest commit of the respective PRs.
- `export PATH=$PATH:/opt/riscv/bin` (ensure that you have `rwx` rights to `/opt`)
- `./configure --prefix=/opt/riscv --with-arch=rv32gcp --with-abi=ilp32d`
- `make`

This will take a while and build a `rv32gcp` into `/opt/riscv`.
