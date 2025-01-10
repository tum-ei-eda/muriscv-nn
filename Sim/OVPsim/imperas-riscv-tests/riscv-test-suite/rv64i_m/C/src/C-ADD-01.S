// RISC-V Architectural Validation Test C-ADD-01
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
// Description: Testing instruction 'c.add'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.add)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.add)

    RVTEST_SIGBASE(x1,signature_1_0)

 
    # Testcase 0:  rd:x20(0x00000000), rs2:x29(0x54f4aeeb151a01ef), result rd:x20(0x54f4aeeb151a01ef)
    li  x20,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x54f4aeeb151a01ef)
    c.add x20, x29
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x54f4aeeb151a01ef) 
 
    # Testcase 1:  rd:x31(0x00000000), rs2:x21(0xf4bcf4a786569d27), result rd:x31(0xf4bcf4a786569d27)
    li  x31,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0xf4bcf4a786569d27)
    c.add x31, x21
    sd x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xf4bcf4a786569d27) 
 
    # Testcase 2:  rd:x11(0x00000000), rs2:x2(0xe1b1199b429ede3d), result rd:x11(0xe1b1199b429ede3d)
    li  x11,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xe1b1199b429ede3d)
    c.add x11, x2
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xe1b1199b429ede3d) 



    

    RVTEST_SIGBASE(x3,signature_2_0)

 
    # Testcase 3:  rd:x4(0x00000000), rs2:x1(0xe3977ec120219a51), result rd:x4(0xe3977ec120219a51)
    li  x4,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xe3977ec120219a51)
    c.add x4, x1
    sd x4, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xe3977ec120219a51) 
 
    # Testcase 4:  rd:x30(0x00000000), rs2:x6(0xb26566a091a8d5fd), result rd:x30(0xb26566a091a8d5fd)
    li  x30,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0xb26566a091a8d5fd)
    c.add x30, x6
    sd x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xb26566a091a8d5fd) 
 
    # Testcase 5:  rd:x2(0x00000000), rs2:x14(0x80bd3ffebd8f6c65), result rd:x2(0x80bd3ffebd8f6c65)
    li  x2,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x80bd3ffebd8f6c65)
    c.add x2, x14
    sd x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x80bd3ffebd8f6c65) 



    

    RVTEST_SIGBASE(x1,signature_3_0)

 
    # Testcase 6:  rd:x5(0x00000000), rs2:x12(0xf27008e60466250f), result rd:x5(0xf27008e60466250f)
    li  x5,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0xf27008e60466250f)
    c.add x5, x12
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf27008e60466250f) 
 
    # Testcase 7:  rd:x26(0x00000000), rs2:x3(0xc3e260bde31ffa64), result rd:x26(0xc3e260bde31ffa64)
    li  x26,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0xc3e260bde31ffa64)
    c.add x26, x3
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xc3e260bde31ffa64) 
 
    # Testcase 8:  rd:x19(0x00000000), rs2:x8(0xc8484a3c737ad3a), result rd:x19(0xc8484a3c737ad3a)
    li  x19,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0xc8484a3c737ad3a)
    c.add x19, x8
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xc8484a3c737ad3a) 



    

    RVTEST_SIGBASE(x2,signature_4_0)

 
    # Testcase 9:  rd:x10(0x00000000), rs2:x1(0x2f7b22b7e54c8c1e), result rd:x10(0x2f7b22b7e54c8c1e)
    li  x10,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x2f7b22b7e54c8c1e)
    c.add x10, x1
    sd x10, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x2f7b22b7e54c8c1e) 
 
    # Testcase 10:  rd:x18(0x00000000), rs2:x24(0xa783d03f7ca660db), result rd:x18(0xa783d03f7ca660db)
    li  x18,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0xa783d03f7ca660db)
    c.add x18, x24
    sd x18, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xa783d03f7ca660db) 
 
    # Testcase 11:  rd:x1(0x00000000), rs2:x22(0xbf042c8c0692dadf), result rd:x1(0xbf042c8c0692dadf)
    li  x1,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0xbf042c8c0692dadf)
    c.add x1, x22
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xbf042c8c0692dadf) 



    

    RVTEST_SIGBASE(x3,signature_5_0)

 
    # Testcase 12:  rd:x2(0x00000000), rs2:x31(0xfd7b9df82c63c847), result rd:x2(0xfd7b9df82c63c847)
    li  x2,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0xfd7b9df82c63c847)
    c.add x2, x31
    sd x2, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xfd7b9df82c63c847) 
 
    # Testcase 13:  rd:x1(0x00000000), rs2:x18(0x807fe203fbba7ae7), result rd:x1(0x807fe203fbba7ae7)
    li  x1,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x807fe203fbba7ae7)
    c.add x1, x18
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x807fe203fbba7ae7) 
 
    # Testcase 14:  rd:x1(0x00000000), rs2:x7(0xafaa29d195b62bf), result rd:x1(0xafaa29d195b62bf)
    li  x1,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xafaa29d195b62bf)
    c.add x1, x7
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xafaa29d195b62bf) 



    

    RVTEST_SIGBASE(x1,signature_6_0)

 
    # Testcase 15:  rd:x12(0x00000000), rs2:x23(0xa14cf866f600a3d1), result rd:x12(0xa14cf866f600a3d1)
    li  x12,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xa14cf866f600a3d1)
    c.add x12, x23
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xa14cf866f600a3d1) 
 
    # Testcase 16:  rd:x10(0x00000000), rs2:x3(0x413f2c6234b80fd4), result rd:x10(0x413f2c6234b80fd4)
    li  x10,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x413f2c6234b80fd4)
    c.add x10, x3
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x413f2c6234b80fd4) 
 
    # Testcase 17:  rd:x8(0x00000000), rs2:x14(0xe2fe64433aef5ff4), result rd:x8(0xe2fe64433aef5ff4)
    li  x8,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0xe2fe64433aef5ff4)
    c.add x8, x14
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xe2fe64433aef5ff4) 



    

    RVTEST_SIGBASE(x1,signature_7_0)

 
    # Testcase 18:  rd:x8(0x00000000), rs2:x4(0x2c370a9a34267ad9), result rd:x8(0x2c370a9a34267ad9)
    li  x8,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x2c370a9a34267ad9)
    c.add x8, x4
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2c370a9a34267ad9) 
 
    # Testcase 19:  rd:x14(0x00000000), rs2:x25(0x701512f5681454c0), result rd:x14(0x701512f5681454c0)
    li  x14,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x701512f5681454c0)
    c.add x14, x25
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x701512f5681454c0) 
 
    # Testcase 20:  rd:x13(0x00000000), rs2:x4(0x2882a0b367dd3492), result rd:x13(0x2882a0b367dd3492)
    li  x13,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x2882a0b367dd3492)
    c.add x13, x4
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x2882a0b367dd3492) 



    

    RVTEST_SIGBASE(x2,signature_8_0)

 
    # Testcase 21:  rd:x18(0x00000000), rs2:x15(0x2a81b798b02d663e), result rd:x18(0x2a81b798b02d663e)
    li  x18,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x2a81b798b02d663e)
    c.add x18, x15
    sd x18, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x2a81b798b02d663e) 
 
    # Testcase 22:  rd:x1(0x00000000), rs2:x21(0x91dd5ad6b2d3f1c5), result rd:x1(0x91dd5ad6b2d3f1c5)
    li  x1,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x91dd5ad6b2d3f1c5)
    c.add x1, x21
    sd x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x91dd5ad6b2d3f1c5) 
 
    # Testcase 23:  rd:x19(0x00000000), rs2:x5(0xc68101ee824d39ae), result rd:x19(0xc68101ee824d39ae)
    li  x19,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0xc68101ee824d39ae)
    c.add x19, x5
    sd x19, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xc68101ee824d39ae) 



    

    RVTEST_SIGBASE(x1,signature_9_0)

 
    # Testcase 24:  rd:x30(0x00000000), rs2:x31(0x42f1d6295233a4dd), result rd:x30(0x42f1d6295233a4dd)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x42f1d6295233a4dd)
    c.add x30, x31
    sd x30, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x42f1d6295233a4dd) 
 
    # Testcase 25:  rd:x18(0x00000000), rs2:x2(0x589f2ccdd4983650), result rd:x18(0x589f2ccdd4983650)
    li  x18,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x589f2ccdd4983650)
    c.add x18, x2
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x589f2ccdd4983650) 
 
    # Testcase 26:  rd:x23(0x00000000), rs2:x4(0xcddbdf6f18fc88d5), result rd:x23(0xcddbdf6f18fc88d5)
    li  x23,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xcddbdf6f18fc88d5)
    c.add x23, x4
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xcddbdf6f18fc88d5) 



    

    RVTEST_SIGBASE(x1,signature_10_0)

 
    # Testcase 27:  rd:x4(0x00000000), rs2:x20(0x14cf50e37bf4071), result rd:x4(0x14cf50e37bf4071)
    li  x4,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x14cf50e37bf4071)
    c.add x4, x20
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x14cf50e37bf4071) 
 
    # Testcase 28:  rd:x16(0x00000000), rs2:x14(0x4d236af8c83b3c30), result rd:x16(0x4d236af8c83b3c30)
    li  x16,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x4d236af8c83b3c30)
    c.add x16, x14
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x4d236af8c83b3c30) 
 
    # Testcase 29:  rd:x29(0x00000000), rs2:x7(0xc9e2ce4fd1bc7dd8), result rd:x29(0xc9e2ce4fd1bc7dd8)
    li  x29,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xc9e2ce4fd1bc7dd8)
    c.add x29, x7
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xc9e2ce4fd1bc7dd8) 



    

    RVTEST_SIGBASE(x1,signature_11_0)

 
    # Testcase 30:  rd:x15(0x00000000), rs2:x7(0x8000000000000000), result rd:x15(0x8000000000000000)
    li  x15,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x8000000000000000)
    c.add x15, x7
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x8000000000000000) 
 
    # Testcase 31:  rd:x10(0x00000000), rs2:x18(0xffffffffffffffff), result rd:x10(0xffffffffffffffff)
    li  x10,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0xffffffffffffffff)
    c.add x10, x18
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffffffff) 
 
    # Testcase 32:  rd:x11(0x00000000), rs2:x15(0xffffffffffffffff), result rd:x11(0xffffffffffffffff)
    li  x11,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0xffffffffffffffff)
    c.add x11, x15
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffffffff) 



    

    RVTEST_SIGBASE(x3,signature_12_0)

 
    # Testcase 33:  rd:x7(0x00000000), rs2:x23(0xffffffffffffffff), result rd:x7(0xffffffffffffffff)
    li  x7,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xffffffffffffffff)
    c.add x7, x23
    sd x7, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xffffffffffffffff) 
 
    # Testcase 34:  rd:x1(0x00000000), rs2:x2(0x00000001), result rd:x1(0x00000001)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x1)
    c.add x1, x2
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x1) 
 
    # Testcase 35:  rd:x20(0x00000000), rs2:x29(0x7fffffffffffffff), result rd:x20(0x7fffffffffffffff)
    li  x20,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x7fffffffffffffff)
    c.add x20, x29
    sd x20, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x7fffffffffffffff) 



    

    RVTEST_SIGBASE(x2,signature_13_0)

 
    # Testcase 36:  rd:x20(0x00000000), rs2:x1(0xffffffffffffffff), result rd:x20(0xffffffffffffffff)
    li  x20,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xffffffffffffffff)
    c.add x20, x1
    sd x20, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffffffff) 
 
    # Testcase 37:  rd:x31(0x00000000), rs2:x28(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.add x31, x28
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0) 
 
    # Testcase 38:  rd:x22(0x00000000), rs2:x24(0x8000000000000000), result rd:x22(0x8000000000000000)
    li  x22,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x8000000000000000)
    c.add x22, x24
    sd x22, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x8000000000000000) 



    

    RVTEST_SIGBASE(x4,signature_14_0)

 
    # Testcase 39:  rd:x17(0x00000000), rs2:x25(0xffffffffffffffff), result rd:x17(0xffffffffffffffff)
    li  x17,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0xffffffffffffffff)
    c.add x17, x25
    sd x17, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0xffffffffffffffff) 
 
    # Testcase 40:  rd:x1(0x00000000), rs2:x2(0xfffffffffffffffe), result rd:x1(0xfffffffffffffffe)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xfffffffffffffffe)
    c.add x1, x2
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffffffffe) 
 
    # Testcase 41:  rd:x2(0x00000000), rs2:x3(0x7fffffffffffffff), result rd:x2(0x7fffffffffffffff)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x7fffffffffffffff)
    c.add x2, x3
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x7fffffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_15_0)

 
    # Testcase 42:  rd:x3(0x00000000), rs2:x4(0xbfffffffffffffff), result rd:x3(0xbfffffffffffffff)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xbfffffffffffffff)
    c.add x3, x4
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xbfffffffffffffff) 
 
    # Testcase 43:  rd:x4(0x00000000), rs2:x5(0xdfffffffffffffff), result rd:x4(0xdfffffffffffffff)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0xdfffffffffffffff)
    c.add x4, x5
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xdfffffffffffffff) 
 
    # Testcase 44:  rd:x5(0x00000000), rs2:x6(0xefffffffffffffff), result rd:x5(0xefffffffffffffff)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0xefffffffffffffff)
    c.add x5, x6
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xefffffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_16_0)

 
    # Testcase 45:  rd:x6(0x00000000), rs2:x7(0xf7ffffffffffffff), result rd:x6(0xf7ffffffffffffff)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xf7ffffffffffffff)
    c.add x6, x7
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xf7ffffffffffffff) 
 
    # Testcase 46:  rd:x7(0x00000000), rs2:x8(0xfbffffffffffffff), result rd:x7(0xfbffffffffffffff)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0xfbffffffffffffff)
    c.add x7, x8
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xfbffffffffffffff) 
 
    # Testcase 47:  rd:x8(0x00000000), rs2:x9(0xfdffffffffffffff), result rd:x8(0xfdffffffffffffff)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0xfdffffffffffffff)
    c.add x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfdffffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_17_0)

 
    # Testcase 48:  rd:x9(0x00000000), rs2:x10(0xfeffffffffffffff), result rd:x9(0xfeffffffffffffff)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0xfeffffffffffffff)
    c.add x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfeffffffffffffff) 
 
    # Testcase 49:  rd:x10(0x00000000), rs2:x11(0xff7fffffffffffff), result rd:x10(0xff7fffffffffffff)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0xff7fffffffffffff)
    c.add x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xff7fffffffffffff) 
 
    # Testcase 50:  rd:x11(0x00000000), rs2:x12(0xffbfffffffffffff), result rd:x11(0xffbfffffffffffff)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0xffbfffffffffffff)
    c.add x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffbfffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_18_0)

 
    # Testcase 51:  rd:x12(0x00000000), rs2:x13(0xffdfffffffffffff), result rd:x12(0xffdfffffffffffff)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0xffdfffffffffffff)
    c.add x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffdfffffffffffff) 
 
    # Testcase 52:  rd:x13(0x00000000), rs2:x14(0xffefffffffffffff), result rd:x13(0xffefffffffffffff)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0xffefffffffffffff)
    c.add x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffefffffffffffff) 
 
    # Testcase 53:  rd:x14(0x00000000), rs2:x15(0xfff7ffffffffffff), result rd:x14(0xfff7ffffffffffff)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0xfff7ffffffffffff)
    c.add x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfff7ffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_19_0)

 
    # Testcase 54:  rd:x15(0x00000000), rs2:x16(0xfffbffffffffffff), result rd:x15(0xfffbffffffffffff)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0xfffbffffffffffff)
    c.add x15, x16
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffbffffffffffff) 
 
    # Testcase 55:  rd:x16(0x00000000), rs2:x17(0xfffdffffffffffff), result rd:x16(0xfffdffffffffffff)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0xfffdffffffffffff)
    c.add x16, x17
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xfffdffffffffffff) 
 
    # Testcase 56:  rd:x17(0x00000000), rs2:x18(0xfffeffffffffffff), result rd:x17(0xfffeffffffffffff)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0xfffeffffffffffff)
    c.add x17, x18
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xfffeffffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_20_0)

 
    # Testcase 57:  rd:x18(0x00000000), rs2:x19(0xffff7fffffffffff), result rd:x18(0xffff7fffffffffff)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0xffff7fffffffffff)
    c.add x18, x19
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffff7fffffffffff) 
 
    # Testcase 58:  rd:x19(0x00000000), rs2:x20(0xffffbfffffffffff), result rd:x19(0xffffbfffffffffff)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0xffffbfffffffffff)
    c.add x19, x20
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffbfffffffffff) 
 
    # Testcase 59:  rd:x20(0x00000000), rs2:x21(0xffffdfffffffffff), result rd:x20(0xffffdfffffffffff)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0xffffdfffffffffff)
    c.add x20, x21
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffdfffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_21_0)

 
    # Testcase 60:  rd:x21(0x00000000), rs2:x22(0xffffefffffffffff), result rd:x21(0xffffefffffffffff)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0xffffefffffffffff)
    c.add x21, x22
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffefffffffffff) 
 
    # Testcase 61:  rd:x22(0x00000000), rs2:x23(0xfffff7ffffffffff), result rd:x22(0xfffff7ffffffffff)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xfffff7ffffffffff)
    c.add x22, x23
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffff7ffffffffff) 
 
    # Testcase 62:  rd:x23(0x00000000), rs2:x24(0xfffffbffffffffff), result rd:x23(0xfffffbffffffffff)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0xfffffbffffffffff)
    c.add x23, x24
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffbffffffffff) 



    

    RVTEST_SIGBASE(x1,signature_22_0)

 
    # Testcase 63:  rd:x24(0x00000000), rs2:x25(0xfffffdffffffffff), result rd:x24(0xfffffdffffffffff)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0xfffffdffffffffff)
    c.add x24, x25
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xfffffdffffffffff) 
 
    # Testcase 64:  rd:x25(0x00000000), rs2:x26(0xfffffeffffffffff), result rd:x25(0xfffffeffffffffff)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0xfffffeffffffffff)
    c.add x25, x26
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xfffffeffffffffff) 
 
    # Testcase 65:  rd:x26(0x00000000), rs2:x27(0xffffff7fffffffff), result rd:x26(0xffffff7fffffffff)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0xffffff7fffffffff)
    c.add x26, x27
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffff7fffffffff) 



    

    RVTEST_SIGBASE(x1,signature_23_0)

 
    # Testcase 66:  rd:x27(0x00000000), rs2:x28(0xffffffbfffffffff), result rd:x27(0xffffffbfffffffff)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0xffffffbfffffffff)
    c.add x27, x28
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffbfffffffff) 
 
    # Testcase 67:  rd:x28(0x00000000), rs2:x29(0xffffffdfffffffff), result rd:x28(0xffffffdfffffffff)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0xffffffdfffffffff)
    c.add x28, x29
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffdfffffffff) 
 
    # Testcase 68:  rd:x29(0x00000000), rs2:x30(0xffffffefffffffff), result rd:x29(0xffffffefffffffff)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0xffffffefffffffff)
    c.add x29, x30
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffefffffffff) 



    

    RVTEST_SIGBASE(x3,signature_24_0)

 
    # Testcase 69:  rd:x30(0x00000000), rs2:x31(0xfffffff7ffffffff), result rd:x30(0xfffffff7ffffffff)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0xfffffff7ffffffff)
    c.add x30, x31
    sd x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffff7ffffffff) 
 
    # Testcase 70:  rd:x31(0x00000000), rs2:x1(0xfffffffbffffffff), result rd:x31(0xfffffffbffffffff)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xfffffffbffffffff)
    c.add x31, x1
    sd x31, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffbffffffff) 
 
    # Testcase 71:  rd:x1(0x00000000), rs2:x2(0xfffffffdffffffff), result rd:x1(0xfffffffdffffffff)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xfffffffdffffffff)
    c.add x1, x2
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xfffffffdffffffff) 



    

    RVTEST_SIGBASE(x1,signature_25_0)

 
    # Testcase 72:  rd:x2(0x00000000), rs2:x3(0xfffffffeffffffff), result rd:x2(0xfffffffeffffffff)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0xfffffffeffffffff)
    c.add x2, x3
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0xfffffffeffffffff) 
 
    # Testcase 73:  rd:x3(0x00000000), rs2:x4(0xffffffff7fffffff), result rd:x3(0xffffffff7fffffff)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xffffffff7fffffff)
    c.add x3, x4
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffffff7fffffff) 
 
    # Testcase 74:  rd:x4(0x00000000), rs2:x5(0xffffffffbfffffff), result rd:x4(0xffffffffbfffffff)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0xffffffffbfffffff)
    c.add x4, x5
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0xffffffffbfffffff) 



    

    RVTEST_SIGBASE(x1,signature_26_0)

 
    # Testcase 75:  rd:x5(0x00000000), rs2:x6(0xffffffffdfffffff), result rd:x5(0xffffffffdfffffff)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0xffffffffdfffffff)
    c.add x5, x6
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffdfffffff) 
 
    # Testcase 76:  rd:x6(0x00000000), rs2:x7(0xffffffffefffffff), result rd:x6(0xffffffffefffffff)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0xffffffffefffffff)
    c.add x6, x7
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffefffffff) 
 
    # Testcase 77:  rd:x7(0x00000000), rs2:x8(0xfffffffff7ffffff), result rd:x7(0xfffffffff7ffffff)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0xfffffffff7ffffff)
    c.add x7, x8
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xfffffffff7ffffff) 



    

    RVTEST_SIGBASE(x1,signature_27_0)

 
    # Testcase 78:  rd:x8(0x00000000), rs2:x9(0xfffffffffbffffff), result rd:x8(0xfffffffffbffffff)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0xfffffffffbffffff)
    c.add x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffffbffffff) 
 
    # Testcase 79:  rd:x9(0x00000000), rs2:x10(0xfffffffffdffffff), result rd:x9(0xfffffffffdffffff)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0xfffffffffdffffff)
    c.add x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfffffffffdffffff) 
 
    # Testcase 80:  rd:x10(0x00000000), rs2:x11(0xfffffffffeffffff), result rd:x10(0xfffffffffeffffff)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0xfffffffffeffffff)
    c.add x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xfffffffffeffffff) 



    

    RVTEST_SIGBASE(x1,signature_28_0)

 
    # Testcase 81:  rd:x11(0x00000000), rs2:x12(0xffffffffff7fffff), result rd:x11(0xffffffffff7fffff)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0xffffffffff7fffff)
    c.add x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffff7fffff) 
 
    # Testcase 82:  rd:x12(0x00000000), rs2:x13(0xffffffffffbfffff), result rd:x12(0xffffffffffbfffff)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0xffffffffffbfffff)
    c.add x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffffffbfffff) 
 
    # Testcase 83:  rd:x13(0x00000000), rs2:x14(0xffffffffffdfffff), result rd:x13(0xffffffffffdfffff)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0xffffffffffdfffff)
    c.add x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffffdfffff) 



    

    RVTEST_SIGBASE(x1,signature_29_0)

 
    # Testcase 84:  rd:x14(0x00000000), rs2:x15(0xffffffffffefffff), result rd:x14(0xffffffffffefffff)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0xffffffffffefffff)
    c.add x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffffefffff) 
 
    # Testcase 85:  rd:x15(0x00000000), rs2:x16(0xfffffffffff7ffff), result rd:x15(0xfffffffffff7ffff)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0xfffffffffff7ffff)
    c.add x15, x16
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffff7ffff) 
 
    # Testcase 86:  rd:x16(0x00000000), rs2:x17(0xfffffffffffbffff), result rd:x16(0xfffffffffffbffff)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0xfffffffffffbffff)
    c.add x16, x17
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xfffffffffffbffff) 



    

    RVTEST_SIGBASE(x1,signature_30_0)

 
    # Testcase 87:  rd:x17(0x00000000), rs2:x18(0xfffffffffffdffff), result rd:x17(0xfffffffffffdffff)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0xfffffffffffdffff)
    c.add x17, x18
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xfffffffffffdffff) 
 
    # Testcase 88:  rd:x18(0x00000000), rs2:x19(0xfffffffffffeffff), result rd:x18(0xfffffffffffeffff)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0xfffffffffffeffff)
    c.add x18, x19
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xfffffffffffeffff) 
 
    # Testcase 89:  rd:x19(0x00000000), rs2:x20(0xffffffffffff7fff), result rd:x19(0xffffffffffff7fff)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0xffffffffffff7fff)
    c.add x19, x20
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffffff7fff) 



    

    RVTEST_SIGBASE(x1,signature_31_0)

 
    # Testcase 90:  rd:x20(0x00000000), rs2:x21(0xffffffffffffbfff), result rd:x20(0xffffffffffffbfff)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0xffffffffffffbfff)
    c.add x20, x21
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffffffffffbfff) 
 
    # Testcase 91:  rd:x21(0x00000000), rs2:x22(0xffffffffffffdfff), result rd:x21(0xffffffffffffdfff)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0xffffffffffffdfff)
    c.add x21, x22
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffffffffffdfff) 
 
    # Testcase 92:  rd:x22(0x00000000), rs2:x23(0xffffffffffffefff), result rd:x22(0xffffffffffffefff)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0xffffffffffffefff)
    c.add x22, x23
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xffffffffffffefff) 



    

    RVTEST_SIGBASE(x1,signature_32_0)

 
    # Testcase 93:  rd:x23(0x00000000), rs2:x24(0xfffffffffffff7ff), result rd:x23(0xfffffffffffff7ff)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0xfffffffffffff7ff)
    c.add x23, x24
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffffffffff7ff) 
 
    # Testcase 94:  rd:x24(0x00000000), rs2:x25(0xfffffffffffffbff), result rd:x24(0xfffffffffffffbff)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0xfffffffffffffbff)
    c.add x24, x25
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xfffffffffffffbff) 
 
    # Testcase 95:  rd:x25(0x00000000), rs2:x26(0xfffffffffffffdff), result rd:x25(0xfffffffffffffdff)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0xfffffffffffffdff)
    c.add x25, x26
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xfffffffffffffdff) 



    

    RVTEST_SIGBASE(x1,signature_33_0)

 
    # Testcase 96:  rd:x26(0x00000000), rs2:x27(0xfffffffffffffeff), result rd:x26(0xfffffffffffffeff)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0xfffffffffffffeff)
    c.add x26, x27
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xfffffffffffffeff) 
 
    # Testcase 97:  rd:x27(0x00000000), rs2:x28(0xffffffffffffff7f), result rd:x27(0xffffffffffffff7f)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0xffffffffffffff7f)
    c.add x27, x28
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffffffffff7f) 
 
    # Testcase 98:  rd:x28(0x00000000), rs2:x29(0xffffffffffffffbf), result rd:x28(0xffffffffffffffbf)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0xffffffffffffffbf)
    c.add x28, x29
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffffffffffbf) 



    

    RVTEST_SIGBASE(x2,signature_34_0)

 
    # Testcase 99:  rd:x29(0x00000000), rs2:x30(0xffffffffffffffdf), result rd:x29(0xffffffffffffffdf)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0xffffffffffffffdf)
    c.add x29, x30
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0xffffffffffffffdf) 
 
    # Testcase 100:  rd:x30(0x00000000), rs2:x31(0xffffffffffffffef), result rd:x30(0xffffffffffffffef)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0xffffffffffffffef)
    c.add x30, x31
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xffffffffffffffef) 
 
    # Testcase 101:  rd:x31(0x00000000), rs2:x1(0xfffffffffffffff7), result rd:x31(0xfffffffffffffff7)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0xfffffffffffffff7)
    c.add x31, x1
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xfffffffffffffff7) 



    

    RVTEST_SIGBASE(x5,signature_35_0)

 
    # Testcase 102:  rd:x1(0x00000000), rs2:x2(0xfffffffffffffffb), result rd:x1(0xfffffffffffffffb)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0xfffffffffffffffb)
    c.add x1, x2
    sd x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffffffffb) 
 
    # Testcase 103:  rd:x2(0x00000000), rs2:x3(0xfffffffffffffffd), result rd:x2(0xfffffffffffffffd)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0xfffffffffffffffd)
    c.add x2, x3
    sd x2, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0xfffffffffffffffd) 
 
    # Testcase 104:  rd:x3(0x00000000), rs2:x4(0xfffffffffffffffe), result rd:x3(0xfffffffffffffffe)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0xfffffffffffffffe)
    c.add x3, x4
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffffffffffe) 



    

    RVTEST_SIGBASE(x1,signature_36_0)

 
    # Testcase 105:  rd:x4(0x00000000), rs2:x5(0x8000000000000000), result rd:x4(0x8000000000000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x8000000000000000)
    c.add x4, x5
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x8000000000000000) 
 
    # Testcase 106:  rd:x5(0x00000000), rs2:x6(0x4000000000000000), result rd:x5(0x4000000000000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x4000000000000000)
    c.add x5, x6
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x4000000000000000) 
 
    # Testcase 107:  rd:x6(0x00000000), rs2:x7(0x2000000000000000), result rd:x6(0x2000000000000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x2000000000000000)
    c.add x6, x7
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x2000000000000000) 



    

    RVTEST_SIGBASE(x1,signature_37_0)

 
    # Testcase 108:  rd:x7(0x00000000), rs2:x8(0x1000000000000000), result rd:x7(0x1000000000000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x1000000000000000)
    c.add x7, x8
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1000000000000000) 
 
    # Testcase 109:  rd:x8(0x00000000), rs2:x9(0x800000000000000), result rd:x8(0x800000000000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x800000000000000)
    c.add x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x800000000000000) 
 
    # Testcase 110:  rd:x9(0x00000000), rs2:x10(0x400000000000000), result rd:x9(0x400000000000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x400000000000000)
    c.add x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x400000000000000) 



    

    RVTEST_SIGBASE(x1,signature_38_0)

 
    # Testcase 111:  rd:x10(0x00000000), rs2:x11(0x200000000000000), result rd:x10(0x200000000000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x200000000000000)
    c.add x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x200000000000000) 
 
    # Testcase 112:  rd:x11(0x00000000), rs2:x12(0x100000000000000), result rd:x11(0x100000000000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x100000000000000)
    c.add x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x100000000000000) 
 
    # Testcase 113:  rd:x12(0x00000000), rs2:x13(0x80000000000000), result rd:x12(0x80000000000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x80000000000000)
    c.add x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x80000000000000) 



    

    RVTEST_SIGBASE(x1,signature_39_0)

 
    # Testcase 114:  rd:x13(0x00000000), rs2:x14(0x40000000000000), result rd:x13(0x40000000000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x40000000000000)
    c.add x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x40000000000000) 
 
    # Testcase 115:  rd:x14(0x00000000), rs2:x15(0x20000000000000), result rd:x14(0x20000000000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x20000000000000)
    c.add x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x20000000000000) 
 
    # Testcase 116:  rd:x15(0x00000000), rs2:x16(0x10000000000000), result rd:x15(0x10000000000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x10000000000000)
    c.add x15, x16
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x10000000000000) 



    

    RVTEST_SIGBASE(x1,signature_40_0)

 
    # Testcase 117:  rd:x16(0x00000000), rs2:x17(0x8000000000000), result rd:x16(0x8000000000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x8000000000000)
    c.add x16, x17
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x8000000000000) 
 
    # Testcase 118:  rd:x17(0x00000000), rs2:x18(0x4000000000000), result rd:x17(0x4000000000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x4000000000000)
    c.add x17, x18
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x4000000000000) 
 
    # Testcase 119:  rd:x18(0x00000000), rs2:x19(0x2000000000000), result rd:x18(0x2000000000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x2000000000000)
    c.add x18, x19
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x2000000000000) 



    

    RVTEST_SIGBASE(x1,signature_41_0)

 
    # Testcase 120:  rd:x19(0x00000000), rs2:x20(0x1000000000000), result rd:x19(0x1000000000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x1000000000000)
    c.add x19, x20
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1000000000000) 
 
    # Testcase 121:  rd:x20(0x00000000), rs2:x21(0x800000000000), result rd:x20(0x800000000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x800000000000)
    c.add x20, x21
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x800000000000) 
 
    # Testcase 122:  rd:x21(0x00000000), rs2:x22(0x400000000000), result rd:x21(0x400000000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x400000000000)
    c.add x21, x22
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x400000000000) 



    

    RVTEST_SIGBASE(x1,signature_42_0)

 
    # Testcase 123:  rd:x22(0x00000000), rs2:x23(0x200000000000), result rd:x22(0x200000000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x200000000000)
    c.add x22, x23
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x200000000000) 
 
    # Testcase 124:  rd:x23(0x00000000), rs2:x24(0x100000000000), result rd:x23(0x100000000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x100000000000)
    c.add x23, x24
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x100000000000) 
 
    # Testcase 125:  rd:x24(0x00000000), rs2:x25(0x80000000000), result rd:x24(0x80000000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x80000000000)
    c.add x24, x25
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x80000000000) 



    

    RVTEST_SIGBASE(x1,signature_43_0)

 
    # Testcase 126:  rd:x25(0x00000000), rs2:x26(0x40000000000), result rd:x25(0x40000000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x40000000000)
    c.add x25, x26
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x40000000000) 
 
    # Testcase 127:  rd:x26(0x00000000), rs2:x27(0x20000000000), result rd:x26(0x20000000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x20000000000)
    c.add x26, x27
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x20000000000) 
 
    # Testcase 128:  rd:x27(0x00000000), rs2:x28(0x10000000000), result rd:x27(0x10000000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x10000000000)
    c.add x27, x28
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x10000000000) 



    

    RVTEST_SIGBASE(x1,signature_44_0)

 
    # Testcase 129:  rd:x28(0x00000000), rs2:x29(0x8000000000), result rd:x28(0x8000000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x8000000000)
    c.add x28, x29
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x8000000000) 
 
    # Testcase 130:  rd:x29(0x00000000), rs2:x30(0x4000000000), result rd:x29(0x4000000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x4000000000)
    c.add x29, x30
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x4000000000) 
 
    # Testcase 131:  rd:x30(0x00000000), rs2:x31(0x2000000000), result rd:x30(0x2000000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x2000000000)
    c.add x30, x31
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x2000000000) 



    

    RVTEST_SIGBASE(x4,signature_45_0)

 
    # Testcase 132:  rd:x31(0x00000000), rs2:x1(0x1000000000), result rd:x31(0x1000000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x1000000000)
    c.add x31, x1
    sd x31, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x1000000000) 
 
    # Testcase 133:  rd:x1(0x00000000), rs2:x2(0x800000000), result rd:x1(0x800000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x800000000)
    c.add x1, x2
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x800000000) 
 
    # Testcase 134:  rd:x2(0x00000000), rs2:x3(0x400000000), result rd:x2(0x400000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x400000000)
    c.add x2, x3
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x400000000) 



    

    RVTEST_SIGBASE(x1,signature_46_0)

 
    # Testcase 135:  rd:x3(0x00000000), rs2:x4(0x200000000), result rd:x3(0x200000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x200000000)
    c.add x3, x4
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x200000000) 
 
    # Testcase 136:  rd:x4(0x00000000), rs2:x5(0x100000000), result rd:x4(0x100000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x100000000)
    c.add x4, x5
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x100000000) 
 
    # Testcase 137:  rd:x5(0x00000000), rs2:x6(0x80000000), result rd:x5(0x80000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x80000000)
    c.add x5, x6
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x80000000) 



    

    RVTEST_SIGBASE(x1,signature_47_0)

 
    # Testcase 138:  rd:x6(0x00000000), rs2:x7(0x40000000), result rd:x6(0x40000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x40000000)
    c.add x6, x7
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x40000000) 
 
    # Testcase 139:  rd:x7(0x00000000), rs2:x8(0x20000000), result rd:x7(0x20000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x20000000)
    c.add x7, x8
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x20000000) 
 
    # Testcase 140:  rd:x8(0x00000000), rs2:x9(0x10000000), result rd:x8(0x10000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x10000000)
    c.add x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x10000000) 



    

    RVTEST_SIGBASE(x1,signature_48_0)

 
    # Testcase 141:  rd:x9(0x00000000), rs2:x10(0x08000000), result rd:x9(0x08000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x8000000)
    c.add x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x8000000) 
 
    # Testcase 142:  rd:x10(0x00000000), rs2:x11(0x04000000), result rd:x10(0x04000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x4000000)
    c.add x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x4000000) 
 
    # Testcase 143:  rd:x11(0x00000000), rs2:x12(0x02000000), result rd:x11(0x02000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x2000000)
    c.add x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x2000000) 



    

    RVTEST_SIGBASE(x1,signature_49_0)

 
    # Testcase 144:  rd:x12(0x00000000), rs2:x13(0x01000000), result rd:x12(0x01000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x1000000)
    c.add x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1000000) 
 
    # Testcase 145:  rd:x13(0x00000000), rs2:x14(0x00800000), result rd:x13(0x00800000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x800000)
    c.add x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x800000) 
 
    # Testcase 146:  rd:x14(0x00000000), rs2:x15(0x00400000), result rd:x14(0x00400000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x400000)
    c.add x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x400000) 



    

    RVTEST_SIGBASE(x1,signature_50_0)

 
    # Testcase 147:  rd:x15(0x00000000), rs2:x16(0x00200000), result rd:x15(0x00200000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x200000)
    c.add x15, x16
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x200000) 
 
    # Testcase 148:  rd:x16(0x00000000), rs2:x17(0x00100000), result rd:x16(0x00100000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x100000)
    c.add x16, x17
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x100000) 
 
    # Testcase 149:  rd:x17(0x00000000), rs2:x18(0x00080000), result rd:x17(0x00080000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x80000)
    c.add x17, x18
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x80000) 



    

    RVTEST_SIGBASE(x1,signature_51_0)

 
    # Testcase 150:  rd:x18(0x00000000), rs2:x19(0x00040000), result rd:x18(0x00040000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x40000)
    c.add x18, x19
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x40000) 
 
    # Testcase 151:  rd:x19(0x00000000), rs2:x20(0x00020000), result rd:x19(0x00020000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x20000)
    c.add x19, x20
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x20000) 
 
    # Testcase 152:  rd:x20(0x00000000), rs2:x21(0x00010000), result rd:x20(0x00010000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x10000)
    c.add x20, x21
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x10000) 



    

    RVTEST_SIGBASE(x1,signature_52_0)

 
    # Testcase 153:  rd:x21(0x00000000), rs2:x22(0x00008000), result rd:x21(0x00008000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x8000)
    c.add x21, x22
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x8000) 
 
    # Testcase 154:  rd:x22(0x00000000), rs2:x23(0x00004000), result rd:x22(0x00004000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x4000)
    c.add x22, x23
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x4000) 
 
    # Testcase 155:  rd:x23(0x00000000), rs2:x24(0x00002000), result rd:x23(0x00002000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x2000)
    c.add x23, x24
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x2000) 



    

    RVTEST_SIGBASE(x1,signature_53_0)

 
    # Testcase 156:  rd:x24(0x00000000), rs2:x25(0x00001000), result rd:x24(0x00001000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x1000)
    c.add x24, x25
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1000) 
 
    # Testcase 157:  rd:x25(0x00000000), rs2:x26(0x00000800), result rd:x25(0x00000800)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x800)
    c.add x25, x26
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x800) 
 
    # Testcase 158:  rd:x26(0x00000000), rs2:x27(0x00000400), result rd:x26(0x00000400)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x400)
    c.add x26, x27
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x400) 



    

    RVTEST_SIGBASE(x1,signature_54_0)

 
    # Testcase 159:  rd:x27(0x00000000), rs2:x28(0x00000200), result rd:x27(0x00000200)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x200)
    c.add x27, x28
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x200) 
 
    # Testcase 160:  rd:x28(0x00000000), rs2:x29(0x00000100), result rd:x28(0x00000100)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x100)
    c.add x28, x29
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x100) 
 
    # Testcase 161:  rd:x29(0x00000000), rs2:x30(0x00000080), result rd:x29(0x00000080)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x80)
    c.add x29, x30
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x80) 



    

    RVTEST_SIGBASE(x3,signature_55_0)

 
    # Testcase 162:  rd:x30(0x00000000), rs2:x31(0x00000040), result rd:x30(0x00000040)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x40)
    c.add x30, x31
    sd x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x40) 
 
    # Testcase 163:  rd:x31(0x00000000), rs2:x1(0x00000020), result rd:x31(0x00000020)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x20)
    c.add x31, x1
    sd x31, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x20) 
 
    # Testcase 164:  rd:x1(0x00000000), rs2:x2(0x00000010), result rd:x1(0x00000010)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x10)
    c.add x1, x2
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x10) 



    

    RVTEST_SIGBASE(x1,signature_56_0)

 
    # Testcase 165:  rd:x2(0x00000000), rs2:x3(0x00000008), result rd:x2(0x00000008)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x8)
    c.add x2, x3
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x8) 
 
    # Testcase 166:  rd:x3(0x00000000), rs2:x4(0x00000004), result rd:x3(0x00000004)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x4)
    c.add x3, x4
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x4) 
 
    # Testcase 167:  rd:x4(0x00000000), rs2:x5(0x00000002), result rd:x4(0x00000002)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x2)
    c.add x4, x5
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x2) 



    

    RVTEST_SIGBASE(x1,signature_57_0)

 
    # Testcase 168:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.add x5, x6
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 
 
    # Testcase 169:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.add x6, x7
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 
 
    # Testcase 170:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.add x7, x8
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_58_0)

 
    # Testcase 171:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.add x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 172:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.add x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 173:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.add x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_59_0)

 
    # Testcase 174:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.add x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 175:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.add x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 176:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.add x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_60_0)

 
    # Testcase 177:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.add x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 178:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.add x15, x16
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 179:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.add x16, x17
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_61_0)

 
    # Testcase 180:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.add x17, x18
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 
 
    # Testcase 181:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.add x18, x19
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 
 
    # Testcase 182:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.add x19, x20
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_62_0)

 
    # Testcase 183:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.add x20, x21
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 
 
    # Testcase 184:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.add x21, x22
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 
 
    # Testcase 185:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.add x22, x23
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_63_0)

 
    # Testcase 186:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.add x23, x24
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 
 
    # Testcase 187:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.add x24, x25
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 
 
    # Testcase 188:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.add x25, x26
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_64_0)

 
    # Testcase 189:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.add x26, x27
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 
 
    # Testcase 190:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.add x27, x28
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 
 
    # Testcase 191:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.add x28, x29
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 



    

    RVTEST_SIGBASE(x2,signature_65_0)

 
    # Testcase 192:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.add x29, x30
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0) 
 
    # Testcase 193:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.add x30, x31
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0) 
 
    # Testcase 194:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.add x31, x1
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0) 



    

    RVTEST_SIGBASE(x5,signature_66_0)

 
    # Testcase 195:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.add x1, x2
    sd x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0) 
 
    # Testcase 196:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.add x2, x3
    sd x2, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0) 
 
    # Testcase 197:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.add x3, x4
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_67_0)

 
    # Testcase 198:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.add x4, x5
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0) 
 
    # Testcase 199:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.add x5, x6
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 
 
    # Testcase 200:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.add x6, x7
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_68_0)

 
    # Testcase 201:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.add x7, x8
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 
 
    # Testcase 202:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.add x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 203:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.add x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_69_0)

 
    # Testcase 204:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.add x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 205:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.add x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 206:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.add x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_70_0)

 
    # Testcase 207:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.add x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 208:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.add x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 209:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.add x15, x16
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_71_0)

 
    # Testcase 210:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.add x16, x17
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 
 
    # Testcase 211:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.add x17, x18
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 
 
    # Testcase 212:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.add x18, x19
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_72_0)

 
    # Testcase 213:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.add x19, x20
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 
 
    # Testcase 214:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.add x20, x21
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 
 
    # Testcase 215:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.add x21, x22
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_73_0)

 
    # Testcase 216:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.add x22, x23
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 
 
    # Testcase 217:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.add x23, x24
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 
 
    # Testcase 218:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.add x24, x25
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_74_0)

 
    # Testcase 219:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.add x25, x26
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 
 
    # Testcase 220:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.add x26, x27
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 
 
    # Testcase 221:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.add x27, x28
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_75_0)

 
    # Testcase 222:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.add x28, x29
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 
 
    # Testcase 223:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.add x29, x30
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0) 
 
    # Testcase 224:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.add x30, x31
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x0) 



    

    RVTEST_SIGBASE(x4,signature_76_0)

 
    # Testcase 225:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.add x31, x1
    sd x31, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0) 
 
    # Testcase 226:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.add x1, x2
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0) 
 
    # Testcase 227:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.add x2, x3
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_77_0)

 
    # Testcase 228:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.add x3, x4
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0) 
 
    # Testcase 229:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.add x4, x5
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0) 
 
    # Testcase 230:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.add x5, x6
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_78_0)

 
    # Testcase 231:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.add x6, x7
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 
 
    # Testcase 232:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.add x7, x8
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 
 
    # Testcase 233:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.add x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_79_0)

 
    # Testcase 234:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.add x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 235:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.add x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 236:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.add x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_80_0)

 
    # Testcase 237:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.add x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 238:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.add x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 239:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.add x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_81_0)

 
    # Testcase 240:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.add x15, x16
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 241:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.add x16, x17
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 
 
    # Testcase 242:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.add x17, x18
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_82_0)

 
    # Testcase 243:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.add x18, x19
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 
 
    # Testcase 244:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.add x19, x20
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 
 
    # Testcase 245:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.add x20, x21
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_83_0)

 
    # Testcase 246:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.add x21, x22
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 
 
    # Testcase 247:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.add x22, x23
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 
 
    # Testcase 248:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.add x23, x24
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_84_0)

 
    # Testcase 249:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.add x24, x25
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 
 
    # Testcase 250:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.add x25, x26
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 
 
    # Testcase 251:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.add x26, x27
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_85_0)

 
    # Testcase 252:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.add x27, x28
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 
 
    # Testcase 253:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.add x28, x29
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 
 
    # Testcase 254:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.add x29, x30
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0) 



    

    RVTEST_SIGBASE(x3,signature_86_0)

 
    # Testcase 255:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.add x30, x31
    sd x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0) 
 
    # Testcase 256:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.add x31, x1
    sd x31, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0) 
 
    # Testcase 257:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.add x1, x2
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_87_0)

 
    # Testcase 258:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.add x2, x3
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0) 
 
    # Testcase 259:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.add x3, x4
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0) 
 
    # Testcase 260:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.add x4, x5
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_88_0)

 
    # Testcase 261:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.add x5, x6
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 
 
    # Testcase 262:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.add x6, x7
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 
 
    # Testcase 263:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.add x7, x8
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_89_0)

 
    # Testcase 264:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.add x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 265:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x9,  MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.add x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 266:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x10,  MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.add x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_90_0)

 
    # Testcase 267:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x11,  MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.add x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 268:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x12,  MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.add x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 269:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x13,  MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.add x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_91_0)

 
    # Testcase 270:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x14,  MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.add x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 271:  rd:x15(0x00000000), rs2:x16(0x00000000), result rd:x15(0x00000000)
    li  x15,  MASK_XLEN(0x0)
    li  x16, MASK_XLEN(0x0)
    c.add x15, x16
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 272:  rd:x16(0x00000000), rs2:x17(0x00000000), result rd:x16(0x00000000)
    li  x16,  MASK_XLEN(0x0)
    li  x17, MASK_XLEN(0x0)
    c.add x16, x17
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_92_0)

 
    # Testcase 273:  rd:x17(0x00000000), rs2:x18(0x00000000), result rd:x17(0x00000000)
    li  x17,  MASK_XLEN(0x0)
    li  x18, MASK_XLEN(0x0)
    c.add x17, x18
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0) 
 
    # Testcase 274:  rd:x18(0x00000000), rs2:x19(0x00000000), result rd:x18(0x00000000)
    li  x18,  MASK_XLEN(0x0)
    li  x19, MASK_XLEN(0x0)
    c.add x18, x19
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0) 
 
    # Testcase 275:  rd:x19(0x00000000), rs2:x20(0x00000000), result rd:x19(0x00000000)
    li  x19,  MASK_XLEN(0x0)
    li  x20, MASK_XLEN(0x0)
    c.add x19, x20
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_93_0)

 
    # Testcase 276:  rd:x20(0x00000000), rs2:x21(0x00000000), result rd:x20(0x00000000)
    li  x20,  MASK_XLEN(0x0)
    li  x21, MASK_XLEN(0x0)
    c.add x20, x21
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0) 
 
    # Testcase 277:  rd:x21(0x00000000), rs2:x22(0x00000000), result rd:x21(0x00000000)
    li  x21,  MASK_XLEN(0x0)
    li  x22, MASK_XLEN(0x0)
    c.add x21, x22
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0) 
 
    # Testcase 278:  rd:x22(0x00000000), rs2:x23(0x00000000), result rd:x22(0x00000000)
    li  x22,  MASK_XLEN(0x0)
    li  x23, MASK_XLEN(0x0)
    c.add x22, x23
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_94_0)

 
    # Testcase 279:  rd:x23(0x00000000), rs2:x24(0x00000000), result rd:x23(0x00000000)
    li  x23,  MASK_XLEN(0x0)
    li  x24, MASK_XLEN(0x0)
    c.add x23, x24
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0) 
 
    # Testcase 280:  rd:x24(0x00000000), rs2:x25(0x00000000), result rd:x24(0x00000000)
    li  x24,  MASK_XLEN(0x0)
    li  x25, MASK_XLEN(0x0)
    c.add x24, x25
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0) 
 
    # Testcase 281:  rd:x25(0x00000000), rs2:x26(0x00000000), result rd:x25(0x00000000)
    li  x25,  MASK_XLEN(0x0)
    li  x26, MASK_XLEN(0x0)
    c.add x25, x26
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_95_0)

 
    # Testcase 282:  rd:x26(0x00000000), rs2:x27(0x00000000), result rd:x26(0x00000000)
    li  x26,  MASK_XLEN(0x0)
    li  x27, MASK_XLEN(0x0)
    c.add x26, x27
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0) 
 
    # Testcase 283:  rd:x27(0x00000000), rs2:x28(0x00000000), result rd:x27(0x00000000)
    li  x27,  MASK_XLEN(0x0)
    li  x28, MASK_XLEN(0x0)
    c.add x27, x28
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0) 
 
    # Testcase 284:  rd:x28(0x00000000), rs2:x29(0x00000000), result rd:x28(0x00000000)
    li  x28,  MASK_XLEN(0x0)
    li  x29, MASK_XLEN(0x0)
    c.add x28, x29
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0) 



    

    RVTEST_SIGBASE(x2,signature_96_0)

 
    # Testcase 285:  rd:x29(0x00000000), rs2:x30(0x00000000), result rd:x29(0x00000000)
    li  x29,  MASK_XLEN(0x0)
    li  x30, MASK_XLEN(0x0)
    c.add x29, x30
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0) 
 
    # Testcase 286:  rd:x30(0x00000000), rs2:x31(0x00000000), result rd:x30(0x00000000)
    li  x30,  MASK_XLEN(0x0)
    li  x31, MASK_XLEN(0x0)
    c.add x30, x31
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0) 
 
    # Testcase 287:  rd:x31(0x00000000), rs2:x1(0x00000000), result rd:x31(0x00000000)
    li  x31,  MASK_XLEN(0x0)
    li  x1, MASK_XLEN(0x0)
    c.add x31, x1
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0) 



    

    RVTEST_SIGBASE(x5,signature_97_0)

 
    # Testcase 288:  rd:x1(0x00000000), rs2:x2(0x00000000), result rd:x1(0x00000000)
    li  x1,  MASK_XLEN(0x0)
    li  x2, MASK_XLEN(0x0)
    c.add x1, x2
    sd x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0) 
 
    # Testcase 289:  rd:x2(0x00000000), rs2:x3(0x00000000), result rd:x2(0x00000000)
    li  x2,  MASK_XLEN(0x0)
    li  x3, MASK_XLEN(0x0)
    c.add x2, x3
    sd x2, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0) 
 
    # Testcase 290:  rd:x3(0x00000000), rs2:x4(0x00000000), result rd:x3(0x00000000)
    li  x3,  MASK_XLEN(0x0)
    li  x4, MASK_XLEN(0x0)
    c.add x3, x4
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_98_0)

 
    # Testcase 291:  rd:x4(0x00000000), rs2:x5(0x00000000), result rd:x4(0x00000000)
    li  x4,  MASK_XLEN(0x0)
    li  x5, MASK_XLEN(0x0)
    c.add x4, x5
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0) 
 
    # Testcase 292:  rd:x5(0x00000000), rs2:x6(0x00000000), result rd:x5(0x00000000)
    li  x5,  MASK_XLEN(0x0)
    li  x6, MASK_XLEN(0x0)
    c.add x5, x6
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0) 
 
    # Testcase 293:  rd:x6(0x00000000), rs2:x7(0x00000000), result rd:x6(0x00000000)
    li  x6,  MASK_XLEN(0x0)
    li  x7, MASK_XLEN(0x0)
    c.add x6, x7
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0) 



    

    RVTEST_SIGBASE(x1,signature_99_0)

 
    # Testcase 294:  rd:x7(0x00000000), rs2:x8(0x00000000), result rd:x7(0x00000000)
    li  x7,  MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.add x7, x8
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0) 
 
    # Testcase 295:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x8,  MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.add x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 

	
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
	.fill 3, 8, 0xdeadbeef
signature_2_0:
	.fill 3, 8, 0xdeadbeef
signature_3_0:
	.fill 3, 8, 0xdeadbeef
signature_4_0:
	.fill 3, 8, 0xdeadbeef
signature_5_0:
	.fill 3, 8, 0xdeadbeef
signature_6_0:
	.fill 3, 8, 0xdeadbeef
signature_7_0:
	.fill 3, 8, 0xdeadbeef
signature_8_0:
	.fill 3, 8, 0xdeadbeef
signature_9_0:
	.fill 3, 8, 0xdeadbeef
signature_10_0:
	.fill 3, 8, 0xdeadbeef
signature_11_0:
	.fill 3, 8, 0xdeadbeef
signature_12_0:
	.fill 3, 8, 0xdeadbeef
signature_13_0:
	.fill 3, 8, 0xdeadbeef
signature_14_0:
	.fill 3, 8, 0xdeadbeef
signature_15_0:
	.fill 3, 8, 0xdeadbeef
signature_16_0:
	.fill 3, 8, 0xdeadbeef
signature_17_0:
	.fill 3, 8, 0xdeadbeef
signature_18_0:
	.fill 3, 8, 0xdeadbeef
signature_19_0:
	.fill 3, 8, 0xdeadbeef
signature_20_0:
	.fill 3, 8, 0xdeadbeef
signature_21_0:
	.fill 3, 8, 0xdeadbeef
signature_22_0:
	.fill 3, 8, 0xdeadbeef
signature_23_0:
	.fill 3, 8, 0xdeadbeef
signature_24_0:
	.fill 3, 8, 0xdeadbeef
signature_25_0:
	.fill 3, 8, 0xdeadbeef
signature_26_0:
	.fill 3, 8, 0xdeadbeef
signature_27_0:
	.fill 3, 8, 0xdeadbeef
signature_28_0:
	.fill 3, 8, 0xdeadbeef
signature_29_0:
	.fill 3, 8, 0xdeadbeef
signature_30_0:
	.fill 3, 8, 0xdeadbeef
signature_31_0:
	.fill 3, 8, 0xdeadbeef
signature_32_0:
	.fill 3, 8, 0xdeadbeef
signature_33_0:
	.fill 3, 8, 0xdeadbeef
signature_34_0:
	.fill 3, 8, 0xdeadbeef
signature_35_0:
	.fill 3, 8, 0xdeadbeef
signature_36_0:
	.fill 3, 8, 0xdeadbeef
signature_37_0:
	.fill 3, 8, 0xdeadbeef
signature_38_0:
	.fill 3, 8, 0xdeadbeef
signature_39_0:
	.fill 3, 8, 0xdeadbeef
signature_40_0:
	.fill 3, 8, 0xdeadbeef
signature_41_0:
	.fill 3, 8, 0xdeadbeef
signature_42_0:
	.fill 3, 8, 0xdeadbeef
signature_43_0:
	.fill 3, 8, 0xdeadbeef
signature_44_0:
	.fill 3, 8, 0xdeadbeef
signature_45_0:
	.fill 3, 8, 0xdeadbeef
signature_46_0:
	.fill 3, 8, 0xdeadbeef
signature_47_0:
	.fill 3, 8, 0xdeadbeef
signature_48_0:
	.fill 3, 8, 0xdeadbeef
signature_49_0:
	.fill 3, 8, 0xdeadbeef
signature_50_0:
	.fill 3, 8, 0xdeadbeef
signature_51_0:
	.fill 3, 8, 0xdeadbeef
signature_52_0:
	.fill 3, 8, 0xdeadbeef
signature_53_0:
	.fill 3, 8, 0xdeadbeef
signature_54_0:
	.fill 3, 8, 0xdeadbeef
signature_55_0:
	.fill 3, 8, 0xdeadbeef
signature_56_0:
	.fill 3, 8, 0xdeadbeef
signature_57_0:
	.fill 3, 8, 0xdeadbeef
signature_58_0:
	.fill 3, 8, 0xdeadbeef
signature_59_0:
	.fill 3, 8, 0xdeadbeef
signature_60_0:
	.fill 3, 8, 0xdeadbeef
signature_61_0:
	.fill 3, 8, 0xdeadbeef
signature_62_0:
	.fill 3, 8, 0xdeadbeef
signature_63_0:
	.fill 3, 8, 0xdeadbeef
signature_64_0:
	.fill 3, 8, 0xdeadbeef
signature_65_0:
	.fill 3, 8, 0xdeadbeef
signature_66_0:
	.fill 3, 8, 0xdeadbeef
signature_67_0:
	.fill 3, 8, 0xdeadbeef
signature_68_0:
	.fill 3, 8, 0xdeadbeef
signature_69_0:
	.fill 3, 8, 0xdeadbeef
signature_70_0:
	.fill 3, 8, 0xdeadbeef
signature_71_0:
	.fill 3, 8, 0xdeadbeef
signature_72_0:
	.fill 3, 8, 0xdeadbeef
signature_73_0:
	.fill 3, 8, 0xdeadbeef
signature_74_0:
	.fill 3, 8, 0xdeadbeef
signature_75_0:
	.fill 3, 8, 0xdeadbeef
signature_76_0:
	.fill 3, 8, 0xdeadbeef
signature_77_0:
	.fill 3, 8, 0xdeadbeef
signature_78_0:
	.fill 3, 8, 0xdeadbeef
signature_79_0:
	.fill 3, 8, 0xdeadbeef
signature_80_0:
	.fill 3, 8, 0xdeadbeef
signature_81_0:
	.fill 3, 8, 0xdeadbeef
signature_82_0:
	.fill 3, 8, 0xdeadbeef
signature_83_0:
	.fill 3, 8, 0xdeadbeef
signature_84_0:
	.fill 3, 8, 0xdeadbeef
signature_85_0:
	.fill 3, 8, 0xdeadbeef
signature_86_0:
	.fill 3, 8, 0xdeadbeef
signature_87_0:
	.fill 3, 8, 0xdeadbeef
signature_88_0:
	.fill 3, 8, 0xdeadbeef
signature_89_0:
	.fill 3, 8, 0xdeadbeef
signature_90_0:
	.fill 3, 8, 0xdeadbeef
signature_91_0:
	.fill 3, 8, 0xdeadbeef
signature_92_0:
	.fill 3, 8, 0xdeadbeef
signature_93_0:
	.fill 3, 8, 0xdeadbeef
signature_94_0:
	.fill 3, 8, 0xdeadbeef
signature_95_0:
	.fill 3, 8, 0xdeadbeef
signature_96_0:
	.fill 3, 8, 0xdeadbeef
signature_97_0:
	.fill 3, 8, 0xdeadbeef
signature_98_0:
	.fill 3, 8, 0xdeadbeef
signature_99_0:
	.fill 3, 8, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

