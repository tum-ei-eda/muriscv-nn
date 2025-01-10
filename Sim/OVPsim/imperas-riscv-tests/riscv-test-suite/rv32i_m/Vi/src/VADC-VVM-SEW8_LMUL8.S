// RISC-V Architectural Validation Test VADC-VVM-SEW8_LMUL8
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
// Description: Testing instruction 'vadc.vvm'.

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
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 8, LMUL = 8, Use Mask = 0, VL = 256\n")

    





    # VS1 (v8)        = [e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27 15 1a 01 ef]

    # VS2 (v16)       = [c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d]
    # VD (v24) AFTER  = [aa 56 a7 9f e7 86 1f 74 c1 f5 91 75 4f 37 42 62 b1 c9 6f 4e 62 bf 78 8f c9 f5 7c 64 9c 71 9f 17]

    # VS1 (+1)       = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]

    # VS2 (+1)       = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # VD (+1) AFTER  = [2b b8 b2 a5 0f 5c 06 90 14 16 dc a7 27 1e 43 2e 33 f5 a2 27 83 39 3a bb 61 f2 ed f9 ac 84 3a 59]

    # VS1 (+2)       = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]

    # VS2 (+2)       = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # VD (+2) AFTER  = [d4 81 dd 8b 34 20 2b 73 63 00 57 04 18 0b 9b d0 d0 f2 88 53 9d 3b cf 99 6e 15 da ce 6f a8 6e c9]

    # VS1 (+3)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]

    # VS2 (+3)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (+3) AFTER  = [bd fe 33 f4 0b 5e 74 ec 7a 24 27 57 99 f7 b9 09 00 fa 7c a2 50 bb c9 46 ec 95 be 26 26 cb da 2e]

    # VS1 (+4)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]

    # VS2 (+4)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+4) AFTER  = [1b 77 03 36 b6 ff 54 6e 4f 5c c8 fa eb 22 0e 20 e5 0f 19 9a f5 94 47 c4 99 ea ba 48 94 7d 5f 2d]

    # VS1 (+5)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS2 (+5)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+5) AFTER  = [1d b7 24 82 76 67 16 c9 29 ef 4d 46 8a 73 52 94 b1 4c 73 44 fe f5 f3 ab 53 9d f3 82 22 f9 e8 a7]

    # VS1 (+6)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS2 (+6)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+6) AFTER  = [9f 79 3c 40 85 dc ca fc 78 dc e6 58 d1 ac 82 11 be ae e2 93 69 e6 1e a9 d6 1b 46 7e 23 55 97 28]

    # VS1 (+7)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS2 (+7)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+7) AFTER  = [23 02 13 a7 80 34 cd de 88 fa 4c cb 42 e2 61 d2 a8 3c a1 85 1c c2 e2 1a 51 39 fa c4 47 65 13 a4]

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9c719f17)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9f57c64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62bf788f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb1c96f4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f374262)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc1f59175)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe7861f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xaa56a79f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac843a59)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x61f2edf9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83393abb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33f5a227)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x271e432e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1416dca7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0f5c0690)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2bb8b2a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6fa86ec9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6e15dace)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9d3bcf99)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd0f28853)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x180b9bd0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63005704)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34202b73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd481dd8b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x26cbda2e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xec95be26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50bbc946)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00fa7ca2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99f7b909)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a242757)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0b5e74ec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbdfe33f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x947d5f2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99eaba48)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf59447c4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe50f199a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeb220e20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f5cc8fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb6ff546e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1b770336)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x22f9e8a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x539df382)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfef5f3ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb14c7344)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8a735294)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x29ef4d46)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x766716c9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1db72482)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x23559728)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd61b467e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x69e61ea9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbeaee293)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1ac8211)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x78dce658)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x85dccafc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f793c40)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x476513a4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5139fac4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1cc2e21a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa83ca185)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x42e261d2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x88fa4ccb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8034cdde)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x230213a7)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+32
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e8,m8
    vle8.v v24, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m8
    vle8.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 250 # VL = 250
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 8, LMUL = 8, Use Mask = 0, VL = 250\n")

    





    # VS1 (v24)       = [7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51]

    # VS2 (v8)        = [06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65]
    # VD (v16) AFTER  = [83 39 3a ba 61 f3 ed fa ac 83 3a 59 aa 57 a8 9f e8 85 20 73 c2 f6 91 75 4e 37 42 63 b2 c9 70 4e]

    # VS1 (+1)       = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]

    # VS2 (+1)       = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # VD (+1) AFTER  = [9d 3b cf 99 6e 16 d9 ce 6e a8 6e c8 2b b9 b2 a5 10 5b 05 90 15 16 dc a6 27 1d 42 2f 33 f6 a3 26]

    # VS1 (+2)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]

    # VS2 (+2)       = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # VD (+2) AFTER  = [4f bc c9 47 ed 95 be 25 27 cb db 2d d4 81 de 8b 34 21 2b 73 62 00 57 03 18 0b 9a d1 d0 f1 89 53]

    # VS1 (+3)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]

    # VS2 (+3)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (+3) AFTER  = [f5 93 47 c3 98 ea ba 47 94 7c 5f 2d bd fe 33 f4 0c 5f 74 ed 7b 24 27 57 9a f8 b9 09 00 fb 7d a2]

    # VS1 (+4)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]

    # VS2 (+4)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+4) AFTER  = [fd f4 f4 ab 54 9d f2 82 22 f9 e9 a6 1a 77 04 36 b7 00 54 6d 4f 5c c7 fa ea 23 0e 20 e4 0f 1a 9a]

    # VS1 (+5)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]

    # VS2 (+5)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # VD (+5) AFTER  = [6a e6 1f a9 d7 1b 47 7f 23 54 97 28 1d b7 24 81 75 67 17 c9 29 ef 4e 46 8a 73 52 93 b1 4c 73 45]

    # VS1 (+6)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]

    # VS2 (+6)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (+6) AFTER  = [1b c2 e1 1b 52 38 f9 c5 47 65 13 a5 a0 79 3d 41 85 dc cb fc 78 db e6 58 d2 ab 82 12 bf af e2 94]

    # VS1 (+7)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]

    # VS2 (+7)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+7) AFTER  = [52 7e 81 e3 ea 35 2a b5 d9 0d 2e fe 22 01 12 a7 81 34 cd dd 88 fa 4d cb 42 e2 60 d2 a7 3b a0 85]

    

    vadc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2c9704e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e374263)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc2f69175)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe8852073)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xaa57a89f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac833a59)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x61f3edfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83393aba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33f6a326)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x271d422f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1516dca6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x105b0590)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2bb9b2a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ea86ec8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6e16d9ce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9d3bcf99)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd0f18953)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x180b9ad1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62005703)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34212b73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd481de8b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27cbdb2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xed95be25)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fbcc947)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00fb7da2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9af8b909)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b242757)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c5f74ed)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbdfe33f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x947c5f2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x98eaba47)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf59347c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe40f1a9a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea230e20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f5cc7fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb700546d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1a770436)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x22f9e9a6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x549df282)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfdf4f4ab)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb14c7345)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8a735293)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x29ef4e46)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x756717c9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1db72481)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x23549728)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd71b477f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ae61fa9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbfafe294)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd2ab8212)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x78dbe658)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x85dccbfc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa0793d41)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x476513a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5238f9c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1bc2e11b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa73ba085)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x42e260d2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x88fa4dcb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8134cddd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x220112a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd90d2efe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea352ab5)
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
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 8, Use Mask = 0, VL = 208\n")

    





    # VS1 (v16)       = [fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f]

    # VS2 (v24)       = [19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]
    # VD (v8)  AFTER  = [14 15 dd a7 27 1e 42 2e 33 f5 a3 27 83 38 3a ba 61 f2 ec f9 ad 84 3a 59 ab 57 a7 9f e7 86 1f 73]

    # VS1 (+1)       = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]

    # VS2 (+1)       = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # VD (+1) AFTER  = [62 00 58 04 18 0a 9b d0 d0 f2 89 52 9d 3b cf 9a 6e 16 d9 ce 6f a8 6f c9 2b b9 b3 a6 0f 5c 05 90]

    # VS1 (+2)       = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]

    # VS2 (+2)       = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # VD (+2) AFTER  = [7a 24 27 58 99 f8 b9 08 ff fa 7d a1 4f bc c9 46 ec 95 bf 26 27 cb db 2d d5 81 dd 8c 35 20 2a 74]

    # VS1 (+3)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]

    # VS2 (+3)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (+3) AFTER  = [4e 5d c8 fa eb 22 0e 20 e4 0e 19 9a f5 94 47 c3 98 ea b9 48 93 7d 5f 2c be ff 32 f4 0b 5e 74 ec]

    # VS1 (+4)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]

    # VS2 (+4)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+4) AFTER  = [28 f0 4e 46 89 73 52 94 b2 4c 72 45 fe f5 f3 ac 53 9c f3 83 22 f9 e8 a6 1b 77 03 36 b6 ff 55 6d]

    # VS1 (+5)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS2 (+5)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+5) AFTER  = [79 db e6 59 d1 ab 81 11 be ae e2 93 6a e6 1e a9 d6 1c 47 7e 22 55 97 27 1c b7 24 82 76 67 17 c8]

    # VS1 (+6)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS2 (+6)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+6) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 52 39 fa c5 47 64 13 a5 a0 7a 3c 40 85 dc ca fd]

    # VS1 (+7)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS2 (+7)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+7) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    

    vadc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe7861f73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xab57a79f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad843a59)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x61f2ecf9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83383aba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x33f5a327)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x271e422e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1415dda7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0f5c0590)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2bb9b3a6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6fa86fc9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6e16d9ce)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9d3bcf9a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd0f28952)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x180a9bd0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62005804)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x35202a74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd581dd8c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27cbdb2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xec95bf26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fbcc946)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffa7da1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x99f8b908)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7a242758)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0b5e74ec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbeff32f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x937d5f2c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x98eab948)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf59447c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe40e199a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeb220e20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4e5dc8fa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb6ff556d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1b770336)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x22f9e8a6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x539cf383)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfef5f3ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb24c7245)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89735294)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x28f04e46)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x766717c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1cb72482)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x22559727)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd61c477e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ae61ea9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbeaee293)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1ab8111)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x79dbe659)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x85dccafd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa07a3c40)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x476413a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5239fac5)
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
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+96
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
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

    li  x7, 166 # VL = 166
    vsetvli x6, x7, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 8, LMUL = 8, Use Mask = 0, VL = 166\n")

    





    # VS1 (v8)        = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]

    # VS2 (v16)       = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]
    # VD (v24) AFTER  = [6e a8 6e c9 2a b8 b3 a5 0f 5b 06 91 14 15 dd a7 28 1d 43 2e 32 f6 a2 26 83 39 3a bb 62 f3 ec fa]

    # VS1 (+1)       = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]

    # VS2 (+1)       = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # VD (+1) AFTER  = [27 cc da 2e d4 81 dd 8b 35 20 2a 74 63 00 57 03 17 0a 9b d1 cf f2 89 52 9c 3b ce 9a 6e 15 d9 cd]

    # VS1 (+2)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]

    # VS2 (+2)       = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # VD (+2) AFTER  = [93 7c 5f 2d be fe 32 f4 0c 5f 75 ed 7b 25 26 57 9a f7 b9 08 00 fa 7c a1 50 bc c8 47 ec 95 be 26]

    # VS1 (+3)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]

    # VS2 (+3)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (+3) AFTER  = [22 f8 e9 a7 1a 78 04 36 b7 ff 55 6e 4f 5d c8 fb ea 23 0e 20 e4 0e 19 99 f5 94 48 c4 98 e9 b9 48]

    # VS1 (+4)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]

    # VS2 (+4)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+4) AFTER  = [23 55 96 27 1d b7 23 81 75 66 17 c9 29 ef 4e 47 89 72 52 94 b2 4c 72 44 fd f4 f4 ac 53 9c f2 82]

    # VS1 (+5)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]

    # VS2 (+5)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # VD (+5) AFTER  = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 1e a9 d7 1b 46 7e]

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

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f3ecfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83393abb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x32f6a226)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x281d432e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1415dda7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0f5b0691)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2ab8b3a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ea86ec9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6e15d9cd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9c3bce9a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcff28952)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x170a9bd1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63005703)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x35202a74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd481dd8b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27ccda2e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xec95be26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x50bcc847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00fa7ca1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9af7b908)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7b252657)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0c5f75ed)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbefe32f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x937c5f2d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x98e9b948)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf59448c4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe40e1999)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xea230e20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f5dc8fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7ff556e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1a780436)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x22f8e9a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x539cf282)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfdf4f4ac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb24c7244)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x89725294)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x29ef4e47)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x756617c9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1db72381)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x23559627)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd71b467e)
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
    la x2, test_1_data+48
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)      # Load value into vs1
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

    li  x8, 128 # VL = 128
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 8, Use Mask = 0, VL = 128\n")

    





    # VS1 (v24)       = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]

    # VS2 (v8)        = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]
    # VD (v16) AFTER  = [cf f2 88 53 9d 3a cf 9a 6e 15 d9 cd 6f a7 6e c8 2a b9 b3 a5 0f 5c 06 91 15 15 dc a6 27 1e 43 2f]

    # VS1 (+1)       = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]

    # VS2 (+1)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # VD (+1) AFTER  = [ff fa 7d a2 50 bb c8 46 ec 95 bf 26 26 cc da 2d d5 81 de 8c 35 20 2a 73 63 00 58 03 17 0b 9a d1]

    # VS1 (+2)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]

    # VS2 (+2)       = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # VD (+2) AFTER  = [e4 0f 1a 99 f5 93 47 c3 98 ea ba 48 93 7d 5f 2d be ff 32 f4 0b 5e 74 ed 7b 24 27 57 99 f7 ba 08]

    # VS1 (+3)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]

    # VS2 (+3)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (+3) AFTER  = [b2 4b 72 45 fd f5 f3 ac 53 9c f2 83 23 f9 e9 a6 1b 77 03 35 b6 00 55 6d 4e 5c c8 fa ea 22 0e 21]

    # VS1 (+4)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS2 (+4)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+4) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS1 (+5)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS2 (+5)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+5) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS1 (+6)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS2 (+6)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+6) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS1 (+7)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS2 (+7)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+7) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    

    vadc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x271e432f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1515dca6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0f5c0691)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2ab9b3a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6fa76ec8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6e15d9cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9d3acf9a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcff28853)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x170b9ad1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63005803)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35202a73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd581de8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x26ccda2d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xec95bf26)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50bbc846)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffa7da2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99f7ba08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7b242757)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b5e74ed)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbeff32f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x937d5f2d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98eaba48)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf59347c3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe40f1a99)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea220e21)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4e5cc8fa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb600556d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1b770335)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x23f9e9a6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x539cf283)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfdf5f3ac)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb24b7245)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+160
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
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

    li  x8, 105 # VL = 105
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 8, Use Mask = 0, VL = 105\n")

    





    # VS1 (v16)       = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]

    # VS2 (v24)       = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # VD (v8)  AFTER  = [34 20 2a 74 62 01 58 04 18 0a 9b d0 cf f1 89 52 9d 3b cf 9a 6f 15 da ce 6e a7 6e c9 2b b8 b3 a5]

    # VS1 (+1)       = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]

    # VS2 (+1)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # VD (+1) AFTER  = [0b 5e 74 ec 7b 24 27 58 99 f8 b9 09 ff fb 7d a1 50 bc c9 46 ed 95 be 26 27 cb da 2d d5 81 dd 8b]

    # VS1 (+2)       = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]

    # VS2 (+2)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # VD (+2) AFTER  = [b6 00 54 6d 4f 5c c7 fa ea 23 0e 20 e4 0f 1a 99 f5 93 47 c3 98 ea b9 48 94 7d 60 2d bd ff 33 f4]

    # VS1 (+3)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # VS2 (+3)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (+3) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee 82 23 f8 e9 a7 1a 78 03 36]

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

    

    vadc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2bb8b3a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6ea76ec9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f15dace)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9d3bcf9a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcff18952)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x180a9bd0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62015804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34202a74)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd581dd8b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x27cbda2d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xed95be26)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50bcc946)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffb7da1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99f8b909)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7b242758)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b5e74ec)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbdff33f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x947d602d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98eab948)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf59347c3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe40f1a99)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea230e20)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f5cc7fa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb600546d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1a780336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x23f8e9a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeee82)
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

    li  x8, 78 # VL = 78
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 8, Use Mask = 0, VL = 78\n")

    





    # VS1 (v8)        = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]

    # VS2 (v16)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # VD (v24) AFTER  = [ec 95 be 25 26 cb db 2d d4 81 de 8b 35 20 2b 74 63 00 57 03 18 0b 9a d1 d0 f2 89 53 9d 3a cf 9a]

    # VS1 (+1)       = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]

    # VS2 (+1)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # VD (+1) AFTER  = [99 ea ba 47 93 7c 5f 2c be ff 33 f4 0c 5e 74 ed 7a 24 26 57 9a f7 b9 09 ff fa 7d a1 50 bc c8 46]

    # VS1 (+2)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]

    # VS2 (+2)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # VD (+2) AFTER  = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 c8 fb eb 23 0e 21 e4 0f 19 9a f5 93 48 c3]

    # VS1 (+3)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS2 (+3)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (+3) AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS1 (+4)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS2 (+4)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+4) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS1 (+5)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS2 (+5)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+5) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS1 (+6)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS2 (+6)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+6) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS1 (+7)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS2 (+7)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+7) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9d3acf9a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd0f28953)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x180b9ad1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63005703)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35202b74)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd481de8b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x26cbdb2d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xec95be25)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50bcc846)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffa7da1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9af7b909)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7a242657)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0c5e74ed)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbeff33f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x937c5f2c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99eaba47)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf59348c3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe40f199a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xeb230e21)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5c8fb)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+224
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x2)      # Load value into vs1
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

    li  x8, 64 # VL = 64
    vsetvli x3, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 8, Use Mask = 0, VL = 64\n")

    





    # VS1 (v24)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]

    # VS2 (v8)        = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # VD (v16) AFTER  = [99 f7 b9 08 00 fb 7c a1 50 bc c8 46 ed 94 be 26 27 cc da 2e d4 81 de 8b 35 21 2a 73 63 00 57 03]

    # VS1 (+1)       = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]

    # VS2 (+1)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # VD (+1) AFTER  = [ea 22 0f 21 e5 0e 1a 9a f6 93 47 c4 99 e9 ba 48 93 7c 60 2d be ff 32 f5 0c 5f 74 ed 7b 25 26 57]

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

    

    vadc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63005703)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35212a73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd481de8b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x27ccda2e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xed94be26)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x50bcc846)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00fb7ca1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99f7b908)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7b252657)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0c5f74ed)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbeff32f5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x937c602d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x99e9ba48)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf69347c4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe50e1a9a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xea220f21)
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

    li  x4, 57 # VL = 57
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 8, Use Mask = 0, VL = 57\n")

    





    # VS1 (v16)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]

    # VS2 (v24)       = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (v8)  AFTER  = [be fe 32 f4 0c 5e 75 ed 7b 25 27 58 9a f8 b9 08 00 fa 7d a1 50 bc c8 47 ec 94 be 26 26 cc da 2e]

    # VS1 (+1)       = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]

    # VS2 (+1)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+1) AFTER  = [0b 56 ed 8c 17 a2 fb 6d 4e 5c c7 fb ea 22 0e 21 e5 0e 19 99 f5 93 47 c4 99 ea ba 47 94 7c 5f 2d]

    # VS1 (+2)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS2 (+2)       = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # VD (+2) AFTER  = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS1 (+3)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS2 (+3)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (+3) AFTER  = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS1 (+4)       = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS2 (+4)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+4) AFTER  = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS1 (+5)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    # VS2 (+5)       = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # VD (+5) AFTER  = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS1 (+6)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]

    # VS2 (+6)       = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # VD (+6) AFTER  = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS1 (+7)       = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]

    # VS2 (+7)       = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # VD (+7) AFTER  = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]

    

    vadc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x26ccda2e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xec94be26)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x50bcc847)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00fa7da1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9af8b908)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7b252758)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0c5e75ed)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbefe32f4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x947c5f2d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x99eaba47)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf59347c4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe50e1999)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea220e21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e5cc7fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2fb6d)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+288
    vle8.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
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

    li  x4, 41 # VL = 41
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 8, Use Mask = 0, VL = 41\n")

    





    # VS1 (v8)        = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]

    # VS2 (v16)       = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (v24) AFTER  = [f5 93 48 c3 98 ea b9 47 94 7d 60 2c bd fe 32 f4 0b 5f 75 ec 7a 25 26 58 9a f7 b9 08 00 fb 7c a1]

    # VS1 (+1)       = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]

    # VS2 (+1)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+1) AFTER  = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 fa ea 22 0f 21 e5 0e 19 99]

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

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00fb7ca1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9af7b908)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7a252658)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b5f75ec)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbdfe32f4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x947d602c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x98eab947)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf59348c3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe50e1999)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea220f21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d508fa)
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
    vle8.v v24, (x2)      # Load value into vs1
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

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 8, Use Mask = 0, VL = 32\n")

    





    # VS1 (v24)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]

    # VS2 (v8)        = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (v16) AFTER  = [4f 5d c7 fb eb 23 0f 21 e5 0f 19 99 f6 93 48 c3 99 ea b9 48 94 7d 60 2d be ff 33 f4 0b 5e 74 ed]

    # VS1 (+1)       = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]

    # VS2 (+1)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+1) AFTER  = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]

    # VS1 (+2)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS2 (+2)       = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # VD (+2) AFTER  = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]

    # VS1 (+3)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS2 (+3)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (+3) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]

    # VS1 (+4)       = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS2 (+4)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+4) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]

    # VS1 (+5)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    # VS2 (+5)       = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # VD (+5) AFTER  = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]

    # VS1 (+6)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]

    # VS2 (+6)       = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # VD (+6) AFTER  = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]

    # VS1 (+7)       = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # VS2 (+7)       = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # VD (+7) AFTER  = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]

    

    vadc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b5e74ed)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbeff33f4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x947d602d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x99eab948)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf69348c3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe50f1999)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xeb230f21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4f5dc7fb)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+352
    vle8.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
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

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 8, Use Mask = 0, VL = 23\n")

    





    # VS1 (v16)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]

    # VS2 (v24)       = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (v8)  AFTER  = [48 46 05 f6 0b 56 ed 8c 17 00 55 6d 4f 5d c8 fa ea 23 0e 21 e5 0f 1a 99 f6 93 47 c4 98 ea b9 47]

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

    

    vadc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x98eab947)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf69347c4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe50f1a99)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea230e21)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4f5dc8fa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1700556d)
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
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 8, Use Mask = 0, VL = 16\n")

    





    # VS1 (v8)        = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]

    # VS2 (v16)       = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (v24) AFTER  = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 1a 78 04 35 b6 00 54 6d 4f 5c c8 fa ea 22 0f 20]

    # VS1 (+1)       = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]

    # VS2 (+1)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+1) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]

    # VS1 (+2)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS2 (+2)       = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # VD (+2) AFTER  = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]

    # VS1 (+3)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS2 (+3)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (+3) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]

    # VS1 (+4)       = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS2 (+4)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+4) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]

    # VS1 (+5)       = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    # VS2 (+5)       = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # VD (+5) AFTER  = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]

    # VS1 (+6)       = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]

    # VS2 (+6)       = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # VD (+6) AFTER  = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # VS1 (+7)       = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]

    # VS2 (+7)       = [4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # VD (+7) AFTER  = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea220f20)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4f5cc8fa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb600546d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1a780435)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+416
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e8,m8
    vle8.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m8
    vle8.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 8, Use Mask = 0, VL = 10\n")

    





    # VS1 (v24)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]

    # VS2 (v8)        = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (v16) AFTER  = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae f2 83 22 f9 e9 a7 1b 78 03 36]

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

    

    vadc.vvm v16, v8, v24, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1b780336)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22f9e9a7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aef283)
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
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 8, Use Mask = 0, VL = 8\n")

    





    # VS1 (v16)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]

    # VS2 (v24)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (v8)  AFTER  = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 b1 4c 72 44 fe f4 f4 ab]

    # VS1 (+1)       = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # VS2 (+1)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+1) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]

    # VS1 (+2)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]

    # VS2 (+2)       = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+2) BEFORE = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # VD (+2) AFTER  = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]

    # VS1 (+3)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]

    # VS2 (+3)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+3) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (+3) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]

    # VS1 (+4)       = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]

    # VS2 (+4)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+4) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+4) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]

    # VS1 (+5)       = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]

    # VS2 (+5)       = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+5) BEFORE = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # VD (+5) AFTER  = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]

    # VS1 (+6)       = [95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c]

    # VS2 (+6)       = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+6) BEFORE = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]
    # VD (+6) AFTER  = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]

    # VS1 (+7)       = [99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8]

    # VS2 (+7)       = [31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+7) BEFORE = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]
    # VD (+7) AFTER  = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]

    

    vadc.vvm v8, v24, v16, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfef4f4ab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb14c7244)
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
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+480
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
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

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e8,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 8, Use Mask = 0, VL = 6\n")

    





    # VS1 (v8)        = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]

    # VS2 (v16)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff]
    # VD (v24) BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (v24) AFTER  = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 16 c9 28 f0 4d 47]

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

    

    vadc.vvm v24, v16, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x28f04d47)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b16c9)
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

