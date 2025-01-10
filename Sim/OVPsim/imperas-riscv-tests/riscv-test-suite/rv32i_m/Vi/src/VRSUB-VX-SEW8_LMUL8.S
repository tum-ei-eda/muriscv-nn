// RISC-V Architectural Validation Test VRSUB-VX-SEW8_LMUL8
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
//    SEW=8, LMUL=8
// Description: Testing instruction 'vrsub.vx'.

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
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x31, 0
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 256 # VL = 256
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 8, LMUL = 8, Use Mask = 1, VL = 256\n")

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27]
    # MASK (v0)       = [ 0  0  0  1  0  1  0  1  0  0  0  1  1  0  1  0  0  0  0  0  0  0  0  1  1  1  1  0  1  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (v24) BEFORE = [e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d]
    # VD (v24) AFTER  = [e5 4c 8c c6 c7 e1 ad 9c e3 1f fa f1 43 66 94 0f bd 8f 6c 65 91 a8 d5 af be 62 22 51 7a aa 63 d9]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]
    # MASK (+1)       = [ 1  0  0  0  0  1  1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  1  0  0  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+1) BEFORE = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # VD (+1) AFTER  = [cc ef 5f f4 34 00 5d d4 f6 a5 a3 41 19 46 86 bf d4 ba 7a b9 fa 6e c8 21 06 92 a0 df 7c b4 74 e2]

    # RS1  (x31)       = 0

    # VS2 (+2)       = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # MASK (+2)       = [ 0  1  0  0  0  0  1  0  1  0  0  1  1  1  1  0  1  1  0  1  1  1  1  0  0  0  1  1  1  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+2) BEFORE = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # VD (+2) AFTER  = [d4 cd 36 50 52 33 c7 dd 4e 4d 39 3b 50 d3 9a c5 99 23 66 6e 98 ec ac 92 68 14 86 27 c6 11 7a 0c]

    # RS1  (x31)       = 0

    # VS2 (+3)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # MASK (+3)       = [ 0  0  1  0  0  0  0  0  0  0  1  0  0  0  0  1  1  0  0  1  1  0  1  0  0  1  0  1  0  0  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+3) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (+3) AFTER  = [38 74 99 a5 5b 08 67 87 62 f6 57 6d a9 68 a9 28 38 bc 7d d0 c9 3b c0 30 37 04 40 2b 18 fc 88 b0]

    # RS1  (x31)       = 0

    # VS2 (+4)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # MASK (+4)       = [ 1  0  0  1  0  0  0  1  1  0  1  0  1  0  0  0  1  1  0  1  0  1  0  1  1  1  1  1  1  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+4) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+4) AFTER  = [e9 56 ed e6 17 a2 fb e5 4d d5 b4 1b 65 2a 4c 52 b1 10 7b 88 4f e2 93 df a0 8b 3f 5e c8 8c c1 5b]

    # RS1  (x31)       = 0

    # VS2 (+5)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # MASK (+5)       = [ 1  0  1  1  1  1  0  1  1  0  0  0  1  1  1  1  0  1  1  0  1  1  0  0  0  1  1  0  0  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+5) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+5) AFTER  = [be e9 73 05 26 b4 8d 7a 65 4c 96 86 73 2b 33 fc 8d 63 7c 04 4b 52 84 8f b5 ba fb b5 48 aa 05 74]

    # RS1  (x31)       = 0

    # VS2 (+6)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # MASK (+6)       = [ 0  0  0  0  0  1  0  0  0  1  1  0  0  1  1  0  0  0  1  0  0  1  0  1  0  0  0  0  1  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+6) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+6) AFTER  = [3b 9b 3d dc 0c 50 d6 c8 93 d5 9c 78 f2 50 7f 84 86 b0 00 d4 4b 4d 00 aa 73 b3 e1 56 20 17 f7 d4]

    # RS1  (x31)       = 0

    # VS2 (+7)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # MASK (+7)       = [ 1  1  1  0  0  0  1  1  0  0  0  1  1  1  1  1  1  1  1  1  1  0  1  0  0  1  1  0  0  1  0  0]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+7) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+7) AFTER  = [75 04 53 e9 8b fc 9b 6e 97 05 65 b5 61 35 1b 81 5e ea 85 ae fb 16 db 52 05 63 44 32 16 65 bc e8]


    
    vrsub.vx v24, v16, x31, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m8
    vse8.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7aaa63d9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbe622251)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91a8d5af)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd8f6c65)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4366940f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffaf1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc7e1ad9c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8cc6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cb474e2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692a0df)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfa6ec821)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4ba7ab9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x194686bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6a5a341)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34005dd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xccef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc6117a0c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68148627)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x98ecac92)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9923666e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50d39ac5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e4d393b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233c7dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4cd3650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc88b0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3704402b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc93bc030)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x38bc7dd0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a928)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6576d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x387499a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc88cc15b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa08b3f5e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fe293df)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb1107b88)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x652a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4dd5b41b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2fbe5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe956ede6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48aa0574)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5bafbb5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b52848f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8d637c04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x732b33fc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x654c9686)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x26b48d7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbee97305)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2017f7d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73b3e156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b4d00aa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b000d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf2507f84)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93d59c78)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c50d6c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3b9b3ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1665bce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05634432)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfb16db52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5eea85ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x61351b81)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x970565b5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bfc9b6e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x750453e9)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x30, 0
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 250 # VL = 250
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 8, LMUL = 8, Use Mask = 0, VL = 250\n")

    





    # RS1  (x30)       = 0

    # VS2 (v24)       = [06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65]
    # VD (v16) AFTER  = [fa 6e 26 21 84 5a a0 25 1b b4 74 e2 39 c9 53 c6 1d e1 06 9c fc 9a db f1 43 71 94 9b 6f 58 2b 03]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # VD (+1) AFTER  = [98 ec ac 40 cc da 86 27 c6 11 a1 0c cc 48 f1 2c 0a 00 5d 2f e7 a5 9e 41 05 46 86 19 d4 9d 38 b9]

    # RS1  (x30)       = 0

    # VS2 (+2)       = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # VD (+2) AFTER  = [c9 41 c0 8f e8 04 78 2b 2c 68 ca b0 ae cd 5c 23 7e b3 c7 52 4e 2d 0f 3b 50 d3 9a c2 99 23 cc 6e]

    # RS1  (x30)       = 0

    # VS2 (+3)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (+3) AFTER  = [6b e2 7a df a0 8b 3f 5e c8 8c 08 5b a5 f8 99 79 9e 0a 35 93 57 98 57 81 2f 44 83 28 38 c5 c4 d0]

    # RS1  (x30)       = 0

    # VS2 (+4)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+4) AFTER  = [4b 52 12 4b b8 ba fb 0a f5 aa 13 74 e9 5e 05 e6 fd 2b f8 e5 4d d6 b4 ae 65 ce 85 58 b1 10 6d 88]

    # RS1  (x30)       = 0

    # VS2 (+5)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # VD (+5) AFTER  = [8d 4d 1f aa 0a ce c3 ae 20 17 f7 d4 be 95 73 05 26 b4 6a 7a 65 e6 80 be 73 2b 33 fc 04 63 7c 71]

    # RS1  (x30)       = 0

    # VS2 (+6)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (+6) AFTER  = [fb db db ce ea 63 44 18 c5 65 c3 24 f4 37 2a 38 6d 50 9a 88 0e d5 9c 7c 7a 50 7f 2c b5 05 00 c3]

    # RS1  (x30)       = 0

    # VS2 (+7)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+7) AFTER  = [52 7e 81 e3 ea 35 58 34 b2 ef 7f 17 75 04 53 eb 69 fb 9b 6e 17 d1 99 b5 61 35 1b 81 5e ea 85 ae]


    
    vrsub.vx v16, v24, x30



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m8
    vse8.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6f582b03)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4371949b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc9adbf1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1de1069c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x39c953c6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1bb474e2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x845aa025)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfa6e2621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd49d38b9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x05468619)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe7a59e41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0a005d2f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcc48f12c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc611a10c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xccda8627)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x98ecac40)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9923cc6e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50d39ac2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e2d0f3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7eb3c752)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xaecd5c23)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c68cab0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe804782b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc941c08f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x38c5c4d0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2f448328)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x57985781)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e0a3593)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa5f89979)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc88c085b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa08b3f5e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6be27adf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb1106d88)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65ce8558)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4dd6b4ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfd2bf8e5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe95e05e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5aa1374)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb8bafb0a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b52124b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04637c71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x732b33fc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e680be)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x26b46a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbe957305)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2017f7d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0acec3ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8d4d1faa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb50500c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a507f2c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0ed59c7c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d509a88)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf4372a38)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc565c324)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea634418)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbdbdbce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5eea85ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x61351b81)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17d199b5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x69fb9b6e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x750453eb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2ef7f17)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea355834)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x527e81e3)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x29, -2047
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 208 # VL = 208
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 8, Use Mask = 1, VL = 208\n")

    





    # RS1  (x29)       = -2047

    # VS2 (v16)       = [19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  0  1  0  1  1  1  0  0  0  0  0  0  0  1  1  1  1  1  1  0  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (v8)  BEFORE = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]
    # VD (v8)  AFTER  = [f6 00 9f 42 19 47 62 bf d5 ba 39 ba fb 63 c8 47 06 92 da df 1c b5 75 e3 3a ca 8c c7 c7 e2 ad 3a]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  0  1  1  1  0  1  1  1  1  0  1  0  1  1  1  1  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+1) BEFORE = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # VD (+1) AFTER  = [82 4d 10 3c 51 d3 9b c5 9a 24 cd 3e 99 ed ad 41 68 db 54 28 c7 12 a2 0d cd 49 f2 2d 34 01 0f d4]

    # RS1  (x29)       = -2047

    # VS2 (+2)       = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # MASK (+2)       = [ 0  0  1  1  0  1  0  0  0  0  1  0  0  1  1  0  0  1  1  1  1  0  1  0  1  1  0  1  1  0  0  1]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+2) BEFORE = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # VD (+2) AFTER  = [62 f6 58 82 a9 45 a9 7f d1 bc c5 d8 c8 42 c1 30 37 05 79 2c 2d fc cb d5 af ce 36 24 7f 33 a4 53]

    # RS1  (x29)       = -2047

    # VS2 (+3)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # MASK (+3)       = [ 0  1  1  0  1  0  0  0  0  0  0  1  0  1  0  0  0  1  0  1  0  1  0  0  1  1  0  0  0  0  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+3) BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (+3) AFTER  = [03 d7 b5 1b 66 2a 4c 52 9b 32 7b 89 4f e3 93 78 95 8c 86 5f 60 8d c1 a2 a6 f9 f8 a5 5b 08 67 87]

    # RS1  (x29)       = -2047

    # VS2 (+4)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # MASK (+4)       = [ 0  1  1  0  0  1  1  1  1  1  0  1  1  1  0  1  0  0  1  1  0  1  0  0  1  0  0  1  0  0  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+4) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+4) AFTER  = [da e7 81 86 9b 2c 34 fd 05 64 cd 72 4c 53 84 4c b5 ae fc 0b 48 ab 05 f6 ea 56 ed e7 17 a2 f9 1a]

    # RS1  (x29)       = -2047

    # VS2 (+5)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # MASK (+5)       = [ 1  0  1  1  0  0  0  0  0  0  1  0  1  1  0  1  0  1  1  0  0  1  1  0  0  0  1  1  1  1  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+5) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+5) AFTER  = [0f b0 9d 7d f2 2b 64 84 86 b0 01 d4 8e 4e 00 ab 73 cf c4 56 f6 18 f8 52 e0 e9 74 06 27 b5 6b fb]

    # RS1  (x29)       = -2047

    # VS2 (+6)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # MASK (+6)       = [ 1  0  1  1  0  0  1  0  1  1  0  1  0  0  1  1  1  1  1  1  0  0  0  1  1  1  0  0  0  1  0  1]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+6) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+6) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 eb 64 45 19 16 9d bc 25 f5 38 3d dc 0c 51 d6 89]

    # RS1  (x29)       = -2047

    # VS2 (+7)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # MASK (+7)       = [ 1  0  0  0  0  0  1  0  0  1  0  0  1  1  0  1  0  0  1  1  1  0  0  1  1  0  1  0  1  1  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+7) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+7) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]


    
    vrsub.vx v8, v16, x29, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m8
    vse8.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc7e2ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aca8cc7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1cb575e3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfb63c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5ba39ba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x194762bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6009f42)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34010fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd49f22d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc712a20d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68db5428)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99edad41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a24cd3e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x51d39bc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d103c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f33a453)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xafce3624)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2dfccbd5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3705792c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc842c130)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bcc5d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa945a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f65882)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f9f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x608dc1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x958c865f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fe39378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327b89)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x662a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d7b51b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2f91a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea56ede7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48ab05f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5aefc0b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c53844c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0564cd72)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b2c34fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdae78186)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27b56bfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe0e97406)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf618f852)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73cfc456)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8e4e00ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b001d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf22b6484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0fb09d7d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c51d689)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5383ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169dbc25)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeb644519)
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
    vsetvli x0, x7, e8,m8
    vle8.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 166 # VL = 166
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 8, LMUL = 8, Use Mask = 0, VL = 166\n")

    





    # RS1  (x28)       = -1

    # VS2 (v8)        = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]
    # VD (v0)  AFTER  = [c5 10 a0 0b cb 47 f0 2b 09 ff 5c 2e e6 a4 9d 40 04 45 85 18 d3 9c 37 b8 f9 6d 25 20 83 59 9f 24]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # VD (+1) AFTER  = [2b 67 c9 af ad cc 5b 22 7d b2 c6 51 4d 2c 0e 3a 4f d2 99 c1 98 22 cb 6d 97 eb ab 3f cb d9 85 26]

    # RS1  (x28)       = -1

    # VS2 (+2)       = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # VD (+2) AFTER  = [c7 8b 07 5a a4 f7 98 78 9d 09 34 92 56 97 56 80 2e 43 82 27 37 c4 c3 cf c8 40 bf 8e e7 03 77 2a]

    # RS1  (x28)       = -1

    # VS2 (+3)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (+3) AFTER  = [f4 a9 12 73 e8 5d 04 e5 fc 2a f7 e4 4c d5 b3 ad 64 cd 84 57 b0 0f 6c 87 6a e1 79 de 9f 8a 3e 5d]

    # RS1  (x28)       = -1

    # VS2 (+4)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+4) AFTER  = [1f 16 f6 d3 bd 94 72 04 25 b3 69 79 64 e5 7f bd 72 2a 32 fb 03 62 7b 70 4a 51 11 4a b7 b9 fa 09]

    # RS1  (x28)       = -1

    # VS2 (+5)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # VD (+5) AFTER  = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 1e a9 09 cd c2 ad]

    # RS1  (x28)       = -1

    # VS2 (+6)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # VD (+6) AFTER  = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # RS1  (x28)       = -1

    # VS2 (+7)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # VD (+7) AFTER  = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]


    
    vrsub.vx v0, v8, x28



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m8
    vse8.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83599f24)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf96d2520)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd39c37b8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04458518)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe6a49d40)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x09ff5c2e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcb47f02b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc510a00b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcbd98526)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97ebab3f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9822cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fd299c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4d2c0e3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7db2c651)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xadcc5b22)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2b67c9af)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe703772a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc840bf8e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37c4c3cf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2e438227)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x56975680)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9d093492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa4f79878)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc78b075a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f8a3e5d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ae179de)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb00f6c87)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x64cd8457)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4cd5b3ad)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc2af7e4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe85d04e5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf4a91273)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7b9fa09)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a51114a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03627b70)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x722a32fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x64e57fbd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x25b36979)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd947204)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1f16f6d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x09cdc2ad)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4bfb1ea9)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x27, -4660
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 128 # VL = 128
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 8, Use Mask = 1, VL = 128\n")

    





    # RS1  (x27)       = -4660

    # VS2 (v8)        = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # MASK (v0)       = [ 0  1  0  1  1  0  1  1  0  0  0  0  1  0  0  0  0  1  1  0  0  1  1  1  1  0  0  0  0  1  1  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (v24) BEFORE = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]
    # VD (v24) AFTER  = [b0 ef 66 3a 64 dd 78 0c 68 14 54 c0 92 26 7a d9 3a 14 bd f4 34 cc 29 fb b3 00 a3 d1 19 12 52 e5]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # MASK (+1)       = [ 0  0  1  1  1  0  0  0  0  1  1  1  0  1  0  0  1  1  1  1  1  0  0  0  1  0  1  0  0  1  0  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+1) BEFORE = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # VD (+1) AFTER  = [d1 bc 90 9c 95 3b 3c 30 37 d0 44 f7 18 34 88 d5 7a 99 28 ef 4a 33 a4 dd 1a 4d db ae b2 9f f1 8e]

    # RS1  (x27)       = -4660

    # VS2 (+2)       = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # MASK (+2)       = [ 0  1  1  0  0  0  0  0  0  1  1  1  0  1  0  1  1  1  0  0  0  0  0  1  1  0  1  0  0  0  1  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+2) BEFORE = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # VD (+2) AFTER  = [9b dc 39 a8 4f f0 93 78 95 57 0b 2a 60 58 c1 27 71 c4 f8 a5 5b 08 67 5f 23 f6 23 6d a9 68 4f 7f]

    # RS1  (x27)       = -4660

    # VS2 (+3)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # MASK (+3)       = [ 1  0  0  1  0  1  0  1  0  0  0  1  1  1  1  0  1  0  0  0  0  1  1  0  0  0  1  0  0  0  0  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+3) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (+3) AFTER  = [d0 d5 cd 3d fc 1e 84 17 b5 ae ee d6 c1 76 df f6 b5 56 ed 8c 17 f7 c4 1a 03 d5 80 1b b3 2a 4c 24]

    # RS1  (x27)       = -4660

    # VS2 (+4)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # MASK (+4)       = [ 0  1  0  0  1  1  1  1  1  1  1  1  0  0  0  0  1  0  0  1  0  0  1  1  0  1  1  1  1  0  0  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+4) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+4) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # RS1  (x27)       = -4660

    # VS2 (+5)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # MASK (+5)       = [ 1  0  0  1  1  0  1  1  0  0  1  1  0  0  1  0  0  1  1  1  1  0  1  1  1  0  1  0  1  0  0  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+5) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+5) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # RS1  (x27)       = -4660

    # VS2 (+6)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # MASK (+6)       = [ 1  0  1  1  0  0  1  1  0  0  1  0  1  0  1  0  0  1  0  0  1  1  0  0  0  1  0  1  0  0  1  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+6) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+6) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # RS1  (x27)       = -4660

    # VS2 (+7)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # MASK (+7)       = [ 0  0  0  0  0  0  1  1  1  1  0  1  0  1  0  1  0  0  0  0  1  0  0  0  0  0  0  1  1  0  1  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+7) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+7) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]


    
    vrsub.vx v24, v8, x27, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m8
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x191252e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb300a3d1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34cc29fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3a14bdf4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x92267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x64dd780c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb0ef663a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb29ff18e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1a4ddbae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4a33a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7a9928ef)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x183488d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37d044f7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x953b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc909c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa9684f7f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x23f6236d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b08675f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x71c4f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6058c127)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95570b2a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9bdc39a8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c24)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5801b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17f7c41a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb556ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc176dff6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeed6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc1e8417)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd0d5cd3d)
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
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 105 # VL = 105
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 8, Use Mask = 0, VL = 105\n")

    





    # RS1  (x26)       = 2147483648

    # VS2 (v0)        = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # VD (v16) AFTER  = [7e b3 c7 52 4e 2d 0f 3b 50 d3 9a c2 99 23 cc 6e 98 ec ac 40 cc da 86 27 c6 11 a1 0c cc 48 f1 2c]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # VD (+1) AFTER  = [9e 0a 35 93 57 98 57 81 2f 44 83 28 38 c5 c4 d0 c9 41 c0 8f e8 04 78 2b 2c 68 ca b0 ae cd 5c 23]

    # RS1  (x26)       = 2147483648

    # VS2 (+2)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # VD (+2) AFTER  = [fd 2b f8 e5 4d d6 b4 ae 65 ce 85 58 b1 10 6d 88 6b e2 7a df a0 8b 3f 5e c8 8c 08 5b a5 f8 99 79]

    # RS1  (x26)       = 2147483648

    # VS2 (+3)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (+3) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee 0a f5 aa 13 74 e9 5e 05 e6]

    # RS1  (x26)       = 2147483648

    # VS2 (+4)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # VD (+4) AFTER  = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # RS1  (x26)       = 2147483648

    # VS2 (+5)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # VD (+5) AFTER  = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # RS1  (x26)       = 2147483648

    # VS2 (+6)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # VD (+6) AFTER  = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # RS1  (x26)       = 2147483648

    # VS2 (+7)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # VD (+7) AFTER  = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]


    
    vrsub.vx v16, v0, x26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m8
    vse8.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcc48f12c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc611a10c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xccda8627)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98ecac40)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9923cc6e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50d39ac2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e2d0f3b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7eb3c752)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xaecd5c23)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2c68cab0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe804782b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc941c08f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x38c5c4d0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f448328)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x57985781)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9e0a3593)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa5f89979)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc88c085b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa08b3f5e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6be27adf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1106d88)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65ce8558)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4dd6b4ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfd2bf8e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe95e05e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf5aa1374)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeee0a)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x25, 4660
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 78 # VL = 78
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 8, Use Mask = 1, VL = 78\n")

    





    # RS1  (x25)       = 4660

    # VS2 (v24)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # MASK (v0)       = [ 0  1  0  0  0  0  1  0  0  1  1  0  1  0  1  1  1  0  0  0  1  1  0  1  1  1  1  1  1  0  1  1]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (v8)  BEFORE = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # VD (v8)  AFTER  = [37 38 40 71 18 fc fe d5 d4 01 90 50 b2 33 fb 86 82 4d 39 ae 84 07 f1 f6 cd 57 00 a2 cc dd e0 74]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # MASK (+1)       = [ 1  1  1  0  0  0  0  0  1  1  1  0  1  0  0  1  0  0  0  0  1  0  0  1  0  0  1  0  1  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+1) BEFORE = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # VD (+1) AFTER  = [d4 bf 73 21 60 75 c1 a2 d9 2c cd a5 d2 08 67 c7 62 f6 cb 6d 63 68 a9 5c d1 bc f8 d8 fd 75 3c 30]

    # RS1  (x25)       = 4660

    # VS2 (+2)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # MASK (+2)       = [ 1  1  1  1  0  1  1  0  0  0  1  1  0  0  1  0  0  0  1  1  1  1  0  1  0  1  0  1  0  0  1  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+2) BEFORE = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # VD (+2) AFTER  = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 e8 e2 99 02 4c 8c 9b 44 7b bc 4f f0 ae 78]

    # RS1  (x25)       = 4660

    # VS2 (+3)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # MASK (+3)       = [ 0  1  1  1  0  0  1  1  1  0  1  1  0  0  1  1  1  1  1  0  0  0  0  1  0  1  0  1  0  1  1  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+3) BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (+3) AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # RS1  (x25)       = 4660

    # VS2 (+4)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # MASK (+4)       = [ 0  1  0  0  1  0  1  1  1  1  1  1  1  0  1  1  0  0  0  0  0  0  0  0  0  0  1  1  1  1  0  1]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+4) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+4) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # RS1  (x25)       = 4660

    # VS2 (+5)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # MASK (+5)       = [ 1  0  0  0  0  1  1  0  1  0  1  1  0  0  0  0  1  0  0  0  0  0  0  1  1  1  0  1  0  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+5) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+5) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # RS1  (x25)       = 4660

    # VS2 (+6)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # MASK (+6)       = [ 1  1  1  1  0  0  1  0  0  0  1  0  1  0  1  1  0  1  1  0  0  1  0  0  1  0  0  0  0  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+6) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+6) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # RS1  (x25)       = 4660

    # VS2 (+7)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # MASK (+7)       = [ 1  0  0  1  0  0  1  1  1  0  1  1  0  0  0  0  0  1  1  0  0  1  1  0  0  1  1  1  1  0  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+7) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+7) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]


    
    vrsub.vx v8, v24, x25, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m8
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xccdde074)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd5700a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8407f1f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb233fb86)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4019050)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fcfed5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37384071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfd753c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bcf8d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6368a95c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd20867c7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd92ccda5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4bf7321)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff0ae78)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b447bbc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99024c8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5e8e2)
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
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 64 # VL = 64
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 8, Use Mask = 0, VL = 64\n")

    





    # RS1  (x24)       = 4294967295

    # VS2 (v16)       = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # VD (v0)  AFTER  = [2e 43 82 27 37 c4 c3 cf c8 40 bf 8e e7 03 77 2a 2b 67 c9 af ad cc 5b 22 7d b2 c6 51 4d 2c 0e 3a]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # VD (+1) AFTER  = [64 cd 84 57 b0 0f 6c 87 6a e1 79 de 9f 8a 3e 5d c7 8b 07 5a a4 f7 98 78 9d 09 34 92 56 97 56 80]

    # RS1  (x24)       = 4294967295

    # VS2 (+2)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # VD (+2) AFTER  = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # RS1  (x24)       = 4294967295

    # VS2 (+3)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (+3) AFTER  = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]

    # RS1  (x24)       = 4294967295

    # VS2 (+4)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # VD (+4) AFTER  = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # RS1  (x24)       = 4294967295

    # VS2 (+5)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # VD (+5) AFTER  = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # RS1  (x24)       = 4294967295

    # VS2 (+6)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # VD (+6) AFTER  = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # RS1  (x24)       = 4294967295

    # VS2 (+7)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # VD (+7) AFTER  = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]


    
    vrsub.vx v0, v16, x24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m8
    vse8.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4d2c0e3a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7db2c651)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xadcc5b22)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2b67c9af)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe703772a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc840bf8e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37c4c3cf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2e438227)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x56975680)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9d093492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa4f79878)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc78b075a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9f8a3e5d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6ae179de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb00f6c87)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x64cd8457)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle8.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x23, 1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 57 # VL = 57
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 8, Use Mask = 1, VL = 57\n")

    





    # RS1  (x23)       = 1

    # VS2 (v8)        = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # MASK (v0)       = [ 1  0  0  0  1  0  1  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  0  0  0  1  0  1  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (v24) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (v24) AFTER  = [a6 74 f8 a5 9f 08 36 94 58 99 58 82 30 45 a9 7f 39 bc c5 d8 ca 42 3c 90 37 bf 40 2c 18 69 88 b1]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # MASK (+1)       = [ 0  1  0  0  1  1  1  0  0  0  0  1  0  0  0  1  1  0  0  0  0  0  0  1  1  1  1  0  1  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+1) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+1) AFTER  = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 af b3 2a 4c 59 b2 32 7b a8 4f f0 93 e0 a1 8c 40 21 c9 75 c1 5c]

    # RS1  (x23)       = 1

    # VS2 (+2)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # MASK (+2)       = [ 0  1  0  0  0  1  0  0  0  1  0  1  1  1  0  1  1  0  1  0  1  0  0  0  1  1  0  0  1  1  0  0]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+2) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+2) AFTER  = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # RS1  (x23)       = 1

    # VS2 (+3)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # MASK (+3)       = [ 1  1  1  0  1  0  1  0  0  0  1  1  0  1  0  1  1  1  1  1  1  1  1  0  0  0  0  1  1  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+3) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+3) AFTER  = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # RS1  (x23)       = 1

    # VS2 (+4)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # MASK (+4)       = [ 0  1  0  1  0  0  1  0  0  1  1  1  1  1  1  0  1  0  0  0  0  0  0  1  1  1  1  0  0  0  1  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+4) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+4) AFTER  = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # RS1  (x23)       = 1

    # VS2 (+5)       = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # MASK (+5)       = [ 0  1  1  1  1  0  0  1  1  1  1  0  1  0  0  1  0  0  0  1  0  0  0  0  1  1  0  1  1  1  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+5) BEFORE = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # VD (+5) AFTER  = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # RS1  (x23)       = 1

    # VS2 (+6)       = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # MASK (+6)       = [ 0  0  0  0  1  0  1  1  1  1  1  0  0  1  1  1  1  0  0  1  0  0  1  1  1  0  1  1  0  0  1  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+6) BEFORE = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # VD (+6) AFTER  = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # RS1  (x23)       = 1

    # VS2 (+7)       = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # MASK (+7)       = [ 1  1  0  0  0  1  0  0  0  1  1  1  1  1  0  0  0  1  0  1  1  1  0  1  0  1  1  1  0  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+7) BEFORE = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # VD (+7) AFTER  = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]


    
    vrsub.vx v24, v8, x23, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m8
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x186988b1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf402c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xca423c90)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x39bcc5d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3045a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x58995882)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9f083694)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa674f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc975c15c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa18c4021)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff093e0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb2327ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4c59)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d508af)
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
    vsetvli x0, x4, e8,m8
    vle8.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 41 # VL = 41
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 8, Use Mask = 0, VL = 41\n")

    





    # RS1  (x22)       = 2147483647

    # VS2 (v0)        = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (v16) AFTER  = [6a e1 79 de 9f 8a 3e 5d c7 8b 07 5a a4 f7 98 78 9d 09 34 92 56 97 56 80 2e 43 82 27 37 c4 c3 cf]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+1) AFTER  = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 ad 64 cd 84 57 b0 0f 6c 87]

    # RS1  (x22)       = 2147483647

    # VS2 (+2)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # VD (+2) AFTER  = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]

    # RS1  (x22)       = 2147483647

    # VS2 (+3)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (+3) AFTER  = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]

    # RS1  (x22)       = 2147483647

    # VS2 (+4)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+4) AFTER  = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]

    # RS1  (x22)       = 2147483647

    # VS2 (+5)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # VD (+5) AFTER  = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]

    # RS1  (x22)       = 2147483647

    # VS2 (+6)       = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # VD (+6) AFTER  = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]

    # RS1  (x22)       = 2147483647

    # VS2 (+7)       = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # VD (+7) AFTER  = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]


    
    vrsub.vx v16, v0, x22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m8
    vse8.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37c4c3cf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2e438227)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x56975680)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9d093492)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa4f79878)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc78b075a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9f8a3e5d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6ae179de)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb00f6c87)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x64cd8457)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d508ad)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle8.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x21, 124076833
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 8, Use Mask = 1, VL = 32\n")

    





    # RS1  (x21)       = 124076833

    # VS2 (v24)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # MASK (v0)       = [ 1  1  0  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  1  1  1  1  1  1  1  0  0  0  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (v8)  BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (v8)  AFTER  = [6e f7 08 cf 86 ef a6 79 d2 31 7b a8 8c f0 9b 78 c1 ac 86 7f e9 ad 29 7c c6 19 ba a5 5b 08 67 b4]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  1  1  1  1  0  0  0  0  0  0  0  0  1  0  1  0  1  0  1  0  0  1  1  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+1) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+1) AFTER  = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # RS1  (x21)       = 124076833

    # VS2 (+2)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # MASK (+2)       = [ 0  1  1  0  1  0  0  1  0  0  0  1  0  1  0  1  0  0  0  0  0  0  0  1  1  0  0  1  0  0  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+2) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+2) AFTER  = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # RS1  (x21)       = 124076833

    # VS2 (+3)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # MASK (+3)       = [ 1  1  1  1  0  0  0  1  1  0  1  1  1  1  0  0  1  1  0  1  1  0  0  0  0  1  0  0  1  1  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+3) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+3) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # RS1  (x21)       = 124076833

    # VS2 (+4)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # MASK (+4)       = [ 0  1  1  1  0  0  1  1  0  1  0  0  1  0  1  1  1  0  0  1  1  0  0  0  0  1  0  1  1  1  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+4) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+4) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    # RS1  (x21)       = 124076833

    # VS2 (+5)       = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # MASK (+5)       = [ 0  0  1  1  0  1  0  1  0  0  1  1  0  0  1  1  0  0  0  0  1  0  0  0  1  1  1  1  1  0  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+5) BEFORE = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # VD (+5) AFTER  = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]

    # RS1  (x21)       = 124076833

    # VS2 (+6)       = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # MASK (+6)       = [ 0  1  0  0  1  1  0  0  0  1  0  0  0  1  0  1  0  0  0  1  0  0  1  0  0  0  0  0  1  0  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+6) BEFORE = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # VD (+6) AFTER  = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]

    # RS1  (x21)       = 124076833

    # VS2 (+7)       = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # MASK (+7)       = [ 1  1  1  1  1  1  0  1  1  1  1  0  0  0  1  0  0  0  1  0  0  0  1  1  1  1  0  1  1  0  0  0]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+7) BEFORE = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # VD (+7) AFTER  = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]


    
    vrsub.vx v8, v24, x21, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m8
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b0867b4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc619baa5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe9ad297c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc1ac867f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8cf09b78)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd2317ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86efa679)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6ef708cf)
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
    vsetvli x0, x4, e8,m8
    vle8.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 8, Use Mask = 0, VL = 23\n")

    





    # RS1  (x20)       = 2048

    # VS2 (v16)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (v0)  AFTER  = [48 46 05 f6 0b 56 ed 8c 17 2b f8 e5 4d d6 b4 ae 65 ce 85 58 b1 10 6d 88 6b e2 7a df a0 8b 3f 5e]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+1) AFTER  = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]

    # RS1  (x20)       = 2048

    # VS2 (+2)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # VD (+2) AFTER  = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]

    # RS1  (x20)       = 2048

    # VS2 (+3)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # VD (+3) AFTER  = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # RS1  (x20)       = 2048

    # VS2 (+4)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # VD (+4) AFTER  = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]

    # RS1  (x20)       = 2048

    # VS2 (+5)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # VD (+5) AFTER  = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]

    # RS1  (x20)       = 2048

    # VS2 (+6)       = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # VD (+6) AFTER  = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]

    # RS1  (x20)       = 2048

    # VS2 (+7)       = [95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # VD (+7) AFTER  = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]


    
    vrsub.vx v0, v16, x20



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m8
    vse8.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa08b3f5e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6be27adf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb1106d88)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65ce8558)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4dd6b4ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x172bf8e5)
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
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x19, 0
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 8, Use Mask = 1, VL = 16\n")

    





    # RS1  (x19)       = 0

    # VS2 (v8)        = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  1  0  1  0  1  1  1  1  0  0  1  1  0  0  1  0  0  1  0  1  0  0  0  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (v24) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (v24) AFTER  = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 5e 05 8c 17 2b fb 1a 4d d5 b4 1b b3 2a 85 52]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # MASK (+1)       = [ 1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  0  1  0  1  0  1  0  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+1) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+1) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # RS1  (x19)       = 0

    # VS2 (+2)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # MASK (+2)       = [ 1  0  0  0  1  0  1  1  0  1  0  0  1  1  1  0  1  1  0  0  1  0  1  1  1  0  1  0  1  0  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+2) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+2) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # RS1  (x19)       = 0

    # VS2 (+3)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # MASK (+3)       = [ 1  1  0  0  1  1  0  1  0  0  0  1  1  0  1  1  0  0  1  1  0  1  1  1  1  1  1  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+3) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+3) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # RS1  (x19)       = 0

    # VS2 (+4)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # MASK (+4)       = [ 0  1  0  0  1  1  1  1  0  0  0  0  0  0  1  1  0  0  0  1  0  1  0  1  0  1  0  0  0  1  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+4) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+4) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    # RS1  (x19)       = 0

    # VS2 (+5)       = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # MASK (+5)       = [ 1  0  0  1  0  0  0  1  1  0  0  0  1  1  1  1  0  1  0  0  0  1  1  1  0  0  1  0  1  1  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+5) BEFORE = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # VD (+5) AFTER  = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]

    # RS1  (x19)       = 0

    # VS2 (+6)       = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # MASK (+6)       = [ 1  0  1  0  1  1  0  0  1  0  0  1  1  0  0  0  1  1  1  0  1  0  0  0  0  0  0  0  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+6) BEFORE = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # VD (+6) AFTER  = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # RS1  (x19)       = 0

    # VS2 (+7)       = [4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e]
    # MASK (+7)       = [ 0  0  1  1  0  0  0  1  0  0  0  1  1  1  0  0  1  0  0  1  1  0  0  0  1  0  1  0  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+7) BEFORE = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # VD (+7) AFTER  = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]


    
    vrsub.vx v24, v8, x19, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m8
    vse8.v v24, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a8552)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4dd5b41b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172bfb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b5e058c)
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
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 8, Use Mask = 0, VL = 10\n")

    





    # RS1  (x18)       = 2047

    # VS2 (v0)        = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (v16) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae fa 09 f4 a9 12 73 e8 5d 04 e5]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # VD (+1) AFTER  = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # RS1  (x18)       = 2047

    # VS2 (+2)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # VD (+2) AFTER  = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # RS1  (x18)       = 2047

    # VS2 (+3)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # VD (+3) AFTER  = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # RS1  (x18)       = 2047

    # VS2 (+4)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # VD (+4) AFTER  = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]

    # RS1  (x18)       = 2047

    # VS2 (+5)       = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # VD (+5) AFTER  = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]

    # RS1  (x18)       = 2047

    # VS2 (+6)       = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]
    # VD (+6) AFTER  = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]

    # RS1  (x18)       = 2047

    # VS2 (+7)       = [31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]
    # VD (+7) AFTER  = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]


    
    vrsub.vx v16, v0, x18



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m8
    vse8.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe85d04e5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf4a91273)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aefa09)
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
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x17, -1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 8, Use Mask = 1, VL = 8\n")

    





    # RS1  (x17)       = -1

    # VS2 (v24)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # MASK (v0)       = [ 1  1  0  0  0  0  0  1  1  0  0  0  0  0  0  0  1  0  0  1  0  1  0  0  0  1  0  0  1  0  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (v8)  BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (v8)  AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d 62 cd 04 4a 9d 11 8f]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # MASK (+1)       = [ 1  0  1  0  0  1  1  1  0  1  1  1  1  1  0  1  0  0  1  0  0  0  0  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+1) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+1) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # RS1  (x17)       = -1

    # VS2 (+2)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # MASK (+2)       = [ 0  0  1  0  0  1  0  0  1  0  0  1  0  1  0  0  0  0  0  1  0  1  0  1  0  0  0  0  0  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+2) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+2) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # RS1  (x17)       = -1

    # VS2 (+3)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # MASK (+3)       = [ 1  0  1  0  0  1  1  0  1  1  1  1  0  1  1  0  0  1  1  1  1  0  1  0  0  1  1  1  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+3) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+3) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # RS1  (x17)       = -1

    # VS2 (+4)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # MASK (+4)       = [ 1  1  1  1  0  0  0  0  1  1  1  0  1  1  0  1  1  0  1  0  0  1  0  0  1  1  0  1  1  0  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+4) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+4) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    # RS1  (x17)       = -1

    # VS2 (+5)       = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # MASK (+5)       = [ 1  0  1  0  1  0  0  1  0  0  0  1  1  0  0  0  1  1  0  0  0  1  1  0  1  0  1  1  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+5) BEFORE = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # VD (+5) AFTER  = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]

    # RS1  (x17)       = -1

    # VS2 (+6)       = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # MASK (+6)       = [ 1  0  0  1  1  1  1  1  0  0  0  1  0  0  1  0  0  0  0  0  1  1  1  1  0  1  1  1  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+6) BEFORE = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]
    # VD (+6) AFTER  = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]

    # RS1  (x17)       = -1

    # VS2 (+7)       = [31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5]
    # MASK (+7)       = [ 1  1  0  0  1  0  0  0  0  1  1  0  1  0  1  1  0  0  1  0  1  1  1  0  0  0  1  1  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+7) BEFORE = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]
    # VD (+7) AFTER  = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]


    
    vrsub.vx v8, v24, x17, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m8
    vse8.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4a9d118f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8d62cd04)
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
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 8, Use Mask = 0, VL = 6\n")

    





    # RS1  (x16)       = 1

    # VS2 (v16)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (v0)  AFTER  = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 6b 7b 66 e7 81 bf]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+1) BEFORE = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # VD (+1) AFTER  = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # RS1  (x16)       = 1

    # VS2 (+2)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+2) BEFORE = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # VD (+2) AFTER  = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # RS1  (x16)       = 1

    # VS2 (+3)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+3) BEFORE = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # VD (+3) AFTER  = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # RS1  (x16)       = 1

    # VS2 (+4)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+4) BEFORE = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # VD (+4) AFTER  = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]

    # RS1  (x16)       = 1

    # VS2 (+5)       = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+5) BEFORE = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # VD (+5) AFTER  = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]

    # RS1  (x16)       = 1

    # VS2 (+6)       = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+6) BEFORE = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]
    # VD (+6) AFTER  = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]

    # RS1  (x16)       = 1

    # VS2 (+7)       = [0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+7) BEFORE = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]
    # VD (+7) AFTER  = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]


    
    vrsub.vx v0, v16, x16



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m8
    vse8.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66e781bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b6b7b)
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

