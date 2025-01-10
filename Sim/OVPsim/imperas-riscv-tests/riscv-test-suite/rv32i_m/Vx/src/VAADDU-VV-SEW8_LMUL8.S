// RISC-V Architectural Validation Test VAADDU-VV-SEW8_LMUL8
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
// Description: Testing instruction 'vaaddu.vv'.

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
    la x5, test_1_data+0
    vsetvli x0, x7, e8,m8
    vle8.v v8, (x5)      # Load value into vs1
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
   
    





    # VS1 (v8)        = [e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27 15 1a 01 ef]

    # VS2 (v16)       = [c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27]
    # MASK (v0)       = [ 0  0  0  1  0  1  0  1  0  0  0  1  1  0  1  0  0  0  0  0  0  0  0  1  1  1  1  0  1  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (v24) BEFORE = [e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d]
    # VD (v24) AFTER  = [e5 4c 8c 4f c7 43 ad 3a e3 1f fa 3a a7 66 a1 0f bd 8f 6c 65 91 a8 d5 47 64 7a be 51 4e 38 4f 8b]

    # VS1 (+1)       = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]

    # VS2 (+1)       = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]
    # MASK (+1)       = [ 1  0  0  0  0  1  1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  1  0  0  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+1) BEFORE = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # VD (+1) AFTER  = [95 ef 5f f4 34 2e 83 d4 f6 8b a3 d3 19 8f a1 bf 19 ba 7a 93 41 9c c8 dd 06 92 76 df 7c 42 9d 2c]

    # VS1 (+2)       = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]

    # VS2 (+2)       = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # MASK (+2)       = [ 0  1  0  0  0  0  1  0  1  0  0  1  1  1  1  0  1  1  0  1  1  1  1  0  0  0  1  1  1  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+2) BEFORE = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # VD (+2) AFTER  = [d4 40 36 50 52 33 95 dd b1 4d 39 82 8c 85 4d c5 68 79 66 a9 4e 1d 67 92 68 14 6d e7 37 d4 7a e4]

    # VS1 (+3)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]

    # VS2 (+3)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # MASK (+3)       = [ 0  0  1  0  0  0  0  0  0  0  1  0  0  0  0  1  1  0  0  1  1  0  1  0  0  1  0  1  0  0  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+3) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (+3) AFTER  = [38 74 99 a5 5b 08 67 87 62 f6 93 6d a9 68 a9 84 80 bc 7d 51 28 3b 64 30 37 ca 40 93 18 fc 88 97]

    # VS1 (+4)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]

    # VS2 (+4)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # MASK (+4)       = [ 1  0  0  1  0  0  0  1  1  0  1  0  1  0  0  0  1  1  0  1  0  1  0  1  1  1  1  1  1  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+4) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+4) AFTER  = [0d 56 ed 1b 17 a2 fb 37 a7 d5 64 1b 75 2a 4c 52 72 87 7b 4d 4f 4a 93 62 4c 75 dd a4 4a 3e c1 96]

    # VS1 (+5)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS2 (+5)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # MASK (+5)       = [ 1  0  1  1  1  1  0  1  1  0  0  0  1  1  1  1  0  1  1  0  1  1  0  0  0  1  1  0  0  1  0  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+5) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+5) AFTER  = [8e e9 92 c1 bb 33 8d 64 94 4c 96 86 c5 b9 a9 4a 8d a6 b9 04 7f 7a 84 8f b5 4e 79 b5 48 7c 05 53]

    # VS1 (+6)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS2 (+6)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # MASK (+6)       = [ 0  0  0  0  0  1  0  0  0  1  1  0  0  1  1  0  0  0  1  0  0  1  0  1  0  0  0  0  1  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+6) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+6) AFTER  = [3b 9b 3d dc 0c 6e d6 c8 93 6e 73 78 f2 d6 41 84 86 b0 71 d4 4b 73 00 54 73 b3 e1 56 91 aa 4b 94]

    # VS1 (+7)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS2 (+7)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # MASK (+7)       = [ 1  1  1  0  0  0  1  1  0  0  0  1  1  1  1  1  1  1  1  1  1  0  1  0  0  1  1  0  0  1  0  0]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+7) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+7) AFTER  = [91 81 89 e9 8b fc 66 6f 97 05 65 65 a1 71 b0 69 54 1e 50 42 0e 16 71 52 05 9c 7d 32 16 b2 bc e8]


    
    
    vaaddu.vv v24, v16, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e384f8b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x647abe51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91a8d547)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd8f6c65)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa766a10f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffa3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc743ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c4f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c429d2c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x069276df)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x419cc8dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x19ba7a93)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x198fa1bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf68ba3d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x342e83d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95ef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37d47ae4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68146de7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1d6792)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x687966a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8c854dc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb14d3982)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x523395dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4403650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc8897)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37ca4093)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x283b6430)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x80bc7d51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a984)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6936d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x387499a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a3ec196)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c75dda4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f4a9362)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x72877b4d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x752a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa7d5641b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2fb37)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d56ed1b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x487c0553)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb54e79b5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f7a848f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8da6b904)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc5b9a94a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x944c9686)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbb338d64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8ee992c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91aa4b94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x73b3e156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4b730054)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b071d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf2d64184)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x936e7378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c6ed6c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3b9b3ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x16b2bce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x059c7d32)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e167152)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x541e5042)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa171b069)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x97056565)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8bfc666f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918189e9)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e8,m8
    vle8.v v0, (x5)      # Load value into vs1
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
   
    





    # VS1 (v0)        = [7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51]

    # VS2 (v24)       = [06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65]
    # VD (v16) AFTER  = [41 9c 9d dd b1 79 76 7d d6 42 9d 2c d5 2b d4 4f 74 43 90 3a 61 7b 49 3a a7 9c a1 b1 59 65 b8 a7]

    # VS1 (+1)       = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]

    # VS2 (+1)       = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # VD (+1) AFTER  = [4e 1d 67 cd 37 8b 6d e7 37 d4 37 e4 95 5c 59 d3 88 2e 83 c8 8a 8b 6e d3 94 8f a1 97 19 7b d1 93]

    # VS1 (+2)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]

    # VS2 (+2)       = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # VD (+2) AFTER  = [28 de 64 a3 76 ca 5f 93 93 66 6d 97 6a 40 6f c6 9a 90 95 ba b1 80 ac 82 8c 85 4d 68 68 79 44 a9]

    # VS1 (+3)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]

    # VS2 (+3)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (+3) AFTER  = [7b 4a a4 62 4c 75 dd a4 4a 3e b0 96 5f 7f 99 7a 86 af ba 76 bd 92 93 ac cd 7c 5d 84 80 7d 3e 51]

    # VS1 (+4)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]

    # VS2 (+4)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+4) AFTER  = [7f 7a 7a d6 2a 4e 79 c1 11 7c f4 53 0d bc 82 1b 5b 80 2a 37 a7 2e 64 7d 75 91 87 90 72 87 8d 4d]

    # VS1 (+5)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]

    # VS2 (+5)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # VD (+5) AFTER  = [b5 73 8f 54 eb 8e 23 3f 91 aa 4b 94 8e 5c 92 c1 bb 33 8b 64 94 78 a7 23 c5 b9 a9 4a d9 a6 b9 a2]

    # VS1 (+6)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]

    # VS2 (+6)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (+6) AFTER  = [0e 61 71 8d 29 9c 7d e2 24 b2 8a d2 50 bd 9e a0 c3 6e 65 7e bc 6e 73 ac 69 d6 41 89 5f d7 71 4a]

    # VS1 (+7)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # VS2 (+7)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+7) AFTER  = [52 7e 81 e3 ea 35 95 db 6d 87 97 7f 91 81 89 54 c0 1a 66 6f c4 7d a6 65 a1 71 b0 69 54 1e 50 42]


    
    
    vaaddu.vv v16, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5965b8a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa79ca1b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x617b493a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7443903a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd52bd44f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd6429d2c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb179767d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x419c9ddd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x197bd193)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x948fa197)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8a8b6ed3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x882e83c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x955c59d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37d437e4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x378b6de7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1d67cd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x687944a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8c854d68)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb180ac82)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a9095ba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a406fc6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93666d97)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x76ca5f93)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x28de64a3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x807d3e51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd7c5d84)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd9293ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86afba76)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5f7f997a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a3eb096)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c75dda4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b4aa462)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x72878d4d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x75918790)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa72e647d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b802a37)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0dbc821b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x117cf453)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2a4e79c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f7a7ad6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd9a6b9a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc5b9a94a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9478a723)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbb338b64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8e5c92c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91aa4b94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeb8e233f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5738f54)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5fd7714a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x69d64189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbc6e73ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc36e657e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50bd9ea0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24b28ad2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x299c7de2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e61718d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x541e5042)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa171b069)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc47da665)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc01a666f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91818954)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6d87977f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea3595db)
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
    la x5, test_1_data+24
    vsetvli x0, x7, e8,m8
    vle8.v v16, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 208 # VL = 208
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 8, Use Mask = 1, VL = 208\n")
   
    





    # VS1 (v16)       = [fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f]

    # VS2 (v24)       = [19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  0  1  0  1  1  1  0  0  0  0  0  0  0  1  1  1  1  1  1  0  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (v8)  BEFORE = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]
    # VD (v8)  AFTER  = [f6 00 6e d3 19 8f 62 bf 19 ba d1 93 41 63 c8 47 06 92 da df d6 42 9d 2c d5 2b 8c 4f c7 43 ad 3a]

    # VS1 (+1)       = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]

    # VS2 (+1)       = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  0  1  1  1  0  1  1  1  1  0  1  0  1  1  1  1  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+1) BEFORE = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # VD (+1) AFTER  = [82 4d ac 82 8c d3 4d c5 68 79 44 3e 4e 1d 67 cd 68 8b 54 e7 37 d4 37 e4 95 5c 59 d3 34 2e 0f d4]

    # VS1 (+2)       = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]

    # VS2 (+2)       = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # MASK (+2)       = [ 0  0  1  1  0  1  0  0  0  0  1  0  0  1  1  0  0  1  1  1  1  0  1  0  1  1  0  1  1  0  0  1]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+2) BEFORE = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # VD (+2) AFTER  = [62 f6 93 ac a9 7c a9 7f d1 bc 3e d8 c8 de 64 30 37 ca 5f 93 93 fc 6d d5 6a 40 36 c6 9a 33 a4 ba]

    # VS1 (+3)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]

    # VS2 (+3)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # MASK (+3)       = [ 0  1  1  0  1  0  0  0  0  0  0  1  0  1  0  0  0  1  0  1  0  1  0  0  1  1  0  0  0  0  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+3) BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (+3) AFTER  = [03 2e 64 1b 75 2a 4c 52 9b 32 7b 4d 4f 4a 93 78 95 75 86 a4 60 3e c1 a2 5f 7f f8 a5 5b 08 67 87]

    # VS1 (+4)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]

    # VS2 (+4)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # MASK (+4)       = [ 0  1  1  0  0  1  1  1  1  1  0  1  1  1  0  1  0  0  1  1  0  1  0  0  1  0  0  1  0  0  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+4) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+4) AFTER  = [da 78 a7 86 9b b9 a9 4a d9 a6 cd a2 7f 7a 84 d6 b5 ae 79 c1 48 7c 05 f6 0d 56 ed 1b 17 a2 2a 1a]

    # VS1 (+5)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS2 (+5)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # MASK (+5)       = [ 1  0  1  1  0  0  0  0  0  0  1  0  1  1  0  1  0  1  1  0  0  1  1  0  0  0  1  1  1  1  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+5) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+5) AFTER  = [bc b0 73 ac f2 2b 64 84 86 b0 71 d4 b5 73 00 54 73 8e 23 56 f6 aa 4b 52 e0 e9 92 c1 bb 33 8b fb]

    # VS1 (+6)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS2 (+6)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # MASK (+6)       = [ 1  0  1  1  0  0  1  0  1  1  0  1  0  0  1  1  1  1  1  1  0  0  0  1  1  1  0  0  0  1  0  1]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+6) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+6) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 29 9c 7d e2 16 9d bc d2 50 bd 3d dc 0c 6e d6 7e]

    # VS1 (+7)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS2 (+7)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # MASK (+7)       = [ 1  0  0  0  0  0  1  0  0  1  0  0  1  1  0  1  0  0  1  1  1  0  0  1  1  0  1  0  1  1  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+7) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+7) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]


    
    
    vaaddu.vv v8, v24, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc743ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd52b8c4f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd6429d2c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4163c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x19bad193)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x198f62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6006ed3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x342e0fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x955c59d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37d437e4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x688b54e7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1d67cd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6879443e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8cd34dc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824dac82)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a33a4ba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a4036c6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93fc6dd5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37ca5f93)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc8de6430)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc3ed8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa97ca97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f693ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5f7ff8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x603ec1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x957586a4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f4a9378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327b4d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x752a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x032e641b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a22a1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d56ed1b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x487c05f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5ae79c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f7a84d6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd9a6cda2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9bb9a94a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xda78a786)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbb338bfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe0e992c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6aa4b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x738e2356)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5730054)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86b071d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf22b6484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbcb073ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c6ed67e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50bd3ddc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x169dbcd2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x299c7de2)
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
    la x5, test_1_data+36
    vsetvli x0, x7, e8,m8
    vle8.v v24, (x5)      # Load value into vs1
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
   
    





    # VS1 (v24)       = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]

    # VS2 (v8)        = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]
    # VD (v0)  AFTER  = [37 d4 37 e4 95 5c 59 d3 88 2e 83 c8 8a 8b 6e d3 94 8f a1 97 19 7b d1 93 41 9c 9d dd b1 79 76 7d]

    # VS1 (+1)       = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]

    # VS2 (+1)       = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # VD (+1) AFTER  = [93 66 6d 97 6a 40 6f c6 9a 90 95 ba b1 80 ac 82 8c 85 4d 68 68 79 44 a9 4e 1d 67 cd 37 8b 6d e7]

    # VS1 (+2)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]

    # VS2 (+2)       = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # VD (+2) AFTER  = [4a 3e b0 96 5f 7f 99 7a 86 af ba 76 bd 92 93 ac cd 7c 5d 84 80 7d 3e 51 28 de 64 a3 76 ca 5f 93]

    # VS1 (+3)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]

    # VS2 (+3)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (+3) AFTER  = [11 7c f4 53 0d bc 82 1b 5b 80 2a 37 a7 2e 64 7d 75 91 87 90 72 87 8d 4d 7b 4a a4 62 4c 75 dd a4]

    # VS1 (+4)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]

    # VS2 (+4)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+4) AFTER  = [91 aa 4b 94 8e 5c 92 c1 bb 33 8b 64 94 78 a7 23 c5 b9 a9 4a d9 a6 b9 a2 7f 7a 7a d6 2a 4e 79 c1]

    # VS1 (+5)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # VS2 (+5)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # VD (+5) AFTER  = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 8f 54 eb 8e 23 3f]

    # VS1 (+6)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # VS2 (+6)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # VD (+6) AFTER  = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # VS1 (+7)       = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # VS2 (+7)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # VD (+7) AFTER  = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]


    
    
    vaaddu.vv v0, v8, v24
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb179767d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x419c9ddd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x197bd193)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x948fa197)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8a8b6ed3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x882e83c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x955c59d3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37d437e4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x378b6de7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e1d67cd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x687944a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8c854d68)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb180ac82)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9a9095ba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6a406fc6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x93666d97)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x76ca5f93)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x28de64a3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x807d3e51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd7c5d84)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd9293ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86afba76)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5f7f997a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4a3eb096)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c75dda4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b4aa462)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x72878d4d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x75918790)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa72e647d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b802a37)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0dbc821b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x117cf453)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2a4e79c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f7a7ad6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd9a6b9a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc5b9a94a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9478a723)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbb338b64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8e5c92c1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91aa4b94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeb8e233f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4bfb8f54)
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
    la x2, test_1_data+48
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 128 # VL = 128
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 8, Use Mask = 1, VL = 128\n")
   
    





    # VS1 (v8)        = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]

    # VS2 (v16)       = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # MASK (v0)       = [ 0  1  0  1  1  0  1  1  0  0  0  0  1  0  0  0  0  1  1  0  0  1  1  1  1  0  0  0  0  1  1  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (v24) BEFORE = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]
    # VD (v24) AFTER  = [b0 79 66 a9 4e dd 67 cd 68 14 54 c0 37 26 7a d9 3a 5c 59 f4 34 2e 83 c8 8a 00 a3 d1 19 8f a1 97]

    # VS1 (+1)       = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]

    # VS2 (+1)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # MASK (+1)       = [ 0  0  1  1  1  0  0  0  0  1  1  1  0  1  0  0  1  1  1  1  1  0  0  0  1  0  1  0  0  1  0  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+1) BEFORE = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # VD (+1) AFTER  = [d1 bc 3e 51 28 3b 3c 30 37 ca 5f 93 18 66 88 d5 6a 40 6f c6 9a 33 a4 dd b1 4d ac ae b2 85 f1 68]

    # VS1 (+2)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]

    # VS2 (+2)       = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # MASK (+2)       = [ 0  1  1  0  0  0  0  0  0  1  1  1  0  1  0  1  1  1  0  0  0  0  0  1  1  0  1  0  0  0  1  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+2) BEFORE = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # VD (+2) AFTER  = [9b 87 8d a8 4f f0 93 78 95 75 dd a4 60 3e c1 96 5f 7f f8 a5 5b 08 67 76 bd f6 93 6d a9 68 5d 7f]

    # VS1 (+3)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]

    # VS2 (+3)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # MASK (+3)       = [ 1  0  0  1  0  1  0  1  0  0  0  1  1  1  1  0  1  0  0  0  0  1  1  0  0  0  1  0  0  0  0  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+3) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (+3) AFTER  = [d9 d5 cd a2 fc 7a 84 d6 b5 ae ee c1 11 7c f4 f6 0d 56 ed 8c 17 80 2a 1a 03 d5 64 1b b3 2a 4c 90]

    # VS1 (+4)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS2 (+4)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # MASK (+4)       = [ 0  1  0  0  1  1  1  1  1  1  1  1  0  0  0  0  1  0  0  1  0  0  1  1  0  1  1  1  1  0  0  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+4) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+4) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS1 (+5)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS2 (+5)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # MASK (+5)       = [ 1  0  0  1  1  0  1  1  0  0  1  1  0  0  1  0  0  1  1  1  1  0  1  1  1  0  1  0  1  0  0  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+5) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+5) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS1 (+6)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS2 (+6)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # MASK (+6)       = [ 1  0  1  1  0  0  1  1  0  0  1  0  1  0  1  0  0  1  0  0  1  1  0  0  0  1  0  1  0  0  1  0]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+6) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+6) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS1 (+7)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS2 (+7)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # MASK (+7)       = [ 0  0  0  0  0  0  1  1  1  1  0  1  0  1  0  1  0  0  0  0  1  0  0  0  0  0  0  1  1  0  1  1]
    # ELEMENTS          [mm ff mm ff ff mm ff ff mm mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+7) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+7) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]


    
    
    vaaddu.vv v24, v16, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x198fa197)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8a00a3d1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x342e83c8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3a5c59f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4edd67cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb07966a9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb285f168)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb14dacae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a33a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6a406fc6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x186688d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37ca5f93)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x283b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc3e51)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa9685d7f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbdf6936d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086776)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5f7ff8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x603ec196)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9575dda4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b878da8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c90)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5641b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17802a1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0d56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x117cf4f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeec1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc7a84d6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd9d5cda2)
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
    la x2, test_1_data+60
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 105 # VL = 105
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 8, Use Mask = 0, VL = 105\n")
   
    





    # VS1 (v0)        = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]

    # VS2 (v8)        = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # VD (v16) AFTER  = [9a 90 95 ba b1 80 ac 82 8c 85 4d 68 68 79 44 a9 4e 1d 67 cd 37 8b 6d e7 37 d4 37 e4 95 5c 59 d3]

    # VS1 (+1)       = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]

    # VS2 (+1)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # VD (+1) AFTER  = [86 af ba 76 bd 92 93 ac cd 7c 5d 84 80 7d 3e 51 28 de 64 a3 76 ca 5f 93 93 66 6d 97 6a 40 6f c6]

    # VS1 (+2)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]

    # VS2 (+2)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # VD (+2) AFTER  = [5b 80 2a 37 a7 2e 64 7d 75 91 87 90 72 87 8d 4d 7b 4a a4 62 4c 75 dd a4 4a 3e b0 96 5f 7f 99 7a]

    # VS1 (+3)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # VS2 (+3)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (+3) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee c1 11 7c f4 53 0d bc 82 1b]

    # VS1 (+4)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]

    # VS2 (+4)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # VD (+4) AFTER  = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # VS1 (+5)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # VS2 (+5)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # VD (+5) AFTER  = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # VS1 (+6)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # VS2 (+6)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # VD (+6) AFTER  = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # VS1 (+7)       = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # VS2 (+7)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # VD (+7) AFTER  = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]


    
    
    vaaddu.vv v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x955c59d3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37d437e4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x378b6de7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e1d67cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x687944a9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8c854d68)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb180ac82)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a9095ba)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6a406fc6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93666d97)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x76ca5f93)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x28de64a3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x807d3e51)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd7c5d84)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbd9293ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86afba76)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5f7f997a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4a3eb096)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c75dda4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7b4aa462)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x72878d4d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x75918790)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa72e647d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b802a37)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0dbc821b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x117cf453)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeec1)
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
    la x2, test_1_data+72
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x2)      # Load value into vs1
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
   
    





    # VS1 (v16)       = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]

    # VS2 (v24)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # MASK (v0)       = [ 0  1  0  0  0  0  1  0  0  1  1  0  1  0  1  1  1  0  0  0  1  1  0  1  1  1  1  1  1  0  1  1]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (v8)  BEFORE = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # VD (v8)  AFTER  = [37 ca 40 71 18 fc 6d d5 d4 40 6f 50 9a 33 95 ba b1 4d 39 ae 8c 85 f1 68 68 79 44 a9 4e dd 67 cd]

    # VS1 (+1)       = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]

    # VS2 (+1)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # MASK (+1)       = [ 1  1  1  0  0  0  0  0  1  1  1  0  1  0  0  1  0  0  0  0  1  0  0  1  0  0  1  0  1  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+1) BEFORE = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # VD (+1) AFTER  = [4c 75 dd 21 60 75 c1 a2 5f 7f 99 a5 86 08 67 76 62 f6 cb 6d cd 68 a9 84 d1 bc 3e d8 28 de 3c 30]

    # VS1 (+2)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]

    # VS2 (+2)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # MASK (+2)       = [ 1  1  1  1  0  1  1  0  0  0  1  1  0  0  1  0  0  0  1  1  1  1  0  1  0  1  0  1  0  0  1  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+2) BEFORE = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # VD (+2) AFTER  = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 64 7d 75 91 4c 90 9b 87 7b 4d 4f f0 a4 78]

    # VS1 (+3)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS2 (+3)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # MASK (+3)       = [ 0  1  1  1  0  0  1  1  1  0  1  1  0  0  1  1  1  1  1  0  0  0  0  1  0  1  0  1  0  1  1  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+3) BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (+3) AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS1 (+4)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS2 (+4)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # MASK (+4)       = [ 0  1  0  0  1  0  1  1  1  1  1  1  1  0  1  1  0  0  0  0  0  0  0  0  0  0  1  1  1  1  0  1]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+4) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+4) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS1 (+5)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS2 (+5)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # MASK (+5)       = [ 1  0  0  0  0  1  1  0  1  0  1  1  0  0  0  0  1  0  0  0  0  0  0  1  1  1  0  1  0  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+5) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+5) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS1 (+6)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS2 (+6)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # MASK (+6)       = [ 1  1  1  1  0  0  1  0  0  0  1  0  1  0  1  1  0  1  1  0  0  1  0  0  1  0  0  0  0  1  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+6) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+6) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS1 (+7)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS2 (+7)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # MASK (+7)       = [ 1  0  0  1  0  0  1  1  1  0  1  1  0  0  0  0  0  1  1  0  0  1  1  0  0  1  1  1  1  0  0  0]
    # ELEMENTS          [mm ff mm mm mm mm ff mm mm ff ff mm ff mm ff ff ff mm mm mm ff ff mm ff ff ff ff ff ff mm ff ff]
    # VD (+7) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+7) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]


    
    
    vaaddu.vv v8, v24, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4edd67cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x687944a9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8c85f168)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb14d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a3395ba)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4406f50)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc6dd5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37ca4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x28de3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc3ed8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd68a984)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86086776)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5f7f99a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c75dd21)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff0a478)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b877b4d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x75914c90)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5647d)
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
    la x2, test_1_data+84
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)      # Load value into vs1
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
   
    





    # VS1 (v24)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]

    # VS2 (v16)       = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # VD (v0)  AFTER  = [cd 7c 5d 84 80 7d 3e 51 28 de 64 a3 76 ca 5f 93 93 66 6d 97 6a 40 6f c6 9a 90 95 ba b1 80 ac 82]

    # VS1 (+1)       = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]

    # VS2 (+1)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # VD (+1) AFTER  = [75 91 87 90 72 87 8d 4d 7b 4a a4 62 4c 75 dd a4 4a 3e b0 96 5f 7f 99 7a 86 af ba 76 bd 92 93 ac]

    # VS1 (+2)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]

    # VS2 (+2)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # VD (+2) AFTER  = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # VS1 (+3)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]

    # VS2 (+3)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (+3) AFTER  = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]

    # VS1 (+4)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]

    # VS2 (+4)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # VD (+4) AFTER  = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # VS1 (+5)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]

    # VS2 (+5)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # VD (+5) AFTER  = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # VS1 (+6)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]

    # VS2 (+6)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # VD (+6) AFTER  = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # VS1 (+7)       = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]

    # VS2 (+7)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # VD (+7) AFTER  = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]


    
    
    vaaddu.vv v0, v16, v24
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb180ac82)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9a9095ba)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6a406fc6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x93666d97)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x76ca5f93)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x28de64a3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x807d3e51)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd7c5d84)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbd9293ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86afba76)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5f7f997a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4a3eb096)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c75dda4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7b4aa462)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x72878d4d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x75918790)
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
    la x2, test_1_data+96
    vsetvli x0, x4, e8,m8
    vle8.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 57 # VL = 57
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 8, Use Mask = 1, VL = 57\n")
   
    





    # VS1 (v8)        = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]

    # VS2 (v16)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # MASK (v0)       = [ 1  0  0  0  1  0  1  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  0  0  0  1  0  1  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (v24) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (v24) AFTER  = [5f 74 f8 a5 86 08 ba 76 bd 92 93 ac cd 7c a9 7f 80 bc 3e d8 28 de 3c a3 37 bf 40 93 18 66 88 97]

    # VS1 (+1)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]

    # VS2 (+1)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # MASK (+1)       = [ 0  1  0  0  1  1  1  0  0  0  0  1  0  0  0  1  1  0  0  0  0  0  0  1  1  1  1  0  1  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+1) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+1) AFTER  = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 7d b3 2a 4c 90 72 32 7b a8 4f f0 93 62 4c 75 dd 21 4a 75 c1 96]

    # VS1 (+2)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS2 (+2)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # MASK (+2)       = [ 0  1  0  0  0  1  0  0  0  1  0  1  1  1  0  1  1  0  1  0  1  0  0  0  1  1  0  0  1  1  0  0]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+2) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+2) AFTER  = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS1 (+3)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS2 (+3)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # MASK (+3)       = [ 1  1  1  0  1  0  1  0  0  0  1  1  0  1  0  1  1  1  1  1  1  1  1  0  0  0  0  1  1  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+3) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+3) AFTER  = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS1 (+4)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS2 (+4)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # MASK (+4)       = [ 0  1  0  1  0  0  1  0  0  1  1  1  1  1  1  0  1  0  0  0  0  0  0  1  1  1  1  0  0  0  1  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+4) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+4) AFTER  = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS1 (+5)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    # VS2 (+5)       = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # MASK (+5)       = [ 0  1  1  1  1  0  0  1  1  1  1  0  1  0  0  1  0  0  0  1  0  0  0  0  1  1  0  1  1  1  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+5) BEFORE = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # VD (+5) AFTER  = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS1 (+6)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]

    # VS2 (+6)       = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # MASK (+6)       = [ 0  0  0  0  1  0  1  1  1  1  1  0  0  1  1  1  1  0  0  1  0  0  1  1  1  0  1  1  0  0  1  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+6) BEFORE = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # VD (+6) AFTER  = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS1 (+7)       = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]

    # VS2 (+7)       = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # MASK (+7)       = [ 1  1  0  0  0  1  0  0  0  1  1  1  1  1  0  0  0  1  0  1  1  1  0  1  0  1  1  1  0  0  0  1]
    # ELEMENTS          [ff mm mm mm ff mm ff ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff mm mm mm ff mm ff mm ff]
    # VD (+7) BEFORE = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # VD (+7) AFTER  = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]


    
    
    vaaddu.vv v24, v16, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18668897)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4093)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x28de3ca3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x80bc3ed8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd7ca97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbd9293ac)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8608ba76)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5f74f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4a75c196)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c75dd21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff09362)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x72327ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4c90)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5087d)
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
    la x2, test_1_data+108
    vsetvli x0, x4, e8,m8
    vle8.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 41 # VL = 41
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 8, Use Mask = 0, VL = 41\n")
   
    





    # VS1 (v0)        = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]

    # VS2 (v8)        = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (v16) AFTER  = [7b 4a a4 62 4c 75 dd a4 4a 3e b0 96 5f 7f 99 7a 86 af ba 76 bd 92 93 ac cd 7c 5d 84 80 7d 3e 51]

    # VS1 (+1)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]

    # VS2 (+1)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+1) AFTER  = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 7d 75 91 87 90 72 87 8d 4d]

    # VS1 (+2)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]

    # VS2 (+2)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # VD (+2) AFTER  = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]

    # VS1 (+3)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]

    # VS2 (+3)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (+3) AFTER  = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]

    # VS1 (+4)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # VS2 (+4)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+4) AFTER  = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]

    # VS1 (+5)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]

    # VS2 (+5)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # VD (+5) AFTER  = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]

    # VS1 (+6)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]

    # VS2 (+6)       = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # VD (+6) AFTER  = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]

    # VS1 (+7)       = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]

    # VS2 (+7)       = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # VD (+7) AFTER  = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]


    
    
    vaaddu.vv v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x807d3e51)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd7c5d84)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbd9293ac)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86afba76)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5f7f997a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4a3eb096)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c75dda4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7b4aa462)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x72878d4d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x75918790)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5087d)
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
    la x2, test_1_data+120
    vsetvli x0, x4, e8,m8
    vle8.v v16, (x2)      # Load value into vs1
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
   
    





    # VS1 (v16)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]

    # VS2 (v24)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # MASK (v0)       = [ 1  1  0  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  1  1  1  1  1  1  1  0  0  0  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (v8)  BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (v8)  AFTER  = [a7 2e 08 7d 75 91 87 90 72 87 7b a8 7b f0 a4 78 4c 75 86 a4 4a 3e b0 96 5f 7f 99 a5 5b 08 67 76]

    # VS1 (+1)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]

    # VS2 (+1)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  1  1  1  1  0  0  0  0  0  0  0  0  1  0  1  0  1  0  1  0  0  1  1  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+1) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+1) AFTER  = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS1 (+2)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS2 (+2)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # MASK (+2)       = [ 0  1  1  0  1  0  0  1  0  0  0  1  0  1  0  1  0  0  0  0  0  0  0  1  1  0  0  1  0  0  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+2) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+2) AFTER  = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS1 (+3)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS2 (+3)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # MASK (+3)       = [ 1  1  1  1  0  0  0  1  1  0  1  1  1  1  0  0  1  1  0  1  1  0  0  0  0  1  0  0  1  1  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+3) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+3) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS1 (+4)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS2 (+4)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # MASK (+4)       = [ 0  1  1  1  0  0  1  1  0  1  0  0  1  0  1  1  1  0  0  1  1  0  0  0  0  1  0  1  1  1  0  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+4) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+4) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    # VS1 (+5)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    # VS2 (+5)       = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # MASK (+5)       = [ 0  0  1  1  0  1  0  1  0  0  1  1  0  0  1  1  0  0  0  0  1  0  0  0  1  1  1  1  1  0  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+5) BEFORE = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # VD (+5) AFTER  = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]

    # VS1 (+6)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]

    # VS2 (+6)       = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # MASK (+6)       = [ 0  1  0  0  1  1  0  0  0  1  0  0  0  1  0  1  0  0  0  1  0  0  1  0  0  0  0  0  1  0  1  1]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+6) BEFORE = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # VD (+6) AFTER  = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]

    # VS1 (+7)       = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # VS2 (+7)       = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # MASK (+7)       = [ 1  1  1  1  1  1  0  1  1  1  1  0  0  0  1  0  0  0  1  0  0  0  1  1  1  1  0  1  1  0  0  0]
    # ELEMENTS          [ff ff mm ff ff ff ff ff ff ff mm mm ff mm ff mm ff ff mm ff ff ff ff ff ff ff ff mm mm mm mm ff]
    # VD (+7) BEFORE = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # VD (+7) AFTER  = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]


    
    
    vaaddu.vv v8, v24, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086776)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5f7f99a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4a3eb096)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c7586a4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7bf0a478)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x72877ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x75918790)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa72e087d)
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
    la x2, test_1_data+132
    vsetvli x0, x4, e8,m8
    vle8.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m8
    vle8.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 8, Use Mask = 0, VL = 23\n")
   
    





    # VS1 (v24)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]

    # VS2 (v8)        = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (v0)  AFTER  = [48 46 05 f6 0b 56 ed 8c 17 80 2a 37 a7 2e 64 7d 75 91 87 90 72 87 8d 4d 7b 4a a4 62 4c 75 dd a4]

    # VS1 (+1)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]

    # VS2 (+1)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+1) AFTER  = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]

    # VS1 (+2)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # VS2 (+2)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # VD (+2) AFTER  = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]

    # VS1 (+3)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # VS2 (+3)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # VD (+3) AFTER  = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # VS1 (+4)       = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # VS2 (+4)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # VD (+4) AFTER  = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]

    # VS1 (+5)       = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]

    # VS2 (+5)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # VD (+5) AFTER  = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]

    # VS1 (+6)       = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]

    # VS2 (+6)       = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # VD (+6) AFTER  = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]

    # VS1 (+7)       = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]

    # VS2 (+7)       = [95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # VD (+7) AFTER  = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]


    
    
    vaaddu.vv v0, v8, v24
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c75dda4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7b4aa462)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x72878d4d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x75918790)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa72e647d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17802a37)
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
    la x6, test_1_data+144
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 8, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v8)        = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]

    # VS2 (v16)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  1  0  1  0  1  1  1  1  0  0  1  1  0  0  1  0  0  1  0  1  0  0  0  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (v24) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (v24) AFTER  = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b bc 82 8c 17 80 fb 1a a7 d5 64 1b b3 2a 87 52]

    # VS1 (+1)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS2 (+1)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # MASK (+1)       = [ 1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  0  1  0  1  0  1  0  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+1) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+1) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS1 (+2)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS2 (+2)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # MASK (+2)       = [ 1  0  0  0  1  0  1  1  0  1  0  0  1  1  1  0  1  1  0  0  1  0  1  1  1  0  1  0  1  0  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+2) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+2) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS1 (+3)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS2 (+3)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # MASK (+3)       = [ 1  1  0  0  1  1  0  1  0  0  0  1  1  0  1  1  0  0  1  1  0  1  1  1  1  1  1  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+3) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+3) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS1 (+4)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS2 (+4)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # MASK (+4)       = [ 0  1  0  0  1  1  1  1  0  0  0  0  0  0  1  1  0  0  0  1  0  1  0  1  0  1  0  0  0  1  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+4) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+4) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    # VS1 (+5)       = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    # VS2 (+5)       = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # MASK (+5)       = [ 1  0  0  1  0  0  0  1  1  0  0  0  1  1  1  1  0  1  0  0  0  1  1  1  0  0  1  0  1  1  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+5) BEFORE = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # VD (+5) AFTER  = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]

    # VS1 (+6)       = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]

    # VS2 (+6)       = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # MASK (+6)       = [ 1  0  1  0  1  1  0  0  1  0  0  1  1  0  0  0  1  1  1  0  1  0  0  0  0  0  0  0  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+6) BEFORE = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # VD (+6) AFTER  = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # VS1 (+7)       = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]

    # VS2 (+7)       = [4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e]
    # MASK (+7)       = [ 0  0  1  1  0  0  0  1  0  0  0  1  1  1  0  0  1  0  0  1  1  0  0  0  1  0  1  0  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+7) BEFORE = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # VD (+7) AFTER  = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]


    
    
    vaaddu.vv v24, v16, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a8752)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa7d5641b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1780fb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0bbc828c)
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
    la x6, test_1_data+156
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 8, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v0)        = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # VS2 (v24)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (v16) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae 79 c1 11 7c f4 53 0d bc 82 1b]

    # VS1 (+1)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]

    # VS2 (+1)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # VD (+1) AFTER  = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # VS1 (+2)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # VS2 (+2)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # VD (+2) AFTER  = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]

    # VS1 (+3)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # VS2 (+3)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # VD (+3) AFTER  = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # VS1 (+4)       = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # VS2 (+4)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # VD (+4) AFTER  = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]

    # VS1 (+5)       = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]

    # VS2 (+5)       = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # VD (+5) AFTER  = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]

    # VS1 (+6)       = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]

    # VS2 (+6)       = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]
    # VD (+6) AFTER  = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]

    # VS1 (+7)       = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]

    # VS2 (+7)       = [31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]
    # VD (+7) AFTER  = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]


    
    
    vaaddu.vv v16, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0dbc821b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x117cf453)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5ae79c1)
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
    la x6, test_1_data+168
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)      # Load value into vs1
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
   
    





    # VS1 (v16)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS2 (v24)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # MASK (v0)       = [ 1  1  0  0  0  0  0  1  1  0  0  0  0  0  0  0  1  0  0  1  0  1  0  0  0  1  0  0  1  0  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (v8)  BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (v8)  AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d a6 cd 04 7f 9d 7a 8f]

    # VS1 (+1)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS2 (+1)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # MASK (+1)       = [ 1  0  1  0  0  1  1  1  0  1  1  1  1  1  0  1  0  0  1  0  0  0  0  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+1) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+1) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS1 (+2)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS2 (+2)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # MASK (+2)       = [ 0  0  1  0  0  1  0  0  1  0  0  1  0  1  0  0  0  0  0  1  0  1  0  1  0  0  0  0  0  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+2) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+2) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS1 (+3)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS2 (+3)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # MASK (+3)       = [ 1  0  1  0  0  1  1  0  1  1  1  1  0  1  1  0  0  1  1  1  1  0  1  0  0  1  1  1  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+3) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+3) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS1 (+4)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS2 (+4)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # MASK (+4)       = [ 1  1  1  1  0  0  0  0  1  1  1  0  1  1  0  1  1  0  1  0  0  1  0  0  1  1  0  1  1  0  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+4) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+4) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    # VS1 (+5)       = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]

    # VS2 (+5)       = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # MASK (+5)       = [ 1  0  1  0  1  0  0  1  0  0  0  1  1  0  0  0  1  1  0  0  0  1  1  0  1  0  1  1  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+5) BEFORE = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # VD (+5) AFTER  = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]

    # VS1 (+6)       = [95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c]

    # VS2 (+6)       = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # MASK (+6)       = [ 1  0  0  1  1  1  1  1  0  0  0  1  0  0  1  0  0  0  0  0  1  1  1  1  0  1  1  1  0  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+6) BEFORE = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]
    # VD (+6) AFTER  = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]

    # VS1 (+7)       = [99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8]

    # VS2 (+7)       = [31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5]
    # MASK (+7)       = [ 1  1  0  0  1  0  0  0  0  1  1  0  1  0  1  1  0  0  1  0  1  1  1  0  0  0  1  1  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm mm ff mm ff mm]
    # VD (+7) BEFORE = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]
    # VD (+7) AFTER  = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]


    
    
    vaaddu.vv v8, v24, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f9d7a8f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8da6cd04)
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
    la x6, test_1_data+180
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 8, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v24)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]

    # VS2 (v8)        = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (v0)  AFTER  = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8b 64 94 78 a7 23]

    # VS1 (+1)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]

    # VS2 (+1)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+1) BEFORE = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # VD (+1) AFTER  = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]

    # VS1 (+2)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]

    # VS2 (+2)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+2) BEFORE = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # VD (+2) AFTER  = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]

    # VS1 (+3)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]

    # VS2 (+3)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+3) BEFORE = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # VD (+3) AFTER  = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # VS1 (+4)       = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]

    # VS2 (+4)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+4) BEFORE = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # VD (+4) AFTER  = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]

    # VS1 (+5)       = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]

    # VS2 (+5)       = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+5) BEFORE = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # VD (+5) AFTER  = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]

    # VS1 (+6)       = [4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e]

    # VS2 (+6)       = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+6) BEFORE = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]
    # VD (+6) AFTER  = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]

    # VS1 (+7)       = [7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f]

    # VS2 (+7)       = [0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (+7) BEFORE = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]
    # VD (+7) AFTER  = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]


    
    
    vaaddu.vv v0, v8, v24
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9478a723)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8b64)
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

