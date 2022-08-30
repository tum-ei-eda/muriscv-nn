# Simulation
This directory contains different simulators that can be used to simulate and test the code. Every simulator directory contains a `run.sh` script can be used to invoke the simulator. Have a look at the top of the respective script to see what arguments it expects. You can select the simulator you want to use when running the unit tests by setting the `SIMULATOR` CMake variable. See the `CMakeLists.txt` in the project's root directory for information.

We provide ready-to-use binaries for OVPsim and Spike simulators. This makes life a lot easier. Because of their size and because of copyright/licensing issues, the binaries are not part of this repository. Please use the provided `download.sh` script in the `/bin` directories to download and populate the binaries for each simulator. Alternatively, you are more than welcome to build/get your own copy of the simulator binaries. Please see the instructions provided under each simulator subsection for instructions on how to obtain your copy.

**Both Spike and OVPsim support the V and P (+ B) extension simultaneously. However, I decided on using specific versions for each that only either support V or P (+B). This stricter approach hopefully makes spotting errors more straightforward!**

## ETISS
**Only basic scalar support**  
In order to attain a binary copy of ETISS, simply run the `setup_etiss.py` script in the ETISS directory. It will download, compile, and test ETISS for you.

In order to get ETISS vector support going, I need to implement the required vector instructions (using the correct vector version, rvv0.10) in CoreDSL and SoftVector.

## OVPsim
[OVPsim](https://www.ovpworld.org/technology_ovpsim) is a powerful, efficient and simple-to-use simulator. However, the "plus" version is proprietary and not open-source (the "basic" version does not support the vector extension). Because we are exclusively using the riscvOVPsimPlus and will refer to riscvOVPsimPlus as OVPsim from here on.

OVPsim is an Instruction Set Simulator (ISS), meaning that it simulates the target software at instruction level. It is thus not able to incorporate microarchitectural peculiarities of an actual implementation. OVPsim in its default configuration is running at 100 MIPS (Million Instructions Per Second) and 1 CPI (Clock Per Instruction).

Either download a copy of the binaries using our internal mirrors (see `OVPsim/bin/download.sh`) or get your own copy at https://www.ovpworld.org/riscvOVPsimPlus/. You will need to register at OVP Forums and wait for approval by their admins before you can download your copy there (this takes around 48h).

Additionally, the OVPsim binary requires an internet connection to run, and its internal license is only valid for three months after download from OVPworld.

A big advantage of OVPsim over Spike is, that OVPsim is more efficient. This means, that simulation of the same target software usually takes not as long on OVPsim when compared to Spike.

## Spike
[Spike](https://github.com/riscv-software-src/riscv-isa-sim) is an open and free to use instruction set simulator from the folks over at UC Berkeley. It can run binaries bare-metal or in conjunction with the so-called [Proxy Kernel](https://github.com/riscv-software-src/riscv-pk) (pk). Since we fancy syscalls and what not we only use Spike together with pk.

Similar to OVPsim Spike is also an ISS and running at 100 MIPS and 1 CPI.

An important difference between Spike and OVPsim is, that Spike sets the `vill` bit in `vtype` on reset, OVPsim does not. This means that on Spike you can't execute vector instructions without executing a `vsetvl` instruction first. The vector specification actually states (section 3.11): "It is recommended that at reset, vtype.vill is set, the remaining bits in vtype are zero, and vl is set to zero." So OVPsim is the "bad boy" here. However, both are conformant to the spec.

Either download a copy of the binaries using our internal mirrors (see `Spike/bin/download.sh`) or compile your own copy.

### Compile your own Spike binaries
In order to compile your own [Spike](https://github.com/riscv-software-src/riscv-isa-sim) and [pk](https://github.com/riscv-software-src/riscv-pk) binaries, you will need to follow the build steps from their respective GitHub repositories with some slight modifications in order to be able to build an `rv32gcv` compatible version:

Make sure to export the `RISCV` variable pointing to a `rv32gcv` compiler `export RISCV=/path/to/your/rv32gcv` and to add its `bin` directory to your `PATH` variable `export PATH=$PATH:$RISCV/bin`.

#### Spike
- Clone the Spike repository `git clone git@github.com:riscv-software-src/riscv-isa-sim.git`
- Follow the steps from [here](https://github.com/riscv-software-src/riscv-isa-sim#build-steps)
- You might need to install the boost library `sudo apt-get install libboost-all-dev`

#### PK
- Clone the PK repository `git clone git@github.com:riscv-software-src/riscv-pk.git`
- Follow the steps from [here](https://github.com/riscv-software-src/riscv-pk#build-steps)
- However, replace the `configure` command with the following `../configure --prefix=$RISCV --host=riscv32-unknown-elf --with-arch=rv32gcv --with-abi=ilp32d`
- **Important** Replace the arguments during `configure` accordingly in order to build the PK for the reduced ISA `rv32imv` with abi `ilp32` (not needed for Spike itself)

#### Run
- You should now find a `spike` and a `pk` executable in their respective `build` directories
- Assuming you cloned Spike and PK next to each other you should now be able to execute binaries with Spike and pk from the Spike build directory like so `./spike --isa=rv32gcv ../../riscv-pk/build/pk <path/to/your/binary>`
- In order to use them in with muRISCV-NN put the two binaries (`spike` and `pk`) into `Spike/bin/`.

## Vicuna
I am currently in the process of adding support for RTL level simulators...
