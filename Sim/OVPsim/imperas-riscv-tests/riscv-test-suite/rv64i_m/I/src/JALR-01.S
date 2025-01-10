// RISC-V Architectural Validation Test JALR-01
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
// Specification: RV64I Base Integer Instruction Set, Version 2.1
// Description: Testing instruction 'JALR'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",jalr)

    RVTEST_SIGBASE(x1,signature_1_0)
 

 
 
    # Testcase 0:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x29, 1f
    la x3, -729
    sub x29, x29, x3
    jalr x19, x29,  -729
    li x4, 0x123ab
1: 
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 1:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x21, 2f
    la x3, -1455
    sub x21, x21, x3
    jalr x30, x21,  -1455
    li x4, 0x123ab
2: 
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 2:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x2, 2b
    la x3, -923
    sub x2, x2, x3
    jalr x10, x2,  -923
    li x4, 0x123ab
4: 
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_2_0)
 

 
 
    # Testcase 3:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 1f
    la x4, -1436
    sub x1, x1, x4
    jalr x3, x1,  -1436
    li x5, 0x123ab
1: 
    sd x5, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 4:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x6, 2f
    la x4, -994
    sub x6, x6, x4
    jalr x29, x6,  -994
    li x5, 0x123ab
2: 
    sd x5, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 5:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2b
    la x4, -1313
    sub x14, x14, x4
    jalr x0, x14,  -1313
    li x5, 0x123ab
4: 
    sd x5, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_3_0)
 

 
 
    # Testcase 6:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x12, 1f
    la x2, -1305
    sub x12, x12, x2
    jalr x4, x12,  -1305
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc) 


 
    # Testcase 7:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x3, 2f
    la x2, 977
    sub x3, x3, x2
    jalr x25, x3,  977
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 8:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 2b
    la x2, -12
    sub x19, x19, x2
    jalr x18, x19,  -12
    li x5, 0x123ab
4: 
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_4_0)
 

 
 
    # Testcase 9:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x10, 1f
    la x3, 1216
    sub x10, x10, x3
    jalr x7, x10,  1216
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 10:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x18, 2f
    la x3, 1598
    sub x18, x18, x3
    jalr x31, x18,  1598
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 11:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x1, 2b
    la x3, -1618
    sub x1, x1, x3
    jalr x23, x1,  -1618
    li x4, 0x123ab
4: 
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_5_0)
 

 
 
    # Testcase 12:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 1f
    la x4, 1616
    sub x2, x2, x4
    jalr x21, x2,  1616
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 13:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f
    la x4, 113
    sub x1, x1, x4
    jalr x30, x1,  113
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 14:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2b
    la x4, -552
    sub x1, x1, x4
    jalr x17, x1,  -552
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_6_0)
 

 
 
    # Testcase 15:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x12, 1f
    la x3, -1171
    sub x12, x12, x3
    jalr x6, x12,  -1171
    li x4, 0x123ab
1: 
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 16:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x10, 2f
    la x3, -1883
    sub x10, x10, x3
    jalr x22, x10,  -1883
    li x4, 0x123ab
2: 
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 17:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x8, 2b
    la x3, 1569
    sub x8, x8, x3
    jalr x2, x8,  1569
    li x4, 0x123ab
4: 
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_7_0)
 

 
 
    # Testcase 18:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x8, 1f
    la x2, -1112
    sub x8, x8, x2
    jalr x13, x8,  -1112
    li x4, 0x123ab
1: 
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc) 


 
    # Testcase 19:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x14, 2f
    la x2, -2021
    sub x14, x14, x2
    jalr x3, x14,  -2021
    li x4, 0x123ab
2: 
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 20:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x13, 2b
    la x2, -628
    sub x13, x13, x2
    jalr x24, x13,  -628
    li x4, 0x123ab
4: 
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_8_0)
 

 
 
    # Testcase 21:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x18, 1f
    la x4, -331
    sub x18, x18, x4
    jalr x3, x18,  -331
    li x5, 0x123ab
1: 
    sd x5, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 22:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f
    la x4, -764
    sub x1, x1, x4
    jalr x14, x1,  -764
    li x5, 0x123ab
2: 
    sd x5, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 23:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x19, 2b
    la x4, 1670
    sub x19, x19, x4
    jalr x20, x19,  1670
    li x5, 0x123ab
4: 
    sd x5, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_9_0)
 

 
 
    # Testcase 24:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x30, 1f
    la x3, -1748
    sub x30, x30, x3
    jalr x4, x30,  -1748
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xcccc) 


 
    # Testcase 25:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 2f
    la x3, 342
    sub x31, x31, x3
    jalr x29, x31,  342
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 26:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x3, 468
    sub x2, x2, x3
    jalr x17, x2,  468
    li x5, 0x123ab
4: 
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_10_0)
 

 
 
    # Testcase 27:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x4, 1f
    la x2, 1656
    sub x4, x4, x2
    jalr x22, x4,  1656
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc) 


 
    # Testcase 28:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x20, 2f
    la x2, -548
    sub x20, x20, x2
    jalr x3, x20,  -548
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 29:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x14, 2b
    la x2, 1330
    sub x14, x14, x2
    jalr x15, x14,  1330
    li x5, 0x123ab
4: 
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_11_0)
 

 
 
    # Testcase 30:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 1f
    la x2, 0
    sub x7, x7, x2
    jalr x28, x7,  0
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 31:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2f
    la x2, -1
    sub x7, x7, x2
    jalr x14, x7,  -1
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 32:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2b
    la x2, -1
    sub x18, x18, x2
    jalr x9, x18,  -1
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_12_0)
 

 
 
    # Testcase 33:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x15, 1f
    la x3, -1
    sub x15, x15, x3
    jalr x10, x15,  -1
    li x4, 0x123ab
1: 
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 34:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x23, 2f
    la x3, 0
    sub x23, x23, x3
    jalr x6, x23,  0
    li x4, 0x123ab
2: 
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 35:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x2, 2b
    la x3, -1
    sub x2, x2, x3
    jalr x0, x2,  -1
    li x4, 0x123ab
4: 
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_13_0)
 

 
 
    # Testcase 36:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x29, 1f
    la x3, -1
    sub x29, x29, x3
    jalr x19, x29,  -1
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 37:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x1, 2f
    la x3, -1
    sub x1, x1, x3
    jalr x19, x1,  -1
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 38:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x28, 2b
    la x3, 0
    sub x28, x28, x3
    jalr x30, x28,  0
    li x4, 0x123ab
4: 
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_14_0)
 

 
 
    # Testcase 39:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x24, 1f
    la x4, -1
    sub x24, x24, x4
    jalr x21, x24,  -1
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 40:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2f
    la x4, 1
    sub x2, x2, x4
    jalr x1, x2,  1
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 41:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x4, 2
    sub x2, x2, x4
    jalr x1, x2,  2
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_15_0)
 

 
 
    # Testcase 42:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 1f
    la x6, 4
    sub x3, x3, x6
    jalr x2, x3,  4
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


 
    # Testcase 43:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2f
    la x6, 8
    sub x4, x4, x6
    jalr x3, x4,  8
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 44:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2b
    la x6, 16
    sub x5, x5, x6
    jalr x4, x5,  16
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_16_0)
 

 
 
    # Testcase 45:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x6, 1f
    la x2, 32
    sub x6, x6, x2
    jalr x5, x6,  32
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 46:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2f
    la x2, 64
    sub x7, x7, x2
    jalr x6, x7,  64
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 47:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2b
    la x2, 128
    sub x8, x8, x2
    jalr x7, x8,  128
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_17_0)
 

 
 
    # Testcase 48:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 1f
    la x2, 256
    sub x9, x9, x2
    jalr x8, x9,  256
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 49:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 2f
    la x2, 512
    sub x10, x10, x2
    jalr x9, x10,  512
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 50:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2b
    la x2, 1024
    sub x11, x11, x2
    jalr x10, x11,  1024
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_18_0)
 

 
 
    # Testcase 51:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 1f
    la x2, -2048
    sub x12, x12, x2
    jalr x11, x12,  -2048
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 52:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 2f
    la x2, -2
    sub x13, x13, x2
    jalr x12, x13,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 53:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2b
    la x2, -3
    sub x14, x14, x2
    jalr x13, x14,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_19_0)
 

 
 
    # Testcase 54:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 1f
    la x2, -5
    sub x15, x15, x2
    jalr x14, x15,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 55:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 2f
    la x2, -9
    sub x16, x16, x2
    jalr x15, x16,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 56:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2b
    la x2, -17
    sub x17, x17, x2
    jalr x16, x17,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_20_0)
 

 
 
    # Testcase 57:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 1f
    la x2, -33
    sub x18, x18, x2
    jalr x17, x18,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 58:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 2f
    la x2, -65
    sub x19, x19, x2
    jalr x18, x19,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 59:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2b
    la x2, -129
    sub x20, x20, x2
    jalr x19, x20,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_21_0)
 

 
 
    # Testcase 60:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 1f
    la x2, -257
    sub x21, x21, x2
    jalr x20, x21,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 61:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 2f
    la x2, -513
    sub x22, x22, x2
    jalr x21, x22,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 62:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2b
    la x2, -1025
    sub x23, x23, x2
    jalr x22, x23,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_22_0)
 

 
 
    # Testcase 63:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 1f
    la x2, 2047
    sub x24, x24, x2
    jalr x23, x24,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 64:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 2f
    la x2, -2
    sub x25, x25, x2
    jalr x24, x25,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 65:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2b
    la x2, -3
    sub x26, x26, x2
    jalr x25, x26,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_23_0)
 

 
 
    # Testcase 66:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 1f
    la x2, -5
    sub x27, x27, x2
    jalr x26, x27,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 67:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 2f
    la x2, -9
    sub x28, x28, x2
    jalr x27, x28,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 68:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2b
    la x2, -17
    sub x29, x29, x2
    jalr x28, x29,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_24_0)
 

 
 
    # Testcase 69:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x30, 1f
    la x3, -33
    sub x30, x30, x3
    jalr x29, x30,  -33
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 70:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x31, 2f
    la x3, -65
    sub x31, x31, x3
    jalr x30, x31,  -65
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 71:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x1, 2b
    la x3, -129
    sub x1, x1, x3
    jalr x31, x1,  -129
    li x4, 0x123ab
4: 
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_25_0)
 

 
 
    # Testcase 72:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 1f
    la x5, -257
    sub x2, x2, x5
    jalr x1, x2,  -257
    li x6, 0x123ab
1: 
    sd x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


 
    # Testcase 73:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 2f
    la x5, -513
    sub x2, x2, x5
    jalr x1, x2,  -513
    li x6, 0x123ab
2: 
    sd x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 74:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 2b
    la x5, -1025
    sub x3, x3, x5
    jalr x2, x3,  -1025
    li x6, 0x123ab
4: 
    sd x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_26_0)
 

 
 
    # Testcase 75:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 1f
    la x2, 2047
    sub x4, x4, x2
    jalr x3, x4,  2047
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


 
    # Testcase 76:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2f
    la x2, -2
    sub x5, x5, x2
    jalr x4, x5,  -2
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 77:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x6, 2b
    la x2, -3
    sub x6, x6, x2
    jalr x5, x6,  -3
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_27_0)
 

 
 
    # Testcase 78:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 1f
    la x2, -5
    sub x7, x7, x2
    jalr x6, x7,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 79:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2f
    la x2, -9
    sub x8, x8, x2
    jalr x7, x8,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 80:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 2b
    la x2, -17
    sub x9, x9, x2
    jalr x8, x9,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_28_0)
 

 
 
    # Testcase 81:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 1f
    la x2, -33
    sub x10, x10, x2
    jalr x9, x10,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 82:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2f
    la x2, -65
    sub x11, x11, x2
    jalr x10, x11,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 83:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 2b
    la x2, -129
    sub x12, x12, x2
    jalr x11, x12,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_29_0)
 

 
 
    # Testcase 84:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 1f
    la x2, -257
    sub x13, x13, x2
    jalr x12, x13,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 85:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2f
    la x2, -513
    sub x14, x14, x2
    jalr x13, x14,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 86:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 2b
    la x2, -1025
    sub x15, x15, x2
    jalr x14, x15,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_30_0)
 

 
 
    # Testcase 87:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 1f
    la x2, 2047
    sub x16, x16, x2
    jalr x15, x16,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 88:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2f
    la x2, -2
    sub x17, x17, x2
    jalr x16, x17,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 89:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2b
    la x2, -3
    sub x18, x18, x2
    jalr x17, x18,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_31_0)
 

 
 
    # Testcase 90:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 1f
    la x2, -5
    sub x19, x19, x2
    jalr x18, x19,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 91:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2f
    la x2, -9
    sub x20, x20, x2
    jalr x19, x20,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 92:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 2b
    la x2, -17
    sub x21, x21, x2
    jalr x20, x21,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_32_0)
 

 
 
    # Testcase 93:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 1f
    la x2, -33
    sub x22, x22, x2
    jalr x21, x22,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 94:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2f
    la x2, -65
    sub x23, x23, x2
    jalr x22, x23,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 95:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 2b
    la x2, -129
    sub x24, x24, x2
    jalr x23, x24,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_33_0)
 

 
 
    # Testcase 96:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 1f
    la x2, -257
    sub x25, x25, x2
    jalr x24, x25,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 97:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2f
    la x2, -513
    sub x26, x26, x2
    jalr x25, x26,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 98:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 2b
    la x2, -1025
    sub x27, x27, x2
    jalr x26, x27,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_34_0)
 

 
 
    # Testcase 99:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 1f
    la x2, 2047
    sub x28, x28, x2
    jalr x27, x28,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 100:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2f
    la x2, -2
    sub x29, x29, x2
    jalr x28, x29,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 101:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x30, 2b
    la x2, -3
    sub x30, x30, x2
    jalr x29, x30,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_35_0)
 

 
 
    # Testcase 102:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 1f
    la x4, -5
    sub x31, x31, x4
    jalr x30, x31,  -5
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 103:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f
    la x4, -9
    sub x1, x1, x4
    jalr x31, x1,  -9
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 104:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x4, -17
    sub x2, x2, x4
    jalr x1, x2,  -17
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x5,signature_36_0)
 

 
 
    # Testcase 105:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x2, 1f
    la x6, -33
    sub x2, x2, x6
    jalr x1, x2,  -33
    li x7, 0x123ab
1: 
    sd x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


 
    # Testcase 106:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 2f
    la x6, -65
    sub x3, x3, x6
    jalr x2, x3,  -65
    li x7, 0x123ab
2: 
    sd x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 107:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2b
    la x6, -129
    sub x4, x4, x6
    jalr x3, x4,  -129
    li x7, 0x123ab
4: 
    sd x7, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_37_0)
 

 
 
    # Testcase 108:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x5, 1f
    la x2, -257
    sub x5, x5, x2
    jalr x4, x5,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 109:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x6, 2f
    la x2, -513
    sub x6, x6, x2
    jalr x5, x6,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 110:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2b
    la x2, -1025
    sub x7, x7, x2
    jalr x6, x7,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_38_0)
 

 
 
    # Testcase 111:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 1f
    la x2, 2047
    sub x8, x8, x2
    jalr x7, x8,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 112:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 2f
    la x2, -2
    sub x9, x9, x2
    jalr x8, x9,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 113:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 2b
    la x2, -3
    sub x10, x10, x2
    jalr x9, x10,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_39_0)
 

 
 
    # Testcase 114:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 1f
    la x2, -5
    sub x11, x11, x2
    jalr x10, x11,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 115:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 2f
    la x2, -9
    sub x12, x12, x2
    jalr x11, x12,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 116:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 2b
    la x2, -17
    sub x13, x13, x2
    jalr x12, x13,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_40_0)
 

 
 
    # Testcase 117:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 1f
    la x2, -33
    sub x14, x14, x2
    jalr x13, x14,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 118:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 2f
    la x2, -65
    sub x15, x15, x2
    jalr x14, x15,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 119:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 2b
    la x2, -129
    sub x16, x16, x2
    jalr x15, x16,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_41_0)
 

 
 
    # Testcase 120:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 1f
    la x2, -257
    sub x17, x17, x2
    jalr x16, x17,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 121:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2f
    la x2, -513
    sub x18, x18, x2
    jalr x17, x18,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 122:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 2b
    la x2, -1025
    sub x19, x19, x2
    jalr x18, x19,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_42_0)
 

 
 
    # Testcase 123:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 1f
    la x2, 2047
    sub x20, x20, x2
    jalr x19, x20,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 124:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 2f
    la x2, -2
    sub x21, x21, x2
    jalr x20, x21,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 125:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 2b
    la x2, -3
    sub x22, x22, x2
    jalr x21, x22,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_43_0)
 

 
 
    # Testcase 126:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 1f
    la x2, -5
    sub x23, x23, x2
    jalr x22, x23,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 127:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 2f
    la x2, -9
    sub x24, x24, x2
    jalr x23, x24,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 128:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 2b
    la x2, -17
    sub x25, x25, x2
    jalr x24, x25,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_44_0)
 

 
 
    # Testcase 129:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 1f
    la x2, -33
    sub x26, x26, x2
    jalr x25, x26,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 130:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 2f
    la x2, -65
    sub x27, x27, x2
    jalr x26, x27,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 131:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 2b
    la x2, -129
    sub x28, x28, x2
    jalr x27, x28,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_45_0)
 

 
 
    # Testcase 132:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 1f
    la x2, -257
    sub x29, x29, x2
    jalr x28, x29,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 133:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x30, 2f
    la x2, -513
    sub x30, x30, x2
    jalr x29, x30,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 134:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x31, 2b
    la x2, -1025
    sub x31, x31, x2
    jalr x30, x31,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_46_0)
 

 
 
    # Testcase 135:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 1f
    la x4, 2047
    sub x1, x1, x4
    jalr x31, x1,  2047
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 136:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2f
    la x4, -2
    sub x2, x2, x4
    jalr x1, x2,  -2
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 137:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x4, -3
    sub x2, x2, x4
    jalr x1, x2,  -3
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_47_0)
 

 
 
    # Testcase 138:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 1f
    la x6, -5
    sub x3, x3, x6
    jalr x2, x3,  -5
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


 
    # Testcase 139:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2f
    la x6, -9
    sub x4, x4, x6
    jalr x3, x4,  -9
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 140:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2b
    la x6, -17
    sub x5, x5, x6
    jalr x4, x5,  -17
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_48_0)
 

 
 
    # Testcase 141:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x6, 1f
    la x2, -33
    sub x6, x6, x2
    jalr x5, x6,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 142:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2f
    la x2, -65
    sub x7, x7, x2
    jalr x6, x7,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 143:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2b
    la x2, -129
    sub x8, x8, x2
    jalr x7, x8,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_49_0)
 

 
 
    # Testcase 144:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 1f
    la x2, -257
    sub x9, x9, x2
    jalr x8, x9,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 145:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 2f
    la x2, -513
    sub x10, x10, x2
    jalr x9, x10,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 146:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2b
    la x2, -1025
    sub x11, x11, x2
    jalr x10, x11,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_50_0)
 

 
 
    # Testcase 147:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 1f
    la x2, 2047
    sub x12, x12, x2
    jalr x11, x12,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 148:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 2f
    la x2, -2
    sub x13, x13, x2
    jalr x12, x13,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 149:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2b
    la x2, -3
    sub x14, x14, x2
    jalr x13, x14,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_51_0)
 

 
 
    # Testcase 150:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 1f
    la x2, -5
    sub x15, x15, x2
    jalr x14, x15,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 151:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 2f
    la x2, -9
    sub x16, x16, x2
    jalr x15, x16,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 152:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2b
    la x2, -17
    sub x17, x17, x2
    jalr x16, x17,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_52_0)
 

 
 
    # Testcase 153:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 1f
    la x2, -33
    sub x18, x18, x2
    jalr x17, x18,  -33
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 154:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 2f
    la x2, -65
    sub x19, x19, x2
    jalr x18, x19,  -65
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 155:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2b
    la x2, -129
    sub x20, x20, x2
    jalr x19, x20,  -129
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_53_0)
 

 
 
    # Testcase 156:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 1f
    la x2, -257
    sub x21, x21, x2
    jalr x20, x21,  -257
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 157:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 2f
    la x2, -513
    sub x22, x22, x2
    jalr x21, x22,  -513
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 158:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2b
    la x2, -1025
    sub x23, x23, x2
    jalr x22, x23,  -1025
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_54_0)
 

 
 
    # Testcase 159:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 1f
    la x2, 2047
    sub x24, x24, x2
    jalr x23, x24,  2047
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 160:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 2f
    la x2, -2
    sub x25, x25, x2
    jalr x24, x25,  -2
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 161:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2b
    la x2, -3
    sub x26, x26, x2
    jalr x25, x26,  -3
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_55_0)
 

 
 
    # Testcase 162:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 1f
    la x2, -5
    sub x27, x27, x2
    jalr x26, x27,  -5
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 163:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 2f
    la x2, -9
    sub x28, x28, x2
    jalr x27, x28,  -9
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 164:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2b
    la x2, -17
    sub x29, x29, x2
    jalr x28, x29,  -17
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_56_0)
 

 
 
    # Testcase 165:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x30, 1f
    la x3, -33
    sub x30, x30, x3
    jalr x29, x30,  -33
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 166:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x31, 2f
    la x3, -65
    sub x31, x31, x3
    jalr x30, x31,  -65
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 167:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x1, 2b
    la x3, -129
    sub x1, x1, x3
    jalr x31, x1,  -129
    li x4, 0x123ab
4: 
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_57_0)
 

 
 
    # Testcase 168:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 1f
    la x5, 1
    sub x2, x2, x5
    jalr x1, x2,  1
    li x6, 0x123ab
1: 
    sd x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


 
    # Testcase 169:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 2f
    la x5, 2
    sub x2, x2, x5
    jalr x1, x2,  2
    li x6, 0x123ab
2: 
    sd x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 170:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 2b
    la x5, 4
    sub x3, x3, x5
    jalr x2, x3,  4
    li x6, 0x123ab
4: 
    sd x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_58_0)
 

 
 
    # Testcase 171:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 1f
    la x2, 8
    sub x4, x4, x2
    jalr x3, x4,  8
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


 
    # Testcase 172:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2f
    la x2, 16
    sub x5, x5, x2
    jalr x4, x5,  16
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 173:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x6, 2b
    la x2, 32
    sub x6, x6, x2
    jalr x5, x6,  32
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_59_0)
 

 
 
    # Testcase 174:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 1f
    la x2, 64
    sub x7, x7, x2
    jalr x6, x7,  64
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 175:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2f
    la x2, 128
    sub x8, x8, x2
    jalr x7, x8,  128
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 176:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 2b
    la x2, 256
    sub x9, x9, x2
    jalr x8, x9,  256
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_60_0)
 

 
 
    # Testcase 177:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 1f
    la x2, 512
    sub x10, x10, x2
    jalr x9, x10,  512
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 178:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2f
    la x2, 1024
    sub x11, x11, x2
    jalr x10, x11,  1024
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 179:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 2b
    la x2, -2048
    sub x12, x12, x2
    jalr x11, x12,  -2048
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_61_0)
 

 
 
    # Testcase 180:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 1f
    la x2, -2
    sub x13, x13, x2
    jalr x12, x13,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 181:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2f
    la x2, -3
    sub x14, x14, x2
    jalr x13, x14,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 182:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 2b
    la x2, -5
    sub x15, x15, x2
    jalr x14, x15,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_62_0)
 

 
 
    # Testcase 183:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 1f
    la x2, -9
    sub x16, x16, x2
    jalr x15, x16,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 184:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2f
    la x2, -17
    sub x17, x17, x2
    jalr x16, x17,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 185:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2b
    la x2, -33
    sub x18, x18, x2
    jalr x17, x18,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_63_0)
 

 
 
    # Testcase 186:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 1f
    la x2, -65
    sub x19, x19, x2
    jalr x18, x19,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 187:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2f
    la x2, -129
    sub x20, x20, x2
    jalr x19, x20,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 188:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 2b
    la x2, -257
    sub x21, x21, x2
    jalr x20, x21,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_64_0)
 

 
 
    # Testcase 189:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 1f
    la x2, -513
    sub x22, x22, x2
    jalr x21, x22,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 190:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2f
    la x2, -1025
    sub x23, x23, x2
    jalr x22, x23,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 191:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 2b
    la x2, 2047
    sub x24, x24, x2
    jalr x23, x24,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_65_0)
 

 
 
    # Testcase 192:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 1f
    la x2, -2
    sub x25, x25, x2
    jalr x24, x25,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 193:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2f
    la x2, -3
    sub x26, x26, x2
    jalr x25, x26,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 194:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 2b
    la x2, -5
    sub x27, x27, x2
    jalr x26, x27,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_66_0)
 

 
 
    # Testcase 195:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 1f
    la x2, -9
    sub x28, x28, x2
    jalr x27, x28,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 196:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2f
    la x2, -17
    sub x29, x29, x2
    jalr x28, x29,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 197:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x30, 2b
    la x2, -33
    sub x30, x30, x2
    jalr x29, x30,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_67_0)
 

 
 
    # Testcase 198:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 1f
    la x4, -65
    sub x31, x31, x4
    jalr x30, x31,  -65
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 199:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f
    la x4, -129
    sub x1, x1, x4
    jalr x31, x1,  -129
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 200:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x4, -257
    sub x2, x2, x4
    jalr x1, x2,  -257
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x5,signature_68_0)
 

 
 
    # Testcase 201:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x2, 1f
    la x6, -513
    sub x2, x2, x6
    jalr x1, x2,  -513
    li x7, 0x123ab
1: 
    sd x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


 
    # Testcase 202:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 2f
    la x6, -1025
    sub x3, x3, x6
    jalr x2, x3,  -1025
    li x7, 0x123ab
2: 
    sd x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 203:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2b
    la x6, 2047
    sub x4, x4, x6
    jalr x3, x4,  2047
    li x7, 0x123ab
4: 
    sd x7, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_69_0)
 

 
 
    # Testcase 204:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x5, 1f
    la x2, -2
    sub x5, x5, x2
    jalr x4, x5,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 205:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x6, 2f
    la x2, -3
    sub x6, x6, x2
    jalr x5, x6,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 206:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2b
    la x2, -5
    sub x7, x7, x2
    jalr x6, x7,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_70_0)
 

 
 
    # Testcase 207:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 1f
    la x2, -9
    sub x8, x8, x2
    jalr x7, x8,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 208:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 2f
    la x2, -17
    sub x9, x9, x2
    jalr x8, x9,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 209:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 2b
    la x2, -33
    sub x10, x10, x2
    jalr x9, x10,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_71_0)
 

 
 
    # Testcase 210:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 1f
    la x2, -65
    sub x11, x11, x2
    jalr x10, x11,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 211:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 2f
    la x2, -129
    sub x12, x12, x2
    jalr x11, x12,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 212:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 2b
    la x2, -257
    sub x13, x13, x2
    jalr x12, x13,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_72_0)
 

 
 
    # Testcase 213:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 1f
    la x2, -513
    sub x14, x14, x2
    jalr x13, x14,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 214:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 2f
    la x2, -1025
    sub x15, x15, x2
    jalr x14, x15,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 215:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 2b
    la x2, 2047
    sub x16, x16, x2
    jalr x15, x16,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_73_0)
 

 
 
    # Testcase 216:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 1f
    la x2, -2
    sub x17, x17, x2
    jalr x16, x17,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 217:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2f
    la x2, -3
    sub x18, x18, x2
    jalr x17, x18,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 218:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 2b
    la x2, -5
    sub x19, x19, x2
    jalr x18, x19,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_74_0)
 

 
 
    # Testcase 219:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 1f
    la x2, -9
    sub x20, x20, x2
    jalr x19, x20,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 220:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 2f
    la x2, -17
    sub x21, x21, x2
    jalr x20, x21,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 221:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 2b
    la x2, -33
    sub x22, x22, x2
    jalr x21, x22,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_75_0)
 

 
 
    # Testcase 222:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 1f
    la x2, -65
    sub x23, x23, x2
    jalr x22, x23,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 223:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 2f
    la x2, -129
    sub x24, x24, x2
    jalr x23, x24,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 224:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 2b
    la x2, -257
    sub x25, x25, x2
    jalr x24, x25,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_76_0)
 

 
 
    # Testcase 225:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 1f
    la x2, -513
    sub x26, x26, x2
    jalr x25, x26,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 226:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 2f
    la x2, -1025
    sub x27, x27, x2
    jalr x26, x27,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 227:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 2b
    la x2, 2047
    sub x28, x28, x2
    jalr x27, x28,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_77_0)
 

 
 
    # Testcase 228:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 1f
    la x2, -2
    sub x29, x29, x2
    jalr x28, x29,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 229:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x30, 2f
    la x2, -3
    sub x30, x30, x2
    jalr x29, x30,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 230:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x31, 2b
    la x2, -5
    sub x31, x31, x2
    jalr x30, x31,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x3,signature_78_0)
 

 
 
    # Testcase 231:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 1f
    la x4, -9
    sub x1, x1, x4
    jalr x31, x1,  -9
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 232:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2f
    la x4, -17
    sub x2, x2, x4
    jalr x1, x2,  -17
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 233:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x2, 2b
    la x4, -33
    sub x2, x2, x4
    jalr x1, x2,  -33
    li x5, 0x123ab
4: 
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_79_0)
 

 
 
    # Testcase 234:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x3, 1f
    la x6, -65
    sub x3, x3, x6
    jalr x2, x3,  -65
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


 
    # Testcase 235:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 2f
    la x6, -129
    sub x4, x4, x6
    jalr x3, x4,  -129
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 236:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2b
    la x6, -257
    sub x5, x5, x6
    jalr x4, x5,  -257
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_80_0)
 

 
 
    # Testcase 237:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x6, 1f
    la x2, -513
    sub x6, x6, x2
    jalr x5, x6,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 238:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 2f
    la x2, -1025
    sub x7, x7, x2
    jalr x6, x7,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 239:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2b
    la x2, 2047
    sub x8, x8, x2
    jalr x7, x8,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_81_0)
 

 
 
    # Testcase 240:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 1f
    la x2, -2
    sub x9, x9, x2
    jalr x8, x9,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 241:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 2f
    la x2, -3
    sub x10, x10, x2
    jalr x9, x10,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 242:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2b
    la x2, -5
    sub x11, x11, x2
    jalr x10, x11,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_82_0)
 

 
 
    # Testcase 243:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 1f
    la x2, -9
    sub x12, x12, x2
    jalr x11, x12,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 244:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 2f
    la x2, -17
    sub x13, x13, x2
    jalr x12, x13,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 245:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2b
    la x2, -33
    sub x14, x14, x2
    jalr x13, x14,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_83_0)
 

 
 
    # Testcase 246:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 1f
    la x2, -65
    sub x15, x15, x2
    jalr x14, x15,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 247:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 2f
    la x2, -129
    sub x16, x16, x2
    jalr x15, x16,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 248:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2b
    la x2, -257
    sub x17, x17, x2
    jalr x16, x17,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_84_0)
 

 
 
    # Testcase 249:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 1f
    la x2, -513
    sub x18, x18, x2
    jalr x17, x18,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 250:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 2f
    la x2, -1025
    sub x19, x19, x2
    jalr x18, x19,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 251:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2b
    la x2, 2047
    sub x20, x20, x2
    jalr x19, x20,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_85_0)
 

 
 
    # Testcase 252:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 1f
    la x2, -2
    sub x21, x21, x2
    jalr x20, x21,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 253:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 2f
    la x2, -3
    sub x22, x22, x2
    jalr x21, x22,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 254:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2b
    la x2, -5
    sub x23, x23, x2
    jalr x22, x23,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_86_0)
 

 
 
    # Testcase 255:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 1f
    la x2, -9
    sub x24, x24, x2
    jalr x23, x24,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 256:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 2f
    la x2, -17
    sub x25, x25, x2
    jalr x24, x25,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 257:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2b
    la x2, -33
    sub x26, x26, x2
    jalr x25, x26,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_87_0)
 

 
 
    # Testcase 258:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 1f
    la x2, -65
    sub x27, x27, x2
    jalr x26, x27,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 259:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 2f
    la x2, -129
    sub x28, x28, x2
    jalr x27, x28,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 260:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2b
    la x2, -257
    sub x29, x29, x2
    jalr x28, x29,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_88_0)
 

 
 
    # Testcase 261:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x30, 1f
    la x3, -513
    sub x30, x30, x3
    jalr x29, x30,  -513
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


 
    # Testcase 262:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x31, 2f
    la x3, -1025
    sub x31, x31, x3
    jalr x30, x31,  -1025
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 263:  result rd:x4(0xcccc)
    li x4, 0xcccc
    la x1, 2b
    la x3, 2047
    sub x1, x1, x3
    jalr x31, x1,  2047
    li x4, 0x123ab
4: 
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)  



    

    RVTEST_SIGBASE(x4,signature_89_0)
 

 
 
    # Testcase 264:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 1f
    la x5, -2
    sub x2, x2, x5
    jalr x1, x2,  -2
    li x6, 0x123ab
1: 
    sd x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


 
    # Testcase 265:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x2, 2f
    la x5, -3
    sub x2, x2, x5
    jalr x1, x2,  -3
    li x6, 0x123ab
2: 
    sd x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 266:  result rd:x6(0xcccc)
    li x6, 0xcccc
    la x3, 2b
    la x5, -5
    sub x3, x3, x5
    jalr x2, x3,  -5
    li x6, 0x123ab
4: 
    sd x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_90_0)
 

 
 
    # Testcase 267:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x4, 1f
    la x2, -9
    sub x4, x4, x2
    jalr x3, x4,  -9
    li x7, 0x123ab
1: 
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


 
    # Testcase 268:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x5, 2f
    la x2, -17
    sub x5, x5, x2
    jalr x4, x5,  -17
    li x7, 0x123ab
2: 
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 269:  result rd:x7(0xcccc)
    li x7, 0xcccc
    la x6, 2b
    la x2, -33
    sub x6, x6, x2
    jalr x5, x6,  -33
    li x7, 0x123ab
4: 
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_91_0)
 

 
 
    # Testcase 270:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x7, 1f
    la x2, -65
    sub x7, x7, x2
    jalr x6, x7,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 271:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x8, 2f
    la x2, -129
    sub x8, x8, x2
    jalr x7, x8,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 272:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x9, 2b
    la x2, -257
    sub x9, x9, x2
    jalr x8, x9,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_92_0)
 

 
 
    # Testcase 273:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x10, 1f
    la x2, -513
    sub x10, x10, x2
    jalr x9, x10,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 274:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x11, 2f
    la x2, -1025
    sub x11, x11, x2
    jalr x10, x11,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 275:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x12, 2b
    la x2, 2047
    sub x12, x12, x2
    jalr x11, x12,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_93_0)
 

 
 
    # Testcase 276:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x13, 1f
    la x2, -2
    sub x13, x13, x2
    jalr x12, x13,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 277:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x14, 2f
    la x2, -3
    sub x14, x14, x2
    jalr x13, x14,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 278:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x15, 2b
    la x2, -5
    sub x15, x15, x2
    jalr x14, x15,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_94_0)
 

 
 
    # Testcase 279:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x16, 1f
    la x2, -9
    sub x16, x16, x2
    jalr x15, x16,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 280:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x17, 2f
    la x2, -17
    sub x17, x17, x2
    jalr x16, x17,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 281:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x18, 2b
    la x2, -33
    sub x18, x18, x2
    jalr x17, x18,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_95_0)
 

 
 
    # Testcase 282:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x19, 1f
    la x2, -65
    sub x19, x19, x2
    jalr x18, x19,  -65
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 283:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x20, 2f
    la x2, -129
    sub x20, x20, x2
    jalr x19, x20,  -129
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 284:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x21, 2b
    la x2, -257
    sub x21, x21, x2
    jalr x20, x21,  -257
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_96_0)
 

 
 
    # Testcase 285:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x22, 1f
    la x2, -513
    sub x22, x22, x2
    jalr x21, x22,  -513
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 286:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x23, 2f
    la x2, -1025
    sub x23, x23, x2
    jalr x22, x23,  -1025
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 287:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x24, 2b
    la x2, 2047
    sub x24, x24, x2
    jalr x23, x24,  2047
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_97_0)
 

 
 
    # Testcase 288:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x25, 1f
    la x2, -2
    sub x25, x25, x2
    jalr x24, x25,  -2
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 289:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x26, 2f
    la x2, -3
    sub x26, x26, x2
    jalr x25, x26,  -3
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 290:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x27, 2b
    la x2, -5
    sub x27, x27, x2
    jalr x26, x27,  -5
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x1,signature_98_0)
 

 
 
    # Testcase 291:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x28, 1f
    la x2, -9
    sub x28, x28, x2
    jalr x27, x28,  -9
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


 
    # Testcase 292:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x29, 2f
    la x2, -17
    sub x29, x29, x2
    jalr x28, x29,  -17
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 293:  result rd:x3(0xcccc)
    li x3, 0xcccc
    la x30, 2b
    la x2, -33
    sub x30, x30, x2
    jalr x29, x30,  -33
    li x3, 0x123ab
4: 
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)  



    

    RVTEST_SIGBASE(x2,signature_99_0)
 

 
 
    # Testcase 294:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x31, 1f
    la x4, -65
    sub x31, x31, x4
    jalr x30, x31,  -65
    li x5, 0x123ab
1: 
    sd x5, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


 
    # Testcase 295:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x1, 2f
    la x4, -129
    sub x1, x1, x4
    jalr x31, x1,  -129
    li x5, 0x123ab
2: 
    sd x5, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc) 


    jal x0, 3f
2:
    jal x0, 4f
3:
    # Testcase 296:  result rd:x5(0xcccc)
    li x5, 0xcccc
    la x3, 2b
    la x4, -150
    sub x3, x3, x4
    jalr x0, x3,  -150
    li x5, 0x123ab
4: 
    sd x5, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)  

	
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

