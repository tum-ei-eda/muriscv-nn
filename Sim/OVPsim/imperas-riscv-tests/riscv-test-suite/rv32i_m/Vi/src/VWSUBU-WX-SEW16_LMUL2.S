// RISC-V Architectural Validation Test VWSUBU-WX-SEW16_LMUL2
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
// Description: Testing instruction 'vwsubu.wx'.

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
    vsetvli x6, x7, e32,m4
    li x31, 0
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vle32.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v28, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 2, Use Mask = 1, VL = 32\n")

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27]
    # MASK (v0)       = [       0        0        0        0        0        0        0        1        1        1        1        0        1        1        1        1]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (v28) BEFORE = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d]
    # VD (v28) AFTER  = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf e54c8c1e c737ad3a e31ffa64 0466250f 0466250f 91a8d5fd 20219a51 429ede3d 86569d27]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # MASK (+1)       = [       0        0        0        1        0        1        0        1        0        0        0        1        1        0        1        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # VD (+1) AFTER  = [3874f8a5 5b086787 62f6cb6d d1bc7dd8 d1bc7dd8 37bf4071 37bf4071 d4983650 d4983650 5233a4dd 824d39ae b02d663e 67dd3492 67dd3492 34267ad9 34267ad9]


    
    vwsubu.wx v28, v16, x31, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86569d27)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x429ede3d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x20219a51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91a8d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0466250f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0466250f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffa64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf600a3d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b80fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34267ad9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34267ad9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4983650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4983650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x30, 0
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vle32.v v20, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v24, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 2, Use Mask = 0, VL = 23\n")

    





    # RS1  (x30)       = 0

    # VS2 (v20)       = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65]
    # VD (v24) AFTER  = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # VD (+1) AFTER  = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]


    
    vwsubu.wx v24, v20, x30



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91a8d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd8f6c65)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0466250f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffa64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca660db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf600a3d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b80fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34267ad9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x681454c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d3f1c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4983650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc88d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b3c30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x29, -2047
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vle32.v v24, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v20, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # RS1  (x29)       = -2047

    # VS2 (v24)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64]
    # MASK (v0)       = [       0        0        0        0        1        1        1        1        1        1        0        1        0        1        0        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (v20) BEFORE = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a]
    # VD (v20) AFTER  = [824d39ae b2d3f1c5 b02d663e 67dd3492 342582d8 3aee67f3 34b717d3 f5ffabd0 195a6abe fbb982e6 fbba7ae7 0691e2de 0692dadf e54b941d e54c8c1e c737ad3a]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # MASK (+1)       = [       0        0        1        1        0        1        0        0        1        0        1        1        1        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (+1) BEFORE = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # VD (+1) AFTER  = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]


    
    vwsubu.wx v20, v24, x29, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54b941d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0691e2de)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbb982e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195a6abe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5ffabd0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b717d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aee67f3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x342582d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d3f1c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4983650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc88d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b3c30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb32a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d5081b)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x28, -1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vle32.v v28, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v16, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # RS1  (x28)       = -1

    # VS2 (v28)       = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf]
    # VD (v16) AFTER  = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 681354c1 34257ada 3aee5ff5 34b70fd5 f5ffa3d2 195a62c0 fbb97ae8 2c62c848 0691dae0 7ca560dc]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # VD (+1) AFTER  = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]


    
    vwsubu.wx v16, v28, x28



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca560dc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0691dae0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c62c848)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbb97ae8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195a62c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5ffa3d2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b70fd5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aee5ff5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34257ada)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x681354c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d3f1c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4983650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc88d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b3c30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb32a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d5081b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2fb1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0b56ed8c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x484605f6)
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
    vsetvli x3, x8, e32,m4
    li x27, -4660
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # RS1  (x27)       = -4660

    # VS2 (v4)        = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # MASK (v0)       = [       0        1        1        0        0        1        1        1        1        0        0        0        0        1        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (v12) BEFORE = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf]
    # VD (v12) AFTER  = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 67dc46c6 67dd3492 681454c0 34267ad9 3aef5ff4 f5ffb605 195a74f3 fbb98d1b]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # MASK (+1)       = [       0        1        0        1        1        0        1        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (+1) BEFORE = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # VD (+1) AFTER  = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]


    
    vwsubu.wx v12, v4, x27, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfbb98d1b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x195a74f3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf5ffb605)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3aef5ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dc46c6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x26, 2147483648
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # RS1  (x26)       = 2147483648

    # VS2 (v0)        = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # VD (v8)  AFTER  = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # VD (+1) AFTER  = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]


    
    vwsubu.wx v8, v0, x26



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3aef5ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02d663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x25, 4660
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v4, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # RS1  (x25)       = 4660

    # VS2 (v8)        = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # MASK (v0)       = [       1        0        0        0        1        1        0        1        1        1        1        1        1        0        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     ffff]
    # VD (v4)  BEFORE = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # VD (v4)  AFTER  = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd b2d3df91 b2d3f1c5 67dd225e 6814428c]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # MASK (+1)       = [       0        1        0        0        0        0        1        0        0        1        1        0        1        0        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     ffff]
    # VD (+1) BEFORE = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # VD (+1) AFTER  = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]


    
    vwsubu.wx v4, v8, x25, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6814428c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd225e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3df91)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe0e9092c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf6323d52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x73b3e156)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x24, 4294967295
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vle32.v v12, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # RS1  (x24)       = 4294967295

    # VS2 (v12)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v0)  BEFORE = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # VD (v0)  AFTER  = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 824c39af b2d2f1c6]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (+1) BEFORE = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # VD (+1) AFTER  = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]


    
    vwsubu.wx v0, v12, x24



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d2f1c6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824c39af)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe0e9092c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf6323d52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x73b3e156)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4bfb003d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86b081d4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf22b6484)
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
    vsetvli x3, x4, e32,m4
    li x23, 1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # RS1  (x23)       = 1

    # VS2 (v16)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # MASK (v0)       = [       1        0        1        0        1        1        0        1        0        0        0        1        0        1        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v28) BEFORE = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # VD (v28) AFTER  = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # MASK (+1)       = [       1        0        0        0        1        0        1        1        1        1        1        1        1        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # VD (+1) AFTER  = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]


    
    vwsubu.wx v28, v16, x23, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075c1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff09378)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b327ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4c52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5081b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2fb1a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b56ed8c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x484605f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aeeeb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9d848f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5cd04)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b1a8042)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xda4c9686)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b8dfb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe0e9092c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6323d52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3e156)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x22, 2147483647
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # RS1  (x22)       = 2147483647

    # VS2 (v20)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # VD (v24) AFTER  = [b5adeeb6 484505f7 0b55ed8d 17a1fb1b 03d4081c b3294c53 9b317ba9 4fef9379 951d8622 6074c1a3 3873f8a6 5b076788 62f5cb6e a967a980 d1bb7dd9 c83a3c31]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # VD (+1) AFTER  = [05242533 169cbce9 3b9a3ddd 0cc8d6c9 93af6679 f22a6485 86af81d5 4bfa003e 73b2e157 f6313d53 e0e8092d 426a8dfc da4b9687 9b198043 8dd4cd05 fc9c8490]


    
    vwsubu.wx v24, v20, x22



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83a3c31)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bb7dd9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa967a980)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f5cb6e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b076788)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3873f8a6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6074c1a3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951d8622)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4fef9379)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b317ba9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb3294c53)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d4081c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a1fb1b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b55ed8d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x484505f7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5adeeb6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9c8490)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd4cd05)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b198043)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xda4b9687)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426a8dfc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe0e8092d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6313d53)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b2e157)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfa003e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86af81d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22a6485)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93af6679)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc8d6c9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9a3ddd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169cbce9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05242533)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x21, 124076833
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # RS1  (x21)       = 124076833

    # VS2 (v24)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # MASK (v0)       = [       1        1        0        1        1        1        1        1        1        1        1        0        0        0        0        1]
    # ELEMENTS          [    ffff     ffff     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff]
    # VD (v20) BEFORE = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # VD (v20) AFTER  = [9b1a3d21 8dd589e3 8dd5cd04 b5aeab94 4845c2d5 0b56aa6b 17a2b7f9 03d4c4fa b32a0931 9b323887 4ff05057 4ff09378 951e8621 6075c1a2 3874f8a5 62f6884c]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # MASK (+1)       = [       1        1        0        1        1        1        1        1        1        1        0        0        1        0        1        0]
    # ELEMENTS          [    ffff     ffff     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff]
    # VD (+1) BEFORE = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # VD (+1) AFTER  = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 86b03eb3 86b081d4 4bfb003d f631fa31 f6323d52 426b4ada 426b8dfb]


    
    vwsubu.wx v20, v24, x21, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6884c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075c1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff09378)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff05057)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b323887)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a0931)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d4c4fa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2b7f9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b56aa6b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4845c2d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aeab94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5cd04)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd589e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b1a3d21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b8dfb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b4ada)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6323d52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf631fa31)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b03eb3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x20, 2048
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # RS1  (x20)       = 2048

    # VS2 (v28)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # VD (v16) AFTER  = [e0e9012c 426b85fb da4c8e86 9b1a7842 8dd5c504 fc9d7c8f b5aee6b5 4845fdf6 0b56e58c 17a2f31a 03d5001b b32a4452 9b3273a8 4ff08b78 951e7e21 6075b9a2]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # VD (+1) AFTER  = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]


    
    vwsubu.wx v16, v28, x20



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075b9a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e7e21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff08b78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b3273a8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4452)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5001b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2f31a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b56e58c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4845fdf6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aee6b5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9d7c8f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5c504)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b1a7842)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xda4c8e86)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b85fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe0e9012c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3e156)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
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
    vsetvli x7, x8, e32,m4
    li x19, 0
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vle32.v v4, (x6)      # Load value into vs2
    add x6, x6, x7
    vle32.v v12, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # RS1  (x19)       = 0

    # VS2 (v4)        = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # MASK (v0)       = [       0        1        1        0        0        1        0        0        1        0        1        0        0        0        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (v12) BEFORE = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # VD (v12) AFTER  = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 fc9d848f fc9d848f 484605f6 484605f6 0b56ed8c 17a2fb1a b32a4c52 b32a4c52]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # MASK (+1)       = [       0        0        1        1        0        1        0        1        0        1        0        1        1        1        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (+1) BEFORE = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # VD (+1) AFTER  = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]


    
    vwsubu.wx v12, v4, x19, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x17a2fb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c9686)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05252532)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbe57f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe92f674b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97056592)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    li x18, 2047
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vle32.v v0, (x6)      # Load value into vs2
    add x6, x6, x7
    vle32.v v8, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # RS1  (x18)       = 2047

    # VS2 (v0)        = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # VD (v8)  AFTER  = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c da4c8e87 9b1a7843 8dd5c505 fc9d7c90 b5aee6b6 4845fdf7 0b56e58d 17a2f31b]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # VD (+1) AFTER  = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]


    
    vwsubu.wx v8, v0, x18



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x17a2f31b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56e58d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4845fdf7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aee6b6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d7c90)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5c505)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a7843)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c8e87)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05252532)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbe57f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe92f674b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97056592)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    li x17, -1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vle32.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    vle32.v v4, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # RS1  (x17)       = -1

    # VS2 (v8)        = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # MASK (v0)       = [       1        0        0        1        0        1        0        0        0        1        0        0        1        0        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (v4)  BEFORE = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # VD (v4)  AFTER  = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb 9b198043 9b1a8042 fc9c8490 fc9d848f]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # MASK (+1)       = [       1        1        0        0        0        0        0        1        1        0        0        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (+1) BEFORE = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # VD (+1) AFTER  = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]


    
    vwsubu.wx v4, v8, x17, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9c8490)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b198043)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05252532)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbe57f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe92f674b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97056592)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x47c6f638)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3a22eae)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ed86866)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    li x16, 1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vle32.v v12, (x6)      # Load value into vs2
    add x6, x6, x7
    vle32.v v0, (x6)       # Load value into vd
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # RS1  (x16)       = 1

    # VS2 (v12)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # VD (v0)  AFTER  = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 e0e9092b 426b8dfa da4c9685 9b1a8041]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # VD (+1) AFTER  = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]


    
    vwsubu.wx v0, v12, x16



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8041)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c9685)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05252532)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbe57f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe92f674b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97056592)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x47c6f638)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3a22eae)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ed86866)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe6b6a11c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4daa96d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd7a568f0)
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
    vsetvli x3, x4, e32,m4
    li x15, 0
    la x2, test_1_data+192
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 16, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # RS1  (x15)       = 0

    # VS2 (v16)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # MASK (v0)       = [       0        0        0        0        0        1        0        0        1        1        1        0        0        1        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (v28) BEFORE = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # VD (v28) AFTER  = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 e0e9092c]

    # RS1  (x15)       = 0

    # VS2 (+1)       = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # MASK (+1)       = [       0        1        1        0        1        0        1        1        0        0        1        1        1        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (+1) BEFORE = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # VD (+1) AFTER  = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]


    
    vwsubu.wx v28, v16, x15, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe0e9092c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3e156)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x14, 0
    la x2, test_1_data+204
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 16, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # RS1  (x14)       = 0

    # VS2 (v20)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v24) BEFORE = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # VD (v24) AFTER  = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]

    # RS1  (x14)       = 0

    # VS2 (+1)       = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # VD (+1) AFTER  = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]


    
    vwsubu.wx v24, v20, x14



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x13, -2047
    la x2, test_1_data+216
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 16, LMUL = 2, Use Mask = 1, VL = 32\n")

    





    # RS1  (x13)       = -2047

    # VS2 (v24)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # MASK (v0)       = [       0        0        1        0        0        0        1        0        1        0        1        1        1        1        0        1]
    # ELEMENTS          [    mmmm     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff]
    # VD (v20) BEFORE = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # VD (v20) AFTER  = [c47c5d71 0be793b3 527d89e2 527e81e3 ea35fe19 445da8cc 8bfbb514 8bfcad15 e92e6f4a e92f674b a2158351 05242d31 169cc4e7 3b9a45db 3b9b3ddc 93af6e77]

    # RS1  (x13)       = -2047

    # VS2 (+1)       = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # MASK (+1)       = [       1        0        0        1        1        0        0        0        0        1        1        1        1        1        1        1]
    # ELEMENTS          [    mmmm     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     ffff     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff]
    # VD (+1) BEFORE = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # VD (+1) AFTER  = [4c441a0a 4c45120b 353308fb f1bbe04c 69140990 69150191 3be0154f dfcadfe1 66652ebf 4da99ed4 e6b5a91b 4ed77065 c3a136ad 47c5fe37 24df6d8b c47b6570]


    
    vwsubu.wx v20, v24, x13, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93af6e77)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9a45db)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169cc4e7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05242d31)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2158351)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92e6f4a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfbb514)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527d89e2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47b6570)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24df6d8b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c5fe37)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a136ad)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed77065)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b5a91b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4da99ed4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69140990)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bbe04c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c441a0a)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x12, -1
    la x2, test_1_data+228
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 16, LMUL = 2, Use Mask = 0, VL = 23\n")

    





    # RS1  (x12)       = -1

    # VS2 (v28)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # VD (v16) AFTER  = [47c5f639 24df658d c47b5d72 0be693b4 79e810de 527d81e4 ea34fe1a 445ca8cd 4e1081ea 8bfbad16 97046593 e92e674c 9fcae580 a2157b53 05242533 169cbce9]

    # RS1  (x12)       = -1

    # VS2 (+1)       = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # VD (+1) AFTER  = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 dfc9dfe2 66642ec0 d7a468f1 4da996d6 e6b5a11d 4ed76867 c3a12eaf]


    
    vwsubu.wx v16, v28, x12



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169cbce9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05242533)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2157b53)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcae580)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92e674c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97046593)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfbad16)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1081ea)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445ca8cd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea34fe1a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527d81e4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e810de)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be693b4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47b5d72)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24df658d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c5f639)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a12eaf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed76867)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b5a11d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4da996d6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a468f1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66642ec0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfc9dfe2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
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
    vsetvli x3, x4, e32,m4
    li x11, -4660
    la x2, test_1_data+240
    li x3, 4
    add x2, x2, x3
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 16, LMUL = 2, Use Mask = 1, VL = 16\n")

    





    # RS1  (x11)       = -4660

    # VS2 (v4)        = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # MASK (v0)       = [       1        1        0        0        1        1        0        0        1        0        1        1        0        0        0        1]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     ffff     ffff     mmmm     mmmm     mmmm     ffff]
    # VD (v12) BEFORE = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # VD (v12) AFTER  = [e6b5b350 4ed77a9a 4ed86866 c3a22eae 24df77c0 c47b6fa5 c47c5d71 0be793b3 527d9417 527e81e3 445cbb00 4e10941d 4e1181e9 8bfcad15 97056592 9fcaf7b3]

    # RS1  (x11)       = -4660

    # VS2 (+1)       = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # MASK (+1)       = [       1        0        0        1        1        1        0        1        1        1        0        0        1        1        1        0]
    # ELEMENTS          [    ffff     ffff     mmmm     mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     ffff     ffff     mmmm     mmmm     mmmm     ffff]
    # VD (+1) BEFORE = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # VD (+1) AFTER  = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]


    
    vwsubu.wx v12, v4, x11, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcaf7b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e10941d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445cbb00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527d9417)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47b6fa5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24df77c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed77a9a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b5b350)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x10, 2147483648
    la x2, test_1_data+252
    li x3, 4
    add x2, x2, x3
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 16, LMUL = 2, Use Mask = 0, VL = 10\n")

    





    # RS1  (x10)       = 2147483648

    # VS2 (v0)        = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # VD (v8)  AFTER  = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]

    # RS1  (x10)       = 2147483648

    # VS2 (+1)       = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # VD (+1) AFTER  = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]


    
    vwsubu.wx v8, v0, x10



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x9, 4660
    la x2, test_1_data+264
    li x3, 4
    add x2, x2, x3
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v4, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 16, LMUL = 2, Use Mask = 1, VL = 8\n")

    





    # RS1  (x9)        = 4660

    # VS2 (v8)        = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # MASK (v0)       = [       1        0        1        0        1        1        1        0        1        0        1        0        1        1        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm]
    # VD (v4)  BEFORE = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # VD (v4)  AFTER  = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c c3a21c7a c3a22eae 24e05358 24e0658c 0be7817f 79e8fea9 527e6faf 527e81e3]

    # RS1  (x9)        = 4660

    # VS2 (+1)       = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # MASK (+1)       = [       1        1        0        0        1        1        1        0        1        0        1        1        0        1        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     mmmm     ffff     ffff     ffff     mmmm]
    # VD (+1) BEFORE = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # VD (+1) AFTER  = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]


    
    vwsubu.wx v4, v8, x9, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e6faf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e8fea9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be7817f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e05358)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a21c7a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95a74545)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8b4ecba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd1b37e5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    li x8, 4294967295
    la x2, test_1_data+276
    li x3, 4
    add x2, x2, x3
    vle32.v v12, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 16, LMUL = 2, Use Mask = 0, VL = 6\n")

    





    # RS1  (x8)        = 4294967295

    # VS2 (v12)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # VD (v0)  AFTER  = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 4ed76867 c3a12eaf 47c5f639 24df658d c47b5d72 0be693b4]

    # RS1  (x8)        = 4294967295

    # VS2 (+1)       = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # VD (+1) AFTER  = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]


    
    vwsubu.wx v0, v12, x8



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be693b4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47b5d72)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24df658d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c5f639)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a12eaf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed76867)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95a74545)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8b4ecba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd1b37e5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4f031546)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x918f472f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xac98e804)
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
    vsetvli x3, x8, e32,m4
    li x7, 1
    la x2, test_1_data+288
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 16, LMUL = 2, Use Mask = 1, VL = 4\n")

    





    # RS1  (x7)        = 1

    # VS2 (v16)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # MASK (v0)       = [       0        1        0        0        1        1        1        1        0        0        1        1        0        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     mmmm]
    # VD (v28) BEFORE = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # VD (v28) AFTER  = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 4ed86865 4ed86866 c3a22eae]

    # RS1  (x7)        = 1

    # VS2 (+1)       = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # MASK (+1)       = [       1        1        1        1        0        0        0        1        0        1        0        0        0        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     mmmm]
    # VD (+1) BEFORE = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]
    # VD (+1) AFTER  = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]


    
    vwsubu.wx v28, v16, x7, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86865)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7a568f0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66652ebf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45120b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b91dcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11e73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd1b37e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f031546)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c98a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x6, 2147483647
    la x2, test_1_data+300
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 16, LMUL = 2, Use Mask = 0, VL = 2\n")

    





    # RS1  (x6)        = 2147483647

    # VS2 (v20)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (v24) BEFORE = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # VD (v24) AFTER  = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf 4da996d6 e6b5a11d]

    # RS1  (x6)        = 2147483647

    # VS2 (+1)       = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff]
    # VD (+1) BEFORE = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]
    # VD (+1) AFTER  = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]


    
    vwsubu.wx v24, v20, x6



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b5a11d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4da996d6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66652ebf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45120b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b91dcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11e73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd1b37e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f031546)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c98a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a201a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc447722)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbaceb7)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x5, 124076833
    la x2, test_1_data+312
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 16, LMUL = 2, Use Mask = 1, VL = 0\n")

    





    # RS1  (x5)        = 124076833

    # VS2 (v24)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # MASK (v0)       = [       1        1        1        1        0        0        1        1        0        0        1        1        0        1        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v20) BEFORE = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # VD (v20) AFTER  = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]

    # RS1  (x5)        = 124076833

    # VS2 (+1)       = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # MASK (+1)       = [       0        0        0        0        0        0        1        0        1        0        1        0        1        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]
    # VD (+1) AFTER  = [08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]


    
    vwsubu.wx v20, v24, x5, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45120b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b91dcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11e73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd1b37e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f031546)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c98a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a201a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc447722)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbaceb7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0d2e0a7a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x022f6618)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x08dc09ff)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    li x4, 2048
    la x2, test_1_data+324
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vle32.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 16, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # RS1  (x4)        = 2048

    # VS2 (v28)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # VD (v16) AFTER  = [95a73d45 355e5ca2 04b11673 63b915cd 700a854e 86604080 b64b69f6 65e3bf0c 982bbb36 dbee5694 fde21bd8 4c450a0b 353300fb 734b905d f1bcd04d 6914f991]

    # RS1  (x4)        = 2048

    # VS2 (+1)       = [a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5]
    # VD (+1) AFTER  = [a77d19f4 c1808c4a 08dc01ff 022f5e18 0d2e027a 7cbac6b7 dc446f22 31a1f9a7 995cc3f8 1150fd7d 311c90a1 ac98e004 918f3f2f 4f030d46 cd1b2fe5 8b4ec3a8]


    
    vwsubu.wx v16, v28, x4



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6914f991)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd04d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b905d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353300fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c450a0b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde21bd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5694)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bbb36)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3bf0c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b69f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604080)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a854e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b915cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11673)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e5ca2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a73d45)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ec3a8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd1b2fe5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f030d46)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f3f2f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e004)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c90a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1150fd7d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995cc3f8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a1f9a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc446f22)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbac6b7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0d2e027a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x022f5e18)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x08dc01ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc1808c4a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa77d19f4)
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
    vsetvli x6, x7, e32,m4
    li x3, 0
    la x5, test_1_data+336
    li x6, 4
    add x5, x5, x6
    vle32.v v4, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v12, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 16, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # RS1  (x3)        = 0

    # VS2 (v4)        = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # MASK (v0)       = [       0        1        1        1        1        1        0        1        0        1        0        0        1        0        1        1]
    # ELEMENTS          [    mmmm     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     ffff]
    # VD (v12) BEFORE = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # VD (v12) AFTER  = [918f472f cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 04b11e73 700a8d4e 700a8d4e b64b71f6 b64b71f6 65e3c70c dbee5e94 dbee5e94 4c45120b 353308fb]

    # RS1  (x3)        = 0

    # VS2 (+1)       = [f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]
    # MASK (+1)       = [       0        0        0        0        0        1        1        1        1        0        0        1        0        0        0        1]
    # ELEMENTS          [    mmmm     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     ffff]
    # VD (+1) BEFORE = [a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804]
    # VD (+1) AFTER  = [a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 995ccbf8 995ccbf8 1151057d 311c98a1 918f472f]


    
    vwsubu.wx v12, v4, x3, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x353308fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c45120b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4ecba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd1b37e5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cbaceb7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d2e0a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x022f6618)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x2, 2047
    la x5, test_1_data+348
    li x6, 4
    add x5, x5, x6
    vle32.v v0, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v8, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 16, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # RS1  (x2)        = 2047

    # VS2 (v0)        = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # VD (v8)  AFTER  = [311c90a2 ac98e005 918f3f30 4f030d47 cd1b2fe6 8b4ec3a9 95a73d46 355e5ca3 04b11674 63b915ce 700a854f 86604081 b64b69f7 65e3bf0d 982bbb37 dbee5695]

    # RS1  (x2)        = 2047

    # VS2 (+1)       = [c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8]
    # VD (+1) AFTER  = [3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8]


    
    vwsubu.wx v8, v0, x2



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5695)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982bbb37)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3bf0d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b69f7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86604081)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a854f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b915ce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11674)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e5ca3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a73d46)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4ec3a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd1b2fe6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f030d47)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f3f30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e005)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c90a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31a201a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cbaceb7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d2e0a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x022f6618)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x1, -1
    la x5, test_1_data+360
    li x6, 4
    add x5, x5, x6
    vle32.v v8, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v4, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 16, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # RS1  (x1)        = -1

    # VS2 (v8)        = [31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0        1        1        0        0        1        1        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff]
    # VD (v4)  BEFORE = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # VD (v4)  AFTER  = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 4f021547 4f031546 8b4dcba9 95a64546 95a74545 355e64a2 63b81dce 70098d4f 865f4881 b64a71f7]

    # RS1  (x1)        = -1

    # VS2 (+1)       = [e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722]
    # MASK (+1)       = [       0        1        0        0        1        1        0        0        1        0        0        0        0        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ffff     mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7]
    # VD (+1) AFTER  = [4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7]


    
    vwsubu.wx v4, v8, x1, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64a71f7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x865f4881)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x70098d4f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b81dce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a64546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4dcba9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f031546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f021547)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e804)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31a201a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cbaceb7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d2e0a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x022f6618)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf1fab3f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33c2fbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4736f5f4)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    li x0, 0
    la x5, test_1_data+372
    li x6, 4
    add x5, x5, x6
    vle32.v v12, (x5)      # Load value into vs2
    add x5, x5, x6
    vle32.v v0, (x5)       # Load value into vd
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 16, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # RS1  (x0)        = 0

    # VS2 (v12)       = [0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # VD (v0)  AFTER  = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]

    # RS1  (x0)        = 0

    # VS2 (+1)       = [bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [44aae55f bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff]
    # VD (+1) AFTER  = [44aae55f bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff]


    
    vwsubu.wx v0, v12, x0



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4ecba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd1b37e5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f031546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31a201a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cbaceb7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d2e0a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x022f6618)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf1fab3f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33c2fbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4736f5f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x603b2dde)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbacc4de5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44aae55f)
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
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51
	.word 0x91a8d5fd
	.word 0xbd8f6c65
	.word 0x466250f
	.word 0xe31ffa64
	.word 0xc737ad3a
	.word 0xe54c8c1e
	.word 0x7ca660db
	.word 0x692dadf
	.word 0x2c63c847
	.word 0xfbba7ae7
	.word 0x195b62bf
	.word 0xf600a3d1
	.word 0x34b80fd4
	.word 0x3aef5ff4
	.word 0x34267ad9
	.word 0x681454c0
	.word 0x67dd3492
	.word 0xb02d663e
	.word 0xb2d3f1c5
	.word 0x824d39ae
	.word 0x5233a4dd
	.word 0xd4983650
	.word 0x18fc88d5
	.word 0x37bf4071
	.word 0xc83b3c30
	.word 0xd1bc7dd8
	.word 0xa968a97f
	.word 0x62f6cb6d
	.word 0x5b086787
	.word 0x3874f8a5
	.word 0x6075c1a2
	.word 0x951e8621
	.word 0x4ff09378
	.word 0x9b327ba8
	.word 0xb32a4c52
	.word 0x3d5081b
	.word 0x17a2fb1a
	.word 0xb56ed8c
	.word 0x484605f6
	.word 0xb5aeeeb5
	.word 0xfc9d848f
	.word 0x8dd5cd04
	.word 0x9b1a8042
	.word 0xda4c9686
	.word 0x426b8dfb
	.word 0xe0e9092c
	.word 0xf6323d52
	.word 0x73b3e156
	.word 0x4bfb003d
	.word 0x86b081d4
	.word 0xf22b6484
	.word 0x93b06678
	.word 0xcc9d6c8
	.word 0x3b9b3ddc
	.word 0x169dbce8
	.word 0x5252532
	.word 0xa2167b52
	.word 0x9fcbe57f
	.word 0xe92f674b
	.word 0x97056592
	.word 0x8bfcad15
	.word 0x4e1181e9
	.word 0x445da8cc
	.word 0xea35fe19
	.word 0x527e81e3
	.word 0x79e910dd
	.word 0xbe793b3
	.word 0xc47c5d71
	.word 0x24e0658c
	.word 0x47c6f638
	.word 0xc3a22eae
	.word 0x4ed86866
	.word 0xe6b6a11c
	.word 0x4daa96d5
	.word 0xd7a568f0
	.word 0x66652ebf
	.word 0xdfcadfe1
	.word 0x3be0154f
	.word 0x69150191
	.word 0xf1bcd84d
	.word 0x734b985d
	.word 0x353308fb
	.word 0x4c45120b
	.word 0xfde223d8
	.word 0xdbee5e94
	.word 0x982bc336
	.word 0x65e3c70c
	.word 0xb64b71f6
	.word 0x86604880
	.word 0x700a8d4e
	.word 0x63b91dcd
	.word 0x4b11e73
	.word 0x355e64a2
	.word 0x95a74545
	.word 0x8b4ecba8
	.word 0xcd1b37e5
	.word 0x4f031546
	.word 0x918f472f
	.word 0xac98e804
	.word 0x311c98a1
	.word 0x1151057d
	.word 0x995ccbf8
	.word 0x31a201a7
	.word 0xdc447722
	.word 0x7cbaceb7
	.word 0xd2e0a7a
	.word 0x22f6618
	.word 0x8dc09ff
	.word 0xc180944a
	.word 0xa77d21f4
	.word 0x24941503
	.word 0xa6f67a71
	.word 0xf0eda4d8
	.word 0xa918c6bb
	.word 0x9f120f74
	.word 0xc86b2e3b
	.word 0x3909add5
	.word 0xf1fab3f6
	.word 0xe33c2fbf
	.word 0x4736f5f4
	.word 0x603b2dde
	.word 0xbacc4de5
	.word 0x44aae55f
	.word 0x12e38ca6
	.word 0x6b3c04e5
	.word 0xc84ed4c6
	.word 0xc67b650a
	.word 0x411718af
	.word 0x5f294993
	.word 0x62ee6a54
	.word 0x4cdd2e22
	.word 0x786cc1ea
	.word 0x7a6d4845
	.word 0x86249714
	.word 0x906418c8
	.word 0x44dccb49
	.word 0xb197d063
	.word 0x2f09b7ed
	.word 0xda7ea5f6
	.word 0x70ed6ebc
	.word 0x987f22bd
	.word 0x74512906
	.word 0x4bb05389
	.word 0x44d184f7
	.word 0x3b9cb04f
	.word 0xb81a0d11
	.word 0x548542a8
	.word 0xf4bfda8f
	.word 0xb2b93289
	.word 0x42d5763
	.word 0x8fe03374
	.word 0x4b384f2b
	.word 0xc1a7e90b
	.word 0x79452d72
	.word 0xfd34f676
	.word 0x7e27d89a
	.word 0x9dceccb1
	.word 0xe19d838b
	.word 0x266cfb3f
	.word 0x8d1c81a4
	.word 0x18bad9d8
	.word 0xcb271ead
	.word 0x3f400082
	.word 0xfbdcdf34
	.word 0xa7cdb976
	.word 0x75ba9522
	.word 0xc0713693
	.word 0xe8d4430c
	.word 0x773d7f5f
	.word 0x3037aa50
	.word 0x819f731b
	.word 0xebb56d4c
	.word 0xceb5aeae
	.word 0x8cf6a1c1
	.word 0x67e86592
	.word 0xf97058cd
	.word 0xea6648be
	.word 0x9f008c39
	.word 0x6d5ea0d2
	.word 0x6697dc2f
	.word 0x51dac950
	.word 0x2e621f75
	.word 0xdad9549b
	.word 0xf37fa864
	.word 0x89dff0d
	.word 0xe1be6916
	.word 0xc2a7edcf
	.word 0x37a7880f
	.word 0xf1444f34
	.word 0x99a4f8e
	.word 0x68ce0f63
	.word 0x3277cf6a
	.word 0x7a8b59c1
	.word 0xdce388e8
	.word 0x27eb62aa
	.word 0x2c7809b8
	.word 0x143a9e71
	.word 0x851f6e45
	.word 0x579e0a27
	.word 0x77f41975
	.word 0x925ae826
	.word 0x4e7a36bc
	.word 0xb4fc0c9c
	.word 0xf02fa737
	.word 0x2acf336
	.word 0x831b5583
	.word 0xb5fec054
	.word 0xa31e0b3f
	.word 0xd46f3d2c
	.word 0x465bb10f
	.word 0x724fb174
	.word 0x351ea5f0
	.word 0x1e980dee
	.word 0xca495a59
	.word 0xd80b68d2
	.word 0xa3926a57
	.word 0x1d141c8d
	.word 0xa7740fdf
	.word 0x6ea35470
	.word 0xf562a3f1
	.word 0x7917d4b
	.word 0x66da64aa
	.word 0xf682191a
	.word 0xfd2ce83f
	.word 0x67f9ab29
	.word 0x112e3ffd
	.word 0xc4d9b1e2
	.word 0x9ed4e137
	.word 0xb49ae54e
	.word 0xd075dd45
	.word 0x74daa72e
	.word 0x48324db4
	.word 0x167d97b5
	.word 0x8b536536
	.word 0xe85755eb
	.word 0x1cd86c0a
	.word 0x4c811ecf
	.word 0x8085dbf1
	.word 0x547cdce3
	.word 0x65d27882
	.word 0xb72d2ec4
	.word 0x954ee841
	.word 0xb36fd636
	.word 0xbc4988da
	.word 0xaea05c04
	.word 0xce7483a6
	.word 0xea0309d7
	.word 0x62498466
	.word 0x1cd29ac4
	.word 0x97f38b62
	.word 0x690bcf85
	.word 0x9bd83b8b
	.word 0xd0a8c006
	.word 0x2386a257
	.word 0xb489eed8
	.word 0x977e98a0
	.word 0x4731bff5
	.word 0x93e2501e
	.word 0x48de17c3
	.word 0xc0e5cf
	.word 0xa6855c2a
	.word 0xc01a7dc
	.word 0x384fc096
	.word 0x36bf789c
	.word 0xfd869a16
	.word 0xbb19605c
	.word 0x2d273bbd
	.word 0xe16b397b
	.word 0x9d00a14e
	.word 0x50fe4b98
	.word 0x253cc992
	.word 0x7e594151
	.word 0x10e77bca
	.word 0x5d094308
	.word 0xb12c751a
	.word 0xfaef84f7
	.word 0xd181172a
	.word 0xbccc8616
	.word 0xd2fa1cd2
	.word 0x551cfd95
	.word 0x59c52e89
	.word 0xef0924cb
	.word 0xd04ea4e7
	.word 0xd06ec7c2
	.word 0x2639116a
	.word 0xe54e87ef
	.word 0x2ee675ba
	.word 0x6f7002f6
	.word 0x1d84fa23
	.word 0x7767bb23
	.word 0x57ac7256
	.word 0x2f491908
	.word 0x44ed621c
	.word 0x7bcaa8dc
	.word 0x6c3c431a
	.word 0x2a06cf57
	.word 0x3f659017
	.word 0xf1e3fea4
	.word 0xb3e0c121
	.word 0x45d2e222
	.word 0x77d79d1e
	.word 0x2032656c
	.word 0xd7031990
	.word 0x800d4262
	.word 0x4e9df44
	.word 0xec8c6d4f
	.word 0x74a9a596
	.word 0xb569387f
	.word 0xbd833577
	.word 0x1b83e07f
	.word 0xf547817
	.word 0xdfaa34b0
	.word 0xcd14403e
	.word 0x295c6f94
	.word 0x94993e91
	.word 0x1c213ce2
	.word 0x183b02e5
	.word 0x2175b282
	.word 0xf1166f54
	.word 0xd5f6ba2b
	.word 0x32601354
	.word 0xbfe6a880
	.word 0x381b0749
	.word 0x7d7f6861
	.word 0xd95f31c3
	.word 0x7eb3d1d3
	.word 0x43be6c5e
	.word 0x3dbab0c2
	.word 0xb5d75b8f
	.word 0xc68700a2
	.word 0xc624af26
	.word 0x70113c8b
	.word 0x68eb7af6
	.word 0xbe6ea32d
	.word 0x218e671
	.word 0xa7e37497
	.word 0x264c4749
	.word 0x885776a1
	.word 0x69cbb1f5
	.word 0x58c9d5a0
	.word 0x4ba6fddf
	.word 0x98008424
	.word 0x752de7e8
	.word 0xc571a969
	.word 0x63ef1ae1
	.word 0x9018240c
	.word 0x61980374
	.word 0x2126f7a5
	.word 0xdfa5eda5
	.word 0xc418deff
	.word 0x136223e5
	.word 0xfcded42a
	.word 0xb93f57cd
	.word 0x8176e42f
	.word 0xf8e51a1d
	.word 0x4bf71a1
	.word 0x5f9faa48
	.word 0xe26eb508
	.word 0x3a9bb8c
	.word 0x275b43d1
	.word 0x77940364
	.word 0x43e58e91
	.word 0xf69d8ca2
	.word 0x3b8e954e
	.word 0xebb66d85
	.word 0xca167a8e
	.word 0xfda35788
	.word 0x4c5dfab6
	.word 0xb5b4e4b0
	.word 0x7deb0091
	.word 0x1cfbba47
	.word 0x83ef19cf
	.word 0xaa12e574
	.word 0xf8d97f2d
	.word 0xca0d967b
	.word 0x9d3208d8
	.word 0x8969d803
	.word 0xff230352
	.word 0x39036f9d
	.word 0xbf2c5c6f
	.word 0x6e503cb3
	.word 0xe096667b
	.word 0x1b9ce74b
	.word 0xbd89423c
	.word 0xefd9fc64
	.word 0x40a4c67f
	.word 0xe0ef1db1
	.word 0x7b33bf3c
	.word 0xbec4020c
	.word 0xf30bae62
	.word 0xd7e22955
	.word 0x733fe2e7
	.word 0x101c6692
	.word 0x3af28e0c
	.word 0x2bd72a03
	.word 0x3e93d357
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51

	.align 4
test_1_maskdata:
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51
	.word 0x91a8d5fd
	.word 0xbd8f6c65
	.word 0x466250f
	.word 0xe31ffa64
	.word 0xc737ad3a
	.word 0xe54c8c1e
	.word 0x7ca660db
	.word 0x692dadf
	.word 0x2c63c847
	.word 0xfbba7ae7
	.word 0x195b62bf
	.word 0xf600a3d1
	.word 0x34b80fd4
	.word 0x3aef5ff4
	.word 0x34267ad9
	.word 0x681454c0
	.word 0x67dd3492
	.word 0xb02d663e
	.word 0xb2d3f1c5
	.word 0x824d39ae
	.word 0x5233a4dd
	.word 0xd4983650
	.word 0x18fc88d5
	.word 0x37bf4071
	.word 0xc83b3c30
	.word 0xd1bc7dd8
	.word 0xa968a97f
	.word 0x62f6cb6d
	.word 0x5b086787
	.word 0x3874f8a5
	.word 0x6075c1a2
	.word 0x951e8621
	.word 0x4ff09378
	.word 0x9b327ba8
	.word 0xb32a4c52
	.word 0x3d5081b
	.word 0x17a2fb1a
	.word 0xb56ed8c
	.word 0x484605f6
	.word 0xb5aeeeb5
	.word 0xfc9d848f
	.word 0x8dd5cd04
	.word 0x9b1a8042
	.word 0xda4c9686
	.word 0x426b8dfb
	.word 0xe0e9092c
	.word 0xf6323d52
	.word 0x73b3e156
	.word 0x4bfb003d
	.word 0x86b081d4
	.word 0xf22b6484
	.word 0x93b06678
	.word 0xcc9d6c8
	.word 0x3b9b3ddc
	.word 0x169dbce8
	.word 0x5252532
	.word 0xa2167b52
	.word 0x9fcbe57f
	.word 0xe92f674b
	.word 0x97056592
	.word 0x8bfcad15
	.word 0x4e1181e9
	.word 0x445da8cc
	.word 0xea35fe19
	.word 0x527e81e3
	.word 0x79e910dd
	.word 0xbe793b3
	.word 0xc47c5d71
	.word 0x24e0658c
	.word 0x47c6f638
	.word 0xc3a22eae
	.word 0x4ed86866
	.word 0xe6b6a11c
	.word 0x4daa96d5
	.word 0xd7a568f0
	.word 0x66652ebf
	.word 0xdfcadfe1
	.word 0x3be0154f
	.word 0x69150191
	.word 0xf1bcd84d
	.word 0x734b985d
	.word 0x353308fb
	.word 0x4c45120b
	.word 0xfde223d8
	.word 0xdbee5e94
	.word 0x982bc336
	.word 0x65e3c70c
	.word 0xb64b71f6
	.word 0x86604880
	.word 0x700a8d4e
	.word 0x63b91dcd
	.word 0x4b11e73
	.word 0x355e64a2
	.word 0x95a74545
	.word 0x8b4ecba8
	.word 0xcd1b37e5
	.word 0x4f031546
	.word 0x918f472f
	.word 0xac98e804
	.word 0x311c98a1
	.word 0x1151057d
	.word 0x995ccbf8
	.word 0x31a201a7
	.word 0xdc447722
	.word 0x7cbaceb7
	.word 0xd2e0a7a
	.word 0x22f6618
	.word 0x8dc09ff
	.word 0xc180944a
	.word 0xa77d21f4
	.word 0x24941503
	.word 0xa6f67a71
	.word 0xf0eda4d8
	.word 0xa918c6bb
	.word 0x9f120f74
	.word 0xc86b2e3b
	.word 0x3909add5
	.word 0xf1fab3f6
	.word 0xe33c2fbf
	.word 0x4736f5f4
	.word 0x603b2dde
	.word 0xbacc4de5
	.word 0x44aae55f
	.word 0x12e38ca6
	.word 0x6b3c04e5
	.word 0xc84ed4c6
	.word 0xc67b650a
	.word 0x411718af
	.word 0x5f294993
	.word 0x62ee6a54
	.word 0x4cdd2e22
	.word 0x786cc1ea
	.word 0x7a6d4845
	.word 0x86249714
	.word 0x906418c8
	.word 0x44dccb49
	.word 0xb197d063
	.word 0x2f09b7ed
	.word 0xda7ea5f6
	.word 0x70ed6ebc
	.word 0x987f22bd
	.word 0x74512906
	.word 0x4bb05389
	.word 0x44d184f7
	.word 0x3b9cb04f
	.word 0xb81a0d11
	.word 0x548542a8
	.word 0xf4bfda8f
	.word 0xb2b93289
	.word 0x42d5763
	.word 0x8fe03374
	.word 0x4b384f2b
	.word 0xc1a7e90b
	.word 0x79452d72
	.word 0xfd34f676
	.word 0x7e27d89a
	.word 0x9dceccb1
	.word 0xe19d838b
	.word 0x266cfb3f
	.word 0x8d1c81a4
	.word 0x18bad9d8
	.word 0xcb271ead
	.word 0x3f400082
	.word 0xfbdcdf34
	.word 0xa7cdb976
	.word 0x75ba9522
	.word 0xc0713693
	.word 0xe8d4430c
	.word 0x773d7f5f
	.word 0x3037aa50
	.word 0x819f731b
	.word 0xebb56d4c
	.word 0xceb5aeae
	.word 0x8cf6a1c1
	.word 0x67e86592
	.word 0xf97058cd
	.word 0xea6648be
	.word 0x9f008c39
	.word 0x6d5ea0d2
	.word 0x6697dc2f
	.word 0x51dac950
	.word 0x2e621f75
	.word 0xdad9549b
	.word 0xf37fa864
	.word 0x89dff0d
	.word 0xe1be6916
	.word 0xc2a7edcf
	.word 0x37a7880f
	.word 0xf1444f34
	.word 0x99a4f8e
	.word 0x68ce0f63
	.word 0x3277cf6a
	.word 0x7a8b59c1
	.word 0xdce388e8
	.word 0x27eb62aa
	.word 0x2c7809b8
	.word 0x143a9e71
	.word 0x851f6e45
	.word 0x579e0a27
	.word 0x77f41975
	.word 0x925ae826
	.word 0x4e7a36bc
	.word 0xb4fc0c9c
	.word 0xf02fa737
	.word 0x2acf336
	.word 0x831b5583
	.word 0xb5fec054
	.word 0xa31e0b3f
	.word 0xd46f3d2c
	.word 0x465bb10f
	.word 0x724fb174
	.word 0x351ea5f0
	.word 0x1e980dee
	.word 0xca495a59
	.word 0xd80b68d2
	.word 0xa3926a57
	.word 0x1d141c8d
	.word 0xa7740fdf
	.word 0x6ea35470
	.word 0xf562a3f1
	.word 0x7917d4b
	.word 0x66da64aa
	.word 0xf682191a
	.word 0xfd2ce83f
	.word 0x67f9ab29
	.word 0x112e3ffd
	.word 0xc4d9b1e2
	.word 0x9ed4e137
	.word 0xb49ae54e
	.word 0xd075dd45
	.word 0x74daa72e
	.word 0x48324db4
	.word 0x167d97b5
	.word 0x8b536536
	.word 0xe85755eb
	.word 0x1cd86c0a
	.word 0x4c811ecf
	.word 0x8085dbf1
	.word 0x547cdce3
	.word 0x65d27882
	.word 0xb72d2ec4
	.word 0x954ee841
	.word 0xb36fd636
	.word 0xbc4988da
	.word 0xaea05c04
	.word 0xce7483a6
	.word 0xea0309d7
	.word 0x62498466
	.word 0x1cd29ac4
	.word 0x97f38b62
	.word 0x690bcf85
	.word 0x9bd83b8b
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

