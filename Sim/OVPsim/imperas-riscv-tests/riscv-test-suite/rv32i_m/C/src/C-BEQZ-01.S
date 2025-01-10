// RISC-V Architectural Validation Test C-BEQZ-01
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
// Description: Testing instruction 'c.beqz'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.beqz)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.beqz)

    RVTEST_SIGBASE(x1,signature_1_0)
    
     # Testcase 0:  rs1:x11(0x54f4aeeb), result Branch=0
    li x3, 0xcccc
    li x11, 0x54f4aeeb
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 1:  rs1:x12(0xe1b1199b), result Branch=0
    li x3, 0xcccc
    li x12, 0xe1b1199b
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 2:  rs1:x14(0xb26566a0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xb26566a0
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 3:  rs1:x12(0xf27008e6), result Branch=0
    li x3, 0xcccc
    li x12, 0xf27008e6
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 4:  rs1:x10(0xc8484a3), result Branch=0
    li x3, 0xcccc
    li x10, 0xc8484a3
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_2_0)
    
     # Testcase 5:  rs1:x8(0xa783d03f), result Branch=0
    li x3, 0xcccc
    li x8, 0xa783d03f
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 6:  rs1:x11(0xfd7b9df8), result Branch=0
    li x3, 0xcccc
    li x11, 0xfd7b9df8
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 7:  rs1:x15(0xafaa29d), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xafaa29d
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 8:  rs1:x13(0x413f2c62), result Branch=0
    li x3, 0xcccc
    li x13, 0x413f2c62
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 9:  rs1:x13(0x2c370a9a), result Branch=0
    li x3, 0xcccc
    li x13, 0x2c370a9a
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_3_0)
    
     # Testcase 10:  rs1:x8(0x2882a0b3), result Branch=0
    li x3, 0xcccc
    li x8, 0x2882a0b3
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 11:  rs1:x13(0x91dd5ad6), result Branch=0
    li x3, 0xcccc
    li x13, 0x91dd5ad6
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 12:  rs1:x12(0x42f1d629), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x42f1d629
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 13:  rs1:x11(0xcddbdf6f), result Branch=0
    li x3, 0xcccc
    li x11, 0xcddbdf6f
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 14:  rs1:x9(0x4d236af8), result Branch=0
    li x3, 0xcccc
    li x9, 0x4d236af8
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_4_0)
    
     # Testcase 15:  rs1:x10(0x983b9f63), result Branch=0
    li x3, 0xcccc
    li x10, 0x983b9f63
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 16:  rs1:x10(0x1fbe3ca6), result Branch=0
    li x3, 0xcccc
    li x10, 0x1fbe3ca6
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 17:  rs1:x10(0x353a8593), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x353a8593
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 18:  rs1:x15(0x66268a1a), result Branch=0
    li x3, 0xcccc
    li x15, 0x66268a1a
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 19:  rs1:x9(0x28ac54a3), result Branch=0
    li x3, 0xcccc
    li x9, 0x28ac54a3
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_5_0)
    
     # Testcase 20:  rs1:x15(0xdc3713a2), result Branch=0
    li x3, 0xcccc
    li x15, 0xdc3713a2
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 21:  rs1:x9(0x74674399), result Branch=0
    li x3, 0xcccc
    li x9, 0x74674399
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 22:  rs1:x15(0x6bdd9821), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x6bdd9821
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 23:  rs1:x15(0x825648e4), result Branch=0
    li x3, 0xcccc
    li x15, 0x825648e4
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 24:  rs1:x13(0x7bf4ef1c), result Branch=0
    li x3, 0xcccc
    li x13, 0x7bf4ef1c
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_6_0)
    
     # Testcase 25:  rs1:x8(0xf49a4b2), result Branch=0
    li x3, 0xcccc
    li x8, 0xf49a4b2
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 26:  rs1:x14(0xfe9b8abf), result Branch=0
    li x3, 0xcccc
    li x14, 0xfe9b8abf
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 27:  rs1:x8(0x347ebc89), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x347ebc89
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 28:  rs1:x9(0xf52a52bf), result Branch=0
    li x3, 0xcccc
    li x9, 0xf52a52bf
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 29:  rs1:x15(0xcaa4b80e), result Branch=0
    li x3, 0xcccc
    li x15, 0xcaa4b80e
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_7_0)
    
     # Testcase 30:  rs1:x14(0xffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffff
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 31:  rs1:x11(0x80000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000000
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 32:  rs1:x14(0xffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffff
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 33:  rs1:x9(0x0), result Branch=1
    li x3, 0xcccc
    li x9, 0x0
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 34:  rs1:x10(0xffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xffffffff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_8_0)
    
     # Testcase 35:  rs1:x15(0x80000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 36:  rs1:x13(0xffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffff
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 37:  rs1:x15(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x0
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 38:  rs1:x11(0xffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xffffffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 39:  rs1:x13(0x80000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x80000000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_9_0)
    
     # Testcase 40:  rs1:x8(0x1), result Branch=0
    li x3, 0xcccc
    li x8, 0x1
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 41:  rs1:x9(0x2), result Branch=0
    li x3, 0xcccc
    li x9, 0x2
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 42:  rs1:x10(0x4), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x4
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 43:  rs1:x11(0x8), result Branch=0
    li x3, 0xcccc
    li x11, 0x8
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 44:  rs1:x12(0x10), result Branch=0
    li x3, 0xcccc
    li x12, 0x10
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_10_0)
    
     # Testcase 45:  rs1:x13(0x20), result Branch=0
    li x3, 0xcccc
    li x13, 0x20
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 46:  rs1:x14(0x40), result Branch=0
    li x3, 0xcccc
    li x14, 0x40
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 47:  rs1:x15(0x80), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x80
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 48:  rs1:x8(0x100), result Branch=0
    li x3, 0xcccc
    li x8, 0x100
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 49:  rs1:x9(0x200), result Branch=0
    li x3, 0xcccc
    li x9, 0x200
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_11_0)
    
     # Testcase 50:  rs1:x10(0x400), result Branch=0
    li x3, 0xcccc
    li x10, 0x400
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 51:  rs1:x11(0x800), result Branch=0
    li x3, 0xcccc
    li x11, 0x800
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 52:  rs1:x12(0x1000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x1000
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 53:  rs1:x13(0x2000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 54:  rs1:x14(0x4000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_12_0)
    
     # Testcase 55:  rs1:x15(0x8000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 56:  rs1:x8(0x10000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 57:  rs1:x9(0x20000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x20000
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 58:  rs1:x10(0x40000), result Branch=0
    li x3, 0xcccc
    li x10, 0x40000
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 59:  rs1:x11(0x80000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_13_0)
    
     # Testcase 60:  rs1:x12(0x100000), result Branch=0
    li x3, 0xcccc
    li x12, 0x100000
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 61:  rs1:x13(0x200000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 62:  rs1:x14(0x400000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x400000
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 63:  rs1:x15(0x800000), result Branch=0
    li x3, 0xcccc
    li x15, 0x800000
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 64:  rs1:x8(0x1000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x1000000
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_14_0)
    
     # Testcase 65:  rs1:x9(0x2000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x2000000
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 66:  rs1:x10(0x4000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 67:  rs1:x11(0x8000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x8000000
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 68:  rs1:x12(0x10000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x10000000
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 69:  rs1:x13(0x20000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x20000000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_15_0)
    
     # Testcase 70:  rs1:x14(0x40000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x40000000
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 71:  rs1:x15(0x80000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 72:  rs1:x8(0xfffffffe), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffffe
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 73:  rs1:x9(0xfffffffd), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffd
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 74:  rs1:x10(0xfffffffb), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffb
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_16_0)
    
     # Testcase 75:  rs1:x11(0xfffffff7), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffff7
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 76:  rs1:x12(0xffffffef), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffef
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 77:  rs1:x13(0xffffffdf), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffffdf
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 78:  rs1:x14(0xffffffbf), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffbf
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 79:  rs1:x15(0xffffff7f), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffff7f
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_17_0)
    
     # Testcase 80:  rs1:x8(0xfffffeff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffeff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 81:  rs1:x9(0xfffffdff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 82:  rs1:x10(0xfffffbff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffffbff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 83:  rs1:x11(0xfffff7ff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffff7ff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 84:  rs1:x12(0xffffefff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_18_0)
    
     # Testcase 85:  rs1:x13(0xffffdfff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffdfff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 86:  rs1:x14(0xffffbfff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 87:  rs1:x15(0xffff7fff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xffff7fff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 88:  rs1:x8(0xfffeffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffeffff
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 89:  rs1:x9(0xfffdffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffdffff
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_19_0)
    
     # Testcase 90:  rs1:x10(0xfffbffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffbffff
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 91:  rs1:x11(0xfff7ffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfff7ffff
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 92:  rs1:x12(0xffefffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0xffefffff
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 93:  rs1:x13(0xffdfffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffdfffff
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 94:  rs1:x14(0xffbfffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffbfffff
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_20_0)
    
     # Testcase 95:  rs1:x15(0xff7fffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xff7fffff
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 96:  rs1:x8(0xfeffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfeffffff
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 97:  rs1:x9(0xfdffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfdffffff
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 98:  rs1:x10(0xfbffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfbffffff
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 99:  rs1:x11(0xf7ffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xf7ffffff
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_21_0)
    
     # Testcase 100:  rs1:x12(0xefffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xefffffff
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 101:  rs1:x13(0xdfffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xdfffffff
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 102:  rs1:x14(0xbfffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xbfffffff
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 103:  rs1:x15(0x7fffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0x7fffffff
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 104:  rs1:x8(0x1), result Branch=0
    li x3, 0xcccc
    li x8, 0x1
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_22_0)
    
     # Testcase 105:  rs1:x9(0x2), result Branch=0
    li x3, 0xcccc
    li x9, 0x2
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 106:  rs1:x10(0x4), result Branch=0
    li x3, 0xcccc
    li x10, 0x4
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 107:  rs1:x11(0x8), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x8
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 108:  rs1:x12(0x10), result Branch=0
    li x3, 0xcccc
    li x12, 0x10
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 109:  rs1:x13(0x20), result Branch=0
    li x3, 0xcccc
    li x13, 0x20
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_23_0)
    
     # Testcase 110:  rs1:x14(0x40), result Branch=0
    li x3, 0xcccc
    li x14, 0x40
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 111:  rs1:x15(0x80), result Branch=0
    li x3, 0xcccc
    li x15, 0x80
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 112:  rs1:x8(0x100), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x100
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 113:  rs1:x9(0x200), result Branch=0
    li x3, 0xcccc
    li x9, 0x200
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 114:  rs1:x10(0x400), result Branch=0
    li x3, 0xcccc
    li x10, 0x400
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_24_0)
    
     # Testcase 115:  rs1:x11(0x800), result Branch=0
    li x3, 0xcccc
    li x11, 0x800
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 116:  rs1:x12(0x1000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 117:  rs1:x13(0x2000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0x2000
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 118:  rs1:x14(0x4000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 119:  rs1:x15(0x8000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_25_0)
    
     # Testcase 120:  rs1:x8(0x10000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 121:  rs1:x9(0x20000), result Branch=0
    li x3, 0xcccc
    li x9, 0x20000
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 122:  rs1:x10(0x40000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x40000
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 123:  rs1:x11(0x80000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 124:  rs1:x12(0x100000), result Branch=0
    li x3, 0xcccc
    li x12, 0x100000
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_26_0)
    
     # Testcase 125:  rs1:x13(0x200000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 126:  rs1:x14(0x400000), result Branch=0
    li x3, 0xcccc
    li x14, 0x400000
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 127:  rs1:x15(0x800000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x800000
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 128:  rs1:x8(0x1000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x1000000
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 129:  rs1:x9(0x2000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x2000000
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_27_0)
    
     # Testcase 130:  rs1:x10(0x4000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 131:  rs1:x11(0x8000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x8000000
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 132:  rs1:x12(0x10000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x10000000
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 133:  rs1:x13(0x20000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x20000000
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 134:  rs1:x14(0x40000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x40000000
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_28_0)
    
     # Testcase 135:  rs1:x15(0x80000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 136:  rs1:x8(0xfffffffe), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffe
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 137:  rs1:x9(0xfffffffd), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfffffffd
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 138:  rs1:x10(0xfffffffb), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffb
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 139:  rs1:x11(0xfffffff7), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffff7
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_29_0)
    
     # Testcase 140:  rs1:x12(0xffffffef), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffef
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 141:  rs1:x13(0xffffffdf), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffdf
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 142:  rs1:x14(0xffffffbf), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffbf
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 143:  rs1:x15(0xffffff7f), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffff7f
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 144:  rs1:x8(0xfffffeff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffeff
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_30_0)
    
     # Testcase 145:  rs1:x9(0xfffffdff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdff
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 146:  rs1:x10(0xfffffbff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffbff
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 147:  rs1:x11(0xfffff7ff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffff7ff
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 148:  rs1:x12(0xffffefff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefff
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 149:  rs1:x13(0xffffdfff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffdfff
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_31_0)
    
     # Testcase 150:  rs1:x14(0xffffbfff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfff
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 151:  rs1:x15(0xffff7fff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffff7fff
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 152:  rs1:x8(0xfffeffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffeffff
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 153:  rs1:x9(0xfffdffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffdffff
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 154:  rs1:x10(0xfffbffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffbffff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_32_0)
    
     # Testcase 155:  rs1:x11(0xfff7ffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfff7ffff
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 156:  rs1:x12(0xffefffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffefffff
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 157:  rs1:x13(0xffdfffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffdfffff
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 158:  rs1:x14(0xffbfffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffbfffff
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 159:  rs1:x15(0xff7fffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xff7fffff
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_33_0)
    
     # Testcase 160:  rs1:x8(0xfeffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfeffffff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 161:  rs1:x9(0xfdffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfdffffff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 162:  rs1:x10(0xfbffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfbffffff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 163:  rs1:x11(0xf7ffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xf7ffffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 164:  rs1:x12(0xefffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xefffffff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_34_0)
    
     # Testcase 165:  rs1:x13(0xdfffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xdfffffff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 166:  rs1:x14(0xbfffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xbfffffff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 167:  rs1:x15(0x7fffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x7fffffff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

	
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

