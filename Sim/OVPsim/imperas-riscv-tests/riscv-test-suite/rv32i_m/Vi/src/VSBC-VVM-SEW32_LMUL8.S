// RISC-V Architectural Validation Test VSBC-VVM-SEW32_LMUL8
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
// Description: Testing instruction 'vsbc.vvm'.

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
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 8, Use Mask = 0, VL = 64\n")

    





    # VS1 (v8)        = [e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27 151a01ef]

    # VS2 (v16)       = [c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d]
    # VD (v24) AFTER  = [e417b2d5 deb9d554 46d6b8a9 2be69668 71873bab dd82bc13 bc484115 713c9b37]

    # VS1 (+1)       = [f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a]

    # VS2 (+1)       = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # VD (+1) AFTER  = [3eb76c03 dca54112 1da0e7d8 cf56b2a0 25d0ed68 89ec7a04 9759d4bd 1e14dee3]

    # VS1 (+2)       = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]

    # VS2 (+2)       = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # VD (+2) AFTER  = [cfe66b2f cf7947e9 02a68b87 485031ab ffc8dfd1 33edd9e7 f9371ae4 06375020]

    # VS1 (+3)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]

    # VS2 (+3)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # VD (+3) AFTER  = [f8119c1a b98e21ee d7ac2ba7 098141a7 907bfbbf 1ec2b79b 44645285 82649172]

    # VS1 (+4)       = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]

    # VS2 (+4)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # VD (+4) AFTER  = [13cdf2ff 50aabbc9 17f7d0a9 4b41e830 bad20d57 34a8c47e 2800c8fc dd6c911d]

    # VS1 (+5)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]

    # VS2 (+5)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # VD (+5) AFTER  = [681ef774 3f321644 0d44b33e 91384874 46ee95d9 6d68e8be 3cef186a f3b3f271]

    # VS1 (+6)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]

    # VS2 (+6)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # VD (+6) AFTER  = [79197050 a18501f3 6b7ae2b0 3ab58196 d8471ee7 7d81a403 15493425 9e7d7b31]

    # VS1 (+7)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]

    # VS2 (+7)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # VD (+7) AFTER  = [f4f74782 add5fe47 496381cc fdb56a2d 9cf15620 ee876849 db027f0b 2ed16714]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x713c9b37)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbc484115)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdd82bc13)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x71873bab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2be69668)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46d6b8a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdeb9d554)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe417b2d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1e14dee3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9759d4bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89ec7a04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25d0ed68)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf56b2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1da0e7d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdca54112)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3eb76c03)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x06375020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf9371ae4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33edd9e7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc8dfd1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x485031ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02a68b87)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf7947e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcfe66b2f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x82649172)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44645285)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1ec2b79b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x907bfbbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x098141a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7ac2ba7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb98e21ee)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf8119c1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdd6c911d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2800c8fc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34a8c47e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbad20d57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b41e830)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17f7d0a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50aabbc9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13cdf2ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf3b3f271)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3cef186a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d68e8be)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46ee95d9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91384874)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d44b33e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f321644)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x681ef774)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e7d7b31)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x15493425)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7d81a403)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8471ee7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3ab58196)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6b7ae2b0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa18501f3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79197050)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2ed16714)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdb027f0b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xee876849)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9cf15620)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfdb56a2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x496381cc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xadd5fe47)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf4f74782)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+32
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    





    # VS1 (v24)       = [7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51]

    # VS2 (v8)        = [0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65]
    # VD (v16) AFTER  = [89ec7a04 9759d4bd 1e14dee3 e417b2d5 deb9d554 46d6b8aa 2be69667 71873bac]

    # VS1 (+1)       = [34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf]

    # VS2 (+1)       = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # VD (+1) AFTER  = [33edd9e6 f9371ae5 0637501f 3eb76c03 dca54111 1da0e7d7 cf56b2a0 25d0ed67]

    # VS1 (+2)       = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]

    # VS2 (+2)       = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # VD (+2) AFTER  = [1ec2b79c 44645285 82649172 cfe66b2e cf7947e9 02a68b86 485031ab ffc8dfd1]

    # VS1 (+3)       = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]

    # VS2 (+3)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # VD (+3) AFTER  = [34a8c47e 2800c8fc dd6c911e f8119c1a b98e21ee d7ac2ba6 098141a7 907bfbbe]

    # VS1 (+4)       = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]

    # VS2 (+4)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # VD (+4) AFTER  = [6d68e8bf 3cef186a f3b3f272 13cdf2fe 50aabbc8 17f7d0a9 4b41e82f bad20d57]

    # VS1 (+5)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]

    # VS2 (+5)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # VD (+5) AFTER  = [7d81a403 15493426 9e7d7b31 681ef775 3f321643 0d44b33d 91384875 46ee95da]

    # VS1 (+6)       = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]

    # VS2 (+6)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # VD (+6) AFTER  = [ee87684a db027f0b 2ed16714 79197050 a18501f3 6b7ae2af 3ab58197 d8471ee7]

    # VS1 (+7)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]

    # VS2 (+7)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # VD (+7) AFTER  = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9cf1561f]

    

    vsbc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x71873bac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2be69667)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46d6b8aa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdeb9d554)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe417b2d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1e14dee3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9759d4bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89ec7a04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25d0ed67)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf56b2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1da0e7d7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdca54111)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3eb76c03)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0637501f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf9371ae5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33edd9e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc8dfd1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x485031ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02a68b86)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf7947e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcfe66b2e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x82649172)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44645285)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1ec2b79c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x907bfbbe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x098141a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7ac2ba6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb98e21ee)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf8119c1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdd6c911e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2800c8fc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34a8c47e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbad20d57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b41e82f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17f7d0a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50aabbc8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13cdf2fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf3b3f272)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3cef186a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d68e8bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46ee95da)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91384875)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d44b33d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f321643)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x681ef775)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e7d7b31)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x15493426)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7d81a403)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8471ee7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3ab58197)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6b7ae2af)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa18501f3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79197050)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2ed16714)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdb027f0b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xee87684a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9cf1561f)
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
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 8, Use Mask = 0, VL = 41\n")

    





    # VS1 (v16)       = [fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f]

    # VS2 (v24)       = [195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a]
    # VD (v8)  AFTER  = [1da0e7d7 cf56b29f 25d0ed68 89ec7a03 9759d4bd 1e14dee3 e417b2d6 deb9d555]

    # VS1 (+1)       = [b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf]

    # VS2 (+1)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # VD (+1) AFTER  = [02a68b87 485031ac ffc8dfd2 33edd9e7 f9371ae4 0637501f 3eb76c02 dca54111]

    # VS1 (+2)       = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]

    # VS2 (+2)       = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # VD (+2) AFTER  = [d7ac2ba6 098141a8 907bfbbe 1ec2b79b 44645284 82649173 cfe66b2f cf7947e9]

    # VS1 (+3)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]

    # VS2 (+3)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # VD (+3) AFTER  = [17f7d0aa 4b41e830 bad20d56 34a8c47e 2800c8fd dd6c911d f8119c1a b98e21ee]

    # VS1 (+4)       = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]

    # VS2 (+4)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # VD (+4) AFTER  = [0d44b33d 91384874 46ee95d9 6d68e8be 3cef186a f3b3f271 13cdf2ff 50aabbc9]

    # VS1 (+5)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]

    # VS2 (+5)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # VD (+5) AFTER  = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 3f321643]

    # VS1 (+6)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]

    # VS2 (+6)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # VD (+6) AFTER  = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]

    # VS1 (+7)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]

    # VS2 (+7)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # VD (+7) AFTER  = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]

    

    vsbc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdeb9d555)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe417b2d6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1e14dee3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9759d4bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89ec7a03)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25d0ed68)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf56b29f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1da0e7d7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdca54111)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3eb76c02)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0637501f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf9371ae4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33edd9e7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc8dfd2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x485031ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02a68b87)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf7947e9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcfe66b2f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x82649173)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44645284)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1ec2b79b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x907bfbbe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x098141a8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7ac2ba6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb98e21ee)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf8119c1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdd6c911d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2800c8fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34a8c47e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbad20d56)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b41e830)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17f7d0aa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50aabbc9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13cdf2ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf3b3f271)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3cef186a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d68e8be)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46ee95d9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91384874)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d44b33d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f321643)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+96
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    





    # VS1 (v8)        = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e]

    # VS2 (v16)       = [3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf]
    # VD (v24) AFTER  = [0637501f 3eb76c02 dca54112 1da0e7d7 cf56b29f 25d0ed67 89ec7a04 9759d4bc]

    # VS1 (+1)       = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]

    # VS2 (+1)       = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # VD (+1) AFTER  = [82649172 cfe66b2f cf7947e8 02a68b87 485031ac ffc8dfd1 33edd9e7 f9371ae5]

    # VS1 (+2)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]

    # VS2 (+2)       = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # VD (+2) AFTER  = [dd6c911e f8119c1a b98e21ed d7ac2ba6 098141a8 907bfbbf 1ec2b79b 44645284]

    # VS1 (+3)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]

    # VS2 (+3)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # VD (+3) AFTER  = [f3b3f272 13cdf2fe 50aabbc9 17f7d0a9 4b41e830 bad20d57 34a8c47e 2800c8fd]

    # VS1 (+4)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]

    # VS2 (+4)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # VD (+4) AFTER  = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]

    # VS1 (+5)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]

    # VS2 (+5)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # VD (+5) AFTER  = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]

    # VS1 (+6)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]

    # VS2 (+6)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # VD (+6) AFTER  = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]

    # VS1 (+7)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]

    # VS2 (+7)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # VD (+7) AFTER  = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9759d4bc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89ec7a04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25d0ed67)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf56b29f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1da0e7d7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdca54112)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3eb76c02)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0637501f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf9371ae5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33edd9e7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc8dfd1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x485031ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x02a68b87)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcf7947e8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcfe66b2f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x82649172)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44645284)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1ec2b79b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x907bfbbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x098141a8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd7ac2ba6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb98e21ed)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf8119c1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdd6c911e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2800c8fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34a8c47e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbad20d57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b41e830)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17f7d0a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50aabbc9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x13cdf2fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf3b3f272)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 8, Use Mask = 0, VL = 23\n")

    





    # VS1 (v24)       = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847]

    # VS2 (v8)        = [67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf]
    # VD (v16) AFTER  = [ffc8dfd1 33edd9e7 f9371ae5 06375020 3eb76c03 dca54111 1da0e7d7 cf56b29f]

    # VS1 (+1)       = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]

    # VS2 (+1)       = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # VD (+1) AFTER  = [907bfbbf 1ec2b79b 44645284 82649173 cfe66b2f cf7947e8 02a68b86 485031ab]

    # VS1 (+2)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]

    # VS2 (+2)       = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # VD (+2) AFTER  = [9b327ba8 34a8c47f 2800c8fd dd6c911e f8119c19 b98e21ee d7ac2ba7 098141a8]

    # VS1 (+3)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]

    # VS2 (+3)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # VD (+3) AFTER  = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]

    # VS1 (+4)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]

    # VS2 (+4)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # VD (+4) AFTER  = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]

    # VS1 (+5)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]

    # VS2 (+5)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # VD (+5) AFTER  = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]

    # VS1 (+6)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]

    # VS2 (+6)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # VD (+6) AFTER  = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]

    # VS1 (+7)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]

    # VS2 (+7)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # VD (+7) AFTER  = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]

    

    vsbc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcf56b29f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1da0e7d7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdca54111)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3eb76c03)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x06375020)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf9371ae5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x33edd9e7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc8dfd1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x485031ab)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02a68b86)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcf7947e8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcfe66b2f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82649173)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x44645284)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ec2b79b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x907bfbbf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x098141a8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7ac2ba7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb98e21ee)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf8119c19)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdd6c911e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2800c8fd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34a8c47f)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+160
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 8, Use Mask = 0, VL = 16\n")

    





    # VS1 (v16)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1]

    # VS2 (v24)       = [824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # VD (v8)  AFTER  = [cf7947e9 02a68b87 485031ac ffc8dfd1 33edd9e6 f9371ae5 0637501f 3eb76c03]

    # VS1 (+1)       = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]

    # VS2 (+1)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # VD (+1) AFTER  = [b98e21ed d7ac2ba6 098141a7 907bfbbe 1ec2b79b 44645285 82649172 cfe66b2e]

    # VS1 (+2)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]

    # VS2 (+2)       = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # VD (+2) AFTER  = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]

    # VS1 (+3)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]

    # VS2 (+3)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # VD (+3) AFTER  = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]

    # VS1 (+4)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]

    # VS2 (+4)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # VD (+4) AFTER  = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]

    # VS1 (+5)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]

    # VS2 (+5)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # VD (+5) AFTER  = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]

    # VS1 (+6)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]

    # VS2 (+6)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # VD (+6) AFTER  = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]

    # VS1 (+7)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]

    # VS2 (+7)       = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # VD (+7) AFTER  = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]

    

    vsbc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3eb76c03)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0637501f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf9371ae5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x33edd9e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc8dfd1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x485031ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02a68b87)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcf7947e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcfe66b2e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82649172)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x44645285)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ec2b79b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x907bfbbe)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x098141a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7ac2ba6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb98e21ed)
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
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 8, Use Mask = 0, VL = 10\n")

    





    # VS1 (v8)        = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]

    # VS2 (v16)       = [18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # VD (v24) AFTER  = [44645284 82649172 cfe66b2e cf7947e8 02a68b86 485031ac ffc8dfd1 33edd9e6]

    # VS1 (+1)       = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]

    # VS2 (+1)       = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # VD (+1) AFTER  = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f 907bfbbf 1ec2b79b]

    # VS1 (+2)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]

    # VS2 (+2)       = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # VD (+2) AFTER  = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]

    # VS1 (+3)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]

    # VS2 (+3)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # VD (+3) AFTER  = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]

    # VS1 (+4)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]

    # VS2 (+4)       = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # VD (+4) AFTER  = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]

    # VS1 (+5)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]

    # VS2 (+5)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # VD (+5) AFTER  = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]

    # VS1 (+6)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]

    # VS2 (+6)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # VD (+6) AFTER  = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]

    # VS1 (+7)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]

    # VS2 (+7)       = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # VD (+7) AFTER  = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x33edd9e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc8dfd1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x485031ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02a68b86)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcf7947e8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcfe66b2e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82649172)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x44645284)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ec2b79b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x907bfbbf)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+224
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 8, Use Mask = 0, VL = 8\n")

    





    # VS1 (v24)       = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]

    # VS2 (v8)        = [d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # VD (v16) AFTER  = [098141a7 907bfbbe 1ec2b79c 44645285 82649172 cfe66b2f cf7947e9 02a68b87]

    # VS1 (+1)       = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]

    # VS2 (+1)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # VD (+1) AFTER  = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]

    # VS1 (+2)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]

    # VS2 (+2)       = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # VD (+2) AFTER  = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]

    # VS1 (+3)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]

    # VS2 (+3)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # VD (+3) AFTER  = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]

    # VS1 (+4)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]

    # VS2 (+4)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # VD (+4) AFTER  = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]

    # VS1 (+5)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]

    # VS2 (+5)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # VD (+5) AFTER  = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]

    # VS1 (+6)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]

    # VS2 (+6)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # VD (+6) AFTER  = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]

    # VS1 (+7)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]

    # VS2 (+7)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # VD (+7) AFTER  = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]

    

    vsbc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x02a68b87)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcf7947e9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcfe66b2f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x82649172)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x44645285)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1ec2b79c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x907bfbbe)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x098141a7)
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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 8, Use Mask = 0, VL = 6\n")

    





    # VS1 (v16)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]

    # VS2 (v24)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # VD (v8)  AFTER  = [3874f8a5 5b086787 d7ac2ba7 098141a7 907bfbbf 1ec2b79b 44645285 82649172]

    # VS1 (+1)       = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]

    # VS2 (+1)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # VD (+1) AFTER  = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]

    # VS1 (+2)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]

    # VS2 (+2)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # VD (+2) AFTER  = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]

    # VS1 (+3)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]

    # VS2 (+3)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # VD (+3) AFTER  = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]

    # VS1 (+4)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]

    # VS2 (+4)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # VD (+4) AFTER  = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]

    # VS1 (+5)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]

    # VS2 (+5)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # VD (+5) AFTER  = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]

    # VS1 (+6)       = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]

    # VS2 (+6)       = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # VD (+6) AFTER  = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]

    # VS1 (+7)       = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]

    # VS2 (+7)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # VD (+7) AFTER  = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]

    

    vsbc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x82649172)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x44645285)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1ec2b79b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x907bfbbf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x098141a7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7ac2ba7)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+288
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 8, Use Mask = 0, VL = 4\n")

    





    # VS1 (v8)        = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]

    # VS2 (v16)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # VD (v24) AFTER  = [4ff09378 951e8621 6075c1a2 3874f8a5 b98e21ed d7ac2ba6 098141a8 907bfbbf]

    # VS1 (+1)       = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]

    # VS2 (+1)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # VD (+1) AFTER  = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]

    # VS1 (+2)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]

    # VS2 (+2)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # VD (+2) AFTER  = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]

    # VS1 (+3)       = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]

    # VS2 (+3)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # VD (+3) AFTER  = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]

    # VS1 (+4)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]

    # VS2 (+4)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # VD (+4) AFTER  = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]

    # VS1 (+5)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]

    # VS2 (+5)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # VD (+5) AFTER  = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]

    # VS1 (+6)       = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]

    # VS2 (+6)       = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # VD (+6) AFTER  = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]

    # VS1 (+7)       = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]

    # VS2 (+7)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # VD (+7) AFTER  = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x907bfbbf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x098141a8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7ac2ba6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb98e21ed)
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
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 8, Use Mask = 0, VL = 2\n")

    





    # VS1 (v24)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]

    # VS2 (v8)        = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v16) BEFORE = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # VD (v16) AFTER  = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 f8119c1a b98e21ed]

    # VS1 (+1)       = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]

    # VS2 (+1)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # VD (+1) AFTER  = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]

    # VS1 (+2)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]

    # VS2 (+2)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+2) BEFORE = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # VD (+2) AFTER  = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]

    # VS1 (+3)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]

    # VS2 (+3)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+3) BEFORE = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # VD (+3) AFTER  = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]

    # VS1 (+4)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]

    # VS2 (+4)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+4) BEFORE = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # VD (+4) AFTER  = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]

    # VS1 (+5)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]

    # VS2 (+5)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+5) BEFORE = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # VD (+5) AFTER  = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]

    # VS1 (+6)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]

    # VS2 (+6)       = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+6) BEFORE = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # VD (+6) AFTER  = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]

    # VS1 (+7)       = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]

    # VS2 (+7)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+7) BEFORE = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # VD (+7) AFTER  = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]

    

    vsbc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb98e21ed)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf8119c1a)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+352
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 8, Use Mask = 0, VL = 0\n")

    





    # VS1 (v16)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]

    # VS2 (v24)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v8)  BEFORE = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # VD (v8)  AFTER  = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]

    # VS1 (+1)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]

    # VS2 (+1)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # VD (+1) AFTER  = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]

    # VS1 (+2)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]

    # VS2 (+2)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # VD (+2) AFTER  = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]

    # VS1 (+3)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]

    # VS2 (+3)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # VD (+3) AFTER  = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]

    # VS1 (+4)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]

    # VS2 (+4)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+4) BEFORE = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # VD (+4) AFTER  = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]

    # VS1 (+5)       = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]

    # VS2 (+5)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+5) BEFORE = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # VD (+5) AFTER  = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]

    # VS1 (+6)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]

    # VS2 (+6)       = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+6) BEFORE = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # VD (+6) AFTER  = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]

    # VS1 (+7)       = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]

    # VS2 (+7)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+7) BEFORE = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # VD (+7) AFTER  = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]

    

    vsbc.vvm v8, v24, v16, v0
    


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
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 8, Use Mask = 0, VL = 64\n")

    





    # VS1 (v8)        = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]

    # VS2 (v16)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # VD (v24) AFTER  = [46ee95d9 6d68e8bf 3cef1869 f3b3f272 13cdf2ff 50aabbc9 17f7d0a9 4b41e830]

    # VS1 (+1)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]

    # VS2 (+1)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # VD (+1) AFTER  = [d8471ee7 7d81a403 15493425 9e7d7b31 681ef775 3f321643 0d44b33e 91384875]

    # VS1 (+2)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]

    # VS2 (+2)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # VD (+2) AFTER  = [9cf15620 ee876849 db027f0c 2ed16713 7919704f a18501f3 6b7ae2af 3ab58197]

    # VS1 (+3)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]

    # VS2 (+3)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # VD (+3) AFTER  = [684883ca a5d8554d f64c26e2 c214d4d3 f4f74783 add5fe46 496381cc fdb56a2c]

    # VS1 (+4)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]

    # VS2 (+4)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # VD (+4) AFTER  = [97de38b6 8b3639b7 7bdb3876 22e690ac 6064081b b894c9bd 91fe82d6 276a8ef9]

    # VS1 (+5)       = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]

    # VS2 (+5)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # VD (+5) AFTER  = [818ec010 88a7d6bb 2d34ec42 5c15356e 7965b122 8ebfc5ce 89fad21b 66f3f5b8]

    # VS1 (+6)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]

    # VS2 (+6)       = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # VD (+6) AFTER  = [d014d689 5067aaea cdb803d5 bc3d64a2 de0c3abc b19d11cc 1712090f c1e7709d]

    # VS1 (+7)       = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]

    # VS2 (+7)       = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # VD (+7) AFTER  = [81e7dd60 41cc6c3d f5a78663 6048e0a2 30ad462f a0f800a5 f3ae907f e9aa44cd]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4b41e830)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x17f7d0a9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x50aabbc9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x13cdf2ff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf3b3f272)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3cef1869)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6d68e8bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x46ee95d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91384875)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0d44b33e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f321643)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681ef775)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9e7d7b31)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x15493425)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7d81a403)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd8471ee7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ab58197)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6b7ae2af)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa18501f3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7919704f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2ed16713)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdb027f0c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xee876849)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9cf15620)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfdb56a2c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x496381cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xadd5fe46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf4f74783)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc214d4d3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf64c26e2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa5d8554d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x684883ca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x276a8ef9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91fe82d6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb894c9bd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6064081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22e690ac)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7bdb3876)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b3639b7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97de38b6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66f3f5b8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x89fad21b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8ebfc5ce)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7965b122)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5c15356e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d34ec42)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x88a7d6bb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x818ec010)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc1e7709d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1712090f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb19d11cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xde0c3abc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbc3d64a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcdb803d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5067aaea)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd014d689)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe9aa44cd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf3ae907f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa0f800a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x30ad462f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6048e0a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf5a78663)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x41cc6c3d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81e7dd60)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+416
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    





    # VS1 (v24)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]

    # VS2 (v8)        = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # VD (v16) AFTER  = [3f321644 0d44b33d 91384874 46ee95d9 6d68e8be 3cef1869 f3b3f272 13cdf2fe]

    # VS1 (+1)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]

    # VS2 (+1)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # VD (+1) AFTER  = [a18501f4 6b7ae2b0 3ab58197 d8471ee7 7d81a404 15493425 9e7d7b31 681ef774]

    # VS1 (+2)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]

    # VS2 (+2)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # VD (+2) AFTER  = [add5fe47 496381cb fdb56a2d 9cf1561f ee87684a db027f0c 2ed16714 7919704f]

    # VS1 (+3)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]

    # VS2 (+3)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # VD (+3) AFTER  = [b894c9be 91fe82d6 276a8efa 684883c9 a5d8554d f64c26e3 c214d4d4 f4f74782]

    # VS1 (+4)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]

    # VS2 (+4)       = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # VD (+4) AFTER  = [8ebfc5ce 89fad21a 66f3f5b8 97de38b5 8b3639b7 7bdb3876 22e690ac 6064081b]

    # VS1 (+5)       = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]

    # VS2 (+5)       = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # VD (+5) AFTER  = [b19d11cc 1712090f c1e7709e 818ec010 88a7d6bb 2d34ec42 5c15356d 7965b121]

    # VS1 (+6)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]

    # VS2 (+6)       = [04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # VD (+6) AFTER  = [a0f800a6 f3ae907e e9aa44ce d014d689 5067aae9 cdb803d5 bc3d64a2 de0c3abc]

    # VS1 (+7)       = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]

    # VS2 (+7)       = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545]
    # VD (+7) AFTER  = [1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 30ad462e]

    

    vsbc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x13cdf2fe)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf3b3f272)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3cef1869)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6d68e8be)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x46ee95d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91384874)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0d44b33d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f321644)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681ef774)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9e7d7b31)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x15493425)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7d81a404)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd8471ee7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ab58197)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6b7ae2b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa18501f4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7919704f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2ed16714)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdb027f0c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xee87684a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9cf1561f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfdb56a2d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x496381cb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xadd5fe47)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf4f74782)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc214d4d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf64c26e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa5d8554d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x684883c9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x276a8efa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91fe82d6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb894c9be)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6064081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22e690ac)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7bdb3876)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b3639b7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97de38b5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66f3f5b8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x89fad21a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8ebfc5ce)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7965b121)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5c15356d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d34ec42)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x88a7d6bb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x818ec010)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc1e7709e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1712090f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb19d11cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xde0c3abc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbc3d64a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcdb803d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5067aae9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd014d689)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe9aa44ce)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf3ae907e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa0f800a6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x30ad462e)
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
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 8, Use Mask = 0, VL = 41\n")

    





    # VS1 (v16)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]

    # VS2 (v24)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # VD (v8)  AFTER  = [15493426 9e7d7b30 681ef775 3f321644 0d44b33d 91384875 46ee95d9 6d68e8bf]

    # VS1 (+1)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]

    # VS2 (+1)       = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # VD (+1) AFTER  = [db027f0b 2ed16714 79197050 a18501f3 6b7ae2b0 3ab58196 d8471ee7 7d81a404]

    # VS1 (+2)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]

    # VS2 (+2)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # VD (+2) AFTER  = [f64c26e2 c214d4d4 f4f74783 add5fe47 496381cc fdb56a2d 9cf15620 ee87684a]

    # VS1 (+3)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]

    # VS2 (+3)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # VD (+3) AFTER  = [7bdb3875 22e690ab 6064081b b894c9be 91fe82d6 276a8efa 684883ca a5d8554c]

    # VS1 (+4)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]

    # VS2 (+4)       = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # VD (+4) AFTER  = [2d34ec41 5c15356d 7965b121 8ebfc5ce 89fad21b 66f3f5b8 97de38b6 8b3639b8]

    # VS1 (+5)       = [982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]

    # VS2 (+5)       = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # VD (+5) AFTER  = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 88a7d6bb]

    # VS1 (+6)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]

    # VS2 (+6)       = [8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # VD (+6) AFTER  = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]

    # VS1 (+7)       = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]

    # VS2 (+7)       = [31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546]
    # VD (+7) AFTER  = [dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546]

    

    vsbc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6d68e8bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x46ee95d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91384875)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0d44b33d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f321644)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681ef775)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9e7d7b30)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x15493426)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7d81a404)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd8471ee7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ab58196)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6b7ae2b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa18501f3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79197050)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2ed16714)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdb027f0b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xee87684a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9cf15620)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfdb56a2d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x496381cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xadd5fe47)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf4f74783)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc214d4d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf64c26e2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa5d8554c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x684883ca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x276a8efa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91fe82d6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb894c9be)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6064081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22e690ab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7bdb3875)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b3639b8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97de38b6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66f3f5b8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x89fad21b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8ebfc5ce)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7965b121)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5c15356d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d34ec41)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x88a7d6bb)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+480
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    





    # VS1 (v8)        = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]

    # VS2 (v16)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # VD (v24) AFTER  = [3ab58196 d8471ee6 7d81a404 15493425 9e7d7b31 681ef774 3f321644 0d44b33d]

    # VS1 (+1)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]

    # VS2 (+1)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # VD (+1) AFTER  = [fdb56a2c 9cf15620 ee876849 db027f0c 2ed16713 7919704f a18501f4 6b7ae2af]

    # VS1 (+2)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]

    # VS2 (+2)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # VD (+2) AFTER  = [276a8efa 684883ca a5d8554d f64c26e3 c214d4d3 f4f74783 add5fe47 496381cb]

    # VS1 (+3)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]

    # VS2 (+3)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # VD (+3) AFTER  = [66f3f5b9 97de38b6 8b3639b7 7bdb3875 22e690ab 6064081b b894c9be 91fe82d5]

    # VS1 (+4)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]

    # VS2 (+4)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # VD (+4) AFTER  = [4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]

    # VS1 (+5)       = [86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]

    # VS2 (+5)       = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # VD (+5) AFTER  = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]

    # VS1 (+6)       = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]

    # VS2 (+6)       = [918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # VD (+6) AFTER  = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]

    # VS1 (+7)       = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]

    # VS2 (+7)       = [0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1]
    # VD (+7) AFTER  = [022f6618 0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1]

    

    vsbc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0d44b33d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f321644)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681ef774)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9e7d7b31)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x15493425)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7d81a404)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd8471ee6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3ab58196)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6b7ae2af)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa18501f4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7919704f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2ed16713)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdb027f0c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xee876849)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9cf15620)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfdb56a2c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x496381cb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xadd5fe47)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf4f74783)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc214d4d3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf64c26e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa5d8554d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x684883ca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x276a8efa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91fe82d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb894c9be)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6064081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22e690ab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7bdb3875)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8b3639b7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97de38b6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66f3f5b9)
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7cbaceb7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0d2e0a7a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x022f6618)
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

