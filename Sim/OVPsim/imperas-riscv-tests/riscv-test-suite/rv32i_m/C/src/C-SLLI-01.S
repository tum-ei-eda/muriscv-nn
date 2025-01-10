// RISC-V Architectural Validation Test C-SLLI-01
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
// Description: Testing instruction 'c.slli'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.slli)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.slli)

    RVTEST_SIGBASE(x1,signature_1_0)


    # Testcase 0:  rd:x20(0x00000000), imm:0xf, result rd:x20(0x00000000)
    li x20, MASK_XLEN(0x0)
    c.slli x20, 0xf
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0)

    # Testcase 1:  rd:x29(0x00000000), imm:0x7, result rd:x29(0x00000000)
    li x29, MASK_XLEN(0x0)
    c.slli x29, 0x7
    sw x29, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0)

    # Testcase 2:  rd:x31(0x00000000), imm:0x1d, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0x1d
    sw x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x0)


    

    RVTEST_SIGBASE(x1,signature_2_0)


    # Testcase 3:  rd:x21(0x00000000), imm:0x11, result rd:x21(0x00000000)
    li x21, MASK_XLEN(0x0)
    c.slli x21, 0x11
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0)

    # Testcase 4:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.slli x11, 0x1d
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0)

    # Testcase 5:  rd:x2(0x00000000), imm:0x5, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x5
    sw x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x0)


    

    RVTEST_SIGBASE(x2,signature_3_0)


    # Testcase 6:  rd:x4(0x00000000), imm:0xf, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0xf
    sw x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0)

    # Testcase 7:  rd:x1(0x00000000), imm:0x4, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x4
    sw x1, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)

    # Testcase 8:  rd:x30(0x00000000), imm:0x1a, result rd:x30(0x00000000)
    li x30, MASK_XLEN(0x0)
    c.slli x30, 0x1a
    sw x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0)


    

    RVTEST_SIGBASE(x1,signature_4_0)


    # Testcase 9:  rd:x6(0x00000000), imm:0x1e, result rd:x6(0x00000000)
    li x6, MASK_XLEN(0x0)
    c.slli x6, 0x1e
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0)

    # Testcase 10:  rd:x2(0x00000000), imm:0x1b, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x1b
    sw x2, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x0)

    # Testcase 11:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1f
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_5_0)


    # Testcase 12:  rd:x5(0x00000000), imm:0x7, result rd:x5(0x00000000)
    li x5, MASK_XLEN(0x0)
    c.slli x5, 0x7
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0)

    # Testcase 13:  rd:x12(0x00000000), imm:0x7, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0x7
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 14:  rd:x26(0x00000000), imm:0x1f, result rd:x26(0x00000000)
    li x26, MASK_XLEN(0x0)
    c.slli x26, 0x1f
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0)


    

    RVTEST_SIGBASE(x1,signature_6_0)


    # Testcase 15:  rd:x3(0x00000000), imm:0x11, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x11
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0)

    # Testcase 16:  rd:x19(0x00000000), imm:0x14, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0x14
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)

    # Testcase 17:  rd:x19(0x00000000), imm:0x14, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0x14
    sw x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)


    

    RVTEST_SIGBASE(x2,signature_7_0)


    # Testcase 18:  rd:x8(0x00000000), imm:0x19, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x19
    sw x8, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0)

    # Testcase 19:  rd:x10(0x00000000), imm:0x1, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0x1
    sw x10, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0)

    # Testcase 20:  rd:x1(0x00000000), imm:0x12, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x12
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)


    

    RVTEST_SIGBASE(x2,signature_8_0)


    # Testcase 21:  rd:x18(0x00000000), imm:0x1e, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0x1e
    sw x18, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0)

    # Testcase 22:  rd:x24(0x00000000), imm:0x5, result rd:x24(0x00000000)
    li x24, MASK_XLEN(0x0)
    c.slli x24, 0x5
    sw x24, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0)

    # Testcase 23:  rd:x1(0x00000000), imm:0xe, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0xe
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)


    

    RVTEST_SIGBASE(x1,signature_9_0)


    # Testcase 24:  rd:x22(0x00000000), imm:0x1d, result rd:x22(0x00000000)
    li x22, MASK_XLEN(0x0)
    c.slli x22, 0x1d
    sw x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0)

    # Testcase 25:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x10
    sw x2, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x0)

    # Testcase 26:  rd:x31(0x00000000), imm:0x15, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0x15
    sw x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0)


    

    RVTEST_SIGBASE(x2,signature_10_0)


    # Testcase 27:  rd:x1(0x00000000), imm:0x11, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x11
    sw x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)

    # Testcase 28:  rd:x18(0x00000000), imm:0x10, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0x10
    sw x18, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0)

    # Testcase 29:  rd:x1(0x00000000), imm:0x18, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x18
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)


    

    RVTEST_SIGBASE(x1,signature_11_0)


    # Testcase 30:  rd:x7(0x00000000), imm:0x1, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.slli x7, 0x1
    sw x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)

    # Testcase 31:  rd:x12(0x00000000), imm:0x1f, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0x1f
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 32:  rd:x23(0x00000000), imm:0x1f, result rd:x23(0x00000000)
    li x23, MASK_XLEN(0x0)
    c.slli x23, 0x1f
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0)


    

    RVTEST_SIGBASE(x1,signature_12_0)


    # Testcase 33:  rd:x10(0x00000000), imm:0x1f, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0x1f
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 34:  rd:x3(0x00000000), imm:0x1, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x1
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0)

    # Testcase 35:  rd:x8(0x00000000), imm:0x1f, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1f
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_13_0)


    # Testcase 36:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1f
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 37:  rd:x8(0x00000000), imm:0x1, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 38:  rd:x4(0x00000000), imm:0x1, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0x1
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0)


    

    RVTEST_SIGBASE(x3,signature_14_0)


    # Testcase 39:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1f
    sw x14, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0)

    # Testcase 40:  rd:x1(0x00000000), imm:0x1, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x1
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x0)

    # Testcase 41:  rd:x2(0x00000000), imm:0x2, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x2
    sw x2, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0x0)


    

    RVTEST_SIGBASE(x1,signature_15_0)


    # Testcase 42:  rd:x3(0x00000000), imm:0x4, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x4
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0)

    # Testcase 43:  rd:x4(0x00000000), imm:0x8, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0x8
    sw x4, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0)

    # Testcase 44:  rd:x5(0x00000000), imm:0x10, result rd:x5(0x00000000)
    li x5, MASK_XLEN(0x0)
    c.slli x5, 0x10
    sw x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0)


    

    RVTEST_SIGBASE(x1,signature_16_0)


    # Testcase 45:  rd:x6(0x00000000), imm:0x1, result rd:x6(0x00000000)
    li x6, MASK_XLEN(0x0)
    c.slli x6, 0x1
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0)

    # Testcase 46:  rd:x7(0x00000000), imm:0x1e, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.slli x7, 0x1e
    sw x7, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)

    # Testcase 47:  rd:x8(0x00000000), imm:0x1d, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1d
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_17_0)


    # Testcase 48:  rd:x9(0x00000000), imm:0x1b, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.slli x9, 0x1b
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 49:  rd:x10(0x00000000), imm:0x17, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0x17
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 50:  rd:x11(0x00000000), imm:0xf, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.slli x11, 0xf
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)


    

    RVTEST_SIGBASE(x1,signature_18_0)


    # Testcase 51:  rd:x12(0x00000000), imm:0x1f, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0x1f
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 52:  rd:x13(0x00000000), imm:0x1e, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.slli x13, 0x1e
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 53:  rd:x14(0x00000000), imm:0x1d, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1d
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_19_0)


    # Testcase 54:  rd:x15(0x00000000), imm:0x1b, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.slli x15, 0x1b
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 55:  rd:x16(0x00000000), imm:0x17, result rd:x16(0x00000000)
    li x16, MASK_XLEN(0x0)
    c.slli x16, 0x17
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0)

    # Testcase 56:  rd:x17(0x00000000), imm:0xf, result rd:x17(0x00000000)
    li x17, MASK_XLEN(0x0)
    c.slli x17, 0xf
    sw x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0)


    

    RVTEST_SIGBASE(x1,signature_20_0)


    # Testcase 57:  rd:x18(0x00000000), imm:0x1f, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0x1f
    sw x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0)

    # Testcase 58:  rd:x19(0x00000000), imm:0x1e, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0x1e
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)

    # Testcase 59:  rd:x20(0x00000000), imm:0x1d, result rd:x20(0x00000000)
    li x20, MASK_XLEN(0x0)
    c.slli x20, 0x1d
    sw x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0)


    

    RVTEST_SIGBASE(x1,signature_21_0)


    # Testcase 60:  rd:x21(0x00000000), imm:0x1b, result rd:x21(0x00000000)
    li x21, MASK_XLEN(0x0)
    c.slli x21, 0x1b
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0)

    # Testcase 61:  rd:x22(0x00000000), imm:0x17, result rd:x22(0x00000000)
    li x22, MASK_XLEN(0x0)
    c.slli x22, 0x17
    sw x22, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0)

    # Testcase 62:  rd:x23(0x00000000), imm:0xf, result rd:x23(0x00000000)
    li x23, MASK_XLEN(0x0)
    c.slli x23, 0xf
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0)


    

    RVTEST_SIGBASE(x1,signature_22_0)


    # Testcase 63:  rd:x24(0x00000000), imm:0x1f, result rd:x24(0x00000000)
    li x24, MASK_XLEN(0x0)
    c.slli x24, 0x1f
    sw x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0)

    # Testcase 64:  rd:x25(0x00000000), imm:0x1e, result rd:x25(0x00000000)
    li x25, MASK_XLEN(0x0)
    c.slli x25, 0x1e
    sw x25, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0)

    # Testcase 65:  rd:x26(0x00000000), imm:0x1d, result rd:x26(0x00000000)
    li x26, MASK_XLEN(0x0)
    c.slli x26, 0x1d
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0)


    

    RVTEST_SIGBASE(x1,signature_23_0)


    # Testcase 66:  rd:x27(0x00000000), imm:0x1b, result rd:x27(0x00000000)
    li x27, MASK_XLEN(0x0)
    c.slli x27, 0x1b
    sw x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0)

    # Testcase 67:  rd:x28(0x00000000), imm:0x17, result rd:x28(0x00000000)
    li x28, MASK_XLEN(0x0)
    c.slli x28, 0x17
    sw x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0)

    # Testcase 68:  rd:x29(0x00000000), imm:0xf, result rd:x29(0x00000000)
    li x29, MASK_XLEN(0x0)
    c.slli x29, 0xf
    sw x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0)


    

    RVTEST_SIGBASE(x2,signature_24_0)


    # Testcase 69:  rd:x30(0x00000000), imm:0x1f, result rd:x30(0x00000000)
    li x30, MASK_XLEN(0x0)
    c.slli x30, 0x1f
    sw x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0)

    # Testcase 70:  rd:x31(0x00000000), imm:0x1e, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0x1e
    sw x31, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0)

    # Testcase 71:  rd:x1(0x00000000), imm:0x1d, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x1d
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)


    

    RVTEST_SIGBASE(x1,signature_25_0)


    # Testcase 72:  rd:x2(0x00000000), imm:0x1b, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x1b
    sw x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x0)

    # Testcase 73:  rd:x3(0x00000000), imm:0x17, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x17
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x0)

    # Testcase 74:  rd:x4(0x00000000), imm:0xf, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0xf
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x0)


    

    RVTEST_SIGBASE(x1,signature_26_0)


    # Testcase 75:  rd:x5(0x00000000), imm:0x1f, result rd:x5(0x00000000)
    li x5, MASK_XLEN(0x0)
    c.slli x5, 0x1f
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0)

    # Testcase 76:  rd:x6(0x00000000), imm:0x1e, result rd:x6(0x00000000)
    li x6, MASK_XLEN(0x0)
    c.slli x6, 0x1e
    sw x6, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0)

    # Testcase 77:  rd:x7(0x00000000), imm:0x1d, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.slli x7, 0x1d
    sw x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)


    

    RVTEST_SIGBASE(x1,signature_27_0)


    # Testcase 78:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1b
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 79:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.slli x9, 0x17
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 80:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0xf
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_28_0)


    # Testcase 81:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.slli x11, 0x1f
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 82:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0x1e
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 83:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.slli x13, 0x1d
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_29_0)


    # Testcase 84:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1b
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 85:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.slli x15, 0x17
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 86:  rd:x16(0x00000000), imm:0xf, result rd:x16(0x00000000)
    li x16, MASK_XLEN(0x0)
    c.slli x16, 0xf
    sw x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0)


    

    RVTEST_SIGBASE(x1,signature_30_0)


    # Testcase 87:  rd:x17(0x00000000), imm:0x1f, result rd:x17(0x00000000)
    li x17, MASK_XLEN(0x0)
    c.slli x17, 0x1f
    sw x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0)

    # Testcase 88:  rd:x18(0x00000000), imm:0x1e, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0x1e
    sw x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0)

    # Testcase 89:  rd:x19(0x00000000), imm:0x1d, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0x1d
    sw x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)


    

    RVTEST_SIGBASE(x1,signature_31_0)


    # Testcase 90:  rd:x20(0x00000000), imm:0x1b, result rd:x20(0x00000000)
    li x20, MASK_XLEN(0x0)
    c.slli x20, 0x1b
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0)

    # Testcase 91:  rd:x21(0x00000000), imm:0x17, result rd:x21(0x00000000)
    li x21, MASK_XLEN(0x0)
    c.slli x21, 0x17
    sw x21, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0)

    # Testcase 92:  rd:x22(0x00000000), imm:0xf, result rd:x22(0x00000000)
    li x22, MASK_XLEN(0x0)
    c.slli x22, 0xf
    sw x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0)


    

    RVTEST_SIGBASE(x1,signature_32_0)


    # Testcase 93:  rd:x23(0x00000000), imm:0x1f, result rd:x23(0x00000000)
    li x23, MASK_XLEN(0x0)
    c.slli x23, 0x1f
    sw x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0)

    # Testcase 94:  rd:x24(0x00000000), imm:0x1e, result rd:x24(0x00000000)
    li x24, MASK_XLEN(0x0)
    c.slli x24, 0x1e
    sw x24, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0)

    # Testcase 95:  rd:x25(0x00000000), imm:0x1d, result rd:x25(0x00000000)
    li x25, MASK_XLEN(0x0)
    c.slli x25, 0x1d
    sw x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0)


    

    RVTEST_SIGBASE(x1,signature_33_0)


    # Testcase 96:  rd:x26(0x00000000), imm:0x1b, result rd:x26(0x00000000)
    li x26, MASK_XLEN(0x0)
    c.slli x26, 0x1b
    sw x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0)

    # Testcase 97:  rd:x27(0x00000000), imm:0x17, result rd:x27(0x00000000)
    li x27, MASK_XLEN(0x0)
    c.slli x27, 0x17
    sw x27, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0)

    # Testcase 98:  rd:x28(0x00000000), imm:0xf, result rd:x28(0x00000000)
    li x28, MASK_XLEN(0x0)
    c.slli x28, 0xf
    sw x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0)


    

    RVTEST_SIGBASE(x1,signature_34_0)


    # Testcase 99:  rd:x29(0x00000000), imm:0x1f, result rd:x29(0x00000000)
    li x29, MASK_XLEN(0x0)
    c.slli x29, 0x1f
    sw x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0)

    # Testcase 100:  rd:x30(0x00000000), imm:0x1e, result rd:x30(0x00000000)
    li x30, MASK_XLEN(0x0)
    c.slli x30, 0x1e
    sw x30, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x0)

    # Testcase 101:  rd:x31(0x00000000), imm:0x1d, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0x1d
    sw x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x0)


    

    RVTEST_SIGBASE(x4,signature_35_0)


    # Testcase 102:  rd:x1(0x00000000), imm:0x1b, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x1b
    sw x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0)

    # Testcase 103:  rd:x2(0x00000000), imm:0x17, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x17
    sw x2, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x0)

    # Testcase 104:  rd:x3(0x00000000), imm:0x1, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x1
    sw x3, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x0)


    

    RVTEST_SIGBASE(x1,signature_36_0)


    # Testcase 105:  rd:x4(0x00000000), imm:0x2, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0x2
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0)

    # Testcase 106:  rd:x5(0x00000000), imm:0x4, result rd:x5(0x00000000)
    li x5, MASK_XLEN(0x0)
    c.slli x5, 0x4
    sw x5, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0)

    # Testcase 107:  rd:x6(0x00000000), imm:0x8, result rd:x6(0x00000000)
    li x6, MASK_XLEN(0x0)
    c.slli x6, 0x8
    sw x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0)


    

    RVTEST_SIGBASE(x1,signature_37_0)


    # Testcase 108:  rd:x7(0x00000000), imm:0x10, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.slli x7, 0x10
    sw x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)

    # Testcase 109:  rd:x8(0x00000000), imm:0x1, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 110:  rd:x9(0x00000000), imm:0x1e, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.slli x9, 0x1e
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_38_0)


    # Testcase 111:  rd:x10(0x00000000), imm:0x1d, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0x1d
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 112:  rd:x11(0x00000000), imm:0x1b, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.slli x11, 0x1b
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 113:  rd:x12(0x00000000), imm:0x17, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0x17
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)


    

    RVTEST_SIGBASE(x1,signature_39_0)


    # Testcase 114:  rd:x13(0x00000000), imm:0xf, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.slli x13, 0xf
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 115:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1f
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 116:  rd:x15(0x00000000), imm:0x1e, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.slli x15, 0x1e
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)


    

    RVTEST_SIGBASE(x1,signature_40_0)


    # Testcase 117:  rd:x16(0x00000000), imm:0x1d, result rd:x16(0x00000000)
    li x16, MASK_XLEN(0x0)
    c.slli x16, 0x1d
    sw x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0)

    # Testcase 118:  rd:x17(0x00000000), imm:0x1b, result rd:x17(0x00000000)
    li x17, MASK_XLEN(0x0)
    c.slli x17, 0x1b
    sw x17, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0)

    # Testcase 119:  rd:x18(0x00000000), imm:0x17, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0x17
    sw x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0)


    

    RVTEST_SIGBASE(x1,signature_41_0)


    # Testcase 120:  rd:x19(0x00000000), imm:0xf, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0xf
    sw x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)

    # Testcase 121:  rd:x20(0x00000000), imm:0x1f, result rd:x20(0x00000000)
    li x20, MASK_XLEN(0x0)
    c.slli x20, 0x1f
    sw x20, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0)

    # Testcase 122:  rd:x21(0x00000000), imm:0x1e, result rd:x21(0x00000000)
    li x21, MASK_XLEN(0x0)
    c.slli x21, 0x1e
    sw x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0)


    

    RVTEST_SIGBASE(x1,signature_42_0)


    # Testcase 123:  rd:x22(0x00000000), imm:0x1d, result rd:x22(0x00000000)
    li x22, MASK_XLEN(0x0)
    c.slli x22, 0x1d
    sw x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0)

    # Testcase 124:  rd:x23(0x00000000), imm:0x1b, result rd:x23(0x00000000)
    li x23, MASK_XLEN(0x0)
    c.slli x23, 0x1b
    sw x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0)

    # Testcase 125:  rd:x24(0x00000000), imm:0x17, result rd:x24(0x00000000)
    li x24, MASK_XLEN(0x0)
    c.slli x24, 0x17
    sw x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0)


    

    RVTEST_SIGBASE(x1,signature_43_0)


    # Testcase 126:  rd:x25(0x00000000), imm:0xf, result rd:x25(0x00000000)
    li x25, MASK_XLEN(0x0)
    c.slli x25, 0xf
    sw x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0)

    # Testcase 127:  rd:x26(0x00000000), imm:0x1f, result rd:x26(0x00000000)
    li x26, MASK_XLEN(0x0)
    c.slli x26, 0x1f
    sw x26, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0)

    # Testcase 128:  rd:x27(0x00000000), imm:0x1e, result rd:x27(0x00000000)
    li x27, MASK_XLEN(0x0)
    c.slli x27, 0x1e
    sw x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0)


    

    RVTEST_SIGBASE(x1,signature_44_0)


    # Testcase 129:  rd:x28(0x00000000), imm:0x1d, result rd:x28(0x00000000)
    li x28, MASK_XLEN(0x0)
    c.slli x28, 0x1d
    sw x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0)

    # Testcase 130:  rd:x29(0x00000000), imm:0x1b, result rd:x29(0x00000000)
    li x29, MASK_XLEN(0x0)
    c.slli x29, 0x1b
    sw x29, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0)

    # Testcase 131:  rd:x30(0x00000000), imm:0x17, result rd:x30(0x00000000)
    li x30, MASK_XLEN(0x0)
    c.slli x30, 0x17
    sw x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x0)


    

    RVTEST_SIGBASE(x3,signature_45_0)


    # Testcase 132:  rd:x31(0x00000000), imm:0xf, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0xf
    sw x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0)

    # Testcase 133:  rd:x1(0x00000000), imm:0x1f, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x1f
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x0)

    # Testcase 134:  rd:x2(0x00000000), imm:0x1e, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x1e
    sw x2, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0x0)


    

    RVTEST_SIGBASE(x1,signature_46_0)


    # Testcase 135:  rd:x3(0x00000000), imm:0x1d, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x1d
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0)

    # Testcase 136:  rd:x4(0x00000000), imm:0x1b, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0x1b
    sw x4, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0)

    # Testcase 137:  rd:x5(0x00000000), imm:0x17, result rd:x5(0x00000000)
    li x5, MASK_XLEN(0x0)
    c.slli x5, 0x17
    sw x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x0)


    

    RVTEST_SIGBASE(x1,signature_47_0)


    # Testcase 138:  rd:x6(0x00000000), imm:0xf, result rd:x6(0x00000000)
    li x6, MASK_XLEN(0x0)
    c.slli x6, 0xf
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0)

    # Testcase 139:  rd:x7(0x00000000), imm:0x1f, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.slli x7, 0x1f
    sw x7, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)

    # Testcase 140:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.slli x8, 0x1e
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_48_0)


    # Testcase 141:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.slli x9, 0x1d
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 142:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.slli x10, 0x1b
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 143:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.slli x11, 0x17
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)


    

    RVTEST_SIGBASE(x1,signature_49_0)


    # Testcase 144:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.slli x12, 0xf
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 145:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.slli x13, 0x1f
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 146:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.slli x14, 0x1e
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_50_0)


    # Testcase 147:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.slli x15, 0x1d
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 148:  rd:x16(0x00000000), imm:0x1b, result rd:x16(0x00000000)
    li x16, MASK_XLEN(0x0)
    c.slli x16, 0x1b
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x0)

    # Testcase 149:  rd:x17(0x00000000), imm:0x17, result rd:x17(0x00000000)
    li x17, MASK_XLEN(0x0)
    c.slli x17, 0x17
    sw x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x0)


    

    RVTEST_SIGBASE(x1,signature_51_0)


    # Testcase 150:  rd:x18(0x00000000), imm:0xf, result rd:x18(0x00000000)
    li x18, MASK_XLEN(0x0)
    c.slli x18, 0xf
    sw x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x0)

    # Testcase 151:  rd:x19(0x00000000), imm:0x1f, result rd:x19(0x00000000)
    li x19, MASK_XLEN(0x0)
    c.slli x19, 0x1f
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x0)

    # Testcase 152:  rd:x20(0x00000000), imm:0x1e, result rd:x20(0x00000000)
    li x20, MASK_XLEN(0x0)
    c.slli x20, 0x1e
    sw x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x0)


    

    RVTEST_SIGBASE(x1,signature_52_0)


    # Testcase 153:  rd:x21(0x00000000), imm:0x1d, result rd:x21(0x00000000)
    li x21, MASK_XLEN(0x0)
    c.slli x21, 0x1d
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x0)

    # Testcase 154:  rd:x22(0x00000000), imm:0x1b, result rd:x22(0x00000000)
    li x22, MASK_XLEN(0x0)
    c.slli x22, 0x1b
    sw x22, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x0)

    # Testcase 155:  rd:x23(0x00000000), imm:0x17, result rd:x23(0x00000000)
    li x23, MASK_XLEN(0x0)
    c.slli x23, 0x17
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x0)


    

    RVTEST_SIGBASE(x1,signature_53_0)


    # Testcase 156:  rd:x24(0x00000000), imm:0xf, result rd:x24(0x00000000)
    li x24, MASK_XLEN(0x0)
    c.slli x24, 0xf
    sw x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x0)

    # Testcase 157:  rd:x25(0x00000000), imm:0x1f, result rd:x25(0x00000000)
    li x25, MASK_XLEN(0x0)
    c.slli x25, 0x1f
    sw x25, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x0)

    # Testcase 158:  rd:x26(0x00000000), imm:0x1e, result rd:x26(0x00000000)
    li x26, MASK_XLEN(0x0)
    c.slli x26, 0x1e
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x0)


    

    RVTEST_SIGBASE(x1,signature_54_0)


    # Testcase 159:  rd:x27(0x00000000), imm:0x1d, result rd:x27(0x00000000)
    li x27, MASK_XLEN(0x0)
    c.slli x27, 0x1d
    sw x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x0)

    # Testcase 160:  rd:x28(0x00000000), imm:0x1b, result rd:x28(0x00000000)
    li x28, MASK_XLEN(0x0)
    c.slli x28, 0x1b
    sw x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x0)

    # Testcase 161:  rd:x29(0x00000000), imm:0x17, result rd:x29(0x00000000)
    li x29, MASK_XLEN(0x0)
    c.slli x29, 0x17
    sw x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x0)


    

    RVTEST_SIGBASE(x2,signature_55_0)


    # Testcase 162:  rd:x30(0x00000000), imm:0xf, result rd:x30(0x00000000)
    li x30, MASK_XLEN(0x0)
    c.slli x30, 0xf
    sw x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0)

    # Testcase 163:  rd:x31(0x00000000), imm:0x1f, result rd:x31(0x00000000)
    li x31, MASK_XLEN(0x0)
    c.slli x31, 0x1f
    sw x31, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x0)

    # Testcase 164:  rd:x1(0x00000000), imm:0x1e, result rd:x1(0x00000000)
    li x1, MASK_XLEN(0x0)
    c.slli x1, 0x1e
    sw x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x0)


    

    RVTEST_SIGBASE(x1,signature_56_0)


    # Testcase 165:  rd:x2(0x00000000), imm:0x1d, result rd:x2(0x00000000)
    li x2, MASK_XLEN(0x0)
    c.slli x2, 0x1d
    sw x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x0)

    # Testcase 166:  rd:x3(0x00000000), imm:0x1b, result rd:x3(0x00000000)
    li x3, MASK_XLEN(0x0)
    c.slli x3, 0x1b
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x0)

    # Testcase 167:  rd:x4(0x00000000), imm:0x17, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.slli x4, 0x17
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x0)
	
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

