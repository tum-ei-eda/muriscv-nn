// RISC-V Architectural Validation Test C-SUBW-01
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
// Description: Testing instruction 'c.subw'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.subw)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.subw)

    RVTEST_SIGBASE(x1,signature_1_0)

 
    # Testcase 0:  rd:x11(0x00000000), rs2:x12(0x54f4aeeb151a01ef), result rd:x11(0xffffffffeae5fe11)
    li  x12, MASK_XLEN(0x54f4aeeb151a01ef)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffeae5fe11) 
 
    # Testcase 1:  rd:x14(0x00000000), rs2:x12(0xf4bcf4a786569d27), result rd:x14(0x79a962d9)
    li  x12, MASK_XLEN(0xf4bcf4a786569d27)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x12
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x79a962d9) 
 
    # Testcase 2:  rd:x10(0x00000000), rs2:x8(0xe1b1199b429ede3d), result rd:x10(0xffffffffbd6121c3)
    li  x8, MASK_XLEN(0xe1b1199b429ede3d)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x8
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffbd6121c3) 
 
    # Testcase 3:  rd:x11(0x00000000), rs2:x15(0xe3977ec120219a51), result rd:x11(0xffffffffdfde65af)
    li  x15, MASK_XLEN(0xe3977ec120219a51)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x15
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffdfde65af) 
 
    # Testcase 4:  rd:x13(0x00000000), rs2:x8(0xb26566a091a8d5fd), result rd:x13(0x6e572a03)
    li  x8, MASK_XLEN(0xb26566a091a8d5fd)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x8
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x6e572a03) 


    

    RVTEST_SIGBASE(x1,signature_2_0)

 
    # Testcase 5:  rd:x13(0x00000000), rs2:x12(0x80bd3ffebd8f6c65), result rd:x13(0x4270939b)
    li  x12, MASK_XLEN(0x80bd3ffebd8f6c65)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x12
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x4270939b) 
 
    # Testcase 6:  rd:x11(0x00000000), rs2:x9(0xf27008e60466250f), result rd:x11(0xfffffffffb99daf1)
    li  x9, MASK_XLEN(0xf27008e60466250f)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x9
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffffb99daf1) 
 
    # Testcase 7:  rd:x10(0x00000000), rs2:x15(0xc3e260bde31ffa64), result rd:x10(0x1ce0059c)
    li  x15, MASK_XLEN(0xc3e260bde31ffa64)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x15
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1ce0059c) 
 
    # Testcase 8:  rd:x9(0x00000000), rs2:x15(0xc8484a3c737ad3a), result rd:x9(0x38c852c6)
    li  x15, MASK_XLEN(0xc8484a3c737ad3a)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x15
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x38c852c6) 
 
    # Testcase 9:  rd:x9(0x00000000), rs2:x15(0x2f7b22b7e54c8c1e), result rd:x9(0x1ab373e2)
    li  x15, MASK_XLEN(0x2f7b22b7e54c8c1e)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x15
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1ab373e2) 


    

    RVTEST_SIGBASE(x1,signature_3_0)

 
    # Testcase 10:  rd:x15(0x00000000), rs2:x13(0xa783d03f7ca660db), result rd:x15(0xffffffff83599f25)
    li  x13, MASK_XLEN(0xa783d03f7ca660db)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x13
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffff83599f25) 
 
    # Testcase 11:  rd:x8(0x00000000), rs2:x14(0xbf042c8c0692dadf), result rd:x8(0xfffffffff96d2521)
    li  x14, MASK_XLEN(0xbf042c8c0692dadf)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x14
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffff96d2521) 
 
    # Testcase 12:  rd:x8(0x00000000), rs2:x9(0xfd7b9df82c63c847), result rd:x8(0xffffffffd39c37b9)
    li  x9, MASK_XLEN(0xfd7b9df82c63c847)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffd39c37b9) 
 
    # Testcase 13:  rd:x15(0x00000000), rs2:x14(0x807fe203fbba7ae7), result rd:x15(0x04458519)
    li  x14, MASK_XLEN(0x807fe203fbba7ae7)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x14
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x4458519) 
 
    # Testcase 14:  rd:x11(0x00000000), rs2:x14(0xafaa29d195b62bf), result rd:x11(0xffffffffe6a49d41)
    li  x14, MASK_XLEN(0xafaa29d195b62bf)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x14
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffe6a49d41) 


    

    RVTEST_SIGBASE(x1,signature_4_0)

 
    # Testcase 15:  rd:x9(0x00000000), rs2:x10(0xa14cf866f600a3d1), result rd:x9(0x09ff5c2f)
    li  x10, MASK_XLEN(0xa14cf866f600a3d1)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x9ff5c2f) 
 
    # Testcase 16:  rd:x15(0x00000000), rs2:x13(0x413f2c6234b80fd4), result rd:x15(0xffffffffcb47f02c)
    li  x13, MASK_XLEN(0x413f2c6234b80fd4)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x13
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffffcb47f02c) 
 
    # Testcase 17:  rd:x15(0x00000000), rs2:x11(0xe2fe64433aef5ff4), result rd:x15(0xffffffffc510a00c)
    li  x11, MASK_XLEN(0xe2fe64433aef5ff4)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x11
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffffc510a00c) 
 
    # Testcase 18:  rd:x13(0x00000000), rs2:x8(0x2c370a9a34267ad9), result rd:x13(0xffffffffcbd98527)
    li  x8, MASK_XLEN(0x2c370a9a34267ad9)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x8
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffcbd98527) 
 
    # Testcase 19:  rd:x12(0x00000000), rs2:x11(0x701512f5681454c0), result rd:x12(0xffffffff97ebab40)
    li  x11, MASK_XLEN(0x701512f5681454c0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x11
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffff97ebab40) 


    

    RVTEST_SIGBASE(x1,signature_5_0)

 
    # Testcase 20:  rd:x9(0x00000000), rs2:x14(0x2882a0b367dd3492), result rd:x9(0xffffffff9822cb6e)
    li  x14, MASK_XLEN(0x2882a0b367dd3492)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x14
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffff9822cb6e) 
 
    # Testcase 21:  rd:x15(0x00000000), rs2:x12(0x2a81b798b02d663e), result rd:x15(0x4fd299c2)
    li  x12, MASK_XLEN(0x2a81b798b02d663e)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x12
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x4fd299c2) 
 
    # Testcase 22:  rd:x10(0x00000000), rs2:x12(0x91dd5ad6b2d3f1c5), result rd:x10(0x4d2c0e3b)
    li  x12, MASK_XLEN(0x91dd5ad6b2d3f1c5)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x12
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x4d2c0e3b) 
 
    # Testcase 23:  rd:x13(0x00000000), rs2:x14(0xc68101ee824d39ae), result rd:x13(0x7db2c652)
    li  x14, MASK_XLEN(0xc68101ee824d39ae)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x7db2c652) 
 
    # Testcase 24:  rd:x9(0x00000000), rs2:x14(0x42f1d6295233a4dd), result rd:x9(0xffffffffadcc5b23)
    li  x14, MASK_XLEN(0x42f1d6295233a4dd)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x14
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffadcc5b23) 


    

    RVTEST_SIGBASE(x1,signature_6_0)

 
    # Testcase 25:  rd:x11(0x00000000), rs2:x15(0x589f2ccdd4983650), result rd:x11(0x2b67c9b0)
    li  x15, MASK_XLEN(0x589f2ccdd4983650)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x15
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x2b67c9b0) 
 
    # Testcase 26:  rd:x13(0x00000000), rs2:x12(0xcddbdf6f18fc88d5), result rd:x13(0xffffffffe703772b)
    li  x12, MASK_XLEN(0xcddbdf6f18fc88d5)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x12
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffe703772b) 
 
    # Testcase 27:  rd:x14(0x00000000), rs2:x9(0x14cf50e37bf4071), result rd:x14(0xffffffffc840bf8f)
    li  x9, MASK_XLEN(0x14cf50e37bf4071)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x9
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffc840bf8f) 
 
    # Testcase 28:  rd:x9(0x00000000), rs2:x10(0x4d236af8c83b3c30), result rd:x9(0x37c4c3d0)
    li  x10, MASK_XLEN(0x4d236af8c83b3c30)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x37c4c3d0) 
 
    # Testcase 29:  rd:x14(0x00000000), rs2:x8(0xc9e2ce4fd1bc7dd8), result rd:x14(0x2e438228)
    li  x8, MASK_XLEN(0xc9e2ce4fd1bc7dd8)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x8
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x2e438228) 


    

    RVTEST_SIGBASE(x1,signature_7_0)

 
    # Testcase 30:  rd:x8(0x00000000), rs2:x11(0x8000000000000000), result rd:x8(0x00000000)
    li  x11, MASK_XLEN(0x8000000000000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x11
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 31:  rd:x12(0x00000000), rs2:x11(0xffffffffffffffff), result rd:x12(0x00000001)
    li  x11, MASK_XLEN(0xffffffffffffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x11
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 
 
    # Testcase 32:  rd:x15(0x00000000), rs2:x14(0xffffffffffffffff), result rd:x15(0x00000001)
    li  x14, MASK_XLEN(0xffffffffffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x14
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 33:  rd:x11(0x00000000), rs2:x13(0xffffffffffffffff), result rd:x11(0x00000001)
    li  x13, MASK_XLEN(0xffffffffffffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x13
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 
 
    # Testcase 34:  rd:x15(0x00000000), rs2:x8(0x00000001), result rd:x15(0xffffffffffffffff)
    li  x8, MASK_XLEN(0x1)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffffffffffff) 


    

    RVTEST_SIGBASE(x1,signature_8_0)

 
    # Testcase 35:  rd:x8(0x00000000), rs2:x12(0x7fffffffffffffff), result rd:x8(0x00000001)
    li  x12, MASK_XLEN(0x7fffffffffffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x12
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1) 
 
    # Testcase 36:  rd:x15(0x00000000), rs2:x10(0xffffffffffffffff), result rd:x15(0x00000001)
    li  x10, MASK_XLEN(0xffffffffffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x10
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 37:  rd:x8(0x00000000), rs2:x13(0x00000000), result rd:x8(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x13
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 38:  rd:x13(0x00000000), rs2:x11(0x8000000000000000), result rd:x13(0x00000000)
    li  x11, MASK_XLEN(0x8000000000000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x11
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 39:  rd:x13(0x00000000), rs2:x8(0xffffffffffffffff), result rd:x13(0x00000001)
    li  x8, MASK_XLEN(0xffffffffffffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x8
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_9_0)

 
    # Testcase 40:  rd:x8(0x00000000), rs2:x9(0xfffffffffffffffe), result rd:x8(0x00000002)
    li  x9, MASK_XLEN(0xfffffffffffffffe)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2) 
 
    # Testcase 41:  rd:x9(0x00000000), rs2:x10(0x7fffffffffffffff), result rd:x9(0x00000001)
    li  x10, MASK_XLEN(0x7fffffffffffffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1) 
 
    # Testcase 42:  rd:x10(0x00000000), rs2:x11(0xbfffffffffffffff), result rd:x10(0x00000001)
    li  x11, MASK_XLEN(0xbfffffffffffffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1) 
 
    # Testcase 43:  rd:x11(0x00000000), rs2:x12(0xdfffffffffffffff), result rd:x11(0x00000001)
    li  x12, MASK_XLEN(0xdfffffffffffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 
 
    # Testcase 44:  rd:x12(0x00000000), rs2:x13(0xefffffffffffffff), result rd:x12(0x00000001)
    li  x13, MASK_XLEN(0xefffffffffffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_10_0)

 
    # Testcase 45:  rd:x13(0x00000000), rs2:x14(0xf7ffffffffffffff), result rd:x13(0x00000001)
    li  x14, MASK_XLEN(0xf7ffffffffffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 
 
    # Testcase 46:  rd:x14(0x00000000), rs2:x15(0xfbffffffffffffff), result rd:x14(0x00000001)
    li  x15, MASK_XLEN(0xfbffffffffffffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1) 
 
    # Testcase 47:  rd:x15(0x00000000), rs2:x8(0xfdffffffffffffff), result rd:x15(0x00000001)
    li  x8, MASK_XLEN(0xfdffffffffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 48:  rd:x8(0x00000000), rs2:x9(0xfeffffffffffffff), result rd:x8(0x00000001)
    li  x9, MASK_XLEN(0xfeffffffffffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1) 
 
    # Testcase 49:  rd:x9(0x00000000), rs2:x10(0xff7fffffffffffff), result rd:x9(0x00000001)
    li  x10, MASK_XLEN(0xff7fffffffffffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_11_0)

 
    # Testcase 50:  rd:x10(0x00000000), rs2:x11(0xffbfffffffffffff), result rd:x10(0x00000001)
    li  x11, MASK_XLEN(0xffbfffffffffffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1) 
 
    # Testcase 51:  rd:x11(0x00000000), rs2:x12(0xffdfffffffffffff), result rd:x11(0x00000001)
    li  x12, MASK_XLEN(0xffdfffffffffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 
 
    # Testcase 52:  rd:x12(0x00000000), rs2:x13(0xffefffffffffffff), result rd:x12(0x00000001)
    li  x13, MASK_XLEN(0xffefffffffffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 
 
    # Testcase 53:  rd:x13(0x00000000), rs2:x14(0xfff7ffffffffffff), result rd:x13(0x00000001)
    li  x14, MASK_XLEN(0xfff7ffffffffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 
 
    # Testcase 54:  rd:x14(0x00000000), rs2:x15(0xfffbffffffffffff), result rd:x14(0x00000001)
    li  x15, MASK_XLEN(0xfffbffffffffffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_12_0)

 
    # Testcase 55:  rd:x15(0x00000000), rs2:x8(0xfffdffffffffffff), result rd:x15(0x00000001)
    li  x8, MASK_XLEN(0xfffdffffffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 56:  rd:x8(0x00000000), rs2:x9(0xfffeffffffffffff), result rd:x8(0x00000001)
    li  x9, MASK_XLEN(0xfffeffffffffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1) 
 
    # Testcase 57:  rd:x9(0x00000000), rs2:x10(0xffff7fffffffffff), result rd:x9(0x00000001)
    li  x10, MASK_XLEN(0xffff7fffffffffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1) 
 
    # Testcase 58:  rd:x10(0x00000000), rs2:x11(0xffffbfffffffffff), result rd:x10(0x00000001)
    li  x11, MASK_XLEN(0xffffbfffffffffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1) 
 
    # Testcase 59:  rd:x11(0x00000000), rs2:x12(0xffffdfffffffffff), result rd:x11(0x00000001)
    li  x12, MASK_XLEN(0xffffdfffffffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_13_0)

 
    # Testcase 60:  rd:x12(0x00000000), rs2:x13(0xffffefffffffffff), result rd:x12(0x00000001)
    li  x13, MASK_XLEN(0xffffefffffffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 
 
    # Testcase 61:  rd:x13(0x00000000), rs2:x14(0xfffff7ffffffffff), result rd:x13(0x00000001)
    li  x14, MASK_XLEN(0xfffff7ffffffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 
 
    # Testcase 62:  rd:x14(0x00000000), rs2:x15(0xfffffbffffffffff), result rd:x14(0x00000001)
    li  x15, MASK_XLEN(0xfffffbffffffffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1) 
 
    # Testcase 63:  rd:x15(0x00000000), rs2:x8(0xfffffdffffffffff), result rd:x15(0x00000001)
    li  x8, MASK_XLEN(0xfffffdffffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 64:  rd:x8(0x00000000), rs2:x9(0xfffffeffffffffff), result rd:x8(0x00000001)
    li  x9, MASK_XLEN(0xfffffeffffffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_14_0)

 
    # Testcase 65:  rd:x9(0x00000000), rs2:x10(0xffffff7fffffffff), result rd:x9(0x00000001)
    li  x10, MASK_XLEN(0xffffff7fffffffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1) 
 
    # Testcase 66:  rd:x10(0x00000000), rs2:x11(0xffffffbfffffffff), result rd:x10(0x00000001)
    li  x11, MASK_XLEN(0xffffffbfffffffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1) 
 
    # Testcase 67:  rd:x11(0x00000000), rs2:x12(0xffffffdfffffffff), result rd:x11(0x00000001)
    li  x12, MASK_XLEN(0xffffffdfffffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1) 
 
    # Testcase 68:  rd:x12(0x00000000), rs2:x13(0xffffffefffffffff), result rd:x12(0x00000001)
    li  x13, MASK_XLEN(0xffffffefffffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1) 
 
    # Testcase 69:  rd:x13(0x00000000), rs2:x14(0xfffffff7ffffffff), result rd:x13(0x00000001)
    li  x14, MASK_XLEN(0xfffffff7ffffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1) 


    

    RVTEST_SIGBASE(x1,signature_15_0)

 
    # Testcase 70:  rd:x14(0x00000000), rs2:x15(0xfffffffbffffffff), result rd:x14(0x00000001)
    li  x15, MASK_XLEN(0xfffffffbffffffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1) 
 
    # Testcase 71:  rd:x15(0x00000000), rs2:x8(0xfffffffdffffffff), result rd:x15(0x00000001)
    li  x8, MASK_XLEN(0xfffffffdffffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1) 
 
    # Testcase 72:  rd:x8(0x00000000), rs2:x9(0xfffffffeffffffff), result rd:x8(0x00000001)
    li  x9, MASK_XLEN(0xfffffffeffffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1) 
 
    # Testcase 73:  rd:x9(0x00000000), rs2:x10(0xffffffff7fffffff), result rd:x9(0xffffffff80000001)
    li  x10, MASK_XLEN(0xffffffff7fffffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffff80000001) 
 
    # Testcase 74:  rd:x10(0x00000000), rs2:x11(0xffffffffbfffffff), result rd:x10(0x40000001)
    li  x11, MASK_XLEN(0xffffffffbfffffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x40000001) 


    

    RVTEST_SIGBASE(x1,signature_16_0)

 
    # Testcase 75:  rd:x11(0x00000000), rs2:x12(0xffffffffdfffffff), result rd:x11(0x20000001)
    li  x12, MASK_XLEN(0xffffffffdfffffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x20000001) 
 
    # Testcase 76:  rd:x12(0x00000000), rs2:x13(0xffffffffefffffff), result rd:x12(0x10000001)
    li  x13, MASK_XLEN(0xffffffffefffffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x10000001) 
 
    # Testcase 77:  rd:x13(0x00000000), rs2:x14(0xfffffffff7ffffff), result rd:x13(0x08000001)
    li  x14, MASK_XLEN(0xfffffffff7ffffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x8000001) 
 
    # Testcase 78:  rd:x14(0x00000000), rs2:x15(0xfffffffffbffffff), result rd:x14(0x04000001)
    li  x15, MASK_XLEN(0xfffffffffbffffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x4000001) 
 
    # Testcase 79:  rd:x15(0x00000000), rs2:x8(0xfffffffffdffffff), result rd:x15(0x02000001)
    li  x8, MASK_XLEN(0xfffffffffdffffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x2000001) 


    

    RVTEST_SIGBASE(x1,signature_17_0)

 
    # Testcase 80:  rd:x8(0x00000000), rs2:x9(0xfffffffffeffffff), result rd:x8(0x01000001)
    li  x9, MASK_XLEN(0xfffffffffeffffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1000001) 
 
    # Testcase 81:  rd:x9(0x00000000), rs2:x10(0xffffffffff7fffff), result rd:x9(0x00800001)
    li  x10, MASK_XLEN(0xffffffffff7fffff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x800001) 
 
    # Testcase 82:  rd:x10(0x00000000), rs2:x11(0xffffffffffbfffff), result rd:x10(0x00400001)
    li  x11, MASK_XLEN(0xffffffffffbfffff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x400001) 
 
    # Testcase 83:  rd:x11(0x00000000), rs2:x12(0xffffffffffdfffff), result rd:x11(0x00200001)
    li  x12, MASK_XLEN(0xffffffffffdfffff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x200001) 
 
    # Testcase 84:  rd:x12(0x00000000), rs2:x13(0xffffffffffefffff), result rd:x12(0x00100001)
    li  x13, MASK_XLEN(0xffffffffffefffff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x100001) 


    

    RVTEST_SIGBASE(x1,signature_18_0)

 
    # Testcase 85:  rd:x13(0x00000000), rs2:x14(0xfffffffffff7ffff), result rd:x13(0x00080001)
    li  x14, MASK_XLEN(0xfffffffffff7ffff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x80001) 
 
    # Testcase 86:  rd:x14(0x00000000), rs2:x15(0xfffffffffffbffff), result rd:x14(0x00040001)
    li  x15, MASK_XLEN(0xfffffffffffbffff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x40001) 
 
    # Testcase 87:  rd:x15(0x00000000), rs2:x8(0xfffffffffffdffff), result rd:x15(0x00020001)
    li  x8, MASK_XLEN(0xfffffffffffdffff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x20001) 
 
    # Testcase 88:  rd:x8(0x00000000), rs2:x9(0xfffffffffffeffff), result rd:x8(0x00010001)
    li  x9, MASK_XLEN(0xfffffffffffeffff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x10001) 
 
    # Testcase 89:  rd:x9(0x00000000), rs2:x10(0xffffffffffff7fff), result rd:x9(0x00008001)
    li  x10, MASK_XLEN(0xffffffffffff7fff)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x8001) 


    

    RVTEST_SIGBASE(x1,signature_19_0)

 
    # Testcase 90:  rd:x10(0x00000000), rs2:x11(0xffffffffffffbfff), result rd:x10(0x00004001)
    li  x11, MASK_XLEN(0xffffffffffffbfff)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x4001) 
 
    # Testcase 91:  rd:x11(0x00000000), rs2:x12(0xffffffffffffdfff), result rd:x11(0x00002001)
    li  x12, MASK_XLEN(0xffffffffffffdfff)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x2001) 
 
    # Testcase 92:  rd:x12(0x00000000), rs2:x13(0xffffffffffffefff), result rd:x12(0x00001001)
    li  x13, MASK_XLEN(0xffffffffffffefff)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1001) 
 
    # Testcase 93:  rd:x13(0x00000000), rs2:x14(0xfffffffffffff7ff), result rd:x13(0x00000801)
    li  x14, MASK_XLEN(0xfffffffffffff7ff)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x801) 
 
    # Testcase 94:  rd:x14(0x00000000), rs2:x15(0xfffffffffffffbff), result rd:x14(0x00000401)
    li  x15, MASK_XLEN(0xfffffffffffffbff)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x401) 


    

    RVTEST_SIGBASE(x1,signature_20_0)

 
    # Testcase 95:  rd:x15(0x00000000), rs2:x8(0xfffffffffffffdff), result rd:x15(0x00000201)
    li  x8, MASK_XLEN(0xfffffffffffffdff)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x201) 
 
    # Testcase 96:  rd:x8(0x00000000), rs2:x9(0xfffffffffffffeff), result rd:x8(0x00000101)
    li  x9, MASK_XLEN(0xfffffffffffffeff)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x101) 
 
    # Testcase 97:  rd:x9(0x00000000), rs2:x10(0xffffffffffffff7f), result rd:x9(0x00000081)
    li  x10, MASK_XLEN(0xffffffffffffff7f)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x81) 
 
    # Testcase 98:  rd:x10(0x00000000), rs2:x11(0xffffffffffffffbf), result rd:x10(0x00000041)
    li  x11, MASK_XLEN(0xffffffffffffffbf)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x41) 
 
    # Testcase 99:  rd:x11(0x00000000), rs2:x12(0xffffffffffffffdf), result rd:x11(0x00000021)
    li  x12, MASK_XLEN(0xffffffffffffffdf)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x21) 


    

    RVTEST_SIGBASE(x1,signature_21_0)

 
    # Testcase 100:  rd:x12(0x00000000), rs2:x13(0xffffffffffffffef), result rd:x12(0x00000011)
    li  x13, MASK_XLEN(0xffffffffffffffef)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x11) 
 
    # Testcase 101:  rd:x13(0x00000000), rs2:x14(0xfffffffffffffff7), result rd:x13(0x00000009)
    li  x14, MASK_XLEN(0xfffffffffffffff7)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x9) 
 
    # Testcase 102:  rd:x14(0x00000000), rs2:x15(0xfffffffffffffffb), result rd:x14(0x00000005)
    li  x15, MASK_XLEN(0xfffffffffffffffb)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x5) 
 
    # Testcase 103:  rd:x15(0x00000000), rs2:x8(0xfffffffffffffffd), result rd:x15(0x00000003)
    li  x8, MASK_XLEN(0xfffffffffffffffd)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x3) 
 
    # Testcase 104:  rd:x8(0x00000000), rs2:x9(0xfffffffffffffffe), result rd:x8(0x00000002)
    li  x9, MASK_XLEN(0xfffffffffffffffe)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x2) 


    

    RVTEST_SIGBASE(x1,signature_22_0)

 
    # Testcase 105:  rd:x9(0x00000000), rs2:x10(0x8000000000000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x8000000000000000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 106:  rd:x10(0x00000000), rs2:x11(0x4000000000000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x4000000000000000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 107:  rd:x11(0x00000000), rs2:x12(0x2000000000000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x2000000000000000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 108:  rd:x12(0x00000000), rs2:x13(0x1000000000000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x1000000000000000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 109:  rd:x13(0x00000000), rs2:x14(0x800000000000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x800000000000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_23_0)

 
    # Testcase 110:  rd:x14(0x00000000), rs2:x15(0x400000000000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x400000000000000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 111:  rd:x15(0x00000000), rs2:x8(0x200000000000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x200000000000000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 112:  rd:x8(0x00000000), rs2:x9(0x100000000000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x100000000000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 113:  rd:x9(0x00000000), rs2:x10(0x80000000000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x80000000000000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 114:  rd:x10(0x00000000), rs2:x11(0x40000000000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x40000000000000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_24_0)

 
    # Testcase 115:  rd:x11(0x00000000), rs2:x12(0x20000000000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x20000000000000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 116:  rd:x12(0x00000000), rs2:x13(0x10000000000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x10000000000000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 117:  rd:x13(0x00000000), rs2:x14(0x8000000000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x8000000000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 118:  rd:x14(0x00000000), rs2:x15(0x4000000000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x4000000000000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 119:  rd:x15(0x00000000), rs2:x8(0x2000000000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x2000000000000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_25_0)

 
    # Testcase 120:  rd:x8(0x00000000), rs2:x9(0x1000000000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x1000000000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 121:  rd:x9(0x00000000), rs2:x10(0x800000000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x800000000000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 122:  rd:x10(0x00000000), rs2:x11(0x400000000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x400000000000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 123:  rd:x11(0x00000000), rs2:x12(0x200000000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x200000000000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 124:  rd:x12(0x00000000), rs2:x13(0x100000000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x100000000000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_26_0)

 
    # Testcase 125:  rd:x13(0x00000000), rs2:x14(0x80000000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x80000000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 126:  rd:x14(0x00000000), rs2:x15(0x40000000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x40000000000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 127:  rd:x15(0x00000000), rs2:x8(0x20000000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x20000000000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 128:  rd:x8(0x00000000), rs2:x9(0x10000000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x10000000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 129:  rd:x9(0x00000000), rs2:x10(0x8000000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x8000000000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_27_0)

 
    # Testcase 130:  rd:x10(0x00000000), rs2:x11(0x4000000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x4000000000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 131:  rd:x11(0x00000000), rs2:x12(0x2000000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x2000000000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 132:  rd:x12(0x00000000), rs2:x13(0x1000000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x1000000000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 133:  rd:x13(0x00000000), rs2:x14(0x800000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x800000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 134:  rd:x14(0x00000000), rs2:x15(0x400000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x400000000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_28_0)

 
    # Testcase 135:  rd:x15(0x00000000), rs2:x8(0x200000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x200000000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 136:  rd:x8(0x00000000), rs2:x9(0x100000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x100000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 137:  rd:x9(0x00000000), rs2:x10(0x80000000), result rd:x9(0xffffffff80000000)
    li  x10, MASK_XLEN(0x80000000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffff80000000) 
 
    # Testcase 138:  rd:x10(0x00000000), rs2:x11(0x40000000), result rd:x10(0xffffffffc0000000)
    li  x11, MASK_XLEN(0x40000000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffc0000000) 
 
    # Testcase 139:  rd:x11(0x00000000), rs2:x12(0x20000000), result rd:x11(0xffffffffe0000000)
    li  x12, MASK_XLEN(0x20000000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffe0000000) 


    

    RVTEST_SIGBASE(x1,signature_29_0)

 
    # Testcase 140:  rd:x12(0x00000000), rs2:x13(0x10000000), result rd:x12(0xfffffffff0000000)
    li  x13, MASK_XLEN(0x10000000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffff0000000) 
 
    # Testcase 141:  rd:x13(0x00000000), rs2:x14(0x08000000), result rd:x13(0xfffffffff8000000)
    li  x14, MASK_XLEN(0x8000000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffff8000000) 
 
    # Testcase 142:  rd:x14(0x00000000), rs2:x15(0x04000000), result rd:x14(0xfffffffffc000000)
    li  x15, MASK_XLEN(0x4000000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffc000000) 
 
    # Testcase 143:  rd:x15(0x00000000), rs2:x8(0x02000000), result rd:x15(0xfffffffffe000000)
    li  x8, MASK_XLEN(0x2000000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffe000000) 
 
    # Testcase 144:  rd:x8(0x00000000), rs2:x9(0x01000000), result rd:x8(0xffffffffff000000)
    li  x9, MASK_XLEN(0x1000000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffff000000) 


    

    RVTEST_SIGBASE(x1,signature_30_0)

 
    # Testcase 145:  rd:x9(0x00000000), rs2:x10(0x00800000), result rd:x9(0xffffffffff800000)
    li  x10, MASK_XLEN(0x800000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffff800000) 
 
    # Testcase 146:  rd:x10(0x00000000), rs2:x11(0x00400000), result rd:x10(0xffffffffffc00000)
    li  x11, MASK_XLEN(0x400000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffc00000) 
 
    # Testcase 147:  rd:x11(0x00000000), rs2:x12(0x00200000), result rd:x11(0xffffffffffe00000)
    li  x12, MASK_XLEN(0x200000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffe00000) 
 
    # Testcase 148:  rd:x12(0x00000000), rs2:x13(0x00100000), result rd:x12(0xfffffffffff00000)
    li  x13, MASK_XLEN(0x100000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffffff00000) 
 
    # Testcase 149:  rd:x13(0x00000000), rs2:x14(0x00080000), result rd:x13(0xfffffffffff80000)
    li  x14, MASK_XLEN(0x80000)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffff80000) 


    

    RVTEST_SIGBASE(x1,signature_31_0)

 
    # Testcase 150:  rd:x14(0x00000000), rs2:x15(0x00040000), result rd:x14(0xfffffffffffc0000)
    li  x15, MASK_XLEN(0x40000)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffffc0000) 
 
    # Testcase 151:  rd:x15(0x00000000), rs2:x8(0x00020000), result rd:x15(0xfffffffffffe0000)
    li  x8, MASK_XLEN(0x20000)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffffe0000) 
 
    # Testcase 152:  rd:x8(0x00000000), rs2:x9(0x00010000), result rd:x8(0xffffffffffff0000)
    li  x9, MASK_XLEN(0x10000)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffffff0000) 
 
    # Testcase 153:  rd:x9(0x00000000), rs2:x10(0x00008000), result rd:x9(0xffffffffffff8000)
    li  x10, MASK_XLEN(0x8000)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffffff8000) 
 
    # Testcase 154:  rd:x10(0x00000000), rs2:x11(0x00004000), result rd:x10(0xffffffffffffc000)
    li  x11, MASK_XLEN(0x4000)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffffc000) 


    

    RVTEST_SIGBASE(x1,signature_32_0)

 
    # Testcase 155:  rd:x11(0x00000000), rs2:x12(0x00002000), result rd:x11(0xffffffffffffe000)
    li  x12, MASK_XLEN(0x2000)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffffe000) 
 
    # Testcase 156:  rd:x12(0x00000000), rs2:x13(0x00001000), result rd:x12(0xfffffffffffff000)
    li  x13, MASK_XLEN(0x1000)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffffffff000) 
 
    # Testcase 157:  rd:x13(0x00000000), rs2:x14(0x00000800), result rd:x13(0xfffffffffffff800)
    li  x14, MASK_XLEN(0x800)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffffff800) 
 
    # Testcase 158:  rd:x14(0x00000000), rs2:x15(0x00000400), result rd:x14(0xfffffffffffffc00)
    li  x15, MASK_XLEN(0x400)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffffffc00) 
 
    # Testcase 159:  rd:x15(0x00000000), rs2:x8(0x00000200), result rd:x15(0xfffffffffffffe00)
    li  x8, MASK_XLEN(0x200)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffffffe00) 


    

    RVTEST_SIGBASE(x1,signature_33_0)

 
    # Testcase 160:  rd:x8(0x00000000), rs2:x9(0x00000100), result rd:x8(0xffffffffffffff00)
    li  x9, MASK_XLEN(0x100)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffffffff00) 
 
    # Testcase 161:  rd:x9(0x00000000), rs2:x10(0x00000080), result rd:x9(0xffffffffffffff80)
    li  x10, MASK_XLEN(0x80)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffffffff80) 
 
    # Testcase 162:  rd:x10(0x00000000), rs2:x11(0x00000040), result rd:x10(0xffffffffffffffc0)
    li  x11, MASK_XLEN(0x40)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffffffc0) 
 
    # Testcase 163:  rd:x11(0x00000000), rs2:x12(0x00000020), result rd:x11(0xffffffffffffffe0)
    li  x12, MASK_XLEN(0x20)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffffffe0) 
 
    # Testcase 164:  rd:x12(0x00000000), rs2:x13(0x00000010), result rd:x12(0xfffffffffffffff0)
    li  x13, MASK_XLEN(0x10)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffffffffff0) 


    

    RVTEST_SIGBASE(x1,signature_34_0)

 
    # Testcase 165:  rd:x13(0x00000000), rs2:x14(0x00000008), result rd:x13(0xfffffffffffffff8)
    li  x14, MASK_XLEN(0x8)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffffffff8) 
 
    # Testcase 166:  rd:x14(0x00000000), rs2:x15(0x00000004), result rd:x14(0xfffffffffffffffc)
    li  x15, MASK_XLEN(0x4)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffffffffc) 
 
    # Testcase 167:  rd:x15(0x00000000), rs2:x8(0x00000002), result rd:x15(0xfffffffffffffffe)
    li  x8, MASK_XLEN(0x2)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffffffffe) 
 
    # Testcase 168:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 169:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_35_0)

 
    # Testcase 170:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 171:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 172:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 173:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 174:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_36_0)

 
    # Testcase 175:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 176:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 177:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 178:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 179:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_37_0)

 
    # Testcase 180:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 181:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 182:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 183:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 184:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_38_0)

 
    # Testcase 185:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 186:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 187:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 188:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 189:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_39_0)

 
    # Testcase 190:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 191:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 192:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 193:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 194:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_40_0)

 
    # Testcase 195:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 196:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 197:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 198:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 199:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_41_0)

 
    # Testcase 200:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 201:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 202:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 203:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 204:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_42_0)

 
    # Testcase 205:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 206:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 207:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 208:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 209:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_43_0)

 
    # Testcase 210:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 211:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 212:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 213:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 214:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_44_0)

 
    # Testcase 215:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 216:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 217:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 218:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 219:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_45_0)

 
    # Testcase 220:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 221:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 222:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 223:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 224:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_46_0)

 
    # Testcase 225:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 226:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 227:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 228:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 229:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_47_0)

 
    # Testcase 230:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 231:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 232:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 233:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 234:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_48_0)

 
    # Testcase 235:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 236:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 237:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 238:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 239:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_49_0)

 
    # Testcase 240:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 241:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 242:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 243:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 244:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_50_0)

 
    # Testcase 245:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 246:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 247:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 248:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 249:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_51_0)

 
    # Testcase 250:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 251:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 252:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 253:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 254:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_52_0)

 
    # Testcase 255:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 256:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 257:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 258:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 259:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_53_0)

 
    # Testcase 260:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 261:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 262:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 263:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 264:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_54_0)

 
    # Testcase 265:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 266:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 267:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 268:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 269:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_55_0)

 
    # Testcase 270:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 271:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 272:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 273:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 274:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_56_0)

 
    # Testcase 275:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 276:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 277:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 278:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 279:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_57_0)

 
    # Testcase 280:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 281:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 
 
    # Testcase 282:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 283:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 284:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_58_0)

 
    # Testcase 285:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 286:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 
 
    # Testcase 287:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0) 
 
    # Testcase 288:  rd:x8(0x00000000), rs2:x9(0x00000000), result rd:x8(0x00000000)
    li  x9, MASK_XLEN(0x0)
    li  x8, MASK_XLEN(0x0)
    c.subw x8, x9
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0) 
 
    # Testcase 289:  rd:x9(0x00000000), rs2:x10(0x00000000), result rd:x9(0x00000000)
    li  x10, MASK_XLEN(0x0)
    li  x9, MASK_XLEN(0x0)
    c.subw x9, x10
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_59_0)

 
    # Testcase 290:  rd:x10(0x00000000), rs2:x11(0x00000000), result rd:x10(0x00000000)
    li  x11, MASK_XLEN(0x0)
    li  x10, MASK_XLEN(0x0)
    c.subw x10, x11
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0) 
 
    # Testcase 291:  rd:x11(0x00000000), rs2:x12(0x00000000), result rd:x11(0x00000000)
    li  x12, MASK_XLEN(0x0)
    li  x11, MASK_XLEN(0x0)
    c.subw x11, x12
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0) 
 
    # Testcase 292:  rd:x12(0x00000000), rs2:x13(0x00000000), result rd:x12(0x00000000)
    li  x13, MASK_XLEN(0x0)
    li  x12, MASK_XLEN(0x0)
    c.subw x12, x13
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0) 
 
    # Testcase 293:  rd:x13(0x00000000), rs2:x14(0x00000000), result rd:x13(0x00000000)
    li  x14, MASK_XLEN(0x0)
    li  x13, MASK_XLEN(0x0)
    c.subw x13, x14
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0) 
 
    # Testcase 294:  rd:x14(0x00000000), rs2:x15(0x00000000), result rd:x14(0x00000000)
    li  x15, MASK_XLEN(0x0)
    li  x14, MASK_XLEN(0x0)
    c.subw x14, x15
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0) 


    

    RVTEST_SIGBASE(x1,signature_60_0)

 
    # Testcase 295:  rd:x15(0x00000000), rs2:x8(0x00000000), result rd:x15(0x00000000)
    li  x8, MASK_XLEN(0x0)
    li  x15, MASK_XLEN(0x0)
    c.subw x15, x8
    sd x15, 0(x1)
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
	.fill 5, 8, 0xdeadbeef
signature_2_0:
	.fill 5, 8, 0xdeadbeef
signature_3_0:
	.fill 5, 8, 0xdeadbeef
signature_4_0:
	.fill 5, 8, 0xdeadbeef
signature_5_0:
	.fill 5, 8, 0xdeadbeef
signature_6_0:
	.fill 5, 8, 0xdeadbeef
signature_7_0:
	.fill 5, 8, 0xdeadbeef
signature_8_0:
	.fill 5, 8, 0xdeadbeef
signature_9_0:
	.fill 5, 8, 0xdeadbeef
signature_10_0:
	.fill 5, 8, 0xdeadbeef
signature_11_0:
	.fill 5, 8, 0xdeadbeef
signature_12_0:
	.fill 5, 8, 0xdeadbeef
signature_13_0:
	.fill 5, 8, 0xdeadbeef
signature_14_0:
	.fill 5, 8, 0xdeadbeef
signature_15_0:
	.fill 5, 8, 0xdeadbeef
signature_16_0:
	.fill 5, 8, 0xdeadbeef
signature_17_0:
	.fill 5, 8, 0xdeadbeef
signature_18_0:
	.fill 5, 8, 0xdeadbeef
signature_19_0:
	.fill 5, 8, 0xdeadbeef
signature_20_0:
	.fill 5, 8, 0xdeadbeef
signature_21_0:
	.fill 5, 8, 0xdeadbeef
signature_22_0:
	.fill 5, 8, 0xdeadbeef
signature_23_0:
	.fill 5, 8, 0xdeadbeef
signature_24_0:
	.fill 5, 8, 0xdeadbeef
signature_25_0:
	.fill 5, 8, 0xdeadbeef
signature_26_0:
	.fill 5, 8, 0xdeadbeef
signature_27_0:
	.fill 5, 8, 0xdeadbeef
signature_28_0:
	.fill 5, 8, 0xdeadbeef
signature_29_0:
	.fill 5, 8, 0xdeadbeef
signature_30_0:
	.fill 5, 8, 0xdeadbeef
signature_31_0:
	.fill 5, 8, 0xdeadbeef
signature_32_0:
	.fill 5, 8, 0xdeadbeef
signature_33_0:
	.fill 5, 8, 0xdeadbeef
signature_34_0:
	.fill 5, 8, 0xdeadbeef
signature_35_0:
	.fill 5, 8, 0xdeadbeef
signature_36_0:
	.fill 5, 8, 0xdeadbeef
signature_37_0:
	.fill 5, 8, 0xdeadbeef
signature_38_0:
	.fill 5, 8, 0xdeadbeef
signature_39_0:
	.fill 5, 8, 0xdeadbeef
signature_40_0:
	.fill 5, 8, 0xdeadbeef
signature_41_0:
	.fill 5, 8, 0xdeadbeef
signature_42_0:
	.fill 5, 8, 0xdeadbeef
signature_43_0:
	.fill 5, 8, 0xdeadbeef
signature_44_0:
	.fill 5, 8, 0xdeadbeef
signature_45_0:
	.fill 5, 8, 0xdeadbeef
signature_46_0:
	.fill 5, 8, 0xdeadbeef
signature_47_0:
	.fill 5, 8, 0xdeadbeef
signature_48_0:
	.fill 5, 8, 0xdeadbeef
signature_49_0:
	.fill 5, 8, 0xdeadbeef
signature_50_0:
	.fill 5, 8, 0xdeadbeef
signature_51_0:
	.fill 5, 8, 0xdeadbeef
signature_52_0:
	.fill 5, 8, 0xdeadbeef
signature_53_0:
	.fill 5, 8, 0xdeadbeef
signature_54_0:
	.fill 5, 8, 0xdeadbeef
signature_55_0:
	.fill 5, 8, 0xdeadbeef
signature_56_0:
	.fill 5, 8, 0xdeadbeef
signature_57_0:
	.fill 5, 8, 0xdeadbeef
signature_58_0:
	.fill 5, 8, 0xdeadbeef
signature_59_0:
	.fill 5, 8, 0xdeadbeef
signature_60_0:
	.fill 5, 8, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

