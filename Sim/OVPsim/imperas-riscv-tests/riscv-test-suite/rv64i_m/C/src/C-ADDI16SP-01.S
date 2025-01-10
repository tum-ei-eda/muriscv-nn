// RISC-V Architectural Validation Test C-ADDI16SP-01
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
// Description: Testing instruction 'c.addi16sp'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.addi16sp)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.addi16sp)

    RVTEST_SIGBASE(x1,signature_1_0)


    # Testcase 0:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 1:  rd:x2(0x00000000), imm:0x70, result rd:x2(0x00000070)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x70)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x70)

    # Testcase 2:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 3:  rd:x2(0x00000000), imm:0x110, result rd:x2(0x00000110)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x110)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x110)

    # Testcase 4:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_2_0)


    # Testcase 5:  rd:x2(0x00000000), imm:0x50, result rd:x2(0x00000050)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x50)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x50)

    # Testcase 6:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 7:  rd:x2(0x00000000), imm:0x40, result rd:x2(0x00000040)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x40)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x40)

    # Testcase 8:  rd:x2(0x00000000), imm:0x1a0, result rd:x2(0x000001a0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1a0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1a0)

    # Testcase 9:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)


    

    RVTEST_SIGBASE(x1,signature_3_0)


    # Testcase 10:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 11:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 12:  rd:x2(0x00000000), imm:0x70, result rd:x2(0x00000070)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x70)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x70)

    # Testcase 13:  rd:x2(0x00000000), imm:0x70, result rd:x2(0x00000070)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x70)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x70)

    # Testcase 14:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)


    

    RVTEST_SIGBASE(x1,signature_4_0)


    # Testcase 15:  rd:x2(0x00000000), imm:0x110, result rd:x2(0x00000110)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x110)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x110)

    # Testcase 16:  rd:x2(0x00000000), imm:0x140, result rd:x2(0x00000140)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x140)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x140)

    # Testcase 17:  rd:x2(0x00000000), imm:0x140, result rd:x2(0x00000140)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x140)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x140)

    # Testcase 18:  rd:x2(0x00000000), imm:0x190, result rd:x2(0x00000190)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x190)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x190)

    # Testcase 19:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)


    

    RVTEST_SIGBASE(x1,signature_5_0)


    # Testcase 20:  rd:x2(0x00000000), imm:0x120, result rd:x2(0x00000120)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x120)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x120)

    # Testcase 21:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 22:  rd:x2(0x00000000), imm:0x50, result rd:x2(0x00000050)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x50)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x50)

    # Testcase 23:  rd:x2(0x00000000), imm:0xe0, result rd:x2(0x000000e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xe0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xe0)

    # Testcase 24:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_6_0)


    # Testcase 25:  rd:x2(0x00000000), imm:0x100, result rd:x2(0x00000100)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x100)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x100)

    # Testcase 26:  rd:x2(0x00000000), imm:0x150, result rd:x2(0x00000150)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x150)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x150)

    # Testcase 27:  rd:x2(0x00000000), imm:0x110, result rd:x2(0x00000110)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x110)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x110)

    # Testcase 28:  rd:x2(0x00000000), imm:0x100, result rd:x2(0x00000100)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x100)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x100)

    # Testcase 29:  rd:x2(0x00000000), imm:0x180, result rd:x2(0x00000180)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x180)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x180)


    

    RVTEST_SIGBASE(x1,signature_7_0)


    # Testcase 30:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 31:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 32:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 33:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 34:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)


    

    RVTEST_SIGBASE(x1,signature_8_0)


    # Testcase 35:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 36:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)

    # Testcase 37:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 38:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 39:  rd:x2(0x00000000), imm:0x1f0, result rd:x2(0x000001f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1f0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1f0)


    

    RVTEST_SIGBASE(x1,signature_9_0)


    # Testcase 40:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 41:  rd:x2(0x00000000), imm:0x20, result rd:x2(0x00000020)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x20)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x20)

    # Testcase 42:  rd:x2(0x00000000), imm:0x40, result rd:x2(0x00000040)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x40)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x40)

    # Testcase 43:  rd:x2(0x00000000), imm:0x80, result rd:x2(0x00000080)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x80)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x80)

    # Testcase 44:  rd:x2(0x00000000), imm:0x100, result rd:x2(0x00000100)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x100)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x100)


    

    RVTEST_SIGBASE(x1,signature_10_0)


    # Testcase 45:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 46:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 47:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 48:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 49:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_11_0)


    # Testcase 50:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 51:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 52:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 53:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 54:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_12_0)


    # Testcase 55:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 56:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 57:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 58:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 59:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_13_0)


    # Testcase 60:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 61:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 62:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 63:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 64:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_14_0)


    # Testcase 65:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 66:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 67:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 68:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 69:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_15_0)


    # Testcase 70:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 71:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 72:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 73:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 74:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_16_0)


    # Testcase 75:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 76:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 77:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 78:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 79:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_17_0)


    # Testcase 80:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 81:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 82:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 83:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 84:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_18_0)


    # Testcase 85:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 86:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 87:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 88:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 89:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_19_0)


    # Testcase 90:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 91:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 92:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 93:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 94:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_20_0)


    # Testcase 95:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 96:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 97:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 98:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 99:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_21_0)


    # Testcase 100:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 101:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 102:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 103:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 104:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_22_0)


    # Testcase 105:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 106:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 107:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 108:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 109:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_23_0)


    # Testcase 110:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 111:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 112:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 113:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 114:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_24_0)


    # Testcase 115:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 116:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 117:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 118:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 119:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_25_0)


    # Testcase 120:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 121:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 122:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 123:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 124:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_26_0)


    # Testcase 125:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 126:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 127:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 128:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 129:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_27_0)


    # Testcase 130:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 131:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 132:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 133:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 134:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_28_0)


    # Testcase 135:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 136:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 137:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 138:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 139:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_29_0)


    # Testcase 140:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 141:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 142:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 143:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 144:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_30_0)


    # Testcase 145:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 146:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 147:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 148:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 149:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_31_0)


    # Testcase 150:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 151:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 152:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 153:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 154:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_32_0)


    # Testcase 155:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 156:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 157:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 158:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 159:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_33_0)


    # Testcase 160:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 161:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 162:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 163:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 164:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)


    

    RVTEST_SIGBASE(x1,signature_34_0)


    # Testcase 165:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 166:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)

    # Testcase 167:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 168:  rd:x2(0x00000000), imm:0x10, result rd:x2(0x00000010)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x10)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x10)

    # Testcase 169:  rd:x2(0x00000000), imm:0x20, result rd:x2(0x00000020)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x20)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x20)


    

    RVTEST_SIGBASE(x1,signature_35_0)


    # Testcase 170:  rd:x2(0x00000000), imm:0x40, result rd:x2(0x00000040)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x40)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x40)

    # Testcase 171:  rd:x2(0x00000000), imm:0x80, result rd:x2(0x00000080)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x80)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x80)

    # Testcase 172:  rd:x2(0x00000000), imm:0x100, result rd:x2(0x00000100)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x100)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x100)

    # Testcase 173:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 174:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_36_0)


    # Testcase 175:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 176:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 177:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 178:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 179:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_37_0)


    # Testcase 180:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 181:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 182:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 183:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 184:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_38_0)


    # Testcase 185:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 186:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 187:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 188:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 189:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_39_0)


    # Testcase 190:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 191:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 192:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 193:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 194:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_40_0)


    # Testcase 195:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 196:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 197:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 198:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 199:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_41_0)


    # Testcase 200:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 201:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 202:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 203:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 204:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_42_0)


    # Testcase 205:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 206:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 207:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 208:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 209:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_43_0)


    # Testcase 210:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 211:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 212:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 213:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 214:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_44_0)


    # Testcase 215:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 216:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 217:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 218:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 219:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_45_0)


    # Testcase 220:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 221:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 222:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 223:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 224:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_46_0)


    # Testcase 225:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 226:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 227:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 228:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 229:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_47_0)


    # Testcase 230:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 231:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 232:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 233:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 234:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_48_0)


    # Testcase 235:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 236:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 237:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 238:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 239:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_49_0)


    # Testcase 240:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 241:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 242:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 243:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 244:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_50_0)


    # Testcase 245:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 246:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 247:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 248:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 249:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_51_0)


    # Testcase 250:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 251:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 252:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 253:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 254:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_52_0)


    # Testcase 255:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 256:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 257:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 258:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 259:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_53_0)


    # Testcase 260:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 261:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 262:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 263:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 264:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_54_0)


    # Testcase 265:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 266:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 267:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 268:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 269:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_55_0)


    # Testcase 270:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 271:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 272:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 273:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 274:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_56_0)


    # Testcase 275:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 276:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 277:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 278:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 279:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_57_0)


    # Testcase 280:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 281:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 282:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 283:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 284:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_58_0)


    # Testcase 285:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 286:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 287:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 288:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 289:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_59_0)


    # Testcase 290:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)

    # Testcase 291:  rd:x2(0x00000000), imm:0x170, result rd:x2(0x00000170)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x170)
    sd x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x170)

    # Testcase 292:  rd:x2(0x00000000), imm:0xf0, result rd:x2(0x000000f0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0xf0)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xf0)

    # Testcase 293:  rd:x2(0x00000000), imm:0x1e0, result rd:x2(0x000001e0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1e0)
    sd x2, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1e0)

    # Testcase 294:  rd:x2(0x00000000), imm:0x1d0, result rd:x2(0x000001d0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1d0)
    sd x2, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1d0)


    

    RVTEST_SIGBASE(x1,signature_60_0)


    # Testcase 295:  rd:x2(0x00000000), imm:0x1b0, result rd:x2(0x000001b0)
    li x2, MASK_XLEN(0x0)
    c.addi16sp x2, SEXT_IMM(0x1b0)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1b0)
	
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

