// RISC-V Architectural Validation Test C-SUB-01
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
// Specification: C Standard Extension for Compressed Integer Instructions
// Description: Testing instruction 'c.sub'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.sub)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.sub)

    RVTEST_SIGBASE(x1,signature_1_0)

 
    # Testcase 0:  rd:x11(0x00000000), rs2:x12(0x54f4aeeb), result rd:x11(0xab0b5115)
    li  x12, MASK_XLEN(0x54f4aeeb)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xab0b5115) 
 
    # Testcase 1:  rd:x14(0x00000000), rs2:x12(0xf4bcf4a7), result rd:x14(0x0b430b59)
    li  x12, MASK_XLEN(0xf4bcf4a7)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x12
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xb430b59) 
 
    # Testcase 2:  rd:x10(0x00000000), rs2:x8(0xe1b1199b), result rd:x10(0x1e4ee665)
    li  x8, MASK_XLEN(0xe1b1199b)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x8
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e4ee665) 
 
    # Testcase 3:  rd:x11(0x00000000), rs2:x15(0xe3977ec1), result rd:x11(0x1c68813f)
    li  x15, MASK_XLEN(0xe3977ec1)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x15
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1c68813f) 
 
    # Testcase 4:  rd:x13(0x00000000), rs2:x8(0xb26566a0), result rd:x13(0x4d9a9960)
    li  x8, MASK_XLEN(0xb26566a0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x8
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x4d9a9960) 


    

    RVTEST_SIGBASE(x1,signature_2_0)

 
    # Testcase 5:  rd:x13(0x00000000), rs2:x12(0x80bd3ffe), result rd:x13(0x7f42c002)
    li  x12, MASK_XLEN(0x80bd3ffe)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x12
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x7f42c002) 
 
    # Testcase 6:  rd:x11(0x00000000), rs2:x9(0xf27008e6), result rd:x11(0x0d8ff71a)
    li  x9, MASK_XLEN(0xf27008e6)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x9
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xd8ff71a) 
 
    # Testcase 7:  rd:x10(0x00000000), rs2:x15(0xc3e260bd), result rd:x10(0x3c1d9f43)
    li  x15, MASK_XLEN(0xc3e260bd)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x15
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x3c1d9f43) 
 
    # Testcase 8:  rd:x9(0x00000000), rs2:x15(0x0c8484a3), result rd:x9(0xf37b7b5d)
    li  x15, MASK_XLEN(0xc8484a3)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x15
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf37b7b5d) 
 
    # Testcase 9:  rd:x9(0x00000000), rs2:x15(0x2f7b22b7), result rd:x9(0xd084dd49)
    li  x15, MASK_XLEN(0x2f7b22b7)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x15
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xd084dd49) 


    

    RVTEST_SIGBASE(x1,signature_3_0)

 
    # Testcase 10:  rd:x15(0x00000000), rs2:x13(0xa783d03f), result rd:x15(0x587c2fc1)
    li  x13, MASK_XLEN(0xa783d03f)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x13
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x587c2fc1) 
 
    # Testcase 11:  rd:x8(0x00000000), rs2:x14(0xbf042c8c), result rd:x8(0x40fbd374)
    li  x14, MASK_XLEN(0xbf042c8c)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x14
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x40fbd374) 
 
    # Testcase 12:  rd:x8(0x00000000), rs2:x9(0xfd7b9df8), result rd:x8(0x02846208)
    li  x9, MASK_XLEN(0xfd7b9df8)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2846208) 
 
    # Testcase 13:  rd:x15(0x00000000), rs2:x14(0x807fe203), result rd:x15(0x7f801dfd)
    li  x14, MASK_XLEN(0x807fe203)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x14
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x7f801dfd) 
 
    # Testcase 14:  rd:x11(0x00000000), rs2:x14(0x0afaa29d), result rd:x11(0xf5055d63)
    li  x14, MASK_XLEN(0xafaa29d)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x14
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf5055d63) 


    

    RVTEST_SIGBASE(x1,signature_4_0)

 
    # Testcase 15:  rd:x9(0x00000000), rs2:x10(0xa14cf866), result rd:x9(0x5eb3079a)
    li  x10, MASK_XLEN(0xa14cf866)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x5eb3079a) 
 
    # Testcase 16:  rd:x15(0x00000000), rs2:x13(0x413f2c62), result rd:x15(0xbec0d39e)
    li  x13, MASK_XLEN(0x413f2c62)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x13
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xbec0d39e) 
 
    # Testcase 17:  rd:x15(0x00000000), rs2:x11(0xe2fe6443), result rd:x15(0x1d019bbd)
    li  x11, MASK_XLEN(0xe2fe6443)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x11
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1d019bbd) 
 
    # Testcase 18:  rd:x13(0x00000000), rs2:x8(0x2c370a9a), result rd:x13(0xd3c8f566)
    li  x8, MASK_XLEN(0x2c370a9a)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x8
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xd3c8f566) 
 
    # Testcase 19:  rd:x12(0x00000000), rs2:x11(0x701512f5), result rd:x12(0x8feaed0b)
    li  x11, MASK_XLEN(0x701512f5)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x11
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x8feaed0b) 


    

    RVTEST_SIGBASE(x1,signature_5_0)

 
    # Testcase 20:  rd:x9(0x00000000), rs2:x14(0x2882a0b3), result rd:x9(0xd77d5f4d)
    li  x14, MASK_XLEN(0x2882a0b3)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x14
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xd77d5f4d) 
 
    # Testcase 21:  rd:x15(0x00000000), rs2:x12(0x2a81b798), result rd:x15(0xd57e4868)
    li  x12, MASK_XLEN(0x2a81b798)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x12
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xd57e4868) 
 
    # Testcase 22:  rd:x10(0x00000000), rs2:x12(0x91dd5ad6), result rd:x10(0x6e22a52a)
    li  x12, MASK_XLEN(0x91dd5ad6)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x12
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x6e22a52a) 
 
    # Testcase 23:  rd:x13(0x00000000), rs2:x14(0xc68101ee), result rd:x13(0x397efe12)
    li  x14, MASK_XLEN(0xc68101ee)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x397efe12) 
 
    # Testcase 24:  rd:x9(0x00000000), rs2:x14(0x42f1d629), result rd:x9(0xbd0e29d7)
    li  x14, MASK_XLEN(0x42f1d629)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x14
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xbd0e29d7) 


    

    RVTEST_SIGBASE(x1,signature_6_0)

 
    # Testcase 25:  rd:x11(0x00000000), rs2:x15(0x589f2ccd), result rd:x11(0xa760d333)
    li  x15, MASK_XLEN(0x589f2ccd)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x15
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xa760d333) 
 
    # Testcase 26:  rd:x13(0x00000000), rs2:x12(0xcddbdf6f), result rd:x13(0x32242091)
    li  x12, MASK_XLEN(0xcddbdf6f)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x12
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x32242091) 
 
    # Testcase 27:  rd:x14(0x00000000), rs2:x9(0x014cf50e), result rd:x14(0xfeb30af2)
    li  x9, MASK_XLEN(0x14cf50e)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x9
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfeb30af2) 
 
    # Testcase 28:  rd:x9(0x00000000), rs2:x10(0x4d236af8), result rd:x9(0xb2dc9508)
    li  x10, MASK_XLEN(0x4d236af8)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xb2dc9508) 
 
    # Testcase 29:  rd:x14(0x00000000), rs2:x8(0xc9e2ce4f), result rd:x14(0x361d31b1)
    li  x8, MASK_XLEN(0xc9e2ce4f)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x8
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x361d31b1) 


    

    RVTEST_SIGBASE(x1,signature_7_0)

 
    # Testcase 30:  rd:x8(0x00000000), rs2:x11(0x80000000), result rd:x8(0x80000000)
    li  x11, MASK_XLEN(0x80000000)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x11
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x80000000) 
 
    # Testcase 31:  rd:x12(0x00000000), rs2:x11(0xffffffff), result rd:x12(0x00000001)
    li  x11, MASK_XLEN(0xffffffff)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x11
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 
 
    # Testcase 32:  rd:x15(0x00000000), rs2:x14(0xffffffff), result rd:x15(0x00000001)
    li  x14, MASK_XLEN(0xffffffff)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x14
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 33:  rd:x11(0x00000000), rs2:x13(0xffffffff), result rd:x11(0x00000001)
    li  x13, MASK_XLEN(0xffffffff)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x13
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 
 
    # Testcase 34:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_8_0)

 
    # Testcase 35:  rd:x8(0x00000000), rs2:x12(0x7fffffff), result rd:x8(0x80000001)
    li  x12, MASK_XLEN(0x7fffffff)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x12
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x80000001) 
 
    # Testcase 36:  rd:x15(0x00000000), rs2:x10(0xffffffff), result rd:x15(0x00000001)
    li  x10, MASK_XLEN(0xffffffff)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x10
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 37:  rd:x8(0x00000000), rs2:x13(0x00000000), result rd:x8(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x13
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 38:  rd:x13(0x00000000), rs2:x11(0x80000000), result rd:x13(0x80000000)
    li  x11, MASK_XLEN(0x80000000)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x11
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x80000000) 
 
    # Testcase 39:  rd:x13(0x00000000), rs2:x8(0xffffffff), result rd:x13(0x00000001)
    li  x8, MASK_XLEN(0xffffffff)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x8
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_9_0)

 
    # Testcase 40:  rd:x8(0x00000000), rs2:x9(0xfffffffe), result rd:x8(0x00000002)
    li  x9, MASK_XLEN(0xfffffffe)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2) 
 
    # Testcase 41:  rd:x9(0x00000000), rs2:x10(0x7fffffff), result rd:x9(0x80000001)
    li  x10, MASK_XLEN(0x7fffffff)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x80000001) 
 
    # Testcase 42:  rd:x10(0x00000000), rs2:x11(0xbfffffff), result rd:x10(0x40000001)
    li  x11, MASK_XLEN(0xbfffffff)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x40000001) 
 
    # Testcase 43:  rd:x11(0x00000000), rs2:x12(0xdfffffff), result rd:x11(0x20000001)
    li  x12, MASK_XLEN(0xdfffffff)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x20000001) 
 
    # Testcase 44:  rd:x12(0x00000000), rs2:x13(0xefffffff), result rd:x12(0x10000001)
    li  x13, MASK_XLEN(0xefffffff)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x10000001) 


    

    RVTEST_SIGBASE(x1,signature_10_0)

 
    # Testcase 45:  rd:x13(0x00000000), rs2:x14(0xf7ffffff), result rd:x13(0x08000001)
    li  x14, MASK_XLEN(0xf7ffffff)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x8000001) 
 
    # Testcase 46:  rd:x14(0x00000000), rs2:x15(0xfbffffff), result rd:x14(0x04000001)
    li  x15, MASK_XLEN(0xfbffffff)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x4000001) 
 
    # Testcase 47:  rd:x15(0x00000000), rs2:x8(0xfdffffff), result rd:x15(0x02000001)
    li  x8, MASK_XLEN(0xfdffffff)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x2000001) 
 
    # Testcase 48:  rd:x8(0x00000000), rs2:x9(0xfeffffff), result rd:x8(0x01000001)
    li  x9, MASK_XLEN(0xfeffffff)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1000001) 
 
    # Testcase 49:  rd:x9(0x00000000), rs2:x10(0xff7fffff), result rd:x9(0x00800001)
    li  x10, MASK_XLEN(0xff7fffff)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x800001) 


    

    RVTEST_SIGBASE(x1,signature_11_0)

 
    # Testcase 50:  rd:x10(0x00000000), rs2:x11(0xffbfffff), result rd:x10(0x00400001)
    li  x11, MASK_XLEN(0xffbfffff)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x400001) 
 
    # Testcase 51:  rd:x11(0x00000000), rs2:x12(0xffdfffff), result rd:x11(0x00200001)
    li  x12, MASK_XLEN(0xffdfffff)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x200001) 
 
    # Testcase 52:  rd:x12(0x00000000), rs2:x13(0xffefffff), result rd:x12(0x00100001)
    li  x13, MASK_XLEN(0xffefffff)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x100001) 
 
    # Testcase 53:  rd:x13(0x00000000), rs2:x14(0xfff7ffff), result rd:x13(0x00080001)
    li  x14, MASK_XLEN(0xfff7ffff)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x80001) 
 
    # Testcase 54:  rd:x14(0x00000000), rs2:x15(0xfffbffff), result rd:x14(0x00040001)
    li  x15, MASK_XLEN(0xfffbffff)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x40001) 


    

    RVTEST_SIGBASE(x1,signature_12_0)

 
    # Testcase 55:  rd:x15(0x00000000), rs2:x8(0xfffdffff), result rd:x15(0x00020001)
    li  x8, MASK_XLEN(0xfffdffff)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x20001) 
 
    # Testcase 56:  rd:x8(0x00000000), rs2:x9(0xfffeffff), result rd:x8(0x00010001)
    li  x9, MASK_XLEN(0xfffeffff)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x10001) 
 
    # Testcase 57:  rd:x9(0x00000000), rs2:x10(0xffff7fff), result rd:x9(0x00008001)
    li  x10, MASK_XLEN(0xffff7fff)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x8001) 
 
    # Testcase 58:  rd:x10(0x00000000), rs2:x11(0xffffbfff), result rd:x10(0x00004001)
    li  x11, MASK_XLEN(0xffffbfff)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x4001) 
 
    # Testcase 59:  rd:x11(0x00000000), rs2:x12(0xffffdfff), result rd:x11(0x00002001)
    li  x12, MASK_XLEN(0xffffdfff)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x2001) 


    

    RVTEST_SIGBASE(x1,signature_13_0)

 
    # Testcase 60:  rd:x12(0x00000000), rs2:x13(0xffffefff), result rd:x12(0x00001001)
    li  x13, MASK_XLEN(0xffffefff)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1001) 
 
    # Testcase 61:  rd:x13(0x00000000), rs2:x14(0xfffff7ff), result rd:x13(0x00000801)
    li  x14, MASK_XLEN(0xfffff7ff)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x801) 
 
    # Testcase 62:  rd:x14(0x00000000), rs2:x15(0xfffffbff), result rd:x14(0x00000401)
    li  x15, MASK_XLEN(0xfffffbff)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x401) 
 
    # Testcase 63:  rd:x15(0x00000000), rs2:x8(0xfffffdff), result rd:x15(0x00000201)
    li  x8, MASK_XLEN(0xfffffdff)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x201) 
 
    # Testcase 64:  rd:x8(0x00000000), rs2:x9(0xfffffeff), result rd:x8(0x00000101)
    li  x9, MASK_XLEN(0xfffffeff)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x101) 


    

    RVTEST_SIGBASE(x1,signature_14_0)

 
    # Testcase 65:  rd:x9(0x00000000), rs2:x10(0xffffff7f), result rd:x9(0x00000081)
    li  x10, MASK_XLEN(0xffffff7f)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x81) 
 
    # Testcase 66:  rd:x10(0x00000000), rs2:x11(0xffffffbf), result rd:x10(0x00000041)
    li  x11, MASK_XLEN(0xffffffbf)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x41) 
 
    # Testcase 67:  rd:x11(0x00000000), rs2:x12(0xffffffdf), result rd:x11(0x00000021)
    li  x12, MASK_XLEN(0xffffffdf)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x21) 
 
    # Testcase 68:  rd:x12(0x00000000), rs2:x13(0xffffffef), result rd:x12(0x00000011)
    li  x13, MASK_XLEN(0xffffffef)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x11) 
 
    # Testcase 69:  rd:x13(0x00000000), rs2:x14(0xfffffff7), result rd:x13(0x00000009)
    li  x14, MASK_XLEN(0xfffffff7)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x9) 


    

    RVTEST_SIGBASE(x1,signature_15_0)

 
    # Testcase 70:  rd:x14(0x00000000), rs2:x15(0xfffffffb), result rd:x14(0x00000005)
    li  x15, MASK_XLEN(0xfffffffb)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x5) 
 
    # Testcase 71:  rd:x15(0x00000000), rs2:x8(0xfffffffd), result rd:x15(0x00000003)
    li  x8, MASK_XLEN(0xfffffffd)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x3) 
 
    # Testcase 72:  rd:x8(0x00000000), rs2:x9(0xfffffffe), result rd:x8(0x00000002)
    li  x9, MASK_XLEN(0xfffffffe)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2) 
 
    # Testcase 73:  rd:x9(0x00000000), rs2:x10(0x80000000), result rd:x9(0x80000000)
    li  x10, MASK_XLEN(0x80000000)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x80000000) 
 
    # Testcase 74:  rd:x10(0x00000000), rs2:x11(0x40000000), result rd:x10(0xc0000000)
    li  x11, MASK_XLEN(0x40000000)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xc0000000) 


    

    RVTEST_SIGBASE(x1,signature_16_0)

 
    # Testcase 75:  rd:x11(0x00000000), rs2:x12(0x20000000), result rd:x11(0xe0000000)
    li  x12, MASK_XLEN(0x20000000)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xe0000000) 
 
    # Testcase 76:  rd:x12(0x00000000), rs2:x13(0x10000000), result rd:x12(0xf0000000)
    li  x13, MASK_XLEN(0x10000000)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xf0000000) 
 
    # Testcase 77:  rd:x13(0x00000000), rs2:x14(0x08000000), result rd:x13(0xf8000000)
    li  x14, MASK_XLEN(0x8000000)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xf8000000) 
 
    # Testcase 78:  rd:x14(0x00000000), rs2:x15(0x04000000), result rd:x14(0xfc000000)
    li  x15, MASK_XLEN(0x4000000)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfc000000) 
 
    # Testcase 79:  rd:x15(0x00000000), rs2:x8(0x02000000), result rd:x15(0xfe000000)
    li  x8, MASK_XLEN(0x2000000)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfe000000) 


    

    RVTEST_SIGBASE(x1,signature_17_0)

 
    # Testcase 80:  rd:x8(0x00000000), rs2:x9(0x01000000), result rd:x8(0xff000000)
    li  x9, MASK_XLEN(0x1000000)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xff000000) 
 
    # Testcase 81:  rd:x9(0x00000000), rs2:x10(0x00800000), result rd:x9(0xff800000)
    li  x10, MASK_XLEN(0x800000)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xff800000) 
 
    # Testcase 82:  rd:x10(0x00000000), rs2:x11(0x00400000), result rd:x10(0xffc00000)
    li  x11, MASK_XLEN(0x400000)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffc00000) 
 
    # Testcase 83:  rd:x11(0x00000000), rs2:x12(0x00200000), result rd:x11(0xffe00000)
    li  x12, MASK_XLEN(0x200000)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffe00000) 
 
    # Testcase 84:  rd:x12(0x00000000), rs2:x13(0x00100000), result rd:x12(0xfff00000)
    li  x13, MASK_XLEN(0x100000)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfff00000) 


    

    RVTEST_SIGBASE(x1,signature_18_0)

 
    # Testcase 85:  rd:x13(0x00000000), rs2:x14(0x00080000), result rd:x13(0xfff80000)
    li  x14, MASK_XLEN(0x80000)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfff80000) 
 
    # Testcase 86:  rd:x14(0x00000000), rs2:x15(0x00040000), result rd:x14(0xfffc0000)
    li  x15, MASK_XLEN(0x40000)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffc0000) 
 
    # Testcase 87:  rd:x15(0x00000000), rs2:x8(0x00020000), result rd:x15(0xfffe0000)
    li  x8, MASK_XLEN(0x20000)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffe0000) 
 
    # Testcase 88:  rd:x8(0x00000000), rs2:x9(0x00010000), result rd:x8(0xffff0000)
    li  x9, MASK_XLEN(0x10000)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffff0000) 
 
    # Testcase 89:  rd:x9(0x00000000), rs2:x10(0x00008000), result rd:x9(0xffff8000)
    li  x10, MASK_XLEN(0x8000)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffff8000) 


    

    RVTEST_SIGBASE(x1,signature_19_0)

 
    # Testcase 90:  rd:x10(0x00000000), rs2:x11(0x00004000), result rd:x10(0xffffc000)
    li  x11, MASK_XLEN(0x4000)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffc000) 
 
    # Testcase 91:  rd:x11(0x00000000), rs2:x12(0x00002000), result rd:x11(0xffffe000)
    li  x12, MASK_XLEN(0x2000)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffe000) 
 
    # Testcase 92:  rd:x12(0x00000000), rs2:x13(0x00001000), result rd:x12(0xfffff000)
    li  x13, MASK_XLEN(0x1000)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffff000) 
 
    # Testcase 93:  rd:x13(0x00000000), rs2:x14(0x00000800), result rd:x13(0xfffff800)
    li  x14, MASK_XLEN(0x800)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffff800) 
 
    # Testcase 94:  rd:x14(0x00000000), rs2:x15(0x00000400), result rd:x14(0xfffffc00)
    li  x15, MASK_XLEN(0x400)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffc00) 


    

    RVTEST_SIGBASE(x1,signature_20_0)

 
    # Testcase 95:  rd:x15(0x00000000), rs2:x8(0x00000200), result rd:x15(0xfffffe00)
    li  x8, MASK_XLEN(0x200)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffe00) 
 
    # Testcase 96:  rd:x8(0x00000000), rs2:x9(0x00000100), result rd:x8(0xffffff00)
    li  x9, MASK_XLEN(0x100)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffff00) 
 
    # Testcase 97:  rd:x9(0x00000000), rs2:x10(0x00000080), result rd:x9(0xffffff80)
    li  x10, MASK_XLEN(0x80)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffff80) 
 
    # Testcase 98:  rd:x10(0x00000000), rs2:x11(0x00000040), result rd:x10(0xffffffc0)
    li  x11, MASK_XLEN(0x40)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffc0) 
 
    # Testcase 99:  rd:x11(0x00000000), rs2:x12(0x00000020), result rd:x11(0xffffffe0)
    li  x12, MASK_XLEN(0x20)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffe0) 


    

    RVTEST_SIGBASE(x1,signature_21_0)

 
    # Testcase 100:  rd:x12(0x00000000), rs2:x13(0x00000010), result rd:x12(0xfffffff0)
    li  x13, MASK_XLEN(0x10)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffff0) 
 
    # Testcase 101:  rd:x13(0x00000000), rs2:x14(0x00000008), result rd:x13(0xfffffff8)
    li  x14, MASK_XLEN(0x8)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffff8) 
 
    # Testcase 102:  rd:x14(0x00000000), rs2:x15(0x00000004), result rd:x14(0xfffffffc)
    li  x15, MASK_XLEN(0x4)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffc) 
 
    # Testcase 103:  rd:x15(0x00000000), rs2:x8(0x00000002), result rd:x15(0xfffffffe)
    li  x8, MASK_XLEN(0x2)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffe) 
 
    # Testcase 104:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_22_0)

 
    # Testcase 105:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 106:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 107:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 108:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 109:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_23_0)

 
    # Testcase 110:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 111:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 112:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 113:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 114:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_24_0)

 
    # Testcase 115:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 116:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 117:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 118:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 119:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_25_0)

 
    # Testcase 120:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 121:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 122:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 123:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 124:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_26_0)

 
    # Testcase 125:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 126:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 127:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 128:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 129:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_27_0)

 
    # Testcase 130:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 131:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 132:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 133:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 134:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_28_0)

 
    # Testcase 135:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 136:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 137:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 138:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 139:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_29_0)

 
    # Testcase 140:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 141:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 142:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 143:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 144:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_30_0)

 
    # Testcase 145:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 146:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 147:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 148:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 149:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_31_0)

 
    # Testcase 150:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 151:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 152:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 153:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 154:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_32_0)

 
    # Testcase 155:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 156:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 157:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 158:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 159:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_33_0)

 
    # Testcase 160:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.sub x8, x9
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 161:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.sub x9, x10
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 162:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.sub x10, x11
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 163:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.sub x11, x12
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 164:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.sub x12, x13
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_34_0)

 
    # Testcase 165:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.sub x13, x14
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 166:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.sub x14, x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 167:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.sub x15, x8
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
	
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe

# Input data section.
	.data

RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 5, 4, 0xdeadbeef
signature_2_0:
	.fill 5, 4, 0xdeadbeef
signature_3_0:
	.fill 5, 4, 0xdeadbeef
signature_4_0:
	.fill 5, 4, 0xdeadbeef
signature_5_0:
	.fill 5, 4, 0xdeadbeef
signature_6_0:
	.fill 5, 4, 0xdeadbeef
signature_7_0:
	.fill 5, 4, 0xdeadbeef
signature_8_0:
	.fill 5, 4, 0xdeadbeef
signature_9_0:
	.fill 5, 4, 0xdeadbeef
signature_10_0:
	.fill 5, 4, 0xdeadbeef
signature_11_0:
	.fill 5, 4, 0xdeadbeef
signature_12_0:
	.fill 5, 4, 0xdeadbeef
signature_13_0:
	.fill 5, 4, 0xdeadbeef
signature_14_0:
	.fill 5, 4, 0xdeadbeef
signature_15_0:
	.fill 5, 4, 0xdeadbeef
signature_16_0:
	.fill 5, 4, 0xdeadbeef
signature_17_0:
	.fill 5, 4, 0xdeadbeef
signature_18_0:
	.fill 5, 4, 0xdeadbeef
signature_19_0:
	.fill 5, 4, 0xdeadbeef
signature_20_0:
	.fill 5, 4, 0xdeadbeef
signature_21_0:
	.fill 5, 4, 0xdeadbeef
signature_22_0:
	.fill 5, 4, 0xdeadbeef
signature_23_0:
	.fill 5, 4, 0xdeadbeef
signature_24_0:
	.fill 5, 4, 0xdeadbeef
signature_25_0:
	.fill 5, 4, 0xdeadbeef
signature_26_0:
	.fill 5, 4, 0xdeadbeef
signature_27_0:
	.fill 5, 4, 0xdeadbeef
signature_28_0:
	.fill 5, 4, 0xdeadbeef
signature_29_0:
	.fill 5, 4, 0xdeadbeef
signature_30_0:
	.fill 5, 4, 0xdeadbeef
signature_31_0:
	.fill 5, 4, 0xdeadbeef
signature_32_0:
	.fill 5, 4, 0xdeadbeef
signature_33_0:
	.fill 5, 4, 0xdeadbeef
signature_34_0:
	.fill 5, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

