// RISC-V Architectural Validation Test VDIV-VX-SEW32_LMUL4
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
//    SEW=32, LMUL=4
// Description: Testing instruction 'vdiv.vx'.

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
    li x31, 0
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 4, Use Mask = 1, VL = 32\n")

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27]
    # MASK (v0)       = [       1        1        1        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (v28) BEFORE = [e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d]
    # VD (v28) AFTER  = [ffffffff ffffffff ffffffff 0466250f ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e]
    # MASK (+1)       = [       0        0        0        0        0        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # VD (+1) AFTER  = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf ffffffff]

    # RS1  (x31)       = 0

    # VS2 (+2)       = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # MASK (+2)       = [       0        0        0        1        1        0        1        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # VD (+2) AFTER  = [d4983650 5233a4dd 824d39ae ffffffff ffffffff 67dd3492 ffffffff 34267ad9]

    # RS1  (x31)       = 0

    # VS2 (+3)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # MASK (+3)       = [       0        0        0        1        0        1        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # VD (+3) AFTER  = [3874f8a5 5b086787 62f6cb6d ffffffff d1bc7dd8 ffffffff 37bf4071 ffffffff]


    
    vdiv.vx v28, v16, x31, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0466250f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    li x30, 0
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    





    # RS1  (x30)       = 0

    # VS2 (v20)       = [0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65]
    # VD (v24) AFTER  = [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # VD (+1) AFTER  = [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x30)       = 0

    # VS2 (+2)       = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # VD (+2) AFTER  = [c83b3c30 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x30)       = 0

    # VS2 (+3)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # VD (+3) AFTER  = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]


    
    vdiv.vx v24, v20, x30



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x29, -2047
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v20, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 4, Use Mask = 1, VL = 16\n")

    





    # RS1  (x29)       = -2047

    # VS2 (v24)       = [195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64]
    # MASK (v0)       = [       1        1        0        1        0        1        0        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (v20) BEFORE = [f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a]
    # VD (v20) AFTER  = [fffcd42f 000088c1 fbba7ae7 ffff2d8b 0692dadf 000356d9 e54c8c1e c737ad3a]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1]
    # MASK (+1)       = [       0        0        0        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # VD (+1) AFTER  = [824d39ae b2d3f1c5 b02d663e 67dd3492 fff97a60 fff8a129 fff9682c 00014013]

    # RS1  (x29)       = -2047

    # VS2 (+2)       = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # MASK (+2)       = [       1        0        1        1        1        0        0        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # VD (+2) AFTER  = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]

    # RS1  (x29)       = -2047

    # VS2 (+3)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # MASK (+3)       = [       0        0        1        1        0        1        0        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # VD (+3) AFTER  = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]


    
    vdiv.vx v20, v24, x29, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000356d9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff2d8b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000088c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffcd42f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00014013)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff9682c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff8a129)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff97a60)
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
    li x28, -1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v28, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    





    # RS1  (x28)       = -1

    # VS2 (v28)       = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf]
    # VD (v16) AFTER  = [c510a00c cb47f02c 09ff5c2f e6a49d41 04458519 d39c37b9 f96d2521 83599f25]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # VD (+1) AFTER  = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 97ebab40 cbd98527]

    # RS1  (x28)       = -1

    # VS2 (+2)       = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # VD (+2) AFTER  = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]

    # RS1  (x28)       = -1

    # VS2 (+3)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # VD (+3) AFTER  = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]


    
    vdiv.vx v16, v28, x28



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83599f25)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf96d2521)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd39c37b9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04458519)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe6a49d41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x09ff5c2f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcb47f02c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc510a00c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcbd98527)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97ebab40)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x27, -4660
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 4, Use Mask = 1, VL = 8\n")

    





    # RS1  (x27)       = -4660

    # VS2 (v4)        = [67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # MASK (v0)       = [       1        0        0        0        0        1        1        1]
    # ELEMENTS          [ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff]
    # VD (v12) BEFORE = [b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf]
    # VD (v12) AFTER  = [fffa4b4f 67dd3492 681454c0 34267ad9 3aef5ff4 00008c99 fffe9b65 00003c12]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # MASK (+1)       = [       0        1        1        0        0        1        1        1]
    # ELEMENTS          [ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # VD (+1) AFTER  = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]

    # RS1  (x27)       = -4660

    # VS2 (+2)       = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # MASK (+2)       = [       0        0        0        0        1        0        0        0]
    # ELEMENTS          [ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # VD (+2) AFTER  = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]

    # RS1  (x27)       = -4660

    # VS2 (+3)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # MASK (+3)       = [       0        1        0        1        1        0        1        1]
    # ELEMENTS          [ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # VD (+3) AFTER  = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]


    
    vdiv.vx v12, v4, x27, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00003c12)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffe9b65)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00008c99)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffa4b4f)
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
    li x26, 2147483648
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 4, Use Mask = 0, VL = 6\n")

    





    # RS1  (x26)       = 2147483648

    # VS2 (v0)        = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # VD (v8)  AFTER  = [5233a4dd 824d39ae 00000000 00000000 00000000 00000000 00000000 00000000]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # VD (+1) AFTER  = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]

    # RS1  (x26)       = 2147483648

    # VS2 (+2)       = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # VD (+2) AFTER  = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]

    # RS1  (x26)       = 2147483648

    # VS2 (+3)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # VD (+3) AFTER  = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]


    
    vdiv.vx v8, v0, x26



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x25, 4660
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 4, Use Mask = 1, VL = 4\n")

    





    # RS1  (x25)       = 4660

    # VS2 (v8)        = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # MASK (v0)       = [       1        1        1        1        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (v4)  BEFORE = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # VD (v4)  AFTER  = [37bf4071 18fc88d5 d4983650 5233a4dd fffbc2b1 b2d3f1c5 0005b4b1 0005b7b9]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # MASK (+1)       = [       1        0        0        0        1        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+1) BEFORE = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # VD (+1) AFTER  = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]

    # RS1  (x25)       = 4660

    # VS2 (+2)       = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # MASK (+2)       = [       0        1        1        0        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+2) BEFORE = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # VD (+2) AFTER  = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]

    # RS1  (x25)       = 4660

    # VS2 (+3)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # MASK (+3)       = [       0        1        0        0        0        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+3) BEFORE = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # VD (+3) AFTER  = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]


    
    vdiv.vx v4, v8, x25, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0005b7b9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0005b4b1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffbc2b1)
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
    li x24, 4294967295
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 4, Use Mask = 0, VL = 2\n")

    





    # RS1  (x24)       = 4294967295

    # VS2 (v12)       = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v0)  BEFORE = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # VD (v0)  AFTER  = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 7db2c652 4d2c0e3b]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # VD (+1) AFTER  = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]

    # RS1  (x24)       = 4294967295

    # VS2 (+2)       = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+2) BEFORE = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # VD (+2) AFTER  = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]

    # RS1  (x24)       = 4294967295

    # VS2 (+3)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+3) BEFORE = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # VD (+3) AFTER  = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]


    
    vdiv.vx v0, v12, x24



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4d2c0e3b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7db2c652)
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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x23, 1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 4, Use Mask = 1, VL = 0\n")

    





    # RS1  (x23)       = 1

    # VS2 (v16)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # MASK (v0)       = [       0        0        0        1        0        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v28) BEFORE = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # VD (v28) AFTER  = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # MASK (+1)       = [       1        0        1        0        1        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # VD (+1) AFTER  = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]

    # RS1  (x23)       = 1

    # VS2 (+2)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # MASK (+2)       = [       1        1        1        1        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # VD (+2) AFTER  = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]

    # RS1  (x23)       = 1

    # VS2 (+3)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # MASK (+3)       = [       1        0        0        0        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # VD (+3) AFTER  = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]


    
    vdiv.vx v28, v16, x23, v0.t



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
    li x22, 2147483647
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    





    # RS1  (x22)       = 2147483647

    # VS2 (v20)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # VD (v24) AFTER  = [00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # VD (+1) AFTER  = [00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000]

    # RS1  (x22)       = 2147483647

    # VS2 (+2)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # VD (+2) AFTER  = [00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000]

    # RS1  (x22)       = 2147483647

    # VS2 (+3)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # VD (+3) AFTER  = [00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000]


    
    vdiv.vx v24, v20, x22



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x21, 124076833
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 4, Use Mask = 1, VL = 23\n")

    





    # RS1  (x21)       = 124076833

    # VS2 (v24)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # MASK (v0)       = [       1        1        1        0        0        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (v20) BEFORE = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # VD (v20) AFTER  = [fffffff6 fffffff3 0000000a 4ff09378 951e8621 6075c1a2 3874f8a5 0000000d]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # MASK (+1)       = [       1        1        0        1        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+1) BEFORE = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # VD (+1) AFTER  = [fffffff3 fffffff1 8dd5cd04 fffffff6 00000009 00000001 00000003 00000000]

    # RS1  (x21)       = 124076833

    # VS2 (+2)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # MASK (+2)       = [       1        1        0        0        1        0        1        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+2) BEFORE = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # VD (+2) AFTER  = [93b06678 fffffff0 86b081d4 4bfb003d ffffffff f6323d52 00000008 426b8dfb]

    # RS1  (x21)       = 124076833

    # VS2 (+3)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # MASK (+3)       = [       1        1        0        1        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+3) BEFORE = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # VD (+3) AFTER  = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]


    
    vdiv.vx v20, v24, x21, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0000000d)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0000000a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000003)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000009)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5cd04)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b8dfb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000008)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6323d52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffffffff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffff0)
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
    li x20, 2048
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    





    # RS1  (x20)       = 2048

    # VS2 (v28)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # VD (v16) AFTER  = [00016add 0002f45f 00007aa1 fff6654a fff36650 0009fe12 fff2a3d1 000c0eb8]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # VD (+1) AFTER  = [fffc1d22 00084d71 fffb4993 fff36351 fff1baba ffff93b1 fff6b5de 000908c0]

    # RS1  (x20)       = 2048

    # VS2 (+2)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # VD (+2) AFTER  = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]

    # RS1  (x20)       = 2048

    # VS2 (+3)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # VD (+3) AFTER  = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]


    
    vdiv.vx v16, v28, x20



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000c0eb8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff2a3d1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0009fe12)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff36650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff6654a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00007aa1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0002f45f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00016add)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000908c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff6b5de)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffff93b1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff1baba)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff36351)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffb4993)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00084d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffc1d22)
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
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x19, 0
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 4, Use Mask = 1, VL = 10\n")

    





    # RS1  (x19)       = 0

    # VS2 (v4)        = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # MASK (v0)       = [       1        0        1        0        0        0        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm]
    # VD (v12) BEFORE = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # VD (v12) AFTER  = [ffffffff fc9d848f ffffffff 484605f6 0b56ed8c 17a2fb1a ffffffff b32a4c52]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # MASK (+1)       = [       0        1        1        0        0        1        0        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # VD (+1) AFTER  = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]

    # RS1  (x19)       = 0

    # VS2 (+2)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # MASK (+2)       = [       0        1        0        1        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # VD (+2) AFTER  = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]

    # RS1  (x19)       = 0

    # VS2 (+3)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # MASK (+3)       = [       0        0        1        1        0        1        0        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # VD (+3) AFTER  = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]


    
    vdiv.vx v12, v4, x19, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
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
    li x18, 2047
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    





    # RS1  (x18)       = 2047

    # VS2 (v0)        = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # VD (v8)  AFTER  = [fffb48fc fff361bd fff1b8f1 ffff93a4 fff6b4b5 000909e1 00016b0b 0002f4bd]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # VD (+1) AFTER  = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]

    # RS1  (x18)       = 2047

    # VS2 (+2)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # VD (+2) AFTER  = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]

    # RS1  (x18)       = 2047

    # VS2 (+3)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # VD (+3) AFTER  = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]


    
    vdiv.vx v8, v0, x18



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0002f4bd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00016b0b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x000909e1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff6b4b5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff93a4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff1b8f1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff361bd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfffb48fc)
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
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x17, -1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 4, Use Mask = 1, VL = 6\n")

    





    # RS1  (x17)       = -1

    # VS2 (v8)        = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # MASK (v0)       = [       0        1        0        0        1        0        1        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v4)  BEFORE = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # VD (v4)  AFTER  = [73b3e156 f6323d52 e0e9092c 426b8dfb 64e57fbe 9b1a8042 03627b71 fc9d848f]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # MASK (+1)       = [       1        0        0        1        0        1        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # VD (+1) AFTER  = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]

    # RS1  (x17)       = -1

    # VS2 (+2)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # MASK (+2)       = [       1        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # VD (+2) AFTER  = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]

    # RS1  (x17)       = -1

    # VS2 (+3)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # MASK (+3)       = [       1        1        0        0        0        0        0        1]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # VD (+3) AFTER  = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]


    
    vdiv.vx v4, v8, x17, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03627b71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x64e57fbe)
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
    li x16, 1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 4, Use Mask = 0, VL = 4\n")

    





    # RS1  (x16)       = 1

    # VS2 (v12)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # VD (v0)  AFTER  = [f22b6484 86b081d4 4bfb003d 73b3e156 e0e9092c 426b8dfb da4c9686 9b1a8042]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # VD (+1) AFTER  = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]

    # RS1  (x16)       = 1

    # VS2 (+2)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # VD (+2) AFTER  = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]

    # RS1  (x16)       = 1

    # VS2 (+3)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # VD (+3) AFTER  = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]


    
    vdiv.vx v0, v12, x16



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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x15, 0
    la x2, test_1_data+192
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 4, Use Mask = 1, VL = 2\n")

    





    # RS1  (x15)       = 0

    # VS2 (v16)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # MASK (v0)       = [       1        1        1        0        0        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm ffffffff]
    # VD (v28) BEFORE = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # VD (v28) AFTER  = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 ffffffff]

    # RS1  (x15)       = 0

    # VS2 (+1)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # MASK (+1)       = [       0        0        0        0        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm ffffffff]
    # VD (+1) BEFORE = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # VD (+1) AFTER  = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]

    # RS1  (x15)       = 0

    # VS2 (+2)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # MASK (+2)       = [       0        0        1        1        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm ffffffff]
    # VD (+2) BEFORE = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # VD (+2) AFTER  = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]

    # RS1  (x15)       = 0

    # VS2 (+3)       = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # MASK (+3)       = [       0        1        1        0        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm ffffffff]
    # VD (+3) BEFORE = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # VD (+3) AFTER  = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]


    
    vdiv.vx v28, v16, x15, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffffffff)
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
    li x14, 0
    la x2, test_1_data+204
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 4, Use Mask = 0, VL = 0\n")

    





    # RS1  (x14)       = 0

    # VS2 (v20)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v24) BEFORE = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # VD (v24) AFTER  = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]

    # RS1  (x14)       = 0

    # VS2 (+1)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # VD (+1) AFTER  = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]

    # RS1  (x14)       = 0

    # VS2 (+2)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # VD (+2) AFTER  = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]

    # RS1  (x14)       = 0

    # VS2 (+3)       = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # VD (+3) AFTER  = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]


    
    vdiv.vx v24, v20, x14



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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x13, -2047
    la x2, test_1_data+216
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 4, Use Mask = 1, VL = 32\n")

    





    # RS1  (x13)       = -2047

    # VS2 (v24)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # MASK (v0)       = [       1        0        1        1        1        1        0        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm ffffffff]
    # VD (v20) BEFORE = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # VD (v20) AFTER  = [0002da6e e92f674b 000bbea8 ffff5b47 fffd2bee fff88baa 3b9b3ddc 000d8ba4]

    # RS1  (x13)       = -2047

    # VS2 (+1)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # MASK (+1)       = [       0        0        1        0        0        0        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm ffffffff]
    # VD (+1) BEFORE = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # VD (+1) AFTER  = [c47c5d71 0be793b3 fff5aee6 527e81e3 ea35fe19 445da8cc 000e823a 8bfcad15]

    # RS1  (x13)       = -2047

    # VS2 (+2)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # MASK (+2)       = [       0        1        1        1        1        1        1        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm ffffffff]
    # VD (+2) BEFORE = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # VD (+2) AFTER  = [66652ebf fff64977 00032991 fff623b8 00078cab fff70602 fffb6360 00077162]

    # RS1  (x13)       = -2047

    # VS2 (+3)       = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # MASK (+3)       = [       1        0        0        1        1        0        0        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm ffffffff]
    # VD (+3) BEFORE = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # VD (+3) AFTER  = [fff6762d 4c45120b 353308fb 0001c89e fff2dbbc 69150191 3be0154f dfcadfe1]


    
    vdiv.vx v20, v24, x13, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000d8ba4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff88baa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffd2bee)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffff5b47)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000bbea8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0002da6e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000e823a)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff5aee6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00077162)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffb6360)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff70602)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00078cab)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff623b8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00032991)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff64977)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff2dbbc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001c89e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff6762d)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x12, -1
    la x2, test_1_data+228
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    





    # RS1  (x12)       = -1

    # VS2 (v28)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # VD (v16) AFTER  = [b1ee7e17 740352eb 68fa9a6e 16d098b5 60341a81 5de984ae fadadace e9624318]

    # RS1  (x12)       = -1

    # VS2 (+1)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # VD (+1) AFTER  = [b83909c8 db1f9a74 3b83a28f f4186c4d 8616ef23 ad817e1d 15ca01e7 bba25734]

    # RS1  (x12)       = -1

    # VS2 (+2)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # VD (+2) AFTER  = [69150191 2035201f 999ad141 285a9710 b255692b 19495ee4 b127979a 3c5dd152]

    # RS1  (x12)       = -1

    # VS2 (+3)       = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # VD (+3) AFTER  = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]


    
    vdiv.vx v16, v28, x12



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe9624318)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfadadace)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5de984ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x60341a81)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x16d098b5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x68fa9a6e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x740352eb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb1ee7e17)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbba25734)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x15ca01e7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xad817e1d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8616ef23)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf4186c4d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b83a28f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdb1f9a74)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb83909c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c5dd152)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb127979a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x19495ee4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb255692b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x285a9710)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x999ad141)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2035201f)
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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x11, -4660
    la x2, test_1_data+240
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 4, Use Mask = 1, VL = 16\n")

    





    # RS1  (x11)       = -4660

    # VS2 (v4)        = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # MASK (v0)       = [       1        0        1        1        0        0        0        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (v12) BEFORE = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # VD (v12) AFTER  = [fffb77d8 527e81e3 fffc3e8a fffbb616 4e1181e9 8bfcad15 97056592 000548f5]

    # RS1  (x11)       = -4660

    # VS2 (+1)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # MASK (+1)       = [       1        1        0        0        1        1        0        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+1) BEFORE = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # VD (+1) AFTER  = [0001639e fffbab29 4ed86866 c3a22eae fffdf963 000344fa c47c5d71 0be793b3]

    # RS1  (x11)       = -4660

    # VS2 (+2)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # MASK (+2)       = [       1        1        0        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+2) BEFORE = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # VD (+2) AFTER  = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]

    # RS1  (x11)       = -4660

    # VS2 (+3)       = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # MASK (+3)       = [       1        0        0        1        1        1        0        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]
    # VD (+3) BEFORE = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # VD (+3) AFTER  = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]


    
    vdiv.vx v12, v4, x11, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000548f5)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffbb616)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffc3e8a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffb77d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000344fa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffdf963)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffbab29)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001639e)
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
    li x10, 2147483648
    la x2, test_1_data+252
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    





    # RS1  (x10)       = 2147483648

    # VS2 (v0)        = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # VD (v8)  AFTER  = [00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000]

    # RS1  (x10)       = 2147483648

    # VS2 (+1)       = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # VD (+1) AFTER  = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 00000000 00000000]

    # RS1  (x10)       = 2147483648

    # VS2 (+2)       = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # VD (+2) AFTER  = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]

    # RS1  (x10)       = 2147483648

    # VS2 (+3)       = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # VD (+3) AFTER  = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]


    
    vdiv.vx v8, v0, x10



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x9, 4660
    la x2, test_1_data+264
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 4, Use Mask = 1, VL = 8\n")

    





    # RS1  (x9)        = 4660

    # VS2 (v8)        = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # MASK (v0)       = [       1        0        1        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v4)  BEFORE = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # VD (v4)  AFTER  = [fffcaf09 c3a22eae 0002069d 24e0658c 0000a76b 0006b27d 00048828 527e81e3]

    # RS1  (x9)        = 4660

    # VS2 (+1)       = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # MASK (+1)       = [       1        0        1        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # VD (+1) AFTER  = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]

    # RS1  (x9)        = 4660

    # VS2 (+2)       = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # MASK (+2)       = [       1        0        1        1        0        1        0        1]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # VD (+2) AFTER  = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]

    # RS1  (x9)        = 4660

    # VS2 (+3)       = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # MASK (+3)       = [       1        1        0        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # VD (+3) AFTER  = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]


    
    vdiv.vx v4, v8, x9, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00048828)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0006b27d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0000a76b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0002069d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffcaf09)
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
    li x8, 4294967295
    la x2, test_1_data+276
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v12, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 4, Use Mask = 0, VL = 6\n")

    





    # RS1  (x8)        = 4294967295

    # VS2 (v12)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # VD (v0)  AFTER  = [d7a568f0 4daa96d5 b127979a 3c5dd152 b83909c8 db1f9a74 3b83a28f f4186c4d]

    # RS1  (x8)        = 4294967295

    # VS2 (+1)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # VD (+1) AFTER  = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]

    # RS1  (x8)        = 4294967295

    # VS2 (+2)       = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # VD (+2) AFTER  = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]

    # RS1  (x8)        = 4294967295

    # VS2 (+3)       = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # VD (+3) AFTER  = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]


    
    vdiv.vx v0, v12, x8



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf4186c4d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b83a28f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdb1f9a74)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb83909c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c5dd152)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb127979a)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x7, 1
    la x2, test_1_data+288
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 4, Use Mask = 1, VL = 4\n")

    





    # RS1  (x7)        = 1

    # VS2 (v16)       = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # MASK (v0)       = [       0        0        1        1        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (v28) BEFORE = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # VD (v28) AFTER  = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 4ed86866 4ed86866 c3a22eae]

    # RS1  (x7)        = 1

    # VS2 (+1)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # MASK (+1)       = [       0        1        0        0        1        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # VD (+1) AFTER  = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]

    # RS1  (x7)        = 1

    # VS2 (+2)       = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # MASK (+2)       = [       0        1        0        0        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]
    # VD (+2) AFTER  = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]

    # RS1  (x7)        = 1

    # VS2 (+3)       = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545]
    # MASK (+3)       = [       1        1        1        1        0        0        0        1]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]
    # VD (+3) AFTER  = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]


    
    vdiv.vx v28, v16, x7, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
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
    li x6, 2147483647
    la x2, test_1_data+300
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 4, Use Mask = 0, VL = 2\n")

    





    # RS1  (x6)        = 2147483647

    # VS2 (v20)       = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v24) BEFORE = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # VD (v24) AFTER  = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf 00000000 00000000]

    # RS1  (x6)        = 2147483647

    # VS2 (+1)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # VD (+1) AFTER  = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]

    # RS1  (x6)        = 2147483647

    # VS2 (+2)       = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+2) BEFORE = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]
    # VD (+2) AFTER  = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]

    # RS1  (x6)        = 2147483647

    # VS2 (+3)       = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+3) BEFORE = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]
    # VD (+3) AFTER  = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]


    
    vdiv.vx v24, v20, x6



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x5, 124076833
    la x2, test_1_data+312
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 4, Use Mask = 1, VL = 0\n")

    





    # RS1  (x5)        = 124076833

    # VS2 (v24)       = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # MASK (v0)       = [       0        0        1        1        0        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v20) BEFORE = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # VD (v20) AFTER  = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]

    # RS1  (x5)        = 124076833

    # VS2 (+1)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # MASK (+1)       = [       1        1        1        1        0        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # VD (+1) AFTER  = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]

    # RS1  (x5)        = 124076833

    # VS2 (+2)       = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # MASK (+2)       = [       1        0        1        0        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]
    # VD (+2) AFTER  = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]

    # RS1  (x5)        = 124076833

    # VS2 (+3)       = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1]
    # MASK (+3)       = [       0        0        0        0        0        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d]
    # VD (+3) AFTER  = [08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d]


    
    vdiv.vx v20, v24, x5, v0.t



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
    li x4, 2048
    la x2, test_1_data+324
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    





    # RS1  (x4)        = 2048

    # VS2 (v28)       = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # VD (v16) AFTER  = [fff30579 fffb7dcc ffffbc45 000988a2 0006a661 000e6973 fffe379c 000d22a0]

    # RS1  (x4)        = 2048

    # VS2 (+1)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # VD (+1) AFTER  = [fff2b4e9 0006abcc 00009623 000c7723 000e0151 fff0cc0a fff6c96f 000cbc78]

    # RS1  (x4)        = 2048

    # VS2 (+2)       = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5]
    # VD (+2) AFTER  = [fff32b9a 00022a20 00062393 fff5931e fff231e9 0009e062 fff9a367 fff169da]

    # RS1  (x4)        = 2048

    # VS2 (+3)       = [a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722]
    # VD (+3) AFTER  = [fff4efa5 fff83013 00011b81 000045ec 0001a5c1 000f9759 fffb888f 00063440]


    
    vdiv.vx v16, v28, x4



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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000d22a0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffe379c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000e6973)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0006a661)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000988a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffbc45)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffb7dcc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff30579)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000cbc78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff6c96f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff0cc0a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000e0151)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000c7723)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00009623)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0006abcc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff2b4e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff169da)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff9a367)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0009e062)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff231e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff5931e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00062393)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00022a20)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff32b9a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00063440)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffb888f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000f9759)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001a5c1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000045ec)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00011b81)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff83013)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff4efa5)
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
    li x3, 0
    la x5, test_1_data+336
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v4, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v12, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 4, Use Mask = 1, VL = 23\n")

    





    # RS1  (x3)        = 0

    # VS2 (v4)        = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # MASK (v0)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (v12) BEFORE = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # VD (v12) AFTER  = [700a8d4e ffffffff b64b71f6 65e3c70c ffffffff dbee5e94 ffffffff ffffffff]

    # RS1  (x3)        = 0

    # VS2 (+1)       = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]
    # MASK (+1)       = [       0        1        1        1        1        1        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+1) BEFORE = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # VD (+1) AFTER  = [918f472f ffffffff ffffffff ffffffff ffffffff ffffffff 04b11e73 ffffffff]

    # RS1  (x3)        = 0

    # VS2 (+2)       = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]
    # MASK (+2)       = [       1        0        0        1        0        0        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+2) BEFORE = [0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804]
    # VD (+2) AFTER  = [0d2e0a7a 7cbaceb7 dc447722 ffffffff 995ccbf8 1151057d 311c98a1 ffffffff]

    # RS1  (x3)        = 0

    # VS2 (+3)       = [f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a]
    # MASK (+3)       = [       0        0        0        0        0        1        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]
    # VD (+3) BEFORE = [a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618]
    # VD (+3) AFTER  = [a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618]


    
    vdiv.vx v12, v4, x3, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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
    li x2, 2047
    la x5, test_1_data+348
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v0, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    





    # RS1  (x2)        = 2047

    # VS2 (v0)        = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # VD (v8)  AFTER  = [00009636 000c78b2 000e0312 fff0ca23 fff6c848 000cbe10 fff303d9 fffb7d3c]

    # RS1  (x2)        = 2047

    # VS2 (+1)       = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545]
    # VD (+1) AFTER  = [00062457 fff591d0 fff2302f 0009e19e fff9a29c fff16807 fff2b340 0006aca2]

    # RS1  (x2)        = 2047

    # VS2 (+2)       = [08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8]
    # VD (+2) AFTER  = [c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8]

    # RS1  (x2)        = 2047

    # VS2 (+3)       = [c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4]
    # VD (+3) AFTER  = [3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4]


    
    vdiv.vx v8, v0, x2



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffb7d3c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff303d9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000cbe10)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff6c848)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff0ca23)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000e0312)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000c78b2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00009636)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0006aca2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff2b340)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff16807)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff9a29c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0009e19e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff2302f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff591d0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00062457)
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
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x1, -1
    la x5, test_1_data+360
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 4, Use Mask = 1, VL = 10\n")

    





    # RS1  (x1)        = -1

    # VS2 (v8)        = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # MASK (v0)       = [       1        1        0        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (v4)  BEFORE = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # VD (v4)  AFTER  = [74b13458 6a58babb 95a74545 355e64a2 9c46e233 8ff572b2 799fb780 49b48e0a]

    # RS1  (x1)        = -1

    # VS2 (+1)       = [31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5]
    # MASK (+1)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546]
    # VD (+1) AFTER  = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 b0fceaba 4f031546]

    # RS1  (x1)        = -1

    # VS2 (+2)       = [24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7 dc447722]
    # MASK (+2)       = [       1        0        0        0        0        0        0        1]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7]
    # VD (+2) AFTER  = [a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618 0d2e0a7a 7cbaceb7]

    # RS1  (x1)        = -1

    # VS2 (+3)       = [e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8 a6f67a71]
    # MASK (+3)       = [       0        1        0        0        1        1        0        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8]
    # VD (+3) AFTER  = [4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74 a918c6bb f0eda4d8]


    
    vdiv.vx v4, v8, x1, v0.t



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49b48e0a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x799fb780)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8ff572b2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9c46e233)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a58babb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x74b13458)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f031546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb0fceaba)
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
    li x0, 0
    la x5, test_1_data+372
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    





    # RS1  (x0)        = 0

    # VS2 (v12)       = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # VD (v0)  AFTER  = [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x0)        = 0

    # VS2 (+1)       = [0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1]
    # VD (+1) AFTER  = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1]

    # RS1  (x0)        = 0

    # VS2 (+2)       = [a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff 022f6618]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff]
    # VD (+2) AFTER  = [9f120f74 a918c6bb f0eda4d8 a6f67a71 24941503 a77d21f4 c180944a 08dc09ff]

    # RS1  (x0)        = 0

    # VS2 (+3)       = [bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b 9f120f74]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [44aae55f bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b]
    # VD (+3) AFTER  = [44aae55f bacc4de5 603b2dde 4736f5f4 e33c2fbf f1fab3f6 3909add5 c86b2e3b]


    
    vdiv.vx v0, v12, x0



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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
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

