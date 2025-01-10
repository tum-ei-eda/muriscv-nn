// RISC-V Architectural Validation Test C-MV-01
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
// Description: Testing instruction 'c.mv'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.mv)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.mv)

    RVTEST_SIGBASE(x1,signature_1_0)

 
    # Testcase 0:  rd:x20(0x00000000), rs2:x29(0x54f4aeeb), result rd:x20(0x54f4aeeb)
    li  x20,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x54f4aeeb)
    c.mv x20, x29
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x54f4aeeb) 
 
    # Testcase 1:  rd:x31(0x00000000), rs2:x21(0xf4bcf4a7), result rd:x31(0xf4bcf4a7)
    li  x31,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0xf4bcf4a7)
    c.mv x31, x21
    sw x31, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xf4bcf4a7) 
 
    # Testcase 2:  rd:x11(0x00000000), rs2:x2(0xe1b1199b), result rd:x11(0xe1b1199b)
    li  x11,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xe1b1199b)
    c.mv x11, x2
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xe1b1199b) 



    

    RVTEST_SIGBASE(x3,signature_2_0)

 
    # Testcase 3:  rd:x4(0x00000000), rs2:x1(0xe3977ec1), result rd:x4(0xe3977ec1)
    li  x4,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xe3977ec1)
    c.mv x4, x1
    sw x4, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xe3977ec1) 
 
    # Testcase 4:  rd:x30(0x00000000), rs2:x6(0xb26566a0), result rd:x30(0xb26566a0)
    li  x30,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0xb26566a0)
    c.mv x30, x6
    sw x30, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xb26566a0) 
 
    # Testcase 5:  rd:x2(0x00000000), rs2:x14(0x80bd3ffe), result rd:x2(0x80bd3ffe)
    li  x2,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x80bd3ffe)
    c.mv x2, x14
    sw x2, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x80bd3ffe) 



    

    RVTEST_SIGBASE(x1,signature_3_0)

 
    # Testcase 6:  rd:x5(0x00000000), rs2:x12(0xf27008e6), result rd:x5(0xf27008e6)
    li  x5,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0xf27008e6)
    c.mv x5, x12
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf27008e6) 
 
    # Testcase 7:  rd:x26(0x00000000), rs2:x3(0xc3e260bd), result rd:x26(0xc3e260bd)
    li  x26,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0xc3e260bd)
    c.mv x26, x3
    sw x26, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xc3e260bd) 
 
    # Testcase 8:  rd:x19(0x00000000), rs2:x8(0x0c8484a3), result rd:x19(0x0c8484a3)
    li  x19,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0xc8484a3)
    c.mv x19, x8
    sw x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xc8484a3) 



    

    RVTEST_SIGBASE(x2,signature_4_0)

 
    # Testcase 9:  rd:x10(0x00000000), rs2:x1(0x2f7b22b7), result rd:x10(0x2f7b22b7)
    li  x10,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x2f7b22b7)
    c.mv x10, x1
    sw x10, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x2f7b22b7) 
 
    # Testcase 10:  rd:x18(0x00000000), rs2:x24(0xa783d03f), result rd:x18(0xa783d03f)
    li  x18,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0xa783d03f)
    c.mv x18, x24
    sw x18, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xa783d03f) 
 
    # Testcase 11:  rd:x1(0x00000000), rs2:x22(0xbf042c8c), result rd:x1(0xbf042c8c)
    li  x1,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0xbf042c8c)
    c.mv x1, x22
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xbf042c8c) 



    

    RVTEST_SIGBASE(x3,signature_5_0)

 
    # Testcase 12:  rd:x2(0x00000000), rs2:x31(0xfd7b9df8), result rd:x2(0xfd7b9df8)
    li  x2,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0xfd7b9df8)
    c.mv x2, x31
    sw x2, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xfd7b9df8) 
 
    # Testcase 13:  rd:x1(0x00000000), rs2:x18(0x807fe203), result rd:x1(0x807fe203)
    li  x1,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x807fe203)
    c.mv x1, x18
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x807fe203) 
 
    # Testcase 14:  rd:x1(0x00000000), rs2:x7(0x0afaa29d), result rd:x1(0x0afaa29d)
    li  x1,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xafaa29d)
    c.mv x1, x7
    sw x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xafaa29d) 



    

    RVTEST_SIGBASE(x1,signature_6_0)

 
    # Testcase 15:  rd:x12(0x00000000), rs2:x23(0xa14cf866), result rd:x12(0xa14cf866)
    li  x12,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xa14cf866)
    c.mv x12, x23
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xa14cf866) 
 
    # Testcase 16:  rd:x10(0x00000000), rs2:x3(0x413f2c62), result rd:x10(0x413f2c62)
    li  x10,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x413f2c62)
    c.mv x10, x3
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x413f2c62) 
 
    # Testcase 17:  rd:x8(0x00000000), rs2:x14(0xe2fe6443), result rd:x8(0xe2fe6443)
    li  x8,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0xe2fe6443)
    c.mv x8, x14
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xe2fe6443) 



    

    RVTEST_SIGBASE(x1,signature_7_0)

 
    # Testcase 18:  rd:x8(0x00000000), rs2:x4(0x2c370a9a), result rd:x8(0x2c370a9a)
    li  x8,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x2c370a9a)
    c.mv x8, x4
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2c370a9a) 
 
    # Testcase 19:  rd:x14(0x00000000), rs2:x25(0x701512f5), result rd:x14(0x701512f5)
    li  x14,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x701512f5)
    c.mv x14, x25
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x701512f5) 
 
    # Testcase 20:  rd:x13(0x00000000), rs2:x4(0x2882a0b3), result rd:x13(0x2882a0b3)
    li  x13,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x2882a0b3)
    c.mv x13, x4
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x2882a0b3) 



    

    RVTEST_SIGBASE(x2,signature_8_0)

 
    # Testcase 21:  rd:x18(0x00000000), rs2:x15(0x2a81b798), result rd:x18(0x2a81b798)
    li  x18,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x2a81b798)
    c.mv x18, x15
    sw x18, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x2a81b798) 
 
    # Testcase 22:  rd:x1(0x00000000), rs2:x21(0x91dd5ad6), result rd:x1(0x91dd5ad6)
    li  x1,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x91dd5ad6)
    c.mv x1, x21
    sw x1, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x91dd5ad6) 
 
    # Testcase 23:  rd:x19(0x00000000), rs2:x5(0xc68101ee), result rd:x19(0xc68101ee)
    li  x19,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0xc68101ee)
    c.mv x19, x5
    sw x19, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xc68101ee) 



    

    RVTEST_SIGBASE(x1,signature_9_0)

 
    # Testcase 24:  rd:x30(0x00000000), rs2:x31(0x42f1d629), result rd:x30(0x42f1d629)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x42f1d629)
    c.mv x30, x31
    sw x30, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x42f1d629) 
 
    # Testcase 25:  rd:x18(0x00000000), rs2:x2(0x589f2ccd), result rd:x18(0x589f2ccd)
    li  x18,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x589f2ccd)
    c.mv x18, x2
    sw x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x589f2ccd) 
 
    # Testcase 26:  rd:x23(0x00000000), rs2:x4(0xcddbdf6f), result rd:x23(0xcddbdf6f)
    li  x23,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xcddbdf6f)
    c.mv x23, x4
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xcddbdf6f) 



    

    RVTEST_SIGBASE(x1,signature_10_0)

 
    # Testcase 27:  rd:x4(0x00000000), rs2:x20(0x014cf50e), result rd:x4(0x014cf50e)
    li  x4,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x14cf50e)
    c.mv x4, x20
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x14cf50e) 
 
    # Testcase 28:  rd:x16(0x00000000), rs2:x14(0x4d236af8), result rd:x16(0x4d236af8)
    li  x16,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x4d236af8)
    c.mv x16, x14
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x4d236af8) 
 
    # Testcase 29:  rd:x29(0x00000000), rs2:x7(0xc9e2ce4f), result rd:x29(0xc9e2ce4f)
    li  x29,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xc9e2ce4f)
    c.mv x29, x7
    sw x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xc9e2ce4f) 



    

    RVTEST_SIGBASE(x1,signature_11_0)

 
    # Testcase 30:  rd:x15(0x00000000), rs2:x7(0x80000000), result rd:x15(0x80000000)
    li  x15,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x80000000)
    c.mv x15, x7
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x80000000) 
 
    # Testcase 31:  rd:x10(0x00000000), rs2:x18(0xffffffff), result rd:x10(0xffffffff)
    li  x10,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0xffffffff)
    c.mv x10, x18
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffff) 
 
    # Testcase 32:  rd:x11(0x00000000), rs2:x15(0xffffffff), result rd:x11(0xffffffff)
    li  x11,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0xffffffff)
    c.mv x11, x15
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffff) 



    

    RVTEST_SIGBASE(x3,signature_12_0)

 
    # Testcase 33:  rd:x7(0x00000000), rs2:x23(0xffffffff), result rd:x7(0xffffffff)
    li  x7,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xffffffff)
    c.mv x7, x23
    sw x7, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xffffffff) 
 
    # Testcase 34:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.mv x1, x2
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x0) 
 
    # Testcase 35:  rd:x20(0x00000000), rs2:x29(0x7fffffff), result rd:x20(0x7fffffff)
    li  x20,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x7fffffff)
    c.mv x20, x29
    sw x20, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x7fffffff) 



    

    RVTEST_SIGBASE(x2,signature_13_0)

 
    # Testcase 36:  rd:x20(0x00000000), rs2:x1(0xffffffff), result rd:x20(0xffffffff)
    li  x20,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xffffffff)
    c.mv x20, x1
    sw x20, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffff) 
 
    # Testcase 37:  rd:x31(0x00000000), rs2:x28(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.mv x31, x28
    sw x31, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0) 
 
    # Testcase 38:  rd:x22(0x00000000), rs2:x24(0x80000000), result rd:x22(0x80000000)
    li  x22,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x80000000)
    c.mv x22, x24
    sw x22, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x80000000) 



    

    RVTEST_SIGBASE(x4,signature_14_0)

 
    # Testcase 39:  rd:x17(0x00000000), rs2:x25(0xffffffff), result rd:x17(0xffffffff)
    li  x17,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0xffffffff)
    c.mv x17, x25
    sw x17, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0xffffffff) 
 
    # Testcase 40:  rd:x1(0x00000000), rs2:x2(0xfffffffe), result rd:x1(0xfffffffe)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xfffffffe)
    c.mv x1, x2
    sw x1, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffe) 
 
    # Testcase 41:  rd:x2(0x00000000), rs2:x3(0x7fffffff), result rd:x2(0x7fffffff)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x7fffffff)
    c.mv x2, x3
    sw x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x7fffffff) 



    

    RVTEST_SIGBASE(x1,signature_15_0)

 
    # Testcase 42:  rd:x3(0x00000000), rs2:x4(0xbfffffff), result rd:x3(0xbfffffff)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xbfffffff)
    c.mv x3, x4
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xbfffffff) 
 
    # Testcase 43:  rd:x4(0x00000000), rs2:x5(0xdfffffff), result rd:x4(0xdfffffff)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0xdfffffff)
    c.mv x4, x5
    sw x4, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xdfffffff) 
 
    # Testcase 44:  rd:x5(0x00000000), rs2:x6(0xefffffff), result rd:x5(0xefffffff)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0xefffffff)
    c.mv x5, x6
    sw x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xefffffff) 



    

    RVTEST_SIGBASE(x1,signature_16_0)

 
    # Testcase 45:  rd:x6(0x00000000), rs2:x7(0xf7ffffff), result rd:x6(0xf7ffffff)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xf7ffffff)
    c.mv x6, x7
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xf7ffffff) 
 
    # Testcase 46:  rd:x7(0x00000000), rs2:x8(0xfbffffff), result rd:x7(0xfbffffff)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0xfbffffff)
    c.mv x7, x8
    sw x7, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xfbffffff) 
 
    # Testcase 47:  rd:x8(0x00000000), rs2:x9(0xfdffffff), result rd:x8(0xfdffffff)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0xfdffffff)
    c.mv x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfdffffff) 



    

    RVTEST_SIGBASE(x1,signature_17_0)

 
    # Testcase 48:  rd:x9(0x00000000), rs2:x10(0xfeffffff), result rd:x9(0xfeffffff)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0xfeffffff)
    c.mv x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfeffffff) 
 
    # Testcase 49:  rd:x10(0x00000000), rs2:x11(0xff7fffff), result rd:x10(0xff7fffff)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0xff7fffff)
    c.mv x10, x11
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xff7fffff) 
 
    # Testcase 50:  rd:x11(0x00000000), rs2:x12(0xffbfffff), result rd:x11(0xffbfffff)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0xffbfffff)
    c.mv x11, x12
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffbfffff) 



    

    RVTEST_SIGBASE(x1,signature_18_0)

 
    # Testcase 51:  rd:x12(0x00000000), rs2:x13(0xffdfffff), result rd:x12(0xffdfffff)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0xffdfffff)
    c.mv x12, x13
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffdfffff) 
 
    # Testcase 52:  rd:x13(0x00000000), rs2:x14(0xffefffff), result rd:x13(0xffefffff)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0xffefffff)
    c.mv x13, x14
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffefffff) 
 
    # Testcase 53:  rd:x14(0x00000000), rs2:x15(0xfff7ffff), result rd:x14(0xfff7ffff)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0xfff7ffff)
    c.mv x14, x15
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfff7ffff) 



    

    RVTEST_SIGBASE(x1,signature_19_0)

 
    # Testcase 54:  rd:x15(0x00000000), rs2:x16(0xfffbffff), result rd:x15(0xfffbffff)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0xfffbffff)
    c.mv x15, x16
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffbffff) 
 
    # Testcase 55:  rd:x16(0x00000000), rs2:x17(0xfffdffff), result rd:x16(0xfffdffff)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0xfffdffff)
    c.mv x16, x17
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xfffdffff) 
 
    # Testcase 56:  rd:x17(0x00000000), rs2:x18(0xfffeffff), result rd:x17(0xfffeffff)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0xfffeffff)
    c.mv x17, x18
    sw x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xfffeffff) 



    

    RVTEST_SIGBASE(x1,signature_20_0)

 
    # Testcase 57:  rd:x18(0x00000000), rs2:x19(0xffff7fff), result rd:x18(0xffff7fff)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0xffff7fff)
    c.mv x18, x19
    sw x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffff7fff) 
 
    # Testcase 58:  rd:x19(0x00000000), rs2:x20(0xffffbfff), result rd:x19(0xffffbfff)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0xffffbfff)
    c.mv x19, x20
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffbfff) 
 
    # Testcase 59:  rd:x20(0x00000000), rs2:x21(0xffffdfff), result rd:x20(0xffffdfff)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0xffffdfff)
    c.mv x20, x21
    sw x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffdfff) 



    

    RVTEST_SIGBASE(x1,signature_21_0)

 
    # Testcase 60:  rd:x21(0x00000000), rs2:x22(0xffffefff), result rd:x21(0xffffefff)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0xffffefff)
    c.mv x21, x22
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffefff) 
 
    # Testcase 61:  rd:x22(0x00000000), rs2:x23(0xfffff7ff), result rd:x22(0xfffff7ff)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xfffff7ff)
    c.mv x22, x23
    sw x22, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffff7ff) 
 
    # Testcase 62:  rd:x23(0x00000000), rs2:x24(0xfffffbff), result rd:x23(0xfffffbff)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0xfffffbff)
    c.mv x23, x24
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffbff) 



    

    RVTEST_SIGBASE(x1,signature_22_0)

 
    # Testcase 63:  rd:x24(0x00000000), rs2:x25(0xfffffdff), result rd:x24(0xfffffdff)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0xfffffdff)
    c.mv x24, x25
    sw x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xfffffdff) 
 
    # Testcase 64:  rd:x25(0x00000000), rs2:x26(0xfffffeff), result rd:x25(0xfffffeff)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0xfffffeff)
    c.mv x25, x26
    sw x25, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xfffffeff) 
 
    # Testcase 65:  rd:x26(0x00000000), rs2:x27(0xffffff7f), result rd:x26(0xffffff7f)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0xffffff7f)
    c.mv x26, x27
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffff7f) 



    

    RVTEST_SIGBASE(x1,signature_23_0)

 
    # Testcase 66:  rd:x27(0x00000000), rs2:x28(0xffffffbf), result rd:x27(0xffffffbf)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0xffffffbf)
    c.mv x27, x28
    sw x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffbf) 
 
    # Testcase 67:  rd:x28(0x00000000), rs2:x29(0xffffffdf), result rd:x28(0xffffffdf)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0xffffffdf)
    c.mv x28, x29
    sw x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffdf) 
 
    # Testcase 68:  rd:x29(0x00000000), rs2:x30(0xffffffef), result rd:x29(0xffffffef)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0xffffffef)
    c.mv x29, x30
    sw x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffef) 



    

    RVTEST_SIGBASE(x3,signature_24_0)

 
    # Testcase 69:  rd:x30(0x00000000), rs2:x31(0xfffffff7), result rd:x30(0xfffffff7)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0xfffffff7)
    c.mv x30, x31
    sw x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffff7) 
 
    # Testcase 70:  rd:x31(0x00000000), rs2:x1(0xfffffffb), result rd:x31(0xfffffffb)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xfffffffb)
    c.mv x31, x1
    sw x31, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffb) 
 
    # Testcase 71:  rd:x1(0x00000000), rs2:x2(0xfffffffd), result rd:x1(0xfffffffd)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xfffffffd)
    c.mv x1, x2
    sw x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xfffffffd) 



    

    RVTEST_SIGBASE(x1,signature_25_0)

 
    # Testcase 72:  rd:x2(0x00000000), rs2:x3(0xfffffffe), result rd:x2(0xfffffffe)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0xfffffffe)
    c.mv x2, x3
    sw x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0xfffffffe) 
 
    # Testcase 73:  rd:x3(0x00000000), rs2:x4(0x80000000), result rd:x3(0x80000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x80000000)
    c.mv x3, x4
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x80000000) 
 
    # Testcase 74:  rd:x4(0x00000000), rs2:x5(0x40000000), result rd:x4(0x40000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x40000000)
    c.mv x4, x5
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x40000000) 



    

    RVTEST_SIGBASE(x1,signature_26_0)

 
    # Testcase 75:  rd:x5(0x00000000), rs2:x6(0x20000000), result rd:x5(0x20000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x20000000)
    c.mv x5, x6
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x20000000) 
 
    # Testcase 76:  rd:x6(0x00000000), rs2:x7(0x10000000), result rd:x6(0x10000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x10000000)
    c.mv x6, x7
    sw x6, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x10000000) 
 
    # Testcase 77:  rd:x7(0x00000000), rs2:x8(0x08000000), result rd:x7(0x08000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x8000000)
    c.mv x7, x8
    sw x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x8000000) 



    

    RVTEST_SIGBASE(x1,signature_27_0)

 
    # Testcase 78:  rd:x8(0x00000000), rs2:x9(0x04000000), result rd:x8(0x04000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x4000000)
    c.mv x8, x9
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x4000000) 
 
    # Testcase 79:  rd:x9(0x00000000), rs2:x10(0x02000000), result rd:x9(0x02000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x2000000)
    c.mv x9, x10
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x2000000) 
 
    # Testcase 80:  rd:x10(0x00000000), rs2:x11(0x01000000), result rd:x10(0x01000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x1000000)
    c.mv x10, x11
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1000000) 



    

    RVTEST_SIGBASE(x1,signature_28_0)

 
    # Testcase 81:  rd:x11(0x00000000), rs2:x12(0x00800000), result rd:x11(0x00800000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x800000)
    c.mv x11, x12
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x800000) 
 
    # Testcase 82:  rd:x12(0x00000000), rs2:x13(0x00400000), result rd:x12(0x00400000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x400000)
    c.mv x12, x13
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x400000) 
 
    # Testcase 83:  rd:x13(0x00000000), rs2:x14(0x00200000), result rd:x13(0x00200000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x200000)
    c.mv x13, x14
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x200000) 



    

    RVTEST_SIGBASE(x1,signature_29_0)

 
    # Testcase 84:  rd:x14(0x00000000), rs2:x15(0x00100000), result rd:x14(0x00100000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x100000)
    c.mv x14, x15
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x100000) 
 
    # Testcase 85:  rd:x15(0x00000000), rs2:x16(0x00080000), result rd:x15(0x00080000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x80000)
    c.mv x15, x16
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x80000) 
 
    # Testcase 86:  rd:x16(0x00000000), rs2:x17(0x00040000), result rd:x16(0x00040000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x40000)
    c.mv x16, x17
    sw x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x40000) 



    

    RVTEST_SIGBASE(x1,signature_30_0)

 
    # Testcase 87:  rd:x17(0x00000000), rs2:x18(0x00020000), result rd:x17(0x00020000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x20000)
    c.mv x17, x18
    sw x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x20000) 
 
    # Testcase 88:  rd:x18(0x00000000), rs2:x19(0x00010000), result rd:x18(0x00010000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x10000)
    c.mv x18, x19
    sw x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x10000) 
 
    # Testcase 89:  rd:x19(0x00000000), rs2:x20(0x00008000), result rd:x19(0x00008000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x8000)
    c.mv x19, x20
    sw x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x8000) 



    

    RVTEST_SIGBASE(x1,signature_31_0)

 
    # Testcase 90:  rd:x20(0x00000000), rs2:x21(0x00004000), result rd:x20(0x00004000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x4000)
    c.mv x20, x21
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x4000) 
 
    # Testcase 91:  rd:x21(0x00000000), rs2:x22(0x00002000), result rd:x21(0x00002000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x2000)
    c.mv x21, x22
    sw x21, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x2000) 
 
    # Testcase 92:  rd:x22(0x00000000), rs2:x23(0x00001000), result rd:x22(0x00001000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x1000)
    c.mv x22, x23
    sw x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1000) 



    

    RVTEST_SIGBASE(x1,signature_32_0)

 
    # Testcase 93:  rd:x23(0x00000000), rs2:x24(0x00000800), result rd:x23(0x00000800)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x800)
    c.mv x23, x24
    sw x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x800) 
 
    # Testcase 94:  rd:x24(0x00000000), rs2:x25(0x00000400), result rd:x24(0x00000400)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x400)
    c.mv x24, x25
    sw x24, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x400) 
 
    # Testcase 95:  rd:x25(0x00000000), rs2:x26(0x00000200), result rd:x25(0x00000200)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x200)
    c.mv x25, x26
    sw x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x200) 



    

    RVTEST_SIGBASE(x1,signature_33_0)

 
    # Testcase 96:  rd:x26(0x00000000), rs2:x27(0x00000100), result rd:x26(0x00000100)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x100)
    c.mv x26, x27
    sw x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x100) 
 
    # Testcase 97:  rd:x27(0x00000000), rs2:x28(0x00000080), result rd:x27(0x00000080)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x80)
    c.mv x27, x28
    sw x27, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x80) 
 
    # Testcase 98:  rd:x28(0x00000000), rs2:x29(0x00000040), result rd:x28(0x00000040)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x40)
    c.mv x28, x29
    sw x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x40) 



    

    RVTEST_SIGBASE(x2,signature_34_0)

 
    # Testcase 99:  rd:x29(0x00000000), rs2:x30(0x00000020), result rd:x29(0x00000020)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x20)
    c.mv x29, x30
    sw x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x20) 
 
    # Testcase 100:  rd:x30(0x00000000), rs2:x31(0x00000010), result rd:x30(0x00000010)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x10)
    c.mv x30, x31
    sw x30, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x10) 
 
    # Testcase 101:  rd:x31(0x00000000), rs2:x1(0x00000008), result rd:x31(0x00000008)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x8)
    c.mv x31, x1
    sw x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x8) 



    

    RVTEST_SIGBASE(x5,signature_35_0)

 
    # Testcase 102:  rd:x1(0x00000000), rs2:x2(0x00000004), result rd:x1(0x00000004)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x4)
    c.mv x1, x2
    sw x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x4) 
 
    # Testcase 103:  rd:x2(0x00000000), rs2:x3(0x00000002), result rd:x2(0x00000002)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x2)
    c.mv x2, x3
    sw x2, 4(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x2) 
 
    # Testcase 104:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.mv x3, x4
    sw x3, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_36_0)

 
    # Testcase 105:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.mv x4, x5
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0) 
 
    # Testcase 106:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.mv x5, x6
    sw x5, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 
 
    # Testcase 107:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.mv x6, x7
    sw x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_37_0)

 
    # Testcase 108:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.mv x7, x8
    sw x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 
 
    # Testcase 109:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.mv x8, x9
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 110:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.mv x9, x10
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_38_0)

 
    # Testcase 111:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.mv x10, x11
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 112:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.mv x11, x12
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 113:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.mv x12, x13
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_39_0)

 
    # Testcase 114:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.mv x13, x14
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 115:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.mv x14, x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 116:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.mv x15, x16
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_40_0)

 
    # Testcase 117:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.mv x16, x17
    sw x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 
 
    # Testcase 118:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.mv x17, x18
    sw x17, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 
 
    # Testcase 119:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.mv x18, x19
    sw x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_41_0)

 
    # Testcase 120:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.mv x19, x20
    sw x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 
 
    # Testcase 121:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.mv x20, x21
    sw x20, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 
 
    # Testcase 122:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.mv x21, x22
    sw x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_42_0)

 
    # Testcase 123:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.mv x22, x23
    sw x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 
 
    # Testcase 124:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.mv x23, x24
    sw x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 
 
    # Testcase 125:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.mv x24, x25
    sw x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_43_0)

 
    # Testcase 126:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.mv x25, x26
    sw x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 
 
    # Testcase 127:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.mv x26, x27
    sw x26, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 
 
    # Testcase 128:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.mv x27, x28
    sw x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_44_0)

 
    # Testcase 129:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.mv x28, x29
    sw x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 
 
    # Testcase 130:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.mv x29, x30
    sw x29, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0) 
 
    # Testcase 131:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.mv x30, x31
    sw x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x0) 



    

    RVTEST_SIGBASE(x4,signature_45_0)

 
    # Testcase 132:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.mv x31, x1
    sw x31, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0) 
 
    # Testcase 133:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.mv x1, x2
    sw x1, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0) 
 
    # Testcase 134:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.mv x2, x3
    sw x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_46_0)

 
    # Testcase 135:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.mv x3, x4
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0) 
 
    # Testcase 136:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.mv x4, x5
    sw x4, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0) 
 
    # Testcase 137:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.mv x5, x6
    sw x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_47_0)

 
    # Testcase 138:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.mv x6, x7
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 
 
    # Testcase 139:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.mv x7, x8
    sw x7, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 
 
    # Testcase 140:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.mv x8, x9
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_48_0)

 
    # Testcase 141:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.mv x9, x10
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 142:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.mv x10, x11
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 143:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.mv x11, x12
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_49_0)

 
    # Testcase 144:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.mv x12, x13
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 145:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.mv x13, x14
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 146:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.mv x14, x15
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_50_0)

 
    # Testcase 147:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.mv x15, x16
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 148:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.mv x16, x17
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 
 
    # Testcase 149:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.mv x17, x18
    sw x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_51_0)

 
    # Testcase 150:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.mv x18, x19
    sw x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 
 
    # Testcase 151:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.mv x19, x20
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 
 
    # Testcase 152:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.mv x20, x21
    sw x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_52_0)

 
    # Testcase 153:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.mv x21, x22
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 
 
    # Testcase 154:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.mv x22, x23
    sw x22, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 
 
    # Testcase 155:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.mv x23, x24
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_53_0)

 
    # Testcase 156:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.mv x24, x25
    sw x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 
 
    # Testcase 157:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.mv x25, x26
    sw x25, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 
 
    # Testcase 158:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.mv x26, x27
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_54_0)

 
    # Testcase 159:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.mv x27, x28
    sw x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 
 
    # Testcase 160:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.mv x28, x29
    sw x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 
 
    # Testcase 161:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.mv x29, x30
    sw x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0) 



    

    RVTEST_SIGBASE(x3,signature_55_0)

 
    # Testcase 162:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.mv x30, x31
    sw x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0) 
 
    # Testcase 163:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.mv x31, x1
    sw x31, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0) 
 
    # Testcase 164:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.mv x1, x2
    sw x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_56_0)

 
    # Testcase 165:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.mv x2, x3
    sw x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0) 
 
    # Testcase 166:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.mv x3, x4
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0) 
 
    # Testcase 167:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.mv x4, x5
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x0) 

	
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
	.fill 3, 4, 0xdeadbeef
signature_2_0:
	.fill 3, 4, 0xdeadbeef
signature_3_0:
	.fill 3, 4, 0xdeadbeef
signature_4_0:
	.fill 3, 4, 0xdeadbeef
signature_5_0:
	.fill 3, 4, 0xdeadbeef
signature_6_0:
	.fill 3, 4, 0xdeadbeef
signature_7_0:
	.fill 3, 4, 0xdeadbeef
signature_8_0:
	.fill 3, 4, 0xdeadbeef
signature_9_0:
	.fill 3, 4, 0xdeadbeef
signature_10_0:
	.fill 3, 4, 0xdeadbeef
signature_11_0:
	.fill 3, 4, 0xdeadbeef
signature_12_0:
	.fill 3, 4, 0xdeadbeef
signature_13_0:
	.fill 3, 4, 0xdeadbeef
signature_14_0:
	.fill 3, 4, 0xdeadbeef
signature_15_0:
	.fill 3, 4, 0xdeadbeef
signature_16_0:
	.fill 3, 4, 0xdeadbeef
signature_17_0:
	.fill 3, 4, 0xdeadbeef
signature_18_0:
	.fill 3, 4, 0xdeadbeef
signature_19_0:
	.fill 3, 4, 0xdeadbeef
signature_20_0:
	.fill 3, 4, 0xdeadbeef
signature_21_0:
	.fill 3, 4, 0xdeadbeef
signature_22_0:
	.fill 3, 4, 0xdeadbeef
signature_23_0:
	.fill 3, 4, 0xdeadbeef
signature_24_0:
	.fill 3, 4, 0xdeadbeef
signature_25_0:
	.fill 3, 4, 0xdeadbeef
signature_26_0:
	.fill 3, 4, 0xdeadbeef
signature_27_0:
	.fill 3, 4, 0xdeadbeef
signature_28_0:
	.fill 3, 4, 0xdeadbeef
signature_29_0:
	.fill 3, 4, 0xdeadbeef
signature_30_0:
	.fill 3, 4, 0xdeadbeef
signature_31_0:
	.fill 3, 4, 0xdeadbeef
signature_32_0:
	.fill 3, 4, 0xdeadbeef
signature_33_0:
	.fill 3, 4, 0xdeadbeef
signature_34_0:
	.fill 3, 4, 0xdeadbeef
signature_35_0:
	.fill 3, 4, 0xdeadbeef
signature_36_0:
	.fill 3, 4, 0xdeadbeef
signature_37_0:
	.fill 3, 4, 0xdeadbeef
signature_38_0:
	.fill 3, 4, 0xdeadbeef
signature_39_0:
	.fill 3, 4, 0xdeadbeef
signature_40_0:
	.fill 3, 4, 0xdeadbeef
signature_41_0:
	.fill 3, 4, 0xdeadbeef
signature_42_0:
	.fill 3, 4, 0xdeadbeef
signature_43_0:
	.fill 3, 4, 0xdeadbeef
signature_44_0:
	.fill 3, 4, 0xdeadbeef
signature_45_0:
	.fill 3, 4, 0xdeadbeef
signature_46_0:
	.fill 3, 4, 0xdeadbeef
signature_47_0:
	.fill 3, 4, 0xdeadbeef
signature_48_0:
	.fill 3, 4, 0xdeadbeef
signature_49_0:
	.fill 3, 4, 0xdeadbeef
signature_50_0:
	.fill 3, 4, 0xdeadbeef
signature_51_0:
	.fill 3, 4, 0xdeadbeef
signature_52_0:
	.fill 3, 4, 0xdeadbeef
signature_53_0:
	.fill 3, 4, 0xdeadbeef
signature_54_0:
	.fill 3, 4, 0xdeadbeef
signature_55_0:
	.fill 3, 4, 0xdeadbeef
signature_56_0:
	.fill 3, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

