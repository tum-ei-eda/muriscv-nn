// RISC-V Architectural Validation Test VFREDSUM-VS-SEW32_LMUL8
//
//
// Copyright (c) 2005-2023 Imperas Software Ltd., www.imperas.com
//
// The contents of this file are provided under the Software License
// Agreement that you accepted before downloading this file.
//
// This source forms part of the Software and can be used for educational,
// training, and demonstration purposes but cannot be used for derivative
// works except in cases where the derivative works require OVP technology
// to run.
//
// For open source models released under licenses that you can use for
// derivative works, please visit www.OVPworld.org or www.imperas.com
// for the location of the open source models.
//
    

//
// Specification: V Vector Extension, Version 1.0
// Vector Constant Parameters:
//    VLEN=256, SLEN=256, ELEN=32 FP16=IEEE754
// Test Parameters:
//    SEW=32, LMUL=8
// Description: Testing instruction 'vfredsum.vs'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32GCV")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN





    # enable vector unit
    #   0.9 >= use  9
    # < 0.9    use 23
    # TODO : enable floating point only if required
    li  x1, 1 << 9 | 1 << 13
    csrs mstatus, x1

    # set rounding mode
    li x1,  0
    csrw fcsr, x1



#ifdef TEST_CASE_1



    # address for test results
    RVTEST_SIGBASE(x4,signature_1_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    li x6, 4
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 8, Use Mask = 1, VL = 64\n")

    





    # VS1 (v8)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v16)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v24) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 49983460]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # MASK (+2)       = [       1        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (+3)       = [       0        0        1        1        1        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+6)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+7)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v24, v16, v8, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49983460)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    li x6, 4
    vsetvli x0, x7, e32,m8
    vle32.v v0, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    





    # VS1 (v0)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v24)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v16) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 490d6ae0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+2)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+2)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+2) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+3)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+3)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+3) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+4)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+4)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+4) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+5)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+5)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+5) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+6)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+6)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+6) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+7)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+7)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+7) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v16, v24, v0



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x490d6ae0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    li x6, 4
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 8, Use Mask = 1, VL = 41\n")

    





    # VS1 (v16)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v24)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v8)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v8)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c96e3990]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+2)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+2)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+2)       = [       1        0        1        0        0        0        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+2) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+3)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+3)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+3)       = [       0        1        0        0        0        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+3) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+4)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+4)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+4) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+5)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+5)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+5) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+6)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+6)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (+6)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+6) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+7)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+7)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+7)       = [       1        1        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+7) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v8, v24, v16, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc96e3990)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    li x6, 4
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v0, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    





    # VS1 (v24)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v8)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v0)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 497b2460]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v0, v8, v24



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x497b2460)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22c0000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b438)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    li x3, 4
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 8, Use Mask = 1, VL = 23\n")

    





    # VS1 (v8)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v16)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v24) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c97000e0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+2)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+2)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # MASK (+2)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+2) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+3)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+3)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (+3)       = [       1        1        0        0        0        0        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+3) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+4)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+4)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+4) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+5)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+5)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # MASK (+5)       = [       0        0        0        1        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+5) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+6)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+6)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (+6)       = [       1        1        1        0        1        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+6) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+7)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+7)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+7)       = [       0        1        0        0        0        1        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+7) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v24, v16, v8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc97000e0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    li x3, 4
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 8, Use Mask = 0, VL = 16\n")

    





    # VS1 (v0)        = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v8)        = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v16) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 48fd1be0]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+2)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+2)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+2) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+3)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+3)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+3) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+4)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+4)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+4) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+5)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+5)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+5) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+6)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+6)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+6) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+7)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+7)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+7) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v16, v8, v0



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x48fd1be0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    li x3, 4
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 8, Use Mask = 1, VL = 10\n")

    





    # VS1 (v16)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v24)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v8)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v8)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        1        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # MASK (+2)       = [       1        0        0        0        0        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (+3)       = [       0        1        0        0        0        1        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+4)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+5)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+6)       = [       0        1        1        1        0        0        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+7)       = [       1        1        0        0        1        0        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v8, v24, v16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    li x3, 4
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 8, Use Mask = 0, VL = 8\n")

    





    # VS1 (v24)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v16)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v0)  AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 487d1680]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+2)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+2)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+2) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+3)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+3)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+3) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+4)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+4)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+4) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+5)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+5)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+5) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+6)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+6)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+6) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+7)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+7)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+7) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v0, v16, v24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x487d1680)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a10000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b438)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22c0000)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    li x3, 4
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 8, Use Mask = 1, VL = 6\n")

    





    # VS1 (v8)        = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v16)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v24) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45ef1000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+2)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+2)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+2)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+2) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+3)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+3)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+3)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+3) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+4)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+4)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+4)       = [       0        0        1        1        1        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+4) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+5)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+5)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # MASK (+5)       = [       1        0        1        1        0        1        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+5) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+6)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+6)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (+6)       = [       1        0        0        1        0        1        1        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+6) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+7)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+7)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+7)       = [       0        1        0        0        1        0        0        1]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+7) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v24, v16, v8, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    li x3, 4
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 8, Use Mask = 0, VL = 4\n")

    





    # VS1 (v0)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v8)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v16) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 487558c0]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v16, v8, v0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x487558c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    li x3, 4
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 8, Use Mask = 1, VL = 2\n")

    





    # VS1 (v16)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v24)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v8)  BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v8)  AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45870800]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+2)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+2)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # MASK (+2)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+2) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+3)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+3)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (+3)       = [       1        1        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+3) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+4)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+4)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+4) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+5)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+5)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+5) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+6)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+6)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (+6)       = [       1        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+6) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+7)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+7)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+7)       = [       0        0        1        1        1        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+7) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v8, v24, v16, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    li x3, 4
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 8, Use Mask = 0, VL = 0\n")

    





    # VS1 (v24)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v8)        = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v0)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v0)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+2)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+2)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+2) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+3)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+3)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+3) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+4)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+4)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+4) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+4) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+5)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+5)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+5) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+5) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+6)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+6)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+6) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+6) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+7)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+7)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+7) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+7) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v0, v8, v24



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b438)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45870800)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22c0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45ef1000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0000000)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    li x7, 4
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 8, Use Mask = 1, VL = 64\n")

    





    # VS1 (v8)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v16)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v24) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 ca15f4cc]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        1        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # MASK (+2)       = [       1        1        1        0        1        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (+3)       = [       0        1        0        0        0        1        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+6)       = [       1        0        1        0        0        0        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+7)       = [       0        1        0        0        0        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v24, v16, v8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v24, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xca15f4cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    li x7, 4
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    





    # VS1 (v0)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v24)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v16) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 490d6ae0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+2)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+2)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+2) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+3)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+3)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+3) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+4)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+4)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+4) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+5)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+5)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+5) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+6)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+6)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+6) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+7)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+7)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+7) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v16, v24, v0



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x490d6ae0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    li x7, 4
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 8, Use Mask = 1, VL = 41\n")

    





    # VS1 (v16)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v24)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v8)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v8)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 49d47b20]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+2)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+2)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # MASK (+2)       = [       0        1        1        1        0        0        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+2) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+3)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+3)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (+3)       = [       1        1        0        0        1        0        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+3) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+4)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+4)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+4) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS1 (+5)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS2 (+5)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # VD (+5) AFTER  = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS1 (+6)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (+6)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (+6)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (+6) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+7)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+7)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+7)       = [       1        1        0        0        0        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+7) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v8, v24, v16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49d47b20)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    li x7, 4
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    





    # VS1 (v24)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v8)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v0)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 497b2460]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]

    # VS1 (+2)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS2 (+2)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # VD (+2) AFTER  = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS1 (+3)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (+3)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (+3) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+4)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+4)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+4) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]

    # VS1 (+5)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]

    # VS2 (+5)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # VD (+5) AFTER  = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS1 (+6)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (+6)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (+6) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+7)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+7)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+7) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v0, v8, v24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x497b2460)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45870800)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22c0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45ef1000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a10000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b438)
#endif
    

	
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe

# Input data section.
	.data

	.align 4
test_1_data:
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000

	.align 4
test_1_maskdata:
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
	.word 0x4996b438
	.word 0x45870800
	.word 0xc9712060
	.word 0xc22c0000
	.word 0x45ef1000
	.word 0x43a10000
	.word 0xc0000000
	.word 0x3f800000
	.word 0x0
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 256, 4, 0xdeadbeef
signature_2_0:
	.fill 256, 4, 0xdeadbeef
signature_3_0:
	.fill 256, 4, 0xdeadbeef
signature_4_0:
	.fill 256, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

