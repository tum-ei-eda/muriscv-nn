// RISC-V Architectural Validation Test C-BNEZ-01
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
// Description: Testing instruction 'c.bnez'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.bnez)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.bnez)

    RVTEST_SIGBASE(x1,signature_1_0)
    
     # Testcase 0:  rs1:x11(0x54f4aeeb), result Branch=1
    li x3, 0xcccc
    li x11, 0x54f4aeeb
    c.bnez x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 1:  rs1:x12(0xe1b1199b), result Branch=1
    li x3, 0xcccc
    li x12, 0xe1b1199b
    c.bnez x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 2:  rs1:x14(0xb26566a0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xb26566a0
    c.bnez x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 3:  rs1:x12(0xf27008e6), result Branch=1
    li x3, 0xcccc
    li x12, 0xf27008e6
    c.bnez x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 4:  rs1:x10(0xc8484a3), result Branch=1
    li x3, 0xcccc
    li x10, 0xc8484a3
    c.bnez x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_2_0)
    
     # Testcase 5:  rs1:x8(0xa783d03f), result Branch=1
    li x3, 0xcccc
    li x8, 0xa783d03f
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 6:  rs1:x11(0xfd7b9df8), result Branch=1
    li x3, 0xcccc
    li x11, 0xfd7b9df8
    c.bnez x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 7:  rs1:x15(0xafaa29d), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xafaa29d
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 8:  rs1:x13(0x413f2c62), result Branch=1
    li x3, 0xcccc
    li x13, 0x413f2c62
    c.bnez x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 9:  rs1:x13(0x2c370a9a), result Branch=1
    li x3, 0xcccc
    li x13, 0x2c370a9a
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_3_0)
    
     # Testcase 10:  rs1:x8(0x2882a0b3), result Branch=1
    li x3, 0xcccc
    li x8, 0x2882a0b3
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 11:  rs1:x13(0x91dd5ad6), result Branch=1
    li x3, 0xcccc
    li x13, 0x91dd5ad6
    c.bnez x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 12:  rs1:x12(0x42f1d629), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x42f1d629
    c.bnez x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 13:  rs1:x11(0xcddbdf6f), result Branch=1
    li x3, 0xcccc
    li x11, 0xcddbdf6f
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 14:  rs1:x9(0x4d236af8), result Branch=1
    li x3, 0xcccc
    li x9, 0x4d236af8
    c.bnez x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_4_0)
    
     # Testcase 15:  rs1:x10(0x983b9f63), result Branch=1
    li x3, 0xcccc
    li x10, 0x983b9f63
    c.bnez x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 16:  rs1:x10(0x1fbe3ca6), result Branch=1
    li x3, 0xcccc
    li x10, 0x1fbe3ca6
    c.bnez x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 17:  rs1:x10(0x353a8593), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x353a8593
    c.bnez x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 18:  rs1:x15(0x66268a1a), result Branch=1
    li x3, 0xcccc
    li x15, 0x66268a1a
    c.bnez x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 19:  rs1:x9(0x28ac54a3), result Branch=1
    li x3, 0xcccc
    li x9, 0x28ac54a3
    c.bnez x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_5_0)
    
     # Testcase 20:  rs1:x15(0xdc3713a2), result Branch=1
    li x3, 0xcccc
    li x15, 0xdc3713a2
    c.bnez x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 21:  rs1:x9(0x74674399), result Branch=1
    li x3, 0xcccc
    li x9, 0x74674399
    c.bnez x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 22:  rs1:x15(0x6bdd9821), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x6bdd9821
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 23:  rs1:x15(0x825648e4), result Branch=1
    li x3, 0xcccc
    li x15, 0x825648e4
    c.bnez x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 24:  rs1:x13(0x7bf4ef1c), result Branch=1
    li x3, 0xcccc
    li x13, 0x7bf4ef1c
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_6_0)
    
     # Testcase 25:  rs1:x8(0xf49a4b2), result Branch=1
    li x3, 0xcccc
    li x8, 0xf49a4b2
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 26:  rs1:x14(0xfe9b8abf), result Branch=1
    li x3, 0xcccc
    li x14, 0xfe9b8abf
    c.bnez x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 27:  rs1:x8(0x347ebc89), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x347ebc89
    c.bnez x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 28:  rs1:x9(0xf52a52bf), result Branch=1
    li x3, 0xcccc
    li x9, 0xf52a52bf
    c.bnez x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 29:  rs1:x15(0xcaa4b80e), result Branch=1
    li x3, 0xcccc
    li x15, 0xcaa4b80e
    c.bnez x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_7_0)
    
     # Testcase 30:  rs1:x14(0xffffffff), result Branch=1
    li x3, 0xcccc
    li x14, 0xffffffff
    c.bnez x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 31:  rs1:x11(0x80000000), result Branch=1
    li x3, 0xcccc
    li x11, 0x80000000
    c.bnez x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 32:  rs1:x14(0xffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffff
    c.bnez x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 33:  rs1:x9(0x0), result Branch=0
    li x3, 0xcccc
    li x9, 0x0
    c.bnez x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 34:  rs1:x10(0xffffffff), result Branch=1
    li x3, 0xcccc
    li x10, 0xffffffff
    c.bnez x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_8_0)
    
     # Testcase 35:  rs1:x15(0x80000000), result Branch=1
    li x3, 0xcccc
    li x15, 0x80000000
    c.bnez x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 36:  rs1:x13(0xffffffff), result Branch=1
    li x3, 0xcccc
    li x13, 0xffffffff
    c.bnez x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 37:  rs1:x15(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x0
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 38:  rs1:x11(0xffffffff), result Branch=1
    li x3, 0xcccc
    li x11, 0xffffffff
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 39:  rs1:x13(0x80000000), result Branch=1
    li x3, 0xcccc
    li x13, 0x80000000
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_9_0)
    
     # Testcase 40:  rs1:x8(0x1), result Branch=1
    li x3, 0xcccc
    li x8, 0x1
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 41:  rs1:x9(0x2), result Branch=1
    li x3, 0xcccc
    li x9, 0x2
    c.bnez x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 42:  rs1:x10(0x4), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x4
    c.bnez x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 43:  rs1:x11(0x8), result Branch=1
    li x3, 0xcccc
    li x11, 0x8
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 44:  rs1:x12(0x10), result Branch=1
    li x3, 0xcccc
    li x12, 0x10
    c.bnez x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_10_0)
    
     # Testcase 45:  rs1:x13(0x20), result Branch=1
    li x3, 0xcccc
    li x13, 0x20
    c.bnez x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 46:  rs1:x14(0x40), result Branch=1
    li x3, 0xcccc
    li x14, 0x40
    c.bnez x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 47:  rs1:x15(0x80), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x80
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 48:  rs1:x8(0x100), result Branch=1
    li x3, 0xcccc
    li x8, 0x100
    c.bnez x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 49:  rs1:x9(0x200), result Branch=1
    li x3, 0xcccc
    li x9, 0x200
    c.bnez x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_11_0)
    
     # Testcase 50:  rs1:x10(0x400), result Branch=1
    li x3, 0xcccc
    li x10, 0x400
    c.bnez x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 51:  rs1:x11(0x800), result Branch=1
    li x3, 0xcccc
    li x11, 0x800
    c.bnez x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 52:  rs1:x12(0x1000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x1000
    c.bnez x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 53:  rs1:x13(0x2000), result Branch=1
    li x3, 0xcccc
    li x13, 0x2000
    c.bnez x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 54:  rs1:x14(0x4000), result Branch=1
    li x3, 0xcccc
    li x14, 0x4000
    c.bnez x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_12_0)
    
     # Testcase 55:  rs1:x15(0x8000), result Branch=1
    li x3, 0xcccc
    li x15, 0x8000
    c.bnez x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 56:  rs1:x8(0x10000), result Branch=1
    li x3, 0xcccc
    li x8, 0x10000
    c.bnez x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 57:  rs1:x9(0x20000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x20000
    c.bnez x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 58:  rs1:x10(0x40000), result Branch=1
    li x3, 0xcccc
    li x10, 0x40000
    c.bnez x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 59:  rs1:x11(0x80000), result Branch=1
    li x3, 0xcccc
    li x11, 0x80000
    c.bnez x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_13_0)
    
     # Testcase 60:  rs1:x12(0x100000), result Branch=1
    li x3, 0xcccc
    li x12, 0x100000
    c.bnez x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 61:  rs1:x13(0x200000), result Branch=1
    li x3, 0xcccc
    li x13, 0x200000
    c.bnez x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 62:  rs1:x14(0x400000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x400000
    c.bnez x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 63:  rs1:x15(0x800000), result Branch=1
    li x3, 0xcccc
    li x15, 0x800000
    c.bnez x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 64:  rs1:x8(0x1000000), result Branch=1
    li x3, 0xcccc
    li x8, 0x1000000
    c.bnez x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_14_0)
    
     # Testcase 65:  rs1:x9(0x2000000), result Branch=1
    li x3, 0xcccc
    li x9, 0x2000000
    c.bnez x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 66:  rs1:x10(0x4000000), result Branch=1
    li x3, 0xcccc
    li x10, 0x4000000
    c.bnez x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 67:  rs1:x11(0x8000000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x8000000
    c.bnez x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 68:  rs1:x12(0x10000000), result Branch=1
    li x3, 0xcccc
    li x12, 0x10000000
    c.bnez x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 69:  rs1:x13(0x20000000), result Branch=1
    li x3, 0xcccc
    li x13, 0x20000000
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_15_0)
    
     # Testcase 70:  rs1:x14(0x40000000), result Branch=1
    li x3, 0xcccc
    li x14, 0x40000000
    c.bnez x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 71:  rs1:x15(0x80000000), result Branch=1
    li x3, 0xcccc
    li x15, 0x80000000
    c.bnez x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 72:  rs1:x8(0xfffffffe), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffffe
    c.bnez x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 73:  rs1:x9(0xfffffffd), result Branch=1
    li x3, 0xcccc
    li x9, 0xfffffffd
    c.bnez x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 74:  rs1:x10(0xfffffffb), result Branch=1
    li x3, 0xcccc
    li x10, 0xfffffffb
    c.bnez x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_16_0)
    
     # Testcase 75:  rs1:x11(0xfffffff7), result Branch=1
    li x3, 0xcccc
    li x11, 0xfffffff7
    c.bnez x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 76:  rs1:x12(0xffffffef), result Branch=1
    li x3, 0xcccc
    li x12, 0xffffffef
    c.bnez x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 77:  rs1:x13(0xffffffdf), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffffdf
    c.bnez x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 78:  rs1:x14(0xffffffbf), result Branch=1
    li x3, 0xcccc
    li x14, 0xffffffbf
    c.bnez x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 79:  rs1:x15(0xffffff7f), result Branch=1
    li x3, 0xcccc
    li x15, 0xffffff7f
    c.bnez x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_17_0)
    
     # Testcase 80:  rs1:x8(0xfffffeff), result Branch=1
    li x3, 0xcccc
    li x8, 0xfffffeff
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 81:  rs1:x9(0xfffffdff), result Branch=1
    li x3, 0xcccc
    li x9, 0xfffffdff
    c.bnez x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 82:  rs1:x10(0xfffffbff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffffbff
    c.bnez x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 83:  rs1:x11(0xfffff7ff), result Branch=1
    li x3, 0xcccc
    li x11, 0xfffff7ff
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 84:  rs1:x12(0xffffefff), result Branch=1
    li x3, 0xcccc
    li x12, 0xffffefff
    c.bnez x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_18_0)
    
     # Testcase 85:  rs1:x13(0xffffdfff), result Branch=1
    li x3, 0xcccc
    li x13, 0xffffdfff
    c.bnez x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 86:  rs1:x14(0xffffbfff), result Branch=1
    li x3, 0xcccc
    li x14, 0xffffbfff
    c.bnez x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 87:  rs1:x15(0xffff7fff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xffff7fff
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 88:  rs1:x8(0xfffeffff), result Branch=1
    li x3, 0xcccc
    li x8, 0xfffeffff
    c.bnez x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 89:  rs1:x9(0xfffdffff), result Branch=1
    li x3, 0xcccc
    li x9, 0xfffdffff
    c.bnez x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_19_0)
    
     # Testcase 90:  rs1:x10(0xfffbffff), result Branch=1
    li x3, 0xcccc
    li x10, 0xfffbffff
    c.bnez x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 91:  rs1:x11(0xfff7ffff), result Branch=1
    li x3, 0xcccc
    li x11, 0xfff7ffff
    c.bnez x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 92:  rs1:x12(0xffefffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0xffefffff
    c.bnez x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 93:  rs1:x13(0xffdfffff), result Branch=1
    li x3, 0xcccc
    li x13, 0xffdfffff
    c.bnez x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 94:  rs1:x14(0xffbfffff), result Branch=1
    li x3, 0xcccc
    li x14, 0xffbfffff
    c.bnez x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_20_0)
    
     # Testcase 95:  rs1:x15(0xff7fffff), result Branch=1
    li x3, 0xcccc
    li x15, 0xff7fffff
    c.bnez x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 96:  rs1:x8(0xfeffffff), result Branch=1
    li x3, 0xcccc
    li x8, 0xfeffffff
    c.bnez x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 97:  rs1:x9(0xfdffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfdffffff
    c.bnez x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 98:  rs1:x10(0xfbffffff), result Branch=1
    li x3, 0xcccc
    li x10, 0xfbffffff
    c.bnez x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 99:  rs1:x11(0xf7ffffff), result Branch=1
    li x3, 0xcccc
    li x11, 0xf7ffffff
    c.bnez x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_21_0)
    
     # Testcase 100:  rs1:x12(0xefffffff), result Branch=1
    li x3, 0xcccc
    li x12, 0xefffffff
    c.bnez x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 101:  rs1:x13(0xdfffffff), result Branch=1
    li x3, 0xcccc
    li x13, 0xdfffffff
    c.bnez x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 102:  rs1:x14(0xbfffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xbfffffff
    c.bnez x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 103:  rs1:x15(0x7fffffff), result Branch=1
    li x3, 0xcccc
    li x15, 0x7fffffff
    c.bnez x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 104:  rs1:x8(0x1), result Branch=1
    li x3, 0xcccc
    li x8, 0x1
    c.bnez x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_22_0)
    
     # Testcase 105:  rs1:x9(0x2), result Branch=1
    li x3, 0xcccc
    li x9, 0x2
    c.bnez x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 106:  rs1:x10(0x4), result Branch=1
    li x3, 0xcccc
    li x10, 0x4
    c.bnez x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 107:  rs1:x11(0x8), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x8
    c.bnez x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 108:  rs1:x12(0x10), result Branch=1
    li x3, 0xcccc
    li x12, 0x10
    c.bnez x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 109:  rs1:x13(0x20), result Branch=1
    li x3, 0xcccc
    li x13, 0x20
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_23_0)
    
     # Testcase 110:  rs1:x14(0x40), result Branch=1
    li x3, 0xcccc
    li x14, 0x40
    c.bnez x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 111:  rs1:x15(0x80), result Branch=1
    li x3, 0xcccc
    li x15, 0x80
    c.bnez x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 112:  rs1:x8(0x100), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x100
    c.bnez x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 113:  rs1:x9(0x200), result Branch=1
    li x3, 0xcccc
    li x9, 0x200
    c.bnez x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 114:  rs1:x10(0x400), result Branch=1
    li x3, 0xcccc
    li x10, 0x400
    c.bnez x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_24_0)
    
     # Testcase 115:  rs1:x11(0x800), result Branch=1
    li x3, 0xcccc
    li x11, 0x800
    c.bnez x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 116:  rs1:x12(0x1000), result Branch=1
    li x3, 0xcccc
    li x12, 0x1000
    c.bnez x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 117:  rs1:x13(0x2000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0x2000
    c.bnez x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 118:  rs1:x14(0x4000), result Branch=1
    li x3, 0xcccc
    li x14, 0x4000
    c.bnez x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 119:  rs1:x15(0x8000), result Branch=1
    li x3, 0xcccc
    li x15, 0x8000
    c.bnez x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_25_0)
    
     # Testcase 120:  rs1:x8(0x10000), result Branch=1
    li x3, 0xcccc
    li x8, 0x10000
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 121:  rs1:x9(0x20000), result Branch=1
    li x3, 0xcccc
    li x9, 0x20000
    c.bnez x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 122:  rs1:x10(0x40000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x40000
    c.bnez x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 123:  rs1:x11(0x80000), result Branch=1
    li x3, 0xcccc
    li x11, 0x80000
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 124:  rs1:x12(0x100000), result Branch=1
    li x3, 0xcccc
    li x12, 0x100000
    c.bnez x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_26_0)
    
     # Testcase 125:  rs1:x13(0x200000), result Branch=1
    li x3, 0xcccc
    li x13, 0x200000
    c.bnez x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 126:  rs1:x14(0x400000), result Branch=1
    li x3, 0xcccc
    li x14, 0x400000
    c.bnez x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 127:  rs1:x15(0x800000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x800000
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 128:  rs1:x8(0x1000000), result Branch=1
    li x3, 0xcccc
    li x8, 0x1000000
    c.bnez x8, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 129:  rs1:x9(0x2000000), result Branch=1
    li x3, 0xcccc
    li x9, 0x2000000
    c.bnez x9, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_27_0)
    
     # Testcase 130:  rs1:x10(0x4000000), result Branch=1
    li x3, 0xcccc
    li x10, 0x4000000
    c.bnez x10, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 131:  rs1:x11(0x8000000), result Branch=1
    li x3, 0xcccc
    li x11, 0x8000000
    c.bnez x11, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 132:  rs1:x12(0x10000000), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x10000000
    c.bnez x12, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 133:  rs1:x13(0x20000000), result Branch=1
    li x3, 0xcccc
    li x13, 0x20000000
    c.bnez x13, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 134:  rs1:x14(0x40000000), result Branch=1
    li x3, 0xcccc
    li x14, 0x40000000
    c.bnez x14, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_28_0)
    
     # Testcase 135:  rs1:x15(0x80000000), result Branch=1
    li x3, 0xcccc
    li x15, 0x80000000
    c.bnez x15, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 136:  rs1:x8(0xfffffffe), result Branch=1
    li x3, 0xcccc
    li x8, 0xfffffffe
    c.bnez x8, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 137:  rs1:x9(0xfffffffd), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfffffffd
    c.bnez x9, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 138:  rs1:x10(0xfffffffb), result Branch=1
    li x3, 0xcccc
    li x10, 0xfffffffb
    c.bnez x10, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 139:  rs1:x11(0xfffffff7), result Branch=1
    li x3, 0xcccc
    li x11, 0xfffffff7
    c.bnez x11, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_29_0)
    
     # Testcase 140:  rs1:x12(0xffffffef), result Branch=1
    li x3, 0xcccc
    li x12, 0xffffffef
    c.bnez x12, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 141:  rs1:x13(0xffffffdf), result Branch=1
    li x3, 0xcccc
    li x13, 0xffffffdf
    c.bnez x13, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 142:  rs1:x14(0xffffffbf), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffbf
    c.bnez x14, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 143:  rs1:x15(0xffffff7f), result Branch=1
    li x3, 0xcccc
    li x15, 0xffffff7f
    c.bnez x15, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 144:  rs1:x8(0xfffffeff), result Branch=1
    li x3, 0xcccc
    li x8, 0xfffffeff
    c.bnez x8, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_30_0)
    
     # Testcase 145:  rs1:x9(0xfffffdff), result Branch=1
    li x3, 0xcccc
    li x9, 0xfffffdff
    c.bnez x9, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 146:  rs1:x10(0xfffffbff), result Branch=1
    li x3, 0xcccc
    li x10, 0xfffffbff
    c.bnez x10, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 147:  rs1:x11(0xfffff7ff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffff7ff
    c.bnez x11, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 148:  rs1:x12(0xffffefff), result Branch=1
    li x3, 0xcccc
    li x12, 0xffffefff
    c.bnez x12, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 149:  rs1:x13(0xffffdfff), result Branch=1
    li x3, 0xcccc
    li x13, 0xffffdfff
    c.bnez x13, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_31_0)
    
     # Testcase 150:  rs1:x14(0xffffbfff), result Branch=1
    li x3, 0xcccc
    li x14, 0xffffbfff
    c.bnez x14, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 151:  rs1:x15(0xffff7fff), result Branch=1
    li x3, 0xcccc
    li x15, 0xffff7fff
    c.bnez x15, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 152:  rs1:x8(0xfffeffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffeffff
    c.bnez x8, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 153:  rs1:x9(0xfffdffff), result Branch=1
    li x3, 0xcccc
    li x9, 0xfffdffff
    c.bnez x9, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 154:  rs1:x10(0xfffbffff), result Branch=1
    li x3, 0xcccc
    li x10, 0xfffbffff
    c.bnez x10, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_32_0)
    
     # Testcase 155:  rs1:x11(0xfff7ffff), result Branch=1
    li x3, 0xcccc
    li x11, 0xfff7ffff
    c.bnez x11, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 156:  rs1:x12(0xffefffff), result Branch=1
    li x3, 0xcccc
    li x12, 0xffefffff
    c.bnez x12, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 157:  rs1:x13(0xffdfffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffdfffff
    c.bnez x13, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 158:  rs1:x14(0xffbfffff), result Branch=1
    li x3, 0xcccc
    li x14, 0xffbfffff
    c.bnez x14, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 159:  rs1:x15(0xff7fffff), result Branch=1
    li x3, 0xcccc
    li x15, 0xff7fffff
    c.bnez x15, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_33_0)
    
     # Testcase 160:  rs1:x8(0xfeffffff), result Branch=1
    li x3, 0xcccc
    li x8, 0xfeffffff
    c.bnez x8, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 161:  rs1:x9(0xfdffffff), result Branch=1
    li x3, 0xcccc
    li x9, 0xfdffffff
    c.bnez x9, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 162:  rs1:x10(0xfbffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfbffffff
    c.bnez x10, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 163:  rs1:x11(0xf7ffffff), result Branch=1
    li x3, 0xcccc
    li x11, 0xf7ffffff
    c.bnez x11, 4f
    li x3, 0x123ab
4: 
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 164:  rs1:x12(0xefffffff), result Branch=1
    li x3, 0xcccc
    li x12, 0xefffffff
    c.bnez x12, 5f
    li x3, 0x123ab
5: 
    sw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_34_0)
    
     # Testcase 165:  rs1:x13(0xdfffffff), result Branch=1
    li x3, 0xcccc
    li x13, 0xdfffffff
    c.bnez x13, 1f
    li x3, 0x123ab
1: 
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 166:  rs1:x14(0xbfffffff), result Branch=1
    li x3, 0xcccc
    li x14, 0xbfffffff
    c.bnez x14, 2f
    li x3, 0x123ab
2: 
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 167:  rs1:x15(0x7fffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x7fffffff
    c.bnez x15, 2b
    li x3, 0x123ab
4:
    sw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

	
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

