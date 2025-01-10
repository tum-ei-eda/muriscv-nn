// RISC-V Architectural Validation Test VFREDSUM-VS-SEW32_LMUL2
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
//    SEW=32, LMUL=2
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
    vsetvli x0, x7, e32,m2
    vle32.v v2, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v30, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # VS1 (v2)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v16)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v30) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v30) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v30, v16, v2, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
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
    la x5, test_1_data+12
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v0, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v18, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v28, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # VS1 (v0)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v18)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v28) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v28) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c930ccb0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v28, v18, v0



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc930ccb0)
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
    vsetvli x0, x7, e32,m2
    vle32.v v4, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v20, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v26, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # VS1 (v4)        = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v20)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v26) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v26) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45ef1000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v26, v20, v4, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v26, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45ef1000)
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
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v6, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v22, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v24, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # VS1 (v6)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v22)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v24) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 487cc680]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v24, v22, v6



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x487cc680)
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
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # VS1 (v8)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v24)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v22) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v22) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45870800]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v22, v24, v8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45870800)
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
    la x2, test_1_data+60
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # VS1 (v10)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v26)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v20) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v20) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45f91000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v20, v26, v10



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45f91000)
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
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # VS1 (v12)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v28)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v18) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v18) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        1        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v18, v28, v12, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # VS1 (v14)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v30)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v16) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c92edd30]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v16, v30, v14



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc92edd30)
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
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # VS1 (v16)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v2)        = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v14) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v14) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45ef1000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v14, v2, v16, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # VS1 (v18)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v0)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v12) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v12) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 487d1680]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v12, v0, v18



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x487d1680)
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
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # VS1 (v20)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v4)        = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v10) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v10) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45870800]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v10, v4, v20, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # VS1 (v22)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v6)        = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v8)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45f91800]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v8, v6, v22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45f91800)
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
    vsetvli x0, x8, e32,m2
    vle32.v v24, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # VS1 (v24)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v8)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v6)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v6)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        1        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v6, v8, v24, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v6, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
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
    la x6, test_1_data+156
    li x7, 4
    vsetvli x0, x8, e32,m2
    vle32.v v26, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # VS1 (v26)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v10)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v4)  BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v4)  AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v4, v10, v26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
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
    vsetvli x0, x8, e32,m2
    vle32.v v28, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # VS1 (v28)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v12)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v2)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v2)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 487cd100]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v2, v12, v28, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v2, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x487cd100)
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
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    li x7, 4
    vsetvli x0, x8, e32,m2
    vle32.v v30, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # VS1 (v30)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v14)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v0)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 487d16c0]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v0, v14, v30



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x487d16c0)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v2, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # VS1 (v2)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v16)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        1        1        1        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v30) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v30) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45911000]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       1        0        1        1        0        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v30, v16, v2, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v30, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x45911000)
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
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # VS1 (v0)        = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v18)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v28) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v28) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 49983458]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v28, v18, v0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x49983458)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v4, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # VS1 (v4)        = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v20)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v26) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v26) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v26, v20, v4, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
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
    la x2, test_1_data+228
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v6, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # VS1 (v6)        = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v22)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v24) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v24) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c9701500]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v24, v22, v6



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9701500)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # VS1 (v8)        = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v24)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v22) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v22) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v22, v24, v8, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v10, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # VS1 (v10)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v26)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v20) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v20) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 48fd16c0]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v20, v26, v10



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x48fd16c0)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v12, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # VS1 (v12)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v28)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v18) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v18) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45870800]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v18, v28, v12, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    li x3, 4
    vsetvli x0, x4, e32,m2
    vle32.v v14, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # VS1 (v14)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v30)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v16) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 487d1680]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v16, v30, v14



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x487d1680)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # VS1 (v16)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v2)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v14) BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v14) AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        1        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v14, v2, v16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v18, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # VS1 (v18)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v0)        = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v12) BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v12) AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c96e22c0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v12, v0, v18



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc96e22c0)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v20, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # VS1 (v20)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v4)        = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v10) BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v10) AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 45ef1000]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v10, v4, v20, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45ef1000)
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
    la x2, test_1_data+324
    li x3, 4
    vsetvli x0, x8, e32,m2
    vle32.v v22, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # VS1 (v22)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v6)        = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v8)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v8)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v8, v6, v22



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    




    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v24, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v8, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v6, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # VS1 (v24)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v8)        = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v6)  BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v6)  AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 45870800]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v6, v8, v24, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v6, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x45870800)
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
    la x5, test_1_data+348
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v26, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v10, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v4, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # VS1 (v26)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]

    # VS2 (v10)       = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v4)  BEFORE = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]
    # VD (v4)  AFTER  = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 48826fc0]

    # VS1 (+1)       = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]

    # VS2 (+1)       = [c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]
    # VD (+1) AFTER  = [c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000 43a10000]


    
    vfredsum.vs v4, v10, v26



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48826fc0)
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
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v28, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v12, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v2, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # VS1 (v28)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]

    # VS2 (v12)       = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v2)  BEFORE = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]
    # VD (v2)  AFTER  = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 3f800000]

    # VS1 (+1)       = [45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000 c0000000]

    # VS2 (+1)       = [43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        1        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]
    # VD (+1) AFTER  = [c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438 00000000]


    
    vfredsum.vs v2, v12, v28, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
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
    la x5, test_1_data+372
    li x6, 4
    vsetvli x0, x7, e32,m2
    vle32.v v30, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v14, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v0, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # VS1 (v30)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]

    # VS2 (v14)       = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000]
    # VD (v0)  AFTER  = [45870800 4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c96e22d0]

    # VS1 (+1)       = [3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800 4996b438]

    # VS2 (+1)       = [00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060 45870800]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]
    # VD (+1) AFTER  = [4996b438 00000000 3f800000 c0000000 43a10000 45ef1000 c22c0000 c9712060]


    
    vfredsum.vs v0, v14, v30



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc96e22d0)
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
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 64, 4, 0xdeadbeef
signature_2_0:
	.fill 64, 4, 0xdeadbeef
signature_3_0:
	.fill 64, 4, 0xdeadbeef
signature_4_0:
	.fill 64, 4, 0xdeadbeef
signature_5_0:
	.fill 64, 4, 0xdeadbeef
signature_6_0:
	.fill 64, 4, 0xdeadbeef
signature_7_0:
	.fill 64, 4, 0xdeadbeef
signature_8_0:
	.fill 64, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

