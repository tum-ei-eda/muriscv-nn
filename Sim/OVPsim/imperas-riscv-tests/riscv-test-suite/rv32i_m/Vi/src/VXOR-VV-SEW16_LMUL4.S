// RISC-V Architectural Validation Test VXOR-VV-SEW16_LMUL4
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
//    SEW=16, LMUL=4
// Description: Testing instruction 'vxor.vv'.

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
    vsetvli x0, x7, e16,m4
    vle16.v v4, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 4, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v4)        = [e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27 151a 01ef]

    # VS2 (v16)       = [c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27]
    # MASK (v0)       = [   0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (v28) BEFORE = [e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d]
    # VD (v28) AFTER  = [e54c 8c1e c737 ad3a e31f fa64 0466 b998 b189 4fac 62bf d5fd c4c8 431a 934c 9cc8]

    # VS1 (+1)       = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a]

    # VS2 (+1)       = [34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e]
    # MASK (+1)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+1) BEFORE = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # VD (+1) AFTER  = [3aef 5ff4 34b8 c16e f600 1858 195b b2a0 fbba 7ae7 2c63 ba04 99ea dadf 227b 60db]

    # VS1 (+2)       = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]

    # VS2 (+2)       = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # MASK (+2)       = [   1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+2) BEFORE = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]
    # VD (+2) AFTER  = [d07e 3650 5233 c86b 02fe 97fb b2d3 52ac b02d 663e 5c32 3492 6814 252d 0e57 5020]

    # VS1 (+3)       = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]

    # VS2 (+3)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (+3)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+3) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (+3) AFTER  = [39fe f8a5 5b08 6787 62f6 d4a7 1987 a97f d1bc 7c41 c83b c8a4 37bf be85 86ab 88d5]


    
    
    vxor.vv v28, v16, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x934c9cc8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc4c8431a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62bfd5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb1894fac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0466b998)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x227b60db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99eadadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63ba04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195bb2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6001858)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b8c16e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e575020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6814252d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5c323492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d352ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02fe97fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233c86b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd07e3650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86ab88d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bfbe85)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83bc8a4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7c41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1987a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6d4a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x39fef8a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e16,m4
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 4, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v0)        = [7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51]

    # VS2 (v20)       = [0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65]
    # VD (v24) AFTER  = [7a34 ba04 99ea ecc5 227b 2124 2428 575e e779 df6b b9e9 496a 2c27 b998 b189 4fac]

    # VS1 (+1)       = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf]

    # VS2 (+1)       = [6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # VD (+1) AFTER  = [5c32 2e19 0ec9 252d 0e57 5020 c2b8 ac05 ef5b c16e e2e1 1858 d7d9 b2a0 2af1 1298]

    # VS1 (+2)       = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]

    # VS2 (+2)       = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]
    # VD (+2) AFTER  = [2f43 c8a4 cc64 be85 86ab 928d d07e 9d73 309e c86b 02fe 97fb d7f0 52ac 0fc9 6052]

    # VS1 (+3)       = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]

    # VS2 (+3)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (+3) AFTER  = [4ff0 9378 951e 8621 6075 c1a2 3874 acea cb9e 6212 78d4 d4a7 1987 41e8 ff84 7c41]


    
    
    vxor.vv v24, v20, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb1894fac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c27b998)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb9e9496a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe779df6b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2428575e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x227b2124)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99eaecc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a34ba04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2af11298)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7d9b2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe2e11858)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xef5bc16e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc2b8ac05)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e575020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0ec9252d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5c322e19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0fc96052)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7f052ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02fe97fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x309ec86b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd07e9d73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86ab928d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcc64be85)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2f43c8a4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff847c41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x198741e8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x78d4d4a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcb9e6212)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874acea)
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
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e16,m4
    vle16.v v8, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v20, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 4, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v8)        = [fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f]

    # VS2 (v24)       = [195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64]
    # MASK (v0)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (v20) BEFORE = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a]
    # VD (v20) AFTER  = [f600 a3d1 195b 62bf 2af1 1298 7a34 ba04 99ea ecc5 7ca6 2124 e54c 575e c737 ad3a]

    # VS1 (+1)       = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf]

    # VS2 (+1)       = [b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1]
    # MASK (+1)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+1) BEFORE = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # VD (+1) AFTER  = [824d 39ae d7f0 52ac b02d 6052 67dd 3492 0ec9 54c0 0e57 5020 c2b8 5ff4 34b8 0fd4]

    # VS1 (+2)       = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]

    # VS2 (+2)       = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # MASK (+2)       = [   0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+2) BEFORE = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]
    # VD (+2) AFTER  = [62f6 cb6d a968 a97f d1bc 7dd8 c83b c8a4 cc64 be85 86ab 928d d498 9d73 5233 a4dd]

    # VS1 (+3)       = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]

    # VS2 (+3)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (+3)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+3) BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (+3) AFTER  = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]


    
    
    vxor.vv v20, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v20, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c575e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca62124)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99eaecc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a34ba04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2af11298)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc2b85ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e575020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0ec954c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d6052)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7f052ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4989d73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86ab928d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcc64be85)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83bc8a4)
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
    la x5, test_1_data+36
    vsetvli x0, x7, e16,m4
    vle16.v v12, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v28, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 4, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v12)       = [34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e]

    # VS2 (v28)       = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf]
    # VD (v16) AFTER  = [0e57 5020 c2b8 ac05 ef5b c16e e2e1 1858 d7d9 b2a0 2af1 1298 7a34 ba04 99ea ecc5]

    # VS1 (+1)       = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]

    # VS2 (+1)       = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # VD (+1) AFTER  = [86ab 928d d07e 9d73 309e c86b 02fe 97fb d7f0 52ac 0fc9 6052 5c32 2e19 0ec9 252d]

    # VS1 (+2)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]

    # VS2 (+2)       = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]
    # VD (+2) AFTER  = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]

    # VS1 (+3)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]

    # VS2 (+3)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (+3) AFTER  = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]


    
    
    vxor.vv v16, v28, v12
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99eaecc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a34ba04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2af11298)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7d9b2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe2e11858)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xef5bc16e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc2b8ac05)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e575020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0ec9252d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5c322e19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0fc96052)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7f052ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02fe97fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x309ec86b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd07e9d73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86ab928d)
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
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 4, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v16)       = [6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847]

    # VS2 (v4)        = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # MASK (v0)       = [   0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (v12) BEFORE = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf]
    # VD (v12) AFTER  = [b02d 6052 5c32 3492 6814 252d 0e57 5020 c2b8 5ff4 34b8 0fd4 f600 1858 d7d9 b2a0]

    # VS1 (+1)       = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]

    # VS2 (+1)       = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]
    # MASK (+1)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+1) BEFORE = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # VD (+1) AFTER  = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 02fe 39ae b2d3 f1c5]

    # VS1 (+2)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]

    # VS2 (+2)       = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # MASK (+2)       = [   1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+2) BEFORE = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]
    # VD (+2) AFTER  = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]

    # VS1 (+3)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # VS2 (+3)       = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (+3)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+3) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (+3) AFTER  = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]


    
    
    vxor.vv v12, v4, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7d9b2a0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf6001858)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc2b85ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0e575020)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6814252d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5c323492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02d6052)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02fe39ae)
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
    la x2, test_1_data+60
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 4, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v20)       = [b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1]

    # VS2 (v0)        = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # VD (v8)  AFTER  = [309e c86b 02fe 97fb d7f0 52ac 0fc9 6052 5c32 2e19 0ec9 252d 0e57 5020 c2b8 ac05]

    # VS1 (+1)       = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]

    # VS2 (+1)       = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # VD (+1) AFTER  = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]

    # VS1 (+2)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]

    # VS2 (+2)       = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # VD (+2) AFTER  = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]

    # VS1 (+3)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # VS2 (+3)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (+3) AFTER  = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]


    
    
    vxor.vv v8, v0, v20
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc2b8ac05)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0e575020)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0ec9252d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5c322e19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0fc96052)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7f052ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02fe97fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x309ec86b)
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
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 4, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v24)       = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]

    # VS2 (v8)        = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # MASK (v0)       = [   1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (v4)  BEFORE = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # VD (v4)  AFTER  = [37bf 4071 18fc 88d5 d498 3650 5233 c86b 02fe 97fb d7f0 52ac 0fc9 663e 5c32 2e19]

    # VS1 (+1)       = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]

    # VS2 (+1)       = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]
    # MASK (+1)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+1) BEFORE = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # VD (+1) AFTER  = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]

    # VS1 (+2)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]

    # VS2 (+2)       = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # MASK (+2)       = [   0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+2) BEFORE = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # VD (+2) AFTER  = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # VS1 (+3)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # VS2 (+3)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (+3)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+3) BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (+3) AFTER  = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]


    
    
    vxor.vv v4, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5c322e19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0fc9663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7f052ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02fe97fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233c86b)
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
    la x2, test_1_data+84
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 4, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v28)       = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]

    # VS2 (v12)       = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # VD (v0)  AFTER  = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 86ab 928d d07e 9d73 309e c86b 02fe 97fb]

    # VS1 (+1)       = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]

    # VS2 (+1)       = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # VD (+1) AFTER  = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]

    # VS1 (+2)       = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]

    # VS2 (+2)       = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # VD (+2) AFTER  = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # VS1 (+3)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # VS2 (+3)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (+3) AFTER  = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]


    
    
    vxor.vv v0, v12, v28
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02fe97fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x309ec86b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd07e9d73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86ab928d)
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
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 4, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v4)        = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]

    # VS2 (v16)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (v0)       = [   1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff mmmm ffff mmmm ffff]
    # VD (v28) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (v28) AFTER  = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b c8a4 37bf be85 18fc 928d]

    # VS1 (+1)       = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]

    # VS2 (+1)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # MASK (+1)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff mmmm ffff mmmm ffff]
    # VD (+1) BEFORE = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # VD (+1) AFTER  = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]

    # VS1 (+2)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]

    # VS2 (+2)       = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # MASK (+2)       = [   1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff mmmm ffff mmmm ffff]
    # VD (+2) BEFORE = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # VD (+2) AFTER  = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # VS1 (+3)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # VS2 (+3)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (+3)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff mmmm ffff mmmm ffff]
    # VD (+3) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (+3) AFTER  = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]


    
    
    vxor.vv v28, v16, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc928d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bfbe85)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83bc8a4)
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
    la x2, test_1_data+108
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 4, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v0)        = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]

    # VS2 (v20)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v24) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (v24) AFTER  = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d 1987 41e8 ff84 7c41]

    # VS1 (+1)       = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]

    # VS2 (+1)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+1) BEFORE = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # VD (+1) AFTER  = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]

    # VS1 (+2)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]

    # VS2 (+2)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+2) BEFORE = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # VD (+2) AFTER  = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # VS1 (+3)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # VS2 (+3)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+3) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (+3) AFTER  = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]


    
    
    vxor.vv v24, v20, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff847c41)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x198741e8)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
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
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 4, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v8)        = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]

    # VS2 (v24)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff]
    # VD (v20) BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (v20) AFTER  = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6212]

    # VS1 (+1)       = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]

    # VS2 (+1)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # MASK (+1)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff]
    # VD (+1) BEFORE = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # VD (+1) AFTER  = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]

    # VS1 (+2)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]

    # VS2 (+2)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # MASK (+2)       = [   0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff]
    # VD (+2) BEFORE = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # VD (+2) AFTER  = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # VS1 (+3)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # VS2 (+3)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (+3)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff]
    # VD (+3) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (+3) AFTER  = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]


    
    
    vxor.vv v20, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086212)
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
    la x2, test_1_data+132
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 4, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v12)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]

    # VS2 (v28)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v16) BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (v16) AFTER  = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]

    # VS1 (+1)       = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]

    # VS2 (+1)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+1) BEFORE = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # VD (+1) AFTER  = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]

    # VS1 (+2)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]

    # VS2 (+2)       = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+2) BEFORE = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # VD (+2) AFTER  = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # VS1 (+3)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # VS2 (+3)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+3) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (+3) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]


    
    
    vxor.vv v16, v28, v12
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
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
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 4, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v16)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # VS2 (v4)        = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (v0)       = [   0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm]
    # VD (v12) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (v12) AFTER  = [8dd5 6a3a fde8 848f b5ae e87a 4846 05f6 1477 ed8c b0ff fb1a 03d5 081b d4c2 4c52]

    # VS1 (+1)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]

    # VS2 (+1)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # MASK (+1)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm]
    # VD (+1) BEFORE = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # VD (+1) AFTER  = [86b0 81d4 8581 dc04 73b3 347e f632 84d7 e0e9 1b7d 426b 16c4 16cf 4d46 7148 8042]

    # VS1 (+2)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]

    # VS2 (+2)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # MASK (+2)       = [   0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm]
    # VD (+2) BEFORE = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # VD (+2) AFTER  = [9fcb 5e60 a216 7b52 0525 8134 169d eb14 3b9b b0b0 0cc9 d6c8 93b0 e550 f22b 81e9]

    # VS1 (+3)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # VS2 (+3)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (+3)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm]
    # VD (+3) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (+3) AFTER  = [b84b 10dd 527e 56d5 ea35 2925 445d 2cfc 1cf9 81e9 7e2a ad15 9705 8234 3ddd 9e2d]


    
    
    vxor.vv v12, v4, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v12, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd4c24c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0fffb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1477ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aee87a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde8848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd56a3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x71488042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16cf4d46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b16c4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e91b7d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf63284d7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3347e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8581dc04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b81e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b0e550)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9bb0b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169deb14)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05258134)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcb5e60)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ddd9e2d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97058234)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7e2aad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1cf981e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445d2cfc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea352925)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e56d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb84b10dd)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 4, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v20)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # VS2 (v0)        = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (v8)  AFTER  = [4156 16c4 16cf 4d46 7148 498b 4933 6a3a fde8 eb43 4310 e87a 1cf4 1696 1477 f301]

    # VS1 (+1)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]

    # VS2 (+1)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # VD (+1) AFTER  = [619b 02fc 749b e550 cd4b 81e9 3848 e16b 8581 dc04 16db 347e a282 84d7 9827 1b7d]

    # VS1 (+2)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]

    # VS2 (+2)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # VD (+2) AFTER  = [7e2a 02d9 76e4 8234 3ddd 9e2d a733 5e60 13b8 99da 2d06 8134 3752 eb14 9f79 b0b0]

    # VS1 (+3)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # VS2 (+3)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (+3) AFTER  = [24e0 658c c47c 5d71 0be7 93b3 79e9 7ffa ae68 56d5 0a4c 2925 c5ed 2cfc 1cf9 c887]


    
    
    vxor.vv v8, v0, v20
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1477f301)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1cf41696)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4310e87a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde8eb43)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49336a3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7148498b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16cf4d46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x415616c4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x98271b7d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa28284d7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16db347e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8581dc04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3848e16b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcd4b81e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x749be550)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x619b02fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9f79b0b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3752eb14)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d068134)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x13b899da)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa7335e60)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ddd9e2d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x76e48234)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7e2a02d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1cf9c887)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc5ed2cfc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0a4c2925)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xae6856d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e97ffa)
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
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 4, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v24)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # VS2 (v8)        = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (v0)       = [   1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm]
    # VD (v4)  BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (v4)  AFTER  = [16db e156 f632 84d7 e0e9 1b7d 426b 8dfb da4c 4d46 9b1a 8042 4933 cd04 fde8 848f]

    # VS1 (+1)       = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]

    # VS2 (+1)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # MASK (+1)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm]
    # VD (+1) BEFORE = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # VD (+1) AFTER  = [2d06 8134 169d bce8 3b9b 3ddc 0cc9 02fc 749b 6678 f22b 6484 86b0 81d4 4bfb 003d]

    # VS1 (+2)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]

    # VS2 (+2)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # MASK (+2)       = [   0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm]
    # VD (+2) BEFORE = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # VD (+2) AFTER  = [ea35 fe19 445d a8cc 4e11 81e9 8bfc 02d9 76e4 8234 3ddd 9e2d 9fcb 5e60 a216 7b52]

    # VS1 (+3)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # VS2 (+3)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (+3)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1]
    # ELEMENTS          [ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm]
    # VD (+3) BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (+3) AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]


    
    
    vxor.vv v4, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde8848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4933cd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c4d46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e91b7d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf63284d7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16dbe156)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x749b6678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc902fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d068134)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcb5e60)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ddd9e2d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x76e48234)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfc02d9)
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
    la x6, test_1_data+180
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 4, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v28)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # VS2 (v12)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (v0)  AFTER  = [cd4b 81e9 3848 e16b 8581 dc04 16db 347e a282 84d7 9827 1b7d 4156 16c4 16cf 4d46]

    # VS1 (+1)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]

    # VS2 (+1)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # VD (+1) AFTER  = [3ddd 9e2d a733 5e60 13b8 99da 2d06 8134 3752 eb14 9f79 b0b0 619b 02fc 749b e550]

    # VS1 (+2)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]

    # VS2 (+2)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # VD (+2) AFTER  = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # VS1 (+3)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # VS2 (+3)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (+3) AFTER  = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]


    
    
    vxor.vv v0, v12, v28
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16cf4d46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x415616c4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x98271b7d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa28284d7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16db347e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8581dc04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3848e16b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcd4b81e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x749be550)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x619b02fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9f79b0b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3752eb14)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d068134)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x13b899da)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa7335e60)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ddd9e2d)
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
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 16, LMUL = 4, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v4)        = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # VS2 (v16)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (v0)       = [   0    0    0    0    0    1    0    0    1    1    1    0    0    1    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm ffff mmmm mmmm ffff ffff ffff mmmm mmmm ffff mmmm ffff]
    # VD (v28) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (v28) AFTER  = [3b9b 3ddc 0cc9 d6c8 93b0 e550 f22b 6484 3848 e16b 8581 003d 73b3 347e f632 84d7]

    # VS1 (+1)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]

    # VS2 (+1)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # MASK (+1)       = [   0    1    1    0    1    0    1    1    0    0    1    1    1    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm ffff mmmm mmmm ffff ffff ffff mmmm mmmm ffff mmmm ffff]
    # VD (+1) BEFORE = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # VD (+1) AFTER  = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f 13b8 99da 2d06 8134 169d bce8]

    # VS1 (+2)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]

    # VS2 (+2)       = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # MASK (+2)       = [   1    1    0    1    0    1    0    0    1    1    0    0    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm ffff mmmm mmmm ffff ffff ffff mmmm mmmm ffff mmmm ffff]
    # VD (+2) BEFORE = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # VD (+2) AFTER  = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # VS1 (+3)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # VS2 (+3)       = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # MASK (+3)       = [   1    1    0    0    1    0    0    0    0    1    0    0    1    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm ffff mmmm mmmm ffff ffff ffff mmmm mmmm ffff mmmm ffff]
    # VD (+3) BEFORE = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # VD (+3) AFTER  = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]


    
    
    vxor.vv v28, v16, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf63284d7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3347e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8581003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3848e16b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b0e550)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2d068134)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x13b899da)
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
    la x2, test_1_data+204
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 16, LMUL = 4, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v0)        = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # VS2 (v20)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (v24) AFTER  = [13b8 99da 2d06 8134 3752 eb14 9f79 b0b0 619b 02fc 749b e550 cd4b 81e9 3848 e16b]

    # VS1 (+1)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]

    # VS2 (+1)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # VD (+1) AFTER  = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]

    # VS1 (+2)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]

    # VS2 (+2)       = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # VD (+2) AFTER  = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # VS1 (+3)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # VS2 (+3)       = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # VD (+3) AFTER  = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]


    
    
    vxor.vv v24, v20, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3848e16b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd4b81e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x749be550)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x619b02fc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9f79b0b0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3752eb14)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2d068134)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x13b899da)
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
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 16, LMUL = 4, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v8)        = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # VS2 (v24)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (v0)       = [   0    0    1    0    0    0    1    0    1    0    1    1    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff mmmm ffff ffff ffff ffff mmmm ffff]
    # VD (v20) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (v20) AFTER  = [9705 6592 e92f 674b 9fcb e57f 13b8 7b52 2d06 2532 3752 eb14 9f79 b0b0 0cc9 02fc]

    # VS1 (+1)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]

    # VS2 (+1)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # MASK (+1)       = [   1    0    0    1    1    0    0    0    0    1    1    1    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff mmmm ffff ffff ffff ffff mmmm ffff]
    # VD (+1) BEFORE = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # VD (+1) AFTER  = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]

    # VS1 (+2)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]

    # VS2 (+2)       = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # MASK (+2)       = [   0    0    1    0    1    0    0    1    0    0    0    0    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff mmmm ffff ffff ffff ffff mmmm ffff]
    # VD (+2) BEFORE = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # VD (+2) AFTER  = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # VS1 (+3)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # VS2 (+3)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # MASK (+3)       = [   0    1    1    1    0    1    0    0    0    1    0    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff mmmm ffff ffff ffff ffff mmmm ffff]
    # VD (+3) BEFORE = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # VD (+3) AFTER  = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]


    
    
    vxor.vv v20, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc902fc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9f79b0b0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3752eb14)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2d062532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x13b87b52)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 16, LMUL = 4, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v12)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # VS2 (v28)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (v16) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 3ddd 9e2d a733 5e60 13b8 99da 2d06 8134]

    # VS1 (+1)       = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]

    # VS2 (+1)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # VD (+1) AFTER  = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]

    # VS1 (+2)       = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]

    # VS2 (+2)       = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # VD (+2) AFTER  = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # VS1 (+3)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # VS2 (+3)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # VD (+3) AFTER  = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]


    
    
    vxor.vv v16, v28, v12
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2d068134)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x13b899da)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa7335e60)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3ddd9e2d)
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
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 16, LMUL = 4, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v16)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # VS2 (v4)        = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (v0)       = [   1    1    0    0    1    1    0    0    1    0    1    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm mmmm mmmm ffff]
    # VD (v12) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (v12) AFTER  = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 7e2a 02d9 9705 6592 e92f 9e2d]

    # VS1 (+1)       = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]

    # VS2 (+1)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # MASK (+1)       = [   1    0    0    1    1    1    0    1    1    1    0    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm mmmm mmmm ffff]
    # VD (+1) BEFORE = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # VD (+1) AFTER  = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]

    # VS1 (+2)       = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]

    # VS2 (+2)       = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # MASK (+2)       = [   1    0    0    0    0    0    1    1    1    0    0    0    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm mmmm mmmm ffff]
    # VD (+2) BEFORE = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # VD (+2) AFTER  = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # VS1 (+3)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # VS2 (+3)       = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # MASK (+3)       = [   1    1    1    0    0    0    0    1    1    0    0    1    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm mmmm mmmm ffff]
    # VD (+3) BEFORE = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # VD (+3) AFTER  = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]


    
    
    vxor.vv v12, v4, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f9e2d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7e2a02d9)
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
    la x2, test_1_data+252
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 16, LMUL = 4, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v20)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # VS2 (v0)        = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (v8)  AFTER  = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 c5ed 2cfc 1cf9 c887]

    # VS1 (+1)       = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]

    # VS2 (+1)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+1) BEFORE = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # VD (+1) AFTER  = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]

    # VS1 (+2)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]

    # VS2 (+2)       = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+2) BEFORE = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]
    # VD (+2) AFTER  = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # VS1 (+3)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]

    # VS2 (+3)       = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (+3) BEFORE = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # VD (+3) AFTER  = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]


    
    
    vxor.vv v8, v0, v20
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1cf9c887)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc5ed2cfc)
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
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 16, LMUL = 4, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v24)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # VS2 (v8)        = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (v0)       = [   1    0    1    0    1    1    1    0    1    0    1    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (v4)  BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (v4)  AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd ae68 81e3]

    # VS1 (+1)       = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]

    # VS2 (+1)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # MASK (+1)       = [   1    1    0    0    1    1    1    0    1    0    1    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (+1) BEFORE = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # VD (+1) AFTER  = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]

    # VS1 (+2)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]

    # VS2 (+2)       = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # MASK (+2)       = [   1    0    1    0    0    0    0    1    1    1    0    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (+2) BEFORE = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]
    # VD (+2) AFTER  = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # VS1 (+3)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]

    # VS2 (+3)       = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # MASK (+3)       = [   1    0    0    0    1    1    0    0    1    1    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (+3) BEFORE = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # VD (+3) AFTER  = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]


    
    
    vxor.vv v4, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xae6881e3)
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
    la x2, test_1_data+276
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 16, LMUL = 4, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v28)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # VS2 (v12)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v0)  BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (v0)  AFTER  = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]

    # VS1 (+1)       = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]

    # VS2 (+1)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+1) BEFORE = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # VD (+1) AFTER  = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]

    # VS1 (+2)       = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]

    # VS2 (+2)       = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+2) BEFORE = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]
    # VD (+2) AFTER  = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]

    # VS1 (+3)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]

    # VS2 (+3)       = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+3) BEFORE = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # VD (+3) AFTER  = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]


    
    
    vxor.vv v0, v12, v28
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
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
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 64 # VL = 64
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 16, LMUL = 4, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v4)        = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # VS2 (v16)       = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # MASK (v0)       = [   0    1    0    0    1    1    1    1    0    0    1    1    0    1    0    0]
    # ELEMENTS          [mmmm ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm ffff mmmm mmmm]
    # VD (v28) BEFORE = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # VD (v28) AFTER  = [3be0 f15e dfca dfe1 9a0f fe25 ab1c 37c9 4daa 96d5 8d7a 46c8 4ed8 d896 c3a2 2eae]

    # VS1 (+1)       = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]

    # VS2 (+1)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]
    # MASK (+1)       = [   1    1    1    1    0    0    0    1    0    1    0    0    0    1    0    0]
    # ELEMENTS          [mmmm ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm ffff mmmm mmmm]
    # VD (+1) BEFORE = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # VD (+1) AFTER  = [260c 7d4c b1a7 31d3 fde2 23d8 4c45 90a6 3533 4010 734b 985d f1bc 14de 6915 0191]

    # VS1 (+2)       = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]

    # VS2 (+2)       = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # MASK (+2)       = [   0    1    0    0    1    1    1    1    1    0    0    0    1    1    1    0]
    # ELEMENTS          [mmmm ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm ffff mmmm mmmm]
    # VD (+2) BEFORE = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]
    # VD (+2) AFTER  = [95a7 7ad1 355e 64a2 13b3 9083 f66a c5ce 302b 8d4e 8660 4880 fdc8 043a 43c5 c70c]

    # VS1 (+3)       = [311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2]

    # VS2 (+3)       = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]
    # MASK (+3)       = [   0    0    0    0    1    0    0    1    1    0    0    1    1    0    1    0]
    # ELEMENTS          [mmmm ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm ffff mmmm mmmm]
    # VD (+3) BEFORE = [995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8]
    # VD (+3) AFTER  = [995c cbf8 1151 057d 3d17 98a1 ac98 5269 8218 472f 4f03 fc4d 1ee9 37e5 a0f9 cba8]


    
    
    vxor.vv v28, v16, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed8d896)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8d7a46c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xab1c37c9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a0ffe25)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0f15e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bc14de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35334010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c4590a6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1a731d3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x260c7d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43c5c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfdc8043a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x302b8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf66ac5ce)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x13b39083)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a77ad1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa0f9cba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ee937e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f03fc4d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8218472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac985269)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3d1798a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 16, LMUL = 4, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v0)        = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # VS2 (v20)       = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # VD (v24) AFTER  = [98a9 d9dc 52f5 14de e42a caae b9af f15e b1c0 464f 9a0f fe25 ab1c 37c9 a86e c97a]

    # VS1 (+1)       = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]

    # VS2 (+1)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # VD (+1) AFTER  = [d3a8 b6fa fdc8 043a 43c5 9da2 260c 7d4c b1a7 31d3 7976 1af0 4678 90a6 82f7 4010]

    # VS1 (+2)       = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]

    # VS2 (+2)       = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]
    # VD (+2) AFTER  = [4655 fc4d 1ee9 8eed a0f9 21e7 31ef 7ad1 6708 03be 13b3 9083 f66a c5ce 302b 3976]

    # VS1 (+3)       = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]

    # VS2 (+3)       = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f]
    # VD (+3) AFTER  = [7cba ceb7 dc44 7722 31a2 01a7 995c 9ddc 9d84 70a5 3d17 af2b de8c 5269 8218 22a3]


    
    
    vxor.vv v24, v20, v0
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa86ec97a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xab1c37c9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a0ffe25)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1c0464f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb9aff15e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe42acaae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x52f514de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98a9d9dc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82f74010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x467890a6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79761af0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1a731d3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x260c7d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43c59da2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfdc8043a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3a8b6fa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x302b3976)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf66ac5ce)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x13b39083)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x670803be)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31ef7ad1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa0f921e7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ee98eed)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4655fc4d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x821822a3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xde8c5269)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3d17af2b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9d8470a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995c9ddc)
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
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 16, LMUL = 4, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v8)        = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # VS2 (v24)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # MASK (v0)       = [   1    1    1    1    0    0    1    1    0    0    1    1    0    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm mmmm ffff ffff mmmm ffff ffff mmmm]
    # VD (v20) BEFORE = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # VD (v20) AFTER  = [7976 1af0 4678 90a6 3533 08fb 98a9 d9dc f1bc d84d e42a caae 3be0 f15e b1c0 dfe1]

    # VS1 (+1)       = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]

    # VS2 (+1)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]
    # MASK (+1)       = [   0    0    0    0    0    0    1    0    1    0    1    0    1    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm mmmm ffff ffff mmmm ffff ffff mmmm]
    # VD (+1) BEFORE = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # VD (+1) AFTER  = [04b1 1e73 63b9 1dcd 700a 8d4e d3a8 4880 fdc8 71f6 43c5 c70c 260c 7d4c dbee 5e94]

    # VS1 (+2)       = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]

    # VS2 (+2)       = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # MASK (+2)       = [   0    1    0    1    0    1    0    1    1    0    0    0    0    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm mmmm ffff ffff mmmm ffff ffff mmmm]
    # VD (+2) BEFORE = [311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2]
    # VD (+2) AFTER  = [311c 98a1 ac98 e804 918f 472f 4f03 fc4d 1ee9 37e5 8b4e cba8 95a7 4545 6708 03be]

    # VS1 (+3)       = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]

    # VS2 (+3)       = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1]
    # MASK (+3)       = [   1    0    0    0    0    0    1    1    0    0    0    1    1    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff mmmm mmmm ffff ffff mmmm mmmm ffff ffff mmmm ffff ffff mmmm]
    # VD (+3) BEFORE = [08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d]
    # VD (+3) AFTER  = [08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d]


    
    
    vxor.vv v20, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1c0dfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0f15e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe42acaae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98a9d9dc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x467890a6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79761af0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x260c7d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43c5c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfdc871f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3a84880)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x670803be)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ee937e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f03fc4d)
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
    la x2, test_1_data+324
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 16, LMUL = 4, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v12)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # VS2 (v28)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # VD (v16) AFTER  = [43c5 9da2 260c 7d4c b1a7 31d3 7976 1af0 4678 90a6 82f7 4010 98a9 d9dc 52f5 14de]

    # VS1 (+1)       = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]

    # VS2 (+1)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # VD (+1) AFTER  = [a0f9 21e7 31ef 7ad1 6708 03be 13b3 9083 f66a c5ce 302b 3976 d3a8 b6fa fdc8 043a]

    # VS1 (+2)       = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]

    # VS2 (+2)       = [995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]
    # VD (+2) AFTER  = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]

    # VS1 (+3)       = [c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8]

    # VS2 (+3)       = [a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722]
    # VD (+3) AFTER  = [2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722]


    
    
    vxor.vv v16, v28, v12
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x52f514de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98a9d9dc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82f74010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x467890a6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79761af0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1a731d3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x260c7d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43c59da2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfdc8043a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3a8b6fa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x302b3976)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf66ac5ce)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x13b39083)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x670803be)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31ef7ad1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa0f921e7)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc180944a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa77d21f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24941503)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    vsetvli x0, x7, e16,m4
    vle16.v v16, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v4, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v12, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 16, LMUL = 4, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v16)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # VS2 (v4)        = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # MASK (v0)       = [   0    1    1    1    1    1    0    1    0    1    0    0    1    0    1    1]
    # ELEMENTS          [mmmm ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm ffff mmmm ffff ffff]
    # VD (v12) BEFORE = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # VD (v12) AFTER  = [700a 3976 d3a8 b6fa fdc8 043a 65e3 9da2 982b 7d4c dbee 5e94 7976 23d8 4678 90a6]

    # VS1 (+1)       = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]

    # VS2 (+1)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]
    # MASK (+1)       = [   0    0    0    0    0    1    1    1    1    0    0    1    0    0    0    1]
    # ELEMENTS          [mmmm ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm ffff mmmm ffff ffff]
    # VD (+1) BEFORE = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # VD (+1) AFTER  = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 03be 04b1 1e73 63b9 c5ce]

    # VS1 (+2)       = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]

    # VS2 (+2)       = [7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f]
    # MASK (+2)       = [   0    1    1    0    0    1    0    0    1    0    1    0    1    0    1    0]
    # ELEMENTS          [mmmm ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm ffff mmmm ffff ffff]
    # VD (+2) BEFORE = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]
    # VD (+2) AFTER  = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]

    # VS1 (+3)       = [a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7]

    # VS2 (+3)       = [f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a]
    # MASK (+3)       = [   0    1    1    0    0    1    1    0    1    1    0    1    1    0    1    0]
    # ELEMENTS          [mmmm ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm ffff mmmm ffff ffff]
    # VD (+3) BEFORE = [a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618]
    # VD (+3) AFTER  = [a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618]


    
    
    vxor.vv v12, v4, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v12, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x467890a6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x797623d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982b7d4c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e39da2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfdc8043a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd3a8b6fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a3976)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b9c5ce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e03be)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    vsetvli x0, x7, e16,m4
    vle16.v v20, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v0, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 16, LMUL = 4, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v20)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]

    # VS2 (v0)        = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # VD (v8)  AFTER  = [6708 03be 13b3 9083 f66a c5ce 302b 3976 d3a8 b6fa fdc8 043a 43c5 9da2 260c 7d4c]

    # VS1 (+1)       = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]

    # VS2 (+1)       = [311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]
    # VD (+1) AFTER  = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]

    # VS1 (+2)       = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1]

    # VS2 (+2)       = [08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8]
    # VD (+2) AFTER  = [c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8]

    # VS1 (+3)       = [9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff]

    # VS2 (+3)       = [c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4]
    # VD (+3) AFTER  = [3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4]


    
    
    vxor.vv v8, v0, v20
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x260c7d4c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43c59da2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfdc8043a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd3a8b6fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x302b3976)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf66ac5ce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13b39083)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x670803be)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    vsetvli x0, x7, e16,m4
    vle16.v v24, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 16, LMUL = 4, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v24)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]

    # VS2 (v8)        = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # MASK (v0)       = [   0    0    0    1    1    1    1    0    1    1    0    0    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff]
    # VD (v4)  BEFORE = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # VD (v4)  AFTER  = [cd1b 37e5 8b4e cba8 95a7 4545 6708 64a2 13b3 9083 63b9 1dcd 302b 3976 d3a8 b6fa]

    # VS1 (+1)       = [995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8]

    # VS2 (+1)       = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]
    # MASK (+1)       = [   0    1    0    0    1    1    0    0    1    0    0    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff]
    # VD (+1) BEFORE = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]
    # VD (+1) AFTER  = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]

    # VS1 (+2)       = [a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7]

    # VS2 (+2)       = [2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722]
    # MASK (+2)       = [   1    1    0    1    1    0    1    1    1    1    1    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff]
    # VD (+2) BEFORE = [a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7]
    # VD (+2) AFTER  = [a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7]

    # VS1 (+3)       = [f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503]

    # VS2 (+3)       = [e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71]
    # MASK (+3)       = [   1    0    0    0    0    0    0    0    1    0    0    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff]
    # VD (+3) BEFORE = [4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8]
    # VD (+3) AFTER  = [4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8]


    
    
    vxor.vv v4, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd3a8b6fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x302b3976)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13b39083)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x670864a2)
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
    la x5, test_1_data+372
    vsetvli x0, x7, e16,m4
    vle16.v v28, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 16, LMUL = 4, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v28)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]

    # VS2 (v12)       = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # VD (v0)  AFTER  = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 a0f9 21e7 31ef 7ad1 6708 03be 13b3 9083]

    # VS1 (+1)       = [7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f]

    # VS2 (+1)       = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1]
    # VD (+1) AFTER  = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1]

    # VS1 (+2)       = [f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a]

    # VS2 (+2)       = [a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff]
    # VD (+2) AFTER  = [9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff]

    # VS1 (+3)       = [603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb]

    # VS2 (+3)       = [bacc 4de5 603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [44aa e55f bacc 4de5 603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b]
    # VD (+3) AFTER  = [44aa e55f bacc 4de5 603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b]


    
    
    vxor.vv v0, v12, v28
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13b39083)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x670803be)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31ef7ad1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa0f921e7)
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

