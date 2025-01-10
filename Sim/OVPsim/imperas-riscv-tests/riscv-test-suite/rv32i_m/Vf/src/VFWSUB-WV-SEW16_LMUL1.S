// RISC-V Architectural Validation Test VFWSUB-WV-SEW16_LMUL1
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
//    SEW=16, LMUL=1
// Description: Testing instruction 'vfwsub.wv'.

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
    vsetvli x0, x7, e32,m1
    vle32.v v1, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")

    





    # VS1 (v1)        = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v16)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v30) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v30) AFTER  = [3c008189 00005d08 ff800000 ff800000 d1670001 7c007c00 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v30, v16, v1, v0.t
    



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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e32,m1
    vle32.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")

    





    # VS1 (v0)        = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v18)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v28) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v28) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 fc00fc00 d1670001 ff800000 ff800000 b3800000 422ce808 7f800000 7f800000 422ce000 fc00fc00]



    vfwsub.wv v28, v18, v0
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x422ce000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x422ce808)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb3800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
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
    vsetvli x0, x7, e32,m1
    vle32.v v2, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v26, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")

    





    # VS1 (v2)        = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v20)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # MASK (v0)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     mmmm]
    # VD (v26) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v26) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 5d080000 5d080000 81893c00 3c008189]



    vfwsub.wv v26, v20, v2, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e32,m1
    vle32.v v3, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v22, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")

    





    # VS1 (v3)        = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v22)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v24) AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 ff800000 ff800000 fc00fc00 d1670001 7c007c00 5d080000]



    vfwsub.wv v24, v22, v3
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
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
    vsetvli x0, x8, e32,m1
    vle32.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 1, Use Mask = 1, VL = 4\n")

    





    # VS1 (v4)        = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v24)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # MASK (v0)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        1        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     ffff]
    # VD (v22) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v22) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 7f800000 422ce000 fc00fc00]



    vfwsub.wv v22, v24, v4, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x422ce000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    vsetvli x0, x8, e32,m1
    vle32.v v5, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 1, Use Mask = 0, VL = 2\n")

    





    # VS1 (v5)        = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v26)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v20) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v20) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 ff800000 ff800000]



    vfwsub.wv v20, v26, v5
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
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
    vsetvli x0, x8, e32,m1
    vle32.v v6, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 1, Use Mask = 1, VL = 0\n")

    





    # VS1 (v6)        = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v28)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v18) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v18) AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v18, v28, v6, v0.t
    



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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e32,m1
    vle32.v v7, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 1, Use Mask = 0, VL = 16\n")

    





    # VS1 (v7)        = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v30)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v16) AFTER  = [5d080000 81893c00 3c00e3c9 bf800000 7c007c00 37c48000 fc00fc00 d1670001 ff800000 ff800000 b3800000 422ce808 7f800000 7f800000 422ce000 fc00fc00]



    vfwsub.wv v16, v30, v7
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x422ce000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x422ce808)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb3800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37c48000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbf800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00e3c9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
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
    vsetvli x0, x4, e32,m1
    vle32.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 1, Use Mask = 1, VL = 10\n")

    





    # VS1 (v8)        = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v2)        = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v14) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v14) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]



    vfwsub.wv v14, v2, v8, v0.t
    



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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    vsetvli x0, x4, e32,m1
    vle32.v v9, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 1, Use Mask = 0, VL = 8\n")

    





    # VS1 (v9)        = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v0)        = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v12) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v12) AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 422ce808 b3800000 ff800000 ff800000 fc00fc00 d1670001 7c007c00 5d080000]



    vfwsub.wv v12, v0, v9
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb3800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x422ce808)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
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
    vsetvli x0, x4, e32,m1
    vle32.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 1, Use Mask = 1, VL = 6\n")

    





    # VS1 (v12)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v4)        = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # MASK (v0)       = [       1        0        0        0        0        0        0        1        1        0        0        0        1        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     ffff     mmmm     mmmm     ffff]
    # VD (v10) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v10) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 7f800000 00005d08 7c007c00 fc00fc00]



    vfwsub.wv v10, v4, v12, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    vsetvli x0, x4, e32,m1
    vle32.v v10, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 1, Use Mask = 0, VL = 4\n")

    





    # VS1 (v10)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v6)        = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v8)  AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 5d080000 c3a10000 ff800000 ff800000]



    vfwsub.wv v8, v6, v10
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a10000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
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
    vsetvli x0, x8, e32,m1
    vle32.v v11, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 1, Use Mask = 1, VL = 2\n")

    





    # VS1 (v11)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v8)        = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm]
    # VD (v6)  BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v6)  AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v6, v8, v11, v0.t
    



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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e32,m1
    vle32.v v13, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 1, Use Mask = 0, VL = 0\n")

    





    # VS1 (v13)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v10)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v4)  BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v4)  AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]



    vfwsub.wv v4, v10, v13
    



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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
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
    vsetvli x0, x8, e32,m1
    vle32.v v14, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")

    





    # VS1 (v14)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v12)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # MASK (v0)       = [       1        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v2)  BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v2)  AFTER  = [7f800000 7f800000 7c007c00 5d080000 ff800000 ff800000 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]



    vfwsub.wv v2, v12, v14, v0.t
    



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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    vsetvli x0, x8, e32,m1
    vle32.v v15, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")

    





    # VS1 (v15)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v16)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v0)  AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7f800000 7f800000 422ce808 b3800000 ff800000 ff800000 fc00fc00 d1670001 7c007c00 5d080000]



    vfwsub.wv v0, v16, v15
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb3800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x422ce808)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
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
    vsetvli x0, x4, e32,m1
    vle32.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v14, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")

    





    # VS1 (v16)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v14)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # MASK (v0)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v30) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v30) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]



    vfwsub.wv v30, v14, v16, v0.t
    



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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    vsetvli x0, x4, e32,m1
    vle32.v v17, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")

    





    # VS1 (v17)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v18)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v28) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v28) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 d1670001 7c007c00 5d080000 c3a10000 ff800000 ff800000]



    vfwsub.wv v28, v18, v17
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a10000)
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
    vsetvli x0, x4, e32,m1
    vle32.v v18, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 16, LMUL = 1, Use Mask = 1, VL = 4\n")

    





    # VS1 (v18)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v20)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        0        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm]
    # VD (v26) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v26) AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v26, v20, v18, v0.t
    



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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    vsetvli x0, x4, e32,m1
    vle32.v v19, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 16, LMUL = 1, Use Mask = 0, VL = 2\n")

    





    # VS1 (v19)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v22)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v24) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v24) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 422ce000 fc00fc00]



    vfwsub.wv v24, v22, v19
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x422ce000)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
    vsetvli x0, x4, e32,m1
    vle32.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 16, LMUL = 1, Use Mask = 1, VL = 0\n")

    





    # VS1 (v20)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v24)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # MASK (v0)       = [       0        1        0        1        1        1        0        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v22) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v22) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]



    vfwsub.wv v22, v24, v20, v0.t
    



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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    vsetvli x0, x4, e32,m1
    vle32.v v22, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 16, LMUL = 1, Use Mask = 0, VL = 16\n")

    





    # VS1 (v22)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v26)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v20) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v20) AFTER  = [00005d08 7c007c00 ff800000 ff800000 d1670001 7c007c00 7f800000 7f800000 422ce808 b3800000 ff800000 ff800000 fc00fc00 d1670001 7c007c00 5d080000]



    vfwsub.wv v20, v26, v22
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb3800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x422ce808)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
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
    vsetvli x0, x4, e32,m1
    vle32.v v21, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 16, LMUL = 1, Use Mask = 1, VL = 10\n")

    





    # VS1 (v21)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v28)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # MASK (v0)       = [       1        1        0        1        0        0        0        1        0        1        1        0        0        1        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff]
    # VD (v18) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v18) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 d1670001 d1670001 ff800000 b3800000 81893c00 3c008189 7f800000 422ce000 fc00fc00]



    vfwsub.wv v18, v28, v21, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x422ce000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb3800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    vsetvli x0, x4, e32,m1
    vle32.v v23, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 16, LMUL = 1, Use Mask = 0, VL = 8\n")

    





    # VS1 (v23)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v30)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v16) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 37c48000 fc00fc00 d1670001 7c007c00 5d080000 c3a10000 ff800000 ff800000]



    vfwsub.wv v16, v30, v23
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a10000)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37c48000)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
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
    vsetvli x0, x8, e32,m1
    vle32.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 16, LMUL = 1, Use Mask = 1, VL = 6\n")

    





    # VS1 (v24)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v2)        = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     ffff]
    # VD (v14) BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v14) AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 5d080000]



    vfwsub.wv v14, v2, v24, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    vsetvli x0, x8, e32,m1
    vle32.v v25, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 16, LMUL = 1, Use Mask = 0, VL = 4\n")

    





    # VS1 (v25)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v0)        = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (v12) BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v12) AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 7f800000 7f800000 422ce000 fc00fc00]



    vfwsub.wv v12, v0, v25
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x422ce000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
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
    vsetvli x0, x8, e32,m1
    vle32.v v26, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 16, LMUL = 1, Use Mask = 1, VL = 2\n")

    





    # VS1 (v26)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v4)        = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm]
    # VD (v10) BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v10) AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]



    vfwsub.wv v10, v4, v26, v0.t
    



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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+324
    vsetvli x0, x8, e32,m1
    vle32.v v27, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 16, LMUL = 1, Use Mask = 0, VL = 0\n")

    





    # VS1 (v27)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v6)        = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v8)  BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v8)  AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v8, v6, v27
    



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
    vsetvli x0, x7, e32,m1
    vle32.v v28, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v6, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")

    





    # VS1 (v28)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v8)        = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # MASK (v0)       = [       1        0        0        0        0        0        0        1        1        0        0        0        1        0        0        1]
    # ELEMENTS          [    ffff     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     ffff]
    # VD (v6)  BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v6)  AFTER  = [5d080000 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 d1670001 ff800000 7c007c00 5d080000 81893c00 7f800000 00005d08 7c007c00 fc00fc00]



    vfwsub.wv v6, v8, v28, v0.t
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    vsetvli x0, x7, e32,m1
    vle32.v v29, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v10, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")

    





    # VS1 (v29)       = [    fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00]

    # VS2 (v10)       = [fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v4)  BEFORE = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189]
    # VD (v4)  AFTER  = [0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 c3a10000 7c007c00 37c48000 fc00fc00 d1670001 7c007c00 5d080000 c3a10000 ff800000 ff800000]



    vfwsub.wv v4, v10, v29
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc3a10000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37c48000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc3a10000)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
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
    vsetvli x0, x7, e32,m1
    vle32.v v30, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")

    





    # VS1 (v30)       = [    0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001     7c00     7c00     5d08     0000     8189     3c00]

    # VS2 (v12)       = [00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000]
    # MASK (v0)       = [       0        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm]
    # VD (v2)  BEFORE = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]
    # VD (v2)  AFTER  = [3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00]



    vfwsub.wv v2, v12, v30, v0.t
    



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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
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
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+372
    vsetvli x0, x7, e32,m1
    vle32.v v31, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")

    





    # VS1 (v31)       = [    5d08     0000     8189     3c00     3c00     8189     0000     5d08     7c00     7c00     0001     d167     fc00     fc00     d167     0001]

    # VS2 (v14)       = [5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167]
    # VD (v0)  AFTER  = [7c007c00 5d080000 81893c00 3c008189 00005d08 7c007c00 0001d167 fc00fc00 d1670001 7c007c00 b3800000 422ce808 7f800000 7f800000 422ce000 fc00fc00]



    vfwsub.wv v0, v14, v31
    



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x422ce000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x422ce808)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb3800000)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
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

