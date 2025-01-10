// RISC-V Architectural Validation Test VNMSAC-VX-SEW8_LMUL2
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
//    SEW=8, LMUL=2
// Description: Testing instruction 'vnmsac.vx'.

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
    vsetvli x0, x7, e8,m2
    vle8.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d 86 56 9d 27]
    # MASK (v0)       = [ 0  0  0  1  0  1  0  1  0  0  0  1  1  0  1  0  0  0  0  0  0  0  0  1  1  1  1  0  1  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (v30) BEFORE = [e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d]
    # VD (v30) AFTER  = [e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd 20 21 9a 51 42 9e de 3d]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e]
    # MASK (+1)       = [ 1  0  0  0  0  1  1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  1  0  0  1  1  1]
    # ELEMENTS          [mm mm mm ff mm ff mm ff mm mm mm ff ff mm ff mm mm mm mm mm mm mm mm ff ff ff ff mm ff ff ff ff]
    # VD (+1) BEFORE = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # VD (+1) AFTER  = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]


    
    vnmsac.vx v30, x31, v16, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x30, 0
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")

    





    # RS1  (x30)       = 0

    # VS2 (v18)       = [06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65 91 a8 d5 fd]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v28) BEFORE = [2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65]
    # VD (v28) AFTER  = [2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64 04 66 25 0f bd 8f 6c 65]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # VD (+1) AFTER  = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]


    
    vnmsac.vx v28, x30, v18



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
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
    vsetvli x0, x7, e8,m2
    vle8.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v26, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")

    





    # RS1  (x29)       = -2047

    # VS2 (v20)       = [19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a e3 1f fa 64]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  0  1  0  1  1  1  0  0  0  0  0  0  0  1  1  1  1  1  1  0  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (v26) BEFORE = [f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db e5 4c 8c 1e c7 37 ad 3a]
    # VD (v26) AFTER  = [f6 00 41 12 19 a1 62 bf cf ba b2 a0 26 63 c8 47 06 92 da df 97 5a d4 bd 1e 15 8c e4 c7 18 ad 3a]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  0  1  1  1  0  1  1  1  1  0  1  0  1  1  1  1  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [mm mm ff ff mm ff mm mm ff mm ff ff ff mm mm mm mm mm mm mm ff ff ff ff ff ff mm ff mm ff mm mm]
    # VD (+1) BEFORE = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # VD (+1) AFTER  = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a e5 06 37 50 20 34 b8 0f d4]


    
    vnmsac.vx v26, x29, v20, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v26, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc718ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1e158ce4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x975ad4bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2663c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcfbab2a0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x19a162bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6004112)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b80fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x06375020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34267ae5)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x28, -1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v22, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # RS1  (x28)       = -1

    # VS2 (v22)       = [3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df 7c a6 60 db]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7 2c 63 c8 47 06 92 da df]
    # VD (v24) AFTER  = [6e 15 d9 cd 6e a7 6e c8 2a b8 b2 a5 0f 5b 05 90 14 15 dc a6 27 1d 42 2e 32 f5 a2 26 82 38 3a ba]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # VD (+1) AFTER  = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]


    
    vnmsac.vx v24, x28, v22



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x82383aba)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x32f5a226)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x271d422e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1415dca6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0f5b0590)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2ab8b2a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ea76ec8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6e15d9cd)
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
    vsetvli x0, x8, e8,m2
    vle8.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # RS1  (x27)       = -4660

    # VS2 (v24)       = [67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf fb ba 7a e7]
    # MASK (v0)       = [ 0  1  0  1  1  0  1  1  0  0  0  0  1  0  0  0  0  1  1  0  0  1  1  1  1  0  0  0  0  1  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (v22) BEFORE = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4 f6 00 a3 d1 19 5b 62 bf]
    # VD (v22) AFTER  = [b0 2d 66 3e 67 dd 34 92 68 14 54 c0 fc 26 7a d9 3a 4f 6b f4 34 b8 2b 48 0a 00 a3 d1 19 23 2a ab]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e]
    # MASK (+1)       = [ 0  0  1  1  1  0  0  0  0  1  1  1  0  1  0  0  1  1  1  1  1  0  0  0  1  0  1  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm mm mm ff mm mm mm mm ff ff mm mm ff ff ff ff mm mm mm mm ff ff ff]
    # VD (+1) BEFORE = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # VD (+1) AFTER  = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]


    
    vnmsac.vx v22, x27, v24, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x19232aab)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0a00a3d1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b82b48)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3a4f6bf4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc267ad9)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x26, 2147483648
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # RS1  (x26)       = 2147483648

    # VS2 (v26)       = [82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4 34 b8 0f d4]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v20) BEFORE = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]
    # VD (v20) AFTER  = [52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0 34 26 7a d9 3a ef 5f f4]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # VD (+1) AFTER  = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]


    
    vnmsac.vx v20, x26, v26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    vsetvli x0, x8, e8,m2
    vle8.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # RS1  (x25)       = 4660

    # VS2 (v28)       = [18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92 68 14 54 c0]
    # MASK (v0)       = [ 0  1  0  0  0  0  1  0  0  1  1  0  1  0  1  1  1  0  0  0  1  1  0  1  1  1  1  1  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff ff ff ff ff mm ff ff]
    # VD (v18) BEFORE = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5 b0 2d 66 3e 67 dd 34 92]
    # VD (v18) AFTER  = [37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 2d c4 49 d6 96 47 dd 24 92]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71]
    # MASK (+1)       = [ 1  1  1  0  0  0  0  0  1  1  1  0  1  0  0  1  0  0  0  0  1  0  0  1  0  0  1  0  1  1  0  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff ff ff ff ff ff mm ff ff]
    # VD (+1) BEFORE = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # VD (+1) AFTER  = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]


    
    vnmsac.vx v18, x25, v28, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47dd2492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc449d696)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f12d)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x24, 4294967295
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # RS1  (x24)       = 4294967295

    # VS2 (v30)       = [d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae b2 d3 f1 c5]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (v16) BEFORE = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 52 33 a4 dd 82 4d 39 ae]
    # VD (v16) AFTER  = [a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50 d4 80 dd 8b 34 20 2a 73]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # VD (+1) AFTER  = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]


    
    vnmsac.vx v16, x24, v30



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34202a73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd480dd8b)
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
    vsetvli x0, x4, e8,m2
    vle8.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # RS1  (x23)       = 1

    # VS2 (v2)        = [5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5 d4 98 36 50]
    # MASK (v0)       = [ 1  0  0  0  1  0  1  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  0  0  0  1  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm ff mm ff]
    # VD (v14) BEFORE = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 71 18 fc 88 d5]
    # VD (v14) AFTER  = [38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30 37 bf 40 9c 18 64 88 85]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5]
    # MASK (+1)       = [ 0  1  0  0  1  1  1  0  0  0  0  1  0  0  0  1  1  0  0  0  0  0  0  1  1  1  1  0  1  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff mm ff mm ff]
    # VD (+1) BEFORE = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # VD (+1) AFTER  = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]


    
    vnmsac.vx v14, x23, v2, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18648885)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf409c)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x22, 2147483647
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # RS1  (x22)       = 2147483647

    # VS2 (v0)        = [95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8 c8 3b 3c 30]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff]
    # VD (v12) BEFORE = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f d1 bc 7d d8]
    # VD (v12) AFTER  = [4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d a9 68 a9 7f 99 f7 b9 08]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff]
    # VD (+1) BEFORE = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # VD (+1) AFTER  = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]


    
    vnmsac.vx v12, x22, v0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x99f7b908)
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
    vsetvli x0, x4, e8,m2
    vle8.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # RS1  (x21)       = 124076833

    # VS2 (v4)        = [b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87 62 f6 cb 6d]
    # MASK (v0)       = [ 1  1  0  1  1  1  1  1  1  1  0  0  1  0  1  0  1  1  0  1  1  1  1  1  1  1  1  0  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff]
    # VD (v10) BEFORE = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 87]
    # VD (v10) AFTER  = [03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2 38 74 f8 a5 5b 08 67 7a]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b]
    # MASK (+1)       = [ 0  0  1  1  1  0  1  1  1  1  1  0  0  0  0  0  0  0  0  1  0  1  0  1  0  1  0  0  1  1  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- mm ff]
    # VD (+1) BEFORE = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # VD (+1) AFTER  = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]


    
    vnmsac.vx v10, x21, v4, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b08677a)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x20, 2048
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # RS1  (x20)       = 2048

    # VS2 (v6)        = [0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21 60 75 c1 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --]
    # VD (v8)  BEFORE = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]
    # VD (v8)  AFTER  = [48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8 4f f0 93 78 95 1e 86 21]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --]
    # VD (+1) BEFORE = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # VD (+1) AFTER  = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]


    
    vnmsac.vx v8, x20, v6



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
    vsetvli x0, x8, e8,m2
    vle8.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v6, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")

    





    # RS1  (x19)       = 0

    # VS2 (v8)        = [fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52 9b 32 7b a8]
    # MASK (v0)       = [ 0  0  1  1  0  1  0  1  0  1  0  1  1  1  1  0  0  1  1  0  0  1  0  0  1  0  1  0  0  0  1  0]
    # ELEMENTS          [mm mm ff ff mm ff mm ff mm ff mm ff ff ff ff mm mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (v6)  BEFORE = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]
    # VD (v6)  AFTER  = [8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a 03 d5 08 1b b3 2a 4c 52]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04]
    # MASK (+1)       = [ 1  0  0  1  0  1  0  1  1  0  1  0  0  1  1  1  0  1  0  0  0  1  0  1  0  1  0  0  0  1  0  1]
    # ELEMENTS          [mm mm ff ff mm ff mm ff mm ff mm ff ff ff ff mm mm ff ff mm mm ff mm mm ff mm ff mm mm mm ff mm]
    # VD (+1) BEFORE = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # VD (+1) AFTER  = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]


    
    vnmsac.vx v6, x19, v8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m2
    vse8.v v6, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x18, 2047
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v10, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")

    





    # RS1  (x18)       = 2047

    # VS2 (v10)       = [da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c 17 a2 fb 1a]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v4)  BEFORE = [42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5 48 46 05 f6 0b 56 ed 8c]
    # VD (v4)  AFTER  = [1c b7 23 81 75 66 16 c8 28 ef 4d 46 89 72 51 93 b1 4b 72 44 fd f4 f3 ab 53 9c f2 82 22 f8 e8 a6]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # VD (+1) AFTER  = [0c c9 d6 c8 93 b0 66 fc 78 db e5 58 d1 ab 81 11 be ae e1 93 69 e5 1e a8 d6 1b 46 7e 22 54 96 27]


    
    vnmsac.vx v4, x18, v10



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m2
    vse8.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22f8e8a6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x539cf282)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfdf4f3ab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb14b7244)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x89725193)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x28ef4d46)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x756616c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1cb72381)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22549627)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd61b467e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69e51ea8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbeaee193)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1ab8111)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x78dbe558)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b066fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
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
    vsetvli x0, x8, e8,m2
    vle8.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")

    





    # RS1  (x17)       = -1

    # VS2 (v12)       = [f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f b5 ae ee b5]
    # MASK (v0)       = [ 1  1  0  0  0  0  0  1  1  0  0  0  0  0  0  0  1  0  0  1  0  1  0  0  0  1  0  0  1  0  1  0]
    # ELEMENTS          [ff ff mm mm mm mm mm ff ff mm mm mm mm mm mm mm ff mm mm ff mm ff mm mm mm ff mm mm ff mm ff mm]
    # VD (v2)  BEFORE = [73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42 8d d5 cd 04 fc 9d 84 8f]
    # VD (v2)  AFTER  = [69 e5 e1 56 f6 32 3d 7e 22 e9 09 2c 42 6b 8d fb 75 4c 96 c8 9b ef 80 42 8d 72 cd 04 b1 9d 72 8f]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56]
    # MASK (+1)       = [ 1  0  1  0  0  1  1  1  0  1  1  1  1  1  0  1  0  0  1  0  0  0  0  1  1  1  1  1  0  1  0  0]
    # ELEMENTS          [ff ff mm mm mm mm mm ff ff mm mm mm mm mm mm mm ff mm mm ff mm ff mm mm mm ff mm mm ff mm ff mm]
    # VD (+1) BEFORE = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # VD (+1) AFTER  = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 58 d1 ab 81 11 4b ae 00 3d]


    
    vnmsac.vx v2, x17, v12, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m2
    vse8.v v2, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb19d728f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8d72cd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9bef8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x754c96c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x22e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d7e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69e5e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bae003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1ab8111)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6458)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x16, 1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v14, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e8,m2
    vle8.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # RS1  (x16)       = 1

    # VS2 (v14)       = [86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86 9b 1a 80 42]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c 42 6b 8d fb da 4c 96 86]
    # VD (v0)  AFTER  = [6c 7b e3 b0 3b b5 81 97 d8 48 1f e7 7d 81 a4 04 16 49 34 26 9e 7e 7c 31 68 1f f7 75 3f 32 16 44]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # VD (+1) AFTER  = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]


    
    vnmsac.vx v0, x16, v14



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m2
    vse8.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f321644)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681ff775)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9e7e7c31)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x16493426)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7d81a404)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd8481fe7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3bb58197)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6c7be3b0)
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle8.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x15, 0
    la x2, test_1_data+192
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v30, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # RS1  (x15)       = 0

    # VS2 (v16)       = [0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52 e0 e9 09 2c]
    # MASK (v0)       = [ 0  1  1  0  1  0  1  1  0  0  1  1  1  1  0  0  0  0  0  0  0  1  0  0  1  1  1  0  0  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm ff ff ff ff mm mm mm mm mm mm mm ff mm mm ff ff ff mm mm ff mm ff]
    # VD (v30) BEFORE = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]
    # VD (v30) AFTER  = [3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d 73 b3 e1 56 f6 32 3d 52]

    # RS1  (x15)       = 0

    # VS2 (+1)       = [8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc]
    # MASK (+1)       = [ 1  1  0  0  1  0  0  0  0  1  0  0  1  1  1  0  1  1  0  1  0  1  0  0  1  1  0  0  0  1  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm ff ff ff ff mm mm mm mm mm mm mm ff mm mm ff ff ff mm mm ff mm ff]
    # VD (+1) BEFORE = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # VD (+1) AFTER  = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]


    
    vnmsac.vx v30, x15, v16, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v30, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x14, 0
    la x2, test_1_data+204
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v18, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # RS1  (x14)       = 0

    # VS2 (v18)       = [05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4 4b fb 00 3d]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v28) BEFORE = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]
    # VD (v28) AFTER  = [a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78 f2 2b 64 84 86 b0 81 d4]

    # RS1  (x14)       = 0

    # VS2 (+1)       = [ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # VD (+1) AFTER  = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]


    
    vnmsac.vx v28, x14, v18



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle8.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x13, -2047
    la x2, test_1_data+216
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # RS1  (x13)       = -2047

    # VS2 (v20)       = [e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8 93 b0 66 78]
    # MASK (v0)       = [ 1  0  0  1  1  0  0  0  0  1  1  1  1  1  1  1  0  0  1  0  0  0  1  0  1  0  1  1  1  1  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm ff mm ff ff ff ff mm ff]
    # VD (v26) BEFORE = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8 3b 9b 3d dc 0c c9 d6 c8]
    # VD (v26) AFTER  = [97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d 7f e8 2f 9b 67 14 79 19 d6 50]

    # RS1  (x13)       = -2047

    # VS2 (+1)       = [0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92]
    # MASK (+1)       = [ 0  1  1  1  0  1  0  0  0  1  0  1  0  0  0  1  0  0  1  0  1  0  0  1  0  0  0  0  0  1  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm ff mm ff ff ff ff mm ff]
    # VD (+1) BEFORE = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # VD (+1) AFTER  = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]


    
    vnmsac.vx v26, x13, v20, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7919d650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2f9b6714)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169d7fe8)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x12, -1
    la x2, test_1_data+228
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # RS1  (x12)       = -1

    # VS2 (v22)       = [4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32 16 9d bc e8]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (v24) BEFORE = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a2 16 7b 52 05 25 25 32]
    # VD (v24) AFTER  = [44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f a7 3b a0 84 1b c2 e1 1a]

    # RS1  (x12)       = -1

    # VS2 (+1)       = [47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # VD (+1) AFTER  = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]


    
    vnmsac.vx v24, x12, v22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1bc2e11a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa73ba084)
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle8.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x11, -4660
    la x2, test_1_data+240
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 8, LMUL = 2, Use Mask = 1, VL = 6\n")

    





    # RS1  (x11)       = -4660

    # VS2 (v24)       = [52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b 9f cb e5 7f]
    # MASK (v0)       = [ 1  0  0  1  1  1  0  1  1  1  0  0  1  1  1  0  1  1  0  0  1  1  0  0  1  0  1  1  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff mm mm mm ff]
    # VD (v22) BEFORE = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 65 92 e9 2f 67 4b]
    # VD (v22) AFTER  = [79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15 97 05 51 ce e9 2f 67 17]

    # RS1  (x11)       = -4660

    # VS2 (+1)       = [e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd]
    # MASK (+1)       = [ 1  1  1  0  0  0  0  1  1  0  0  1  1  1  0  1  1  0  0  0  0  0  1  1  1  0  0  0  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff mm mm mm ff]
    # VD (+1) BEFORE = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # VD (+1) AFTER  = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]


    
    vnmsac.vx v22, x11, v24, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f6717)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x970551ce)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x10, 2147483648
    la x2, test_1_data+252
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 8, LMUL = 2, Use Mask = 0, VL = 4\n")

    





    # RS1  (x10)       = 2147483648

    # VS2 (v26)       = [c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9 8b fc ad 15]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff]
    # VD (v20) BEFORE = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]
    # VD (v20) AFTER  = [24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19 44 5d a8 cc 4e 11 81 e9]

    # RS1  (x10)       = 2147483648

    # VS2 (+1)       = [66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff]
    # VD (+1) BEFORE = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # VD (+1) AFTER  = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]


    
    vnmsac.vx v20, x10, v26



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle8.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x9, 4660
    la x2, test_1_data+264
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 8, LMUL = 2, Use Mask = 1, VL = 2\n")

    





    # RS1  (x9)        = 4660

    # VS2 (v28)       = [c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3 ea 35 fe 19]
    # MASK (v0)       = [ 1  1  0  0  1  1  1  0  1  0  1  1  0  1  0  1  1  0  1  0  1  1  1  0  1  0  1  0  1  1  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm]
    # VD (v18) BEFORE = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e 81 e3]
    # VD (v18) AFTER  = [4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3 79 e9 10 dd 52 7e e9 e3]

    # RS1  (x9)        = 4660

    # VS2 (+1)       = [69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66]
    # MASK (+1)       = [ 1  0  0  0  1  1  0  0  1  1  1  1  0  1  1  0  1  0  1  0  0  0  0  1  1  1  0  0  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm]
    # VD (+1) BEFORE = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # VD (+1) AFTER  = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]


    
    vnmsac.vx v18, x9, v28, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527ee9e3)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    li x8, 4294967295
    la x2, test_1_data+276
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e8,m2
    vle8.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 8, LMUL = 2, Use Mask = 0, VL = 0\n")

    





    # RS1  (x8)        = 4294967295

    # VS2 (v30)       = [4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71 0b e7 93 b3]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --]
    # VD (v16) BEFORE = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]
    # VD (v16) AFTER  = [d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38 24 e0 65 8c c4 7c 5d 71]

    # RS1  (x8)        = 4294967295

    # VS2 (+1)       = [35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --]
    # VD (+1) BEFORE = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # VD (+1) AFTER  = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]


    
    vnmsac.vx v16, x8, v30



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m2
    vse8.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x7, 1
    la x2, test_1_data+288
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 64 # VL = 64
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")

    





    # RS1  (x7)        = 1

    # VS2 (v2)        = [df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae 47 c6 f6 38]
    # MASK (v0)       = [ 1  1  1  1  0  0  0  1  0  1  0  0  0  1  0  0  0  1  0  0  1  1  1  1  0  0  1  1  0  1  0  0]
    # ELEMENTS          [ff ff ff ff mm mm mm ff mm ff mm mm mm ff mm mm mm ff mm mm ff ff ff ff mm mm ff ff mm ff mm mm]
    # VD (v14) BEFORE = [3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c 4e d8 68 66 c3 a2 2e ae]
    # VD (v14) AFTER  = [5c 16 36 6e df ca df 22 66 c0 2e bf d7 fb 68 f0 4d f4 96 d5 98 de 39 b6 4e d8 3a b8 c3 dc 2e ae]

    # RS1  (x7)        = 1

    # VS2 (+1)       = [db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f]
    # MASK (+1)       = [ 0  0  0  0  1  0  0  1  1  0  0  1  1  0  1  0  0  1  0  0  1  1  1  1  1  0  0  0  1  1  1  0]
    # ELEMENTS          [ff ff ff ff mm mm mm ff mm ff mm mm mm ff mm mm mm ff mm mm ff ff ff ff mm mm ff ff mm ff mm mm]
    # VD (+1) BEFORE = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # VD (+1) AFTER  = [98 2b c3 36 de ee 5e bc b1 e2 23 cd 17 45 0a 0b 35 e8 08 fb 82 8f c0 10 88 bc d8 4d 2e 35 ec 91]


    
    vnmsac.vx v14, x7, v2, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3dc2eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed83ab8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x98de39b6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4df496d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7fb68f0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66c02ebf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadf22)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5c16366e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2e35ec91)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x88bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x828fc010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35e808fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17450a0b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb1e223cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdeee5ebc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x6, 2147483647
    la x2, test_1_data+300
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")

    





    # RS1  (x6)        = 2147483647

    # VS2 (v0)        = [f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5 e6 b6 a1 1c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v12) BEFORE = [73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf d7 a5 68 f0 4d aa 96 d5]
    # VD (v12) AFTER  = [64 07 70 aa 5a d1 d9 de a4 f5 16 e0 1a aa f4 30 45 2f 0d a0 3d 0a 96 af 24 4f fe c5 33 60 37 f1]

    # RS1  (x6)        = 2147483647

    # VS2 (+1)       = [b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # VD (+1) AFTER  = [86 60 48 80 b6 4b 71 02 fd 0e 8a 42 73 19 21 ca d8 d0 81 6c 49 27 35 e3 81 78 1a 06 a8 7e a0 58]


    
    vnmsac.vx v12, x6, v0



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x336037f1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x244ffec5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3d0a96af)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x452f0da0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1aaaf430)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa4f516e0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5ad1d9de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x640770aa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa87ea058)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81781a06)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x492735e3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd8d0816c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x731921ca)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfd0e8a42)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b7102)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x5, 124076833
    la x2, test_1_data+312
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")

    





    # RS1  (x5)        = 124076833

    # VS2 (v4)        = [4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1 66 65 2e bf]
    # MASK (v0)       = [ 0  0  0  0  0  0  1  0  1  0  1  0  1  1  0  0  1  1  1  1  0  0  1  1  0  0  1  1  0  1  1  0]
    # ELEMENTS          [mm mm mm mm mm mm ff mm ff mm ff mm ff ff mm mm ff ff ff ff mm mm ff ff mm mm ff ff mm ff ff mm]
    # VD (v10) BEFORE = [fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91 3b e0 15 4f df ca df e1]
    # VD (v10) AFTER  = [fd e2 23 d8 4c 45 0a 0b 62 33 70 fb 62 0f 98 5d 68 07 b7 9c 69 15 4c 62 3b e0 56 4e df c5 f1 e1]

    # RS1  (x5)        = 124076833

    # VS2 (+1)       = [63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8]
    # MASK (+1)       = [ 1  0  0  0  0  0  1  1  0  0  0  1  1  0  1  1  0  1  0  1  0  1  0  1  1  0  0  0  0  0  1  1]
    # ELEMENTS          [mm mm mm mm mm mm ff mm ff mm ff mm ff ff mm mm ff ff ff ff mm mm ff ff mm mm ff ff mm ff ff mm]
    # VD (+1) BEFORE = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # VD (+1) AFTER  = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 16 5d 2b c3 36 db ee db bc]


    
    vnmsac.vx v10, x5, v4, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfc5f1e1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0564e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69154c62)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6807b79c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x620f985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x623370fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c450a0b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbeedbbc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d2bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c716)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    li x4, 2048
    la x2, test_1_data+324
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e8,m2
    vle8.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")

    





    # RS1  (x4)        = 2048

    # VS2 (v6)        = [98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d 69 15 01 91]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v8)  BEFORE = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]
    # VD (v8)  AFTER  = [65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb 73 4b 98 5d f1 bc d8 4d]

    # RS1  (x4)        = 2048

    # VS2 (+1)       = [95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c]
    # ELEMENTS          [ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # VD (+1) AFTER  = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]


    
    vnmsac.vx v8, x4, v6



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m2
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x3, 0
    la x5, test_1_data+336
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v6, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")

    





    # RS1  (x3)        = 0

    # VS2 (v8)        = [86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b 35 33 08 fb]
    # MASK (v0)       = [ 0  0  0  0  0  1  1  1  1  0  0  1  0  0  0  1  0  1  1  1  1  1  0  1  0  1  0  0  1  0  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm mm ff mm mm mm ff mm ff ff ff ff ff mm ff mm ff mm mm ff mm ff ff]
    # VD (v6)  BEFORE = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]
    # VD (v6)  AFTER  = [70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94 fd e2 23 d8 4c 45 12 0b]

    # RS1  (x3)        = 0

    # VS2 (+1)       = [4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e]
    # MASK (+1)       = [ 0  1  1  0  0  1  1  0  1  1  0  1  1  0  1  0  0  1  1  0  0  1  0  0  1  0  1  0  1  0  1  0]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- mm mm ff mm mm mm ff mm ff ff ff ff ff mm ff mm ff mm mm ff mm ff ff]
    # VD (+1) BEFORE = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # VD (+1) AFTER  = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]


    
    vnmsac.vx v6, x3, v8, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v6, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c45120b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfde223d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982bc336)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86604880)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x2, 2047
    la x5, test_1_data+348
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v10, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")

    





    # RS1  (x2)        = 2047

    # VS2 (v10)       = [04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36 db ee 5e 94]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (v4)  BEFORE = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6 65 e3 c7 0c 98 2b c3 36]
    # VD (v4)  AFTER  = [35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 3c ab b9 76 1b 2e 38 02 fd 0e 8a 42 73 19 21 ca]

    # RS1  (x2)        = 2047

    # VS2 (+1)       = [31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]
    # VD (+1) AFTER  = [11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45]


    
    vnmsac.vx v4, x2, v10



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x731921ca)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfd0e8a42)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1b2e3802)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3cabb976)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e804)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle8.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x1, -1
    la x5, test_1_data+360
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")

    





    # RS1  (x1)        = -1

    # VS2 (v12)       = [8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80 b6 4b 71 f6]
    # MASK (v0)       = [ 0  1  0  0  1  1  0  0  1  0  0  0  0  0  0  1  0  0  0  1  1  1  1  0  1  1  0  0  1  1  1  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm ff ff mm mm ff ff ff ff]
    # VD (v2)  BEFORE = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd 70 0a 8d 4e 86 60 48 80]
    # VD (v2)  AFTER  = [cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 aa cd f6 6a 8d 4e 3c ab b9 76]

    # RS1  (x1)        = -1

    # VS2 (+1)       = [31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5]
    # MASK (+1)       = [ 1  0  0  0  0  0  0  0  1  0  0  0  0  1  0  1  1  1  0  1  1  0  1  1  1  1  1  1  0  0  0  1]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff mm ff ff mm mm ff ff ff ff]
    # VD (+1) BEFORE = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]
    # VD (+1) AFTER  = [dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04 91 8f 47 2f 4f 03 15 46]


    
    vnmsac.vx v2, x1, v12, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3cabb976)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf66a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b9aacd)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    li x0, 0
    la x5, test_1_data+372
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e8,m2
    vle8.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")

    





    # RS1  (x0)        = 0

    # VS2 (v14)       = [91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73 63 b9 1d cd]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (v0)  BEFORE = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]
    # VD (v0)  AFTER  = [ac 98 e8 04 91 8f 47 2f 4f 03 15 46 cd 1b 37 e5 8b 4e cb a8 95 a7 45 45 35 5e 64 a2 04 b1 1e 73]

    # RS1  (x0)        = 0

    # VS2 (+1)       = [0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1 ac 98 e8 04]
    # ELEMENTS          [-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ff ff ff ff ff ff ff ff]
    # VD (+1) BEFORE = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]
    # VD (+1) AFTER  = [02 2f 66 18 0d 2e 0a 7a 7c ba ce b7 dc 44 77 22 31 a2 01 a7 99 5c cb f8 11 51 05 7d 31 1c 98 a1]


    
    vnmsac.vx v0, x0, v14



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m2
    vse8.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
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

