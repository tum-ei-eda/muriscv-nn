// RISC-V Architectural Validation Test C-JR-01
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
// Description: Testing instruction 'c.jr'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.jr)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.jr)

    RVTEST_SIGBASE(x3,signature_1_0)
 
    
 

 
    # Testcase 0:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 1f 
    c.jr x20
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 1:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x29, 2f 
    c.jr x29
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 2:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2b
    c.jr x31
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_2_0)
 
    
 

 
    # Testcase 3:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x21, 1f 
    c.jr x21
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 4:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x11, 2f 
    c.jr x11
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 5:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    c.jr x2
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_3_0)
 
    
 

 
    # Testcase 6:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x4, 1f 
    c.jr x4
    li x6, 0x123ab
1: 
    sw x6, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



 
    # Testcase 7:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x1, 2f 
    c.jr x1
    li x6, 0x123ab
2: 
    sw x6, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 8:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x30, 2b
    c.jr x30
    li x6, 0x123ab
4: 
    sw x6, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_4_0)
 
    
 

 
    # Testcase 9:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x6, 1f 
    c.jr x6
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 10:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2f 
    c.jr x2
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 11:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2b
    c.jr x14
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_5_0)
 
    
 

 
    # Testcase 12:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x5, 1f 
    c.jr x5
    li x6, 0x123ab
1: 
    sw x6, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xcccc) 



 
    # Testcase 13:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x12, 2f 
    c.jr x12
    li x6, 0x123ab
2: 
    sw x6, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 14:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x26, 2b
    c.jr x26
    li x6, 0x123ab
4: 
    sw x6, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_6_0)
 
    
 

 
    # Testcase 15:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 1f 
    c.jr x3
    li x6, 0x123ab
1: 
    sw x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



 
    # Testcase 16:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x19, 2f 
    c.jr x19
    li x6, 0x123ab
2: 
    sw x6, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 17:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x19, 2b
    c.jr x19
    li x6, 0x123ab
4: 
    sw x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_7_0)
 
    
 

 
    # Testcase 18:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x8, 1f 
    c.jr x8
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 19:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x10, 2f 
    c.jr x10
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 20:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    c.jr x1
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_8_0)
 
    
 

 
    # Testcase 21:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 1f 
    c.jr x18
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 22:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 2f 
    c.jr x24
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 23:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    c.jr x1
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_9_0)
 
    
 

 
    # Testcase 24:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x22, 1f 
    c.jr x22
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 25:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2f 
    c.jr x2
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 26:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2b
    c.jr x31
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_10_0)
 
    
 

 
    # Testcase 27:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 1f 
    c.jr x1
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 28:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 2f 
    c.jr x18
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 29:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    c.jr x1
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_11_0)
 
    
 

 
    # Testcase 30:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x7, 1f 
    c.jr x7
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 31:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 2f 
    c.jr x12
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 32:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x23, 2b
    c.jr x23
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_12_0)
 
    
 

 
    # Testcase 33:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x10, 1f 
    c.jr x10
    li x6, 0x123ab
1: 
    sw x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



 
    # Testcase 34:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 2f 
    c.jr x3
    li x6, 0x123ab
2: 
    sw x6, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 35:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x8, 2b
    c.jr x8
    li x6, 0x123ab
4: 
    sw x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_13_0)
 
    
 

 
    # Testcase 36:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x14, 1f 
    c.jr x14
    li x6, 0x123ab
1: 
    sw x6, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



 
    # Testcase 37:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x8, 2f 
    c.jr x8
    li x6, 0x123ab
2: 
    sw x6, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 38:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x4, 2b
    c.jr x4
    li x6, 0x123ab
4: 
    sw x6, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_14_0)
 
    
 

 
    # Testcase 39:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 1f 
    c.jr x14
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 40:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f 
    c.jr x1
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 41:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    c.jr x2
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x6,signature_15_0)
 
    
 

 
    # Testcase 42:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x3, 1f 
    c.jr x3
    li x8, 0x123ab
1: 
    sw x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



 
    # Testcase 43:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x4, 2f 
    c.jr x4
    li x8, 0x123ab
2: 
    sw x8, 4(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 44:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x5, 2b
    c.jr x5
    li x8, 0x123ab
4: 
    sw x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_16_0)
 
    
 

 
    # Testcase 45:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x6, 1f 
    c.jr x6
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 46:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x7, 2f 
    c.jr x7
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 47:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x8, 2b
    c.jr x8
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_17_0)
 
    
 

 
    # Testcase 48:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x9, 1f 
    c.jr x9
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 49:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x10, 2f 
    c.jr x10
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 50:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x11, 2b
    c.jr x11
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_18_0)
 
    
 

 
    # Testcase 51:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 1f 
    c.jr x12
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 52:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x13, 2f 
    c.jr x13
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 53:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2b
    c.jr x14
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_19_0)
 
    
 

 
    # Testcase 54:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x15, 1f 
    c.jr x15
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 55:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x16, 2f 
    c.jr x16
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 56:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x17, 2b
    c.jr x17
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_20_0)
 
    
 

 
    # Testcase 57:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 1f 
    c.jr x18
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 58:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 2f 
    c.jr x19
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 59:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 2b
    c.jr x20
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_21_0)
 
    
 

 
    # Testcase 60:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x21, 1f 
    c.jr x21
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 61:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x22, 2f 
    c.jr x22
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 62:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x23, 2b
    c.jr x23
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_22_0)
 
    
 

 
    # Testcase 63:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 1f 
    c.jr x24
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 64:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x25, 2f 
    c.jr x25
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 65:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x26, 2b
    c.jr x26
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_23_0)
 
    
 

 
    # Testcase 66:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x27, 1f 
    c.jr x27
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 67:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x28, 2f 
    c.jr x28
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 68:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x29, 2b
    c.jr x29
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_24_0)
 
    
 

 
    # Testcase 69:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x30, 1f 
    c.jr x30
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 70:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2f 
    c.jr x31
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 71:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    c.jr x1
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x5,signature_25_0)
 
    
 

 
    # Testcase 72:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x2, 1f 
    c.jr x2
    li x7, 0x123ab
1: 
    sw x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 



 
    # Testcase 73:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 2f 
    c.jr x3
    li x7, 0x123ab
2: 
    sw x7, 4(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 74:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2b
    c.jr x4
    li x7, 0x123ab
4: 
    sw x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_26_0)
 
    
 

 
    # Testcase 75:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x5, 1f 
    c.jr x5
    li x8, 0x123ab
1: 
    sw x8, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xcccc) 



 
    # Testcase 76:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x6, 2f 
    c.jr x6
    li x8, 0x123ab
2: 
    sw x8, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 77:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x7, 2b
    c.jr x7
    li x8, 0x123ab
4: 
    sw x8, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_27_0)
 
    
 

 
    # Testcase 78:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x8, 1f 
    c.jr x8
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 79:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x9, 2f 
    c.jr x9
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 80:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x10, 2b
    c.jr x10
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_28_0)
 
    
 

 
    # Testcase 81:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x11, 1f 
    c.jr x11
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 82:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 2f 
    c.jr x12
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 83:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x13, 2b
    c.jr x13
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_29_0)
 
    
 

 
    # Testcase 84:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 1f 
    c.jr x14
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 85:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x15, 2f 
    c.jr x15
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 86:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x16, 2b
    c.jr x16
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_30_0)
 
    
 

 
    # Testcase 87:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x17, 1f 
    c.jr x17
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 88:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 2f 
    c.jr x18
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 89:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 2b
    c.jr x19
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_31_0)
 
    
 

 
    # Testcase 90:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 1f 
    c.jr x20
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 91:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x21, 2f 
    c.jr x21
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 92:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x22, 2b
    c.jr x22
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_32_0)
 
    
 

 
    # Testcase 93:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x23, 1f 
    c.jr x23
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 94:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 2f 
    c.jr x24
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 95:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x25, 2b
    c.jr x25
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_33_0)
 
    
 

 
    # Testcase 96:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x26, 1f 
    c.jr x26
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 97:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x27, 2f 
    c.jr x27
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 98:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x28, 2b
    c.jr x28
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_34_0)
 
    
 

 
    # Testcase 99:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x29, 1f 
    c.jr x29
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 100:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x30, 2f 
    c.jr x30
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 101:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2b
    c.jr x31
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_35_0)
 
    
 

 
    # Testcase 102:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x1, 1f 
    c.jr x1
    li x6, 0x123ab
1: 
    sw x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



 
    # Testcase 103:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 2f 
    c.jr x2
    li x6, 0x123ab
2: 
    sw x6, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 104:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 2b
    c.jr x3
    li x6, 0x123ab
4: 
    sw x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_36_0)
 
    
 

 
    # Testcase 105:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x4, 1f 
    c.jr x4
    li x8, 0x123ab
1: 
    sw x8, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



 
    # Testcase 106:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x5, 2f 
    c.jr x5
    li x8, 0x123ab
2: 
    sw x8, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 107:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x6, 2b
    c.jr x6
    li x8, 0x123ab
4: 
    sw x8, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_37_0)
 
    
 

 
    # Testcase 108:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x7, 1f 
    c.jr x7
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 109:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x8, 2f 
    c.jr x8
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 110:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x9, 2b
    c.jr x9
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_38_0)
 
    
 

 
    # Testcase 111:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x10, 1f 
    c.jr x10
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 112:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x11, 2f 
    c.jr x11
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 113:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 2b
    c.jr x12
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_39_0)
 
    
 

 
    # Testcase 114:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x13, 1f 
    c.jr x13
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 115:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2f 
    c.jr x14
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 116:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x15, 2b
    c.jr x15
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_40_0)
 
    
 

 
    # Testcase 117:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x16, 1f 
    c.jr x16
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 118:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x17, 2f 
    c.jr x17
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 119:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 2b
    c.jr x18
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_41_0)
 
    
 

 
    # Testcase 120:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 1f 
    c.jr x19
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 121:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 2f 
    c.jr x20
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 122:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x21, 2b
    c.jr x21
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_42_0)
 
    
 

 
    # Testcase 123:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x22, 1f 
    c.jr x22
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 124:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x23, 2f 
    c.jr x23
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 125:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 2b
    c.jr x24
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_43_0)
 
    
 

 
    # Testcase 126:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x25, 1f 
    c.jr x25
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 127:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x26, 2f 
    c.jr x26
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 128:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x27, 2b
    c.jr x27
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_44_0)
 
    
 

 
    # Testcase 129:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x28, 1f 
    c.jr x28
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 130:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x29, 2f 
    c.jr x29
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 131:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x30, 2b
    c.jr x30
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_45_0)
 
    
 

 
    # Testcase 132:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 1f 
    c.jr x31
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 133:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f 
    c.jr x1
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 134:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    c.jr x2
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x6,signature_46_0)
 
    
 

 
    # Testcase 135:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x3, 1f 
    c.jr x3
    li x8, 0x123ab
1: 
    sw x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



 
    # Testcase 136:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x4, 2f 
    c.jr x4
    li x8, 0x123ab
2: 
    sw x8, 4(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 137:  result rd:x8(0xcccc)
    li x8, 0xcccc
    la x5, 2b
    c.jr x5
    li x8, 0x123ab
4: 
    sw x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_47_0)
 
    
 

 
    # Testcase 138:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x6, 1f 
    c.jr x6
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 139:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x7, 2f 
    c.jr x7
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 140:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x8, 2b
    c.jr x8
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_48_0)
 
    
 

 
    # Testcase 141:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x9, 1f 
    c.jr x9
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 142:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x10, 2f 
    c.jr x10
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 143:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x11, 2b
    c.jr x11
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_49_0)
 
    
 

 
    # Testcase 144:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 1f 
    c.jr x12
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 145:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x13, 2f 
    c.jr x13
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 146:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2b
    c.jr x14
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_50_0)
 
    
 

 
    # Testcase 147:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x15, 1f 
    c.jr x15
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 148:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x16, 2f 
    c.jr x16
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 149:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x17, 2b
    c.jr x17
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_51_0)
 
    
 

 
    # Testcase 150:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 1f 
    c.jr x18
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 151:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 2f 
    c.jr x19
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 152:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 2b
    c.jr x20
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_52_0)
 
    
 

 
    # Testcase 153:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x21, 1f 
    c.jr x21
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 154:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x22, 2f 
    c.jr x22
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 155:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x23, 2b
    c.jr x23
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_53_0)
 
    
 

 
    # Testcase 156:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 1f 
    c.jr x24
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 157:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x25, 2f 
    c.jr x25
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 158:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x26, 2b
    c.jr x26
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_54_0)
 
    
 

 
    # Testcase 159:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x27, 1f 
    c.jr x27
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 160:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x28, 2f 
    c.jr x28
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 161:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x29, 2b
    c.jr x29
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_55_0)
 
    
 

 
    # Testcase 162:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x30, 1f 
    c.jr x30
    li x5, 0x123ab
1: 
    sw x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



 
    # Testcase 163:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2f 
    c.jr x31
    li x5, 0x123ab
2: 
    sw x5, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 164:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    c.jr x1
    li x5, 0x123ab
4: 
    sw x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x5,signature_56_0)
 
    
 

 
    # Testcase 165:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x2, 1f 
    c.jr x2
    li x7, 0x123ab
1: 
    sw x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 



 
    # Testcase 166:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 2f 
    c.jr x3
    li x7, 0x123ab
2: 
    sw x7, 4(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 



    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 167:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2b
    c.jr x4
    li x7, 0x123ab
4: 
    sw x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  

	
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

