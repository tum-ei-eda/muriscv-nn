// RISC-V Architectural Validation Test C-LI-01
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
// Description: Testing instruction 'c.li'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.li)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.li)

    RVTEST_SIGBASE(x1,signature_1_0)


    # Testcase 0:  rd:x20(0x00000000), imm:0xf, result rd:x20(0x0000000f)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0xf)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xf)

    # Testcase 1:  rd:x29(0x00000000), imm:0x7, result rd:x29(0x00000007)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x7)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x7)

    # Testcase 2:  rd:x31(0x00000000), imm:0x1d, result rd:x31(0x0000001d)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1d)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_2_0)


    # Testcase 3:  rd:x21(0x00000000), imm:0x11, result rd:x21(0x00000011)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x11)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x11)

    # Testcase 4:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x0000001d)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1d)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x1d)

    # Testcase 5:  rd:x2(0x00000000), imm:0x5, result rd:x2(0x00000005)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x5)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x5)


    

    RVTEST_SIGBASE(x2,signature_3_0)


    # Testcase 6:  rd:x4(0x00000000), imm:0xf, result rd:x4(0x0000000f)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0xf)
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf)

    # Testcase 7:  rd:x1(0x00000000), imm:0x4, result rd:x1(0x00000004)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x4)
    sd x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x4)

    # Testcase 8:  rd:x30(0x00000000), imm:0x1a, result rd:x30(0x0000001a)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1a)
    sd x30, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x1a)


    

    RVTEST_SIGBASE(x1,signature_4_0)


    # Testcase 9:  rd:x6(0x00000000), imm:0x1e, result rd:x6(0x0000001e)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1e)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x1e)

    # Testcase 10:  rd:x2(0x00000000), imm:0x1b, result rd:x2(0x0000001b)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x1b)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b)

    # Testcase 11:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x0000001f)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1f)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x1f)


    

    RVTEST_SIGBASE(x1,signature_5_0)


    # Testcase 12:  rd:x5(0x00000000), imm:0x7, result rd:x5(0x00000007)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x7)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x7)

    # Testcase 13:  rd:x12(0x00000000), imm:0x7, result rd:x12(0x00000007)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x7)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x7)

    # Testcase 14:  rd:x26(0x00000000), imm:0x1f, result rd:x26(0x0000001f)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1f)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1f)


    

    RVTEST_SIGBASE(x1,signature_6_0)


    # Testcase 15:  rd:x3(0x00000000), imm:0x11, result rd:x3(0x00000011)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x11)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x11)

    # Testcase 16:  rd:x19(0x00000000), imm:0x14, result rd:x19(0x00000014)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x14)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x14)

    # Testcase 17:  rd:x19(0x00000000), imm:0x14, result rd:x19(0x00000014)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x14)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x14)


    

    RVTEST_SIGBASE(x2,signature_7_0)


    # Testcase 18:  rd:x8(0x00000000), imm:0x19, result rd:x8(0x00000019)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x19)
    sd x8, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x19)

    # Testcase 19:  rd:x10(0x00000000), imm:0x0, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x0)
    sd x10, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0)

    # Testcase 20:  rd:x1(0x00000000), imm:0x12, result rd:x1(0x00000012)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x12)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x12)


    

    RVTEST_SIGBASE(x2,signature_8_0)


    # Testcase 21:  rd:x18(0x00000000), imm:0x1e, result rd:x18(0x0000001e)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x1e)
    sd x18, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x1e)

    # Testcase 22:  rd:x24(0x00000000), imm:0x5, result rd:x24(0x00000005)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x5)
    sd x24, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x5)

    # Testcase 23:  rd:x1(0x00000000), imm:0xe, result rd:x1(0x0000000e)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0xe)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xe)


    

    RVTEST_SIGBASE(x1,signature_9_0)


    # Testcase 24:  rd:x22(0x00000000), imm:0x1d, result rd:x22(0x0000001d)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x1d)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x1d)

    # Testcase 25:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x10)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 26:  rd:x31(0x00000000), imm:0x15, result rd:x31(0x00000015)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x15)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x15)


    

    RVTEST_SIGBASE(x2,signature_10_0)


    # Testcase 27:  rd:x1(0x00000000), imm:0x11, result rd:x1(0x00000011)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x11)
    sd x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x11)

    # Testcase 28:  rd:x18(0x00000000), imm:0x10, result rd:x18(0x00000010)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x10)
    sd x18, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x10)

    # Testcase 29:  rd:x1(0x00000000), imm:0x18, result rd:x1(0x00000018)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x18)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x18)


    

    RVTEST_SIGBASE(x1,signature_11_0)


    # Testcase 30:  rd:x7(0x00000000), imm:0x0, result rd:x7(0x00000000)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x0)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)

    # Testcase 31:  rd:x12(0x00000000), imm:0x1f, result rd:x12(0x0000001f)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x1f)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1f)

    # Testcase 32:  rd:x23(0x00000000), imm:0x1f, result rd:x23(0x0000001f)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x1f)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1f)


    

    RVTEST_SIGBASE(x1,signature_12_0)


    # Testcase 33:  rd:x10(0x00000000), imm:0x1f, result rd:x10(0x0000001f)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1f)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1f)

    # Testcase 34:  rd:x3(0x00000000), imm:0x1, result rd:x3(0x00000001)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x1)

    # Testcase 35:  rd:x8(0x00000000), imm:0x1f, result rd:x8(0x0000001f)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1f)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1f)


    

    RVTEST_SIGBASE(x1,signature_13_0)


    # Testcase 36:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x0000001f)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1f)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1f)

    # Testcase 37:  rd:x8(0x00000000), imm:0x0, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x0)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 38:  rd:x4(0x00000000), imm:0x0, result rd:x4(0x00000000)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x0)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x0)


    

    RVTEST_SIGBASE(x3,signature_14_0)


    # Testcase 39:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x0000001f)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1f)
    sd x14, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x1f)

    # Testcase 40:  rd:x1(0x00000000), imm:0x1, result rd:x1(0x00000001)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x1)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x1)

    # Testcase 41:  rd:x2(0x00000000), imm:0x2, result rd:x2(0x00000002)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x2)
    sd x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0x2)


    

    RVTEST_SIGBASE(x1,signature_15_0)


    # Testcase 42:  rd:x3(0x00000000), imm:0x4, result rd:x3(0x00000004)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x4)

    # Testcase 43:  rd:x4(0x00000000), imm:0x8, result rd:x4(0x00000008)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x8)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x8)

    # Testcase 44:  rd:x5(0x00000000), imm:0x10, result rd:x5(0x00000010)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x10)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x10)


    

    RVTEST_SIGBASE(x1,signature_16_0)


    # Testcase 45:  rd:x6(0x00000000), imm:0x1e, result rd:x6(0x0000001e)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1e)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x1e)

    # Testcase 46:  rd:x7(0x00000000), imm:0x1d, result rd:x7(0x0000001d)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x1d)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1d)

    # Testcase 47:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x0000001b)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1b)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_17_0)


    # Testcase 48:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000017)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x17)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x17)

    # Testcase 49:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x0000000f)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0xf)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xf)

    # Testcase 50:  rd:x11(0x00000000), imm:0x1e, result rd:x11(0x0000001e)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1e)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_18_0)


    # Testcase 51:  rd:x12(0x00000000), imm:0x1d, result rd:x12(0x0000001d)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x1d)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1d)

    # Testcase 52:  rd:x13(0x00000000), imm:0x1b, result rd:x13(0x0000001b)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x1b)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1b)

    # Testcase 53:  rd:x14(0x00000000), imm:0x17, result rd:x14(0x00000017)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x17)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x17)


    

    RVTEST_SIGBASE(x1,signature_19_0)


    # Testcase 54:  rd:x15(0x00000000), imm:0xf, result rd:x15(0x0000000f)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0xf)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xf)

    # Testcase 55:  rd:x16(0x00000000), imm:0x1e, result rd:x16(0x0000001e)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x1e)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1e)

    # Testcase 56:  rd:x17(0x00000000), imm:0x1d, result rd:x17(0x0000001d)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x1d)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_20_0)


    # Testcase 57:  rd:x18(0x00000000), imm:0x1b, result rd:x18(0x0000001b)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x1b)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1b)

    # Testcase 58:  rd:x19(0x00000000), imm:0x17, result rd:x19(0x00000017)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x17)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x17)

    # Testcase 59:  rd:x20(0x00000000), imm:0xf, result rd:x20(0x0000000f)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0xf)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xf)


    

    RVTEST_SIGBASE(x1,signature_21_0)


    # Testcase 60:  rd:x21(0x00000000), imm:0x1e, result rd:x21(0x0000001e)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x1e)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1e)

    # Testcase 61:  rd:x22(0x00000000), imm:0x1d, result rd:x22(0x0000001d)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x1d)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1d)

    # Testcase 62:  rd:x23(0x00000000), imm:0x1b, result rd:x23(0x0000001b)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x1b)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_22_0)


    # Testcase 63:  rd:x24(0x00000000), imm:0x17, result rd:x24(0x00000017)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x17)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x17)

    # Testcase 64:  rd:x25(0x00000000), imm:0xf, result rd:x25(0x0000000f)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0xf)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xf)

    # Testcase 65:  rd:x26(0x00000000), imm:0x1e, result rd:x26(0x0000001e)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1e)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_23_0)


    # Testcase 66:  rd:x27(0x00000000), imm:0x1d, result rd:x27(0x0000001d)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x1d)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1d)

    # Testcase 67:  rd:x28(0x00000000), imm:0x1b, result rd:x28(0x0000001b)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x1b)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1b)

    # Testcase 68:  rd:x29(0x00000000), imm:0x17, result rd:x29(0x00000017)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x17)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x17)


    

    RVTEST_SIGBASE(x2,signature_24_0)


    # Testcase 69:  rd:x30(0x00000000), imm:0xf, result rd:x30(0x0000000f)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0xf)
    sd x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xf)

    # Testcase 70:  rd:x31(0x00000000), imm:0x1e, result rd:x31(0x0000001e)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1e)
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x1e)

    # Testcase 71:  rd:x1(0x00000000), imm:0x1d, result rd:x1(0x0000001d)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x1d)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_25_0)


    # Testcase 72:  rd:x2(0x00000000), imm:0x1b, result rd:x2(0x0000001b)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x1b)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x1b)

    # Testcase 73:  rd:x3(0x00000000), imm:0x17, result rd:x3(0x00000017)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x17)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x17)

    # Testcase 74:  rd:x4(0x00000000), imm:0xf, result rd:x4(0x0000000f)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0xf)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xf)


    

    RVTEST_SIGBASE(x1,signature_26_0)


    # Testcase 75:  rd:x5(0x00000000), imm:0x1e, result rd:x5(0x0000001e)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1e)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1e)

    # Testcase 76:  rd:x6(0x00000000), imm:0x1d, result rd:x6(0x0000001d)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1d)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x1d)

    # Testcase 77:  rd:x7(0x00000000), imm:0x1b, result rd:x7(0x0000001b)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x1b)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_27_0)


    # Testcase 78:  rd:x8(0x00000000), imm:0x17, result rd:x8(0x00000017)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x17)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x17)

    # Testcase 79:  rd:x9(0x00000000), imm:0xf, result rd:x9(0x0000000f)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0xf)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf)

    # Testcase 80:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x0000001e)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1e)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_28_0)


    # Testcase 81:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x0000001d)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1d)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d)

    # Testcase 82:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x0000001b)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x1b)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b)

    # Testcase 83:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000017)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x17)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17)


    

    RVTEST_SIGBASE(x1,signature_29_0)


    # Testcase 84:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x0000000f)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0xf)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf)

    # Testcase 85:  rd:x15(0x00000000), imm:0x1e, result rd:x15(0x0000001e)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1e)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e)

    # Testcase 86:  rd:x16(0x00000000), imm:0x1d, result rd:x16(0x0000001d)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x1d)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_30_0)


    # Testcase 87:  rd:x17(0x00000000), imm:0x1b, result rd:x17(0x0000001b)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x1b)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b)

    # Testcase 88:  rd:x18(0x00000000), imm:0x17, result rd:x18(0x00000017)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x17)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17)

    # Testcase 89:  rd:x19(0x00000000), imm:0xf, result rd:x19(0x0000000f)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0xf)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf)


    

    RVTEST_SIGBASE(x1,signature_31_0)


    # Testcase 90:  rd:x20(0x00000000), imm:0x1e, result rd:x20(0x0000001e)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1e)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e)

    # Testcase 91:  rd:x21(0x00000000), imm:0x1d, result rd:x21(0x0000001d)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x1d)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d)

    # Testcase 92:  rd:x22(0x00000000), imm:0x1b, result rd:x22(0x0000001b)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x1b)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_32_0)


    # Testcase 93:  rd:x23(0x00000000), imm:0x17, result rd:x23(0x00000017)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x17)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17)

    # Testcase 94:  rd:x24(0x00000000), imm:0xf, result rd:x24(0x0000000f)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0xf)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf)

    # Testcase 95:  rd:x25(0x00000000), imm:0x1e, result rd:x25(0x0000001e)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1e)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_33_0)


    # Testcase 96:  rd:x26(0x00000000), imm:0x1d, result rd:x26(0x0000001d)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1d)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d)

    # Testcase 97:  rd:x27(0x00000000), imm:0x1b, result rd:x27(0x0000001b)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x1b)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b)

    # Testcase 98:  rd:x28(0x00000000), imm:0x17, result rd:x28(0x00000017)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x17)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17)


    

    RVTEST_SIGBASE(x1,signature_34_0)


    # Testcase 99:  rd:x29(0x00000000), imm:0xf, result rd:x29(0x0000000f)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0xf)
    sd x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf)

    # Testcase 100:  rd:x30(0x00000000), imm:0x1e, result rd:x30(0x0000001e)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1e)
    sd x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e)

    # Testcase 101:  rd:x31(0x00000000), imm:0x1d, result rd:x31(0x0000001d)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1d)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d)


    

    RVTEST_SIGBASE(x4,signature_35_0)


    # Testcase 102:  rd:x1(0x00000000), imm:0x1b, result rd:x1(0x0000001b)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x1b)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x1b)

    # Testcase 103:  rd:x2(0x00000000), imm:0x17, result rd:x2(0x00000017)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x17)
    sd x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x17)

    # Testcase 104:  rd:x3(0x00000000), imm:0xf, result rd:x3(0x0000000f)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0xf)
    sd x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xf)


    

    RVTEST_SIGBASE(x1,signature_36_0)


    # Testcase 105:  rd:x4(0x00000000), imm:0x1e, result rd:x4(0x0000001e)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1e)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1e)

    # Testcase 106:  rd:x5(0x00000000), imm:0x1d, result rd:x5(0x0000001d)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1d)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1d)

    # Testcase 107:  rd:x6(0x00000000), imm:0x1b, result rd:x6(0x0000001b)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1b)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_37_0)


    # Testcase 108:  rd:x7(0x00000000), imm:0x17, result rd:x7(0x00000017)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x17)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x17)

    # Testcase 109:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x0000000f)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0xf)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xf)

    # Testcase 110:  rd:x9(0x00000000), imm:0x1e, result rd:x9(0x0000001e)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x1e)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_38_0)


    # Testcase 111:  rd:x10(0x00000000), imm:0x1d, result rd:x10(0x0000001d)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1d)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1d)

    # Testcase 112:  rd:x11(0x00000000), imm:0x1b, result rd:x11(0x0000001b)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1b)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1b)

    # Testcase 113:  rd:x12(0x00000000), imm:0x17, result rd:x12(0x00000017)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x17)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x17)


    

    RVTEST_SIGBASE(x1,signature_39_0)


    # Testcase 114:  rd:x13(0x00000000), imm:0xf, result rd:x13(0x0000000f)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0xf)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xf)

    # Testcase 115:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x0000001e)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1e)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1e)

    # Testcase 116:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x0000001d)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1d)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_40_0)


    # Testcase 117:  rd:x16(0x00000000), imm:0x1b, result rd:x16(0x0000001b)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x1b)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1b)

    # Testcase 118:  rd:x17(0x00000000), imm:0x17, result rd:x17(0x00000017)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x17)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x17)

    # Testcase 119:  rd:x18(0x00000000), imm:0xf, result rd:x18(0x0000000f)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0xf)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xf)


    

    RVTEST_SIGBASE(x1,signature_41_0)


    # Testcase 120:  rd:x19(0x00000000), imm:0x1e, result rd:x19(0x0000001e)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x1e)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1e)

    # Testcase 121:  rd:x20(0x00000000), imm:0x1d, result rd:x20(0x0000001d)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1d)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1d)

    # Testcase 122:  rd:x21(0x00000000), imm:0x1b, result rd:x21(0x0000001b)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x1b)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_42_0)


    # Testcase 123:  rd:x22(0x00000000), imm:0x17, result rd:x22(0x00000017)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x17)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x17)

    # Testcase 124:  rd:x23(0x00000000), imm:0xf, result rd:x23(0x0000000f)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0xf)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xf)

    # Testcase 125:  rd:x24(0x00000000), imm:0x1e, result rd:x24(0x0000001e)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x1e)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_43_0)


    # Testcase 126:  rd:x25(0x00000000), imm:0x1d, result rd:x25(0x0000001d)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1d)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1d)

    # Testcase 127:  rd:x26(0x00000000), imm:0x1b, result rd:x26(0x0000001b)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1b)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1b)

    # Testcase 128:  rd:x27(0x00000000), imm:0x17, result rd:x27(0x00000017)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x17)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x17)


    

    RVTEST_SIGBASE(x1,signature_44_0)


    # Testcase 129:  rd:x28(0x00000000), imm:0xf, result rd:x28(0x0000000f)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0xf)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xf)

    # Testcase 130:  rd:x29(0x00000000), imm:0x1e, result rd:x29(0x0000001e)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x1e)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1e)

    # Testcase 131:  rd:x30(0x00000000), imm:0x1d, result rd:x30(0x0000001d)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1d)
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1d)


    

    RVTEST_SIGBASE(x3,signature_45_0)


    # Testcase 132:  rd:x31(0x00000000), imm:0x1b, result rd:x31(0x0000001b)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1b)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x1b)

    # Testcase 133:  rd:x1(0x00000000), imm:0x17, result rd:x1(0x00000017)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x17)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x17)

    # Testcase 134:  rd:x2(0x00000000), imm:0xf, result rd:x2(0x0000000f)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0xf)
    sd x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xf)


    

    RVTEST_SIGBASE(x1,signature_46_0)


    # Testcase 135:  rd:x3(0x00000000), imm:0x1e, result rd:x3(0x0000001e)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1e)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x1e)

    # Testcase 136:  rd:x4(0x00000000), imm:0x1d, result rd:x4(0x0000001d)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1d)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1d)

    # Testcase 137:  rd:x5(0x00000000), imm:0x1b, result rd:x5(0x0000001b)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1b)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_47_0)


    # Testcase 138:  rd:x6(0x00000000), imm:0x17, result rd:x6(0x00000017)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x17)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x17)

    # Testcase 139:  rd:x7(0x00000000), imm:0xf, result rd:x7(0x0000000f)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0xf)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xf)

    # Testcase 140:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x0000001e)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1e)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_48_0)


    # Testcase 141:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x0000001d)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x1d)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1d)

    # Testcase 142:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x0000001b)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1b)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1b)

    # Testcase 143:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000017)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x17)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x17)


    

    RVTEST_SIGBASE(x1,signature_49_0)


    # Testcase 144:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x0000000f)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0xf)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xf)

    # Testcase 145:  rd:x13(0x00000000), imm:0x1e, result rd:x13(0x0000001e)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x1e)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1e)

    # Testcase 146:  rd:x14(0x00000000), imm:0x1d, result rd:x14(0x0000001d)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1d)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_50_0)


    # Testcase 147:  rd:x15(0x00000000), imm:0x1b, result rd:x15(0x0000001b)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1b)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1b)

    # Testcase 148:  rd:x16(0x00000000), imm:0x17, result rd:x16(0x00000017)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x17)

    # Testcase 149:  rd:x17(0x00000000), imm:0xf, result rd:x17(0x0000000f)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0xf)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xf)


    

    RVTEST_SIGBASE(x1,signature_51_0)


    # Testcase 150:  rd:x18(0x00000000), imm:0x1e, result rd:x18(0x0000001e)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x1e)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1e)

    # Testcase 151:  rd:x19(0x00000000), imm:0x1d, result rd:x19(0x0000001d)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x1d)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1d)

    # Testcase 152:  rd:x20(0x00000000), imm:0x1b, result rd:x20(0x0000001b)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1b)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_52_0)


    # Testcase 153:  rd:x21(0x00000000), imm:0x17, result rd:x21(0x00000017)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x17)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x17)

    # Testcase 154:  rd:x22(0x00000000), imm:0xf, result rd:x22(0x0000000f)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0xf)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xf)

    # Testcase 155:  rd:x23(0x00000000), imm:0x1e, result rd:x23(0x0000001e)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x1e)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_53_0)


    # Testcase 156:  rd:x24(0x00000000), imm:0x1d, result rd:x24(0x0000001d)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x1d)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1d)

    # Testcase 157:  rd:x25(0x00000000), imm:0x1b, result rd:x25(0x0000001b)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1b)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1b)

    # Testcase 158:  rd:x26(0x00000000), imm:0x17, result rd:x26(0x00000017)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x17)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x17)


    

    RVTEST_SIGBASE(x1,signature_54_0)


    # Testcase 159:  rd:x27(0x00000000), imm:0xf, result rd:x27(0x0000000f)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0xf)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xf)

    # Testcase 160:  rd:x28(0x00000000), imm:0x1e, result rd:x28(0x0000001e)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x1e)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1e)

    # Testcase 161:  rd:x29(0x00000000), imm:0x1d, result rd:x29(0x0000001d)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x1d)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1d)


    

    RVTEST_SIGBASE(x2,signature_55_0)


    # Testcase 162:  rd:x30(0x00000000), imm:0x1b, result rd:x30(0x0000001b)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1b)
    sd x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x1b)

    # Testcase 163:  rd:x31(0x00000000), imm:0x17, result rd:x31(0x00000017)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x17)
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x17)

    # Testcase 164:  rd:x1(0x00000000), imm:0xf, result rd:x1(0x0000000f)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0xf)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xf)


    

    RVTEST_SIGBASE(x1,signature_56_0)


    # Testcase 165:  rd:x2(0x00000000), imm:0x1e, result rd:x2(0x0000001e)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x1e)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x1e)

    # Testcase 166:  rd:x3(0x00000000), imm:0x1d, result rd:x3(0x0000001d)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1d)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x1d)

    # Testcase 167:  rd:x4(0x00000000), imm:0x1b, result rd:x4(0x0000001b)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1b)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_57_0)


    # Testcase 168:  rd:x5(0x00000000), imm:0x1, result rd:x5(0x00000001)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1)

    # Testcase 169:  rd:x6(0x00000000), imm:0x2, result rd:x6(0x00000002)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x2)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x2)

    # Testcase 170:  rd:x7(0x00000000), imm:0x4, result rd:x7(0x00000004)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x4)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x4)


    

    RVTEST_SIGBASE(x1,signature_58_0)


    # Testcase 171:  rd:x8(0x00000000), imm:0x8, result rd:x8(0x00000008)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x8)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x8)

    # Testcase 172:  rd:x9(0x00000000), imm:0x10, result rd:x9(0x00000010)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x10)

    # Testcase 173:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x0000001e)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1e)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_59_0)


    # Testcase 174:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x0000001d)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1d)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d)

    # Testcase 175:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x0000001b)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x1b)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b)

    # Testcase 176:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000017)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x17)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17)


    

    RVTEST_SIGBASE(x1,signature_60_0)


    # Testcase 177:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x0000000f)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0xf)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf)

    # Testcase 178:  rd:x15(0x00000000), imm:0x1e, result rd:x15(0x0000001e)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1e)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e)

    # Testcase 179:  rd:x16(0x00000000), imm:0x1d, result rd:x16(0x0000001d)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x1d)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_61_0)


    # Testcase 180:  rd:x17(0x00000000), imm:0x1b, result rd:x17(0x0000001b)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x1b)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b)

    # Testcase 181:  rd:x18(0x00000000), imm:0x17, result rd:x18(0x00000017)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x17)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17)

    # Testcase 182:  rd:x19(0x00000000), imm:0xf, result rd:x19(0x0000000f)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0xf)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf)


    

    RVTEST_SIGBASE(x1,signature_62_0)


    # Testcase 183:  rd:x20(0x00000000), imm:0x1e, result rd:x20(0x0000001e)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1e)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e)

    # Testcase 184:  rd:x21(0x00000000), imm:0x1d, result rd:x21(0x0000001d)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x1d)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d)

    # Testcase 185:  rd:x22(0x00000000), imm:0x1b, result rd:x22(0x0000001b)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x1b)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_63_0)


    # Testcase 186:  rd:x23(0x00000000), imm:0x17, result rd:x23(0x00000017)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x17)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17)

    # Testcase 187:  rd:x24(0x00000000), imm:0xf, result rd:x24(0x0000000f)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0xf)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf)

    # Testcase 188:  rd:x25(0x00000000), imm:0x1e, result rd:x25(0x0000001e)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1e)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_64_0)


    # Testcase 189:  rd:x26(0x00000000), imm:0x1d, result rd:x26(0x0000001d)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1d)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d)

    # Testcase 190:  rd:x27(0x00000000), imm:0x1b, result rd:x27(0x0000001b)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x1b)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b)

    # Testcase 191:  rd:x28(0x00000000), imm:0x17, result rd:x28(0x00000017)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x17)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17)


    

    RVTEST_SIGBASE(x1,signature_65_0)


    # Testcase 192:  rd:x29(0x00000000), imm:0xf, result rd:x29(0x0000000f)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0xf)
    sd x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf)

    # Testcase 193:  rd:x30(0x00000000), imm:0x1e, result rd:x30(0x0000001e)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1e)
    sd x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e)

    # Testcase 194:  rd:x31(0x00000000), imm:0x1d, result rd:x31(0x0000001d)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1d)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d)


    

    RVTEST_SIGBASE(x4,signature_66_0)


    # Testcase 195:  rd:x1(0x00000000), imm:0x1b, result rd:x1(0x0000001b)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x1b)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x1b)

    # Testcase 196:  rd:x2(0x00000000), imm:0x17, result rd:x2(0x00000017)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x17)
    sd x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x17)

    # Testcase 197:  rd:x3(0x00000000), imm:0xf, result rd:x3(0x0000000f)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0xf)
    sd x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xf)


    

    RVTEST_SIGBASE(x1,signature_67_0)


    # Testcase 198:  rd:x4(0x00000000), imm:0x1e, result rd:x4(0x0000001e)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1e)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1e)

    # Testcase 199:  rd:x5(0x00000000), imm:0x1d, result rd:x5(0x0000001d)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1d)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1d)

    # Testcase 200:  rd:x6(0x00000000), imm:0x1b, result rd:x6(0x0000001b)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1b)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_68_0)


    # Testcase 201:  rd:x7(0x00000000), imm:0x17, result rd:x7(0x00000017)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x17)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x17)

    # Testcase 202:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x0000000f)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0xf)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xf)

    # Testcase 203:  rd:x9(0x00000000), imm:0x1e, result rd:x9(0x0000001e)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x1e)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_69_0)


    # Testcase 204:  rd:x10(0x00000000), imm:0x1d, result rd:x10(0x0000001d)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1d)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1d)

    # Testcase 205:  rd:x11(0x00000000), imm:0x1b, result rd:x11(0x0000001b)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x1b)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1b)

    # Testcase 206:  rd:x12(0x00000000), imm:0x17, result rd:x12(0x00000017)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x17)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x17)


    

    RVTEST_SIGBASE(x1,signature_70_0)


    # Testcase 207:  rd:x13(0x00000000), imm:0xf, result rd:x13(0x0000000f)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0xf)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xf)

    # Testcase 208:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x0000001e)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1e)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1e)

    # Testcase 209:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x0000001d)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1d)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_71_0)


    # Testcase 210:  rd:x16(0x00000000), imm:0x1b, result rd:x16(0x0000001b)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x1b)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1b)

    # Testcase 211:  rd:x17(0x00000000), imm:0x17, result rd:x17(0x00000017)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x17)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x17)

    # Testcase 212:  rd:x18(0x00000000), imm:0xf, result rd:x18(0x0000000f)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0xf)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xf)


    

    RVTEST_SIGBASE(x1,signature_72_0)


    # Testcase 213:  rd:x19(0x00000000), imm:0x1e, result rd:x19(0x0000001e)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x1e)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1e)

    # Testcase 214:  rd:x20(0x00000000), imm:0x1d, result rd:x20(0x0000001d)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1d)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1d)

    # Testcase 215:  rd:x21(0x00000000), imm:0x1b, result rd:x21(0x0000001b)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x1b)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_73_0)


    # Testcase 216:  rd:x22(0x00000000), imm:0x17, result rd:x22(0x00000017)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x17)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x17)

    # Testcase 217:  rd:x23(0x00000000), imm:0xf, result rd:x23(0x0000000f)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0xf)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xf)

    # Testcase 218:  rd:x24(0x00000000), imm:0x1e, result rd:x24(0x0000001e)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x1e)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_74_0)


    # Testcase 219:  rd:x25(0x00000000), imm:0x1d, result rd:x25(0x0000001d)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1d)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1d)

    # Testcase 220:  rd:x26(0x00000000), imm:0x1b, result rd:x26(0x0000001b)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x1b)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1b)

    # Testcase 221:  rd:x27(0x00000000), imm:0x17, result rd:x27(0x00000017)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x17)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x17)


    

    RVTEST_SIGBASE(x1,signature_75_0)


    # Testcase 222:  rd:x28(0x00000000), imm:0xf, result rd:x28(0x0000000f)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0xf)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xf)

    # Testcase 223:  rd:x29(0x00000000), imm:0x1e, result rd:x29(0x0000001e)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x1e)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1e)

    # Testcase 224:  rd:x30(0x00000000), imm:0x1d, result rd:x30(0x0000001d)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1d)
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1d)


    

    RVTEST_SIGBASE(x3,signature_76_0)


    # Testcase 225:  rd:x31(0x00000000), imm:0x1b, result rd:x31(0x0000001b)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x1b)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x1b)

    # Testcase 226:  rd:x1(0x00000000), imm:0x17, result rd:x1(0x00000017)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x17)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x17)

    # Testcase 227:  rd:x2(0x00000000), imm:0xf, result rd:x2(0x0000000f)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0xf)
    sd x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xf)


    

    RVTEST_SIGBASE(x1,signature_77_0)


    # Testcase 228:  rd:x3(0x00000000), imm:0x1e, result rd:x3(0x0000001e)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1e)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x1e)

    # Testcase 229:  rd:x4(0x00000000), imm:0x1d, result rd:x4(0x0000001d)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1d)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1d)

    # Testcase 230:  rd:x5(0x00000000), imm:0x1b, result rd:x5(0x0000001b)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x1b)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_78_0)


    # Testcase 231:  rd:x6(0x00000000), imm:0x17, result rd:x6(0x00000017)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x17)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x17)

    # Testcase 232:  rd:x7(0x00000000), imm:0xf, result rd:x7(0x0000000f)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0xf)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xf)

    # Testcase 233:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x0000001e)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1e)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_79_0)


    # Testcase 234:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x0000001d)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x1d)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1d)

    # Testcase 235:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x0000001b)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x1b)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1b)

    # Testcase 236:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000017)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0x17)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x17)


    

    RVTEST_SIGBASE(x1,signature_80_0)


    # Testcase 237:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x0000000f)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0xf)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xf)

    # Testcase 238:  rd:x13(0x00000000), imm:0x1e, result rd:x13(0x0000001e)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x1e)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1e)

    # Testcase 239:  rd:x14(0x00000000), imm:0x1d, result rd:x14(0x0000001d)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1d)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_81_0)


    # Testcase 240:  rd:x15(0x00000000), imm:0x1b, result rd:x15(0x0000001b)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x1b)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1b)

    # Testcase 241:  rd:x16(0x00000000), imm:0x17, result rd:x16(0x00000017)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x17)

    # Testcase 242:  rd:x17(0x00000000), imm:0xf, result rd:x17(0x0000000f)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0xf)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xf)


    

    RVTEST_SIGBASE(x1,signature_82_0)


    # Testcase 243:  rd:x18(0x00000000), imm:0x1e, result rd:x18(0x0000001e)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x1e)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1e)

    # Testcase 244:  rd:x19(0x00000000), imm:0x1d, result rd:x19(0x0000001d)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x1d)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1d)

    # Testcase 245:  rd:x20(0x00000000), imm:0x1b, result rd:x20(0x0000001b)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x1b)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_83_0)


    # Testcase 246:  rd:x21(0x00000000), imm:0x17, result rd:x21(0x00000017)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0x17)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x17)

    # Testcase 247:  rd:x22(0x00000000), imm:0xf, result rd:x22(0x0000000f)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0xf)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xf)

    # Testcase 248:  rd:x23(0x00000000), imm:0x1e, result rd:x23(0x0000001e)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x1e)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_84_0)


    # Testcase 249:  rd:x24(0x00000000), imm:0x1d, result rd:x24(0x0000001d)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x1d)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1d)

    # Testcase 250:  rd:x25(0x00000000), imm:0x1b, result rd:x25(0x0000001b)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x1b)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1b)

    # Testcase 251:  rd:x26(0x00000000), imm:0x17, result rd:x26(0x00000017)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0x17)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x17)


    

    RVTEST_SIGBASE(x1,signature_85_0)


    # Testcase 252:  rd:x27(0x00000000), imm:0xf, result rd:x27(0x0000000f)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0xf)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xf)

    # Testcase 253:  rd:x28(0x00000000), imm:0x1e, result rd:x28(0x0000001e)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x1e)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1e)

    # Testcase 254:  rd:x29(0x00000000), imm:0x1d, result rd:x29(0x0000001d)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x1d)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1d)


    

    RVTEST_SIGBASE(x2,signature_86_0)


    # Testcase 255:  rd:x30(0x00000000), imm:0x1b, result rd:x30(0x0000001b)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x1b)
    sd x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x1b)

    # Testcase 256:  rd:x31(0x00000000), imm:0x17, result rd:x31(0x00000017)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0x17)
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0x17)

    # Testcase 257:  rd:x1(0x00000000), imm:0xf, result rd:x1(0x0000000f)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0xf)
    sd x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xf)


    

    RVTEST_SIGBASE(x1,signature_87_0)


    # Testcase 258:  rd:x2(0x00000000), imm:0x1e, result rd:x2(0x0000001e)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x1e)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x1e)

    # Testcase 259:  rd:x3(0x00000000), imm:0x1d, result rd:x3(0x0000001d)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1d)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x1d)

    # Testcase 260:  rd:x4(0x00000000), imm:0x1b, result rd:x4(0x0000001b)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x1b)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_88_0)


    # Testcase 261:  rd:x5(0x00000000), imm:0x17, result rd:x5(0x00000017)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0x17)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x17)

    # Testcase 262:  rd:x6(0x00000000), imm:0xf, result rd:x6(0x0000000f)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0xf)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xf)

    # Testcase 263:  rd:x7(0x00000000), imm:0x1e, result rd:x7(0x0000001e)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x1e)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_89_0)


    # Testcase 264:  rd:x8(0x00000000), imm:0x1d, result rd:x8(0x0000001d)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1d)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d)

    # Testcase 265:  rd:x9(0x00000000), imm:0x1b, result rd:x9(0x0000001b)
    li x9, MASK_XLEN(0x0)
    c.li x9, SEXT_IMM(0x1b)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b)

    # Testcase 266:  rd:x10(0x00000000), imm:0x17, result rd:x10(0x00000017)
    li x10, MASK_XLEN(0x0)
    c.li x10, SEXT_IMM(0x17)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17)


    

    RVTEST_SIGBASE(x1,signature_90_0)


    # Testcase 267:  rd:x11(0x00000000), imm:0xf, result rd:x11(0x0000000f)
    li x11, MASK_XLEN(0x0)
    c.li x11, SEXT_IMM(0xf)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf)

    # Testcase 268:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x0000001e)
    li x12, MASK_XLEN(0x0)
    c.li x12, SEXT_IMM(0x1e)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e)

    # Testcase 269:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x0000001d)
    li x13, MASK_XLEN(0x0)
    c.li x13, SEXT_IMM(0x1d)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_91_0)


    # Testcase 270:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x0000001b)
    li x14, MASK_XLEN(0x0)
    c.li x14, SEXT_IMM(0x1b)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b)

    # Testcase 271:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000017)
    li x15, MASK_XLEN(0x0)
    c.li x15, SEXT_IMM(0x17)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17)

    # Testcase 272:  rd:x16(0x00000000), imm:0xf, result rd:x16(0x0000000f)
    li x16, MASK_XLEN(0x0)
    c.li x16, SEXT_IMM(0xf)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf)


    

    RVTEST_SIGBASE(x1,signature_92_0)


    # Testcase 273:  rd:x17(0x00000000), imm:0x1e, result rd:x17(0x0000001e)
    li x17, MASK_XLEN(0x0)
    c.li x17, SEXT_IMM(0x1e)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e)

    # Testcase 274:  rd:x18(0x00000000), imm:0x1d, result rd:x18(0x0000001d)
    li x18, MASK_XLEN(0x0)
    c.li x18, SEXT_IMM(0x1d)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d)

    # Testcase 275:  rd:x19(0x00000000), imm:0x1b, result rd:x19(0x0000001b)
    li x19, MASK_XLEN(0x0)
    c.li x19, SEXT_IMM(0x1b)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_93_0)


    # Testcase 276:  rd:x20(0x00000000), imm:0x17, result rd:x20(0x00000017)
    li x20, MASK_XLEN(0x0)
    c.li x20, SEXT_IMM(0x17)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17)

    # Testcase 277:  rd:x21(0x00000000), imm:0xf, result rd:x21(0x0000000f)
    li x21, MASK_XLEN(0x0)
    c.li x21, SEXT_IMM(0xf)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf)

    # Testcase 278:  rd:x22(0x00000000), imm:0x1e, result rd:x22(0x0000001e)
    li x22, MASK_XLEN(0x0)
    c.li x22, SEXT_IMM(0x1e)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_94_0)


    # Testcase 279:  rd:x23(0x00000000), imm:0x1d, result rd:x23(0x0000001d)
    li x23, MASK_XLEN(0x0)
    c.li x23, SEXT_IMM(0x1d)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d)

    # Testcase 280:  rd:x24(0x00000000), imm:0x1b, result rd:x24(0x0000001b)
    li x24, MASK_XLEN(0x0)
    c.li x24, SEXT_IMM(0x1b)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b)

    # Testcase 281:  rd:x25(0x00000000), imm:0x17, result rd:x25(0x00000017)
    li x25, MASK_XLEN(0x0)
    c.li x25, SEXT_IMM(0x17)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17)


    

    RVTEST_SIGBASE(x1,signature_95_0)


    # Testcase 282:  rd:x26(0x00000000), imm:0xf, result rd:x26(0x0000000f)
    li x26, MASK_XLEN(0x0)
    c.li x26, SEXT_IMM(0xf)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf)

    # Testcase 283:  rd:x27(0x00000000), imm:0x1e, result rd:x27(0x0000001e)
    li x27, MASK_XLEN(0x0)
    c.li x27, SEXT_IMM(0x1e)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e)

    # Testcase 284:  rd:x28(0x00000000), imm:0x1d, result rd:x28(0x0000001d)
    li x28, MASK_XLEN(0x0)
    c.li x28, SEXT_IMM(0x1d)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d)


    

    RVTEST_SIGBASE(x1,signature_96_0)


    # Testcase 285:  rd:x29(0x00000000), imm:0x1b, result rd:x29(0x0000001b)
    li x29, MASK_XLEN(0x0)
    c.li x29, SEXT_IMM(0x1b)
    sd x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b)

    # Testcase 286:  rd:x30(0x00000000), imm:0x17, result rd:x30(0x00000017)
    li x30, MASK_XLEN(0x0)
    c.li x30, SEXT_IMM(0x17)
    sd x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17)

    # Testcase 287:  rd:x31(0x00000000), imm:0xf, result rd:x31(0x0000000f)
    li x31, MASK_XLEN(0x0)
    c.li x31, SEXT_IMM(0xf)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf)


    

    RVTEST_SIGBASE(x4,signature_97_0)


    # Testcase 288:  rd:x1(0x00000000), imm:0x1e, result rd:x1(0x0000001e)
    li x1, MASK_XLEN(0x0)
    c.li x1, SEXT_IMM(0x1e)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x1e)

    # Testcase 289:  rd:x2(0x00000000), imm:0x1d, result rd:x2(0x0000001d)
    li x2, MASK_XLEN(0x0)
    c.li x2, SEXT_IMM(0x1d)
    sd x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x1d)

    # Testcase 290:  rd:x3(0x00000000), imm:0x1b, result rd:x3(0x0000001b)
    li x3, MASK_XLEN(0x0)
    c.li x3, SEXT_IMM(0x1b)
    sd x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x1b)


    

    RVTEST_SIGBASE(x1,signature_98_0)


    # Testcase 291:  rd:x4(0x00000000), imm:0x17, result rd:x4(0x00000017)
    li x4, MASK_XLEN(0x0)
    c.li x4, SEXT_IMM(0x17)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x17)

    # Testcase 292:  rd:x5(0x00000000), imm:0xf, result rd:x5(0x0000000f)
    li x5, MASK_XLEN(0x0)
    c.li x5, SEXT_IMM(0xf)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf)

    # Testcase 293:  rd:x6(0x00000000), imm:0x1e, result rd:x6(0x0000001e)
    li x6, MASK_XLEN(0x0)
    c.li x6, SEXT_IMM(0x1e)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x1e)


    

    RVTEST_SIGBASE(x1,signature_99_0)


    # Testcase 294:  rd:x7(0x00000000), imm:0x1d, result rd:x7(0x0000001d)
    li x7, MASK_XLEN(0x0)
    c.li x7, SEXT_IMM(0x1d)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1d)

    # Testcase 295:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x0000001b)
    li x8, MASK_XLEN(0x0)
    c.li x8, SEXT_IMM(0x1b)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1b)
	
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

