// RISC-V Architectural Validation Test ADDI-01
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
// Description: Testing instruction 'ADDI'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1

    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",addi)

    RVTEST_SIGBASE(x1,signature_1_0)


inst_0:
    // Test 0:  Test with random values and registers (non-overlapping)
    // result rd:x19(0x54f4aeeb1519ff16), rs1:x28(0x54f4aeeb151a01ef), imm:0xd27
    TEST_IMM_OP(addi, x19, x28, 0x54f4aeeb1519ff16, 0x54f4aeeb151a01ef, 0xd27, x1, 0, x2)

inst_1:
    // Test 1:  Test with random values and registers (non-overlapping)
    // result rd:x30(0xe1b1199b429ed88e), rs1:x20(0xe1b1199b429ede3d), imm:0xa51
    TEST_IMM_OP(addi, x30, x20, 0xe1b1199b429ed88e, 0xe1b1199b429ede3d, 0xa51, x1, 8, x2)

inst_2:
    // Test 2:  Test with random values and registers (non-overlapping)
    // result rd:x10(0xfffffffffffffc65), rs1:x0(0xb26566a091a8d5fd), imm:0xc65
    TEST_IMM_OP(addi, x10, x0, 0xfffffffffffffc65, 0xb26566a091a8d5fd, 0xc65, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_2_0)


inst_3:
    // Test 3:  Test with random values and registers (non-overlapping)
    // result rd:x3(0xf27008e604661f73), rs1:x31(0xf27008e60466250f), imm:0xa64
    TEST_IMM_OP(addi, x3, x31, 0xf27008e604661f73, 0xf27008e60466250f, 0xa64, x1, 0, x2)

inst_4:
    // Test 4:  Test with random values and registers (non-overlapping)
    // result rd:x29(0x0c8484a3c737a958), rs1:x5(0x0c8484a3c737ad3a), imm:0xc1e
    TEST_IMM_OP(addi, x29, x5, 0x0c8484a3c737a958, 0xc8484a3c737ad3a, 0xc1e, x1, 8, x2)

inst_5:
    // Test 5:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x13(0xa783d03f7ca660db), imm:0xadf
    TEST_IMM_OP(addi, x0, x13, 0x0000000000000000, 0xa783d03f7ca660db, 0xadf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_3_0)


inst_6:
    // Test 6:  Test with random values and registers (non-overlapping)
    // result rd:x4(0xfd7b9df82c63c32e), rs1:x11(0xfd7b9df82c63c847), imm:0xae7
    TEST_IMM_OP(addi, x4, x11, 0xfd7b9df82c63c32e, 0xfd7b9df82c63c847, 0xae7, x1, 0, x3)

inst_7:
    // Test 7:  Test with random values and registers (non-overlapping)
    // result rd:x25(0x0afaa29d195b6690), rs1:x2(0x0afaa29d195b62bf), imm:0x3d1
    TEST_IMM_OP(addi, x25, x2, 0x0afaa29d195b6690, 0xafaa29d195b62bf, 0x3d1, x1, 8, x3)

inst_8:
    // Test 8:  Test with random values and registers (non-overlapping)
    // result rd:x18(0x413f2c6234b80fc8), rs1:x7(0x413f2c6234b80fd4), imm:0xff4
    TEST_IMM_OP(addi, x18, x7, 0x413f2c6234b80fc8, 0x413f2c6234b80fd4, 0xff4, x1, 16, x3)

    

    RVTEST_SIGBASE(x1,signature_4_0)


inst_9:
    // Test 9:  Test with random values and registers (non-overlapping)
    // result rd:x9(0x2c370a9a34267f99), rs1:x31(0x2c370a9a34267ad9), imm:0x4c0
    TEST_IMM_OP(addi, x9, x31, 0x2c370a9a34267f99, 0x2c370a9a34267ad9, 0x4c0, x1, 0, x2)

inst_10:
    // Test 10:  Test with random values and registers (non-overlapping)
    // result rd:x17(0x2882a0b367dd3ad0), rs1:x23(0x2882a0b367dd3492), imm:0x63e
    TEST_IMM_OP(addi, x17, x23, 0x2882a0b367dd3ad0, 0x2882a0b367dd3492, 0x63e, x1, 8, x2)

inst_11:
    // Test 11:  Test with random values and registers (non-overlapping)
    // result rd:x31(0x91dd5ad6b2d3eb73), rs1:x21(0x91dd5ad6b2d3f1c5), imm:0x9ae
    TEST_IMM_OP(addi, x31, x21, 0x91dd5ad6b2d3eb73, 0x91dd5ad6b2d3f1c5, 0x9ae, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_5_0)


inst_12:
    // Test 12:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x30(0x42f1d6295233a4dd), imm:0x650
    TEST_IMM_OP(addi, x0, x30, 0x0000000000000000, 0x42f1d6295233a4dd, 0x650, x1, 0, x2)

inst_13:
    // Test 13:  Test with random values and registers (non-overlapping)
    // result rd:x0(0x0000000000000000), rs1:x17(0xcddbdf6f18fc88d5), imm:0x71
    TEST_IMM_OP(addi, x0, x17, 0x0000000000000000, 0xcddbdf6f18fc88d5, 0x71, x1, 8, x2)

inst_14:
    // Test 14:  Test with random values and registers (non-overlapping)
    // result rd:x31(0x4d236af8c83b3a08), rs1:x6(0x4d236af8c83b3c30), imm:0xdd8
    TEST_IMM_OP(addi, x31, x6, 0x4d236af8c83b3a08, 0x4d236af8c83b3c30, 0xdd8, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_6_0)


inst_15:
    // Test 15:  Test with random values and registers (non-overlapping)
    // result rd:x11(0x983b9f63a968a4ec), rs1:x22(0x983b9f63a968a97f), imm:0xb6d
    TEST_IMM_OP(addi, x11, x22, 0x983b9f63a968a4ec, 0x983b9f63a968a97f, 0xb6d, x1, 0, x3)

inst_16:
    // Test 16:  Test with random values and registers (non-overlapping)
    // result rd:x9(0x1fbe3ca65b08602c), rs1:x2(0x1fbe3ca65b086787), imm:0x8a5
    TEST_IMM_OP(addi, x9, x2, 0x1fbe3ca65b08602c, 0x1fbe3ca65b086787, 0x8a5, x1, 8, x3)

inst_17:
    // Test 17:  Test with random values and registers (non-overlapping)
    // result rd:x7(0x353a85936075c7c3), rs1:x13(0x353a85936075c1a2), imm:0x621
    TEST_IMM_OP(addi, x7, x13, 0x353a85936075c7c3, 0x353a85936075c1a2, 0x621, x1, 16, x3)

    

    RVTEST_SIGBASE(x1,signature_7_0)


inst_18:
    // Test 18:  Test with random values and registers (non-overlapping)
    // result rd:x7(0x66268a1a4ff08f20), rs1:x3(0x66268a1a4ff09378), imm:0xba8
    TEST_IMM_OP(addi, x7, x3, 0x66268a1a4ff08f20, 0x66268a1a4ff09378, 0xba8, x1, 0, x2)

inst_19:
    // Test 19:  Test with random values and registers (non-overlapping)
    // result rd:x13(0x28ac54a3b32a446d), rs1:x24(0x28ac54a3b32a4c52), imm:0x81b
    TEST_IMM_OP(addi, x13, x24, 0x28ac54a3b32a446d, 0x28ac54a3b32a4c52, 0x81b, x1, 8, x2)

inst_20:
    // Test 20:  Test with random values and registers (non-overlapping)
    // result rd:x12(0xdc3713a217a2f8a6), rs1:x3(0xdc3713a217a2fb1a), imm:0xd8c
    TEST_IMM_OP(addi, x12, x3, 0xdc3713a217a2f8a6, 0xdc3713a217a2fb1a, 0xd8c, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_8_0)


inst_21:
    // Test 21:  Test with random values and registers (non-overlapping)
    // result rd:x17(0x74674399484604ab), rs1:x14(0x74674399484605f6), imm:0xeb5
    TEST_IMM_OP(addi, x17, x14, 0x74674399484604ab, 0x74674399484605f6, 0xeb5, x1, 0, x2)

inst_22:
    // Test 22:  Test with random values and registers (non-overlapping)
    // result rd:x31(0x6bdd9821fc9d8193), rs1:x20(0x6bdd9821fc9d848f), imm:0xd04
    TEST_IMM_OP(addi, x31, x20, 0x6bdd9821fc9d8193, 0x6bdd9821fc9d848f, 0xd04, x1, 8, x2)

inst_23:
    // Test 23:  Test with random values and registers (non-overlapping)
    // result rd:x18(0x825648e49b1a86c8), rs1:x4(0x825648e49b1a8042), imm:0x686
    TEST_IMM_OP(addi, x18, x4, 0x825648e49b1a86c8, 0x825648e49b1a8042, 0x686, x1, 16, x2)

    

    RVTEST_SIGBASE(x2,signature_9_0)


inst_24:
    // Test 24:  Test with random values and registers (non-overlapping)
    // result rd:x29(0x7bf4ef1c426b8727), rs1:x30(0x7bf4ef1c426b8dfb), imm:0x92c
    TEST_IMM_OP(addi, x29, x30, 0x7bf4ef1c426b8727, 0x7bf4ef1c426b8dfb, 0x92c, x2, 0, x4)

inst_25:
    // Test 25:  Test with random values and registers (non-overlapping)
    // result rd:x17(0x0f49a4b2f6323ea8), rs1:x1(0x0f49a4b2f6323d52), imm:0x156
    TEST_IMM_OP(addi, x17, x1, 0x0f49a4b2f6323ea8, 0xf49a4b2f6323d52, 0x156, x2, 8, x4)

inst_26:
    // Test 26:  Test with random values and registers (non-overlapping)
    // result rd:x22(0xfe9b8abf4bfb0211), rs1:x3(0xfe9b8abf4bfb003d), imm:0x1d4
    TEST_IMM_OP(addi, x22, x3, 0xfe9b8abf4bfb0211, 0xfe9b8abf4bfb003d, 0x1d4, x2, 16, x4)

    

    RVTEST_SIGBASE(x1,signature_10_0)


inst_27:
    // Test 27:  Test with random values and registers (non-overlapping)
    // result rd:x3(0x347ebc89f22b6afc), rs1:x19(0x347ebc89f22b6484), imm:0x678
    TEST_IMM_OP(addi, x3, x19, 0x347ebc89f22b6afc, 0x347ebc89f22b6484, 0x678, x1, 0, x2)

inst_28:
    // Test 28:  Test with random values and registers (non-overlapping)
    // result rd:x15(0xf52a52bf0cc9d4a4), rs1:x13(0xf52a52bf0cc9d6c8), imm:0xddc
    TEST_IMM_OP(addi, x15, x13, 0xf52a52bf0cc9d4a4, 0xf52a52bf0cc9d6c8, 0xddc, x1, 8, x2)

inst_29:
    // Test 29:  Test with random values and registers (non-overlapping)
    // result rd:x28(0xcaa4b80e169dc21a), rs1:x6(0xcaa4b80e169dbce8), imm:0x532
    TEST_IMM_OP(addi, x28, x6, 0xcaa4b80e169dc21a, 0xcaa4b80e169dbce8, 0x532, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_11_0)


inst_30:
    // Test 30:  Test with min, max, and other significant values
    // result rd:x14(0xffffffffffffffff), rs1:x6(0xffffffffffffffff), imm:0x0
    TEST_IMM_OP(addi, x14, x6, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x1, 0, x2)

inst_31:
    // Test 31:  Test with min, max, and other significant values
    // result rd:x9(0x7fffffffffffffff), rs1:x17(0x8000000000000000), imm:0xfff
    TEST_IMM_OP(addi, x9, x17, 0x7fffffffffffffff, 0x8000000000000000, 0xfff, x1, 8, x2)

inst_32:
    // Test 32:  Test with min, max, and other significant values
    // result rd:x10(0xfffffffffffffffe), rs1:x14(0xffffffffffffffff), imm:0xfff
    TEST_IMM_OP(addi, x10, x14, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_12_0)


inst_33:
    // Test 33:  Test with min, max, and other significant values
    // result rd:x6(0x0000000000000000), rs1:x22(0x0000000000000001), imm:0xfff
    TEST_IMM_OP(addi, x6, x22, 0x0000000000000000, 0x1, 0xfff, x1, 0, x2)

inst_34:
    // Test 34:  Test with min, max, and other significant values
    // result rd:x0(0x0000000000000000), rs1:x19(0xffffffffffffffff), imm:0x0
    TEST_IMM_OP(addi, x0, x19, 0x0000000000000000, 0xffffffffffffffff, 0x0, x1, 8, x2)

inst_35:
    // Test 35:  Test with min, max, and other significant values
    // result rd:x28(0x7fffffffffffffff), rs1:x19(0x8000000000000000), imm:0xfff
    TEST_IMM_OP(addi, x28, x19, 0x7fffffffffffffff, 0x8000000000000000, 0xfff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_13_0)


inst_36:
    // Test 36:  Test with min, max, and other significant values
    // result rd:x31(0xfffffffffffffffe), rs1:x30(0xffffffffffffffff), imm:0xfff
    TEST_IMM_OP(addi, x31, x30, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfff, x1, 0, x2)

inst_37:
    // Test 37:  Test with min, max, and other significant values
    // result rd:x27(0x0000000000000000), rs1:x21(0x0000000000000001), imm:0xfff
    TEST_IMM_OP(addi, x27, x21, 0x0000000000000000, 0x1, 0xfff, x1, 8, x2)

inst_38:
    // Test 38:  Test with min, max, and other significant values
    // result rd:x23(0xffffffffffffffff), rs1:x16(0xffffffffffffffff), imm:0x0
    TEST_IMM_OP(addi, x23, x16, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_14_0)


inst_39:
    // Test 39:  Test with min, max, and other significant values
    // result rd:x24(0x7fffffffffffffff), rs1:x28(0x8000000000000000), imm:0xfff
    TEST_IMM_OP(addi, x24, x28, 0x7fffffffffffffff, 0x8000000000000000, 0xfff, x3, 0, x4)

inst_40:
    // Test 40:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000002), rs1:x2(0x0000000000000001), imm:0x1
    TEST_IMM_OP(addi, x1, x2, 0x0000000000000002, 0x1, 0x1, x3, 8, x4)

inst_41:
    // Test 41:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000004), rs1:x2(0x0000000000000002), imm:0x2
    TEST_IMM_OP(addi, x1, x2, 0x0000000000000004, 0x2, 0x2, x3, 16, x4)

    

    RVTEST_SIGBASE(x1,signature_15_0)


inst_42:
    // Test 42:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000008), rs1:x3(0x0000000000000004), imm:0x4
    TEST_IMM_OP(addi, x2, x3, 0x0000000000000008, 0x4, 0x4, x1, 0, x6)

inst_43:
    // Test 43:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000010), rs1:x4(0x0000000000000008), imm:0x8
    TEST_IMM_OP(addi, x3, x4, 0x0000000000000010, 0x8, 0x8, x1, 8, x6)

inst_44:
    // Test 44:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000020), rs1:x5(0x0000000000000010), imm:0x10
    TEST_IMM_OP(addi, x4, x5, 0x0000000000000020, 0x10, 0x10, x1, 16, x6)

    

    RVTEST_SIGBASE(x1,signature_16_0)


inst_45:
    // Test 45:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000040), rs1:x6(0x0000000000000020), imm:0x20
    TEST_IMM_OP(addi, x5, x6, 0x0000000000000040, 0x20, 0x20, x1, 0, x2)

inst_46:
    // Test 46:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000080), rs1:x7(0x0000000000000040), imm:0x40
    TEST_IMM_OP(addi, x6, x7, 0x0000000000000080, 0x40, 0x40, x1, 8, x2)

inst_47:
    // Test 47:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000100), rs1:x8(0x0000000000000080), imm:0x80
    TEST_IMM_OP(addi, x7, x8, 0x0000000000000100, 0x80, 0x80, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_17_0)


inst_48:
    // Test 48:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000200), rs1:x9(0x0000000000000100), imm:0x100
    TEST_IMM_OP(addi, x8, x9, 0x0000000000000200, 0x100, 0x100, x1, 0, x2)

inst_49:
    // Test 49:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000400), rs1:x10(0x0000000000000200), imm:0x200
    TEST_IMM_OP(addi, x9, x10, 0x0000000000000400, 0x200, 0x200, x1, 8, x2)

inst_50:
    // Test 50:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000800), rs1:x11(0x0000000000000400), imm:0x400
    TEST_IMM_OP(addi, x10, x11, 0x0000000000000800, 0x400, 0x400, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_18_0)


inst_51:
    // Test 51:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000000), rs1:x12(0x0000000000000800), imm:0x800
    TEST_IMM_OP(addi, x11, x12, 0x0000000000000000, 0x800, 0x800, x1, 0, x2)

inst_52:
    // Test 52:  Test with marching zeros/ones
    // result rd:x12(0x0000000000000ffe), rs1:x13(0x0000000000001000), imm:0xffe
    TEST_IMM_OP(addi, x12, x13, 0x0000000000000ffe, 0x1000, 0xffe, x1, 8, x2)

inst_53:
    // Test 53:  Test with marching zeros/ones
    // result rd:x13(0x0000000000001ffd), rs1:x14(0x0000000000002000), imm:0xffd
    TEST_IMM_OP(addi, x13, x14, 0x0000000000001ffd, 0x2000, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_19_0)


inst_54:
    // Test 54:  Test with marching zeros/ones
    // result rd:x14(0x0000000000003ffb), rs1:x15(0x0000000000004000), imm:0xffb
    TEST_IMM_OP(addi, x14, x15, 0x0000000000003ffb, 0x4000, 0xffb, x1, 0, x2)

inst_55:
    // Test 55:  Test with marching zeros/ones
    // result rd:x15(0x0000000000007ff7), rs1:x16(0x0000000000008000), imm:0xff7
    TEST_IMM_OP(addi, x15, x16, 0x0000000000007ff7, 0x8000, 0xff7, x1, 8, x2)

inst_56:
    // Test 56:  Test with marching zeros/ones
    // result rd:x16(0x000000000000ffef), rs1:x17(0x0000000000010000), imm:0xfef
    TEST_IMM_OP(addi, x16, x17, 0x000000000000ffef, 0x10000, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_20_0)


inst_57:
    // Test 57:  Test with marching zeros/ones
    // result rd:x17(0x000000000001ffdf), rs1:x18(0x0000000000020000), imm:0xfdf
    TEST_IMM_OP(addi, x17, x18, 0x000000000001ffdf, 0x20000, 0xfdf, x1, 0, x2)

inst_58:
    // Test 58:  Test with marching zeros/ones
    // result rd:x18(0x000000000003ffbf), rs1:x19(0x0000000000040000), imm:0xfbf
    TEST_IMM_OP(addi, x18, x19, 0x000000000003ffbf, 0x40000, 0xfbf, x1, 8, x2)

inst_59:
    // Test 59:  Test with marching zeros/ones
    // result rd:x19(0x000000000007ff7f), rs1:x20(0x0000000000080000), imm:0xf7f
    TEST_IMM_OP(addi, x19, x20, 0x000000000007ff7f, 0x80000, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_21_0)


inst_60:
    // Test 60:  Test with marching zeros/ones
    // result rd:x20(0x00000000000ffeff), rs1:x21(0x0000000000100000), imm:0xeff
    TEST_IMM_OP(addi, x20, x21, 0x00000000000ffeff, 0x100000, 0xeff, x1, 0, x2)

inst_61:
    // Test 61:  Test with marching zeros/ones
    // result rd:x21(0x00000000001ffdff), rs1:x22(0x0000000000200000), imm:0xdff
    TEST_IMM_OP(addi, x21, x22, 0x00000000001ffdff, 0x200000, 0xdff, x1, 8, x2)

inst_62:
    // Test 62:  Test with marching zeros/ones
    // result rd:x22(0x00000000003ffbff), rs1:x23(0x0000000000400000), imm:0xbff
    TEST_IMM_OP(addi, x22, x23, 0x00000000003ffbff, 0x400000, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_22_0)


inst_63:
    // Test 63:  Test with marching zeros/ones
    // result rd:x23(0x00000000008007ff), rs1:x24(0x0000000000800000), imm:0x7ff
    TEST_IMM_OP(addi, x23, x24, 0x00000000008007ff, 0x800000, 0x7ff, x1, 0, x2)

inst_64:
    // Test 64:  Test with marching zeros/ones
    // result rd:x24(0x0000000000fffffe), rs1:x25(0x0000000001000000), imm:0xffe
    TEST_IMM_OP(addi, x24, x25, 0x0000000000fffffe, 0x1000000, 0xffe, x1, 8, x2)

inst_65:
    // Test 65:  Test with marching zeros/ones
    // result rd:x25(0x0000000001fffffd), rs1:x26(0x0000000002000000), imm:0xffd
    TEST_IMM_OP(addi, x25, x26, 0x0000000001fffffd, 0x2000000, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_23_0)


inst_66:
    // Test 66:  Test with marching zeros/ones
    // result rd:x26(0x0000000003fffffb), rs1:x27(0x0000000004000000), imm:0xffb
    TEST_IMM_OP(addi, x26, x27, 0x0000000003fffffb, 0x4000000, 0xffb, x1, 0, x2)

inst_67:
    // Test 67:  Test with marching zeros/ones
    // result rd:x27(0x0000000007fffff7), rs1:x28(0x0000000008000000), imm:0xff7
    TEST_IMM_OP(addi, x27, x28, 0x0000000007fffff7, 0x8000000, 0xff7, x1, 8, x2)

inst_68:
    // Test 68:  Test with marching zeros/ones
    // result rd:x28(0x000000000fffffef), rs1:x29(0x0000000010000000), imm:0xfef
    TEST_IMM_OP(addi, x28, x29, 0x000000000fffffef, 0x10000000, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x2,signature_24_0)


inst_69:
    // Test 69:  Test with marching zeros/ones
    // result rd:x29(0x000000001fffffdf), rs1:x30(0x0000000020000000), imm:0xfdf
    TEST_IMM_OP(addi, x29, x30, 0x000000001fffffdf, 0x20000000, 0xfdf, x2, 0, x3)

inst_70:
    // Test 70:  Test with marching zeros/ones
    // result rd:x30(0x000000003fffffbf), rs1:x31(0x0000000040000000), imm:0xfbf
    TEST_IMM_OP(addi, x30, x31, 0x000000003fffffbf, 0x40000000, 0xfbf, x2, 8, x3)

inst_71:
    // Test 71:  Test with marching zeros/ones
    // result rd:x31(0x000000007fffff7f), rs1:x1(0x0000000080000000), imm:0xf7f
    TEST_IMM_OP(addi, x31, x1, 0x000000007fffff7f, 0x80000000, 0xf7f, x2, 16, x3)

    

    RVTEST_SIGBASE(x4,signature_25_0)


inst_72:
    // Test 72:  Test with marching zeros/ones
    // result rd:x1(0x00000000fffffeff), rs1:x2(0x0000000100000000), imm:0xeff
    TEST_IMM_OP(addi, x1, x2, 0x00000000fffffeff, 0x100000000, 0xeff, x4, 0, x5)

inst_73:
    // Test 73:  Test with marching zeros/ones
    // result rd:x1(0x00000001fffffdff), rs1:x2(0x0000000200000000), imm:0xdff
    TEST_IMM_OP(addi, x1, x2, 0x00000001fffffdff, 0x200000000, 0xdff, x4, 8, x5)

inst_74:
    // Test 74:  Test with marching zeros/ones
    // result rd:x2(0x00000003fffffbff), rs1:x3(0x0000000400000000), imm:0xbff
    TEST_IMM_OP(addi, x2, x3, 0x00000003fffffbff, 0x400000000, 0xbff, x4, 16, x5)

    

    RVTEST_SIGBASE(x1,signature_26_0)


inst_75:
    // Test 75:  Test with marching zeros/ones
    // result rd:x3(0x00000008000007ff), rs1:x4(0x0000000800000000), imm:0x7ff
    TEST_IMM_OP(addi, x3, x4, 0x00000008000007ff, 0x800000000, 0x7ff, x1, 0, x2)

inst_76:
    // Test 76:  Test with marching zeros/ones
    // result rd:x4(0x0000000ffffffffe), rs1:x5(0x0000001000000000), imm:0xffe
    TEST_IMM_OP(addi, x4, x5, 0x0000000ffffffffe, 0x1000000000, 0xffe, x1, 8, x2)

inst_77:
    // Test 77:  Test with marching zeros/ones
    // result rd:x5(0x0000001ffffffffd), rs1:x6(0x0000002000000000), imm:0xffd
    TEST_IMM_OP(addi, x5, x6, 0x0000001ffffffffd, 0x2000000000, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_27_0)


inst_78:
    // Test 78:  Test with marching zeros/ones
    // result rd:x6(0x0000003ffffffffb), rs1:x7(0x0000004000000000), imm:0xffb
    TEST_IMM_OP(addi, x6, x7, 0x0000003ffffffffb, 0x4000000000, 0xffb, x1, 0, x2)

inst_79:
    // Test 79:  Test with marching zeros/ones
    // result rd:x7(0x0000007ffffffff7), rs1:x8(0x0000008000000000), imm:0xff7
    TEST_IMM_OP(addi, x7, x8, 0x0000007ffffffff7, 0x8000000000, 0xff7, x1, 8, x2)

inst_80:
    // Test 80:  Test with marching zeros/ones
    // result rd:x8(0x000000ffffffffef), rs1:x9(0x0000010000000000), imm:0xfef
    TEST_IMM_OP(addi, x8, x9, 0x000000ffffffffef, 0x10000000000, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_28_0)


inst_81:
    // Test 81:  Test with marching zeros/ones
    // result rd:x9(0x000001ffffffffdf), rs1:x10(0x0000020000000000), imm:0xfdf
    TEST_IMM_OP(addi, x9, x10, 0x000001ffffffffdf, 0x20000000000, 0xfdf, x1, 0, x2)

inst_82:
    // Test 82:  Test with marching zeros/ones
    // result rd:x10(0x000003ffffffffbf), rs1:x11(0x0000040000000000), imm:0xfbf
    TEST_IMM_OP(addi, x10, x11, 0x000003ffffffffbf, 0x40000000000, 0xfbf, x1, 8, x2)

inst_83:
    // Test 83:  Test with marching zeros/ones
    // result rd:x11(0x000007ffffffff7f), rs1:x12(0x0000080000000000), imm:0xf7f
    TEST_IMM_OP(addi, x11, x12, 0x000007ffffffff7f, 0x80000000000, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_29_0)


inst_84:
    // Test 84:  Test with marching zeros/ones
    // result rd:x12(0x00000ffffffffeff), rs1:x13(0x0000100000000000), imm:0xeff
    TEST_IMM_OP(addi, x12, x13, 0x00000ffffffffeff, 0x100000000000, 0xeff, x1, 0, x2)

inst_85:
    // Test 85:  Test with marching zeros/ones
    // result rd:x13(0x00001ffffffffdff), rs1:x14(0x0000200000000000), imm:0xdff
    TEST_IMM_OP(addi, x13, x14, 0x00001ffffffffdff, 0x200000000000, 0xdff, x1, 8, x2)

inst_86:
    // Test 86:  Test with marching zeros/ones
    // result rd:x14(0x00003ffffffffbff), rs1:x15(0x0000400000000000), imm:0xbff
    TEST_IMM_OP(addi, x14, x15, 0x00003ffffffffbff, 0x400000000000, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_30_0)


inst_87:
    // Test 87:  Test with marching zeros/ones
    // result rd:x15(0x00008000000007ff), rs1:x16(0x0000800000000000), imm:0x7ff
    TEST_IMM_OP(addi, x15, x16, 0x00008000000007ff, 0x800000000000, 0x7ff, x1, 0, x2)

inst_88:
    // Test 88:  Test with marching zeros/ones
    // result rd:x16(0x0000fffffffffffe), rs1:x17(0x0001000000000000), imm:0xffe
    TEST_IMM_OP(addi, x16, x17, 0x0000fffffffffffe, 0x1000000000000, 0xffe, x1, 8, x2)

inst_89:
    // Test 89:  Test with marching zeros/ones
    // result rd:x17(0x0001fffffffffffd), rs1:x18(0x0002000000000000), imm:0xffd
    TEST_IMM_OP(addi, x17, x18, 0x0001fffffffffffd, 0x2000000000000, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_31_0)


inst_90:
    // Test 90:  Test with marching zeros/ones
    // result rd:x18(0x0003fffffffffffb), rs1:x19(0x0004000000000000), imm:0xffb
    TEST_IMM_OP(addi, x18, x19, 0x0003fffffffffffb, 0x4000000000000, 0xffb, x1, 0, x2)

inst_91:
    // Test 91:  Test with marching zeros/ones
    // result rd:x19(0x0007fffffffffff7), rs1:x20(0x0008000000000000), imm:0xff7
    TEST_IMM_OP(addi, x19, x20, 0x0007fffffffffff7, 0x8000000000000, 0xff7, x1, 8, x2)

inst_92:
    // Test 92:  Test with marching zeros/ones
    // result rd:x20(0x000fffffffffffef), rs1:x21(0x0010000000000000), imm:0xfef
    TEST_IMM_OP(addi, x20, x21, 0x000fffffffffffef, 0x10000000000000, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_32_0)


inst_93:
    // Test 93:  Test with marching zeros/ones
    // result rd:x21(0x001fffffffffffdf), rs1:x22(0x0020000000000000), imm:0xfdf
    TEST_IMM_OP(addi, x21, x22, 0x001fffffffffffdf, 0x20000000000000, 0xfdf, x1, 0, x2)

inst_94:
    // Test 94:  Test with marching zeros/ones
    // result rd:x22(0x003fffffffffffbf), rs1:x23(0x0040000000000000), imm:0xfbf
    TEST_IMM_OP(addi, x22, x23, 0x003fffffffffffbf, 0x40000000000000, 0xfbf, x1, 8, x2)

inst_95:
    // Test 95:  Test with marching zeros/ones
    // result rd:x23(0x007fffffffffff7f), rs1:x24(0x0080000000000000), imm:0xf7f
    TEST_IMM_OP(addi, x23, x24, 0x007fffffffffff7f, 0x80000000000000, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_33_0)


inst_96:
    // Test 96:  Test with marching zeros/ones
    // result rd:x24(0x00fffffffffffeff), rs1:x25(0x0100000000000000), imm:0xeff
    TEST_IMM_OP(addi, x24, x25, 0x00fffffffffffeff, 0x100000000000000, 0xeff, x1, 0, x2)

inst_97:
    // Test 97:  Test with marching zeros/ones
    // result rd:x25(0x01fffffffffffdff), rs1:x26(0x0200000000000000), imm:0xdff
    TEST_IMM_OP(addi, x25, x26, 0x01fffffffffffdff, 0x200000000000000, 0xdff, x1, 8, x2)

inst_98:
    // Test 98:  Test with marching zeros/ones
    // result rd:x26(0x03fffffffffffbff), rs1:x27(0x0400000000000000), imm:0xbff
    TEST_IMM_OP(addi, x26, x27, 0x03fffffffffffbff, 0x400000000000000, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_34_0)


inst_99:
    // Test 99:  Test with marching zeros/ones
    // result rd:x27(0x08000000000007ff), rs1:x28(0x0800000000000000), imm:0x7ff
    TEST_IMM_OP(addi, x27, x28, 0x08000000000007ff, 0x800000000000000, 0x7ff, x1, 0, x2)

inst_100:
    // Test 100:  Test with marching zeros/ones
    // result rd:x28(0x0ffffffffffffffe), rs1:x29(0x1000000000000000), imm:0xffe
    TEST_IMM_OP(addi, x28, x29, 0x0ffffffffffffffe, 0x1000000000000000, 0xffe, x1, 8, x2)

inst_101:
    // Test 101:  Test with marching zeros/ones
    // result rd:x29(0x1ffffffffffffffd), rs1:x30(0x2000000000000000), imm:0xffd
    TEST_IMM_OP(addi, x29, x30, 0x1ffffffffffffffd, 0x2000000000000000, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_35_0)


inst_102:
    // Test 102:  Test with marching zeros/ones
    // result rd:x30(0x3ffffffffffffffb), rs1:x31(0x4000000000000000), imm:0xffb
    TEST_IMM_OP(addi, x30, x31, 0x3ffffffffffffffb, 0x4000000000000000, 0xffb, x3, 0, x4)

inst_103:
    // Test 103:  Test with marching zeros/ones
    // result rd:x31(0x7ffffffffffffff7), rs1:x1(0x8000000000000000), imm:0xff7
    TEST_IMM_OP(addi, x31, x1, 0x7ffffffffffffff7, 0x8000000000000000, 0xff7, x3, 8, x4)

inst_104:
    // Test 104:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffed), rs1:x2(0xfffffffffffffffe), imm:0xfef
    TEST_IMM_OP(addi, x1, x2, 0xffffffffffffffed, 0xfffffffffffffffe, 0xfef, x3, 16, x4)

    

    RVTEST_SIGBASE(x5,signature_36_0)


inst_105:
    // Test 105:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffdc), rs1:x2(0xfffffffffffffffd), imm:0xfdf
    TEST_IMM_OP(addi, x1, x2, 0xffffffffffffffdc, 0xfffffffffffffffd, 0xfdf, x5, 0, x6)

inst_106:
    // Test 106:  Test with marching zeros/ones
    // result rd:x2(0xffffffffffffffba), rs1:x3(0xfffffffffffffffb), imm:0xfbf
    TEST_IMM_OP(addi, x2, x3, 0xffffffffffffffba, 0xfffffffffffffffb, 0xfbf, x5, 8, x6)

inst_107:
    // Test 107:  Test with marching zeros/ones
    // result rd:x3(0xffffffffffffff76), rs1:x4(0xfffffffffffffff7), imm:0xf7f
    TEST_IMM_OP(addi, x3, x4, 0xffffffffffffff76, 0xfffffffffffffff7, 0xf7f, x5, 16, x6)

    

    RVTEST_SIGBASE(x1,signature_37_0)


inst_108:
    // Test 108:  Test with marching zeros/ones
    // result rd:x4(0xfffffffffffffeee), rs1:x5(0xffffffffffffffef), imm:0xeff
    TEST_IMM_OP(addi, x4, x5, 0xfffffffffffffeee, 0xffffffffffffffef, 0xeff, x1, 0, x2)

inst_109:
    // Test 109:  Test with marching zeros/ones
    // result rd:x5(0xfffffffffffffdde), rs1:x6(0xffffffffffffffdf), imm:0xdff
    TEST_IMM_OP(addi, x5, x6, 0xfffffffffffffdde, 0xffffffffffffffdf, 0xdff, x1, 8, x2)

inst_110:
    // Test 110:  Test with marching zeros/ones
    // result rd:x6(0xfffffffffffffbbe), rs1:x7(0xffffffffffffffbf), imm:0xbff
    TEST_IMM_OP(addi, x6, x7, 0xfffffffffffffbbe, 0xffffffffffffffbf, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_38_0)


inst_111:
    // Test 111:  Test with marching zeros/ones
    // result rd:x7(0x000000000000077e), rs1:x8(0xffffffffffffff7f), imm:0x7ff
    TEST_IMM_OP(addi, x7, x8, 0x000000000000077e, 0xffffffffffffff7f, 0x7ff, x1, 0, x2)

inst_112:
    // Test 112:  Test with marching zeros/ones
    // result rd:x8(0xfffffffffffffefd), rs1:x9(0xfffffffffffffeff), imm:0xffe
    TEST_IMM_OP(addi, x8, x9, 0xfffffffffffffefd, 0xfffffffffffffeff, 0xffe, x1, 8, x2)

inst_113:
    // Test 113:  Test with marching zeros/ones
    // result rd:x9(0xfffffffffffffdfc), rs1:x10(0xfffffffffffffdff), imm:0xffd
    TEST_IMM_OP(addi, x9, x10, 0xfffffffffffffdfc, 0xfffffffffffffdff, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_39_0)


inst_114:
    // Test 114:  Test with marching zeros/ones
    // result rd:x10(0xfffffffffffffbfa), rs1:x11(0xfffffffffffffbff), imm:0xffb
    TEST_IMM_OP(addi, x10, x11, 0xfffffffffffffbfa, 0xfffffffffffffbff, 0xffb, x1, 0, x2)

inst_115:
    // Test 115:  Test with marching zeros/ones
    // result rd:x11(0xfffffffffffff7f6), rs1:x12(0xfffffffffffff7ff), imm:0xff7
    TEST_IMM_OP(addi, x11, x12, 0xfffffffffffff7f6, 0xfffffffffffff7ff, 0xff7, x1, 8, x2)

inst_116:
    // Test 116:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffefee), rs1:x13(0xffffffffffffefff), imm:0xfef
    TEST_IMM_OP(addi, x12, x13, 0xffffffffffffefee, 0xffffffffffffefff, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_40_0)


inst_117:
    // Test 117:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffdfde), rs1:x14(0xffffffffffffdfff), imm:0xfdf
    TEST_IMM_OP(addi, x13, x14, 0xffffffffffffdfde, 0xffffffffffffdfff, 0xfdf, x1, 0, x2)

inst_118:
    // Test 118:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffbfbe), rs1:x15(0xffffffffffffbfff), imm:0xfbf
    TEST_IMM_OP(addi, x14, x15, 0xffffffffffffbfbe, 0xffffffffffffbfff, 0xfbf, x1, 8, x2)

inst_119:
    // Test 119:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffff7f7e), rs1:x16(0xffffffffffff7fff), imm:0xf7f
    TEST_IMM_OP(addi, x15, x16, 0xffffffffffff7f7e, 0xffffffffffff7fff, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_41_0)


inst_120:
    // Test 120:  Test with marching zeros/ones
    // result rd:x16(0xfffffffffffefefe), rs1:x17(0xfffffffffffeffff), imm:0xeff
    TEST_IMM_OP(addi, x16, x17, 0xfffffffffffefefe, 0xfffffffffffeffff, 0xeff, x1, 0, x2)

inst_121:
    // Test 121:  Test with marching zeros/ones
    // result rd:x17(0xfffffffffffdfdfe), rs1:x18(0xfffffffffffdffff), imm:0xdff
    TEST_IMM_OP(addi, x17, x18, 0xfffffffffffdfdfe, 0xfffffffffffdffff, 0xdff, x1, 8, x2)

inst_122:
    // Test 122:  Test with marching zeros/ones
    // result rd:x18(0xfffffffffffbfbfe), rs1:x19(0xfffffffffffbffff), imm:0xbff
    TEST_IMM_OP(addi, x18, x19, 0xfffffffffffbfbfe, 0xfffffffffffbffff, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_42_0)


inst_123:
    // Test 123:  Test with marching zeros/ones
    // result rd:x19(0xfffffffffff807fe), rs1:x20(0xfffffffffff7ffff), imm:0x7ff
    TEST_IMM_OP(addi, x19, x20, 0xfffffffffff807fe, 0xfffffffffff7ffff, 0x7ff, x1, 0, x2)

inst_124:
    // Test 124:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffeffffd), rs1:x21(0xffffffffffefffff), imm:0xffe
    TEST_IMM_OP(addi, x20, x21, 0xffffffffffeffffd, 0xffffffffffefffff, 0xffe, x1, 8, x2)

inst_125:
    // Test 125:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffdffffc), rs1:x22(0xffffffffffdfffff), imm:0xffd
    TEST_IMM_OP(addi, x21, x22, 0xffffffffffdffffc, 0xffffffffffdfffff, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_43_0)


inst_126:
    // Test 126:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffbffffa), rs1:x23(0xffffffffffbfffff), imm:0xffb
    TEST_IMM_OP(addi, x22, x23, 0xffffffffffbffffa, 0xffffffffffbfffff, 0xffb, x1, 0, x2)

inst_127:
    // Test 127:  Test with marching zeros/ones
    // result rd:x23(0xffffffffff7ffff6), rs1:x24(0xffffffffff7fffff), imm:0xff7
    TEST_IMM_OP(addi, x23, x24, 0xffffffffff7ffff6, 0xffffffffff7fffff, 0xff7, x1, 8, x2)

inst_128:
    // Test 128:  Test with marching zeros/ones
    // result rd:x24(0xfffffffffeffffee), rs1:x25(0xfffffffffeffffff), imm:0xfef
    TEST_IMM_OP(addi, x24, x25, 0xfffffffffeffffee, 0xfffffffffeffffff, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_44_0)


inst_129:
    // Test 129:  Test with marching zeros/ones
    // result rd:x25(0xfffffffffdffffde), rs1:x26(0xfffffffffdffffff), imm:0xfdf
    TEST_IMM_OP(addi, x25, x26, 0xfffffffffdffffde, 0xfffffffffdffffff, 0xfdf, x1, 0, x2)

inst_130:
    // Test 130:  Test with marching zeros/ones
    // result rd:x26(0xfffffffffbffffbe), rs1:x27(0xfffffffffbffffff), imm:0xfbf
    TEST_IMM_OP(addi, x26, x27, 0xfffffffffbffffbe, 0xfffffffffbffffff, 0xfbf, x1, 8, x2)

inst_131:
    // Test 131:  Test with marching zeros/ones
    // result rd:x27(0xfffffffff7ffff7e), rs1:x28(0xfffffffff7ffffff), imm:0xf7f
    TEST_IMM_OP(addi, x27, x28, 0xfffffffff7ffff7e, 0xfffffffff7ffffff, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_45_0)


inst_132:
    // Test 132:  Test with marching zeros/ones
    // result rd:x28(0xffffffffeffffefe), rs1:x29(0xffffffffefffffff), imm:0xeff
    TEST_IMM_OP(addi, x28, x29, 0xffffffffeffffefe, 0xffffffffefffffff, 0xeff, x1, 0, x2)

inst_133:
    // Test 133:  Test with marching zeros/ones
    // result rd:x29(0xffffffffdffffdfe), rs1:x30(0xffffffffdfffffff), imm:0xdff
    TEST_IMM_OP(addi, x29, x30, 0xffffffffdffffdfe, 0xffffffffdfffffff, 0xdff, x1, 8, x2)

inst_134:
    // Test 134:  Test with marching zeros/ones
    // result rd:x30(0xffffffffbffffbfe), rs1:x31(0xffffffffbfffffff), imm:0xbff
    TEST_IMM_OP(addi, x30, x31, 0xffffffffbffffbfe, 0xffffffffbfffffff, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_46_0)


inst_135:
    // Test 135:  Test with marching zeros/ones
    // result rd:x31(0xffffffff800007fe), rs1:x1(0xffffffff7fffffff), imm:0x7ff
    TEST_IMM_OP(addi, x31, x1, 0xffffffff800007fe, 0xffffffff7fffffff, 0x7ff, x3, 0, x4)

inst_136:
    // Test 136:  Test with marching zeros/ones
    // result rd:x1(0xfffffffefffffffd), rs1:x2(0xfffffffeffffffff), imm:0xffe
    TEST_IMM_OP(addi, x1, x2, 0xfffffffefffffffd, 0xfffffffeffffffff, 0xffe, x3, 8, x4)

inst_137:
    // Test 137:  Test with marching zeros/ones
    // result rd:x1(0xfffffffdfffffffc), rs1:x2(0xfffffffdffffffff), imm:0xffd
    TEST_IMM_OP(addi, x1, x2, 0xfffffffdfffffffc, 0xfffffffdffffffff, 0xffd, x3, 16, x4)

    

    RVTEST_SIGBASE(x1,signature_47_0)


inst_138:
    // Test 138:  Test with marching zeros/ones
    // result rd:x2(0xfffffffbfffffffa), rs1:x3(0xfffffffbffffffff), imm:0xffb
    TEST_IMM_OP(addi, x2, x3, 0xfffffffbfffffffa, 0xfffffffbffffffff, 0xffb, x1, 0, x6)

inst_139:
    // Test 139:  Test with marching zeros/ones
    // result rd:x3(0xfffffff7fffffff6), rs1:x4(0xfffffff7ffffffff), imm:0xff7
    TEST_IMM_OP(addi, x3, x4, 0xfffffff7fffffff6, 0xfffffff7ffffffff, 0xff7, x1, 8, x6)

inst_140:
    // Test 140:  Test with marching zeros/ones
    // result rd:x4(0xffffffefffffffee), rs1:x5(0xffffffefffffffff), imm:0xfef
    TEST_IMM_OP(addi, x4, x5, 0xffffffefffffffee, 0xffffffefffffffff, 0xfef, x1, 16, x6)

    

    RVTEST_SIGBASE(x1,signature_48_0)


inst_141:
    // Test 141:  Test with marching zeros/ones
    // result rd:x5(0xffffffdfffffffde), rs1:x6(0xffffffdfffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x5, x6, 0xffffffdfffffffde, 0xffffffdfffffffff, 0xfdf, x1, 0, x2)

inst_142:
    // Test 142:  Test with marching zeros/ones
    // result rd:x6(0xffffffbfffffffbe), rs1:x7(0xffffffbfffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x6, x7, 0xffffffbfffffffbe, 0xffffffbfffffffff, 0xfbf, x1, 8, x2)

inst_143:
    // Test 143:  Test with marching zeros/ones
    // result rd:x7(0xffffff7fffffff7e), rs1:x8(0xffffff7fffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x7, x8, 0xffffff7fffffff7e, 0xffffff7fffffffff, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_49_0)


inst_144:
    // Test 144:  Test with marching zeros/ones
    // result rd:x8(0xfffffefffffffefe), rs1:x9(0xfffffeffffffffff), imm:0xeff
    TEST_IMM_OP(addi, x8, x9, 0xfffffefffffffefe, 0xfffffeffffffffff, 0xeff, x1, 0, x2)

inst_145:
    // Test 145:  Test with marching zeros/ones
    // result rd:x9(0xfffffdfffffffdfe), rs1:x10(0xfffffdffffffffff), imm:0xdff
    TEST_IMM_OP(addi, x9, x10, 0xfffffdfffffffdfe, 0xfffffdffffffffff, 0xdff, x1, 8, x2)

inst_146:
    // Test 146:  Test with marching zeros/ones
    // result rd:x10(0xfffffbfffffffbfe), rs1:x11(0xfffffbffffffffff), imm:0xbff
    TEST_IMM_OP(addi, x10, x11, 0xfffffbfffffffbfe, 0xfffffbffffffffff, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_50_0)


inst_147:
    // Test 147:  Test with marching zeros/ones
    // result rd:x11(0xfffff800000007fe), rs1:x12(0xfffff7ffffffffff), imm:0x7ff
    TEST_IMM_OP(addi, x11, x12, 0xfffff800000007fe, 0xfffff7ffffffffff, 0x7ff, x1, 0, x2)

inst_148:
    // Test 148:  Test with marching zeros/ones
    // result rd:x12(0xffffeffffffffffd), rs1:x13(0xffffefffffffffff), imm:0xffe
    TEST_IMM_OP(addi, x12, x13, 0xffffeffffffffffd, 0xffffefffffffffff, 0xffe, x1, 8, x2)

inst_149:
    // Test 149:  Test with marching zeros/ones
    // result rd:x13(0xffffdffffffffffc), rs1:x14(0xffffdfffffffffff), imm:0xffd
    TEST_IMM_OP(addi, x13, x14, 0xffffdffffffffffc, 0xffffdfffffffffff, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_51_0)


inst_150:
    // Test 150:  Test with marching zeros/ones
    // result rd:x14(0xffffbffffffffffa), rs1:x15(0xffffbfffffffffff), imm:0xffb
    TEST_IMM_OP(addi, x14, x15, 0xffffbffffffffffa, 0xffffbfffffffffff, 0xffb, x1, 0, x2)

inst_151:
    // Test 151:  Test with marching zeros/ones
    // result rd:x15(0xffff7ffffffffff6), rs1:x16(0xffff7fffffffffff), imm:0xff7
    TEST_IMM_OP(addi, x15, x16, 0xffff7ffffffffff6, 0xffff7fffffffffff, 0xff7, x1, 8, x2)

inst_152:
    // Test 152:  Test with marching zeros/ones
    // result rd:x16(0xfffeffffffffffee), rs1:x17(0xfffeffffffffffff), imm:0xfef
    TEST_IMM_OP(addi, x16, x17, 0xfffeffffffffffee, 0xfffeffffffffffff, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_52_0)


inst_153:
    // Test 153:  Test with marching zeros/ones
    // result rd:x17(0xfffdffffffffffde), rs1:x18(0xfffdffffffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x17, x18, 0xfffdffffffffffde, 0xfffdffffffffffff, 0xfdf, x1, 0, x2)

inst_154:
    // Test 154:  Test with marching zeros/ones
    // result rd:x18(0xfffbffffffffffbe), rs1:x19(0xfffbffffffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x18, x19, 0xfffbffffffffffbe, 0xfffbffffffffffff, 0xfbf, x1, 8, x2)

inst_155:
    // Test 155:  Test with marching zeros/ones
    // result rd:x19(0xfff7ffffffffff7e), rs1:x20(0xfff7ffffffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x19, x20, 0xfff7ffffffffff7e, 0xfff7ffffffffffff, 0xf7f, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_53_0)


inst_156:
    // Test 156:  Test with marching zeros/ones
    // result rd:x20(0xffeffffffffffefe), rs1:x21(0xffefffffffffffff), imm:0xeff
    TEST_IMM_OP(addi, x20, x21, 0xffeffffffffffefe, 0xffefffffffffffff, 0xeff, x1, 0, x2)

inst_157:
    // Test 157:  Test with marching zeros/ones
    // result rd:x21(0xffdffffffffffdfe), rs1:x22(0xffdfffffffffffff), imm:0xdff
    TEST_IMM_OP(addi, x21, x22, 0xffdffffffffffdfe, 0xffdfffffffffffff, 0xdff, x1, 8, x2)

inst_158:
    // Test 158:  Test with marching zeros/ones
    // result rd:x22(0xffbffffffffffbfe), rs1:x23(0xffbfffffffffffff), imm:0xbff
    TEST_IMM_OP(addi, x22, x23, 0xffbffffffffffbfe, 0xffbfffffffffffff, 0xbff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_54_0)


inst_159:
    // Test 159:  Test with marching zeros/ones
    // result rd:x23(0xff800000000007fe), rs1:x24(0xff7fffffffffffff), imm:0x7ff
    TEST_IMM_OP(addi, x23, x24, 0xff800000000007fe, 0xff7fffffffffffff, 0x7ff, x1, 0, x2)

inst_160:
    // Test 160:  Test with marching zeros/ones
    // result rd:x24(0xfefffffffffffffd), rs1:x25(0xfeffffffffffffff), imm:0xffe
    TEST_IMM_OP(addi, x24, x25, 0xfefffffffffffffd, 0xfeffffffffffffff, 0xffe, x1, 8, x2)

inst_161:
    // Test 161:  Test with marching zeros/ones
    // result rd:x25(0xfdfffffffffffffc), rs1:x26(0xfdffffffffffffff), imm:0xffd
    TEST_IMM_OP(addi, x25, x26, 0xfdfffffffffffffc, 0xfdffffffffffffff, 0xffd, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_55_0)


inst_162:
    // Test 162:  Test with marching zeros/ones
    // result rd:x26(0xfbfffffffffffffa), rs1:x27(0xfbffffffffffffff), imm:0xffb
    TEST_IMM_OP(addi, x26, x27, 0xfbfffffffffffffa, 0xfbffffffffffffff, 0xffb, x1, 0, x2)

inst_163:
    // Test 163:  Test with marching zeros/ones
    // result rd:x27(0xf7fffffffffffff6), rs1:x28(0xf7ffffffffffffff), imm:0xff7
    TEST_IMM_OP(addi, x27, x28, 0xf7fffffffffffff6, 0xf7ffffffffffffff, 0xff7, x1, 8, x2)

inst_164:
    // Test 164:  Test with marching zeros/ones
    // result rd:x28(0xefffffffffffffee), rs1:x29(0xefffffffffffffff), imm:0xfef
    TEST_IMM_OP(addi, x28, x29, 0xefffffffffffffee, 0xefffffffffffffff, 0xfef, x1, 16, x2)

    

    RVTEST_SIGBASE(x2,signature_56_0)


inst_165:
    // Test 165:  Test with marching zeros/ones
    // result rd:x29(0xdfffffffffffffde), rs1:x30(0xdfffffffffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x29, x30, 0xdfffffffffffffde, 0xdfffffffffffffff, 0xfdf, x2, 0, x3)

inst_166:
    // Test 166:  Test with marching zeros/ones
    // result rd:x30(0xbfffffffffffffbe), rs1:x31(0xbfffffffffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x30, x31, 0xbfffffffffffffbe, 0xbfffffffffffffff, 0xfbf, x2, 8, x3)

inst_167:
    // Test 167:  Test with marching zeros/ones
    // result rd:x31(0x7fffffffffffff7e), rs1:x1(0x7fffffffffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x31, x1, 0x7fffffffffffff7e, 0x7fffffffffffffff, 0xf7f, x2, 16, x3)

    

    RVTEST_SIGBASE(x4,signature_57_0)


inst_168:
    // Test 168:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000002), rs1:x2(0x0000000000000001), imm:0x1
    TEST_IMM_OP(addi, x1, x2, 0x0000000000000002, 0x1, 0x1, x4, 0, x5)

inst_169:
    // Test 169:  Test with marching zeros/ones
    // result rd:x1(0x0000000000000004), rs1:x2(0x0000000000000002), imm:0x2
    TEST_IMM_OP(addi, x1, x2, 0x0000000000000004, 0x2, 0x2, x4, 8, x5)

inst_170:
    // Test 170:  Test with marching zeros/ones
    // result rd:x2(0x0000000000000008), rs1:x3(0x0000000000000004), imm:0x4
    TEST_IMM_OP(addi, x2, x3, 0x0000000000000008, 0x4, 0x4, x4, 16, x5)

    

    RVTEST_SIGBASE(x1,signature_58_0)


inst_171:
    // Test 171:  Test with marching zeros/ones
    // result rd:x3(0x0000000000000010), rs1:x4(0x0000000000000008), imm:0x8
    TEST_IMM_OP(addi, x3, x4, 0x0000000000000010, 0x8, 0x8, x1, 0, x2)

inst_172:
    // Test 172:  Test with marching zeros/ones
    // result rd:x4(0x0000000000000020), rs1:x5(0x0000000000000010), imm:0x10
    TEST_IMM_OP(addi, x4, x5, 0x0000000000000020, 0x10, 0x10, x1, 8, x2)

inst_173:
    // Test 173:  Test with marching zeros/ones
    // result rd:x5(0x0000000000000040), rs1:x6(0x0000000000000020), imm:0x20
    TEST_IMM_OP(addi, x5, x6, 0x0000000000000040, 0x20, 0x20, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_59_0)


inst_174:
    // Test 174:  Test with marching zeros/ones
    // result rd:x6(0x0000000000000080), rs1:x7(0x0000000000000040), imm:0x40
    TEST_IMM_OP(addi, x6, x7, 0x0000000000000080, 0x40, 0x40, x1, 0, x2)

inst_175:
    // Test 175:  Test with marching zeros/ones
    // result rd:x7(0x0000000000000100), rs1:x8(0x0000000000000080), imm:0x80
    TEST_IMM_OP(addi, x7, x8, 0x0000000000000100, 0x80, 0x80, x1, 8, x2)

inst_176:
    // Test 176:  Test with marching zeros/ones
    // result rd:x8(0x0000000000000200), rs1:x9(0x0000000000000100), imm:0x100
    TEST_IMM_OP(addi, x8, x9, 0x0000000000000200, 0x100, 0x100, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_60_0)


inst_177:
    // Test 177:  Test with marching zeros/ones
    // result rd:x9(0x0000000000000400), rs1:x10(0x0000000000000200), imm:0x200
    TEST_IMM_OP(addi, x9, x10, 0x0000000000000400, 0x200, 0x200, x1, 0, x2)

inst_178:
    // Test 178:  Test with marching zeros/ones
    // result rd:x10(0x0000000000000800), rs1:x11(0x0000000000000400), imm:0x400
    TEST_IMM_OP(addi, x10, x11, 0x0000000000000800, 0x400, 0x400, x1, 8, x2)

inst_179:
    // Test 179:  Test with marching zeros/ones
    // result rd:x11(0x0000000000000000), rs1:x12(0x0000000000000800), imm:0x800
    TEST_IMM_OP(addi, x11, x12, 0x0000000000000000, 0x800, 0x800, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_61_0)


inst_180:
    // Test 180:  Test with marching zeros/ones
    // result rd:x12(0x0000000000000ffe), rs1:x13(0x0000000000001000), imm:0xffe
    TEST_IMM_OP(addi, x12, x13, 0x0000000000000ffe, 0x1000, 0xffe, x1, 0, x2)

inst_181:
    // Test 181:  Test with marching zeros/ones
    // result rd:x13(0x0000000000001ffd), rs1:x14(0x0000000000002000), imm:0xffd
    TEST_IMM_OP(addi, x13, x14, 0x0000000000001ffd, 0x2000, 0xffd, x1, 8, x2)

inst_182:
    // Test 182:  Test with marching zeros/ones
    // result rd:x14(0x0000000000003ffb), rs1:x15(0x0000000000004000), imm:0xffb
    TEST_IMM_OP(addi, x14, x15, 0x0000000000003ffb, 0x4000, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_62_0)


inst_183:
    // Test 183:  Test with marching zeros/ones
    // result rd:x15(0x0000000000007ff7), rs1:x16(0x0000000000008000), imm:0xff7
    TEST_IMM_OP(addi, x15, x16, 0x0000000000007ff7, 0x8000, 0xff7, x1, 0, x2)

inst_184:
    // Test 184:  Test with marching zeros/ones
    // result rd:x16(0x000000000000ffef), rs1:x17(0x0000000000010000), imm:0xfef
    TEST_IMM_OP(addi, x16, x17, 0x000000000000ffef, 0x10000, 0xfef, x1, 8, x2)

inst_185:
    // Test 185:  Test with marching zeros/ones
    // result rd:x17(0x000000000001ffdf), rs1:x18(0x0000000000020000), imm:0xfdf
    TEST_IMM_OP(addi, x17, x18, 0x000000000001ffdf, 0x20000, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_63_0)


inst_186:
    // Test 186:  Test with marching zeros/ones
    // result rd:x18(0x000000000003ffbf), rs1:x19(0x0000000000040000), imm:0xfbf
    TEST_IMM_OP(addi, x18, x19, 0x000000000003ffbf, 0x40000, 0xfbf, x1, 0, x2)

inst_187:
    // Test 187:  Test with marching zeros/ones
    // result rd:x19(0x000000000007ff7f), rs1:x20(0x0000000000080000), imm:0xf7f
    TEST_IMM_OP(addi, x19, x20, 0x000000000007ff7f, 0x80000, 0xf7f, x1, 8, x2)

inst_188:
    // Test 188:  Test with marching zeros/ones
    // result rd:x20(0x00000000000ffeff), rs1:x21(0x0000000000100000), imm:0xeff
    TEST_IMM_OP(addi, x20, x21, 0x00000000000ffeff, 0x100000, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_64_0)


inst_189:
    // Test 189:  Test with marching zeros/ones
    // result rd:x21(0x00000000001ffdff), rs1:x22(0x0000000000200000), imm:0xdff
    TEST_IMM_OP(addi, x21, x22, 0x00000000001ffdff, 0x200000, 0xdff, x1, 0, x2)

inst_190:
    // Test 190:  Test with marching zeros/ones
    // result rd:x22(0x00000000003ffbff), rs1:x23(0x0000000000400000), imm:0xbff
    TEST_IMM_OP(addi, x22, x23, 0x00000000003ffbff, 0x400000, 0xbff, x1, 8, x2)

inst_191:
    // Test 191:  Test with marching zeros/ones
    // result rd:x23(0x00000000008007ff), rs1:x24(0x0000000000800000), imm:0x7ff
    TEST_IMM_OP(addi, x23, x24, 0x00000000008007ff, 0x800000, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_65_0)


inst_192:
    // Test 192:  Test with marching zeros/ones
    // result rd:x24(0x0000000000fffffe), rs1:x25(0x0000000001000000), imm:0xffe
    TEST_IMM_OP(addi, x24, x25, 0x0000000000fffffe, 0x1000000, 0xffe, x1, 0, x2)

inst_193:
    // Test 193:  Test with marching zeros/ones
    // result rd:x25(0x0000000001fffffd), rs1:x26(0x0000000002000000), imm:0xffd
    TEST_IMM_OP(addi, x25, x26, 0x0000000001fffffd, 0x2000000, 0xffd, x1, 8, x2)

inst_194:
    // Test 194:  Test with marching zeros/ones
    // result rd:x26(0x0000000003fffffb), rs1:x27(0x0000000004000000), imm:0xffb
    TEST_IMM_OP(addi, x26, x27, 0x0000000003fffffb, 0x4000000, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_66_0)


inst_195:
    // Test 195:  Test with marching zeros/ones
    // result rd:x27(0x0000000007fffff7), rs1:x28(0x0000000008000000), imm:0xff7
    TEST_IMM_OP(addi, x27, x28, 0x0000000007fffff7, 0x8000000, 0xff7, x1, 0, x2)

inst_196:
    // Test 196:  Test with marching zeros/ones
    // result rd:x28(0x000000000fffffef), rs1:x29(0x0000000010000000), imm:0xfef
    TEST_IMM_OP(addi, x28, x29, 0x000000000fffffef, 0x10000000, 0xfef, x1, 8, x2)

inst_197:
    // Test 197:  Test with marching zeros/ones
    // result rd:x29(0x000000001fffffdf), rs1:x30(0x0000000020000000), imm:0xfdf
    TEST_IMM_OP(addi, x29, x30, 0x000000001fffffdf, 0x20000000, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_67_0)


inst_198:
    // Test 198:  Test with marching zeros/ones
    // result rd:x30(0x000000003fffffbf), rs1:x31(0x0000000040000000), imm:0xfbf
    TEST_IMM_OP(addi, x30, x31, 0x000000003fffffbf, 0x40000000, 0xfbf, x3, 0, x4)

inst_199:
    // Test 199:  Test with marching zeros/ones
    // result rd:x31(0x000000007fffff7f), rs1:x1(0x0000000080000000), imm:0xf7f
    TEST_IMM_OP(addi, x31, x1, 0x000000007fffff7f, 0x80000000, 0xf7f, x3, 8, x4)

inst_200:
    // Test 200:  Test with marching zeros/ones
    // result rd:x1(0x00000000fffffeff), rs1:x2(0x0000000100000000), imm:0xeff
    TEST_IMM_OP(addi, x1, x2, 0x00000000fffffeff, 0x100000000, 0xeff, x3, 16, x4)

    

    RVTEST_SIGBASE(x5,signature_68_0)


inst_201:
    // Test 201:  Test with marching zeros/ones
    // result rd:x1(0x00000001fffffdff), rs1:x2(0x0000000200000000), imm:0xdff
    TEST_IMM_OP(addi, x1, x2, 0x00000001fffffdff, 0x200000000, 0xdff, x5, 0, x6)

inst_202:
    // Test 202:  Test with marching zeros/ones
    // result rd:x2(0x00000003fffffbff), rs1:x3(0x0000000400000000), imm:0xbff
    TEST_IMM_OP(addi, x2, x3, 0x00000003fffffbff, 0x400000000, 0xbff, x5, 8, x6)

inst_203:
    // Test 203:  Test with marching zeros/ones
    // result rd:x3(0x00000008000007ff), rs1:x4(0x0000000800000000), imm:0x7ff
    TEST_IMM_OP(addi, x3, x4, 0x00000008000007ff, 0x800000000, 0x7ff, x5, 16, x6)

    

    RVTEST_SIGBASE(x1,signature_69_0)


inst_204:
    // Test 204:  Test with marching zeros/ones
    // result rd:x4(0x0000000ffffffffe), rs1:x5(0x0000001000000000), imm:0xffe
    TEST_IMM_OP(addi, x4, x5, 0x0000000ffffffffe, 0x1000000000, 0xffe, x1, 0, x2)

inst_205:
    // Test 205:  Test with marching zeros/ones
    // result rd:x5(0x0000001ffffffffd), rs1:x6(0x0000002000000000), imm:0xffd
    TEST_IMM_OP(addi, x5, x6, 0x0000001ffffffffd, 0x2000000000, 0xffd, x1, 8, x2)

inst_206:
    // Test 206:  Test with marching zeros/ones
    // result rd:x6(0x0000003ffffffffb), rs1:x7(0x0000004000000000), imm:0xffb
    TEST_IMM_OP(addi, x6, x7, 0x0000003ffffffffb, 0x4000000000, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_70_0)


inst_207:
    // Test 207:  Test with marching zeros/ones
    // result rd:x7(0x0000007ffffffff7), rs1:x8(0x0000008000000000), imm:0xff7
    TEST_IMM_OP(addi, x7, x8, 0x0000007ffffffff7, 0x8000000000, 0xff7, x1, 0, x2)

inst_208:
    // Test 208:  Test with marching zeros/ones
    // result rd:x8(0x000000ffffffffef), rs1:x9(0x0000010000000000), imm:0xfef
    TEST_IMM_OP(addi, x8, x9, 0x000000ffffffffef, 0x10000000000, 0xfef, x1, 8, x2)

inst_209:
    // Test 209:  Test with marching zeros/ones
    // result rd:x9(0x000001ffffffffdf), rs1:x10(0x0000020000000000), imm:0xfdf
    TEST_IMM_OP(addi, x9, x10, 0x000001ffffffffdf, 0x20000000000, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_71_0)


inst_210:
    // Test 210:  Test with marching zeros/ones
    // result rd:x10(0x000003ffffffffbf), rs1:x11(0x0000040000000000), imm:0xfbf
    TEST_IMM_OP(addi, x10, x11, 0x000003ffffffffbf, 0x40000000000, 0xfbf, x1, 0, x2)

inst_211:
    // Test 211:  Test with marching zeros/ones
    // result rd:x11(0x000007ffffffff7f), rs1:x12(0x0000080000000000), imm:0xf7f
    TEST_IMM_OP(addi, x11, x12, 0x000007ffffffff7f, 0x80000000000, 0xf7f, x1, 8, x2)

inst_212:
    // Test 212:  Test with marching zeros/ones
    // result rd:x12(0x00000ffffffffeff), rs1:x13(0x0000100000000000), imm:0xeff
    TEST_IMM_OP(addi, x12, x13, 0x00000ffffffffeff, 0x100000000000, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_72_0)


inst_213:
    // Test 213:  Test with marching zeros/ones
    // result rd:x13(0x00001ffffffffdff), rs1:x14(0x0000200000000000), imm:0xdff
    TEST_IMM_OP(addi, x13, x14, 0x00001ffffffffdff, 0x200000000000, 0xdff, x1, 0, x2)

inst_214:
    // Test 214:  Test with marching zeros/ones
    // result rd:x14(0x00003ffffffffbff), rs1:x15(0x0000400000000000), imm:0xbff
    TEST_IMM_OP(addi, x14, x15, 0x00003ffffffffbff, 0x400000000000, 0xbff, x1, 8, x2)

inst_215:
    // Test 215:  Test with marching zeros/ones
    // result rd:x15(0x00008000000007ff), rs1:x16(0x0000800000000000), imm:0x7ff
    TEST_IMM_OP(addi, x15, x16, 0x00008000000007ff, 0x800000000000, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_73_0)


inst_216:
    // Test 216:  Test with marching zeros/ones
    // result rd:x16(0x0000fffffffffffe), rs1:x17(0x0001000000000000), imm:0xffe
    TEST_IMM_OP(addi, x16, x17, 0x0000fffffffffffe, 0x1000000000000, 0xffe, x1, 0, x2)

inst_217:
    // Test 217:  Test with marching zeros/ones
    // result rd:x17(0x0001fffffffffffd), rs1:x18(0x0002000000000000), imm:0xffd
    TEST_IMM_OP(addi, x17, x18, 0x0001fffffffffffd, 0x2000000000000, 0xffd, x1, 8, x2)

inst_218:
    // Test 218:  Test with marching zeros/ones
    // result rd:x18(0x0003fffffffffffb), rs1:x19(0x0004000000000000), imm:0xffb
    TEST_IMM_OP(addi, x18, x19, 0x0003fffffffffffb, 0x4000000000000, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_74_0)


inst_219:
    // Test 219:  Test with marching zeros/ones
    // result rd:x19(0x0007fffffffffff7), rs1:x20(0x0008000000000000), imm:0xff7
    TEST_IMM_OP(addi, x19, x20, 0x0007fffffffffff7, 0x8000000000000, 0xff7, x1, 0, x2)

inst_220:
    // Test 220:  Test with marching zeros/ones
    // result rd:x20(0x000fffffffffffef), rs1:x21(0x0010000000000000), imm:0xfef
    TEST_IMM_OP(addi, x20, x21, 0x000fffffffffffef, 0x10000000000000, 0xfef, x1, 8, x2)

inst_221:
    // Test 221:  Test with marching zeros/ones
    // result rd:x21(0x001fffffffffffdf), rs1:x22(0x0020000000000000), imm:0xfdf
    TEST_IMM_OP(addi, x21, x22, 0x001fffffffffffdf, 0x20000000000000, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_75_0)


inst_222:
    // Test 222:  Test with marching zeros/ones
    // result rd:x22(0x003fffffffffffbf), rs1:x23(0x0040000000000000), imm:0xfbf
    TEST_IMM_OP(addi, x22, x23, 0x003fffffffffffbf, 0x40000000000000, 0xfbf, x1, 0, x2)

inst_223:
    // Test 223:  Test with marching zeros/ones
    // result rd:x23(0x007fffffffffff7f), rs1:x24(0x0080000000000000), imm:0xf7f
    TEST_IMM_OP(addi, x23, x24, 0x007fffffffffff7f, 0x80000000000000, 0xf7f, x1, 8, x2)

inst_224:
    // Test 224:  Test with marching zeros/ones
    // result rd:x24(0x00fffffffffffeff), rs1:x25(0x0100000000000000), imm:0xeff
    TEST_IMM_OP(addi, x24, x25, 0x00fffffffffffeff, 0x100000000000000, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_76_0)


inst_225:
    // Test 225:  Test with marching zeros/ones
    // result rd:x25(0x01fffffffffffdff), rs1:x26(0x0200000000000000), imm:0xdff
    TEST_IMM_OP(addi, x25, x26, 0x01fffffffffffdff, 0x200000000000000, 0xdff, x1, 0, x2)

inst_226:
    // Test 226:  Test with marching zeros/ones
    // result rd:x26(0x03fffffffffffbff), rs1:x27(0x0400000000000000), imm:0xbff
    TEST_IMM_OP(addi, x26, x27, 0x03fffffffffffbff, 0x400000000000000, 0xbff, x1, 8, x2)

inst_227:
    // Test 227:  Test with marching zeros/ones
    // result rd:x27(0x08000000000007ff), rs1:x28(0x0800000000000000), imm:0x7ff
    TEST_IMM_OP(addi, x27, x28, 0x08000000000007ff, 0x800000000000000, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_77_0)


inst_228:
    // Test 228:  Test with marching zeros/ones
    // result rd:x28(0x0ffffffffffffffe), rs1:x29(0x1000000000000000), imm:0xffe
    TEST_IMM_OP(addi, x28, x29, 0x0ffffffffffffffe, 0x1000000000000000, 0xffe, x1, 0, x2)

inst_229:
    // Test 229:  Test with marching zeros/ones
    // result rd:x29(0x1ffffffffffffffd), rs1:x30(0x2000000000000000), imm:0xffd
    TEST_IMM_OP(addi, x29, x30, 0x1ffffffffffffffd, 0x2000000000000000, 0xffd, x1, 8, x2)

inst_230:
    // Test 230:  Test with marching zeros/ones
    // result rd:x30(0x3ffffffffffffffb), rs1:x31(0x4000000000000000), imm:0xffb
    TEST_IMM_OP(addi, x30, x31, 0x3ffffffffffffffb, 0x4000000000000000, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_78_0)


inst_231:
    // Test 231:  Test with marching zeros/ones
    // result rd:x31(0x7ffffffffffffff7), rs1:x1(0x8000000000000000), imm:0xff7
    TEST_IMM_OP(addi, x31, x1, 0x7ffffffffffffff7, 0x8000000000000000, 0xff7, x3, 0, x4)

inst_232:
    // Test 232:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffed), rs1:x2(0xfffffffffffffffe), imm:0xfef
    TEST_IMM_OP(addi, x1, x2, 0xffffffffffffffed, 0xfffffffffffffffe, 0xfef, x3, 8, x4)

inst_233:
    // Test 233:  Test with marching zeros/ones
    // result rd:x1(0xffffffffffffffdc), rs1:x2(0xfffffffffffffffd), imm:0xfdf
    TEST_IMM_OP(addi, x1, x2, 0xffffffffffffffdc, 0xfffffffffffffffd, 0xfdf, x3, 16, x4)

    

    RVTEST_SIGBASE(x1,signature_79_0)


inst_234:
    // Test 234:  Test with marching zeros/ones
    // result rd:x2(0xffffffffffffffba), rs1:x3(0xfffffffffffffffb), imm:0xfbf
    TEST_IMM_OP(addi, x2, x3, 0xffffffffffffffba, 0xfffffffffffffffb, 0xfbf, x1, 0, x6)

inst_235:
    // Test 235:  Test with marching zeros/ones
    // result rd:x3(0xffffffffffffff76), rs1:x4(0xfffffffffffffff7), imm:0xf7f
    TEST_IMM_OP(addi, x3, x4, 0xffffffffffffff76, 0xfffffffffffffff7, 0xf7f, x1, 8, x6)

inst_236:
    // Test 236:  Test with marching zeros/ones
    // result rd:x4(0xfffffffffffffeee), rs1:x5(0xffffffffffffffef), imm:0xeff
    TEST_IMM_OP(addi, x4, x5, 0xfffffffffffffeee, 0xffffffffffffffef, 0xeff, x1, 16, x6)

    

    RVTEST_SIGBASE(x1,signature_80_0)


inst_237:
    // Test 237:  Test with marching zeros/ones
    // result rd:x5(0xfffffffffffffdde), rs1:x6(0xffffffffffffffdf), imm:0xdff
    TEST_IMM_OP(addi, x5, x6, 0xfffffffffffffdde, 0xffffffffffffffdf, 0xdff, x1, 0, x2)

inst_238:
    // Test 238:  Test with marching zeros/ones
    // result rd:x6(0xfffffffffffffbbe), rs1:x7(0xffffffffffffffbf), imm:0xbff
    TEST_IMM_OP(addi, x6, x7, 0xfffffffffffffbbe, 0xffffffffffffffbf, 0xbff, x1, 8, x2)

inst_239:
    // Test 239:  Test with marching zeros/ones
    // result rd:x7(0x000000000000077e), rs1:x8(0xffffffffffffff7f), imm:0x7ff
    TEST_IMM_OP(addi, x7, x8, 0x000000000000077e, 0xffffffffffffff7f, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_81_0)


inst_240:
    // Test 240:  Test with marching zeros/ones
    // result rd:x8(0xfffffffffffffefd), rs1:x9(0xfffffffffffffeff), imm:0xffe
    TEST_IMM_OP(addi, x8, x9, 0xfffffffffffffefd, 0xfffffffffffffeff, 0xffe, x1, 0, x2)

inst_241:
    // Test 241:  Test with marching zeros/ones
    // result rd:x9(0xfffffffffffffdfc), rs1:x10(0xfffffffffffffdff), imm:0xffd
    TEST_IMM_OP(addi, x9, x10, 0xfffffffffffffdfc, 0xfffffffffffffdff, 0xffd, x1, 8, x2)

inst_242:
    // Test 242:  Test with marching zeros/ones
    // result rd:x10(0xfffffffffffffbfa), rs1:x11(0xfffffffffffffbff), imm:0xffb
    TEST_IMM_OP(addi, x10, x11, 0xfffffffffffffbfa, 0xfffffffffffffbff, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_82_0)


inst_243:
    // Test 243:  Test with marching zeros/ones
    // result rd:x11(0xfffffffffffff7f6), rs1:x12(0xfffffffffffff7ff), imm:0xff7
    TEST_IMM_OP(addi, x11, x12, 0xfffffffffffff7f6, 0xfffffffffffff7ff, 0xff7, x1, 0, x2)

inst_244:
    // Test 244:  Test with marching zeros/ones
    // result rd:x12(0xffffffffffffefee), rs1:x13(0xffffffffffffefff), imm:0xfef
    TEST_IMM_OP(addi, x12, x13, 0xffffffffffffefee, 0xffffffffffffefff, 0xfef, x1, 8, x2)

inst_245:
    // Test 245:  Test with marching zeros/ones
    // result rd:x13(0xffffffffffffdfde), rs1:x14(0xffffffffffffdfff), imm:0xfdf
    TEST_IMM_OP(addi, x13, x14, 0xffffffffffffdfde, 0xffffffffffffdfff, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_83_0)


inst_246:
    // Test 246:  Test with marching zeros/ones
    // result rd:x14(0xffffffffffffbfbe), rs1:x15(0xffffffffffffbfff), imm:0xfbf
    TEST_IMM_OP(addi, x14, x15, 0xffffffffffffbfbe, 0xffffffffffffbfff, 0xfbf, x1, 0, x2)

inst_247:
    // Test 247:  Test with marching zeros/ones
    // result rd:x15(0xffffffffffff7f7e), rs1:x16(0xffffffffffff7fff), imm:0xf7f
    TEST_IMM_OP(addi, x15, x16, 0xffffffffffff7f7e, 0xffffffffffff7fff, 0xf7f, x1, 8, x2)

inst_248:
    // Test 248:  Test with marching zeros/ones
    // result rd:x16(0xfffffffffffefefe), rs1:x17(0xfffffffffffeffff), imm:0xeff
    TEST_IMM_OP(addi, x16, x17, 0xfffffffffffefefe, 0xfffffffffffeffff, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_84_0)


inst_249:
    // Test 249:  Test with marching zeros/ones
    // result rd:x17(0xfffffffffffdfdfe), rs1:x18(0xfffffffffffdffff), imm:0xdff
    TEST_IMM_OP(addi, x17, x18, 0xfffffffffffdfdfe, 0xfffffffffffdffff, 0xdff, x1, 0, x2)

inst_250:
    // Test 250:  Test with marching zeros/ones
    // result rd:x18(0xfffffffffffbfbfe), rs1:x19(0xfffffffffffbffff), imm:0xbff
    TEST_IMM_OP(addi, x18, x19, 0xfffffffffffbfbfe, 0xfffffffffffbffff, 0xbff, x1, 8, x2)

inst_251:
    // Test 251:  Test with marching zeros/ones
    // result rd:x19(0xfffffffffff807fe), rs1:x20(0xfffffffffff7ffff), imm:0x7ff
    TEST_IMM_OP(addi, x19, x20, 0xfffffffffff807fe, 0xfffffffffff7ffff, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_85_0)


inst_252:
    // Test 252:  Test with marching zeros/ones
    // result rd:x20(0xffffffffffeffffd), rs1:x21(0xffffffffffefffff), imm:0xffe
    TEST_IMM_OP(addi, x20, x21, 0xffffffffffeffffd, 0xffffffffffefffff, 0xffe, x1, 0, x2)

inst_253:
    // Test 253:  Test with marching zeros/ones
    // result rd:x21(0xffffffffffdffffc), rs1:x22(0xffffffffffdfffff), imm:0xffd
    TEST_IMM_OP(addi, x21, x22, 0xffffffffffdffffc, 0xffffffffffdfffff, 0xffd, x1, 8, x2)

inst_254:
    // Test 254:  Test with marching zeros/ones
    // result rd:x22(0xffffffffffbffffa), rs1:x23(0xffffffffffbfffff), imm:0xffb
    TEST_IMM_OP(addi, x22, x23, 0xffffffffffbffffa, 0xffffffffffbfffff, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_86_0)


inst_255:
    // Test 255:  Test with marching zeros/ones
    // result rd:x23(0xffffffffff7ffff6), rs1:x24(0xffffffffff7fffff), imm:0xff7
    TEST_IMM_OP(addi, x23, x24, 0xffffffffff7ffff6, 0xffffffffff7fffff, 0xff7, x1, 0, x2)

inst_256:
    // Test 256:  Test with marching zeros/ones
    // result rd:x24(0xfffffffffeffffee), rs1:x25(0xfffffffffeffffff), imm:0xfef
    TEST_IMM_OP(addi, x24, x25, 0xfffffffffeffffee, 0xfffffffffeffffff, 0xfef, x1, 8, x2)

inst_257:
    // Test 257:  Test with marching zeros/ones
    // result rd:x25(0xfffffffffdffffde), rs1:x26(0xfffffffffdffffff), imm:0xfdf
    TEST_IMM_OP(addi, x25, x26, 0xfffffffffdffffde, 0xfffffffffdffffff, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_87_0)


inst_258:
    // Test 258:  Test with marching zeros/ones
    // result rd:x26(0xfffffffffbffffbe), rs1:x27(0xfffffffffbffffff), imm:0xfbf
    TEST_IMM_OP(addi, x26, x27, 0xfffffffffbffffbe, 0xfffffffffbffffff, 0xfbf, x1, 0, x2)

inst_259:
    // Test 259:  Test with marching zeros/ones
    // result rd:x27(0xfffffffff7ffff7e), rs1:x28(0xfffffffff7ffffff), imm:0xf7f
    TEST_IMM_OP(addi, x27, x28, 0xfffffffff7ffff7e, 0xfffffffff7ffffff, 0xf7f, x1, 8, x2)

inst_260:
    // Test 260:  Test with marching zeros/ones
    // result rd:x28(0xffffffffeffffefe), rs1:x29(0xffffffffefffffff), imm:0xeff
    TEST_IMM_OP(addi, x28, x29, 0xffffffffeffffefe, 0xffffffffefffffff, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x2,signature_88_0)


inst_261:
    // Test 261:  Test with marching zeros/ones
    // result rd:x29(0xffffffffdffffdfe), rs1:x30(0xffffffffdfffffff), imm:0xdff
    TEST_IMM_OP(addi, x29, x30, 0xffffffffdffffdfe, 0xffffffffdfffffff, 0xdff, x2, 0, x3)

inst_262:
    // Test 262:  Test with marching zeros/ones
    // result rd:x30(0xffffffffbffffbfe), rs1:x31(0xffffffffbfffffff), imm:0xbff
    TEST_IMM_OP(addi, x30, x31, 0xffffffffbffffbfe, 0xffffffffbfffffff, 0xbff, x2, 8, x3)

inst_263:
    // Test 263:  Test with marching zeros/ones
    // result rd:x31(0xffffffff800007fe), rs1:x1(0xffffffff7fffffff), imm:0x7ff
    TEST_IMM_OP(addi, x31, x1, 0xffffffff800007fe, 0xffffffff7fffffff, 0x7ff, x2, 16, x3)

    

    RVTEST_SIGBASE(x4,signature_89_0)


inst_264:
    // Test 264:  Test with marching zeros/ones
    // result rd:x1(0xfffffffefffffffd), rs1:x2(0xfffffffeffffffff), imm:0xffe
    TEST_IMM_OP(addi, x1, x2, 0xfffffffefffffffd, 0xfffffffeffffffff, 0xffe, x4, 0, x5)

inst_265:
    // Test 265:  Test with marching zeros/ones
    // result rd:x1(0xfffffffdfffffffc), rs1:x2(0xfffffffdffffffff), imm:0xffd
    TEST_IMM_OP(addi, x1, x2, 0xfffffffdfffffffc, 0xfffffffdffffffff, 0xffd, x4, 8, x5)

inst_266:
    // Test 266:  Test with marching zeros/ones
    // result rd:x2(0xfffffffbfffffffa), rs1:x3(0xfffffffbffffffff), imm:0xffb
    TEST_IMM_OP(addi, x2, x3, 0xfffffffbfffffffa, 0xfffffffbffffffff, 0xffb, x4, 16, x5)

    

    RVTEST_SIGBASE(x1,signature_90_0)


inst_267:
    // Test 267:  Test with marching zeros/ones
    // result rd:x3(0xfffffff7fffffff6), rs1:x4(0xfffffff7ffffffff), imm:0xff7
    TEST_IMM_OP(addi, x3, x4, 0xfffffff7fffffff6, 0xfffffff7ffffffff, 0xff7, x1, 0, x2)

inst_268:
    // Test 268:  Test with marching zeros/ones
    // result rd:x4(0xffffffefffffffee), rs1:x5(0xffffffefffffffff), imm:0xfef
    TEST_IMM_OP(addi, x4, x5, 0xffffffefffffffee, 0xffffffefffffffff, 0xfef, x1, 8, x2)

inst_269:
    // Test 269:  Test with marching zeros/ones
    // result rd:x5(0xffffffdfffffffde), rs1:x6(0xffffffdfffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x5, x6, 0xffffffdfffffffde, 0xffffffdfffffffff, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_91_0)


inst_270:
    // Test 270:  Test with marching zeros/ones
    // result rd:x6(0xffffffbfffffffbe), rs1:x7(0xffffffbfffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x6, x7, 0xffffffbfffffffbe, 0xffffffbfffffffff, 0xfbf, x1, 0, x2)

inst_271:
    // Test 271:  Test with marching zeros/ones
    // result rd:x7(0xffffff7fffffff7e), rs1:x8(0xffffff7fffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x7, x8, 0xffffff7fffffff7e, 0xffffff7fffffffff, 0xf7f, x1, 8, x2)

inst_272:
    // Test 272:  Test with marching zeros/ones
    // result rd:x8(0xfffffefffffffefe), rs1:x9(0xfffffeffffffffff), imm:0xeff
    TEST_IMM_OP(addi, x8, x9, 0xfffffefffffffefe, 0xfffffeffffffffff, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_92_0)


inst_273:
    // Test 273:  Test with marching zeros/ones
    // result rd:x9(0xfffffdfffffffdfe), rs1:x10(0xfffffdffffffffff), imm:0xdff
    TEST_IMM_OP(addi, x9, x10, 0xfffffdfffffffdfe, 0xfffffdffffffffff, 0xdff, x1, 0, x2)

inst_274:
    // Test 274:  Test with marching zeros/ones
    // result rd:x10(0xfffffbfffffffbfe), rs1:x11(0xfffffbffffffffff), imm:0xbff
    TEST_IMM_OP(addi, x10, x11, 0xfffffbfffffffbfe, 0xfffffbffffffffff, 0xbff, x1, 8, x2)

inst_275:
    // Test 275:  Test with marching zeros/ones
    // result rd:x11(0xfffff800000007fe), rs1:x12(0xfffff7ffffffffff), imm:0x7ff
    TEST_IMM_OP(addi, x11, x12, 0xfffff800000007fe, 0xfffff7ffffffffff, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_93_0)


inst_276:
    // Test 276:  Test with marching zeros/ones
    // result rd:x12(0xffffeffffffffffd), rs1:x13(0xffffefffffffffff), imm:0xffe
    TEST_IMM_OP(addi, x12, x13, 0xffffeffffffffffd, 0xffffefffffffffff, 0xffe, x1, 0, x2)

inst_277:
    // Test 277:  Test with marching zeros/ones
    // result rd:x13(0xffffdffffffffffc), rs1:x14(0xffffdfffffffffff), imm:0xffd
    TEST_IMM_OP(addi, x13, x14, 0xffffdffffffffffc, 0xffffdfffffffffff, 0xffd, x1, 8, x2)

inst_278:
    // Test 278:  Test with marching zeros/ones
    // result rd:x14(0xffffbffffffffffa), rs1:x15(0xffffbfffffffffff), imm:0xffb
    TEST_IMM_OP(addi, x14, x15, 0xffffbffffffffffa, 0xffffbfffffffffff, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_94_0)


inst_279:
    // Test 279:  Test with marching zeros/ones
    // result rd:x15(0xffff7ffffffffff6), rs1:x16(0xffff7fffffffffff), imm:0xff7
    TEST_IMM_OP(addi, x15, x16, 0xffff7ffffffffff6, 0xffff7fffffffffff, 0xff7, x1, 0, x2)

inst_280:
    // Test 280:  Test with marching zeros/ones
    // result rd:x16(0xfffeffffffffffee), rs1:x17(0xfffeffffffffffff), imm:0xfef
    TEST_IMM_OP(addi, x16, x17, 0xfffeffffffffffee, 0xfffeffffffffffff, 0xfef, x1, 8, x2)

inst_281:
    // Test 281:  Test with marching zeros/ones
    // result rd:x17(0xfffdffffffffffde), rs1:x18(0xfffdffffffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x17, x18, 0xfffdffffffffffde, 0xfffdffffffffffff, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_95_0)


inst_282:
    // Test 282:  Test with marching zeros/ones
    // result rd:x18(0xfffbffffffffffbe), rs1:x19(0xfffbffffffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x18, x19, 0xfffbffffffffffbe, 0xfffbffffffffffff, 0xfbf, x1, 0, x2)

inst_283:
    // Test 283:  Test with marching zeros/ones
    // result rd:x19(0xfff7ffffffffff7e), rs1:x20(0xfff7ffffffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x19, x20, 0xfff7ffffffffff7e, 0xfff7ffffffffffff, 0xf7f, x1, 8, x2)

inst_284:
    // Test 284:  Test with marching zeros/ones
    // result rd:x20(0xffeffffffffffefe), rs1:x21(0xffefffffffffffff), imm:0xeff
    TEST_IMM_OP(addi, x20, x21, 0xffeffffffffffefe, 0xffefffffffffffff, 0xeff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_96_0)


inst_285:
    // Test 285:  Test with marching zeros/ones
    // result rd:x21(0xffdffffffffffdfe), rs1:x22(0xffdfffffffffffff), imm:0xdff
    TEST_IMM_OP(addi, x21, x22, 0xffdffffffffffdfe, 0xffdfffffffffffff, 0xdff, x1, 0, x2)

inst_286:
    // Test 286:  Test with marching zeros/ones
    // result rd:x22(0xffbffffffffffbfe), rs1:x23(0xffbfffffffffffff), imm:0xbff
    TEST_IMM_OP(addi, x22, x23, 0xffbffffffffffbfe, 0xffbfffffffffffff, 0xbff, x1, 8, x2)

inst_287:
    // Test 287:  Test with marching zeros/ones
    // result rd:x23(0xff800000000007fe), rs1:x24(0xff7fffffffffffff), imm:0x7ff
    TEST_IMM_OP(addi, x23, x24, 0xff800000000007fe, 0xff7fffffffffffff, 0x7ff, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_97_0)


inst_288:
    // Test 288:  Test with marching zeros/ones
    // result rd:x24(0xfefffffffffffffd), rs1:x25(0xfeffffffffffffff), imm:0xffe
    TEST_IMM_OP(addi, x24, x25, 0xfefffffffffffffd, 0xfeffffffffffffff, 0xffe, x1, 0, x2)

inst_289:
    // Test 289:  Test with marching zeros/ones
    // result rd:x25(0xfdfffffffffffffc), rs1:x26(0xfdffffffffffffff), imm:0xffd
    TEST_IMM_OP(addi, x25, x26, 0xfdfffffffffffffc, 0xfdffffffffffffff, 0xffd, x1, 8, x2)

inst_290:
    // Test 290:  Test with marching zeros/ones
    // result rd:x26(0xfbfffffffffffffa), rs1:x27(0xfbffffffffffffff), imm:0xffb
    TEST_IMM_OP(addi, x26, x27, 0xfbfffffffffffffa, 0xfbffffffffffffff, 0xffb, x1, 16, x2)

    

    RVTEST_SIGBASE(x1,signature_98_0)


inst_291:
    // Test 291:  Test with marching zeros/ones
    // result rd:x27(0xf7fffffffffffff6), rs1:x28(0xf7ffffffffffffff), imm:0xff7
    TEST_IMM_OP(addi, x27, x28, 0xf7fffffffffffff6, 0xf7ffffffffffffff, 0xff7, x1, 0, x2)

inst_292:
    // Test 292:  Test with marching zeros/ones
    // result rd:x28(0xefffffffffffffee), rs1:x29(0xefffffffffffffff), imm:0xfef
    TEST_IMM_OP(addi, x28, x29, 0xefffffffffffffee, 0xefffffffffffffff, 0xfef, x1, 8, x2)

inst_293:
    // Test 293:  Test with marching zeros/ones
    // result rd:x29(0xdfffffffffffffde), rs1:x30(0xdfffffffffffffff), imm:0xfdf
    TEST_IMM_OP(addi, x29, x30, 0xdfffffffffffffde, 0xdfffffffffffffff, 0xfdf, x1, 16, x2)

    

    RVTEST_SIGBASE(x3,signature_99_0)


inst_294:
    // Test 294:  Test with marching zeros/ones
    // result rd:x30(0xbfffffffffffffbe), rs1:x31(0xbfffffffffffffff), imm:0xfbf
    TEST_IMM_OP(addi, x30, x31, 0xbfffffffffffffbe, 0xbfffffffffffffff, 0xfbf, x3, 0, x4)

inst_295:
    // Test 295:  Test with marching zeros/ones
    // result rd:x31(0x7fffffffffffff7e), rs1:x1(0x7fffffffffffffff), imm:0xf7f
    TEST_IMM_OP(addi, x31, x1, 0x7fffffffffffff7e, 0x7fffffffffffffff, 0xf7f, x3, 8, x4)

inst_296:
    // Test 296:  Test with rd == x0
    // result rd:x0(0x0000000000000000), rs1:x2(0x75dd10cf68ce0f63), imm:0xf6a
    TEST_IMM_OP(addi, x0, x2, 0x0000000000000000, 0x75dd10cf68ce0f63, 0xf6a, x3, 16, x4)

    

    RVTEST_SIGBASE(x1,signature_100_0)


inst_297:
    // Test 297:  Test with rs1 == x0
    // result rd:x7(0xfffffffffffff8e8), rs1:x0(0x7bf168c97a8b59c1), imm:0x8e8
    TEST_IMM_OP(addi, x7, x0, 0xfffffffffffff8e8, 0x7bf168c97a8b59c1, 0x8e8, x1, 0, x2)
	
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
signature_100_0:
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

