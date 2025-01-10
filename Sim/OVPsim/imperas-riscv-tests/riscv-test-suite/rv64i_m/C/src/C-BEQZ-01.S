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
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.beqz)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.beqz)

    RVTEST_SIGBASE(x1,signature_1_0)
    
     # Testcase 0:  rs1:x11(0x54f4aeeb151a01ef), result Branch=0
    li x3, 0xcccc
    li x11, 0x54f4aeeb151a01ef
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 1:  rs1:x12(0xe1b1199b429ede3d), result Branch=0
    li x3, 0xcccc
    li x12, 0xe1b1199b429ede3d
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 2:  rs1:x14(0xb26566a091a8d5fd), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xb26566a091a8d5fd
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 3:  rs1:x12(0xf27008e60466250f), result Branch=0
    li x3, 0xcccc
    li x12, 0xf27008e60466250f
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 4:  rs1:x10(0xc8484a3c737ad3a), result Branch=0
    li x3, 0xcccc
    li x10, 0xc8484a3c737ad3a
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_2_0)
    
     # Testcase 5:  rs1:x8(0xa783d03f7ca660db), result Branch=0
    li x3, 0xcccc
    li x8, 0xa783d03f7ca660db
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 6:  rs1:x11(0xfd7b9df82c63c847), result Branch=0
    li x3, 0xcccc
    li x11, 0xfd7b9df82c63c847
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 7:  rs1:x15(0xafaa29d195b62bf), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xafaa29d195b62bf
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 8:  rs1:x13(0x413f2c6234b80fd4), result Branch=0
    li x3, 0xcccc
    li x13, 0x413f2c6234b80fd4
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 9:  rs1:x13(0x2c370a9a34267ad9), result Branch=0
    li x3, 0xcccc
    li x13, 0x2c370a9a34267ad9
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_3_0)
    
     # Testcase 10:  rs1:x8(0x2882a0b367dd3492), result Branch=0
    li x3, 0xcccc
    li x8, 0x2882a0b367dd3492
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 11:  rs1:x13(0x91dd5ad6b2d3f1c5), result Branch=0
    li x3, 0xcccc
    li x13, 0x91dd5ad6b2d3f1c5
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 12:  rs1:x12(0x42f1d6295233a4dd), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x42f1d6295233a4dd
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 13:  rs1:x11(0xcddbdf6f18fc88d5), result Branch=0
    li x3, 0xcccc
    li x11, 0xcddbdf6f18fc88d5
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 14:  rs1:x9(0x4d236af8c83b3c30), result Branch=0
    li x3, 0xcccc
    li x9, 0x4d236af8c83b3c30
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_4_0)
    
     # Testcase 15:  rs1:x10(0x983b9f63a968a97f), result Branch=0
    li x3, 0xcccc
    li x10, 0x983b9f63a968a97f
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 16:  rs1:x10(0x1fbe3ca65b086787), result Branch=0
    li x3, 0xcccc
    li x10, 0x1fbe3ca65b086787
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 17:  rs1:x10(0x353a85936075c1a2), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x353a85936075c1a2
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 18:  rs1:x15(0x66268a1a4ff09378), result Branch=0
    li x3, 0xcccc
    li x15, 0x66268a1a4ff09378
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 19:  rs1:x9(0x28ac54a3b32a4c52), result Branch=0
    li x3, 0xcccc
    li x9, 0x28ac54a3b32a4c52
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_5_0)
    
     # Testcase 20:  rs1:x15(0xdc3713a217a2fb1a), result Branch=0
    li x3, 0xcccc
    li x15, 0xdc3713a217a2fb1a
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 21:  rs1:x9(0x74674399484605f6), result Branch=0
    li x3, 0xcccc
    li x9, 0x74674399484605f6
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 22:  rs1:x15(0x6bdd9821fc9d848f), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x6bdd9821fc9d848f
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 23:  rs1:x15(0x825648e49b1a8042), result Branch=0
    li x3, 0xcccc
    li x15, 0x825648e49b1a8042
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 24:  rs1:x13(0x7bf4ef1c426b8dfb), result Branch=0
    li x3, 0xcccc
    li x13, 0x7bf4ef1c426b8dfb
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_6_0)
    
     # Testcase 25:  rs1:x8(0xf49a4b2f6323d52), result Branch=0
    li x3, 0xcccc
    li x8, 0xf49a4b2f6323d52
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 26:  rs1:x14(0xfe9b8abf4bfb003d), result Branch=0
    li x3, 0xcccc
    li x14, 0xfe9b8abf4bfb003d
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 27:  rs1:x8(0x347ebc89f22b6484), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x347ebc89f22b6484
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 28:  rs1:x9(0xf52a52bf0cc9d6c8), result Branch=0
    li x3, 0xcccc
    li x9, 0xf52a52bf0cc9d6c8
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 29:  rs1:x15(0xcaa4b80e169dbce8), result Branch=0
    li x3, 0xcccc
    li x15, 0xcaa4b80e169dbce8
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_7_0)
    
     # Testcase 30:  rs1:x14(0xffffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffffff
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 31:  rs1:x11(0x8000000000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x8000000000000000
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 32:  rs1:x14(0xffffffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffffffffffff
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 33:  rs1:x9(0x1), result Branch=0
    li x3, 0xcccc
    li x9, 0x1
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 34:  rs1:x10(0xffffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xffffffffffffffff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_8_0)
    
     # Testcase 35:  rs1:x15(0x8000000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000000000000000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 36:  rs1:x13(0xffffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffffffff
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 37:  rs1:x15(0x1), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x1
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 38:  rs1:x11(0xffffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xffffffffffffffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 39:  rs1:x13(0x8000000000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x8000000000000000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_9_0)
    
     # Testcase 40:  rs1:x8(0x1), result Branch=0
    li x3, 0xcccc
    li x8, 0x1
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 41:  rs1:x9(0x2), result Branch=0
    li x3, 0xcccc
    li x9, 0x2
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 43:  rs1:x11(0x8), result Branch=0
    li x3, 0xcccc
    li x11, 0x8
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 44:  rs1:x12(0x10), result Branch=0
    li x3, 0xcccc
    li x12, 0x10
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_10_0)
    
     # Testcase 45:  rs1:x13(0x20), result Branch=0
    li x3, 0xcccc
    li x13, 0x20
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 46:  rs1:x14(0x40), result Branch=0
    li x3, 0xcccc
    li x14, 0x40
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 48:  rs1:x8(0x100), result Branch=0
    li x3, 0xcccc
    li x8, 0x100
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 49:  rs1:x9(0x200), result Branch=0
    li x3, 0xcccc
    li x9, 0x200
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_11_0)
    
     # Testcase 50:  rs1:x10(0x400), result Branch=0
    li x3, 0xcccc
    li x10, 0x400
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 51:  rs1:x11(0x800), result Branch=0
    li x3, 0xcccc
    li x11, 0x800
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 53:  rs1:x13(0x2000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 54:  rs1:x14(0x4000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_12_0)
    
     # Testcase 55:  rs1:x15(0x8000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 56:  rs1:x8(0x10000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 58:  rs1:x10(0x40000), result Branch=0
    li x3, 0xcccc
    li x10, 0x40000
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 59:  rs1:x11(0x80000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_13_0)
    
     # Testcase 60:  rs1:x12(0x100000), result Branch=0
    li x3, 0xcccc
    li x12, 0x100000
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 61:  rs1:x13(0x200000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 63:  rs1:x15(0x800000), result Branch=0
    li x3, 0xcccc
    li x15, 0x800000
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 64:  rs1:x8(0x1000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x1000000
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_14_0)
    
     # Testcase 65:  rs1:x9(0x2000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x2000000
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 66:  rs1:x10(0x4000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
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
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 68:  rs1:x12(0x10000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x10000000
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 69:  rs1:x13(0x20000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x20000000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_15_0)
    
     # Testcase 70:  rs1:x14(0x40000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x40000000
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 71:  rs1:x15(0x80000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 72:  rs1:x8(0x100000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x100000000
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 73:  rs1:x9(0x200000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x200000000
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 74:  rs1:x10(0x400000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x400000000
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_16_0)
    
     # Testcase 75:  rs1:x11(0x800000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x800000000
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 76:  rs1:x12(0x1000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000000000
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 77:  rs1:x13(0x2000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0x2000000000
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 78:  rs1:x14(0x4000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000000000
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 79:  rs1:x15(0x8000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000000000
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_17_0)
    
     # Testcase 80:  rs1:x8(0x10000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000000000
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 81:  rs1:x9(0x20000000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x20000000000
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 82:  rs1:x10(0x40000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x40000000000
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 83:  rs1:x11(0x80000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000000000
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 84:  rs1:x12(0x100000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x100000000000
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_18_0)
    
     # Testcase 85:  rs1:x13(0x200000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000000000
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 86:  rs1:x14(0x400000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x400000000000
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 87:  rs1:x15(0x800000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x800000000000
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 88:  rs1:x8(0x1000000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x1000000000000
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 89:  rs1:x9(0x2000000000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x2000000000000
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_19_0)
    
     # Testcase 90:  rs1:x10(0x4000000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000000000
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 91:  rs1:x11(0x8000000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x8000000000000
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 92:  rs1:x12(0x10000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x10000000000000
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 93:  rs1:x13(0x20000000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x20000000000000
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 94:  rs1:x14(0x40000000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x40000000000000
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_20_0)
    
     # Testcase 95:  rs1:x15(0x80000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000000000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 96:  rs1:x8(0x100000000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x100000000000000
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 97:  rs1:x9(0x200000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x200000000000000
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 98:  rs1:x10(0x400000000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x400000000000000
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 99:  rs1:x11(0x800000000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x800000000000000
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_21_0)
    
     # Testcase 100:  rs1:x12(0x1000000000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000000000000000
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 101:  rs1:x13(0x2000000000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000000000000000
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 102:  rs1:x14(0x4000000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x4000000000000000
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 103:  rs1:x15(0x8000000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000000000000000
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 104:  rs1:x8(0xfffffffffffffffe), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffffffffe
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_22_0)
    
     # Testcase 105:  rs1:x9(0xfffffffffffffffd), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffffd
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 106:  rs1:x10(0xfffffffffffffffb), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffffffffb
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 107:  rs1:x11(0xfffffffffffffff7), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffffffffffffff7
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 108:  rs1:x12(0xffffffffffffffef), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffffef
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 109:  rs1:x13(0xffffffffffffffdf), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffffffdf
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_23_0)
    
     # Testcase 110:  rs1:x14(0xffffffffffffffbf), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffffbf
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 111:  rs1:x15(0xffffffffffffff7f), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffffffffff7f
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 112:  rs1:x8(0xfffffffffffffeff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffffffffffeff
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 113:  rs1:x9(0xfffffffffffffdff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffdff
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 114:  rs1:x10(0xfffffffffffffbff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffffffbff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_24_0)
    
     # Testcase 115:  rs1:x11(0xfffffffffffff7ff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffffff7ff
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 116:  rs1:x12(0xffffffffffffefff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffefff
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 117:  rs1:x13(0xffffffffffffdfff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffffffffffdfff
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 118:  rs1:x14(0xffffffffffffbfff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffbfff
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 119:  rs1:x15(0xffffffffffff7fff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffffffff7fff
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_25_0)
    
     # Testcase 120:  rs1:x8(0xfffffffffffeffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffffeffff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 121:  rs1:x9(0xfffffffffffdffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffdffff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 122:  rs1:x10(0xfffffffffffbffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffffffffffbffff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 123:  rs1:x11(0xfffffffffff7ffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffff7ffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 124:  rs1:x12(0xffffffffffefffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffefffff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_26_0)
    
     # Testcase 125:  rs1:x13(0xffffffffffdfffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffdfffff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 126:  rs1:x14(0xffffffffffbfffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffbfffff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 127:  rs1:x15(0xffffffffff7fffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xffffffffff7fffff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 128:  rs1:x8(0xfffffffffeffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffeffffff
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 129:  rs1:x9(0xfffffffffdffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffdffffff
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_27_0)
    
     # Testcase 130:  rs1:x10(0xfffffffffbffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffbffffff
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 131:  rs1:x11(0xfffffffff7ffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffff7ffffff
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 132:  rs1:x12(0xffffffffefffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0xffffffffefffffff
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 133:  rs1:x13(0xffffffffdfffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffdfffffff
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 134:  rs1:x14(0xffffffffbfffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffbfffffff
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_28_0)
    
     # Testcase 135:  rs1:x15(0xffffffff7fffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffff7fffffff
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 136:  rs1:x8(0xfffffffeffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffeffffffff
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 137:  rs1:x9(0xfffffffdffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfffffffdffffffff
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 138:  rs1:x10(0xfffffffbffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffbffffffff
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 139:  rs1:x11(0xfffffff7ffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffff7ffffffff
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_29_0)
    
     # Testcase 140:  rs1:x12(0xffffffefffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffefffffffff
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 141:  rs1:x13(0xffffffdfffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffdfffffffff
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 142:  rs1:x14(0xffffffbfffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffbfffffffff
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 143:  rs1:x15(0xffffff7fffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffff7fffffffff
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 144:  rs1:x8(0xfffffeffffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffeffffffffff
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_30_0)
    
     # Testcase 145:  rs1:x9(0xfffffdffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdffffffffff
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 146:  rs1:x10(0xfffffbffffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffbffffffffff
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 147:  rs1:x11(0xfffff7ffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffff7ffffffffff
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 148:  rs1:x12(0xffffefffffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefffffffffff
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 149:  rs1:x13(0xffffdfffffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffdfffffffffff
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_31_0)
    
     # Testcase 150:  rs1:x14(0xffffbfffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfffffffffff
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 151:  rs1:x15(0xffff7fffffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffff7fffffffffff
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 152:  rs1:x8(0xfffeffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffeffffffffffff
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 153:  rs1:x9(0xfffdffffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffdffffffffffff
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 154:  rs1:x10(0xfffbffffffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffbffffffffffff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_32_0)
    
     # Testcase 155:  rs1:x11(0xfff7ffffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfff7ffffffffffff
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 156:  rs1:x12(0xffefffffffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffefffffffffffff
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 157:  rs1:x13(0xffdfffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffdfffffffffffff
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 158:  rs1:x14(0xffbfffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffbfffffffffffff
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 159:  rs1:x15(0xff7fffffffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xff7fffffffffffff
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_33_0)
    
     # Testcase 160:  rs1:x8(0xfeffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfeffffffffffffff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 161:  rs1:x9(0xfdffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfdffffffffffffff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 162:  rs1:x10(0xfbffffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfbffffffffffffff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 163:  rs1:x11(0xf7ffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xf7ffffffffffffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 164:  rs1:x12(0xefffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xefffffffffffffff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_34_0)
    
     # Testcase 165:  rs1:x13(0xdfffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xdfffffffffffffff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 166:  rs1:x14(0xbfffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xbfffffffffffffff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 167:  rs1:x15(0x7fffffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x7fffffffffffffff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 168:  rs1:x8(0x1), result Branch=0
    li x3, 0xcccc
    li x8, 0x1
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 169:  rs1:x9(0x2), result Branch=0
    li x3, 0xcccc
    li x9, 0x2
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_35_0)
    
     # Testcase 170:  rs1:x10(0x4), result Branch=0
    li x3, 0xcccc
    li x10, 0x4
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 171:  rs1:x11(0x8), result Branch=0
    li x3, 0xcccc
    li x11, 0x8
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 172:  rs1:x12(0x10), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x10
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 173:  rs1:x13(0x20), result Branch=0
    li x3, 0xcccc
    li x13, 0x20
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 174:  rs1:x14(0x40), result Branch=0
    li x3, 0xcccc
    li x14, 0x40
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_36_0)
    
     # Testcase 175:  rs1:x15(0x80), result Branch=0
    li x3, 0xcccc
    li x15, 0x80
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 176:  rs1:x8(0x100), result Branch=0
    li x3, 0xcccc
    li x8, 0x100
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 177:  rs1:x9(0x200), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x200
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 178:  rs1:x10(0x400), result Branch=0
    li x3, 0xcccc
    li x10, 0x400
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 179:  rs1:x11(0x800), result Branch=0
    li x3, 0xcccc
    li x11, 0x800
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_37_0)
    
     # Testcase 180:  rs1:x12(0x1000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 181:  rs1:x13(0x2000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 182:  rs1:x14(0x4000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x4000
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 183:  rs1:x15(0x8000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 184:  rs1:x8(0x10000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_38_0)
    
     # Testcase 185:  rs1:x9(0x20000), result Branch=0
    li x3, 0xcccc
    li x9, 0x20000
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 186:  rs1:x10(0x40000), result Branch=0
    li x3, 0xcccc
    li x10, 0x40000
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 187:  rs1:x11(0x80000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x80000
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 188:  rs1:x12(0x100000), result Branch=0
    li x3, 0xcccc
    li x12, 0x100000
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 189:  rs1:x13(0x200000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_39_0)
    
     # Testcase 190:  rs1:x14(0x400000), result Branch=0
    li x3, 0xcccc
    li x14, 0x400000
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 191:  rs1:x15(0x800000), result Branch=0
    li x3, 0xcccc
    li x15, 0x800000
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 192:  rs1:x8(0x1000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0x1000000
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 193:  rs1:x9(0x2000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x2000000
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 194:  rs1:x10(0x4000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_40_0)
    
     # Testcase 195:  rs1:x11(0x8000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x8000000
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 196:  rs1:x12(0x10000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x10000000
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 197:  rs1:x13(0x20000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0x20000000
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 198:  rs1:x14(0x40000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x40000000
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 199:  rs1:x15(0x80000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_41_0)
    
     # Testcase 200:  rs1:x8(0x100000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x100000000
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 201:  rs1:x9(0x200000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x200000000
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 202:  rs1:x10(0x400000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x400000000
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 203:  rs1:x11(0x800000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x800000000
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 204:  rs1:x12(0x1000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000000000
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_42_0)
    
     # Testcase 205:  rs1:x13(0x2000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000000000
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 206:  rs1:x14(0x4000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000000000
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 207:  rs1:x15(0x8000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x8000000000
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 208:  rs1:x8(0x10000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x10000000000
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 209:  rs1:x9(0x20000000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x20000000000
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_43_0)
    
     # Testcase 210:  rs1:x10(0x40000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x40000000000
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 211:  rs1:x11(0x80000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x80000000000
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 212:  rs1:x12(0x100000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x100000000000
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 213:  rs1:x13(0x200000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x200000000000
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 214:  rs1:x14(0x400000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x400000000000
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_44_0)
    
     # Testcase 215:  rs1:x15(0x800000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x800000000000
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 216:  rs1:x8(0x1000000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x1000000000000
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 217:  rs1:x9(0x2000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x2000000000000
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 218:  rs1:x10(0x4000000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x4000000000000
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 219:  rs1:x11(0x8000000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0x8000000000000
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_45_0)
    
     # Testcase 220:  rs1:x12(0x10000000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x10000000000000
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 221:  rs1:x13(0x20000000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x20000000000000
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 222:  rs1:x14(0x40000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x40000000000000
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 223:  rs1:x15(0x80000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x80000000000000
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 224:  rs1:x8(0x100000000000000), result Branch=0
    li x3, 0xcccc
    li x8, 0x100000000000000
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_46_0)
    
     # Testcase 225:  rs1:x9(0x200000000000000), result Branch=0
    li x3, 0xcccc
    li x9, 0x200000000000000
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 226:  rs1:x10(0x400000000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0x400000000000000
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 227:  rs1:x11(0x800000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0x800000000000000
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 228:  rs1:x12(0x1000000000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0x1000000000000000
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 229:  rs1:x13(0x2000000000000000), result Branch=0
    li x3, 0xcccc
    li x13, 0x2000000000000000
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_47_0)
    
     # Testcase 230:  rs1:x14(0x4000000000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0x4000000000000000
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 231:  rs1:x15(0x8000000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0x8000000000000000
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 232:  rs1:x8(0xfffffffffffffffe), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffffffffffffe
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 233:  rs1:x9(0xfffffffffffffffd), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffffd
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 234:  rs1:x10(0xfffffffffffffffb), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffffffffb
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_48_0)
    
     # Testcase 235:  rs1:x11(0xfffffffffffffff7), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffffffff7
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 236:  rs1:x12(0xffffffffffffffef), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffffef
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 237:  rs1:x13(0xffffffffffffffdf), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffffffffffffdf
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 238:  rs1:x14(0xffffffffffffffbf), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffffbf
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 239:  rs1:x15(0xffffffffffffff7f), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffffffffff7f
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_49_0)
    
     # Testcase 240:  rs1:x8(0xfffffffffffffeff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffffffeff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 241:  rs1:x9(0xfffffffffffffdff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffdff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 242:  rs1:x10(0xfffffffffffffbff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffffffffffffbff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 243:  rs1:x11(0xfffffffffffff7ff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffffff7ff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 244:  rs1:x12(0xffffffffffffefff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffefff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_50_0)
    
     # Testcase 245:  rs1:x13(0xffffffffffffdfff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffffdfff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 246:  rs1:x14(0xffffffffffffbfff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffbfff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 247:  rs1:x15(0xffffffffffff7fff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xffffffffffff7fff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 248:  rs1:x8(0xfffffffffffeffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffffeffff
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 249:  rs1:x9(0xfffffffffffdffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffdffff
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_51_0)
    
     # Testcase 250:  rs1:x10(0xfffffffffffbffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffffbffff
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 251:  rs1:x11(0xfffffffffff7ffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffff7ffff
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 252:  rs1:x12(0xffffffffffefffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0xffffffffffefffff
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 253:  rs1:x13(0xffffffffffdfffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffdfffff
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 254:  rs1:x14(0xffffffffffbfffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffbfffff
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_52_0)
    
     # Testcase 255:  rs1:x15(0xffffffffff7fffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffffff7fffff
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 256:  rs1:x8(0xfffffffffeffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffeffffff
    c.beqz x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 257:  rs1:x9(0xfffffffffdffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0xfffffffffdffffff
    c.beqz x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 258:  rs1:x10(0xfffffffffbffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffbffffff
    c.beqz x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 259:  rs1:x11(0xfffffffff7ffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffff7ffffff
    c.beqz x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_53_0)
    
     # Testcase 260:  rs1:x12(0xffffffffefffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffefffffff
    c.beqz x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 261:  rs1:x13(0xffffffffdfffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffdfffffff
    c.beqz x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 262:  rs1:x14(0xffffffffbfffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0xffffffffbfffffff
    c.beqz x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 263:  rs1:x15(0xffffffff7fffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffff7fffffff
    c.beqz x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 264:  rs1:x8(0xfffffffeffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffeffffffff
    c.beqz x8, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_54_0)
    
     # Testcase 265:  rs1:x9(0xfffffffdffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffdffffffff
    c.beqz x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 266:  rs1:x10(0xfffffffbffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffbffffffff
    c.beqz x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 267:  rs1:x11(0xfffffff7ffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffffff7ffffffff
    c.beqz x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 268:  rs1:x12(0xffffffefffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffefffffffff
    c.beqz x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 269:  rs1:x13(0xffffffdfffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffdfffffffff
    c.beqz x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_55_0)
    
     # Testcase 270:  rs1:x14(0xffffffbfffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffbfffffffff
    c.beqz x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 271:  rs1:x15(0xffffff7fffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffff7fffffffff
    c.beqz x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 272:  rs1:x8(0xfffffeffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffeffffffffff
    c.beqz x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 273:  rs1:x9(0xfffffdffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdffffffffff
    c.beqz x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 274:  rs1:x10(0xfffffbffffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffbffffffffff
    c.beqz x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_56_0)
    
     # Testcase 275:  rs1:x11(0xfffff7ffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffff7ffffffffff
    c.beqz x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 276:  rs1:x12(0xffffefffffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefffffffffff
    c.beqz x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 277:  rs1:x13(0xffffdfffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffdfffffffffff
    c.beqz x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 278:  rs1:x14(0xffffbfffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfffffffffff
    c.beqz x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 279:  rs1:x15(0xffff7fffffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0xffff7fffffffffff
    c.beqz x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_57_0)
    
     # Testcase 280:  rs1:x8(0xfffeffffffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffeffffffffffff
    c.beqz x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 281:  rs1:x9(0xfffdffffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffdffffffffffff
    c.beqz x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 282:  rs1:x10(0xfffbffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffbffffffffffff
    c.beqz x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 283:  rs1:x11(0xfff7ffffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xfff7ffffffffffff
    c.beqz x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 284:  rs1:x12(0xffefffffffffffff), result Branch=0
    li x3, 0xcccc
    li x12, 0xffefffffffffffff
    c.beqz x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_58_0)
    
     # Testcase 285:  rs1:x13(0xffdfffffffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xffdfffffffffffff
    c.beqz x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 286:  rs1:x14(0xffbfffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xffbfffffffffffff
    c.beqz x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 287:  rs1:x15(0xff7fffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xff7fffffffffffff
    c.beqz x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 288:  rs1:x8(0xfeffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x8, 0xfeffffffffffffff
    c.beqz x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 289:  rs1:x9(0xfdffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x9, 0xfdffffffffffffff
    c.beqz x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_59_0)
    
     # Testcase 290:  rs1:x10(0xfbffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x10, 0xfbffffffffffffff
    c.beqz x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 291:  rs1:x11(0xf7ffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x11, 0xf7ffffffffffffff
    c.beqz x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 292:  rs1:x12(0xefffffffffffffff), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0xefffffffffffffff
    c.beqz x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 293:  rs1:x13(0xdfffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x13, 0xdfffffffffffffff
    c.beqz x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 294:  rs1:x14(0xbfffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0xbfffffffffffffff
    c.beqz x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_60_0)
    
     # Testcase 295:  rs1:x15(0x7fffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x15, 0x7fffffffffffffff
    c.beqz x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
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

