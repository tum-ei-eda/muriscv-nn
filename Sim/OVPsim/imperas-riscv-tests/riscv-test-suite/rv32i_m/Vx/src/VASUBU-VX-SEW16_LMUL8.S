// RISC-V Architectural Validation Test VASUBU-VX-SEW16_LMUL8
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
// Description: Testing instruction 'vasubu.vx'.

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
    li x31, 0
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 128 # VL = 128
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 8, Use Mask = 1, VL = 128\n")

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27]
    # MASK (v0)       = [   0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (v24) BEFORE = [e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d]
    # VD (v24) AFTER  = [e54c 8c1e c737 ad3a e31f fa64 0466 3633 48d4 6aff 1011 d5fd 214f 6f1f 432b 4e94]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e]
    # MASK (+1)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+1) BEFORE = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # VD (+1) AFTER  = [3aef 5ff4 34b8 51e9 f600 3160 195b 3d74 fbba 7ae7 2c63 6d70 3e53 dadf 72a6 60db]

    # RS1  (x31)       = 0

    # VS2 (+2)       = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # MASK (+2)       = [   1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+2) BEFORE = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]
    # VD (+2) AFTER  = [291a 3650 5233 1cd7 596a 78e3 b2d3 331f b02d 663e 340a 3492 6814 3d6d 1d78 2ffa]

    # RS1  (x31)       = 0

    # VS2 (+3)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (+3)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+3) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (+3) AFTER  = [2d84 f8a5 5b08 6787 62f6 54c0 68de a97f d1bc 1e18 c83b 2039 37bf 446b 6a4c 88d5]

    # RS1  (x31)       = 0

    # VS2 (+4)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # MASK (+4)       = [   1    1    0    1    1    1    1    0    0    0    1    1    1    1    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+4) BEFORE = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # VD (+4) AFTER  = [0bd1 7d8d 17a2 040e 5995 2629 4d99 4c52 9b32 7ba8 4a8f 4311 303b 60d1 6075 7c53]

    # RS1  (x31)       = 0

    # VS2 (+5)       = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # MASK (+5)       = [   0    1    0    0    0    0    1    0    1    0    0    1    1    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+5) BEFORE = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # VD (+5) AFTER  = [e0e9 46fe 426b 8dfb da4c 9686 46eb 8042 7e4f cd04 fc9d 775b 2423 02fb 05ab 05f6]

    # RS1  (x31)       = 0

    # VS2 (+6)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (+6)       = [   1    0    0    1    1    0    1    0    0    1    0    1    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+6) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (+6) AFTER  = [0665 3ddc 0cc9 333c 7916 6678 4358 6484 86b0 001f 4bfb 70ab 73b3 e156 f632 0496]

    # RS1  (x31)       = 0

    # VS2 (+7)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # MASK (+7)       = [   0    0    1    0    0    0    0    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (+7) BEFORE = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # VD (+7) AFTER  = [4e11 81e9 4b83 ad15 9705 6592 e92f 674b 9fcb e57f 0293 7b52 0525 2532 169d 1eee]


    
    vasubu.vx v24, v16, x31, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m8
    vse16.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x432b4e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x214f6f1f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1011d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48d46aff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04663633)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x72a660db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3e53dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c636d70)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b3d74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6003160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b851e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1d782ffa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68143d6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x340a3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d3331f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x596a78e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x52331cd7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x291a3650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a4c88d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf446b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b2039)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc1e18)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68dea97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f654c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2d84f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x60757c53)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x303b60d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a8f4311)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4d994c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x59952629)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2040e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0bd17d8d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05ab05f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x242302fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc9d775b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7e4fcd04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46eb8042)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xda4c9686)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x426b8dfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe0e946fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6320496)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73b3e156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4bfb70ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b0001f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43586484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79166678)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0cc9333c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x06653ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169d1eee)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05252532)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02937b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9fcbe57f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe92f674b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97056592)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b83ad15)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1181e9)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x30, 0
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 105 # VL = 105
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 8, Use Mask = 0, VL = 105\n")

    





    # RS1  (x30)       = 0

    # VS2 (v24)       = [0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65]
    # VD (v16) AFTER  = [0349 6d70 3e53 306e 72a6 460f 639c 569d 7190 7d32 0233 1288 5ec8 3633 48d4 6aff]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # VD (+1) AFTER  = [340a 2a60 1a13 3d6d 1d78 2ffa 1a5c 07ea 7b00 51e9 0cae 3160 7ddd 3d74 1632 6424]

    # RS1  (x30)       = 0

    # VS2 (+2)       = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]
    # VD (+2) AFTER  = [1be0 2039 0c7e 446b 6a4c 1b28 291a 526f 4127 1cd7 596a 78e3 5817 331f 33ef 1a49]

    # RS1  (x30)       = 0

    # VS2 (+3)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (+3) AFTER  = [4a8f 4311 303b 60d1 1c3a 7c53 2d84 33c4 317b 65b7 54b4 54c0 68de 3eec 641e 1e18]

    # RS1  (x30)       = 0

    # VS2 (+4)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # VD (+4) AFTER  = [5ad7 775b 2423 02fb 05ab 76c6 0bd1 7d8d 01eb 040e 5995 2629 4d99 3dd4 27f8 49bc]

    # RS1  (x30)       = 0

    # VS2 (+5)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # VD (+5) AFTER  = [39da 70ab 7b19 1ea9 7075 0496 2136 46fe 6d26 4b43 4d8d 4021 46eb 6682 7e4f 4248]

    # RS1  (x30)       = 0

    # VS2 (+6)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (+6) AFTER  = [a216 7b52 0525 2532 169d bce8 3b9b 6b64 49d8 333c 7916 3242 4358 40ea 25fe 001f]

    # RS1  (x30)       = 0

    # VS2 (+7)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # VD (+7) AFTER  = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]


    
    vasubu.vx v16, v24, x30



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m8
    vse16.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48d46aff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5ec83633)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02331288)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x71907d32)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x639c569d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x72a6460f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3e53306e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03496d70)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x16326424)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ddd3d74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0cae3160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b0051e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1a5c07ea)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1d782ffa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1a133d6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x340a2a60)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33ef1a49)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5817331f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x596a78e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x41271cd7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x291a526f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a4c1b28)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c7e446b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1be02039)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x641e1e18)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68de3eec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x54b454c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x317b65b7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2d8433c4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1c3a7c53)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x303b60d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a8f4311)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27f849bc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4d993dd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x59952629)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x01eb040e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0bd17d8d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05ab76c6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x242302fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5ad7775b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7e4f4248)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46eb6682)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4d8d4021)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d264b43)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x213646fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x70750496)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b191ea9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x39da70ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25fe001f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x435840ea)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79163242)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49d8333c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3b9b6b64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169dbce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05252532)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa2167b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9fcbe57f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe92f674b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97056592)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bfcad15)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1181e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x445da8cc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea35fe19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x527e81e3)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x29, -2047
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 78 # VL = 78
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 8, Use Mask = 1, VL = 78\n")

    





    # RS1  (x29)       = -2047

    # VS2 (v16)       = [195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64]
    # MASK (v0)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (v8)  BEFORE = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a]
    # VD (v8)  AFTER  = [f600 a3d1 195b 62bf 9a31 e823 8749 f16f c253 b46d 7ca6 ca0f e54c da9d c737 ad3a]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1]
    # MASK (+1)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+1) BEFORE = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # VD (+1) AFTER  = [824d 39ae dc16 b71f b02d 9e49 67dd 3492 9e13 54c0 a177 b3fa 9e5c 5ff4 34b8 0fd4]

    # RS1  (x29)       = -2047

    # VS2 (+2)       = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # MASK (+2)       = [   0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+2) BEFORE = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]
    # VD (+2) AFTER  = [62f6 d8bf a968 c2ec e81d a218 9fdf a438 907e c86a ee4c 9f28 d498 d66e 5233 a4dd]

    # RS1  (x29)       = -2047

    # VS2 (+3)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (+3)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+3) BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (+3) AFTER  = [03d5 081b d199 c1d4 abf8 7ba8 ce8f 9378 b43a e4d1 a03a c1a2 b184 b7c3 b57b e9b6]

    # RS1  (x29)       = -2047

    # VS2 (+4)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # MASK (+4)       = [   0    1    1    1    1    0    1    0    1    1    0    1    1    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+4) BEFORE = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # VD (+4) AFTER  = [da4c 9686 caea ea82 024e cd04 ded7 848f a823 86fb 4846 fac6 8fd1 ed8c 17a2 880d]

    # RS1  (x29)       = -2047

    # VS2 (+5)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # MASK (+5)       = [   0    0    1    1    0    1    0    0    0    0    1    0    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+5) BEFORE = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # VD (+5) AFTER  = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # RS1  (x29)       = -2047

    # VS2 (+6)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (+6)       = [   0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+6) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (+6) AFTER  = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]

    # RS1  (x29)       = -2047

    # VS2 (+7)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # MASK (+7)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (+7) BEFORE = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # VD (+7) AFTER  = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]


    
    vasubu.vx v8, v16, x29, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m8
    vse16.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54cda9d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca6ca0f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc253b46d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8749f16f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a31e823)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e5c5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa177b3fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e1354c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d9e49)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc16b71f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd498d66e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xee4c9f28)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x907ec86a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9fdfa438)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe81da218)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968c2ec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6d8bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb57be9b6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb184b7c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa03ac1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb43ae4d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xce8f9378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xabf87ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd199c1d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d5081b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2880d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8fd1ed8c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4846fac6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa82386fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xded7848f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x024ecd04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcaeaea82)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xda4c9686)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x426b8dfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe0e9092c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6323d52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73b3e156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4bfb003d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b081d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf22b6484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93b06678)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0cc9d6c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3b9b3ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169dbce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05252532)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa2167b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9fcbe57f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe92f674b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97056592)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bfcad15)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1181e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x445da8cc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea35fe19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x527e81e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79e910dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0be793b3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc47c5d71)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x28, -1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 8, Use Mask = 0, VL = 64\n")

    





    # RS1  (x28)       = -1

    # VS2 (v8)        = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf]
    # VD (v0)  AFTER  = [9d78 affb 9a5d 87eb fb01 d1e9 8cae b160 fdde bd74 9632 e424 834a ed70 be54 b06e]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # VD (+1) AFTER  = [ea4d 9b29 a91a d26f c127 9cd8 d96a f8e3 d817 b320 b3ef 9a4a b40b aa61 9a14 bd6d]

    # RS1  (x28)       = -1

    # VS2 (+2)       = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]
    # VD (+2) AFTER  = [9c3b fc53 ad85 b3c4 b17c e5b7 d4b5 d4c0 e8df beed e41e 9e19 9be0 a039 8c7f c46b]

    # RS1  (x28)       = -1

    # VS2 (+3)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (+3) AFTER  = [85ac f6c7 8bd2 fd8e 81eb 840e d996 a62a cd9a bdd5 a7f9 c9bd ca90 c311 b03b e0d2]

    # RS1  (x28)       = -1

    # VS2 (+4)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # VD (+4) AFTER  = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]

    # RS1  (x28)       = -1

    # VS2 (+5)       = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # VD (+5) AFTER  = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # RS1  (x28)       = -1

    # VS2 (+6)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (+6) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]

    # RS1  (x28)       = -1

    # VS2 (+7)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # VD (+7) AFTER  = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]


    
    vasubu.vx v0, v8, x28



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m8
    vse16.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbe54b06e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x834aed70)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9632e424)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfddebd74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8caeb160)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfb01d1e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a5d87eb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9d78affb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a14bd6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb40baa61)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb3ef9a4a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd817b320)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd96af8e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc1279cd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa91ad26f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea4d9b29)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8c7fc46b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9be0a039)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe41e9e19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe8dfbeed)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4b5d4c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb17ce5b7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad85b3c4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9c3bfc53)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb03be0d2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xca90c311)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa7f9c9bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd9abdd5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd996a62a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81eb840e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bd2fd8e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x85acf6c7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5aeeeb5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc9d848f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8dd5cd04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b1a8042)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xda4c9686)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x426b8dfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe0e9092c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6323d52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73b3e156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4bfb003d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b081d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf22b6484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93b06678)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0cc9d6c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3b9b3ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169dbce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05252532)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa2167b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9fcbe57f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe92f674b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97056592)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bfcad15)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1181e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x445da8cc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea35fe19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x527e81e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79e910dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0be793b3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc47c5d71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24e0658c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x47c6f638)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc3a22eae)
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
    li x27, -4660
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 8, Use Mask = 1, VL = 57\n")

    





    # RS1  (x27)       = -4660

    # VS2 (v8)        = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # MASK (v0)       = [   0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (v24) BEFORE = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf]
    # VD (v24) AFTER  = [b02d a363 bd24 3492 6814 c687 a692 b914 a376 5ff4 34b8 0fd4 f600 ba7a 06f7 c68e]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]
    # MASK (+1)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+1) BEFORE = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # VD (+1) AFTER  = [d1bc a732 c83b a953 9598 4071 f366 a442 d498 3650 5233 a4dd e284 39ae b2d3 f1c5]

    # RS1  (x27)       = -4660

    # VS2 (+2)       = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # MASK (+2)       = [   1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+2) BEFORE = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]
    # VD (+2) AFTER  = [b112 d2d6 d3a9 cc2b b955 8621 6075 c1a2 b69e f8a5 ba95 6787 62f6 ddda a968 c806]

    # RS1  (x27)       = -4660

    # VS2 (+3)       = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (+3)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+3) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (+3) AFTER  = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 06a7 8b05 8d28 03d5 af43 b32a 4c52]

    # RS1  (x27)       = -4660

    # VS2 (+4)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # MASK (+4)       = [   1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+4) BEFORE = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # VD (+4) AFTER  = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]

    # RS1  (x27)       = -4660

    # VS2 (+5)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # MASK (+5)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+5) BEFORE = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # VD (+5) AFTER  = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # RS1  (x27)       = -4660

    # VS2 (+6)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (+6)       = [   1    0    0    0    0    1    1    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+6) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (+6) AFTER  = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]

    # RS1  (x27)       = -4660

    # VS2 (+7)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # MASK (+7)       = [   1    0    0    1    0    1    0    1    0    0    0    1    1    1    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # VD (+7) BEFORE = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # VD (+7) AFTER  = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]


    
    vasubu.vx v24, v8, x27, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m8
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x06f7c68e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf600ba7a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa3765ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa692b914)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6814c687)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbd243492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02da363)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe28439ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf366a442)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95984071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83ba953)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bca732)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968c806)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6ddda)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xba956787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb69ef8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb9558621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3a9cc2b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb112d2d6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5af43)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b058d28)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b5606a7)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93b06678)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0cc9d6c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3b9b3ddc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x169dbce8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x05252532)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa2167b52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9fcbe57f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe92f674b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x97056592)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8bfcad15)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e1181e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x445da8cc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea35fe19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x527e81e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79e910dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0be793b3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc47c5d71)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24e0658c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47c6f638)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x26, 2147483648
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 8, Use Mask = 0, VL = 41\n")

    





    # RS1  (x26)       = 2147483648

    # VS2 (v0)        = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # VD (v16) AFTER  = [4127 1cd7 596a 78e3 5817 331f 33ef 1a49 340a 2a60 1a13 3d6d 1d78 2ffa 1a5c 07ea]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # VD (+1) AFTER  = [317b 65b7 54b4 54c0 68de 3eec 641e 1e18 1be0 2039 0c7e 446b 6a4c 1b28 291a 526f]

    # RS1  (x26)       = 2147483648

    # VS2 (+2)       = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # VD (+2) AFTER  = [17a2 fb1a 03d5 081b b32a 4c52 9b32 49bc 4a8f 4311 303b 60d1 1c3a 7c53 2d84 33c4]

    # RS1  (x26)       = 2147483648

    # VS2 (+3)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (+3) AFTER  = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]

    # RS1  (x26)       = 2147483648

    # VS2 (+4)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # VD (+4) AFTER  = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]

    # RS1  (x26)       = 2147483648

    # VS2 (+5)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # VD (+5) AFTER  = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # RS1  (x26)       = 2147483648

    # VS2 (+6)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (+6) AFTER  = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]

    # RS1  (x26)       = 2147483648

    # VS2 (+7)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # VD (+7) AFTER  = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]


    
    vasubu.vx v16, v0, x26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m8
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1a5c07ea)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1d782ffa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1a133d6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x340a2a60)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x33ef1a49)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5817331f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x596a78e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x41271cd7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x291a526f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6a4c1b28)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0c7e446b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1be02039)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x641e1e18)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x68de3eec)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x54b454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x317b65b7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2d8433c4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1c3a7c53)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x303b60d1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4a8f4311)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b3249bc)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93b06678)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0cc9d6c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3b9b3ddc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x169dbce8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x05252532)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa2167b52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9fcbe57f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe92f674b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x97056592)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8bfcad15)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e1181e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x445da8cc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea35fe19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x527e81e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79e910dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0be793b3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc47c5d71)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24e0658c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47c6f638)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x25, 4660
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 8, Use Mask = 1, VL = 32\n")

    





    # RS1  (x25)       = 4660

    # VS2 (v24)       = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # MASK (v0)       = [   1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (v8)  BEFORE = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # VD (v8)  AFTER  = [0364 4071 18fc 88d5 2000 4955 5233 13bd 5050 6fc9 4efd 2a05 2ad5 663e 2af0 2146]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]
    # MASK (+1)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+1) BEFORE = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # VD (+1) AFTER  = [951e 57b7 6075 c1a2 3874 f8a5 2861 6787 62f6 4ba6 5fc4 a97f 5b04 7dd8 12c6 171f]

    # RS1  (x25)       = 4660

    # VS2 (+2)       = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # MASK (+2)       = [   0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+2) BEFORE = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # VD (+2) AFTER  = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # RS1  (x25)       = 4660

    # VS2 (+3)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (+3)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+3) BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (+3) AFTER  = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]

    # RS1  (x25)       = 4660

    # VS2 (+4)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # MASK (+4)       = [   0    0    1    1    1    1    0    1    0    1    0    1    0    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+4) BEFORE = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # VD (+4) AFTER  = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]

    # RS1  (x25)       = 4660

    # VS2 (+5)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # MASK (+5)       = [   1    1    1    1    0    1    1    0    0    0    1    1    0    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+5) BEFORE = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # VD (+5) AFTER  = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # RS1  (x25)       = 4660

    # VS2 (+6)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (+6)       = [   1    1    1    0    0    0    0    1    0    1    0    1    0    1    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+6) BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (+6) AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]

    # RS1  (x25)       = 4660

    # VS2 (+7)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # MASK (+7)       = [   0    1    1    1    0    0    1    1    1    0    1    1    0    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # VD (+7) BEFORE = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # VD (+7) AFTER  = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]


    
    vasubu.vx v8, v24, x25, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m8
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2af02146)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2ad5663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4efd2a05)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50506fc9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x523313bd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x20004955)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03644071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x12c6171f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b047dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5fc4a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f64ba6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x28616787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e57b7)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93b06678)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0cc9d6c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3b9b3ddc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x169dbce8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x05252532)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa2167b52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9fcbe57f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe92f674b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x97056592)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8bfcad15)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e1181e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x445da8cc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea35fe19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x527e81e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79e910dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0be793b3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc47c5d71)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24e0658c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47c6f638)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x24, 4294967295
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 8, Use Mask = 0, VL = 23\n")

    





    # RS1  (x24)       = 4294967295

    # VS2 (v16)       = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # VD (v0)  AFTER  = [e8df beed e41e 9e19 9be0 a039 8c7f c46b ea4d 9b29 a91a d26f c127 9cd8 d96a f8e3]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # VD (+1) AFTER  = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 fc53 ad85 b3c4 b17c e5b7 d4b5 d4c0]

    # RS1  (x24)       = 4294967295

    # VS2 (+2)       = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # VD (+2) AFTER  = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # RS1  (x24)       = 4294967295

    # VS2 (+3)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (+3) AFTER  = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]

    # RS1  (x24)       = 4294967295

    # VS2 (+4)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # VD (+4) AFTER  = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]

    # RS1  (x24)       = 4294967295

    # VS2 (+5)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # VD (+5) AFTER  = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # RS1  (x24)       = 4294967295

    # VS2 (+6)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (+6) AFTER  = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]

    # RS1  (x24)       = 4294967295

    # VS2 (+7)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # VD (+7) AFTER  = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]


    
    vasubu.vx v0, v16, x24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m8
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd96af8e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc1279cd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa91ad26f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea4d9b29)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8c7fc46b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9be0a039)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe41e9e19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe8dfbeed)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4b5d4c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb17ce5b7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xad85b3c4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075fc53)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93b06678)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0cc9d6c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3b9b3ddc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x169dbce8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x05252532)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa2167b52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9fcbe57f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe92f674b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x97056592)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8bfcad15)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e1181e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x445da8cc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea35fe19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x527e81e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x79e910dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0be793b3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc47c5d71)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24e0658c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47c6f638)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
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
    li x23, 1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 8, Use Mask = 1, VL = 16\n")

    





    # RS1  (x23)       = 1

    # VS2 (v8)        = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (v0)       = [   1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (v24) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (v24) AFTER  = [2d84 f8a5 317b 6787 54b4 54bf a968 3eec d1bc 7dd8 c83b 2038 37bf 446a 18fc 1b28]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # MASK (+1)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+1) BEFORE = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # VD (+1) AFTER  = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]

    # RS1  (x23)       = 1

    # VS2 (+2)       = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # MASK (+2)       = [   1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+2) BEFORE = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # VD (+2) AFTER  = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # RS1  (x23)       = 1

    # VS2 (+3)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (+3)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+3) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (+3) AFTER  = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]

    # RS1  (x23)       = 1

    # VS2 (+4)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # MASK (+4)       = [   1    0    1    0    1    0    0    0    1    1    0    0    1    1    0    0]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+4) BEFORE = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # VD (+4) AFTER  = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]

    # RS1  (x23)       = 1

    # VS2 (+5)       = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # MASK (+5)       = [   0    1    0    0    0    1    0    0    0    1    0    1    1    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+5) BEFORE = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # VD (+5) AFTER  = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # RS1  (x23)       = 1

    # VS2 (+6)       = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # MASK (+6)       = [   1    1    1    1    1    1    1    0    0    0    0    1    1    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+6) BEFORE = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # VD (+6) AFTER  = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]

    # RS1  (x23)       = 1

    # VS2 (+7)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]
    # MASK (+7)       = [   1    1    1    0    1    0    1    0    0    0    1    1    0    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (+7) BEFORE = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # VD (+7) AFTER  = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]


    
    vasubu.vx v24, v8, x23, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m8
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc1b28)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf446a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b2038)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa9683eec)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x54b454bf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x317b6787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2d84f8a5)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x22, 2147483647
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 8, Use Mask = 0, VL = 10\n")

    





    # RS1  (x22)       = 2147483647

    # VS2 (v0)        = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (v16) AFTER  = [4ff0 9378 951e 8621 6075 c1a2 ad85 b3c4 b17c e5b7 d4b5 d4c0 e8df beed e41e 9e19]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # VD (+1) AFTER  = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]

    # RS1  (x22)       = 2147483647

    # VS2 (+2)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # VD (+2) AFTER  = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # RS1  (x22)       = 2147483647

    # VS2 (+3)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (+3) AFTER  = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]

    # RS1  (x22)       = 2147483647

    # VS2 (+4)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # VD (+4) AFTER  = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]

    # RS1  (x22)       = 2147483647

    # VS2 (+5)       = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # VD (+5) AFTER  = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # RS1  (x22)       = 2147483647

    # VS2 (+6)       = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # VD (+6) AFTER  = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]

    # RS1  (x22)       = 2147483647

    # VS2 (+7)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # VD (+7) AFTER  = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]


    
    vasubu.vx v16, v0, x22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m8
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe41e9e19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe8dfbeed)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd4b5d4c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb17ce5b7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xad85b3c4)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x21, 124076833
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 8, Use Mask = 1, VL = 8\n")

    





    # RS1  (x21)       = 124076833

    # VS2 (v24)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (v8)  BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (v8)  AFTER  = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 0eaa 3f41 faaa c1a2 3874 f8a5 5b08 4426]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # MASK (+1)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+1) BEFORE = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # VD (+1) AFTER  = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]

    # RS1  (x21)       = 124076833

    # VS2 (+2)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # MASK (+2)       = [   0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+2) BEFORE = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # VD (+2) AFTER  = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # RS1  (x21)       = 124076833

    # VS2 (+3)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (+3)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+3) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (+3) AFTER  = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]

    # RS1  (x21)       = 124076833

    # VS2 (+4)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # MASK (+4)       = [   0    0    0    0    0    0    0    1    1    0    0    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+4) BEFORE = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # VD (+4) AFTER  = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]

    # RS1  (x21)       = 124076833

    # VS2 (+5)       = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # MASK (+5)       = [   0    1    1    0    1    0    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+5) BEFORE = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # VD (+5) AFTER  = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # RS1  (x21)       = 124076833

    # VS2 (+6)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # MASK (+6)       = [   1    1    0    1    1    0    0    0    0    1    0    0    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+6) BEFORE = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # VD (+6) AFTER  = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]

    # RS1  (x21)       = 124076833

    # VS2 (+7)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]
    # MASK (+7)       = [   1    1    1    1    0    0    0    1    1    0    1    1    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # VD (+7) BEFORE = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # VD (+7) AFTER  = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]


    
    vasubu.vx v8, v24, x21, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m8
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b084426)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfaaac1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0eaa3f41)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x20, 2048
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 8, Use Mask = 0, VL = 6\n")

    





    # RS1  (x20)       = 2048

    # VS2 (v16)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (v0)  AFTER  = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 23f8 45bc 468f 3f11 2c3b 5cd1]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # VD (+1) AFTER  = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]

    # RS1  (x20)       = 2048

    # VS2 (+2)       = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # VD (+2) AFTER  = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # RS1  (x20)       = 2048

    # VS2 (+3)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (+3) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]

    # RS1  (x20)       = 2048

    # VS2 (+4)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # VD (+4) AFTER  = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]

    # RS1  (x20)       = 2048

    # VS2 (+5)       = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # VD (+5) AFTER  = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # RS1  (x20)       = 2048

    # VS2 (+6)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # VD (+6) AFTER  = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]

    # RS1  (x20)       = 2048

    # VS2 (+7)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # VD (+7) AFTER  = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]


    
    vasubu.vx v0, v16, x20



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m8
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2c3b5cd1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x468f3f11)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x23f845bc)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95a74545)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8b4ecba8)
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
    li x19, 0
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 8, Use Mask = 1, VL = 4\n")

    





    # RS1  (x19)       = 0

    # VS2 (v8)        = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (v0)       = [   0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (v24) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (v24) AFTER  = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b 4d99 4c52]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # MASK (+1)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+1) BEFORE = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # VD (+1) AFTER  = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]

    # RS1  (x19)       = 0

    # VS2 (+2)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # MASK (+2)       = [   0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+2) BEFORE = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # VD (+2) AFTER  = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # RS1  (x19)       = 0

    # VS2 (+3)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (+3)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+3) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (+3) AFTER  = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]

    # RS1  (x19)       = 0

    # VS2 (+4)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # MASK (+4)       = [   1    1    0    0    1    0    1    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+4) BEFORE = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # VD (+4) AFTER  = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]

    # RS1  (x19)       = 0

    # VS2 (+5)       = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # MASK (+5)       = [   1    0    0    0    1    0    1    1    0    1    0    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+5) BEFORE = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # VD (+5) AFTER  = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # RS1  (x19)       = 0

    # VS2 (+6)       = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # MASK (+6)       = [   0    0    1    1    0    1    1    1    1    1    1    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+6) BEFORE = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # VD (+6) AFTER  = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]

    # RS1  (x19)       = 0

    # VS2 (+7)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]
    # MASK (+7)       = [   1    1    0    0    1    1    0    1    0    0    0    1    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # VD (+7) BEFORE = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # VD (+7) AFTER  = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]


    
    vasubu.vx v24, v8, x19, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m8
    vse16.v v24, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4d994c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeeeb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66652ebf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdfcadfe1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3be0154f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69150191)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf1bcd84d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x734b985d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x353308fb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4c45120b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde223d8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdbee5e94)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x982bc336)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x65e3c70c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb64b71f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86604880)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x700a8d4e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x63b91dcd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x04b11e73)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x355e64a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x95a74545)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b4ecba8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcd1b37e5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4f031546)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x918f472f)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x18, 2047
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 8, Use Mask = 0, VL = 2\n")

    





    # RS1  (x18)       = 2047

    # VS2 (v0)        = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v16) BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (v16) AFTER  = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 07d2 798e]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+1) BEFORE = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # VD (+1) AFTER  = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]

    # RS1  (x18)       = 2047

    # VS2 (+2)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+2) BEFORE = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # VD (+2) AFTER  = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # RS1  (x18)       = 2047

    # VS2 (+3)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+3) BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (+3) AFTER  = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]

    # RS1  (x18)       = 2047

    # VS2 (+4)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+4) BEFORE = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # VD (+4) AFTER  = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]

    # RS1  (x18)       = 2047

    # VS2 (+5)       = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+5) BEFORE = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]
    # VD (+5) AFTER  = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # RS1  (x18)       = 2047

    # VS2 (+6)       = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+6) BEFORE = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # VD (+6) AFTER  = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]

    # RS1  (x18)       = 2047

    # VS2 (+7)       = [311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (+7) BEFORE = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]
    # VD (+7) AFTER  = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545]


    
    vasubu.vx v16, v0, x18



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m8
    vse16.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x07d2798e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeeeb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66652ebf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdfcadfe1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3be0154f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69150191)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf1bcd84d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x734b985d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x353308fb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4c45120b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde223d8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdbee5e94)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x982bc336)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x65e3c70c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb64b71f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86604880)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x700a8d4e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x63b91dcd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x04b11e73)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x355e64a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x95a74545)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b4ecba8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcd1b37e5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4f031546)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x918f472f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xac98e804)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x311c98a1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1151057d)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x17, -1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 8, Use Mask = 1, VL = 0\n")

    





    # RS1  (x17)       = -1

    # VS2 (v24)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (v0)       = [   1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v8)  BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (v8)  AFTER  = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # MASK (+1)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+1) BEFORE = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # VD (+1) AFTER  = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]

    # RS1  (x17)       = -1

    # VS2 (+2)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # MASK (+2)       = [   0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+2) BEFORE = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # VD (+2) AFTER  = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # RS1  (x17)       = -1

    # VS2 (+3)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (+3)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+3) BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (+3) AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]

    # RS1  (x17)       = -1

    # VS2 (+4)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # MASK (+4)       = [   0    0    0    1    0    1    0    1    0    0    0    0    0    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+4) BEFORE = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # VD (+4) AFTER  = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]

    # RS1  (x17)       = -1

    # VS2 (+5)       = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # MASK (+5)       = [   0    0    1    0    0    1    0    0    1    0    0    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+5) BEFORE = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]
    # VD (+5) AFTER  = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # RS1  (x17)       = -1

    # VS2 (+6)       = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # MASK (+6)       = [   0    1    1    1    1    0    1    0    0    1    1    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+6) BEFORE = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # VD (+6) AFTER  = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]

    # RS1  (x17)       = -1

    # VS2 (+7)       = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]
    # MASK (+7)       = [   1    0    1    0    0    1    1    0    1    1    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (+7) BEFORE = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]
    # VD (+7) AFTER  = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546]


    
    vasubu.vx v8, v24, x17, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m8
    vse16.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66652ebf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdfcadfe1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3be0154f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69150191)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf1bcd84d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x734b985d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x353308fb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4c45120b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfde223d8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdbee5e94)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x982bc336)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x65e3c70c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb64b71f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86604880)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x700a8d4e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x63b91dcd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x04b11e73)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x355e64a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x95a74545)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b4ecba8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcd1b37e5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4f031546)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x918f472f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xac98e804)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x311c98a1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1151057d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x995ccbf8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x31a201a7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdc447722)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x16, 1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 8, Use Mask = 0, VL = 128\n")

    





    # RS1  (x16)       = 1

    # VS2 (v16)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (v0)  AFTER  = [4358 40ea 25fd 001e 39d9 70ab 7b19 1ea9 7074 0496 2135 46fd 6d26 4b43 4d8d 4021]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+1) BEFORE = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # VD (+1) AFTER  = [4fe5 72bf 510b 3da9 0292 1299 0b4e 5e74 1dcd 1eee 0664 6b64 49d8 333c 7915 3242]

    # RS1  (x16)       = 1

    # VS2 (+2)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+2) BEFORE = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # VD (+2) AFTER  = [3cf4 086e 293f 40f1 751a 7f0c 222e 5466 2708 40f4 45fe 568a 4b82 32c9 7497 33a5]

    # RS1  (x16)       = 1

    # VS2 (+3)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+3) BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (+3) AFTER  = [26d5 4b6a 735b 508e 276c 3433 61d1 1757 23e3 7b1c 1270 32c6 623e 2eb8 05f3 49d9]

    # RS1  (x16)       = 1

    # VS2 (+4)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+4) BEFORE = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # VD (+4) AFTER  = [1a99 047d 39a5 4c2e 78de 6c26 348a 00c8 1df0 0aa7 6fe5 6ff0 3332 175f 6bd2 3478]

    # RS1  (x16)       = 1

    # VS2 (+5)       = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+5) BEFORE = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]
    # VD (+5) AFTER  = [3805 46a7 4330 2440 5b25 38fb 32f1 6386 4c15 619b 6df7 2f4a 7ef1 11ec 2622 0905]

    # RS1  (x16)       = 1

    # VS2 (+6)       = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+6) BEFORE = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # VD (+6) AFTER  = [48c7 2397 2781 0aa3 668d 1bf2 45a7 65d4 4ad3 22a2 1aaf 3251 0258 0f39 31dc 0ee6]

    # RS1  (x16)       = 1

    # VS2 (+7)       = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (+7) BEFORE = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1]
    # VD (+7) AFTER  = [0697 053d 3e5d 675b 6e22 3b91 18d1 00d3 4cae 65fc 08a8 02be 188e 4c50 564c 7402]


    
    vasubu.vx v0, v16, x16



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m8
    vse16.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4d8d4021)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6d264b43)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x213546fd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x70740496)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7b191ea9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x39d970ab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x25fd001e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x435840ea)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79153242)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49d8333c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x06646b64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1dcd1eee)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b4e5e74)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x02921299)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x510b3da9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4fe572bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x749733a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4b8232c9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45fe568a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x270840f4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x222e5466)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x751a7f0c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x293f40f1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3cf4086e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05f349d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x623e2eb8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x127032c6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x23e37b1c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x61d11757)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x276c3433)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x735b508e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x26d54b6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6bd23478)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3332175f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6fe56ff0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1df00aa7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x348a00c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x78de6c26)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x39a54c2e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1a99047d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x26220905)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7ef111ec)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6df72f4a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4c15619b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x32f16386)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b2538fb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43302440)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x380546a7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x31dc0ee6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x02580f39)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1aaf3251)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ad322a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45a765d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x668d1bf2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x27810aa3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x48c72397)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x564c7402)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x188e4c50)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x08a802be)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4cae65fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x18d100d3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6e223b91)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3e5d675b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0697053d)
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

