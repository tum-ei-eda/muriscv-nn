#!/bin/bash

cd $(dirname $0)
bindir=$(dirname $(dirname $(pwd)))/bin/Linux64

apps=$(ls *.elf | sort -d)
PS3='Please Choose Bit Manipulation Example: '
select app in $apps
do
    break
done
echo "Selected Example $app"

# Run Example
${bindir}/riscvOVPsimPlus.exe \
    --variant RVB64I \
    --override riscvOVPsim/cpu/add_Extensions=MAFDCBSU \
    --program ${app} \
    --override riscvOVPsim/cpu/bitmanip_version=0.93 \
    --override riscvOVPsim/cpu/defaultsemihost=F \
    --override riscvOVPsim/cpu/debugflags=6 \
    --override riscvOVPsim/cpu/wfi_is_nop=0 \
    --override riscvOVPsim/cpu/simulateexceptions=T \
    --override riscvOVPsim/cpu/PMP_registers=0 \
    --override riscvOVPsim/cpu/ASID_bits=0 \
    --override riscvOVPsim/cpu/tval_ii_code=F \
    --customcontrol \
    "$@"
