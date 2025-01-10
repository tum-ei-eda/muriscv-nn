// RISC-V Architectural Validation Test C-SRAI-01
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
// Description: Testing instruction 'c.srai'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.srai)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.srai)

    RVTEST_SIGBASE(x1,signature_1_0)


    # Testcase 0:  rd:x11(0x00000000), imm:0xf, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0xf
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 1:  rd:x12(0x00000000), imm:0x7, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x7
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 2:  rd:x14(0x00000000), imm:0x1d, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1d
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 3:  rd:x12(0x00000000), imm:0x11, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x11
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 4:  rd:x10(0x00000000), imm:0x1d, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1d
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_2_0)


    # Testcase 5:  rd:x8(0x00000000), imm:0x5, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x5
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 6:  rd:x11(0x00000000), imm:0xf, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0xf
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 7:  rd:x15(0x00000000), imm:0x4, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x4
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 8:  rd:x13(0x00000000), imm:0x1a, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1a
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 9:  rd:x13(0x00000000), imm:0x1e, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1e
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_3_0)


    # Testcase 10:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 11:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 12:  rd:x12(0x00000000), imm:0x7, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x7
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 13:  rd:x11(0x00000000), imm:0x7, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x7
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 14:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_4_0)


    # Testcase 15:  rd:x10(0x00000000), imm:0x11, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x11
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 16:  rd:x10(0x00000000), imm:0x14, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x14
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 17:  rd:x10(0x00000000), imm:0x14, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x14
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 18:  rd:x15(0x00000000), imm:0x19, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x19
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 19:  rd:x9(0x00000000), imm:0x1, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_5_0)


    # Testcase 20:  rd:x15(0x00000000), imm:0x12, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x12
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 21:  rd:x9(0x00000000), imm:0x1e, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1e
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 22:  rd:x15(0x00000000), imm:0x5, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x5
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 23:  rd:x15(0x00000000), imm:0xe, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0xe
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 24:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_6_0)


    # Testcase 25:  rd:x8(0x00000000), imm:0x10, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x10
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 26:  rd:x14(0x00000000), imm:0x15, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x15
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 27:  rd:x8(0x00000000), imm:0x11, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x11
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 28:  rd:x9(0x00000000), imm:0x10, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x10
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 29:  rd:x15(0x00000000), imm:0x18, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x18
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)


    

    RVTEST_SIGBASE(x1,signature_7_0)


    # Testcase 30:  rd:x14(0x00000000), imm:0x1, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 31:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 32:  rd:x14(0x00000000), imm:0x1f, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1f
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 33:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 34:  rd:x10(0x00000000), imm:0x1, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_8_0)


    # Testcase 35:  rd:x15(0x00000000), imm:0x1f, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1f
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 36:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 37:  rd:x15(0x00000000), imm:0x1, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 38:  rd:x11(0x00000000), imm:0x1, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 39:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_9_0)


    # Testcase 40:  rd:x8(0x00000000), imm:0x1, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 41:  rd:x9(0x00000000), imm:0x2, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x2
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 42:  rd:x10(0x00000000), imm:0x4, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x4
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 43:  rd:x11(0x00000000), imm:0x8, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x8
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 44:  rd:x12(0x00000000), imm:0x10, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x10
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)


    

    RVTEST_SIGBASE(x1,signature_10_0)


    # Testcase 45:  rd:x13(0x00000000), imm:0x1, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 46:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 47:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 48:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 49:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_11_0)


    # Testcase 50:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 51:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 52:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 53:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 54:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_12_0)


    # Testcase 55:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 56:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0xf
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 57:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 58:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1e
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 59:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1d
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)


    

    RVTEST_SIGBASE(x1,signature_13_0)


    # Testcase 60:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1b
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 61:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x17
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 62:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0xf
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 63:  rd:x15(0x00000000), imm:0x1f, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1f
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 64:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1e
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_14_0)


    # Testcase 65:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1d
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 66:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1b
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 67:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x17
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 68:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0xf
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 69:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_15_0)


    # Testcase 70:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 71:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 72:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 73:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 74:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_16_0)


    # Testcase 75:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 76:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 77:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 78:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 79:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)


    

    RVTEST_SIGBASE(x1,signature_17_0)


    # Testcase 80:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0xf
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 81:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 82:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1e
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 83:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1d
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 84:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1b
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)


    

    RVTEST_SIGBASE(x1,signature_18_0)


    # Testcase 85:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x17
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 86:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0xf
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 87:  rd:x15(0x00000000), imm:0x1f, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1f
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 88:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1e
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 89:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1d
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_19_0)


    # Testcase 90:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1b
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 91:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x17
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 92:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0xf
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 93:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 94:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_20_0)


    # Testcase 95:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 96:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 97:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 98:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 99:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)


    

    RVTEST_SIGBASE(x1,signature_21_0)


    # Testcase 100:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 101:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 102:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 103:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 104:  rd:x8(0x00000000), imm:0x1, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_22_0)


    # Testcase 105:  rd:x9(0x00000000), imm:0x2, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x2
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 106:  rd:x10(0x00000000), imm:0x4, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x4
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 107:  rd:x11(0x00000000), imm:0x8, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x8
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 108:  rd:x12(0x00000000), imm:0x10, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x10
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 109:  rd:x13(0x00000000), imm:0x1, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_23_0)


    # Testcase 110:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 111:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 112:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 113:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 114:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_24_0)


    # Testcase 115:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 116:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 117:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 118:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 119:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)


    

    RVTEST_SIGBASE(x1,signature_25_0)


    # Testcase 120:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0xf
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 121:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 122:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1e
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 123:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1d
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 124:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1b
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)


    

    RVTEST_SIGBASE(x1,signature_26_0)


    # Testcase 125:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x17
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 126:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0xf
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 127:  rd:x15(0x00000000), imm:0x1f, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1f
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 128:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1e
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 129:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1d
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)


    

    RVTEST_SIGBASE(x1,signature_27_0)


    # Testcase 130:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1b
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 131:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x17
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 132:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0xf
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 133:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 134:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)


    

    RVTEST_SIGBASE(x1,signature_28_0)


    # Testcase 135:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 136:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 137:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 138:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 139:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)


    

    RVTEST_SIGBASE(x1,signature_29_0)


    # Testcase 140:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 141:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 142:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 143:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 144:  rd:x8(0x00000000), imm:0xf, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0xf
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)


    

    RVTEST_SIGBASE(x1,signature_30_0)


    # Testcase 145:  rd:x9(0x00000000), imm:0x1f, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1f
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 146:  rd:x10(0x00000000), imm:0x1e, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1e
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 147:  rd:x11(0x00000000), imm:0x1d, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1d
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 148:  rd:x12(0x00000000), imm:0x1b, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1b
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 149:  rd:x13(0x00000000), imm:0x17, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x17
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)


    

    RVTEST_SIGBASE(x1,signature_31_0)


    # Testcase 150:  rd:x14(0x00000000), imm:0xf, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0xf
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 151:  rd:x15(0x00000000), imm:0x1f, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1f
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)

    # Testcase 152:  rd:x8(0x00000000), imm:0x1e, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1e
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 153:  rd:x9(0x00000000), imm:0x1d, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x1d
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 154:  rd:x10(0x00000000), imm:0x1b, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0x1b
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)


    

    RVTEST_SIGBASE(x1,signature_32_0)


    # Testcase 155:  rd:x11(0x00000000), imm:0x17, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x17
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 156:  rd:x12(0x00000000), imm:0xf, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0xf
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)

    # Testcase 157:  rd:x13(0x00000000), imm:0x1f, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1f
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 158:  rd:x14(0x00000000), imm:0x1e, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1e
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 159:  rd:x15(0x00000000), imm:0x1d, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x1d
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x0)


    

    RVTEST_SIGBASE(x1,signature_33_0)


    # Testcase 160:  rd:x8(0x00000000), imm:0x1b, result rd:x8(0x00000000)
    li x8, MASK_XLEN(0x0)
    c.srai x8, 0x1b
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x0)

    # Testcase 161:  rd:x9(0x00000000), imm:0x17, result rd:x9(0x00000000)
    li x9, MASK_XLEN(0x0)
    c.srai x9, 0x17
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0)

    # Testcase 162:  rd:x10(0x00000000), imm:0xf, result rd:x10(0x00000000)
    li x10, MASK_XLEN(0x0)
    c.srai x10, 0xf
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x0)

    # Testcase 163:  rd:x11(0x00000000), imm:0x1f, result rd:x11(0x00000000)
    li x11, MASK_XLEN(0x0)
    c.srai x11, 0x1f
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x0)

    # Testcase 164:  rd:x12(0x00000000), imm:0x1e, result rd:x12(0x00000000)
    li x12, MASK_XLEN(0x0)
    c.srai x12, 0x1e
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x0)


    

    RVTEST_SIGBASE(x1,signature_34_0)


    # Testcase 165:  rd:x13(0x00000000), imm:0x1d, result rd:x13(0x00000000)
    li x13, MASK_XLEN(0x0)
    c.srai x13, 0x1d
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x0)

    # Testcase 166:  rd:x14(0x00000000), imm:0x1b, result rd:x14(0x00000000)
    li x14, MASK_XLEN(0x0)
    c.srai x14, 0x1b
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x0)

    # Testcase 167:  rd:x15(0x00000000), imm:0x17, result rd:x15(0x00000000)
    li x15, MASK_XLEN(0x0)
    c.srai x15, 0x17
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

