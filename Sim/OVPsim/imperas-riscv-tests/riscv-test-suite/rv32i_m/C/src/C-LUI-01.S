// RISC-V Architectural Validation Test C-LUI-01
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
// Description: Testing instruction 'c.lui'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.lui)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.lui)

    RVTEST_SIGBASE(x2,signature_1_0)

    # Testcase 0:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sw  x21, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xf000)
    
    # Testcase 1:  imm:0x7, result rd:x30(0x7000)
    c.lui x30, 0x7
    sw  x30, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x7000)
    
    # Testcase 2:  imm:0x1d, result rd:x1(0x1d000)
    c.lui x1, 0x1d
    sw  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x1d000)
    
    # Testcase 3:  imm:0x11, result rd:x22(0x11000)
    c.lui x22, 0x11
    sw  x22, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x11000)
    
    # Testcase 4:  imm:0x1d, result rd:x12(0x1d000)
    c.lui x12, 0x1d
    sw  x12, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0x5, result rd:x4(0x5000)
    c.lui x4, 0x5
    sw  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x5000)
    
    # Testcase 6:  imm:0xf, result rd:x5(0xf000)
    c.lui x5, 0xf
    sw  x5, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf000)
    
    # Testcase 7:  imm:0x4, result rd:x3(0x4000)
    c.lui x3, 0x4
    sw  x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x4000)
    
    # Testcase 8:  imm:0x1a, result rd:x31(0x1a000)
    c.lui x31, 0x1a
    sw  x31, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1a000)
    
    # Testcase 9:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sw  x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sw  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1b000)
    
    # Testcase 11:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sw  x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    
    # Testcase 12:  imm:0x7, result rd:x6(0x7000)
    c.lui x6, 0x7
    sw  x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x7000)
    
    # Testcase 13:  imm:0x7, result rd:x13(0x7000)
    c.lui x13, 0x7
    sw  x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x7000)
    
    # Testcase 14:  imm:0x1f, result rd:x27(0x1f000)
    c.lui x27, 0x1f
    sw  x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1f000)
    


    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0x11, result rd:x4(0x11000)
    c.lui x4, 0x11
    sw  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x11000)
    
    # Testcase 16:  imm:0x14, result rd:x20(0x14000)
    c.lui x20, 0x14
    sw  x20, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x14000)
    
    # Testcase 17:  imm:0x14, result rd:x20(0x14000)
    c.lui x20, 0x14
    sw  x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x14000)
    
    # Testcase 18:  imm:0x19, result rd:x9(0x19000)
    c.lui x9, 0x19
    sw  x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x19000)
    
    # Testcase 19:  imm:0x1, result rd:x11(0x1000)
    c.lui x11, 0x1
    sw  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1000)
    


    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 20:  imm:0x12, result rd:x3(0x12000)
    c.lui x3, 0x12
    sw  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x12000)
    
    # Testcase 21:  imm:0x1e, result rd:x19(0x1e000)
    c.lui x19, 0x1e
    sw  x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1e000)
    
    # Testcase 22:  imm:0x5, result rd:x25(0x5000)
    c.lui x25, 0x5
    sw  x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x5000)
    
    # Testcase 23:  imm:0xe, result rd:x3(0xe000)
    c.lui x3, 0xe
    sw  x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xe000)
    
    # Testcase 24:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sw  x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_6_0)

    # Testcase 25:  imm:0x10, result rd:x4(0x10000)
    c.lui x4, 0x10
    sw  x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x10000)
    
    # Testcase 26:  imm:0x15, result rd:x1(0x15000)
    c.lui x1, 0x15
    sw  x1, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x15000)
    
    # Testcase 27:  imm:0x11, result rd:x1(0x11000)
    c.lui x1, 0x11
    sw  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x11000)
    
    # Testcase 28:  imm:0x10, result rd:x19(0x10000)
    c.lui x19, 0x10
    sw  x19, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0x10000)
    
    # Testcase 29:  imm:0x18, result rd:x3(0x18000)
    c.lui x3, 0x18
    sw  x3, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x18000)
    


    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x1, result rd:x8(0x1000)
    c.lui x8, 0x1
    sw  x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1000)
    
    # Testcase 31:  imm:0x1f, result rd:x13(0x1f000)
    c.lui x13, 0x1f
    sw  x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1f000)
    
    # Testcase 32:  imm:0x1f, result rd:x24(0x1f000)
    c.lui x24, 0x1f
    sw  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1f000)
    
    # Testcase 33:  imm:0x1f, result rd:x11(0x1f000)
    c.lui x11, 0x1f
    sw  x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1f000)
    
    # Testcase 34:  imm:0x1, result rd:x4(0x1000)
    c.lui x4, 0x1
    sw  x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1000)
    


    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x1f, result rd:x9(0x1f000)
    c.lui x9, 0x1f
    sw  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1f000)
    
    # Testcase 36:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sw  x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    
    # Testcase 37:  imm:0x1, result rd:x9(0x1000)
    c.lui x9, 0x1
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1000)
    
    # Testcase 38:  imm:0x1, result rd:x5(0x1000)
    c.lui x5, 0x1
    sw  x5, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1000)
    
    # Testcase 39:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sw  x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    


    

    RVTEST_SIGBASE(x2,signature_9_0)

    # Testcase 40:  imm:0x1, result rd:x1(0x1000)
    c.lui x1, 0x1
    sw  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1000)
    
    # Testcase 41:  imm:0x2, result rd:x3(0x2000)
    c.lui x3, 0x2
    sw  x3, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x2000)
    
    # Testcase 42:  imm:0x4, result rd:x4(0x4000)
    c.lui x4, 0x4
    sw  x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x4000)
    
    # Testcase 43:  imm:0x8, result rd:x5(0x8000)
    c.lui x5, 0x8
    sw  x5, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x8000)
    
    # Testcase 44:  imm:0x10, result rd:x6(0x10000)
    c.lui x6, 0x10
    sw  x6, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x10000)
    


    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sw  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 46:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sw  x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 47:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 48:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sw  x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 49:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sw  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sw  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 51:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sw  x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 52:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sw  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 53:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sw  x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 54:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sw  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sw  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 56:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sw  x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 57:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sw  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 58:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sw  x20, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 59:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sw  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sw  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 61:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sw  x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 62:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sw  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 63:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sw  x25, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 64:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sw  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sw  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 66:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sw  x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 67:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sw  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 68:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sw  x30, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 69:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sw  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_15_0)

    # Testcase 70:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sw  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 71:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sw  x3, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 72:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sw  x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 73:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sw  x5, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 74:  imm:0xf, result rd:x6(0xf000)
    c.lui x6, 0xf
    sw  x6, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sw  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 76:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sw  x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 77:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 78:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sw  x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 79:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sw  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sw  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 81:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sw  x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 82:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sw  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 83:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sw  x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 84:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sw  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sw  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 86:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sw  x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 87:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sw  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 88:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sw  x20, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 89:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sw  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sw  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 91:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sw  x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 92:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sw  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 93:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sw  x25, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 94:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sw  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sw  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 96:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sw  x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 97:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sw  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 98:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sw  x30, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 99:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sw  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_21_0)

    # Testcase 100:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sw  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 101:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sw  x3, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 102:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sw  x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 103:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sw  x5, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 104:  imm:0x1, result rd:x6(0x1000)
    c.lui x6, 0x1
    sw  x6, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1000)
    


    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x2, result rd:x7(0x2000)
    c.lui x7, 0x2
    sw  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x2000)
    
    # Testcase 106:  imm:0x4, result rd:x8(0x4000)
    c.lui x8, 0x4
    sw  x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x4000)
    
    # Testcase 107:  imm:0x8, result rd:x9(0x8000)
    c.lui x9, 0x8
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x8000)
    
    # Testcase 108:  imm:0x10, result rd:x10(0x10000)
    c.lui x10, 0x10
    sw  x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x10000)
    
    # Testcase 109:  imm:0x1e, result rd:x11(0x1e000)
    c.lui x11, 0x1e
    sw  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x1d, result rd:x12(0x1d000)
    c.lui x12, 0x1d
    sw  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1d000)
    
    # Testcase 111:  imm:0x1b, result rd:x13(0x1b000)
    c.lui x13, 0x1b
    sw  x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1b000)
    
    # Testcase 112:  imm:0x17, result rd:x14(0x17000)
    c.lui x14, 0x17
    sw  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x17000)
    
    # Testcase 113:  imm:0xf, result rd:x15(0xf000)
    c.lui x15, 0xf
    sw  x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xf000)
    
    # Testcase 114:  imm:0x1e, result rd:x16(0x1e000)
    c.lui x16, 0x1e
    sw  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x1d, result rd:x17(0x1d000)
    c.lui x17, 0x1d
    sw  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1d000)
    
    # Testcase 116:  imm:0x1b, result rd:x18(0x1b000)
    c.lui x18, 0x1b
    sw  x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1b000)
    
    # Testcase 117:  imm:0x17, result rd:x19(0x17000)
    c.lui x19, 0x17
    sw  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x17000)
    
    # Testcase 118:  imm:0xf, result rd:x20(0xf000)
    c.lui x20, 0xf
    sw  x20, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xf000)
    
    # Testcase 119:  imm:0x1e, result rd:x21(0x1e000)
    c.lui x21, 0x1e
    sw  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x1d, result rd:x22(0x1d000)
    c.lui x22, 0x1d
    sw  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1d000)
    
    # Testcase 121:  imm:0x1b, result rd:x23(0x1b000)
    c.lui x23, 0x1b
    sw  x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1b000)
    
    # Testcase 122:  imm:0x17, result rd:x24(0x17000)
    c.lui x24, 0x17
    sw  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x17000)
    
    # Testcase 123:  imm:0xf, result rd:x25(0xf000)
    c.lui x25, 0xf
    sw  x25, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xf000)
    
    # Testcase 124:  imm:0x1e, result rd:x26(0x1e000)
    c.lui x26, 0x1e
    sw  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x1d, result rd:x27(0x1d000)
    c.lui x27, 0x1d
    sw  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1d000)
    
    # Testcase 126:  imm:0x1b, result rd:x28(0x1b000)
    c.lui x28, 0x1b
    sw  x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1b000)
    
    # Testcase 127:  imm:0x17, result rd:x29(0x17000)
    c.lui x29, 0x17
    sw  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x17000)
    
    # Testcase 128:  imm:0xf, result rd:x30(0xf000)
    c.lui x30, 0xf
    sw  x30, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xf000)
    
    # Testcase 129:  imm:0x1e, result rd:x31(0x1e000)
    c.lui x31, 0x1e
    sw  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1e000)
    


    

    RVTEST_SIGBASE(x2,signature_27_0)

    # Testcase 130:  imm:0x1d, result rd:x1(0x1d000)
    c.lui x1, 0x1d
    sw  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1d000)
    
    # Testcase 131:  imm:0x1b, result rd:x3(0x1b000)
    c.lui x3, 0x1b
    sw  x3, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1b000)
    
    # Testcase 132:  imm:0x17, result rd:x4(0x17000)
    c.lui x4, 0x17
    sw  x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x17000)
    
    # Testcase 133:  imm:0xf, result rd:x5(0xf000)
    c.lui x5, 0xf
    sw  x5, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0xf000)
    
    # Testcase 134:  imm:0x1e, result rd:x6(0x1e000)
    c.lui x6, 0x1e
    sw  x6, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x1d, result rd:x7(0x1d000)
    c.lui x7, 0x1d
    sw  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1d000)
    
    # Testcase 136:  imm:0x1b, result rd:x8(0x1b000)
    c.lui x8, 0x1b
    sw  x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1b000)
    
    # Testcase 137:  imm:0x17, result rd:x9(0x17000)
    c.lui x9, 0x17
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x17000)
    
    # Testcase 138:  imm:0xf, result rd:x10(0xf000)
    c.lui x10, 0xf
    sw  x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xf000)
    
    # Testcase 139:  imm:0x1e, result rd:x11(0x1e000)
    c.lui x11, 0x1e
    sw  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x1d, result rd:x12(0x1d000)
    c.lui x12, 0x1d
    sw  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1d000)
    
    # Testcase 141:  imm:0x1b, result rd:x13(0x1b000)
    c.lui x13, 0x1b
    sw  x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1b000)
    
    # Testcase 142:  imm:0x17, result rd:x14(0x17000)
    c.lui x14, 0x17
    sw  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x17000)
    
    # Testcase 143:  imm:0xf, result rd:x15(0xf000)
    c.lui x15, 0xf
    sw  x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xf000)
    
    # Testcase 144:  imm:0x1e, result rd:x16(0x1e000)
    c.lui x16, 0x1e
    sw  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x1d, result rd:x17(0x1d000)
    c.lui x17, 0x1d
    sw  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1d000)
    
    # Testcase 146:  imm:0x1b, result rd:x18(0x1b000)
    c.lui x18, 0x1b
    sw  x18, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1b000)
    
    # Testcase 147:  imm:0x17, result rd:x19(0x17000)
    c.lui x19, 0x17
    sw  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x17000)
    
    # Testcase 148:  imm:0xf, result rd:x20(0xf000)
    c.lui x20, 0xf
    sw  x20, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xf000)
    
    # Testcase 149:  imm:0x1e, result rd:x21(0x1e000)
    c.lui x21, 0x1e
    sw  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x1d, result rd:x22(0x1d000)
    c.lui x22, 0x1d
    sw  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1d000)
    
    # Testcase 151:  imm:0x1b, result rd:x23(0x1b000)
    c.lui x23, 0x1b
    sw  x23, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1b000)
    
    # Testcase 152:  imm:0x17, result rd:x24(0x17000)
    c.lui x24, 0x17
    sw  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x17000)
    
    # Testcase 153:  imm:0xf, result rd:x25(0xf000)
    c.lui x25, 0xf
    sw  x25, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xf000)
    
    # Testcase 154:  imm:0x1e, result rd:x26(0x1e000)
    c.lui x26, 0x1e
    sw  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x1d, result rd:x27(0x1d000)
    c.lui x27, 0x1d
    sw  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1d000)
    
    # Testcase 156:  imm:0x1b, result rd:x28(0x1b000)
    c.lui x28, 0x1b
    sw  x28, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1b000)
    
    # Testcase 157:  imm:0x17, result rd:x29(0x17000)
    c.lui x29, 0x17
    sw  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x17000)
    
    # Testcase 158:  imm:0xf, result rd:x30(0xf000)
    c.lui x30, 0xf
    sw  x30, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xf000)
    
    # Testcase 159:  imm:0x1e, result rd:x31(0x1e000)
    c.lui x31, 0x1e
    sw  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1e000)
    


    

    RVTEST_SIGBASE(x2,signature_33_0)

    # Testcase 160:  imm:0x1d, result rd:x1(0x1d000)
    c.lui x1, 0x1d
    sw  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1d000)
    
    # Testcase 161:  imm:0x1b, result rd:x3(0x1b000)
    c.lui x3, 0x1b
    sw  x3, 4(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1b000)
    
    # Testcase 162:  imm:0x17, result rd:x4(0x17000)
    c.lui x4, 0x17
    sw  x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x17000)
    
    # Testcase 163:  imm:0xf, result rd:x5(0xf000)
    c.lui x5, 0xf
    sw  x5, 12(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0xf000)
    
    # Testcase 164:  imm:0x1e, result rd:x6(0x1e000)
    c.lui x6, 0x1e
    sw  x6, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x1d, result rd:x7(0x1d000)
    c.lui x7, 0x1d
    sw  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1d000)
    
    # Testcase 166:  imm:0x1b, result rd:x8(0x1b000)
    c.lui x8, 0x1b
    sw  x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1b000)
    
    # Testcase 167:  imm:0x17, result rd:x9(0x17000)
    c.lui x9, 0x17
    sw  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x17000)
    
	
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

