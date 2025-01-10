// RISC-V Architectural Validation Test SRAW-01
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
// Specification: RV64I Base Integer Instruction Set, Version 2.1
// Description: Testing instruction 'SRAW'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1

    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",sraw)

    RVTEST_SIGBASE(x1,signature_1_0)


inst_0:
    // Test 0:  Test with random values and registers (non-overlapping)
    // result rd:x19(0x00000000002a3403), rs1:x28(0x54f4aeeb151a01ef), rs2:x30(0xf4bcf4a786569d27)
    TEST_RR_OP(sraw, x19, x28, x30, 0x00000000002a3403, 0x54f4aeeb151a01ef, 0xf4bcf4a786569d27, x1, 0, x2)

inst_1:
    // Test 1:  Test with random values and registers (non-overlapping)
    // result rd:x20(0x00000000429ede3d), rs1:x10(0xe1b1199b429ede3d), rs2:x0(0xe3977ec120219a51)
    TEST_RR_OP(sraw, x20, x10, x0, 0x00000000429ede3d, 0xe1b1199b429ede3d, 0xe3977ec120219a51, x1, 8, x2)

inst_2:
    // Test 2:  Test with random values and registers (non-overlapping)
    // result rd:x3(0xfffffffffc8d46af), rs1:x31(0xb26566a091a8d5fd), rs2:x29(0x80bd3ffebd8f6c65)
    TEST_RR_OP(sraw, x3, x31, x29, 0xfffffffffc8d46af, 0xb26566a091a8d5fd, 0x80bd3ffebd8f6c65, x1, 16, x2)

inst_3:
    // Test 3:  Test with random values and registers (non-overlapping)
    // result rd:x5(0x0000000000000000), rs1:x0(0xf27008e60466250f), rs2:x13(0xc3e260bde31ffa64)
    TEST_RR_OP(sraw, x5, x0, x13, 0x0000000000000000, 0xf27008e60466250f, 0xc3e260bde31ffa64, x1, 24, x2)

inst_4:
    // Test 4:  Test with random values and registers (non-overlapping)
    // result rd:x4(0xffffffffffffffff), rs1:x11(0x0c8484a3c737ad3a), rs2:x25(0x2f7b22b7e54c8c1e)
    TEST_RR_OP(sraw, x4, x11, x25, 0xffffffffffffffff, 0xc8484a3c737ad3a, 0x2f7b22b7e54c8c1e, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_2_0)


inst_5:
    // Test 5:  Test with random values and registers (non-overlapping)
    // result rd:x2(0x0000000000000000), rs1:x18(0xa783d03f7ca660db), rs2:x7(0xbf042c8c0692dadf)
    TEST_RR_OP(sraw, x2, x18, x7, 0x0000000000000000, 0xa783d03f7ca660db, 0xbf042c8c0692dadf, x1, 0, x3)

inst_6:
    // Test 6:  Test with random values and registers (non-overlapping)
    // result rd:x9(0x000000000058c790), rs1:x31(0xfd7b9df82c63c847), rs2:x17(0x807fe203fbba7ae7)
    TEST_RR_OP(sraw, x9, x31, x17, 0x000000000058c790, 0xfd7b9df82c63c847, 0x807fe203fbba7ae7, x1, 8, x3)

inst_7:
    // Test 7:  Test with random values and registers (non-overlapping)
    // result rd:x23(0x0000000000000cad), rs1:x31(0x0afaa29d195b62bf), rs2:x21(0xa14cf866f600a3d1)
    TEST_RR_OP(sraw, x23, x31, x21, 0x0000000000000cad, 0xafaa29d195b62bf, 0xa14cf866f600a3d1, x1, 16, x3)

inst_8:
    // Test 8:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x30(0x413f2c6234b80fd4), rs2:x17(0xe2fe64433aef5ff4)
    TEST_RR_OP(sraw, x0, x30, x17, 0x0000000000000000, 0x413f2c6234b80fd4, 0xe2fe64433aef5ff4, x1, 24, x3)

inst_9:
    // Test 9:  Test with random values and registers (non-overlapping)
    // result rd:x31(0x0000000034267ad9), rs1:x6(0x2c370a9a34267ad9), rs2:x11(0x701512f5681454c0)
    TEST_RR_OP(sraw, x31, x6, x11, 0x0000000034267ad9, 0x2c370a9a34267ad9, 0x701512f5681454c0, x1, 32, x3)

    

    RVTEST_SIGBASE(x1,signature_3_0)


inst_10:
    // Test 10:  Test with random values and registers (non-overlapping)
    // result rd:x22(0x0000000000000001), rs1:x9(0x2882a0b367dd3492), rs2:x2(0x2a81b798b02d663e)
    TEST_RR_OP(sraw, x22, x9, x2, 0x0000000000000001, 0x2882a0b367dd3492, 0x2a81b798b02d663e, x1, 0, x4)

inst_11:
    // Test 11:  Test with random values and registers (non-overlapping)
    // result rd:x7(0xfffffffffffecb4f), rs1:x13(0x91dd5ad6b2d3f1c5), rs2:x3(0xc68101ee824d39ae)
    TEST_RR_OP(sraw, x7, x13, x3, 0xfffffffffffecb4f, 0x91dd5ad6b2d3f1c5, 0xc68101ee824d39ae, x1, 8, x4)

inst_12:
    // Test 12:  Test with random values and registers (non-overlapping)
    // result rd:x13(0x0000000000005233), rs1:x24(0x42f1d6295233a4dd), rs2:x12(0x589f2ccdd4983650)
    TEST_RR_OP(sraw, x13, x24, x12, 0x0000000000005233, 0x42f1d6295233a4dd, 0x589f2ccdd4983650, x1, 16, x4)

inst_13:
    // Test 13:  Test with random values and registers (non-overlapping)
    // result rd:x3(0x0000000000000c7e), rs1:x17(0xcddbdf6f18fc88d5), rs2:x14(0x014cf50e37bf4071)
    TEST_RR_OP(sraw, x3, x17, x14, 0x0000000000000c7e, 0xcddbdf6f18fc88d5, 0x14cf50e37bf4071, x1, 24, x4)

inst_14:
    // Test 14:  Test with random values and registers (non-overlapping)
    // result rd:x31(0xffffffffffffffc8), rs1:x20(0x4d236af8c83b3c30), rs2:x18(0xc9e2ce4fd1bc7dd8)
    TEST_RR_OP(sraw, x31, x20, x18, 0xffffffffffffffc8, 0x4d236af8c83b3c30, 0xc9e2ce4fd1bc7dd8, x1, 32, x4)

    

    RVTEST_SIGBASE(x2,signature_4_0)


inst_15:
    // Test 15:  Test with random values and registers (non-overlapping)
    // result rd:x4(0xfffffffffffd4b45), rs1:x29(0x983b9f63a968a97f), rs2:x30(0x242b987862f6cb6d)
    TEST_RR_OP(sraw, x4, x29, x30, 0xfffffffffffd4b45, 0x983b9f63a968a97f, 0x242b987862f6cb6d, x2, 0, x5)

inst_16:
    // Test 16:  Test with random values and registers (non-overlapping)
    // result rd:x17(0x0000000002d8433c), rs1:x1(0x1fbe3ca65b086787), rs2:x22(0x28aadb5b3874f8a5)
    TEST_RR_OP(sraw, x17, x1, x22, 0x0000000002d8433c, 0x1fbe3ca65b086787, 0x28aadb5b3874f8a5, x2, 8, x5)

inst_17:
    // Test 17:  Test with random values and registers (non-overlapping)
    // result rd:x3(0x00000000303ae0d1), rs1:x19(0x353a85936075c1a2), rs2:x15(0xdf0fdcd2951e8621)
    TEST_RR_OP(sraw, x3, x19, x15, 0x00000000303ae0d1, 0x353a85936075c1a2, 0xdf0fdcd2951e8621, x2, 16, x5)

inst_18:
    // Test 18:  Test with random values and registers (non-overlapping)
    // result rd:x13(0x00000000004ff093), rs1:x28(0x66268a1a4ff09378), rs2:x6(0xc357b9259b327ba8)
    TEST_RR_OP(sraw, x13, x28, x6, 0x00000000004ff093, 0x66268a1a4ff09378, 0xc357b9259b327ba8, x2, 24, x5)

inst_19:
    // Test 19:  Test with random values and registers (non-overlapping)
    // result rd:x14(0xfffffffffffffff6), rs1:x6(0x28ac54a3b32a4c52), rs2:x9(0xba4194f803d5081b)
    TEST_RR_OP(sraw, x14, x6, x9, 0xfffffffffffffff6, 0x28ac54a3b32a4c52, 0xba4194f803d5081b, x2, 32, x5)

    

    RVTEST_SIGBASE(x1,signature_5_0)


inst_20:
    // Test 20:  Test with random values and registers (non-overlapping)
    // result rd:x17(0x0000000000017a2f), rs1:x10(0xdc3713a217a2fb1a), rs2:x14(0xc2e008f50b56ed8c)
    TEST_RR_OP(sraw, x17, x10, x14, 0x0000000000017a2f, 0xdc3713a217a2fb1a, 0xc2e008f50b56ed8c, x1, 0, x2)

inst_21:
    // Test 21:  Test with random values and registers (non-overlapping)
    // result rd:x6(0x00000000484605f6), rs1:x22(0x74674399484605f6), rs2:x0(0x2ed729e0b5aeeeb5)
    TEST_RR_OP(sraw, x6, x22, x0, 0x00000000484605f6, 0x74674399484605f6, 0x2ed729e0b5aeeeb5, x1, 8, x2)

inst_22:
    // Test 22:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x19(0x6bdd9821fc9d848f), rs2:x28(0x5b57716e8dd5cd04)
    TEST_RR_OP(sraw, x0, x19, x28, 0x0000000000000000, 0x6bdd9821fc9d848f, 0x5b57716e8dd5cd04, x1, 16, x2)

inst_23:
    // Test 23:  Test with random values and registers (non-overlapping)
    // result rd:x19(0xfffffffffe6c6a01), rs1:x31(0x825648e49b1a8042), rs2:x30(0x78636af4da4c9686)
    TEST_RR_OP(sraw, x19, x31, x30, 0xfffffffffe6c6a01, 0x825648e49b1a8042, 0x78636af4da4c9686, x1, 24, x2)

inst_24:
    // Test 24:  Test with random values and registers (non-overlapping)
    // result rd:x27(0x00000000000426b8), rs1:x21(0x7bf4ef1c426b8dfb), rs2:x23(0xf4cc30bce0e9092c)
    TEST_RR_OP(sraw, x27, x21, x23, 0x00000000000426b8, 0x7bf4ef1c426b8dfb, 0xf4cc30bce0e9092c, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_6_0)


inst_25:
    // Test 25:  Test with random values and registers (non-overlapping)
    // result rd:x16(0xffffffffffffffd8), rs1:x24(0x0f49a4b2f6323d52), rs2:x28(0x35a0ec8073b3e156)
    TEST_RR_OP(sraw, x16, x24, x28, 0xffffffffffffffd8, 0xf49a4b2f6323d52, 0x35a0ec8073b3e156, x1, 0, x4)

inst_26:
    // Test 26:  Test with random values and registers (non-overlapping)
    // result rd:x7(0x00000000000004bf), rs1:x26(0xfe9b8abf4bfb003d), rs2:x16(0xcb0947ed86b081d4)
    TEST_RR_OP(sraw, x7, x26, x16, 0x00000000000004bf, 0xfe9b8abf4bfb003d, 0xcb0947ed86b081d4, x1, 8, x4)

inst_27:
    // Test 27:  Test with random values and registers (non-overlapping)
    // result rd:x5(0xfffffffffffffff2), rs1:x13(0x347ebc89f22b6484), rs2:x3(0x8cc7e79093b06678)
    TEST_RR_OP(sraw, x5, x13, x3, 0xfffffffffffffff2, 0x347ebc89f22b6484, 0x8cc7e79093b06678, x1, 16, x4)

inst_28:
    // Test 28:  Test with random values and registers (non-overlapping)
    // result rd:x5(0x0000000000000000), rs1:x8(0xf52a52bf0cc9d6c8), rs2:x27(0xa5c8d8603b9b3ddc)
    TEST_RR_OP(sraw, x5, x8, x27, 0x0000000000000000, 0xf52a52bf0cc9d6c8, 0xa5c8d8603b9b3ddc, x1, 24, x4)

inst_29:
    // Test 29:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x2(0xcaa4b80e169dbce8), rs2:x7(0xf4a6499905252532)
    TEST_RR_OP(sraw, x0, x2, x7, 0x0000000000000000, 0xcaa4b80e169dbce8, 0xf4a6499905252532, x1, 32, x4)

    

    RVTEST_SIGBASE(x1,signature_7_0)


inst_30:
    // Test 30:  Test with min, max, and other significant values
    // result rd:x28(0xffffffffffffffff), rs1:x3(0xffffffffffffffff), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x28, x3, x30, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x1, 0, x2)

inst_31:
    // Test 31:  Test with min, max, and other significant values
    // result rd:x24(0x0000000000000000), rs1:x17(0x8000000000000000), rs2:x28(0xffffffffffffffff)
    TEST_RR_OP(sraw, x24, x17, x28, 0x0000000000000000, 0x8000000000000000, 0xffffffffffffffff, x1, 8, x2)

inst_32:
    // Test 32:  Test with min, max, and other significant values
    // result rd:x14(0xffffffffffffffff), rs1:x21(0xffffffffffffffff), rs2:x22(0xffffffffffffffff)
    TEST_RR_OP(sraw, x14, x21, x22, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, x1, 16, x2)

inst_33:
    // Test 33:  Test with min, max, and other significant values
    // result rd:x0(0x0000000000000000), rs1:x12(0x0000000000000001), rs2:x5(0x7fffffffffffffff)
    TEST_RR_OP(sraw, x0, x12, x5, 0x0000000000000000, 0x1, 0x7fffffffffffffff, x1, 24, x2)

inst_34:
    // Test 34:  Test with min, max, and other significant values
    // result rd:x29(0x0000000000000000), rs1:x0(0xffffffffffffffff), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x29, x0, x30, 0x0000000000000000, 0xffffffffffffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_8_0)


inst_35:
    // Test 35:  Test with min, max, and other significant values
    // result rd:x0(0x0000000000000000), rs1:x11(0x8000000000000000), rs2:x17(0xffffffffffffffff)
    TEST_RR_OP(sraw, x0, x11, x17, 0x0000000000000000, 0x8000000000000000, 0xffffffffffffffff, x1, 0, x3)

inst_36:
    // Test 36:  Test with min, max, and other significant values
    // result rd:x23(0xffffffffffffffff), rs1:x16(0xffffffffffffffff), rs2:x24(0xffffffffffffffff)
    TEST_RR_OP(sraw, x23, x16, x24, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, x1, 8, x3)

inst_37:
    // Test 37:  Test with min, max, and other significant values
    // result rd:x12(0x0000000000000000), rs1:x29(0x0000000000000001), rs2:x2(0x7fffffffffffffff)
    TEST_RR_OP(sraw, x12, x29, x2, 0x0000000000000000, 0x1, 0x7fffffffffffffff, x1, 16, x3)

inst_38:
    // Test 38:  Test with min, max, and other significant values
    // result rd:x31(0xffffffffffffffff), rs1:x12(0xffffffffffffffff), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x31, x12, x30, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x1, 24, x3)

inst_39:
    // Test 39:  Test with min, max, and other significant values
    // result rd:x7(0x0000000000000000), rs1:x26(0x8000000000000000), rs2:x6(0xffffffffffffffff)
    TEST_RR_OP(sraw, x7, x26, x6, 0x0000000000000000, 0x8000000000000000, 0xffffffffffffffff, x1, 32, x3)

    

    RVTEST_SIGBASE(x7,signature_9_0)


inst_40:
    // Test 40:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000000000001), rs2:x3(0xfffffffffffffffe)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x1, 0xfffffffffffffffe, x7, 0, x8)

inst_41:
    // Test 41:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000000000002), rs2:x3(0x7fffffffffffffff)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x2, 0x7fffffffffffffff, x7, 8, x8)

inst_42:
    // Test 42:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000000), rs1:x3(0x0000000000000004), rs2:x4(0xbfffffffffffffff)
    TEST_RR_OP(sraw, x2, x3, x4, 0x0000000000000000, 0x4, 0xbfffffffffffffff, x7, 16, x8)

inst_43:
    // Test 43:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000000), rs1:x4(0x0000000000000008), rs2:x5(0xdfffffffffffffff)
    TEST_RR_OP(sraw, x3, x4, x5, 0x0000000000000000, 0x8, 0xdfffffffffffffff, x7, 24, x8)

inst_44:
    // Test 44:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000000), rs1:x5(0x0000000000000010), rs2:x6(0xefffffffffffffff)
    TEST_RR_OP(sraw, x4, x5, x6, 0x0000000000000000, 0x10, 0xefffffffffffffff, x7, 32, x8)

    

    RVTEST_SIGBASE(x1,signature_10_0)


inst_45:
    // Test 45:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000000), rs1:x6(0x0000000000000020), rs2:x7(0xf7ffffffffffffff)
    TEST_RR_OP(sraw, x5, x6, x7, 0x0000000000000000, 0x20, 0xf7ffffffffffffff, x1, 0, x2)

inst_46:
    // Test 46:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000000), rs1:x7(0x0000000000000040), rs2:x8(0xfbffffffffffffff)
    TEST_RR_OP(sraw, x6, x7, x8, 0x0000000000000000, 0x40, 0xfbffffffffffffff, x1, 8, x2)

inst_47:
    // Test 47:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000000), rs1:x8(0x0000000000000080), rs2:x9(0xfdffffffffffffff)
    TEST_RR_OP(sraw, x7, x8, x9, 0x0000000000000000, 0x80, 0xfdffffffffffffff, x1, 16, x2)

inst_48:
    // Test 48:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000000), rs1:x9(0x0000000000000100), rs2:x10(0xfeffffffffffffff)
    TEST_RR_OP(sraw, x8, x9, x10, 0x0000000000000000, 0x100, 0xfeffffffffffffff, x1, 24, x2)

inst_49:
    // Test 49:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000000), rs1:x10(0x0000000000000200), rs2:x11(0xff7fffffffffffff)
    TEST_RR_OP(sraw, x9, x10, x11, 0x0000000000000000, 0x200, 0xff7fffffffffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_11_0)


inst_50:
    // Test 50:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000000), rs1:x11(0x0000000000000400), rs2:x12(0xffbfffffffffffff)
    TEST_RR_OP(sraw, x10, x11, x12, 0x0000000000000000, 0x400, 0xffbfffffffffffff, x1, 0, x2)

inst_51:
    // Test 51:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000000), rs1:x12(0x0000000000000800), rs2:x13(0xffdfffffffffffff)
    TEST_RR_OP(sraw, x11, x12, x13, 0x0000000000000000, 0x800, 0xffdfffffffffffff, x1, 8, x2)

inst_52:
    // Test 52:  Test with marching zeros/ones
    // result rd:x12(0x0000000000000000), rs1:x13(0x0000000000001000), rs2:x14(0xffefffffffffffff)
    TEST_RR_OP(sraw, x12, x13, x14, 0x0000000000000000, 0x1000, 0xffefffffffffffff, x1, 16, x2)

inst_53:
    // Test 53:  Test with marching zeros/ones
    // result rd:x13(0x0000000000000000), rs1:x14(0x0000000000002000), rs2:x15(0xfff7ffffffffffff)
    TEST_RR_OP(sraw, x13, x14, x15, 0x0000000000000000, 0x2000, 0xfff7ffffffffffff, x1, 24, x2)

inst_54:
    // Test 54:  Test with marching zeros/ones
    // result rd:x14(0x0000000000000000), rs1:x15(0x0000000000004000), rs2:x16(0xfffbffffffffffff)
    TEST_RR_OP(sraw, x14, x15, x16, 0x0000000000000000, 0x4000, 0xfffbffffffffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_12_0)


inst_55:
    // Test 55:  Test with marching zeros/ones
    // result rd:x15(0x0000000000000000), rs1:x16(0x0000000000008000), rs2:x17(0xfffdffffffffffff)
    TEST_RR_OP(sraw, x15, x16, x17, 0x0000000000000000, 0x8000, 0xfffdffffffffffff, x1, 0, x2)

inst_56:
    // Test 56:  Test with marching zeros/ones
    // result rd:x16(0x0000000000000000), rs1:x17(0x0000000000010000), rs2:x18(0xfffeffffffffffff)
    TEST_RR_OP(sraw, x16, x17, x18, 0x0000000000000000, 0x10000, 0xfffeffffffffffff, x1, 8, x2)

inst_57:
    // Test 57:  Test with marching zeros/ones
    // result rd:x17(0x0000000000000000), rs1:x18(0x0000000000020000), rs2:x19(0xffff7fffffffffff)
    TEST_RR_OP(sraw, x17, x18, x19, 0x0000000000000000, 0x20000, 0xffff7fffffffffff, x1, 16, x2)

inst_58:
    // Test 58:  Test with marching zeros/ones
    // result rd:x18(0x0000000000000000), rs1:x19(0x0000000000040000), rs2:x20(0xffffbfffffffffff)
    TEST_RR_OP(sraw, x18, x19, x20, 0x0000000000000000, 0x40000, 0xffffbfffffffffff, x1, 24, x2)

inst_59:
    // Test 59:  Test with marching zeros/ones
    // result rd:x19(0x0000000000000000), rs1:x20(0x0000000000080000), rs2:x21(0xffffdfffffffffff)
    TEST_RR_OP(sraw, x19, x20, x21, 0x0000000000000000, 0x80000, 0xffffdfffffffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_13_0)


inst_60:
    // Test 60:  Test with marching zeros/ones
    // result rd:x20(0x0000000000000000), rs1:x21(0x0000000000100000), rs2:x22(0xffffefffffffffff)
    TEST_RR_OP(sraw, x20, x21, x22, 0x0000000000000000, 0x100000, 0xffffefffffffffff, x1, 0, x2)

inst_61:
    // Test 61:  Test with marching zeros/ones
    // result rd:x21(0x0000000000000000), rs1:x22(0x0000000000200000), rs2:x23(0xfffff7ffffffffff)
    TEST_RR_OP(sraw, x21, x22, x23, 0x0000000000000000, 0x200000, 0xfffff7ffffffffff, x1, 8, x2)

inst_62:
    // Test 62:  Test with marching zeros/ones
    // result rd:x22(0x0000000000000000), rs1:x23(0x0000000000400000), rs2:x24(0xfffffbffffffffff)
    TEST_RR_OP(sraw, x22, x23, x24, 0x0000000000000000, 0x400000, 0xfffffbffffffffff, x1, 16, x2)

inst_63:
    // Test 63:  Test with marching zeros/ones
    // result rd:x23(0x0000000000000000), rs1:x24(0x0000000000800000), rs2:x25(0xfffffdffffffffff)
    TEST_RR_OP(sraw, x23, x24, x25, 0x0000000000000000, 0x800000, 0xfffffdffffffffff, x1, 24, x2)

inst_64:
    // Test 64:  Test with marching zeros/ones
    // result rd:x24(0x0000000000000000), rs1:x25(0x0000000001000000), rs2:x26(0xfffffeffffffffff)
    TEST_RR_OP(sraw, x24, x25, x26, 0x0000000000000000, 0x1000000, 0xfffffeffffffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_14_0)


inst_65:
    // Test 65:  Test with marching zeros/ones
    // result rd:x25(0x0000000000000000), rs1:x26(0x0000000002000000), rs2:x27(0xffffff7fffffffff)
    TEST_RR_OP(sraw, x25, x26, x27, 0x0000000000000000, 0x2000000, 0xffffff7fffffffff, x1, 0, x2)

inst_66:
    // Test 66:  Test with marching zeros/ones
    // result rd:x26(0x0000000000000000), rs1:x27(0x0000000004000000), rs2:x28(0xffffffbfffffffff)
    TEST_RR_OP(sraw, x26, x27, x28, 0x0000000000000000, 0x4000000, 0xffffffbfffffffff, x1, 8, x2)

inst_67:
    // Test 67:  Test with marching zeros/ones
    // result rd:x27(0x0000000000000000), rs1:x28(0x0000000008000000), rs2:x29(0xffffffdfffffffff)
    TEST_RR_OP(sraw, x27, x28, x29, 0x0000000000000000, 0x8000000, 0xffffffdfffffffff, x1, 16, x2)

inst_68:
    // Test 68:  Test with marching zeros/ones
    // result rd:x28(0x0000000000000000), rs1:x29(0x0000000010000000), rs2:x30(0xffffffefffffffff)
    TEST_RR_OP(sraw, x28, x29, x30, 0x0000000000000000, 0x10000000, 0xffffffefffffffff, x1, 24, x2)

inst_69:
    // Test 69:  Test with marching zeros/ones
    // result rd:x29(0x0000000000000000), rs1:x30(0x0000000020000000), rs2:x31(0xfffffff7ffffffff)
    TEST_RR_OP(sraw, x29, x30, x31, 0x0000000000000000, 0x20000000, 0xfffffff7ffffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x5,signature_15_0)


inst_70:
    // Test 70:  Test with marching zeros/ones
    // result rd:x30(0x0000000000000000), rs1:x31(0x0000000040000000), rs2:x1(0xfffffffbffffffff)
    TEST_RR_OP(sraw, x30, x31, x1, 0x0000000000000000, 0x40000000, 0xfffffffbffffffff, x5, 0, x6)

inst_71:
    // Test 71:  Test with marching zeros/ones
    // result rd:x31(0xffffffffffffffff), rs1:x1(0x0000000080000000), rs2:x2(0xfffffffdffffffff)
    TEST_RR_OP(sraw, x31, x1, x2, 0xffffffffffffffff, 0x80000000, 0xfffffffdffffffff, x5, 8, x6)

inst_72:
    // Test 72:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000100000000), rs2:x3(0xfffffffeffffffff)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x100000000, 0xfffffffeffffffff, x5, 16, x6)

inst_73:
    // Test 73:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000200000000), rs2:x3(0xffffffff7fffffff)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x200000000, 0xffffffff7fffffff, x5, 24, x6)

inst_74:
    // Test 74:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000000), rs1:x3(0x0000000400000000), rs2:x4(0xffffffffbfffffff)
    TEST_RR_OP(sraw, x2, x3, x4, 0x0000000000000000, 0x400000000, 0xffffffffbfffffff, x5, 32, x6)

    

    RVTEST_SIGBASE(x1,signature_16_0)


inst_75:
    // Test 75:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000000), rs1:x4(0x0000000800000000), rs2:x5(0xffffffffdfffffff)
    TEST_RR_OP(sraw, x3, x4, x5, 0x0000000000000000, 0x800000000, 0xffffffffdfffffff, x1, 0, x2)

inst_76:
    // Test 76:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000000), rs1:x5(0x0000001000000000), rs2:x6(0xffffffffefffffff)
    TEST_RR_OP(sraw, x4, x5, x6, 0x0000000000000000, 0x1000000000, 0xffffffffefffffff, x1, 8, x2)

inst_77:
    // Test 77:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000000), rs1:x6(0x0000002000000000), rs2:x7(0xfffffffff7ffffff)
    TEST_RR_OP(sraw, x5, x6, x7, 0x0000000000000000, 0x2000000000, 0xfffffffff7ffffff, x1, 16, x2)

inst_78:
    // Test 78:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000000), rs1:x7(0x0000004000000000), rs2:x8(0xfffffffffbffffff)
    TEST_RR_OP(sraw, x6, x7, x8, 0x0000000000000000, 0x4000000000, 0xfffffffffbffffff, x1, 24, x2)

inst_79:
    // Test 79:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000000), rs1:x8(0x0000008000000000), rs2:x9(0xfffffffffdffffff)
    TEST_RR_OP(sraw, x7, x8, x9, 0x0000000000000000, 0x8000000000, 0xfffffffffdffffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_17_0)


inst_80:
    // Test 80:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000000), rs1:x9(0x0000010000000000), rs2:x10(0xfffffffffeffffff)
    TEST_RR_OP(sraw, x8, x9, x10, 0x0000000000000000, 0x10000000000, 0xfffffffffeffffff, x1, 0, x2)

inst_81:
    // Test 81:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000000), rs1:x10(0x0000020000000000), rs2:x11(0xffffffffff7fffff)
    TEST_RR_OP(sraw, x9, x10, x11, 0x0000000000000000, 0x20000000000, 0xffffffffff7fffff, x1, 8, x2)

inst_82:
    // Test 82:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000000), rs1:x11(0x0000040000000000), rs2:x12(0xffffffffffbfffff)
    TEST_RR_OP(sraw, x10, x11, x12, 0x0000000000000000, 0x40000000000, 0xffffffffffbfffff, x1, 16, x2)

inst_83:
    // Test 83:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000000), rs1:x12(0x0000080000000000), rs2:x13(0xffffffffffdfffff)
    TEST_RR_OP(sraw, x11, x12, x13, 0x0000000000000000, 0x80000000000, 0xffffffffffdfffff, x1, 24, x2)

inst_84:
    // Test 84:  Test with marching zeros/ones
    // result rd:x12(0x0000000000000000), rs1:x13(0x0000100000000000), rs2:x14(0xffffffffffefffff)
    TEST_RR_OP(sraw, x12, x13, x14, 0x0000000000000000, 0x100000000000, 0xffffffffffefffff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_18_0)


inst_85:
    // Test 85:  Test with marching zeros/ones
    // result rd:x13(0x0000000000000000), rs1:x14(0x0000200000000000), rs2:x15(0xfffffffffff7ffff)
    TEST_RR_OP(sraw, x13, x14, x15, 0x0000000000000000, 0x200000000000, 0xfffffffffff7ffff, x1, 0, x2)

inst_86:
    // Test 86:  Test with marching zeros/ones
    // result rd:x14(0x0000000000000000), rs1:x15(0x0000400000000000), rs2:x16(0xfffffffffffbffff)
    TEST_RR_OP(sraw, x14, x15, x16, 0x0000000000000000, 0x400000000000, 0xfffffffffffbffff, x1, 8, x2)

inst_87:
    // Test 87:  Test with marching zeros/ones
    // result rd:x15(0x0000000000000000), rs1:x16(0x0000800000000000), rs2:x17(0xfffffffffffdffff)
    TEST_RR_OP(sraw, x15, x16, x17, 0x0000000000000000, 0x800000000000, 0xfffffffffffdffff, x1, 16, x2)

inst_88:
    // Test 88:  Test with marching zeros/ones
    // result rd:x16(0x0000000000000000), rs1:x17(0x0001000000000000), rs2:x18(0xfffffffffffeffff)
    TEST_RR_OP(sraw, x16, x17, x18, 0x0000000000000000, 0x1000000000000, 0xfffffffffffeffff, x1, 24, x2)

inst_89:
    // Test 89:  Test with marching zeros/ones
    // result rd:x17(0x0000000000000000), rs1:x18(0x0002000000000000), rs2:x19(0xffffffffffff7fff)
    TEST_RR_OP(sraw, x17, x18, x19, 0x0000000000000000, 0x2000000000000, 0xffffffffffff7fff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_19_0)


inst_90:
    // Test 90:  Test with marching zeros/ones
    // result rd:x18(0x0000000000000000), rs1:x19(0x0004000000000000), rs2:x20(0xffffffffffffbfff)
    TEST_RR_OP(sraw, x18, x19, x20, 0x0000000000000000, 0x4000000000000, 0xffffffffffffbfff, x1, 0, x2)

inst_91:
    // Test 91:  Test with marching zeros/ones
    // result rd:x19(0x0000000000000000), rs1:x20(0x0008000000000000), rs2:x21(0xffffffffffffdfff)
    TEST_RR_OP(sraw, x19, x20, x21, 0x0000000000000000, 0x8000000000000, 0xffffffffffffdfff, x1, 8, x2)

inst_92:
    // Test 92:  Test with marching zeros/ones
    // result rd:x20(0x0000000000000000), rs1:x21(0x0010000000000000), rs2:x22(0xffffffffffffefff)
    TEST_RR_OP(sraw, x20, x21, x22, 0x0000000000000000, 0x10000000000000, 0xffffffffffffefff, x1, 16, x2)

inst_93:
    // Test 93:  Test with marching zeros/ones
    // result rd:x21(0x0000000000000000), rs1:x22(0x0020000000000000), rs2:x23(0xfffffffffffff7ff)
    TEST_RR_OP(sraw, x21, x22, x23, 0x0000000000000000, 0x20000000000000, 0xfffffffffffff7ff, x1, 24, x2)

inst_94:
    // Test 94:  Test with marching zeros/ones
    // result rd:x22(0x0000000000000000), rs1:x23(0x0040000000000000), rs2:x24(0xfffffffffffffbff)
    TEST_RR_OP(sraw, x22, x23, x24, 0x0000000000000000, 0x40000000000000, 0xfffffffffffffbff, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_20_0)


inst_95:
    // Test 95:  Test with marching zeros/ones
    // result rd:x23(0x0000000000000000), rs1:x24(0x0080000000000000), rs2:x25(0xfffffffffffffdff)
    TEST_RR_OP(sraw, x23, x24, x25, 0x0000000000000000, 0x80000000000000, 0xfffffffffffffdff, x1, 0, x2)

inst_96:
    // Test 96:  Test with marching zeros/ones
    // result rd:x24(0x0000000000000000), rs1:x25(0x0100000000000000), rs2:x26(0xfffffffffffffeff)
    TEST_RR_OP(sraw, x24, x25, x26, 0x0000000000000000, 0x100000000000000, 0xfffffffffffffeff, x1, 8, x2)

inst_97:
    // Test 97:  Test with marching zeros/ones
    // result rd:x25(0x0000000000000000), rs1:x26(0x0200000000000000), rs2:x27(0xffffffffffffff7f)
    TEST_RR_OP(sraw, x25, x26, x27, 0x0000000000000000, 0x200000000000000, 0xffffffffffffff7f, x1, 16, x2)

inst_98:
    // Test 98:  Test with marching zeros/ones
    // result rd:x26(0x0000000000000000), rs1:x27(0x0400000000000000), rs2:x28(0xffffffffffffffbf)
    TEST_RR_OP(sraw, x26, x27, x28, 0x0000000000000000, 0x400000000000000, 0xffffffffffffffbf, x1, 24, x2)

inst_99:
    // Test 99:  Test with marching zeros/ones
    // result rd:x27(0x0000000000000000), rs1:x28(0x0800000000000000), rs2:x29(0xffffffffffffffdf)
    TEST_RR_OP(sraw, x27, x28, x29, 0x0000000000000000, 0x800000000000000, 0xffffffffffffffdf, x1, 32, x2)

    

    RVTEST_SIGBASE(x4,signature_21_0)


inst_100:
    // Test 100:  Test with marching zeros/ones
    // result rd:x28(0x0000000000000000), rs1:x29(0x1000000000000000), rs2:x30(0xffffffffffffffef)
    TEST_RR_OP(sraw, x28, x29, x30, 0x0000000000000000, 0x1000000000000000, 0xffffffffffffffef, x4, 0, x5)

inst_101:
    // Test 101:  Test with marching zeros/ones
    // result rd:x29(0x0000000000000000), rs1:x30(0x2000000000000000), rs2:x31(0xfffffffffffffff7)
    TEST_RR_OP(sraw, x29, x30, x31, 0x0000000000000000, 0x2000000000000000, 0xfffffffffffffff7, x4, 8, x5)

inst_102:
    // Test 102:  Test with marching zeros/ones
    // result rd:x30(0x0000000000000000), rs1:x31(0x4000000000000000), rs2:x1(0xfffffffffffffffb)
    TEST_RR_OP(sraw, x30, x31, x1, 0x0000000000000000, 0x4000000000000000, 0xfffffffffffffffb, x4, 16, x5)

inst_103:
    // Test 103:  Test with marching zeros/ones
    // result rd:x31(0x0000000000000000), rs1:x1(0x8000000000000000), rs2:x2(0xfffffffffffffffd)
    TEST_RR_OP(sraw, x31, x1, x2, 0x0000000000000000, 0x8000000000000000, 0xfffffffffffffffd, x4, 24, x5)

inst_104:
    // Test 104:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffff), rs1:x2(0xfffffffffffffffe), rs2:x3(0xfffffffffffffffe)
    TEST_RR_OP(sraw, x1, x2, x3, 0xffffffffffffffff, 0xfffffffffffffffe, 0xfffffffffffffffe, x4, 32, x5)

    

    RVTEST_SIGBASE(x8,signature_22_0)


inst_105:
    // Test 105:  Test with marching zeros/ones
    // result rd:x1(0xfffffffffffffffd), rs1:x2(0xfffffffffffffffd), rs2:x3(0x8000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xfffffffffffffffd, 0xfffffffffffffffd, 0x8000000000000000, x8, 0, x9)

inst_106:
    // Test 106:  Test with marching zeros/ones
    // result rd:x2(0xfffffffffffffffb), rs1:x3(0xfffffffffffffffb), rs2:x4(0x4000000000000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0xfffffffffffffffb, 0xfffffffffffffffb, 0x4000000000000000, x8, 8, x9)

inst_107:
    // Test 107:  Test with marching zeros/ones
    // result rd:x3(0xfffffffffffffff7), rs1:x4(0xfffffffffffffff7), rs2:x5(0x2000000000000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0xfffffffffffffff7, 0xfffffffffffffff7, 0x2000000000000000, x8, 16, x9)

inst_108:
    // Test 108:  Test with marching zeros/ones
    // result rd:x4(0xffffffffffffffef), rs1:x5(0xffffffffffffffef), rs2:x6(0x1000000000000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0xffffffffffffffef, 0xffffffffffffffef, 0x1000000000000000, x8, 24, x9)

inst_109:
    // Test 109:  Test with marching zeros/ones
    // result rd:x5(0xffffffffffffffdf), rs1:x6(0xffffffffffffffdf), rs2:x7(0x0800000000000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0xffffffffffffffdf, 0xffffffffffffffdf, 0x800000000000000, x8, 32, x9)

    

    RVTEST_SIGBASE(x1,signature_23_0)


inst_110:
    // Test 110:  Test with marching zeros/ones
    // result rd:x6(0xffffffffffffffbf), rs1:x7(0xffffffffffffffbf), rs2:x8(0x0400000000000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0xffffffffffffffbf, 0xffffffffffffffbf, 0x400000000000000, x1, 0, x2)

inst_111:
    // Test 111:  Test with marching zeros/ones
    // result rd:x7(0xffffffffffffff7f), rs1:x8(0xffffffffffffff7f), rs2:x9(0x0200000000000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0xffffffffffffff7f, 0xffffffffffffff7f, 0x200000000000000, x1, 8, x2)

inst_112:
    // Test 112:  Test with marching zeros/ones
    // result rd:x8(0xfffffffffffffeff), rs1:x9(0xfffffffffffffeff), rs2:x10(0x0100000000000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0xfffffffffffffeff, 0xfffffffffffffeff, 0x100000000000000, x1, 16, x2)

inst_113:
    // Test 113:  Test with marching zeros/ones
    // result rd:x9(0xfffffffffffffdff), rs1:x10(0xfffffffffffffdff), rs2:x11(0x0080000000000000)
    TEST_RR_OP(sraw, x9, x10, x11, 0xfffffffffffffdff, 0xfffffffffffffdff, 0x80000000000000, x1, 24, x2)

inst_114:
    // Test 114:  Test with marching zeros/ones
    // result rd:x10(0xfffffffffffffbff), rs1:x11(0xfffffffffffffbff), rs2:x12(0x0040000000000000)
    TEST_RR_OP(sraw, x10, x11, x12, 0xfffffffffffffbff, 0xfffffffffffffbff, 0x40000000000000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_24_0)


inst_115:
    // Test 115:  Test with marching zeros/ones
    // result rd:x11(0xfffffffffffff7ff), rs1:x12(0xfffffffffffff7ff), rs2:x13(0x0020000000000000)
    TEST_RR_OP(sraw, x11, x12, x13, 0xfffffffffffff7ff, 0xfffffffffffff7ff, 0x20000000000000, x1, 0, x2)

inst_116:
    // Test 116:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffefff), rs1:x13(0xffffffffffffefff), rs2:x14(0x0010000000000000)
    TEST_RR_OP(sraw, x12, x13, x14, 0xffffffffffffefff, 0xffffffffffffefff, 0x10000000000000, x1, 8, x2)

inst_117:
    // Test 117:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffdfff), rs1:x14(0xffffffffffffdfff), rs2:x15(0x0008000000000000)
    TEST_RR_OP(sraw, x13, x14, x15, 0xffffffffffffdfff, 0xffffffffffffdfff, 0x8000000000000, x1, 16, x2)

inst_118:
    // Test 118:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffbfff), rs1:x15(0xffffffffffffbfff), rs2:x16(0x0004000000000000)
    TEST_RR_OP(sraw, x14, x15, x16, 0xffffffffffffbfff, 0xffffffffffffbfff, 0x4000000000000, x1, 24, x2)

inst_119:
    // Test 119:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffff7fff), rs1:x16(0xffffffffffff7fff), rs2:x17(0x0002000000000000)
    TEST_RR_OP(sraw, x15, x16, x17, 0xffffffffffff7fff, 0xffffffffffff7fff, 0x2000000000000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_25_0)


inst_120:
    // Test 120:  Test with marching zeros/ones
    // result rd:x16(0xfffffffffffeffff), rs1:x17(0xfffffffffffeffff), rs2:x18(0x0001000000000000)
    TEST_RR_OP(sraw, x16, x17, x18, 0xfffffffffffeffff, 0xfffffffffffeffff, 0x1000000000000, x1, 0, x2)

inst_121:
    // Test 121:  Test with marching zeros/ones
    // result rd:x17(0xfffffffffffdffff), rs1:x18(0xfffffffffffdffff), rs2:x19(0x0000800000000000)
    TEST_RR_OP(sraw, x17, x18, x19, 0xfffffffffffdffff, 0xfffffffffffdffff, 0x800000000000, x1, 8, x2)

inst_122:
    // Test 122:  Test with marching zeros/ones
    // result rd:x18(0xfffffffffffbffff), rs1:x19(0xfffffffffffbffff), rs2:x20(0x0000400000000000)
    TEST_RR_OP(sraw, x18, x19, x20, 0xfffffffffffbffff, 0xfffffffffffbffff, 0x400000000000, x1, 16, x2)

inst_123:
    // Test 123:  Test with marching zeros/ones
    // result rd:x19(0xfffffffffff7ffff), rs1:x20(0xfffffffffff7ffff), rs2:x21(0x0000200000000000)
    TEST_RR_OP(sraw, x19, x20, x21, 0xfffffffffff7ffff, 0xfffffffffff7ffff, 0x200000000000, x1, 24, x2)

inst_124:
    // Test 124:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffefffff), rs1:x21(0xffffffffffefffff), rs2:x22(0x0000100000000000)
    TEST_RR_OP(sraw, x20, x21, x22, 0xffffffffffefffff, 0xffffffffffefffff, 0x100000000000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_26_0)


inst_125:
    // Test 125:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffdfffff), rs1:x22(0xffffffffffdfffff), rs2:x23(0x0000080000000000)
    TEST_RR_OP(sraw, x21, x22, x23, 0xffffffffffdfffff, 0xffffffffffdfffff, 0x80000000000, x1, 0, x2)

inst_126:
    // Test 126:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffbfffff), rs1:x23(0xffffffffffbfffff), rs2:x24(0x0000040000000000)
    TEST_RR_OP(sraw, x22, x23, x24, 0xffffffffffbfffff, 0xffffffffffbfffff, 0x40000000000, x1, 8, x2)

inst_127:
    // Test 127:  Test with marching zeros/ones
    // result rd:x23(0xffffffffff7fffff), rs1:x24(0xffffffffff7fffff), rs2:x25(0x0000020000000000)
    TEST_RR_OP(sraw, x23, x24, x25, 0xffffffffff7fffff, 0xffffffffff7fffff, 0x20000000000, x1, 16, x2)

inst_128:
    // Test 128:  Test with marching zeros/ones
    // result rd:x24(0xfffffffffeffffff), rs1:x25(0xfffffffffeffffff), rs2:x26(0x0000010000000000)
    TEST_RR_OP(sraw, x24, x25, x26, 0xfffffffffeffffff, 0xfffffffffeffffff, 0x10000000000, x1, 24, x2)

inst_129:
    // Test 129:  Test with marching zeros/ones
    // result rd:x25(0xfffffffffdffffff), rs1:x26(0xfffffffffdffffff), rs2:x27(0x0000008000000000)
    TEST_RR_OP(sraw, x25, x26, x27, 0xfffffffffdffffff, 0xfffffffffdffffff, 0x8000000000, x1, 32, x2)

    

    RVTEST_SIGBASE(x2,signature_27_0)


inst_130:
    // Test 130:  Test with marching zeros/ones
    // result rd:x26(0xfffffffffbffffff), rs1:x27(0xfffffffffbffffff), rs2:x28(0x0000004000000000)
    TEST_RR_OP(sraw, x26, x27, x28, 0xfffffffffbffffff, 0xfffffffffbffffff, 0x4000000000, x2, 0, x3)

inst_131:
    // Test 131:  Test with marching zeros/ones
    // result rd:x27(0xfffffffff7ffffff), rs1:x28(0xfffffffff7ffffff), rs2:x29(0x0000002000000000)
    TEST_RR_OP(sraw, x27, x28, x29, 0xfffffffff7ffffff, 0xfffffffff7ffffff, 0x2000000000, x2, 8, x3)

inst_132:
    // Test 132:  Test with marching zeros/ones
    // result rd:x28(0xffffffffefffffff), rs1:x29(0xffffffffefffffff), rs2:x30(0x0000001000000000)
    TEST_RR_OP(sraw, x28, x29, x30, 0xffffffffefffffff, 0xffffffffefffffff, 0x1000000000, x2, 16, x3)

inst_133:
    // Test 133:  Test with marching zeros/ones
    // result rd:x29(0xffffffffdfffffff), rs1:x30(0xffffffffdfffffff), rs2:x31(0x0000000800000000)
    TEST_RR_OP(sraw, x29, x30, x31, 0xffffffffdfffffff, 0xffffffffdfffffff, 0x800000000, x2, 24, x3)

inst_134:
    // Test 134:  Test with marching zeros/ones
    // result rd:x30(0xffffffffbfffffff), rs1:x31(0xffffffffbfffffff), rs2:x1(0x0000000400000000)
    TEST_RR_OP(sraw, x30, x31, x1, 0xffffffffbfffffff, 0xffffffffbfffffff, 0x400000000, x2, 32, x3)

    

    RVTEST_SIGBASE(x6,signature_28_0)


inst_135:
    // Test 135:  Test with marching zeros/ones
    // result rd:x31(0x000000007fffffff), rs1:x1(0xffffffff7fffffff), rs2:x2(0x0000000200000000)
    TEST_RR_OP(sraw, x31, x1, x2, 0x000000007fffffff, 0xffffffff7fffffff, 0x200000000, x6, 0, x7)

inst_136:
    // Test 136:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffff), rs1:x2(0xfffffffeffffffff), rs2:x3(0x0000000100000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xffffffffffffffff, 0xfffffffeffffffff, 0x100000000, x6, 8, x7)

inst_137:
    // Test 137:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffff), rs1:x2(0xfffffffdffffffff), rs2:x3(0x0000000080000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xffffffffffffffff, 0xfffffffdffffffff, 0x80000000, x6, 16, x7)

inst_138:
    // Test 138:  Test with marching zeros/ones
    // result rd:x2(0xffffffffffffffff), rs1:x3(0xfffffffbffffffff), rs2:x4(0x0000000040000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0xffffffffffffffff, 0xfffffffbffffffff, 0x40000000, x6, 24, x7)

inst_139:
    // Test 139:  Test with marching zeros/ones
    // result rd:x3(0xffffffffffffffff), rs1:x4(0xfffffff7ffffffff), rs2:x5(0x0000000020000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0xffffffffffffffff, 0xfffffff7ffffffff, 0x20000000, x6, 32, x7)

    

    RVTEST_SIGBASE(x1,signature_29_0)


inst_140:
    // Test 140:  Test with marching zeros/ones
    // result rd:x4(0xffffffffffffffff), rs1:x5(0xffffffefffffffff), rs2:x6(0x0000000010000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0xffffffffffffffff, 0xffffffefffffffff, 0x10000000, x1, 0, x2)

inst_141:
    // Test 141:  Test with marching zeros/ones
    // result rd:x5(0xffffffffffffffff), rs1:x6(0xffffffdfffffffff), rs2:x7(0x0000000008000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0xffffffffffffffff, 0xffffffdfffffffff, 0x8000000, x1, 8, x2)

inst_142:
    // Test 142:  Test with marching zeros/ones
    // result rd:x6(0xffffffffffffffff), rs1:x7(0xffffffbfffffffff), rs2:x8(0x0000000004000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0xffffffffffffffff, 0xffffffbfffffffff, 0x4000000, x1, 16, x2)

inst_143:
    // Test 143:  Test with marching zeros/ones
    // result rd:x7(0xffffffffffffffff), rs1:x8(0xffffff7fffffffff), rs2:x9(0x0000000002000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0xffffffffffffffff, 0xffffff7fffffffff, 0x2000000, x1, 24, x2)

inst_144:
    // Test 144:  Test with marching zeros/ones
    // result rd:x8(0xffffffffffffffff), rs1:x9(0xfffffeffffffffff), rs2:x10(0x0000000001000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0xffffffffffffffff, 0xfffffeffffffffff, 0x1000000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_30_0)


inst_145:
    // Test 145:  Test with marching zeros/ones
    // result rd:x9(0xffffffffffffffff), rs1:x10(0xfffffdffffffffff), rs2:x11(0x0000000000800000)
    TEST_RR_OP(sraw, x9, x10, x11, 0xffffffffffffffff, 0xfffffdffffffffff, 0x800000, x1, 0, x2)

inst_146:
    // Test 146:  Test with marching zeros/ones
    // result rd:x10(0xffffffffffffffff), rs1:x11(0xfffffbffffffffff), rs2:x12(0x0000000000400000)
    TEST_RR_OP(sraw, x10, x11, x12, 0xffffffffffffffff, 0xfffffbffffffffff, 0x400000, x1, 8, x2)

inst_147:
    // Test 147:  Test with marching zeros/ones
    // result rd:x11(0xffffffffffffffff), rs1:x12(0xfffff7ffffffffff), rs2:x13(0x0000000000200000)
    TEST_RR_OP(sraw, x11, x12, x13, 0xffffffffffffffff, 0xfffff7ffffffffff, 0x200000, x1, 16, x2)

inst_148:
    // Test 148:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffffff), rs1:x13(0xffffefffffffffff), rs2:x14(0x0000000000100000)
    TEST_RR_OP(sraw, x12, x13, x14, 0xffffffffffffffff, 0xffffefffffffffff, 0x100000, x1, 24, x2)

inst_149:
    // Test 149:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffffff), rs1:x14(0xffffdfffffffffff), rs2:x15(0x0000000000080000)
    TEST_RR_OP(sraw, x13, x14, x15, 0xffffffffffffffff, 0xffffdfffffffffff, 0x80000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_31_0)


inst_150:
    // Test 150:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffffff), rs1:x15(0xffffbfffffffffff), rs2:x16(0x0000000000040000)
    TEST_RR_OP(sraw, x14, x15, x16, 0xffffffffffffffff, 0xffffbfffffffffff, 0x40000, x1, 0, x2)

inst_151:
    // Test 151:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffffffff), rs1:x16(0xffff7fffffffffff), rs2:x17(0x0000000000020000)
    TEST_RR_OP(sraw, x15, x16, x17, 0xffffffffffffffff, 0xffff7fffffffffff, 0x20000, x1, 8, x2)

inst_152:
    // Test 152:  Test with marching zeros/ones
    // result rd:x16(0xffffffffffffffff), rs1:x17(0xfffeffffffffffff), rs2:x18(0x0000000000010000)
    TEST_RR_OP(sraw, x16, x17, x18, 0xffffffffffffffff, 0xfffeffffffffffff, 0x10000, x1, 16, x2)

inst_153:
    // Test 153:  Test with marching zeros/ones
    // result rd:x17(0xffffffffffffffff), rs1:x18(0xfffdffffffffffff), rs2:x19(0x0000000000008000)
    TEST_RR_OP(sraw, x17, x18, x19, 0xffffffffffffffff, 0xfffdffffffffffff, 0x8000, x1, 24, x2)

inst_154:
    // Test 154:  Test with marching zeros/ones
    // result rd:x18(0xffffffffffffffff), rs1:x19(0xfffbffffffffffff), rs2:x20(0x0000000000004000)
    TEST_RR_OP(sraw, x18, x19, x20, 0xffffffffffffffff, 0xfffbffffffffffff, 0x4000, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_32_0)


inst_155:
    // Test 155:  Test with marching zeros/ones
    // result rd:x19(0xffffffffffffffff), rs1:x20(0xfff7ffffffffffff), rs2:x21(0x0000000000002000)
    TEST_RR_OP(sraw, x19, x20, x21, 0xffffffffffffffff, 0xfff7ffffffffffff, 0x2000, x1, 0, x2)

inst_156:
    // Test 156:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffffffff), rs1:x21(0xffefffffffffffff), rs2:x22(0x0000000000001000)
    TEST_RR_OP(sraw, x20, x21, x22, 0xffffffffffffffff, 0xffefffffffffffff, 0x1000, x1, 8, x2)

inst_157:
    // Test 157:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffffffff), rs1:x22(0xffdfffffffffffff), rs2:x23(0x0000000000000800)
    TEST_RR_OP(sraw, x21, x22, x23, 0xffffffffffffffff, 0xffdfffffffffffff, 0x800, x1, 16, x2)

inst_158:
    // Test 158:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffffffff), rs1:x23(0xffbfffffffffffff), rs2:x24(0x0000000000000400)
    TEST_RR_OP(sraw, x22, x23, x24, 0xffffffffffffffff, 0xffbfffffffffffff, 0x400, x1, 24, x2)

inst_159:
    // Test 159:  Test with marching zeros/ones
    // result rd:x23(0xffffffffffffffff), rs1:x24(0xff7fffffffffffff), rs2:x25(0x0000000000000200)
    TEST_RR_OP(sraw, x23, x24, x25, 0xffffffffffffffff, 0xff7fffffffffffff, 0x200, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_33_0)


inst_160:
    // Test 160:  Test with marching zeros/ones
    // result rd:x24(0xffffffffffffffff), rs1:x25(0xfeffffffffffffff), rs2:x26(0x0000000000000100)
    TEST_RR_OP(sraw, x24, x25, x26, 0xffffffffffffffff, 0xfeffffffffffffff, 0x100, x1, 0, x2)

inst_161:
    // Test 161:  Test with marching zeros/ones
    // result rd:x25(0xffffffffffffffff), rs1:x26(0xfdffffffffffffff), rs2:x27(0x0000000000000080)
    TEST_RR_OP(sraw, x25, x26, x27, 0xffffffffffffffff, 0xfdffffffffffffff, 0x80, x1, 8, x2)

inst_162:
    // Test 162:  Test with marching zeros/ones
    // result rd:x26(0xffffffffffffffff), rs1:x27(0xfbffffffffffffff), rs2:x28(0x0000000000000040)
    TEST_RR_OP(sraw, x26, x27, x28, 0xffffffffffffffff, 0xfbffffffffffffff, 0x40, x1, 16, x2)

inst_163:
    // Test 163:  Test with marching zeros/ones
    // result rd:x27(0xffffffffffffffff), rs1:x28(0xf7ffffffffffffff), rs2:x29(0x0000000000000020)
    TEST_RR_OP(sraw, x27, x28, x29, 0xffffffffffffffff, 0xf7ffffffffffffff, 0x20, x1, 24, x2)

inst_164:
    // Test 164:  Test with marching zeros/ones
    // result rd:x28(0xffffffffffffffff), rs1:x29(0xefffffffffffffff), rs2:x30(0x0000000000000010)
    TEST_RR_OP(sraw, x28, x29, x30, 0xffffffffffffffff, 0xefffffffffffffff, 0x10, x1, 32, x2)

    

    RVTEST_SIGBASE(x4,signature_34_0)


inst_165:
    // Test 165:  Test with marching zeros/ones
    // result rd:x29(0xffffffffffffffff), rs1:x30(0xdfffffffffffffff), rs2:x31(0x0000000000000008)
    TEST_RR_OP(sraw, x29, x30, x31, 0xffffffffffffffff, 0xdfffffffffffffff, 0x8, x4, 0, x5)

inst_166:
    // Test 166:  Test with marching zeros/ones
    // result rd:x30(0xffffffffffffffff), rs1:x31(0xbfffffffffffffff), rs2:x1(0x0000000000000004)
    TEST_RR_OP(sraw, x30, x31, x1, 0xffffffffffffffff, 0xbfffffffffffffff, 0x4, x4, 8, x5)

inst_167:
    // Test 167:  Test with marching zeros/ones
    // result rd:x31(0xffffffffffffffff), rs1:x1(0x7fffffffffffffff), rs2:x2(0x0000000000000002)
    TEST_RR_OP(sraw, x31, x1, x2, 0xffffffffffffffff, 0x7fffffffffffffff, 0x2, x4, 16, x5)

inst_168:
    // Test 168:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000001), rs1:x2(0x0000000000000001), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000001, 0x1, 0x0, x4, 24, x5)

inst_169:
    // Test 169:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000002), rs1:x2(0x0000000000000002), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000002, 0x2, 0x0, x4, 32, x5)

    

    RVTEST_SIGBASE(x1,signature_35_0)


inst_170:
    // Test 170:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000004), rs1:x3(0x0000000000000004), rs2:x4(0x0000000000000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0x0000000000000004, 0x4, 0x0, x1, 0, x9)

inst_171:
    // Test 171:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000008), rs1:x4(0x0000000000000008), rs2:x5(0x0000000000000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0x0000000000000008, 0x8, 0x0, x1, 8, x9)

inst_172:
    // Test 172:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000010), rs1:x5(0x0000000000000010), rs2:x6(0x0000000000000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0x0000000000000010, 0x10, 0x0, x1, 16, x9)

inst_173:
    // Test 173:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000020), rs1:x6(0x0000000000000020), rs2:x7(0x0000000000000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0x0000000000000020, 0x20, 0x0, x1, 24, x9)

inst_174:
    // Test 174:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000040), rs1:x7(0x0000000000000040), rs2:x8(0x0000000000000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0x0000000000000040, 0x40, 0x0, x1, 32, x9)

    

    RVTEST_SIGBASE(x1,signature_36_0)


inst_175:
    // Test 175:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000080), rs1:x8(0x0000000000000080), rs2:x9(0x0000000000000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0x0000000000000080, 0x80, 0x0, x1, 0, x2)

inst_176:
    // Test 176:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000100), rs1:x9(0x0000000000000100), rs2:x10(0x0000000000000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0x0000000000000100, 0x100, 0x0, x1, 8, x2)

inst_177:
    // Test 177:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000200), rs1:x10(0x0000000000000200), rs2:x11(0x0000000000000000)
    TEST_RR_OP(sraw, x9, x10, x11, 0x0000000000000200, 0x200, 0x0, x1, 16, x2)

inst_178:
    // Test 178:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000400), rs1:x11(0x0000000000000400), rs2:x12(0x0000000000000000)
    TEST_RR_OP(sraw, x10, x11, x12, 0x0000000000000400, 0x400, 0x0, x1, 24, x2)

inst_179:
    // Test 179:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000800), rs1:x12(0x0000000000000800), rs2:x13(0x0000000000000000)
    TEST_RR_OP(sraw, x11, x12, x13, 0x0000000000000800, 0x800, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_37_0)


inst_180:
    // Test 180:  Test with marching zeros/ones
    // result rd:x12(0x0000000000001000), rs1:x13(0x0000000000001000), rs2:x14(0x0000000000000000)
    TEST_RR_OP(sraw, x12, x13, x14, 0x0000000000001000, 0x1000, 0x0, x1, 0, x2)

inst_181:
    // Test 181:  Test with marching zeros/ones
    // result rd:x13(0x0000000000002000), rs1:x14(0x0000000000002000), rs2:x15(0x0000000000000000)
    TEST_RR_OP(sraw, x13, x14, x15, 0x0000000000002000, 0x2000, 0x0, x1, 8, x2)

inst_182:
    // Test 182:  Test with marching zeros/ones
    // result rd:x14(0x0000000000004000), rs1:x15(0x0000000000004000), rs2:x16(0x0000000000000000)
    TEST_RR_OP(sraw, x14, x15, x16, 0x0000000000004000, 0x4000, 0x0, x1, 16, x2)

inst_183:
    // Test 183:  Test with marching zeros/ones
    // result rd:x15(0x0000000000008000), rs1:x16(0x0000000000008000), rs2:x17(0x0000000000000000)
    TEST_RR_OP(sraw, x15, x16, x17, 0x0000000000008000, 0x8000, 0x0, x1, 24, x2)

inst_184:
    // Test 184:  Test with marching zeros/ones
    // result rd:x16(0x0000000000010000), rs1:x17(0x0000000000010000), rs2:x18(0x0000000000000000)
    TEST_RR_OP(sraw, x16, x17, x18, 0x0000000000010000, 0x10000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_38_0)


inst_185:
    // Test 185:  Test with marching zeros/ones
    // result rd:x17(0x0000000000020000), rs1:x18(0x0000000000020000), rs2:x19(0x0000000000000000)
    TEST_RR_OP(sraw, x17, x18, x19, 0x0000000000020000, 0x20000, 0x0, x1, 0, x2)

inst_186:
    // Test 186:  Test with marching zeros/ones
    // result rd:x18(0x0000000000040000), rs1:x19(0x0000000000040000), rs2:x20(0x0000000000000000)
    TEST_RR_OP(sraw, x18, x19, x20, 0x0000000000040000, 0x40000, 0x0, x1, 8, x2)

inst_187:
    // Test 187:  Test with marching zeros/ones
    // result rd:x19(0x0000000000080000), rs1:x20(0x0000000000080000), rs2:x21(0x0000000000000000)
    TEST_RR_OP(sraw, x19, x20, x21, 0x0000000000080000, 0x80000, 0x0, x1, 16, x2)

inst_188:
    // Test 188:  Test with marching zeros/ones
    // result rd:x20(0x0000000000100000), rs1:x21(0x0000000000100000), rs2:x22(0x0000000000000000)
    TEST_RR_OP(sraw, x20, x21, x22, 0x0000000000100000, 0x100000, 0x0, x1, 24, x2)

inst_189:
    // Test 189:  Test with marching zeros/ones
    // result rd:x21(0x0000000000200000), rs1:x22(0x0000000000200000), rs2:x23(0x0000000000000000)
    TEST_RR_OP(sraw, x21, x22, x23, 0x0000000000200000, 0x200000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_39_0)


inst_190:
    // Test 190:  Test with marching zeros/ones
    // result rd:x22(0x0000000000400000), rs1:x23(0x0000000000400000), rs2:x24(0x0000000000000000)
    TEST_RR_OP(sraw, x22, x23, x24, 0x0000000000400000, 0x400000, 0x0, x1, 0, x2)

inst_191:
    // Test 191:  Test with marching zeros/ones
    // result rd:x23(0x0000000000800000), rs1:x24(0x0000000000800000), rs2:x25(0x0000000000000000)
    TEST_RR_OP(sraw, x23, x24, x25, 0x0000000000800000, 0x800000, 0x0, x1, 8, x2)

inst_192:
    // Test 192:  Test with marching zeros/ones
    // result rd:x24(0x0000000001000000), rs1:x25(0x0000000001000000), rs2:x26(0x0000000000000000)
    TEST_RR_OP(sraw, x24, x25, x26, 0x0000000001000000, 0x1000000, 0x0, x1, 16, x2)

inst_193:
    // Test 193:  Test with marching zeros/ones
    // result rd:x25(0x0000000002000000), rs1:x26(0x0000000002000000), rs2:x27(0x0000000000000000)
    TEST_RR_OP(sraw, x25, x26, x27, 0x0000000002000000, 0x2000000, 0x0, x1, 24, x2)

inst_194:
    // Test 194:  Test with marching zeros/ones
    // result rd:x26(0x0000000004000000), rs1:x27(0x0000000004000000), rs2:x28(0x0000000000000000)
    TEST_RR_OP(sraw, x26, x27, x28, 0x0000000004000000, 0x4000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x3,signature_40_0)


inst_195:
    // Test 195:  Test with marching zeros/ones
    // result rd:x27(0x0000000008000000), rs1:x28(0x0000000008000000), rs2:x29(0x0000000000000000)
    TEST_RR_OP(sraw, x27, x28, x29, 0x0000000008000000, 0x8000000, 0x0, x3, 0, x4)

inst_196:
    // Test 196:  Test with marching zeros/ones
    // result rd:x28(0x0000000010000000), rs1:x29(0x0000000010000000), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x28, x29, x30, 0x0000000010000000, 0x10000000, 0x0, x3, 8, x4)

inst_197:
    // Test 197:  Test with marching zeros/ones
    // result rd:x29(0x0000000020000000), rs1:x30(0x0000000020000000), rs2:x31(0x0000000000000000)
    TEST_RR_OP(sraw, x29, x30, x31, 0x0000000020000000, 0x20000000, 0x0, x3, 16, x4)

inst_198:
    // Test 198:  Test with marching zeros/ones
    // result rd:x30(0x0000000040000000), rs1:x31(0x0000000040000000), rs2:x1(0x0000000000000000)
    TEST_RR_OP(sraw, x30, x31, x1, 0x0000000040000000, 0x40000000, 0x0, x3, 24, x4)

inst_199:
    // Test 199:  Test with marching zeros/ones
    // result rd:x31(0xffffffff80000000), rs1:x1(0x0000000080000000), rs2:x2(0x0000000000000000)
    TEST_RR_OP(sraw, x31, x1, x2, 0xffffffff80000000, 0x80000000, 0x0, x3, 32, x4)

    

    RVTEST_SIGBASE(x7,signature_41_0)


inst_200:
    // Test 200:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000100000000), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x100000000, 0x0, x7, 0, x8)

inst_201:
    // Test 201:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000000), rs1:x2(0x0000000200000000), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0x0000000000000000, 0x200000000, 0x0, x7, 8, x8)

inst_202:
    // Test 202:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000000), rs1:x3(0x0000000400000000), rs2:x4(0x0000000000000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0x0000000000000000, 0x400000000, 0x0, x7, 16, x8)

inst_203:
    // Test 203:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000000), rs1:x4(0x0000000800000000), rs2:x5(0x0000000000000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0x0000000000000000, 0x800000000, 0x0, x7, 24, x8)

inst_204:
    // Test 204:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000000), rs1:x5(0x0000001000000000), rs2:x6(0x0000000000000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0x0000000000000000, 0x1000000000, 0x0, x7, 32, x8)

    

    RVTEST_SIGBASE(x1,signature_42_0)


inst_205:
    // Test 205:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000000), rs1:x6(0x0000002000000000), rs2:x7(0x0000000000000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0x0000000000000000, 0x2000000000, 0x0, x1, 0, x2)

inst_206:
    // Test 206:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000000), rs1:x7(0x0000004000000000), rs2:x8(0x0000000000000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0x0000000000000000, 0x4000000000, 0x0, x1, 8, x2)

inst_207:
    // Test 207:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000000), rs1:x8(0x0000008000000000), rs2:x9(0x0000000000000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0x0000000000000000, 0x8000000000, 0x0, x1, 16, x2)

inst_208:
    // Test 208:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000000), rs1:x9(0x0000010000000000), rs2:x10(0x0000000000000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0x0000000000000000, 0x10000000000, 0x0, x1, 24, x2)

inst_209:
    // Test 209:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000000), rs1:x10(0x0000020000000000), rs2:x11(0x0000000000000000)
    TEST_RR_OP(sraw, x9, x10, x11, 0x0000000000000000, 0x20000000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_43_0)


inst_210:
    // Test 210:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000000), rs1:x11(0x0000040000000000), rs2:x12(0x0000000000000000)
    TEST_RR_OP(sraw, x10, x11, x12, 0x0000000000000000, 0x40000000000, 0x0, x1, 0, x2)

inst_211:
    // Test 211:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000000), rs1:x12(0x0000080000000000), rs2:x13(0x0000000000000000)
    TEST_RR_OP(sraw, x11, x12, x13, 0x0000000000000000, 0x80000000000, 0x0, x1, 8, x2)

inst_212:
    // Test 212:  Test with marching zeros/ones
    // result rd:x12(0x0000000000000000), rs1:x13(0x0000100000000000), rs2:x14(0x0000000000000000)
    TEST_RR_OP(sraw, x12, x13, x14, 0x0000000000000000, 0x100000000000, 0x0, x1, 16, x2)

inst_213:
    // Test 213:  Test with marching zeros/ones
    // result rd:x13(0x0000000000000000), rs1:x14(0x0000200000000000), rs2:x15(0x0000000000000000)
    TEST_RR_OP(sraw, x13, x14, x15, 0x0000000000000000, 0x200000000000, 0x0, x1, 24, x2)

inst_214:
    // Test 214:  Test with marching zeros/ones
    // result rd:x14(0x0000000000000000), rs1:x15(0x0000400000000000), rs2:x16(0x0000000000000000)
    TEST_RR_OP(sraw, x14, x15, x16, 0x0000000000000000, 0x400000000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_44_0)


inst_215:
    // Test 215:  Test with marching zeros/ones
    // result rd:x15(0x0000000000000000), rs1:x16(0x0000800000000000), rs2:x17(0x0000000000000000)
    TEST_RR_OP(sraw, x15, x16, x17, 0x0000000000000000, 0x800000000000, 0x0, x1, 0, x2)

inst_216:
    // Test 216:  Test with marching zeros/ones
    // result rd:x16(0x0000000000000000), rs1:x17(0x0001000000000000), rs2:x18(0x0000000000000000)
    TEST_RR_OP(sraw, x16, x17, x18, 0x0000000000000000, 0x1000000000000, 0x0, x1, 8, x2)

inst_217:
    // Test 217:  Test with marching zeros/ones
    // result rd:x17(0x0000000000000000), rs1:x18(0x0002000000000000), rs2:x19(0x0000000000000000)
    TEST_RR_OP(sraw, x17, x18, x19, 0x0000000000000000, 0x2000000000000, 0x0, x1, 16, x2)

inst_218:
    // Test 218:  Test with marching zeros/ones
    // result rd:x18(0x0000000000000000), rs1:x19(0x0004000000000000), rs2:x20(0x0000000000000000)
    TEST_RR_OP(sraw, x18, x19, x20, 0x0000000000000000, 0x4000000000000, 0x0, x1, 24, x2)

inst_219:
    // Test 219:  Test with marching zeros/ones
    // result rd:x19(0x0000000000000000), rs1:x20(0x0008000000000000), rs2:x21(0x0000000000000000)
    TEST_RR_OP(sraw, x19, x20, x21, 0x0000000000000000, 0x8000000000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_45_0)


inst_220:
    // Test 220:  Test with marching zeros/ones
    // result rd:x20(0x0000000000000000), rs1:x21(0x0010000000000000), rs2:x22(0x0000000000000000)
    TEST_RR_OP(sraw, x20, x21, x22, 0x0000000000000000, 0x10000000000000, 0x0, x1, 0, x2)

inst_221:
    // Test 221:  Test with marching zeros/ones
    // result rd:x21(0x0000000000000000), rs1:x22(0x0020000000000000), rs2:x23(0x0000000000000000)
    TEST_RR_OP(sraw, x21, x22, x23, 0x0000000000000000, 0x20000000000000, 0x0, x1, 8, x2)

inst_222:
    // Test 222:  Test with marching zeros/ones
    // result rd:x22(0x0000000000000000), rs1:x23(0x0040000000000000), rs2:x24(0x0000000000000000)
    TEST_RR_OP(sraw, x22, x23, x24, 0x0000000000000000, 0x40000000000000, 0x0, x1, 16, x2)

inst_223:
    // Test 223:  Test with marching zeros/ones
    // result rd:x23(0x0000000000000000), rs1:x24(0x0080000000000000), rs2:x25(0x0000000000000000)
    TEST_RR_OP(sraw, x23, x24, x25, 0x0000000000000000, 0x80000000000000, 0x0, x1, 24, x2)

inst_224:
    // Test 224:  Test with marching zeros/ones
    // result rd:x24(0x0000000000000000), rs1:x25(0x0100000000000000), rs2:x26(0x0000000000000000)
    TEST_RR_OP(sraw, x24, x25, x26, 0x0000000000000000, 0x100000000000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_46_0)


inst_225:
    // Test 225:  Test with marching zeros/ones
    // result rd:x25(0x0000000000000000), rs1:x26(0x0200000000000000), rs2:x27(0x0000000000000000)
    TEST_RR_OP(sraw, x25, x26, x27, 0x0000000000000000, 0x200000000000000, 0x0, x1, 0, x2)

inst_226:
    // Test 226:  Test with marching zeros/ones
    // result rd:x26(0x0000000000000000), rs1:x27(0x0400000000000000), rs2:x28(0x0000000000000000)
    TEST_RR_OP(sraw, x26, x27, x28, 0x0000000000000000, 0x400000000000000, 0x0, x1, 8, x2)

inst_227:
    // Test 227:  Test with marching zeros/ones
    // result rd:x27(0x0000000000000000), rs1:x28(0x0800000000000000), rs2:x29(0x0000000000000000)
    TEST_RR_OP(sraw, x27, x28, x29, 0x0000000000000000, 0x800000000000000, 0x0, x1, 16, x2)

inst_228:
    // Test 228:  Test with marching zeros/ones
    // result rd:x28(0x0000000000000000), rs1:x29(0x1000000000000000), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x28, x29, x30, 0x0000000000000000, 0x1000000000000000, 0x0, x1, 24, x2)

inst_229:
    // Test 229:  Test with marching zeros/ones
    // result rd:x29(0x0000000000000000), rs1:x30(0x2000000000000000), rs2:x31(0x0000000000000000)
    TEST_RR_OP(sraw, x29, x30, x31, 0x0000000000000000, 0x2000000000000000, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x5,signature_47_0)


inst_230:
    // Test 230:  Test with marching zeros/ones
    // result rd:x30(0x0000000000000000), rs1:x31(0x4000000000000000), rs2:x1(0x0000000000000000)
    TEST_RR_OP(sraw, x30, x31, x1, 0x0000000000000000, 0x4000000000000000, 0x0, x5, 0, x6)

inst_231:
    // Test 231:  Test with marching zeros/ones
    // result rd:x31(0x0000000000000000), rs1:x1(0x8000000000000000), rs2:x2(0x0000000000000000)
    TEST_RR_OP(sraw, x31, x1, x2, 0x0000000000000000, 0x8000000000000000, 0x0, x5, 8, x6)

inst_232:
    // Test 232:  Test with marching zeros/ones
    // result rd:x1(0xfffffffffffffffe), rs1:x2(0xfffffffffffffffe), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xfffffffffffffffe, 0xfffffffffffffffe, 0x0, x5, 16, x6)

inst_233:
    // Test 233:  Test with marching zeros/ones
    // result rd:x1(0xfffffffffffffffd), rs1:x2(0xfffffffffffffffd), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xfffffffffffffffd, 0xfffffffffffffffd, 0x0, x5, 24, x6)

inst_234:
    // Test 234:  Test with marching zeros/ones
    // result rd:x2(0xfffffffffffffffb), rs1:x3(0xfffffffffffffffb), rs2:x4(0x0000000000000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0xfffffffffffffffb, 0xfffffffffffffffb, 0x0, x5, 32, x6)

    

    RVTEST_SIGBASE(x1,signature_48_0)


inst_235:
    // Test 235:  Test with marching zeros/ones
    // result rd:x3(0xfffffffffffffff7), rs1:x4(0xfffffffffffffff7), rs2:x5(0x0000000000000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0xfffffffffffffff7, 0xfffffffffffffff7, 0x0, x1, 0, x2)

inst_236:
    // Test 236:  Test with marching zeros/ones
    // result rd:x4(0xffffffffffffffef), rs1:x5(0xffffffffffffffef), rs2:x6(0x0000000000000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0xffffffffffffffef, 0xffffffffffffffef, 0x0, x1, 8, x2)

inst_237:
    // Test 237:  Test with marching zeros/ones
    // result rd:x5(0xffffffffffffffdf), rs1:x6(0xffffffffffffffdf), rs2:x7(0x0000000000000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0xffffffffffffffdf, 0xffffffffffffffdf, 0x0, x1, 16, x2)

inst_238:
    // Test 238:  Test with marching zeros/ones
    // result rd:x6(0xffffffffffffffbf), rs1:x7(0xffffffffffffffbf), rs2:x8(0x0000000000000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0xffffffffffffffbf, 0xffffffffffffffbf, 0x0, x1, 24, x2)

inst_239:
    // Test 239:  Test with marching zeros/ones
    // result rd:x7(0xffffffffffffff7f), rs1:x8(0xffffffffffffff7f), rs2:x9(0x0000000000000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0xffffffffffffff7f, 0xffffffffffffff7f, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_49_0)


inst_240:
    // Test 240:  Test with marching zeros/ones
    // result rd:x8(0xfffffffffffffeff), rs1:x9(0xfffffffffffffeff), rs2:x10(0x0000000000000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0xfffffffffffffeff, 0xfffffffffffffeff, 0x0, x1, 0, x2)

inst_241:
    // Test 241:  Test with marching zeros/ones
    // result rd:x9(0xfffffffffffffdff), rs1:x10(0xfffffffffffffdff), rs2:x11(0x0000000000000000)
    TEST_RR_OP(sraw, x9, x10, x11, 0xfffffffffffffdff, 0xfffffffffffffdff, 0x0, x1, 8, x2)

inst_242:
    // Test 242:  Test with marching zeros/ones
    // result rd:x10(0xfffffffffffffbff), rs1:x11(0xfffffffffffffbff), rs2:x12(0x0000000000000000)
    TEST_RR_OP(sraw, x10, x11, x12, 0xfffffffffffffbff, 0xfffffffffffffbff, 0x0, x1, 16, x2)

inst_243:
    // Test 243:  Test with marching zeros/ones
    // result rd:x11(0xfffffffffffff7ff), rs1:x12(0xfffffffffffff7ff), rs2:x13(0x0000000000000000)
    TEST_RR_OP(sraw, x11, x12, x13, 0xfffffffffffff7ff, 0xfffffffffffff7ff, 0x0, x1, 24, x2)

inst_244:
    // Test 244:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffefff), rs1:x13(0xffffffffffffefff), rs2:x14(0x0000000000000000)
    TEST_RR_OP(sraw, x12, x13, x14, 0xffffffffffffefff, 0xffffffffffffefff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_50_0)


inst_245:
    // Test 245:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffdfff), rs1:x14(0xffffffffffffdfff), rs2:x15(0x0000000000000000)
    TEST_RR_OP(sraw, x13, x14, x15, 0xffffffffffffdfff, 0xffffffffffffdfff, 0x0, x1, 0, x2)

inst_246:
    // Test 246:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffbfff), rs1:x15(0xffffffffffffbfff), rs2:x16(0x0000000000000000)
    TEST_RR_OP(sraw, x14, x15, x16, 0xffffffffffffbfff, 0xffffffffffffbfff, 0x0, x1, 8, x2)

inst_247:
    // Test 247:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffff7fff), rs1:x16(0xffffffffffff7fff), rs2:x17(0x0000000000000000)
    TEST_RR_OP(sraw, x15, x16, x17, 0xffffffffffff7fff, 0xffffffffffff7fff, 0x0, x1, 16, x2)

inst_248:
    // Test 248:  Test with marching zeros/ones
    // result rd:x16(0xfffffffffffeffff), rs1:x17(0xfffffffffffeffff), rs2:x18(0x0000000000000000)
    TEST_RR_OP(sraw, x16, x17, x18, 0xfffffffffffeffff, 0xfffffffffffeffff, 0x0, x1, 24, x2)

inst_249:
    // Test 249:  Test with marching zeros/ones
    // result rd:x17(0xfffffffffffdffff), rs1:x18(0xfffffffffffdffff), rs2:x19(0x0000000000000000)
    TEST_RR_OP(sraw, x17, x18, x19, 0xfffffffffffdffff, 0xfffffffffffdffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_51_0)


inst_250:
    // Test 250:  Test with marching zeros/ones
    // result rd:x18(0xfffffffffffbffff), rs1:x19(0xfffffffffffbffff), rs2:x20(0x0000000000000000)
    TEST_RR_OP(sraw, x18, x19, x20, 0xfffffffffffbffff, 0xfffffffffffbffff, 0x0, x1, 0, x2)

inst_251:
    // Test 251:  Test with marching zeros/ones
    // result rd:x19(0xfffffffffff7ffff), rs1:x20(0xfffffffffff7ffff), rs2:x21(0x0000000000000000)
    TEST_RR_OP(sraw, x19, x20, x21, 0xfffffffffff7ffff, 0xfffffffffff7ffff, 0x0, x1, 8, x2)

inst_252:
    // Test 252:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffefffff), rs1:x21(0xffffffffffefffff), rs2:x22(0x0000000000000000)
    TEST_RR_OP(sraw, x20, x21, x22, 0xffffffffffefffff, 0xffffffffffefffff, 0x0, x1, 16, x2)

inst_253:
    // Test 253:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffdfffff), rs1:x22(0xffffffffffdfffff), rs2:x23(0x0000000000000000)
    TEST_RR_OP(sraw, x21, x22, x23, 0xffffffffffdfffff, 0xffffffffffdfffff, 0x0, x1, 24, x2)

inst_254:
    // Test 254:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffbfffff), rs1:x23(0xffffffffffbfffff), rs2:x24(0x0000000000000000)
    TEST_RR_OP(sraw, x22, x23, x24, 0xffffffffffbfffff, 0xffffffffffbfffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_52_0)


inst_255:
    // Test 255:  Test with marching zeros/ones
    // result rd:x23(0xffffffffff7fffff), rs1:x24(0xffffffffff7fffff), rs2:x25(0x0000000000000000)
    TEST_RR_OP(sraw, x23, x24, x25, 0xffffffffff7fffff, 0xffffffffff7fffff, 0x0, x1, 0, x2)

inst_256:
    // Test 256:  Test with marching zeros/ones
    // result rd:x24(0xfffffffffeffffff), rs1:x25(0xfffffffffeffffff), rs2:x26(0x0000000000000000)
    TEST_RR_OP(sraw, x24, x25, x26, 0xfffffffffeffffff, 0xfffffffffeffffff, 0x0, x1, 8, x2)

inst_257:
    // Test 257:  Test with marching zeros/ones
    // result rd:x25(0xfffffffffdffffff), rs1:x26(0xfffffffffdffffff), rs2:x27(0x0000000000000000)
    TEST_RR_OP(sraw, x25, x26, x27, 0xfffffffffdffffff, 0xfffffffffdffffff, 0x0, x1, 16, x2)

inst_258:
    // Test 258:  Test with marching zeros/ones
    // result rd:x26(0xfffffffffbffffff), rs1:x27(0xfffffffffbffffff), rs2:x28(0x0000000000000000)
    TEST_RR_OP(sraw, x26, x27, x28, 0xfffffffffbffffff, 0xfffffffffbffffff, 0x0, x1, 24, x2)

inst_259:
    // Test 259:  Test with marching zeros/ones
    // result rd:x27(0xfffffffff7ffffff), rs1:x28(0xfffffffff7ffffff), rs2:x29(0x0000000000000000)
    TEST_RR_OP(sraw, x27, x28, x29, 0xfffffffff7ffffff, 0xfffffffff7ffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x4,signature_53_0)


inst_260:
    // Test 260:  Test with marching zeros/ones
    // result rd:x28(0xffffffffefffffff), rs1:x29(0xffffffffefffffff), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x28, x29, x30, 0xffffffffefffffff, 0xffffffffefffffff, 0x0, x4, 0, x5)

inst_261:
    // Test 261:  Test with marching zeros/ones
    // result rd:x29(0xffffffffdfffffff), rs1:x30(0xffffffffdfffffff), rs2:x31(0x0000000000000000)
    TEST_RR_OP(sraw, x29, x30, x31, 0xffffffffdfffffff, 0xffffffffdfffffff, 0x0, x4, 8, x5)

inst_262:
    // Test 262:  Test with marching zeros/ones
    // result rd:x30(0xffffffffbfffffff), rs1:x31(0xffffffffbfffffff), rs2:x1(0x0000000000000000)
    TEST_RR_OP(sraw, x30, x31, x1, 0xffffffffbfffffff, 0xffffffffbfffffff, 0x0, x4, 16, x5)

inst_263:
    // Test 263:  Test with marching zeros/ones
    // result rd:x31(0x000000007fffffff), rs1:x1(0xffffffff7fffffff), rs2:x2(0x0000000000000000)
    TEST_RR_OP(sraw, x31, x1, x2, 0x000000007fffffff, 0xffffffff7fffffff, 0x0, x4, 24, x5)

inst_264:
    // Test 264:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffff), rs1:x2(0xfffffffeffffffff), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xffffffffffffffff, 0xfffffffeffffffff, 0x0, x4, 32, x5)

    

    RVTEST_SIGBASE(x8,signature_54_0)


inst_265:
    // Test 265:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffff), rs1:x2(0xfffffffdffffffff), rs2:x3(0x0000000000000000)
    TEST_RR_OP(sraw, x1, x2, x3, 0xffffffffffffffff, 0xfffffffdffffffff, 0x0, x8, 0, x9)

inst_266:
    // Test 266:  Test with marching zeros/ones
    // result rd:x2(0xffffffffffffffff), rs1:x3(0xfffffffbffffffff), rs2:x4(0x0000000000000000)
    TEST_RR_OP(sraw, x2, x3, x4, 0xffffffffffffffff, 0xfffffffbffffffff, 0x0, x8, 8, x9)

inst_267:
    // Test 267:  Test with marching zeros/ones
    // result rd:x3(0xffffffffffffffff), rs1:x4(0xfffffff7ffffffff), rs2:x5(0x0000000000000000)
    TEST_RR_OP(sraw, x3, x4, x5, 0xffffffffffffffff, 0xfffffff7ffffffff, 0x0, x8, 16, x9)

inst_268:
    // Test 268:  Test with marching zeros/ones
    // result rd:x4(0xffffffffffffffff), rs1:x5(0xffffffefffffffff), rs2:x6(0x0000000000000000)
    TEST_RR_OP(sraw, x4, x5, x6, 0xffffffffffffffff, 0xffffffefffffffff, 0x0, x8, 24, x9)

inst_269:
    // Test 269:  Test with marching zeros/ones
    // result rd:x5(0xffffffffffffffff), rs1:x6(0xffffffdfffffffff), rs2:x7(0x0000000000000000)
    TEST_RR_OP(sraw, x5, x6, x7, 0xffffffffffffffff, 0xffffffdfffffffff, 0x0, x8, 32, x9)

    

    RVTEST_SIGBASE(x1,signature_55_0)


inst_270:
    // Test 270:  Test with marching zeros/ones
    // result rd:x6(0xffffffffffffffff), rs1:x7(0xffffffbfffffffff), rs2:x8(0x0000000000000000)
    TEST_RR_OP(sraw, x6, x7, x8, 0xffffffffffffffff, 0xffffffbfffffffff, 0x0, x1, 0, x2)

inst_271:
    // Test 271:  Test with marching zeros/ones
    // result rd:x7(0xffffffffffffffff), rs1:x8(0xffffff7fffffffff), rs2:x9(0x0000000000000000)
    TEST_RR_OP(sraw, x7, x8, x9, 0xffffffffffffffff, 0xffffff7fffffffff, 0x0, x1, 8, x2)

inst_272:
    // Test 272:  Test with marching zeros/ones
    // result rd:x8(0xffffffffffffffff), rs1:x9(0xfffffeffffffffff), rs2:x10(0x0000000000000000)
    TEST_RR_OP(sraw, x8, x9, x10, 0xffffffffffffffff, 0xfffffeffffffffff, 0x0, x1, 16, x2)

inst_273:
    // Test 273:  Test with marching zeros/ones
    // result rd:x9(0xffffffffffffffff), rs1:x10(0xfffffdffffffffff), rs2:x11(0x0000000000000000)
    TEST_RR_OP(sraw, x9, x10, x11, 0xffffffffffffffff, 0xfffffdffffffffff, 0x0, x1, 24, x2)

inst_274:
    // Test 274:  Test with marching zeros/ones
    // result rd:x10(0xffffffffffffffff), rs1:x11(0xfffffbffffffffff), rs2:x12(0x0000000000000000)
    TEST_RR_OP(sraw, x10, x11, x12, 0xffffffffffffffff, 0xfffffbffffffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_56_0)


inst_275:
    // Test 275:  Test with marching zeros/ones
    // result rd:x11(0xffffffffffffffff), rs1:x12(0xfffff7ffffffffff), rs2:x13(0x0000000000000000)
    TEST_RR_OP(sraw, x11, x12, x13, 0xffffffffffffffff, 0xfffff7ffffffffff, 0x0, x1, 0, x2)

inst_276:
    // Test 276:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffffff), rs1:x13(0xffffefffffffffff), rs2:x14(0x0000000000000000)
    TEST_RR_OP(sraw, x12, x13, x14, 0xffffffffffffffff, 0xffffefffffffffff, 0x0, x1, 8, x2)

inst_277:
    // Test 277:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffffff), rs1:x14(0xffffdfffffffffff), rs2:x15(0x0000000000000000)
    TEST_RR_OP(sraw, x13, x14, x15, 0xffffffffffffffff, 0xffffdfffffffffff, 0x0, x1, 16, x2)

inst_278:
    // Test 278:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffffff), rs1:x15(0xffffbfffffffffff), rs2:x16(0x0000000000000000)
    TEST_RR_OP(sraw, x14, x15, x16, 0xffffffffffffffff, 0xffffbfffffffffff, 0x0, x1, 24, x2)

inst_279:
    // Test 279:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffffffff), rs1:x16(0xffff7fffffffffff), rs2:x17(0x0000000000000000)
    TEST_RR_OP(sraw, x15, x16, x17, 0xffffffffffffffff, 0xffff7fffffffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_57_0)


inst_280:
    // Test 280:  Test with marching zeros/ones
    // result rd:x16(0xffffffffffffffff), rs1:x17(0xfffeffffffffffff), rs2:x18(0x0000000000000000)
    TEST_RR_OP(sraw, x16, x17, x18, 0xffffffffffffffff, 0xfffeffffffffffff, 0x0, x1, 0, x2)

inst_281:
    // Test 281:  Test with marching zeros/ones
    // result rd:x17(0xffffffffffffffff), rs1:x18(0xfffdffffffffffff), rs2:x19(0x0000000000000000)
    TEST_RR_OP(sraw, x17, x18, x19, 0xffffffffffffffff, 0xfffdffffffffffff, 0x0, x1, 8, x2)

inst_282:
    // Test 282:  Test with marching zeros/ones
    // result rd:x18(0xffffffffffffffff), rs1:x19(0xfffbffffffffffff), rs2:x20(0x0000000000000000)
    TEST_RR_OP(sraw, x18, x19, x20, 0xffffffffffffffff, 0xfffbffffffffffff, 0x0, x1, 16, x2)

inst_283:
    // Test 283:  Test with marching zeros/ones
    // result rd:x19(0xffffffffffffffff), rs1:x20(0xfff7ffffffffffff), rs2:x21(0x0000000000000000)
    TEST_RR_OP(sraw, x19, x20, x21, 0xffffffffffffffff, 0xfff7ffffffffffff, 0x0, x1, 24, x2)

inst_284:
    // Test 284:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffffffff), rs1:x21(0xffefffffffffffff), rs2:x22(0x0000000000000000)
    TEST_RR_OP(sraw, x20, x21, x22, 0xffffffffffffffff, 0xffefffffffffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x1,signature_58_0)


inst_285:
    // Test 285:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffffffff), rs1:x22(0xffdfffffffffffff), rs2:x23(0x0000000000000000)
    TEST_RR_OP(sraw, x21, x22, x23, 0xffffffffffffffff, 0xffdfffffffffffff, 0x0, x1, 0, x2)

inst_286:
    // Test 286:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffffffff), rs1:x23(0xffbfffffffffffff), rs2:x24(0x0000000000000000)
    TEST_RR_OP(sraw, x22, x23, x24, 0xffffffffffffffff, 0xffbfffffffffffff, 0x0, x1, 8, x2)

inst_287:
    // Test 287:  Test with marching zeros/ones
    // result rd:x23(0xffffffffffffffff), rs1:x24(0xff7fffffffffffff), rs2:x25(0x0000000000000000)
    TEST_RR_OP(sraw, x23, x24, x25, 0xffffffffffffffff, 0xff7fffffffffffff, 0x0, x1, 16, x2)

inst_288:
    // Test 288:  Test with marching zeros/ones
    // result rd:x24(0xffffffffffffffff), rs1:x25(0xfeffffffffffffff), rs2:x26(0x0000000000000000)
    TEST_RR_OP(sraw, x24, x25, x26, 0xffffffffffffffff, 0xfeffffffffffffff, 0x0, x1, 24, x2)

inst_289:
    // Test 289:  Test with marching zeros/ones
    // result rd:x25(0xffffffffffffffff), rs1:x26(0xfdffffffffffffff), rs2:x27(0x0000000000000000)
    TEST_RR_OP(sraw, x25, x26, x27, 0xffffffffffffffff, 0xfdffffffffffffff, 0x0, x1, 32, x2)

    

    RVTEST_SIGBASE(x2,signature_59_0)


inst_290:
    // Test 290:  Test with marching zeros/ones
    // result rd:x26(0xffffffffffffffff), rs1:x27(0xfbffffffffffffff), rs2:x28(0x0000000000000000)
    TEST_RR_OP(sraw, x26, x27, x28, 0xffffffffffffffff, 0xfbffffffffffffff, 0x0, x2, 0, x3)

inst_291:
    // Test 291:  Test with marching zeros/ones
    // result rd:x27(0xffffffffffffffff), rs1:x28(0xf7ffffffffffffff), rs2:x29(0x0000000000000000)
    TEST_RR_OP(sraw, x27, x28, x29, 0xffffffffffffffff, 0xf7ffffffffffffff, 0x0, x2, 8, x3)

inst_292:
    // Test 292:  Test with marching zeros/ones
    // result rd:x28(0xffffffffffffffff), rs1:x29(0xefffffffffffffff), rs2:x30(0x0000000000000000)
    TEST_RR_OP(sraw, x28, x29, x30, 0xffffffffffffffff, 0xefffffffffffffff, 0x0, x2, 16, x3)

inst_293:
    // Test 293:  Test with marching zeros/ones
    // result rd:x29(0xffffffffffffffff), rs1:x30(0xdfffffffffffffff), rs2:x31(0x0000000000000000)
    TEST_RR_OP(sraw, x29, x30, x31, 0xffffffffffffffff, 0xdfffffffffffffff, 0x0, x2, 24, x3)

inst_294:
    // Test 294:  Test with marching zeros/ones
    // result rd:x30(0xffffffffffffffff), rs1:x31(0xbfffffffffffffff), rs2:x1(0x0000000000000000)
    TEST_RR_OP(sraw, x30, x31, x1, 0xffffffffffffffff, 0xbfffffffffffffff, 0x0, x2, 32, x3)

    

    RVTEST_SIGBASE(x3,signature_60_0)


inst_295:
    // Test 295:  Test with marching zeros/ones
    // result rd:x31(0xffffffffffffffff), rs1:x1(0x7fffffffffffffff), rs2:x2(0x0000000000000000)
    TEST_RR_OP(sraw, x31, x1, x2, 0xffffffffffffffff, 0x7fffffffffffffff, 0x0, x3, 0, x4)

inst_296:
    // Test 296:  Test with rs1 == rs2
    // result rd:x11(0x0000000000002669), rs1:x9(0x7d534f96f1444f34), rs2:x9(0x32170fe5099a4f8e)
    TEST_RR_OP(sraw, x11, x9, x9, 0x0000000000002669, 0x7d534f96f1444f34, 0x32170fe5099a4f8e, x3, 8, x4)

inst_297:
    // Test 297:  Test with rd == x0
    // result rd:x0(0x0000000000000000), rs1:x7(0x75dd10cf68ce0f63), rs2:x13(0xa24a46cb3277cf6a)
    TEST_RR_OP(sraw, x0, x7, x13, 0x0000000000000000, 0x75dd10cf68ce0f63, 0xa24a46cb3277cf6a, x3, 16, x4)

inst_298:
    // Test 298:  Test with rs1 == x0
    // result rd:x7(0x0000000000000000), rs1:x0(0x7bf168c97a8b59c1), rs2:x13(0x793d8d85dce388e8)
    TEST_RR_OP(sraw, x7, x0, x13, 0x0000000000000000, 0x7bf168c97a8b59c1, 0x793d8d85dce388e8, x3, 24, x4)

inst_299:
    // Test 299:  Test with rs2 == x0
    // result rd:x24(0x0000000027eb62aa), rs1:x12(0xc931d57927eb62aa), rs2:x0(0x06d7e3ee2c7809b8)
    TEST_RR_OP(sraw, x24, x12, x0, 0x0000000027eb62aa, 0xc931d57927eb62aa, 0x6d7e3ee2c7809b8, x3, 32, x4)
	
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

