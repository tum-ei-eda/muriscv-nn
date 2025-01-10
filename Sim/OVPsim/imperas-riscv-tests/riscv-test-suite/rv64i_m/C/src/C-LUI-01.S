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
RVTEST_ISA("RV64C")

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
    sd  x21, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xf000)
    
    # Testcase 1:  imm:0x7, result rd:x30(0x7000)
    c.lui x30, 0x7
    sd  x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x7000)
    
    # Testcase 2:  imm:0x1d, result rd:x1(0x1d000)
    c.lui x1, 0x1d
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x1d000)
    
    # Testcase 3:  imm:0x11, result rd:x22(0x11000)
    c.lui x22, 0x11
    sd  x22, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x11000)
    
    # Testcase 4:  imm:0x1d, result rd:x12(0x1d000)
    c.lui x12, 0x1d
    sd  x12, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0x5, result rd:x4(0x5000)
    c.lui x4, 0x5
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x5000)
    
    # Testcase 6:  imm:0xf, result rd:x5(0xf000)
    c.lui x5, 0xf
    sd  x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf000)
    
    # Testcase 7:  imm:0x4, result rd:x3(0x4000)
    c.lui x3, 0x4
    sd  x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x4000)
    
    # Testcase 8:  imm:0x1a, result rd:x31(0x1a000)
    c.lui x31, 0x1a
    sd  x31, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1a000)
    
    # Testcase 9:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    


    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1b000)
    
    # Testcase 11:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sd  x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    
    # Testcase 12:  imm:0x7, result rd:x6(0x7000)
    c.lui x6, 0x7
    sd  x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x7000)
    
    # Testcase 13:  imm:0x7, result rd:x13(0x7000)
    c.lui x13, 0x7
    sd  x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x7000)
    
    # Testcase 14:  imm:0x1f, result rd:x27(0x1f000)
    c.lui x27, 0x1f
    sd  x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1f000)
    


    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0x11, result rd:x4(0x11000)
    c.lui x4, 0x11
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x11000)
    
    # Testcase 16:  imm:0x14, result rd:x20(0x14000)
    c.lui x20, 0x14
    sd  x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x14000)
    
    # Testcase 17:  imm:0x14, result rd:x20(0x14000)
    c.lui x20, 0x14
    sd  x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x14000)
    
    # Testcase 18:  imm:0x19, result rd:x9(0x19000)
    c.lui x9, 0x19
    sd  x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x19000)
    
    # Testcase 19:  imm:0x1, result rd:x11(0x1000)
    c.lui x11, 0x1
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1000)
    


    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 20:  imm:0x12, result rd:x3(0x12000)
    c.lui x3, 0x12
    sd  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x12000)
    
    # Testcase 21:  imm:0x1e, result rd:x19(0x1e000)
    c.lui x19, 0x1e
    sd  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1e000)
    
    # Testcase 22:  imm:0x5, result rd:x25(0x5000)
    c.lui x25, 0x5
    sd  x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x5000)
    
    # Testcase 23:  imm:0xe, result rd:x3(0xe000)
    c.lui x3, 0xe
    sd  x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xe000)
    
    # Testcase 24:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sd  x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_6_0)

    # Testcase 25:  imm:0x10, result rd:x4(0x10000)
    c.lui x4, 0x10
    sd  x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x10000)
    
    # Testcase 26:  imm:0x15, result rd:x1(0x15000)
    c.lui x1, 0x15
    sd  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x15000)
    
    # Testcase 27:  imm:0x11, result rd:x1(0x11000)
    c.lui x1, 0x11
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x11000)
    
    # Testcase 28:  imm:0x10, result rd:x19(0x10000)
    c.lui x19, 0x10
    sd  x19, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0x10000)
    
    # Testcase 29:  imm:0x18, result rd:x3(0x18000)
    c.lui x3, 0x18
    sd  x3, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x18000)
    


    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x1, result rd:x8(0x1000)
    c.lui x8, 0x1
    sd  x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1000)
    
    # Testcase 31:  imm:0x1f, result rd:x13(0x1f000)
    c.lui x13, 0x1f
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1f000)
    
    # Testcase 32:  imm:0x1f, result rd:x24(0x1f000)
    c.lui x24, 0x1f
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1f000)
    
    # Testcase 33:  imm:0x1f, result rd:x11(0x1f000)
    c.lui x11, 0x1f
    sd  x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1f000)
    
    # Testcase 34:  imm:0x1, result rd:x4(0x1000)
    c.lui x4, 0x1
    sd  x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x1000)
    


    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x1f, result rd:x9(0x1f000)
    c.lui x9, 0x1f
    sd  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1f000)
    
    # Testcase 36:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sd  x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    
    # Testcase 37:  imm:0x1, result rd:x9(0x1000)
    c.lui x9, 0x1
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1000)
    
    # Testcase 38:  imm:0x1, result rd:x5(0x1000)
    c.lui x5, 0x1
    sd  x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x1000)
    
    # Testcase 39:  imm:0x1f, result rd:x15(0x1f000)
    c.lui x15, 0x1f
    sd  x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1f000)
    


    

    RVTEST_SIGBASE(x2,signature_9_0)

    # Testcase 40:  imm:0x1, result rd:x1(0x1000)
    c.lui x1, 0x1
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1000)
    
    # Testcase 41:  imm:0x2, result rd:x3(0x2000)
    c.lui x3, 0x2
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x2000)
    
    # Testcase 42:  imm:0x4, result rd:x4(0x4000)
    c.lui x4, 0x4
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x4000)
    
    # Testcase 43:  imm:0x8, result rd:x5(0x8000)
    c.lui x5, 0x8
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x8000)
    
    # Testcase 44:  imm:0x10, result rd:x6(0x10000)
    c.lui x6, 0x10
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x10000)
    


    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 46:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 47:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 48:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 49:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 51:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 52:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 53:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 54:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 56:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 57:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 58:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 59:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 61:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 62:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 63:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 64:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 66:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 67:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 68:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 69:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_15_0)

    # Testcase 70:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 71:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 72:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 73:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 74:  imm:0xf, result rd:x6(0xf000)
    c.lui x6, 0xf
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 76:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 77:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 78:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 79:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 81:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 82:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 83:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 84:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 86:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 87:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 88:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 89:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 91:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 92:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 93:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 94:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 96:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 97:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 98:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 99:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_21_0)

    # Testcase 100:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 101:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 102:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 103:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 104:  imm:0xf, result rd:x6(0xf000)
    c.lui x6, 0xf
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 106:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 107:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 108:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 109:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 111:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 112:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 113:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 114:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 116:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 117:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 118:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 119:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 121:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 122:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 123:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 124:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 126:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 127:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 128:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 129:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_27_0)

    # Testcase 130:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 131:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 132:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 133:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 134:  imm:0xf, result rd:x6(0xf000)
    c.lui x6, 0xf
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 136:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 137:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 138:  imm:0x17, result rd:x10(0x17000)
    c.lui x10, 0x17
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x17000)
    
    # Testcase 139:  imm:0xf, result rd:x11(0xf000)
    c.lui x11, 0xf
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x1e, result rd:x12(0x1e000)
    c.lui x12, 0x1e
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1e000)
    
    # Testcase 141:  imm:0x1d, result rd:x13(0x1d000)
    c.lui x13, 0x1d
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x1d000)
    
    # Testcase 142:  imm:0x1b, result rd:x14(0x1b000)
    c.lui x14, 0x1b
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x1b000)
    
    # Testcase 143:  imm:0x17, result rd:x15(0x17000)
    c.lui x15, 0x17
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x17000)
    
    # Testcase 144:  imm:0xf, result rd:x16(0xf000)
    c.lui x16, 0xf
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x1e, result rd:x17(0x1e000)
    c.lui x17, 0x1e
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1e000)
    
    # Testcase 146:  imm:0x1d, result rd:x18(0x1d000)
    c.lui x18, 0x1d
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x1d000)
    
    # Testcase 147:  imm:0x1b, result rd:x19(0x1b000)
    c.lui x19, 0x1b
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0x1b000)
    
    # Testcase 148:  imm:0x17, result rd:x20(0x17000)
    c.lui x20, 0x17
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x17000)
    
    # Testcase 149:  imm:0xf, result rd:x21(0xf000)
    c.lui x21, 0xf
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x1e, result rd:x22(0x1e000)
    c.lui x22, 0x1e
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1e000)
    
    # Testcase 151:  imm:0x1d, result rd:x23(0x1d000)
    c.lui x23, 0x1d
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x1d000)
    
    # Testcase 152:  imm:0x1b, result rd:x24(0x1b000)
    c.lui x24, 0x1b
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0x1b000)
    
    # Testcase 153:  imm:0x17, result rd:x25(0x17000)
    c.lui x25, 0x17
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x17000)
    
    # Testcase 154:  imm:0xf, result rd:x26(0xf000)
    c.lui x26, 0xf
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x1e, result rd:x27(0x1e000)
    c.lui x27, 0x1e
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1e000)
    
    # Testcase 156:  imm:0x1d, result rd:x28(0x1d000)
    c.lui x28, 0x1d
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x1d000)
    
    # Testcase 157:  imm:0x1b, result rd:x29(0x1b000)
    c.lui x29, 0x1b
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x1b000)
    
    # Testcase 158:  imm:0x17, result rd:x30(0x17000)
    c.lui x30, 0x17
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x17000)
    
    # Testcase 159:  imm:0xf, result rd:x31(0xf000)
    c.lui x31, 0xf
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xf000)
    


    

    RVTEST_SIGBASE(x2,signature_33_0)

    # Testcase 160:  imm:0x1e, result rd:x1(0x1e000)
    c.lui x1, 0x1e
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1e000)
    
    # Testcase 161:  imm:0x1d, result rd:x3(0x1d000)
    c.lui x3, 0x1d
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x1d000)
    
    # Testcase 162:  imm:0x1b, result rd:x4(0x1b000)
    c.lui x4, 0x1b
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x1b000)
    
    # Testcase 163:  imm:0x17, result rd:x5(0x17000)
    c.lui x5, 0x17
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x17000)
    
    # Testcase 164:  imm:0xf, result rd:x6(0xf000)
    c.lui x6, 0xf
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xf000)
    


    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x1e, result rd:x7(0x1e000)
    c.lui x7, 0x1e
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1e000)
    
    # Testcase 166:  imm:0x1d, result rd:x8(0x1d000)
    c.lui x8, 0x1d
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x1d000)
    
    # Testcase 167:  imm:0x1b, result rd:x9(0x1b000)
    c.lui x9, 0x1b
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1b000)
    
    # Testcase 168:  imm:0x1, result rd:x10(0x1000)
    c.lui x10, 0x1
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1000)
    
    # Testcase 169:  imm:0x2, result rd:x11(0x2000)
    c.lui x11, 0x2
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x2000)
    


    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x4, result rd:x12(0x4000)
    c.lui x12, 0x4
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x4000)
    
    # Testcase 171:  imm:0x8, result rd:x13(0x8000)
    c.lui x13, 0x8
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x8000)
    
    # Testcase 172:  imm:0x10, result rd:x14(0x10000)
    c.lui x14, 0x10
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x10000)
    
    # Testcase 173:  imm:0x1e, result rd:x15(0x1e000)
    c.lui x15, 0x1e
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e000)
    
    # Testcase 174:  imm:0x1d, result rd:x16(0x1d000)
    c.lui x16, 0x1d
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0x1b, result rd:x17(0x1b000)
    c.lui x17, 0x1b
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b000)
    
    # Testcase 176:  imm:0x17, result rd:x18(0x17000)
    c.lui x18, 0x17
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17000)
    
    # Testcase 177:  imm:0xf, result rd:x19(0xf000)
    c.lui x19, 0xf
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf000)
    
    # Testcase 178:  imm:0x1e, result rd:x20(0x1e000)
    c.lui x20, 0x1e
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e000)
    
    # Testcase 179:  imm:0x1d, result rd:x21(0x1d000)
    c.lui x21, 0x1d
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0x1b, result rd:x22(0x1b000)
    c.lui x22, 0x1b
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b000)
    
    # Testcase 181:  imm:0x17, result rd:x23(0x17000)
    c.lui x23, 0x17
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17000)
    
    # Testcase 182:  imm:0xf, result rd:x24(0xf000)
    c.lui x24, 0xf
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf000)
    
    # Testcase 183:  imm:0x1e, result rd:x25(0x1e000)
    c.lui x25, 0x1e
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e000)
    
    # Testcase 184:  imm:0x1d, result rd:x26(0x1d000)
    c.lui x26, 0x1d
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0x1b, result rd:x27(0x1b000)
    c.lui x27, 0x1b
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b000)
    
    # Testcase 186:  imm:0x17, result rd:x28(0x17000)
    c.lui x28, 0x17
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17000)
    
    # Testcase 187:  imm:0xf, result rd:x29(0xf000)
    c.lui x29, 0xf
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf000)
    
    # Testcase 188:  imm:0x1e, result rd:x30(0x1e000)
    c.lui x30, 0x1e
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e000)
    
    # Testcase 189:  imm:0x1d, result rd:x31(0x1d000)
    c.lui x31, 0x1d
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_39_0)

    # Testcase 190:  imm:0x1b, result rd:x1(0x1b000)
    c.lui x1, 0x1b
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1b000)
    
    # Testcase 191:  imm:0x17, result rd:x3(0x17000)
    c.lui x3, 0x17
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x17000)
    
    # Testcase 192:  imm:0xf, result rd:x4(0xf000)
    c.lui x4, 0xf
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xf000)
    
    # Testcase 193:  imm:0x1e, result rd:x5(0x1e000)
    c.lui x5, 0x1e
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x1e000)
    
    # Testcase 194:  imm:0x1d, result rd:x6(0x1d000)
    c.lui x6, 0x1d
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Testcase 195:  imm:0x1b, result rd:x7(0x1b000)
    c.lui x7, 0x1b
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1b000)
    
    # Testcase 196:  imm:0x17, result rd:x8(0x17000)
    c.lui x8, 0x17
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x17000)
    
    # Testcase 197:  imm:0xf, result rd:x9(0xf000)
    c.lui x9, 0xf
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf000)
    
    # Testcase 198:  imm:0x1e, result rd:x10(0x1e000)
    c.lui x10, 0x1e
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e000)
    
    # Testcase 199:  imm:0x1d, result rd:x11(0x1d000)
    c.lui x11, 0x1d
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 200:  imm:0x1b, result rd:x12(0x1b000)
    c.lui x12, 0x1b
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b000)
    
    # Testcase 201:  imm:0x17, result rd:x13(0x17000)
    c.lui x13, 0x17
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17000)
    
    # Testcase 202:  imm:0xf, result rd:x14(0xf000)
    c.lui x14, 0xf
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf000)
    
    # Testcase 203:  imm:0x1e, result rd:x15(0x1e000)
    c.lui x15, 0x1e
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e000)
    
    # Testcase 204:  imm:0x1d, result rd:x16(0x1d000)
    c.lui x16, 0x1d
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0x1b, result rd:x17(0x1b000)
    c.lui x17, 0x1b
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b000)
    
    # Testcase 206:  imm:0x17, result rd:x18(0x17000)
    c.lui x18, 0x17
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17000)
    
    # Testcase 207:  imm:0xf, result rd:x19(0xf000)
    c.lui x19, 0xf
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf000)
    
    # Testcase 208:  imm:0x1e, result rd:x20(0x1e000)
    c.lui x20, 0x1e
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e000)
    
    # Testcase 209:  imm:0x1d, result rd:x21(0x1d000)
    c.lui x21, 0x1d
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0x1b, result rd:x22(0x1b000)
    c.lui x22, 0x1b
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b000)
    
    # Testcase 211:  imm:0x17, result rd:x23(0x17000)
    c.lui x23, 0x17
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17000)
    
    # Testcase 212:  imm:0xf, result rd:x24(0xf000)
    c.lui x24, 0xf
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf000)
    
    # Testcase 213:  imm:0x1e, result rd:x25(0x1e000)
    c.lui x25, 0x1e
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e000)
    
    # Testcase 214:  imm:0x1d, result rd:x26(0x1d000)
    c.lui x26, 0x1d
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0x1b, result rd:x27(0x1b000)
    c.lui x27, 0x1b
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b000)
    
    # Testcase 216:  imm:0x17, result rd:x28(0x17000)
    c.lui x28, 0x17
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17000)
    
    # Testcase 217:  imm:0xf, result rd:x29(0xf000)
    c.lui x29, 0xf
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf000)
    
    # Testcase 218:  imm:0x1e, result rd:x30(0x1e000)
    c.lui x30, 0x1e
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e000)
    
    # Testcase 219:  imm:0x1d, result rd:x31(0x1d000)
    c.lui x31, 0x1d
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_45_0)

    # Testcase 220:  imm:0x1b, result rd:x1(0x1b000)
    c.lui x1, 0x1b
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1b000)
    
    # Testcase 221:  imm:0x17, result rd:x3(0x17000)
    c.lui x3, 0x17
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x17000)
    
    # Testcase 222:  imm:0xf, result rd:x4(0xf000)
    c.lui x4, 0xf
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xf000)
    
    # Testcase 223:  imm:0x1e, result rd:x5(0x1e000)
    c.lui x5, 0x1e
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x1e000)
    
    # Testcase 224:  imm:0x1d, result rd:x6(0x1d000)
    c.lui x6, 0x1d
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Testcase 225:  imm:0x1b, result rd:x7(0x1b000)
    c.lui x7, 0x1b
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1b000)
    
    # Testcase 226:  imm:0x17, result rd:x8(0x17000)
    c.lui x8, 0x17
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x17000)
    
    # Testcase 227:  imm:0xf, result rd:x9(0xf000)
    c.lui x9, 0xf
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf000)
    
    # Testcase 228:  imm:0x1e, result rd:x10(0x1e000)
    c.lui x10, 0x1e
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e000)
    
    # Testcase 229:  imm:0x1d, result rd:x11(0x1d000)
    c.lui x11, 0x1d
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 230:  imm:0x1b, result rd:x12(0x1b000)
    c.lui x12, 0x1b
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b000)
    
    # Testcase 231:  imm:0x17, result rd:x13(0x17000)
    c.lui x13, 0x17
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17000)
    
    # Testcase 232:  imm:0xf, result rd:x14(0xf000)
    c.lui x14, 0xf
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf000)
    
    # Testcase 233:  imm:0x1e, result rd:x15(0x1e000)
    c.lui x15, 0x1e
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e000)
    
    # Testcase 234:  imm:0x1d, result rd:x16(0x1d000)
    c.lui x16, 0x1d
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0x1b, result rd:x17(0x1b000)
    c.lui x17, 0x1b
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b000)
    
    # Testcase 236:  imm:0x17, result rd:x18(0x17000)
    c.lui x18, 0x17
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17000)
    
    # Testcase 237:  imm:0xf, result rd:x19(0xf000)
    c.lui x19, 0xf
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf000)
    
    # Testcase 238:  imm:0x1e, result rd:x20(0x1e000)
    c.lui x20, 0x1e
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e000)
    
    # Testcase 239:  imm:0x1d, result rd:x21(0x1d000)
    c.lui x21, 0x1d
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0x1b, result rd:x22(0x1b000)
    c.lui x22, 0x1b
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b000)
    
    # Testcase 241:  imm:0x17, result rd:x23(0x17000)
    c.lui x23, 0x17
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17000)
    
    # Testcase 242:  imm:0xf, result rd:x24(0xf000)
    c.lui x24, 0xf
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf000)
    
    # Testcase 243:  imm:0x1e, result rd:x25(0x1e000)
    c.lui x25, 0x1e
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e000)
    
    # Testcase 244:  imm:0x1d, result rd:x26(0x1d000)
    c.lui x26, 0x1d
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0x1b, result rd:x27(0x1b000)
    c.lui x27, 0x1b
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b000)
    
    # Testcase 246:  imm:0x17, result rd:x28(0x17000)
    c.lui x28, 0x17
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17000)
    
    # Testcase 247:  imm:0xf, result rd:x29(0xf000)
    c.lui x29, 0xf
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf000)
    
    # Testcase 248:  imm:0x1e, result rd:x30(0x1e000)
    c.lui x30, 0x1e
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e000)
    
    # Testcase 249:  imm:0x1d, result rd:x31(0x1d000)
    c.lui x31, 0x1d
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_51_0)

    # Testcase 250:  imm:0x1b, result rd:x1(0x1b000)
    c.lui x1, 0x1b
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1b000)
    
    # Testcase 251:  imm:0x17, result rd:x3(0x17000)
    c.lui x3, 0x17
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x17000)
    
    # Testcase 252:  imm:0xf, result rd:x4(0xf000)
    c.lui x4, 0xf
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xf000)
    
    # Testcase 253:  imm:0x1e, result rd:x5(0x1e000)
    c.lui x5, 0x1e
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x1e000)
    
    # Testcase 254:  imm:0x1d, result rd:x6(0x1d000)
    c.lui x6, 0x1d
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 255:  imm:0x1b, result rd:x7(0x1b000)
    c.lui x7, 0x1b
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1b000)
    
    # Testcase 256:  imm:0x17, result rd:x8(0x17000)
    c.lui x8, 0x17
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x17000)
    
    # Testcase 257:  imm:0xf, result rd:x9(0xf000)
    c.lui x9, 0xf
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf000)
    
    # Testcase 258:  imm:0x1e, result rd:x10(0x1e000)
    c.lui x10, 0x1e
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e000)
    
    # Testcase 259:  imm:0x1d, result rd:x11(0x1d000)
    c.lui x11, 0x1d
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 260:  imm:0x1b, result rd:x12(0x1b000)
    c.lui x12, 0x1b
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b000)
    
    # Testcase 261:  imm:0x17, result rd:x13(0x17000)
    c.lui x13, 0x17
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17000)
    
    # Testcase 262:  imm:0xf, result rd:x14(0xf000)
    c.lui x14, 0xf
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf000)
    
    # Testcase 263:  imm:0x1e, result rd:x15(0x1e000)
    c.lui x15, 0x1e
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e000)
    
    # Testcase 264:  imm:0x1d, result rd:x16(0x1d000)
    c.lui x16, 0x1d
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 265:  imm:0x1b, result rd:x17(0x1b000)
    c.lui x17, 0x1b
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b000)
    
    # Testcase 266:  imm:0x17, result rd:x18(0x17000)
    c.lui x18, 0x17
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x17000)
    
    # Testcase 267:  imm:0xf, result rd:x19(0xf000)
    c.lui x19, 0xf
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xf000)
    
    # Testcase 268:  imm:0x1e, result rd:x20(0x1e000)
    c.lui x20, 0x1e
    sd  x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x1e000)
    
    # Testcase 269:  imm:0x1d, result rd:x21(0x1d000)
    c.lui x21, 0x1d
    sd  x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0x1b, result rd:x22(0x1b000)
    c.lui x22, 0x1b
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0x1b000)
    
    # Testcase 271:  imm:0x17, result rd:x23(0x17000)
    c.lui x23, 0x17
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x17000)
    
    # Testcase 272:  imm:0xf, result rd:x24(0xf000)
    c.lui x24, 0xf
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xf000)
    
    # Testcase 273:  imm:0x1e, result rd:x25(0x1e000)
    c.lui x25, 0x1e
    sd  x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0x1e000)
    
    # Testcase 274:  imm:0x1d, result rd:x26(0x1d000)
    c.lui x26, 0x1d
    sd  x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0x1b, result rd:x27(0x1b000)
    c.lui x27, 0x1b
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x1b000)
    
    # Testcase 276:  imm:0x17, result rd:x28(0x17000)
    c.lui x28, 0x17
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x17000)
    
    # Testcase 277:  imm:0xf, result rd:x29(0xf000)
    c.lui x29, 0xf
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xf000)
    
    # Testcase 278:  imm:0x1e, result rd:x30(0x1e000)
    c.lui x30, 0x1e
    sd  x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0x1e000)
    
    # Testcase 279:  imm:0x1d, result rd:x31(0x1d000)
    c.lui x31, 0x1d
    sd  x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0x1d000)
    


    

    RVTEST_SIGBASE(x2,signature_57_0)

    # Testcase 280:  imm:0x1b, result rd:x1(0x1b000)
    c.lui x1, 0x1b
    sd  x1, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x1b000)
    
    # Testcase 281:  imm:0x17, result rd:x3(0x17000)
    c.lui x3, 0x17
    sd  x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x17000)
    
    # Testcase 282:  imm:0xf, result rd:x4(0xf000)
    c.lui x4, 0xf
    sd  x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xf000)
    
    # Testcase 283:  imm:0x1e, result rd:x5(0x1e000)
    c.lui x5, 0x1e
    sd  x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x1e000)
    
    # Testcase 284:  imm:0x1d, result rd:x6(0x1d000)
    c.lui x6, 0x1d
    sd  x6, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 285:  imm:0x1b, result rd:x7(0x1b000)
    c.lui x7, 0x1b
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x1b000)
    
    # Testcase 286:  imm:0x17, result rd:x8(0x17000)
    c.lui x8, 0x17
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x17000)
    
    # Testcase 287:  imm:0xf, result rd:x9(0xf000)
    c.lui x9, 0xf
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xf000)
    
    # Testcase 288:  imm:0x1e, result rd:x10(0x1e000)
    c.lui x10, 0x1e
    sd  x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x1e000)
    
    # Testcase 289:  imm:0x1d, result rd:x11(0x1d000)
    c.lui x11, 0x1d
    sd  x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0x1b, result rd:x12(0x1b000)
    c.lui x12, 0x1b
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1b000)
    
    # Testcase 291:  imm:0x17, result rd:x13(0x17000)
    c.lui x13, 0x17
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x17000)
    
    # Testcase 292:  imm:0xf, result rd:x14(0xf000)
    c.lui x14, 0xf
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xf000)
    
    # Testcase 293:  imm:0x1e, result rd:x15(0x1e000)
    c.lui x15, 0x1e
    sd  x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x1e000)
    
    # Testcase 294:  imm:0x1d, result rd:x16(0x1d000)
    c.lui x16, 0x1d
    sd  x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x1d000)
    


    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 295:  imm:0x1b, result rd:x17(0x1b000)
    c.lui x17, 0x1b
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x1b000)
    
	
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

