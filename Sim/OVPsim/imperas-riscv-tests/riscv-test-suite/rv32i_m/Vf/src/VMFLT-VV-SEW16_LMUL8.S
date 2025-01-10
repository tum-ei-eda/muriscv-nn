// RISC-V Architectural Validation Test VMFLT-VV-SEW16_LMUL8
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
//    SEW=16, LMUL=8
// Description: Testing instruction 'vmflt.vv'.

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
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v31, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 128 # VL = 128
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 8, Use Mask = 1, VL = 128\n")
   
    





    # VS1 (v8)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v16)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v31) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v31) AFTER  = [   0    1    1    1    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+1)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   1    1    1    1    1    1    0    1    1    0    0    0    0    0    0    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # MASK (+2)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (+3)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   1    0    0    1    1    1    0    0    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+4)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+5)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    0    0    0    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+6)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+7)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    1    0    0    0    0    0    1    0    0    0    0    0    1    1    1]


    
    
    vmflt.vv v31, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v31, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfd807000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9c670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc400f000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4107d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e16,m8
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 105 # VL = 105
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 8, Use Mask = 0, VL = 105\n")
   
    





    # VS1 (v0)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v8)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v30) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v30) AFTER  = [   0    0    0    1    1    0    0    1    1    1    0    0    0    0    1    1]

    # VS1 (+1)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+1)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+1) AFTER  = [   0    1    1    0    0    1    1    1    0    0    0    0    1    1    1    1]

    # VS1 (+2)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+2)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   1    0    0    1    1    1    0    0    0    0    1    1    1    1    0    0]

    # VS1 (+3)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+3)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+3) AFTER  = [   0    1    1    1    0    0    0    0    1    1    1    1    0    0    0    1]

    # VS1 (+4)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+4)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+4) AFTER  = [   1    1    0    0    0    0    1    1    1    1    0    0    0    1    1    0]

    # VS1 (+5)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+5)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   0    0    0    0    1    1    1    1    0    0    0    1    1    0    0    1]

    # VS1 (+6)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+6)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+6) AFTER  = [   1    0    0    0    0    0    0    0    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+7)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v30, v8, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x670f19c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x70f19c3c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0f19c3c6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008067)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v29, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 78 # VL = 78
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 8, Use Mask = 1, VL = 78\n")
   
    





    # VS1 (v16)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v8)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (v29) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v29) AFTER  = [   1    0    0    1    1    1    0    0    1    0    0    0    0    0    0    1]

    # VS1 (+1)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+1)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+1)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+1) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+2)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+2)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+2) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   1    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+3)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+3)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+3) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+3) AFTER  = [   1    0    0    1    1    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+4)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+4)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+4)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+4) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   0    0    1    0    0    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+5)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # MASK (+5)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+5) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+5) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+6)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+6)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (+6)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+6) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+6) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+7)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+7)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+7)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm ffff mmmm ffff ffff ffff mmmm ffff mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (+7) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v29, v8, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v29, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c009c81)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9989bc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d082400)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e16,m8
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 8, Use Mask = 0, VL = 64\n")
   
    





    # VS1 (v0)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v16)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v28) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v28) AFTER  = [   0    1    1    1    0    0    0    0    1    1    1    1    0    0    0    1]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   1    1    0    0    0    0    1    1    1    1    0    0    0    1    1    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    1    1    1    1    0    0    0    1    1    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   0    0    1    1    1    1    0    0    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]


    
    
    vmflt.vv v28, v16, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc3c670f1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c670f19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v27, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 8, Use Mask = 1, VL = 57\n")
   
    





    # VS1 (v8)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v16)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (v27) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v27) AFTER  = [   0    0    0    1    0    0    0    1    0    1    0    0    0    0    1    1]

    # VS1 (+1)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+1)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+1)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+1) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+1) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+2)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+2)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # MASK (+2)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+2) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    0    0    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+3)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (+3)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+3) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+3) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+4)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+4)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+4)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+4) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+4) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+5)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+5)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # MASK (+5)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+5) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+6)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (+6)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+6) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+6) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+7)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+7)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+7)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v27, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v27, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00011143)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c001c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 8, Use Mask = 0, VL = 41\n")
   
    





    # VS1 (v16)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v0)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v26) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v26) AFTER  = [   0    0    1    1    1    1    0    0    0    1    1    0    0    1    1    1]

    # VS1 (+1)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+1)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   1    1    1    1    0    0    0    1    1    0    0    1    1    1    0    0]

    # VS1 (+2)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+2)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    0    1    1    1    1    0    0    0    1    1    1    0    0    0    0]

    # VS1 (+3)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+3)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+3) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+4)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+4)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+5)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+5) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+6)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+6)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+6) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+7)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+7)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v26, v0, v16
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf19c3c67)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c70)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v25, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 8, Use Mask = 1, VL = 32\n")
   
    





    # VS1 (v8)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v16)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (v25) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v25) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+1)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   1    1    1    0    1    1    0    1    0    1    0    0    0    1    1    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # MASK (+2)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (+3)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+4)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+5)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+6)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+7)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]


    
    
    vmflt.vv v25, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v25, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xed467c01)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 8, Use Mask = 0, VL = 23\n")
   
    





    # VS1 (v0)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v8)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v24) AFTER  = [   0    0    0    1    1    0    0    1    1    1    0    0    0    0    1    1]

    # VS1 (+1)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+1)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+1) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    1    1    1    1]

    # VS1 (+2)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+2)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+3)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+3) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+4)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+4)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+4) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+5)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+5)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+6)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+6) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+7)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+7)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v24, v8, v0
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000f19c3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v23, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 8, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v24)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v8)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v23) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v23) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+1)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+1)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+1)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+1) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+2)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+2)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+2) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+3)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+3)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+3) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+3) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+4)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+4)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+4)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+4) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+5)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # MASK (+5)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+5) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+5) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+6)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+6)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (+6)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+6) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+6) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+7)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+7)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+7)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (+7) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v23, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v23, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 8, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v24)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v0)        = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v22) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v22) AFTER  = [   0    1    1    1    1    1    0    0    1    1    1    1    0    0    0    1]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]


    
    
    vmflt.vv v22, v0, v24
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007cf1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v21, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 8, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v24)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v8)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (v21) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v21) AFTER  = [   1    1    0    1    0    0    0    1    1    1    1    0    0    1    1    1]

    # VS1 (+1)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+1)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+1)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+1) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+1) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+2)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+2)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # MASK (+2)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+2) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+3)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (+3)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+3) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+3) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+4)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+4)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+4)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+4) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+4) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+5)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+5)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # MASK (+5)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+5) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+6)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (+6)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+6) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+6) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+7)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+7)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+7)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (+7) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v21, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v21, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d1e7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    vsetvli x0, x4, e16,m8
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 8, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v0)        = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v24)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v20) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v20) AFTER  = [   1    0    0    0    0    0    0    1    1    0    1    0    0    1    1    1]

    # VS1 (+1)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+1)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+2)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+3)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+3) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+4)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+4)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+5)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+5) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+6)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+6)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+6) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+7)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+7)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v20, v24, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c0081a7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v19, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 8, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v8)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v24)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (v19) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v19) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+1)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # MASK (+2)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (+3)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+4)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+5)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+6)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+7)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]


    
    
    vmflt.vv v19, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v19, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v18, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 8, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v24)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v0)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v18) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v18) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]

    # VS1 (+1)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+1)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+1) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+1) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]

    # VS1 (+2)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+2)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+2) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+3)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+3) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+3) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+4)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+4)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+4) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+4) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+5)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+5)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+5) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+6)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+6)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+6) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+6) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+7)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+7)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+7) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v18, v0, v24
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v18, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v17, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 8, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v8)        = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v24)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v17) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v17) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+1)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+1)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # MASK (+1)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+1) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+2)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+2)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # MASK (+2)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+2) BEFORE = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+2) AFTER  = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+3)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+3)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (+3)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+3) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (+3) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]

    # VS1 (+4)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+4)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # MASK (+4)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+4) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+5)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]

    # VS2 (+5)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]
    # MASK (+5)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+5) BEFORE = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # VD (+5) AFTER  = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]

    # VS1 (+6)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (+6)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (+6)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+6) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+6) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]

    # VS1 (+7)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+7)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # MASK (+7)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+7) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+7) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmflt.vv v17, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v17, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 8, Use Mask = 0, VL = 128\n")
   
    





    # VS1 (v0)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v24)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v16) AFTER  = [   0    1    1    1    0    0    0    0    1    1    1    1    0    0    0    1]

    # VS1 (+1)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]

    # VS2 (+1)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+1) AFTER  = [   1    1    0    0    0    0    1    1    1    1    0    0    0    1    1    0]

    # VS1 (+2)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]

    # VS2 (+2)       = [7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+2) AFTER  = [   0    0    0    0    1    1    1    1    0    0    0    1    1    0    0    1]

    # VS1 (+3)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (+3)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+3) AFTER  = [   0    0    1    1    1    1    0    0    0    1    1    0    0    1    1    1]

    # VS1 (+4)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]

    # VS2 (+4)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+4) AFTER  = [   1    1    1    1    0    0    0    1    1    0    0    1    1    1    0    0]

    # VS1 (+5)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]

    # VS2 (+5)       = [d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (+5) AFTER  = [   1    1    0    0    0    1    1    0    0    1    1    1    0    0    0    0]

    # VS1 (+6)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (+6)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (+6) AFTER  = [   0    0    0    1    1    0    0    1    1    1    0    0    0    0    1    1]

    # VS1 (+7)       = [8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00]

    # VS2 (+7)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # VD (+7) AFTER  = [   0    1    1    0    0    1    1    1    0    0    0    0    1    1    1    1]


    
    
    vmflt.vv v16, v24, v0
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3c670f1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c670f19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc670f19c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x670f19c3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
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
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00

	.align 4
test_1_maskdata:
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
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

