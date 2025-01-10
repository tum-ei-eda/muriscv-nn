// RISC-V Architectural Validation Test VFWREDSUM-VS-SEW16_LMUL2
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
//    SEW=16, LMUL=2
// Description: Testing instruction 'vfwredsum.vs'.

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
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v4, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v28, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 2, Use Mask = 1, VL = 32\n")

    





    # VS1 (v4)        = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v16)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v28) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v28) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7f800000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       1        1        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v28, v16, v4, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v0, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v18, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v24, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 2, Use Mask = 0, VL = 23\n")

    





    # VS1 (v0)        = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v18)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v24) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7fc00000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v24, v18, v0



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7fc00000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v8, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v24, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v20, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # VS1 (v8)        = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v24)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # MASK (v0)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm     ffff     mmmm     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     mmmm]
    # VD (v20) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v20) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7fc00000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm     ffff     mmmm     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v20, v24, v8, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v20, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7fc00000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v12, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v20, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v16, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # VS1 (v12)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v20)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v16) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7fc00000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v16, v20, v12



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7fc00000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v22, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # VS1 (v16)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v22)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # MASK (v0)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v12) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v12) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7f800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # MASK (+1)       = [       0        1        1        0        1        1        0        0        0        0        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v12, v22, v16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v20, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # VS1 (v20)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v26)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v8)  AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7c006f78]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v8, v26, v20



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v24, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # VS1 (v24)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v28)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        1        1        0        1        1        0        0        0        0        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm]
    # VD (v4)  BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v4)  AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 45eeeff8]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v4, v28, v24, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45eeeff8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v28, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # VS1 (v28)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v4)        = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v0)  BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v0)  AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 ff800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v0, v4, v28



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v4, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # VS1 (v4)        = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v2)        = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v28) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v28) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # MASK (+1)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v28, v2, v4, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # VS1 (v0)        = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v30)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v24) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7fc00000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v24, v30, v0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fc00000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # VS1 (v8)        = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v6)        = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # MASK (v0)       = [       1        1        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v20) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v20) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7f800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # MASK (+1)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v20, v6, v8, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v12, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # VS1 (v12)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v0)        = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v16) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7fc00000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v16, v0, v12



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fc00000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    li x7, 4
    vsetvli x0, x8, e32,m4
    vle32.v v16, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # VS1 (v16)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v8)        = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        1        1        0        1        1        1        1        0        1        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm]
    # VD (v12) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v12) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 ff800000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v12, v8, v16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m4
    vse32.v v12, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    li x7, 4
    vsetvli x0, x8, e32,m4
    vle32.v v20, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # VS1 (v20)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v12)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v8)  AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7fc00000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v8, v12, v20



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m4
    vse32.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fc00000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    li x7, 4
    vsetvli x0, x8, e32,m4
    vle32.v v24, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # VS1 (v24)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v10)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # MASK (v0)       = [       1        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v4)  BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v4)  AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7c006f78]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # MASK (+1)       = [       1        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v4, v10, v24, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m4
    vse32.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    li x7, 4
    vsetvli x0, x8, e32,m4
    vle32.v v28, (x6)      # Load value into vs1
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x6)      # Load value into vs2
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # VS1 (v28)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v14)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v0)  AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7f800000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v0, v14, v28



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m4
    vse32.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00c000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0003c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6f787c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1606c38)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c38d160)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c006f78)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v4, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 16, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # VS1 (v4)        = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v16)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # MASK (v0)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm]
    # VD (v28) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v28) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 d1606c38]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # MASK (+1)       = [       0        1        1        0        1        1        1        1        0        1        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v28, v16, v4, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 16, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # VS1 (v0)        = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v18)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v24) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v24) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v24, v18, v0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 16, LMUL = 2, Use Mask = 1, VL = 32\n")

    





    # VS1 (v8)        = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v24)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v20) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v20) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7f800000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       1        1        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v20, v24, v8, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v12, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 16, LMUL = 2, Use Mask = 0, VL = 23\n")

    





    # VS1 (v12)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v20)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v16) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7fc00000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v16, v20, v12



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fc00000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 16, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # VS1 (v16)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v22)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # MASK (v0)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm     ffff     mmmm     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     mmmm]
    # VD (v12) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v12) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7fc00000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm     ffff     mmmm     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v12, v22, v16, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fc00000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 16, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # VS1 (v20)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v26)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v8)  AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7fc00000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v8, v26, v20



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fc00000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v4, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 16, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # VS1 (v24)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v28)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # MASK (v0)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v4)  BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v4)  AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7f800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # MASK (+1)       = [       0        1        1        0        1        1        0        0        0        0        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v4, v28, v24, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    li x3, 4
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 16, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # VS1 (v28)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v4)        = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v0)  AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7c006f78]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v0, v4, v28



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m4
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6c38d160)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c006f78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00c000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc0003c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6f787c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1606c38)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 16, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # VS1 (v4)        = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v2)        = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        1        1        0        1        1        0        0        0        0        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm]
    # VD (v28) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v28) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 45eeeff8]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v28, v2, v4, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x45eeeff8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 16, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # VS1 (v0)        = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v30)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v24) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v24) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 ff800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v24, v30, v0



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 16, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # VS1 (v8)        = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v6)        = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v20) BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v20) AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # MASK (+1)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v20, v6, v8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+324
    li x3, 4
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x2)      # Load value into vs1
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 16, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # VS1 (v12)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v0)        = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v16) AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 7fc00000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v16, v0, v12



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m4
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7fc00000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00c000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc0003c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f787c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1606c38)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6c38d160)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c006f78)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v16, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v8, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v12, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 16, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # VS1 (v16)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v8)        = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # MASK (v0)       = [       1        1        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v12) BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v12) AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7f800000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # MASK (+1)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v12, v8, v16, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v12, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v20, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v12, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v8, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 16, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # VS1 (v20)       = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]

    # VS2 (v12)       = [    6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000]
    # VD (v8)  AFTER  = [6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 7fc00000]

    # VS1 (+1)       = [5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00]

    # VS2 (+1)       = [    fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]
    # VD (+1) AFTER  = [d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78]


    
    vfwredsum.vs v8, v12, v20



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7fc00000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v24, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v10, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v4, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 16, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # VS1 (v24)       = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]

    # VS2 (v10)       = [    3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000]
    # MASK (v0)       = [       0        1        1        0        1        1        1        1        0        1        1        1        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm]
    # VD (v4)  BEFORE = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00]
    # VD (v4)  AFTER  = [3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 ff800000]

    # VS1 (+1)       = [fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08]

    # VS2 (+1)       = [    0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38     6f78     7c00     5d08     0000     c000     3c00]
    # MASK (+1)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm]
    # VD (+1) BEFORE = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]
    # VD (+1) AFTER  = [7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00]


    
    vfwredsum.vs v4, v10, v24, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+372
    li x6, 4
    vsetvli x0, x7, e32,m4
    vle32.v v28, (x5)      # Load value into vs1
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v14, (x5)      # Load value into vs2
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v0, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 16, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # VS1 (v28)       = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]

    # VS2 (v14)       = [    6f78     7c00     5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160]
    # VD (v0)  AFTER  = [6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 7fc00000]

    # VS1 (+1)       = [00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000]

    # VS2 (+1)       = [    5d08     0000     c000     3c00     3c00     c000     0000     5d08     7c00     6f78     6c38     d160     fc00     fc00     d160     6c38]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]
    # VD (+1) AFTER  = [c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38 6f787c00 5d080000 c0003c00 3c00c000 00005d08 7c006f78 6c38d160 fc00fc00 d1606c38]


    
    vfwredsum.vs v0, v14, v28



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m4
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7fc00000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f787c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1606c38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c38d160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c006f78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c00c000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc0003c00)
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
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08

	.align 4
test_1_maskdata:
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
	.word 0xfc00fc00
	.word 0x6c38d160
	.word 0x7c006f78
	.word 0x5d08
	.word 0x3c00c000
	.word 0xc0003c00
	.word 0x5d080000
	.word 0x6f787c00
	.word 0xd1606c38
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 128, 4, 0xdeadbeef
signature_2_0:
	.fill 128, 4, 0xdeadbeef
signature_3_0:
	.fill 128, 4, 0xdeadbeef
signature_4_0:
	.fill 128, 4, 0xdeadbeef
signature_5_0:
	.fill 128, 4, 0xdeadbeef
signature_6_0:
	.fill 128, 4, 0xdeadbeef
signature_7_0:
	.fill 128, 4, 0xdeadbeef
signature_8_0:
	.fill 128, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

