// RISC-V Architectural Validation Test BGE-01
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
// Description: Testing instruction 'BGE'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",bge)

    RVTEST_SIGBASE(x1,signature_1_0)
    
     # Testcase 0:  rs1:x19(0x54f4aeeb151a01ef), rs2:x28(0xf4bcf4a786569d27), result Branch=1
    li x4, 0xcccc
    li x19, 0x54f4aeeb151a01ef
    li x28, 0xf4bcf4a786569d27
    bge x19, x28, 1f
    li x4, 0x123ab
1: 
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc)

     # Testcase 1:  rs1:x30(0xe3977ec120219a51), rs2:x20(0xb26566a091a8d5fd), result Branch=1
    li x4, 0xcccc
    li x30, 0xe3977ec120219a51
    li x20, 0xb26566a091a8d5fd
    bge x30, x20, 2f
    li x4, 0x123ab
2: 
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc)

     # Testcase 2:  rs1:x10(0xf27008e60466250f), rs2:x0(0xc3e260bde31ffa64), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x4, 0xcccc
    li x10, 0xf27008e60466250f
    li x0, 0xc3e260bde31ffa64
    bge x10, x0, 2b
    li x4, 0x123ab
4:
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x123ab)

     # Testcase 3:  rs1:x3(0x2f7b22b7e54c8c1e), rs2:x31(0xa783d03f7ca660db), result Branch=1
    li x4, 0xcccc
    li x3, 0x2f7b22b7e54c8c1e
    li x31, 0xa783d03f7ca660db
    bge x3, x31, 4f
    li x4, 0x123ab
4: 
    sd x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc)

     # Testcase 4:  rs1:x29(0xfd7b9df82c63c847), rs2:x5(0x807fe203fbba7ae7), result Branch=1
    li x4, 0xcccc
    li x29, 0xfd7b9df82c63c847
    li x5, 0x807fe203fbba7ae7
    bge x29, x5, 5f
    li x4, 0x123ab
5: 
    sd x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_2_0)
    
     # Testcase 5:  rs1:x0(0xa14cf866f600a3d1), rs2:x13(0x413f2c6234b80fd4), result Branch=0
    li x5, 0xcccc
    li x0, 0xa14cf866f600a3d1
    li x13, 0x413f2c6234b80fd4
    bge x0, x13, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x123ab)

     # Testcase 6:  rs1:x4(0x2c370a9a34267ad9), rs2:x11(0x701512f5681454c0), result Branch=0
    li x5, 0xcccc
    li x4, 0x2c370a9a34267ad9
    li x11, 0x701512f5681454c0
    bge x4, x11, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x123ab)

     # Testcase 7:  rs1:x25(0x2a81b798b02d663e), rs2:x2(0x91dd5ad6b2d3f1c5), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x25, 0x2a81b798b02d663e
    li x2, 0x91dd5ad6b2d3f1c5
    bge x25, x2, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xcccc)

     # Testcase 8:  rs1:x18(0x42f1d6295233a4dd), rs2:x7(0x589f2ccdd4983650), result Branch=0
    li x5, 0xcccc
    li x18, 0x42f1d6295233a4dd
    li x7, 0x589f2ccdd4983650
    bge x18, x7, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x123ab)

     # Testcase 9:  rs1:x9(0x14cf50e37bf4071), rs2:x31(0x4d236af8c83b3c30), result Branch=0
    li x5, 0xcccc
    li x9, 0x14cf50e37bf4071
    li x31, 0x4d236af8c83b3c30
    bge x9, x31, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_3_0)
    
     # Testcase 10:  rs1:x17(0x983b9f63a968a97f), rs2:x23(0x242b987862f6cb6d), result Branch=0
    li x3, 0xcccc
    li x17, 0x983b9f63a968a97f
    li x23, 0x242b987862f6cb6d
    bge x17, x23, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 11:  rs1:x31(0x28aadb5b3874f8a5), rs2:x21(0x353a85936075c1a2), result Branch=0
    li x3, 0xcccc
    li x31, 0x28aadb5b3874f8a5
    li x21, 0x353a85936075c1a2
    bge x31, x21, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 12:  rs1:x0(0x66268a1a4ff09378), rs2:x30(0xc357b9259b327ba8), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x0, 0x66268a1a4ff09378
    li x30, 0xc357b9259b327ba8
    bge x0, x30, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 13:  rs1:x0(0xba4194f803d5081b), rs2:x17(0xdc3713a217a2fb1a), result Branch=1
    li x3, 0xcccc
    li x0, 0xba4194f803d5081b
    li x17, 0xdc3713a217a2fb1a
    bge x0, x17, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 14:  rs1:x31(0x74674399484605f6), rs2:x6(0x2ed729e0b5aeeeb5), result Branch=1
    li x3, 0xcccc
    li x31, 0x74674399484605f6
    li x6, 0x2ed729e0b5aeeeb5
    bge x31, x6, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_4_0)
    
     # Testcase 15:  rs1:x11(0x5b57716e8dd5cd04), rs2:x22(0x825648e49b1a8042), result Branch=1
    li x5, 0xcccc
    li x11, 0x5b57716e8dd5cd04
    li x22, 0x825648e49b1a8042
    bge x11, x22, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 16:  rs1:x9(0x7bf4ef1c426b8dfb), rs2:x2(0xf4cc30bce0e9092c), result Branch=1
    li x5, 0xcccc
    li x9, 0x7bf4ef1c426b8dfb
    li x2, 0xf4cc30bce0e9092c
    bge x9, x2, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 17:  rs1:x7(0x35a0ec8073b3e156), rs2:x13(0xfe9b8abf4bfb003d), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x7, 0x35a0ec8073b3e156
    li x13, 0xfe9b8abf4bfb003d
    bge x7, x13, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 18:  rs1:x7(0x347ebc89f22b6484), rs2:x3(0x8cc7e79093b06678), result Branch=1
    li x5, 0xcccc
    li x7, 0x347ebc89f22b6484
    li x3, 0x8cc7e79093b06678
    bge x7, x3, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 19:  rs1:x13(0xa5c8d8603b9b3ddc), rs2:x24(0xcaa4b80e169dbce8), result Branch=0
    li x5, 0xcccc
    li x13, 0xa5c8d8603b9b3ddc
    li x24, 0xcaa4b80e169dbce8
    bge x13, x24, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_5_0)
    
     # Testcase 20:  rs1:x12(0xefc01cefa2167b52), rs2:x3(0xfe96a9489fcbe57f), result Branch=0
    li x5, 0xcccc
    li x12, 0xefc01cefa2167b52
    li x3, 0xfe96a9489fcbe57f
    bge x12, x3, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x123ab)

     # Testcase 21:  rs1:x17(0x89c6d66497056592), rs2:x14(0x8fe89d238bfcad15), result Branch=0
    li x5, 0xcccc
    li x17, 0x89c6d66497056592
    li x14, 0x8fe89d238bfcad15
    bge x17, x14, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x123ab)

     # Testcase 22:  rs1:x31(0xa89d2964445da8cc), rs2:x20(0xe10f3f75ea35fe19), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x31, 0xa89d2964445da8cc
    li x20, 0xe10f3f75ea35fe19
    bge x31, x20, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x123ab)

     # Testcase 23:  rs1:x18(0x5252ce3b79e910dd), rs2:x4(0x103e65150be793b3), result Branch=1
    li x5, 0xcccc
    li x18, 0x5252ce3b79e910dd
    li x4, 0x103e65150be793b3
    bge x18, x4, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc)

     # Testcase 24:  rs1:x29(0xeff476524e0658c), rs2:x30(0xbd562c1247c6f638), result Branch=1
    li x5, 0xcccc
    li x29, 0xeff476524e0658c
    li x30, 0xbd562c1247c6f638
    bge x29, x30, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcccc)



    

    RVTEST_SIGBASE(x2,signature_6_0)
    
     # Testcase 25:  rs1:x17(0x6042195f4ed86866), rs2:x1(0x823f2c5e6b6a11c), result Branch=1
    li x5, 0xcccc
    li x17, 0x6042195f4ed86866
    li x1, 0x823f2c5e6b6a11c
    bge x17, x1, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 26:  rs1:x22(0x163dd610d7a568f0), rs2:x3(0x92d1fb3e66652ebf), result Branch=1
    li x5, 0xcccc
    li x22, 0x163dd610d7a568f0
    li x3, 0x92d1fb3e66652ebf
    bge x22, x3, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 27:  rs1:x3(0x8ce597c3be0154f), rs2:x19(0x6a6a04cf69150191), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x3, 0x8ce597c3be0154f
    li x19, 0x6a6a04cf69150191
    bge x3, x19, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 28:  rs1:x15(0x28149f70734b985d), rs2:x13(0xff3544a9353308fb), result Branch=1
    li x5, 0xcccc
    li x15, 0x28149f70734b985d
    li x13, 0xff3544a9353308fb
    bge x15, x13, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 29:  rs1:x28(0x7ba96852fde223d8), rs2:x6(0xe855a90ddbee5e94), result Branch=1
    li x5, 0xcccc
    li x28, 0x7ba96852fde223d8
    li x6, 0xe855a90ddbee5e94
    bge x28, x6, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_7_0)
    
     # Testcase 30:  rs1:x14(0x1), rs2:x6(0x7fffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x14, 0x1
    li x6, 0x7fffffffffffffff
    bge x14, x6, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 31:  rs1:x9(0x0), rs2:x17(0x8000000000000000), result Branch=1
    li x3, 0xcccc
    li x9, 0x0
    li x17, 0x8000000000000000
    bge x9, x17, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 32:  rs1:x10(0xffffffffffffffff), rs2:x14(0xffffffffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xffffffffffffffff
    li x14, 0xffffffffffffffff
    bge x10, x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 33:  rs1:x6(0x7fffffffffffffff), rs2:x22(0xffffffffffffffff), result Branch=1
    li x3, 0xcccc
    li x6, 0x7fffffffffffffff
    li x22, 0xffffffffffffffff
    bge x6, x22, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 34:  rs1:x0(0x8000000000000000), rs2:x19(0xffffffffffffffff), result Branch=1
    li x3, 0xcccc
    li x0, 0x8000000000000000
    li x19, 0xffffffffffffffff
    bge x0, x19, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_8_0)
    
     # Testcase 35:  rs1:x28(0xffffffffffffffff), rs2:x19(0x1), result Branch=0
    li x3, 0xcccc
    li x28, 0xffffffffffffffff
    li x19, 0x1
    bge x28, x19, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 36:  rs1:x31(0xffffffffffffffff), rs2:x30(0x0), result Branch=0
    li x3, 0xcccc
    li x31, 0xffffffffffffffff
    li x30, 0x0
    bge x31, x30, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 37:  rs1:x27(0xffffffffffffffff), rs2:x21(0xffffffffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x27, 0xffffffffffffffff
    li x21, 0xffffffffffffffff
    bge x27, x21, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 38:  rs1:x23(0x1), rs2:x16(0x7fffffffffffffff), result Branch=0
    li x3, 0xcccc
    li x23, 0x1
    li x16, 0x7fffffffffffffff
    bge x23, x16, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 39:  rs1:x24(0x0), rs2:x28(0x8000000000000000), result Branch=1
    li x3, 0xcccc
    li x24, 0x0
    li x28, 0x8000000000000000
    bge x24, x28, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x6,signature_9_0)
    
     # Testcase 40:  rs1:x1(0x1), rs2:x2(0xfffffffffffffffe), result Branch=1
    li x8, 0xcccc
    li x1, 0x1
    li x2, 0xfffffffffffffffe
    bge x1, x2, 1f
    li x8, 0x123ab
1: 
    sd x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 41:  rs1:x1(0x2), rs2:x2(0x7fffffffffffffff), result Branch=0
    li x8, 0xcccc
    li x1, 0x2
    li x2, 0x7fffffffffffffff
    bge x1, x2, 2f
    li x8, 0x123ab
2: 
    sd x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x123ab)

     # Testcase 42:  rs1:x2(0x4), rs2:x3(0xbfffffffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x8, 0xcccc
    li x2, 0x4
    li x3, 0xbfffffffffffffff
    bge x2, x3, 2b
    li x8, 0x123ab
4:
    sd x8, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 43:  rs1:x3(0x8), rs2:x4(0xdfffffffffffffff), result Branch=1
    li x8, 0xcccc
    li x3, 0x8
    li x4, 0xdfffffffffffffff
    bge x3, x4, 4f
    li x8, 0x123ab
4: 
    sd x8, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 44:  rs1:x4(0x10), rs2:x5(0xefffffffffffffff), result Branch=1
    li x8, 0xcccc
    li x4, 0x10
    li x5, 0xefffffffffffffff
    bge x4, x5, 5f
    li x8, 0x123ab
5: 
    sd x8, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_10_0)
    
     # Testcase 45:  rs1:x5(0x20), rs2:x6(0xf7ffffffffffffff), result Branch=1
    li x3, 0xcccc
    li x5, 0x20
    li x6, 0xf7ffffffffffffff
    bge x5, x6, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 46:  rs1:x6(0x40), rs2:x7(0xfbffffffffffffff), result Branch=1
    li x3, 0xcccc
    li x6, 0x40
    li x7, 0xfbffffffffffffff
    bge x6, x7, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 47:  rs1:x7(0x80), rs2:x8(0xfdffffffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x7, 0x80
    li x8, 0xfdffffffffffffff
    bge x7, x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 48:  rs1:x8(0x100), rs2:x9(0xfeffffffffffffff), result Branch=1
    li x3, 0xcccc
    li x8, 0x100
    li x9, 0xfeffffffffffffff
    bge x8, x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 49:  rs1:x9(0x200), rs2:x10(0xff7fffffffffffff), result Branch=1
    li x3, 0xcccc
    li x9, 0x200
    li x10, 0xff7fffffffffffff
    bge x9, x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_11_0)
    
     # Testcase 50:  rs1:x10(0x400), rs2:x11(0xffbfffffffffffff), result Branch=1
    li x3, 0xcccc
    li x10, 0x400
    li x11, 0xffbfffffffffffff
    bge x10, x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 51:  rs1:x11(0x800), rs2:x12(0xffdfffffffffffff), result Branch=1
    li x3, 0xcccc
    li x11, 0x800
    li x12, 0xffdfffffffffffff
    bge x11, x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 52:  rs1:x12(0x1000), rs2:x13(0xffefffffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x1000
    li x13, 0xffefffffffffffff
    bge x12, x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 53:  rs1:x13(0x2000), rs2:x14(0xfff7ffffffffffff), result Branch=1
    li x3, 0xcccc
    li x13, 0x2000
    li x14, 0xfff7ffffffffffff
    bge x13, x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 54:  rs1:x14(0x4000), rs2:x15(0xfffbffffffffffff), result Branch=1
    li x3, 0xcccc
    li x14, 0x4000
    li x15, 0xfffbffffffffffff
    bge x14, x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_12_0)
    
     # Testcase 55:  rs1:x15(0x8000), rs2:x16(0xfffdffffffffffff), result Branch=1
    li x3, 0xcccc
    li x15, 0x8000
    li x16, 0xfffdffffffffffff
    bge x15, x16, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 56:  rs1:x16(0x10000), rs2:x17(0xfffeffffffffffff), result Branch=1
    li x3, 0xcccc
    li x16, 0x10000
    li x17, 0xfffeffffffffffff
    bge x16, x17, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 57:  rs1:x17(0x20000), rs2:x18(0xffff7fffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x17, 0x20000
    li x18, 0xffff7fffffffffff
    bge x17, x18, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 58:  rs1:x18(0x40000), rs2:x19(0xffffbfffffffffff), result Branch=1
    li x3, 0xcccc
    li x18, 0x40000
    li x19, 0xffffbfffffffffff
    bge x18, x19, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 59:  rs1:x19(0x80000), rs2:x20(0xffffdfffffffffff), result Branch=1
    li x3, 0xcccc
    li x19, 0x80000
    li x20, 0xffffdfffffffffff
    bge x19, x20, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_13_0)
    
     # Testcase 60:  rs1:x20(0x100000), rs2:x21(0xffffefffffffffff), result Branch=1
    li x3, 0xcccc
    li x20, 0x100000
    li x21, 0xffffefffffffffff
    bge x20, x21, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 61:  rs1:x21(0x200000), rs2:x22(0xfffff7ffffffffff), result Branch=1
    li x3, 0xcccc
    li x21, 0x200000
    li x22, 0xfffff7ffffffffff
    bge x21, x22, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 62:  rs1:x22(0x400000), rs2:x23(0xfffffbffffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x22, 0x400000
    li x23, 0xfffffbffffffffff
    bge x22, x23, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 63:  rs1:x23(0x800000), rs2:x24(0xfffffdffffffffff), result Branch=1
    li x3, 0xcccc
    li x23, 0x800000
    li x24, 0xfffffdffffffffff
    bge x23, x24, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 64:  rs1:x24(0x1000000), rs2:x25(0xfffffeffffffffff), result Branch=1
    li x3, 0xcccc
    li x24, 0x1000000
    li x25, 0xfffffeffffffffff
    bge x24, x25, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_14_0)
    
     # Testcase 65:  rs1:x25(0x2000000), rs2:x26(0xffffff7fffffffff), result Branch=1
    li x3, 0xcccc
    li x25, 0x2000000
    li x26, 0xffffff7fffffffff
    bge x25, x26, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 66:  rs1:x26(0x4000000), rs2:x27(0xffffffbfffffffff), result Branch=1
    li x3, 0xcccc
    li x26, 0x4000000
    li x27, 0xffffffbfffffffff
    bge x26, x27, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 67:  rs1:x27(0x8000000), rs2:x28(0xffffffdfffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x27, 0x8000000
    li x28, 0xffffffdfffffffff
    bge x27, x28, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 68:  rs1:x28(0x10000000), rs2:x29(0xffffffefffffffff), result Branch=1
    li x3, 0xcccc
    li x28, 0x10000000
    li x29, 0xffffffefffffffff
    bge x28, x29, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 69:  rs1:x29(0x20000000), rs2:x30(0xfffffff7ffffffff), result Branch=1
    li x3, 0xcccc
    li x29, 0x20000000
    li x30, 0xfffffff7ffffffff
    bge x29, x30, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x4,signature_15_0)
    
     # Testcase 70:  rs1:x30(0x40000000), rs2:x31(0xfffffffbffffffff), result Branch=1
    li x6, 0xcccc
    li x30, 0x40000000
    li x31, 0xfffffffbffffffff
    bge x30, x31, 1f
    li x6, 0x123ab
1: 
    sd x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)

     # Testcase 71:  rs1:x31(0x80000000), rs2:x1(0xfffffffdffffffff), result Branch=1
    li x6, 0xcccc
    li x31, 0x80000000
    li x1, 0xfffffffdffffffff
    bge x31, x1, 2f
    li x6, 0x123ab
2: 
    sd x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)

     # Testcase 72:  rs1:x1(0x100000000), rs2:x2(0xfffffffeffffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x6, 0xcccc
    li x1, 0x100000000
    li x2, 0xfffffffeffffffff
    bge x1, x2, 2b
    li x6, 0x123ab
4:
    sd x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)

     # Testcase 73:  rs1:x1(0x200000000), rs2:x2(0xffffffff7fffffff), result Branch=1
    li x6, 0xcccc
    li x1, 0x200000000
    li x2, 0xffffffff7fffffff
    bge x1, x2, 4f
    li x6, 0x123ab
4: 
    sd x6, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)

     # Testcase 74:  rs1:x2(0x400000000), rs2:x3(0xffffffffbfffffff), result Branch=1
    li x6, 0xcccc
    li x2, 0x400000000
    li x3, 0xffffffffbfffffff
    bge x2, x3, 5f
    li x6, 0x123ab
5: 
    sd x6, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_16_0)
    
     # Testcase 75:  rs1:x3(0x800000000), rs2:x4(0xffffffffdfffffff), result Branch=1
    li x9, 0xcccc
    li x3, 0x800000000
    li x4, 0xffffffffdfffffff
    bge x3, x4, 1f
    li x9, 0x123ab
1: 
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xcccc)

     # Testcase 76:  rs1:x4(0x1000000000), rs2:x5(0xffffffffefffffff), result Branch=1
    li x9, 0xcccc
    li x4, 0x1000000000
    li x5, 0xffffffffefffffff
    bge x4, x5, 2f
    li x9, 0x123ab
2: 
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xcccc)

     # Testcase 77:  rs1:x5(0x2000000000), rs2:x6(0xfffffffff7ffffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x9, 0xcccc
    li x5, 0x2000000000
    li x6, 0xfffffffff7ffffff
    bge x5, x6, 2b
    li x9, 0x123ab
4:
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xcccc)

     # Testcase 78:  rs1:x6(0x4000000000), rs2:x7(0xfffffffffbffffff), result Branch=1
    li x9, 0xcccc
    li x6, 0x4000000000
    li x7, 0xfffffffffbffffff
    bge x6, x7, 4f
    li x9, 0x123ab
4: 
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xcccc)

     # Testcase 79:  rs1:x7(0x8000000000), rs2:x8(0xfffffffffdffffff), result Branch=1
    li x9, 0xcccc
    li x7, 0x8000000000
    li x8, 0xfffffffffdffffff
    bge x7, x8, 5f
    li x9, 0x123ab
5: 
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_17_0)
    
     # Testcase 80:  rs1:x8(0x10000000000), rs2:x9(0xfffffffffeffffff), result Branch=1
    li x3, 0xcccc
    li x8, 0x10000000000
    li x9, 0xfffffffffeffffff
    bge x8, x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 81:  rs1:x9(0x20000000000), rs2:x10(0xffffffffff7fffff), result Branch=1
    li x3, 0xcccc
    li x9, 0x20000000000
    li x10, 0xffffffffff7fffff
    bge x9, x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 82:  rs1:x10(0x40000000000), rs2:x11(0xffffffffffbfffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0x40000000000
    li x11, 0xffffffffffbfffff
    bge x10, x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 83:  rs1:x11(0x80000000000), rs2:x12(0xffffffffffdfffff), result Branch=1
    li x3, 0xcccc
    li x11, 0x80000000000
    li x12, 0xffffffffffdfffff
    bge x11, x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 84:  rs1:x12(0x100000000000), rs2:x13(0xffffffffffefffff), result Branch=1
    li x3, 0xcccc
    li x12, 0x100000000000
    li x13, 0xffffffffffefffff
    bge x12, x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_18_0)
    
     # Testcase 85:  rs1:x13(0x200000000000), rs2:x14(0xfffffffffff7ffff), result Branch=1
    li x3, 0xcccc
    li x13, 0x200000000000
    li x14, 0xfffffffffff7ffff
    bge x13, x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 86:  rs1:x14(0x400000000000), rs2:x15(0xfffffffffffbffff), result Branch=1
    li x3, 0xcccc
    li x14, 0x400000000000
    li x15, 0xfffffffffffbffff
    bge x14, x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 87:  rs1:x15(0x800000000000), rs2:x16(0xfffffffffffdffff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0x800000000000
    li x16, 0xfffffffffffdffff
    bge x15, x16, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 88:  rs1:x16(0x1000000000000), rs2:x17(0xfffffffffffeffff), result Branch=1
    li x3, 0xcccc
    li x16, 0x1000000000000
    li x17, 0xfffffffffffeffff
    bge x16, x17, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 89:  rs1:x17(0x2000000000000), rs2:x18(0xffffffffffff7fff), result Branch=1
    li x3, 0xcccc
    li x17, 0x2000000000000
    li x18, 0xffffffffffff7fff
    bge x17, x18, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_19_0)
    
     # Testcase 90:  rs1:x18(0x4000000000000), rs2:x19(0xffffffffffffbfff), result Branch=1
    li x3, 0xcccc
    li x18, 0x4000000000000
    li x19, 0xffffffffffffbfff
    bge x18, x19, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 91:  rs1:x19(0x8000000000000), rs2:x20(0xffffffffffffdfff), result Branch=1
    li x3, 0xcccc
    li x19, 0x8000000000000
    li x20, 0xffffffffffffdfff
    bge x19, x20, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 92:  rs1:x20(0x10000000000000), rs2:x21(0xffffffffffffefff), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x20, 0x10000000000000
    li x21, 0xffffffffffffefff
    bge x20, x21, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 93:  rs1:x21(0x20000000000000), rs2:x22(0xfffffffffffff7ff), result Branch=1
    li x3, 0xcccc
    li x21, 0x20000000000000
    li x22, 0xfffffffffffff7ff
    bge x21, x22, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 94:  rs1:x22(0x40000000000000), rs2:x23(0xfffffffffffffbff), result Branch=1
    li x3, 0xcccc
    li x22, 0x40000000000000
    li x23, 0xfffffffffffffbff
    bge x22, x23, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_20_0)
    
     # Testcase 95:  rs1:x23(0x80000000000000), rs2:x24(0xfffffffffffffdff), result Branch=1
    li x3, 0xcccc
    li x23, 0x80000000000000
    li x24, 0xfffffffffffffdff
    bge x23, x24, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 96:  rs1:x24(0x100000000000000), rs2:x25(0xfffffffffffffeff), result Branch=1
    li x3, 0xcccc
    li x24, 0x100000000000000
    li x25, 0xfffffffffffffeff
    bge x24, x25, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 97:  rs1:x25(0x200000000000000), rs2:x26(0xffffffffffffff7f), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x25, 0x200000000000000
    li x26, 0xffffffffffffff7f
    bge x25, x26, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 98:  rs1:x26(0x400000000000000), rs2:x27(0xffffffffffffffbf), result Branch=1
    li x3, 0xcccc
    li x26, 0x400000000000000
    li x27, 0xffffffffffffffbf
    bge x26, x27, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 99:  rs1:x27(0x800000000000000), rs2:x28(0xffffffffffffffdf), result Branch=1
    li x3, 0xcccc
    li x27, 0x800000000000000
    li x28, 0xffffffffffffffdf
    bge x27, x28, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x3,signature_21_0)
    
     # Testcase 100:  rs1:x28(0x1000000000000000), rs2:x29(0xffffffffffffffef), result Branch=1
    li x5, 0xcccc
    li x28, 0x1000000000000000
    li x29, 0xffffffffffffffef
    bge x28, x29, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 101:  rs1:x29(0x2000000000000000), rs2:x30(0xfffffffffffffff7), result Branch=1
    li x5, 0xcccc
    li x29, 0x2000000000000000
    li x30, 0xfffffffffffffff7
    bge x29, x30, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 102:  rs1:x30(0x4000000000000000), rs2:x31(0xfffffffffffffffb), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x30, 0x4000000000000000
    li x31, 0xfffffffffffffffb
    bge x30, x31, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 103:  rs1:x31(0x8000000000000000), rs2:x1(0xfffffffffffffffd), result Branch=0
    li x5, 0xcccc
    li x31, 0x8000000000000000
    li x1, 0xfffffffffffffffd
    bge x31, x1, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 104:  rs1:x1(0xfffffffffffffffe), rs2:x2(0xfffffffffffffffe), result Branch=1
    li x5, 0xcccc
    li x1, 0xfffffffffffffffe
    li x2, 0xfffffffffffffffe
    bge x1, x2, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)



    

    RVTEST_SIGBASE(x7,signature_22_0)
    
     # Testcase 105:  rs1:x1(0xfffffffffffffffd), rs2:x2(0x8000000000000000), result Branch=1
    li x9, 0xcccc
    li x1, 0xfffffffffffffffd
    li x2, 0x8000000000000000
    bge x1, x2, 1f
    li x9, 0x123ab
1: 
    sd x9, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)

     # Testcase 106:  rs1:x2(0xfffffffffffffffb), rs2:x3(0x4000000000000000), result Branch=0
    li x9, 0xcccc
    li x2, 0xfffffffffffffffb
    li x3, 0x4000000000000000
    bge x2, x3, 2f
    li x9, 0x123ab
2: 
    sd x9, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 107:  rs1:x3(0xfffffffffffffff7), rs2:x4(0x2000000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x9, 0xcccc
    li x3, 0xfffffffffffffff7
    li x4, 0x2000000000000000
    bge x3, x4, 2b
    li x9, 0x123ab
4:
    sd x9, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 108:  rs1:x4(0xffffffffffffffef), rs2:x5(0x1000000000000000), result Branch=0
    li x9, 0xcccc
    li x4, 0xffffffffffffffef
    li x5, 0x1000000000000000
    bge x4, x5, 4f
    li x9, 0x123ab
4: 
    sd x9, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 109:  rs1:x5(0xffffffffffffffdf), rs2:x6(0x800000000000000), result Branch=0
    li x9, 0xcccc
    li x5, 0xffffffffffffffdf
    li x6, 0x800000000000000
    bge x5, x6, 5f
    li x9, 0x123ab
5: 
    sd x9, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_23_0)
    
     # Testcase 110:  rs1:x6(0xffffffffffffffbf), rs2:x7(0x400000000000000), result Branch=0
    li x3, 0xcccc
    li x6, 0xffffffffffffffbf
    li x7, 0x400000000000000
    bge x6, x7, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 111:  rs1:x7(0xffffffffffffff7f), rs2:x8(0x200000000000000), result Branch=0
    li x3, 0xcccc
    li x7, 0xffffffffffffff7f
    li x8, 0x200000000000000
    bge x7, x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 112:  rs1:x8(0xfffffffffffffeff), rs2:x9(0x100000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffffffffffeff
    li x9, 0x100000000000000
    bge x8, x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 113:  rs1:x9(0xfffffffffffffdff), rs2:x10(0x80000000000000), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffdff
    li x10, 0x80000000000000
    bge x9, x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 114:  rs1:x10(0xfffffffffffffbff), rs2:x11(0x40000000000000), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffffffffffbff
    li x11, 0x40000000000000
    bge x10, x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_24_0)
    
     # Testcase 115:  rs1:x11(0xfffffffffffff7ff), rs2:x12(0x20000000000000), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffffff7ff
    li x12, 0x20000000000000
    bge x11, x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 116:  rs1:x12(0xffffffffffffefff), rs2:x13(0x10000000000000), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffefff
    li x13, 0x10000000000000
    bge x12, x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 117:  rs1:x13(0xffffffffffffdfff), rs2:x14(0x8000000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffffffffffdfff
    li x14, 0x8000000000000
    bge x13, x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 118:  rs1:x14(0xffffffffffffbfff), rs2:x15(0x4000000000000), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffbfff
    li x15, 0x4000000000000
    bge x14, x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 119:  rs1:x15(0xffffffffffff7fff), rs2:x16(0x2000000000000), result Branch=0
    li x3, 0xcccc
    li x15, 0xffffffffffff7fff
    li x16, 0x2000000000000
    bge x15, x16, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_25_0)
    
     # Testcase 120:  rs1:x16(0xfffffffffffeffff), rs2:x17(0x1000000000000), result Branch=0
    li x3, 0xcccc
    li x16, 0xfffffffffffeffff
    li x17, 0x1000000000000
    bge x16, x17, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 121:  rs1:x17(0xfffffffffffdffff), rs2:x18(0x800000000000), result Branch=0
    li x3, 0xcccc
    li x17, 0xfffffffffffdffff
    li x18, 0x800000000000
    bge x17, x18, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 122:  rs1:x18(0xfffffffffffbffff), rs2:x19(0x400000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x18, 0xfffffffffffbffff
    li x19, 0x400000000000
    bge x18, x19, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 123:  rs1:x19(0xfffffffffff7ffff), rs2:x20(0x200000000000), result Branch=0
    li x3, 0xcccc
    li x19, 0xfffffffffff7ffff
    li x20, 0x200000000000
    bge x19, x20, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 124:  rs1:x20(0xffffffffffefffff), rs2:x21(0x100000000000), result Branch=0
    li x3, 0xcccc
    li x20, 0xffffffffffefffff
    li x21, 0x100000000000
    bge x20, x21, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_26_0)
    
     # Testcase 125:  rs1:x21(0xffffffffffdfffff), rs2:x22(0x80000000000), result Branch=0
    li x3, 0xcccc
    li x21, 0xffffffffffdfffff
    li x22, 0x80000000000
    bge x21, x22, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 126:  rs1:x22(0xffffffffffbfffff), rs2:x23(0x40000000000), result Branch=0
    li x3, 0xcccc
    li x22, 0xffffffffffbfffff
    li x23, 0x40000000000
    bge x22, x23, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 127:  rs1:x23(0xffffffffff7fffff), rs2:x24(0x20000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x23, 0xffffffffff7fffff
    li x24, 0x20000000000
    bge x23, x24, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 128:  rs1:x24(0xfffffffffeffffff), rs2:x25(0x10000000000), result Branch=0
    li x3, 0xcccc
    li x24, 0xfffffffffeffffff
    li x25, 0x10000000000
    bge x24, x25, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 129:  rs1:x25(0xfffffffffdffffff), rs2:x26(0x8000000000), result Branch=0
    li x3, 0xcccc
    li x25, 0xfffffffffdffffff
    li x26, 0x8000000000
    bge x25, x26, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_27_0)
    
     # Testcase 130:  rs1:x26(0xfffffffffbffffff), rs2:x27(0x4000000000), result Branch=0
    li x3, 0xcccc
    li x26, 0xfffffffffbffffff
    li x27, 0x4000000000
    bge x26, x27, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 131:  rs1:x27(0xfffffffff7ffffff), rs2:x28(0x2000000000), result Branch=0
    li x3, 0xcccc
    li x27, 0xfffffffff7ffffff
    li x28, 0x2000000000
    bge x27, x28, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 132:  rs1:x28(0xffffffffefffffff), rs2:x29(0x1000000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x28, 0xffffffffefffffff
    li x29, 0x1000000000
    bge x28, x29, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 133:  rs1:x29(0xffffffffdfffffff), rs2:x30(0x800000000), result Branch=0
    li x3, 0xcccc
    li x29, 0xffffffffdfffffff
    li x30, 0x800000000
    bge x29, x30, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 134:  rs1:x30(0xffffffffbfffffff), rs2:x31(0x400000000), result Branch=0
    li x3, 0xcccc
    li x30, 0xffffffffbfffffff
    li x31, 0x400000000
    bge x30, x31, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x5,signature_28_0)
    
     # Testcase 135:  rs1:x31(0xffffffff7fffffff), rs2:x1(0x200000000), result Branch=0
    li x7, 0xcccc
    li x31, 0xffffffff7fffffff
    li x1, 0x200000000
    bge x31, x1, 1f
    li x7, 0x123ab
1: 
    sd x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x123ab)

     # Testcase 136:  rs1:x1(0xfffffffeffffffff), rs2:x2(0x100000000), result Branch=0
    li x7, 0xcccc
    li x1, 0xfffffffeffffffff
    li x2, 0x100000000
    bge x1, x2, 2f
    li x7, 0x123ab
2: 
    sd x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x123ab)

     # Testcase 137:  rs1:x1(0xfffffffdffffffff), rs2:x2(0x80000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x7, 0xcccc
    li x1, 0xfffffffdffffffff
    li x2, 0x80000000
    bge x1, x2, 2b
    li x7, 0x123ab
4:
    sd x7, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x123ab)

     # Testcase 138:  rs1:x2(0xfffffffbffffffff), rs2:x3(0x40000000), result Branch=0
    li x7, 0xcccc
    li x2, 0xfffffffbffffffff
    li x3, 0x40000000
    bge x2, x3, 4f
    li x7, 0x123ab
4: 
    sd x7, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x123ab)

     # Testcase 139:  rs1:x3(0xfffffff7ffffffff), rs2:x4(0x20000000), result Branch=0
    li x7, 0xcccc
    li x3, 0xfffffff7ffffffff
    li x4, 0x20000000
    bge x3, x4, 5f
    li x7, 0x123ab
5: 
    sd x7, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_29_0)
    
     # Testcase 140:  rs1:x4(0xffffffefffffffff), rs2:x5(0x10000000), result Branch=0
    li x3, 0xcccc
    li x4, 0xffffffefffffffff
    li x5, 0x10000000
    bge x4, x5, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 141:  rs1:x5(0xffffffdfffffffff), rs2:x6(0x8000000), result Branch=0
    li x3, 0xcccc
    li x5, 0xffffffdfffffffff
    li x6, 0x8000000
    bge x5, x6, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 142:  rs1:x6(0xffffffbfffffffff), rs2:x7(0x4000000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x6, 0xffffffbfffffffff
    li x7, 0x4000000
    bge x6, x7, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 143:  rs1:x7(0xffffff7fffffffff), rs2:x8(0x2000000), result Branch=0
    li x3, 0xcccc
    li x7, 0xffffff7fffffffff
    li x8, 0x2000000
    bge x7, x8, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 144:  rs1:x8(0xfffffeffffffffff), rs2:x9(0x1000000), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffeffffffffff
    li x9, 0x1000000
    bge x8, x9, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_30_0)
    
     # Testcase 145:  rs1:x9(0xfffffdffffffffff), rs2:x10(0x800000), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdffffffffff
    li x10, 0x800000
    bge x9, x10, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 146:  rs1:x10(0xfffffbffffffffff), rs2:x11(0x400000), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffbffffffffff
    li x11, 0x400000
    bge x10, x11, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 147:  rs1:x11(0xfffff7ffffffffff), rs2:x12(0x200000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x11, 0xfffff7ffffffffff
    li x12, 0x200000
    bge x11, x12, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 148:  rs1:x12(0xffffefffffffffff), rs2:x13(0x100000), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefffffffffff
    li x13, 0x100000
    bge x12, x13, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 149:  rs1:x13(0xffffdfffffffffff), rs2:x14(0x80000), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffdfffffffffff
    li x14, 0x80000
    bge x13, x14, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_31_0)
    
     # Testcase 150:  rs1:x14(0xffffbfffffffffff), rs2:x15(0x40000), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfffffffffff
    li x15, 0x40000
    bge x14, x15, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 151:  rs1:x15(0xffff7fffffffffff), rs2:x16(0x20000), result Branch=0
    li x3, 0xcccc
    li x15, 0xffff7fffffffffff
    li x16, 0x20000
    bge x15, x16, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 152:  rs1:x16(0xfffeffffffffffff), rs2:x17(0x10000), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x16, 0xfffeffffffffffff
    li x17, 0x10000
    bge x16, x17, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 153:  rs1:x17(0xfffdffffffffffff), rs2:x18(0x8000), result Branch=0
    li x3, 0xcccc
    li x17, 0xfffdffffffffffff
    li x18, 0x8000
    bge x17, x18, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 154:  rs1:x18(0xfffbffffffffffff), rs2:x19(0x4000), result Branch=0
    li x3, 0xcccc
    li x18, 0xfffbffffffffffff
    li x19, 0x4000
    bge x18, x19, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_32_0)
    
     # Testcase 155:  rs1:x19(0xfff7ffffffffffff), rs2:x20(0x2000), result Branch=0
    li x3, 0xcccc
    li x19, 0xfff7ffffffffffff
    li x20, 0x2000
    bge x19, x20, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 156:  rs1:x20(0xffefffffffffffff), rs2:x21(0x1000), result Branch=0
    li x3, 0xcccc
    li x20, 0xffefffffffffffff
    li x21, 0x1000
    bge x20, x21, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 157:  rs1:x21(0xffdfffffffffffff), rs2:x22(0x800), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x21, 0xffdfffffffffffff
    li x22, 0x800
    bge x21, x22, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 158:  rs1:x22(0xffbfffffffffffff), rs2:x23(0x400), result Branch=0
    li x3, 0xcccc
    li x22, 0xffbfffffffffffff
    li x23, 0x400
    bge x22, x23, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 159:  rs1:x23(0xff7fffffffffffff), rs2:x24(0x200), result Branch=0
    li x3, 0xcccc
    li x23, 0xff7fffffffffffff
    li x24, 0x200
    bge x23, x24, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_33_0)
    
     # Testcase 160:  rs1:x24(0xfeffffffffffffff), rs2:x25(0x100), result Branch=0
    li x3, 0xcccc
    li x24, 0xfeffffffffffffff
    li x25, 0x100
    bge x24, x25, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 161:  rs1:x25(0xfdffffffffffffff), rs2:x26(0x80), result Branch=0
    li x3, 0xcccc
    li x25, 0xfdffffffffffffff
    li x26, 0x80
    bge x25, x26, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 162:  rs1:x26(0xfbffffffffffffff), rs2:x27(0x40), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x26, 0xfbffffffffffffff
    li x27, 0x40
    bge x26, x27, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 163:  rs1:x27(0xf7ffffffffffffff), rs2:x28(0x20), result Branch=0
    li x3, 0xcccc
    li x27, 0xf7ffffffffffffff
    li x28, 0x20
    bge x27, x28, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 164:  rs1:x28(0xefffffffffffffff), rs2:x29(0x10), result Branch=0
    li x3, 0xcccc
    li x28, 0xefffffffffffffff
    li x29, 0x10
    bge x28, x29, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x3,signature_34_0)
    
     # Testcase 165:  rs1:x29(0xdfffffffffffffff), rs2:x30(0x8), result Branch=0
    li x5, 0xcccc
    li x29, 0xdfffffffffffffff
    li x30, 0x8
    bge x29, x30, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 166:  rs1:x30(0xbfffffffffffffff), rs2:x31(0x4), result Branch=0
    li x5, 0xcccc
    li x30, 0xbfffffffffffffff
    li x31, 0x4
    bge x30, x31, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 167:  rs1:x31(0x7fffffffffffffff), rs2:x1(0x2), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x31, 0x7fffffffffffffff
    li x1, 0x2
    bge x31, x1, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 168:  rs1:x1(0x1), rs2:x2(0x0), result Branch=1
    li x5, 0xcccc
    li x1, 0x1
    li x2, 0x0
    bge x1, x2, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)

     # Testcase 169:  rs1:x1(0x2), rs2:x2(0x0), result Branch=1
    li x5, 0xcccc
    li x1, 0x2
    li x2, 0x0
    bge x1, x2, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_35_0)
    
     # Testcase 170:  rs1:x2(0x4), rs2:x3(0x0), result Branch=1
    li x9, 0xcccc
    li x2, 0x4
    li x3, 0x0
    bge x2, x3, 1f
    li x9, 0x123ab
1: 
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)

     # Testcase 171:  rs1:x3(0x8), rs2:x4(0x0), result Branch=1
    li x9, 0xcccc
    li x3, 0x8
    li x4, 0x0
    bge x3, x4, 2f
    li x9, 0x123ab
2: 
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)

     # Testcase 172:  rs1:x4(0x10), rs2:x5(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x9, 0xcccc
    li x4, 0x10
    li x5, 0x0
    bge x4, x5, 2b
    li x9, 0x123ab
4:
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)

     # Testcase 173:  rs1:x5(0x20), rs2:x6(0x0), result Branch=1
    li x9, 0xcccc
    li x5, 0x20
    li x6, 0x0
    bge x5, x6, 4f
    li x9, 0x123ab
4: 
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)

     # Testcase 174:  rs1:x6(0x40), rs2:x7(0x0), result Branch=1
    li x9, 0xcccc
    li x6, 0x40
    li x7, 0x0
    bge x6, x7, 5f
    li x9, 0x123ab
5: 
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_36_0)
    
     # Testcase 175:  rs1:x7(0x80), rs2:x8(0x0), result Branch=1
    li x3, 0xcccc
    li x7, 0x80
    li x8, 0x0
    bge x7, x8, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 176:  rs1:x8(0x100), rs2:x9(0x0), result Branch=1
    li x3, 0xcccc
    li x8, 0x100
    li x9, 0x0
    bge x8, x9, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 177:  rs1:x9(0x200), rs2:x10(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x9, 0x200
    li x10, 0x0
    bge x9, x10, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 178:  rs1:x10(0x400), rs2:x11(0x0), result Branch=1
    li x3, 0xcccc
    li x10, 0x400
    li x11, 0x0
    bge x10, x11, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 179:  rs1:x11(0x800), rs2:x12(0x0), result Branch=1
    li x3, 0xcccc
    li x11, 0x800
    li x12, 0x0
    bge x11, x12, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_37_0)
    
     # Testcase 180:  rs1:x12(0x1000), rs2:x13(0x0), result Branch=1
    li x3, 0xcccc
    li x12, 0x1000
    li x13, 0x0
    bge x12, x13, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 181:  rs1:x13(0x2000), rs2:x14(0x0), result Branch=1
    li x3, 0xcccc
    li x13, 0x2000
    li x14, 0x0
    bge x13, x14, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 182:  rs1:x14(0x4000), rs2:x15(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x14, 0x4000
    li x15, 0x0
    bge x14, x15, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 183:  rs1:x15(0x8000), rs2:x16(0x0), result Branch=1
    li x3, 0xcccc
    li x15, 0x8000
    li x16, 0x0
    bge x15, x16, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 184:  rs1:x16(0x10000), rs2:x17(0x0), result Branch=1
    li x3, 0xcccc
    li x16, 0x10000
    li x17, 0x0
    bge x16, x17, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_38_0)
    
     # Testcase 185:  rs1:x17(0x20000), rs2:x18(0x0), result Branch=1
    li x3, 0xcccc
    li x17, 0x20000
    li x18, 0x0
    bge x17, x18, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 186:  rs1:x18(0x40000), rs2:x19(0x0), result Branch=1
    li x3, 0xcccc
    li x18, 0x40000
    li x19, 0x0
    bge x18, x19, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 187:  rs1:x19(0x80000), rs2:x20(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x19, 0x80000
    li x20, 0x0
    bge x19, x20, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 188:  rs1:x20(0x100000), rs2:x21(0x0), result Branch=1
    li x3, 0xcccc
    li x20, 0x100000
    li x21, 0x0
    bge x20, x21, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 189:  rs1:x21(0x200000), rs2:x22(0x0), result Branch=1
    li x3, 0xcccc
    li x21, 0x200000
    li x22, 0x0
    bge x21, x22, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_39_0)
    
     # Testcase 190:  rs1:x22(0x400000), rs2:x23(0x0), result Branch=1
    li x3, 0xcccc
    li x22, 0x400000
    li x23, 0x0
    bge x22, x23, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 191:  rs1:x23(0x800000), rs2:x24(0x0), result Branch=1
    li x3, 0xcccc
    li x23, 0x800000
    li x24, 0x0
    bge x23, x24, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 192:  rs1:x24(0x1000000), rs2:x25(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x24, 0x1000000
    li x25, 0x0
    bge x24, x25, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 193:  rs1:x25(0x2000000), rs2:x26(0x0), result Branch=1
    li x3, 0xcccc
    li x25, 0x2000000
    li x26, 0x0
    bge x25, x26, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 194:  rs1:x26(0x4000000), rs2:x27(0x0), result Branch=1
    li x3, 0xcccc
    li x26, 0x4000000
    li x27, 0x0
    bge x26, x27, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x2,signature_40_0)
    
     # Testcase 195:  rs1:x27(0x8000000), rs2:x28(0x0), result Branch=1
    li x4, 0xcccc
    li x27, 0x8000000
    li x28, 0x0
    bge x27, x28, 1f
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 196:  rs1:x28(0x10000000), rs2:x29(0x0), result Branch=1
    li x4, 0xcccc
    li x28, 0x10000000
    li x29, 0x0
    bge x28, x29, 2f
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 197:  rs1:x29(0x20000000), rs2:x30(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x4, 0xcccc
    li x29, 0x20000000
    li x30, 0x0
    bge x29, x30, 2b
    li x4, 0x123ab
4:
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 198:  rs1:x30(0x40000000), rs2:x31(0x0), result Branch=1
    li x4, 0xcccc
    li x30, 0x40000000
    li x31, 0x0
    bge x30, x31, 4f
    li x4, 0x123ab
4: 
    sd x4, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 199:  rs1:x31(0x80000000), rs2:x1(0x0), result Branch=1
    li x4, 0xcccc
    li x31, 0x80000000
    li x1, 0x0
    bge x31, x1, 5f
    li x4, 0x123ab
5: 
    sd x4, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)



    

    RVTEST_SIGBASE(x6,signature_41_0)
    
     # Testcase 200:  rs1:x1(0x100000000), rs2:x2(0x0), result Branch=1
    li x8, 0xcccc
    li x1, 0x100000000
    li x2, 0x0
    bge x1, x2, 1f
    li x8, 0x123ab
1: 
    sd x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 201:  rs1:x1(0x200000000), rs2:x2(0x0), result Branch=1
    li x8, 0xcccc
    li x1, 0x200000000
    li x2, 0x0
    bge x1, x2, 2f
    li x8, 0x123ab
2: 
    sd x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 202:  rs1:x2(0x400000000), rs2:x3(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x8, 0xcccc
    li x2, 0x400000000
    li x3, 0x0
    bge x2, x3, 2b
    li x8, 0x123ab
4:
    sd x8, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 203:  rs1:x3(0x800000000), rs2:x4(0x0), result Branch=1
    li x8, 0xcccc
    li x3, 0x800000000
    li x4, 0x0
    bge x3, x4, 4f
    li x8, 0x123ab
4: 
    sd x8, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)

     # Testcase 204:  rs1:x4(0x1000000000), rs2:x5(0x0), result Branch=1
    li x8, 0xcccc
    li x4, 0x1000000000
    li x5, 0x0
    bge x4, x5, 5f
    li x8, 0x123ab
5: 
    sd x8, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_42_0)
    
     # Testcase 205:  rs1:x5(0x2000000000), rs2:x6(0x0), result Branch=1
    li x3, 0xcccc
    li x5, 0x2000000000
    li x6, 0x0
    bge x5, x6, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 206:  rs1:x6(0x4000000000), rs2:x7(0x0), result Branch=1
    li x3, 0xcccc
    li x6, 0x4000000000
    li x7, 0x0
    bge x6, x7, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 207:  rs1:x7(0x8000000000), rs2:x8(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x7, 0x8000000000
    li x8, 0x0
    bge x7, x8, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 208:  rs1:x8(0x10000000000), rs2:x9(0x0), result Branch=1
    li x3, 0xcccc
    li x8, 0x10000000000
    li x9, 0x0
    bge x8, x9, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 209:  rs1:x9(0x20000000000), rs2:x10(0x0), result Branch=1
    li x3, 0xcccc
    li x9, 0x20000000000
    li x10, 0x0
    bge x9, x10, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_43_0)
    
     # Testcase 210:  rs1:x10(0x40000000000), rs2:x11(0x0), result Branch=1
    li x3, 0xcccc
    li x10, 0x40000000000
    li x11, 0x0
    bge x10, x11, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 211:  rs1:x11(0x80000000000), rs2:x12(0x0), result Branch=1
    li x3, 0xcccc
    li x11, 0x80000000000
    li x12, 0x0
    bge x11, x12, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 212:  rs1:x12(0x100000000000), rs2:x13(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x12, 0x100000000000
    li x13, 0x0
    bge x12, x13, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 213:  rs1:x13(0x200000000000), rs2:x14(0x0), result Branch=1
    li x3, 0xcccc
    li x13, 0x200000000000
    li x14, 0x0
    bge x13, x14, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 214:  rs1:x14(0x400000000000), rs2:x15(0x0), result Branch=1
    li x3, 0xcccc
    li x14, 0x400000000000
    li x15, 0x0
    bge x14, x15, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_44_0)
    
     # Testcase 215:  rs1:x15(0x800000000000), rs2:x16(0x0), result Branch=1
    li x3, 0xcccc
    li x15, 0x800000000000
    li x16, 0x0
    bge x15, x16, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 216:  rs1:x16(0x1000000000000), rs2:x17(0x0), result Branch=1
    li x3, 0xcccc
    li x16, 0x1000000000000
    li x17, 0x0
    bge x16, x17, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 217:  rs1:x17(0x2000000000000), rs2:x18(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x17, 0x2000000000000
    li x18, 0x0
    bge x17, x18, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 218:  rs1:x18(0x4000000000000), rs2:x19(0x0), result Branch=1
    li x3, 0xcccc
    li x18, 0x4000000000000
    li x19, 0x0
    bge x18, x19, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 219:  rs1:x19(0x8000000000000), rs2:x20(0x0), result Branch=1
    li x3, 0xcccc
    li x19, 0x8000000000000
    li x20, 0x0
    bge x19, x20, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_45_0)
    
     # Testcase 220:  rs1:x20(0x10000000000000), rs2:x21(0x0), result Branch=1
    li x3, 0xcccc
    li x20, 0x10000000000000
    li x21, 0x0
    bge x20, x21, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 221:  rs1:x21(0x20000000000000), rs2:x22(0x0), result Branch=1
    li x3, 0xcccc
    li x21, 0x20000000000000
    li x22, 0x0
    bge x21, x22, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 222:  rs1:x22(0x40000000000000), rs2:x23(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x22, 0x40000000000000
    li x23, 0x0
    bge x22, x23, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 223:  rs1:x23(0x80000000000000), rs2:x24(0x0), result Branch=1
    li x3, 0xcccc
    li x23, 0x80000000000000
    li x24, 0x0
    bge x23, x24, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 224:  rs1:x24(0x100000000000000), rs2:x25(0x0), result Branch=1
    li x3, 0xcccc
    li x24, 0x100000000000000
    li x25, 0x0
    bge x24, x25, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x1,signature_46_0)
    
     # Testcase 225:  rs1:x25(0x200000000000000), rs2:x26(0x0), result Branch=1
    li x3, 0xcccc
    li x25, 0x200000000000000
    li x26, 0x0
    bge x25, x26, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 226:  rs1:x26(0x400000000000000), rs2:x27(0x0), result Branch=1
    li x3, 0xcccc
    li x26, 0x400000000000000
    li x27, 0x0
    bge x26, x27, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 227:  rs1:x27(0x800000000000000), rs2:x28(0x0), result Branch=1
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x27, 0x800000000000000
    li x28, 0x0
    bge x27, x28, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 228:  rs1:x28(0x1000000000000000), rs2:x29(0x0), result Branch=1
    li x3, 0xcccc
    li x28, 0x1000000000000000
    li x29, 0x0
    bge x28, x29, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)

     # Testcase 229:  rs1:x29(0x2000000000000000), rs2:x30(0x0), result Branch=1
    li x3, 0xcccc
    li x29, 0x2000000000000000
    li x30, 0x0
    bge x29, x30, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcccc)



    

    RVTEST_SIGBASE(x4,signature_47_0)
    
     # Testcase 230:  rs1:x30(0x4000000000000000), rs2:x31(0x0), result Branch=1
    li x6, 0xcccc
    li x30, 0x4000000000000000
    li x31, 0x0
    bge x30, x31, 1f
    li x6, 0x123ab
1: 
    sd x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xcccc)

     # Testcase 231:  rs1:x31(0x8000000000000000), rs2:x1(0x0), result Branch=0
    li x6, 0xcccc
    li x31, 0x8000000000000000
    li x1, 0x0
    bge x31, x1, 2f
    li x6, 0x123ab
2: 
    sd x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x123ab)

     # Testcase 232:  rs1:x1(0xfffffffffffffffe), rs2:x2(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x6, 0xcccc
    li x1, 0xfffffffffffffffe
    li x2, 0x0
    bge x1, x2, 2b
    li x6, 0x123ab
4:
    sd x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x123ab)

     # Testcase 233:  rs1:x1(0xfffffffffffffffd), rs2:x2(0x0), result Branch=0
    li x6, 0xcccc
    li x1, 0xfffffffffffffffd
    li x2, 0x0
    bge x1, x2, 4f
    li x6, 0x123ab
4: 
    sd x6, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x123ab)

     # Testcase 234:  rs1:x2(0xfffffffffffffffb), rs2:x3(0x0), result Branch=0
    li x6, 0xcccc
    li x2, 0xfffffffffffffffb
    li x3, 0x0
    bge x2, x3, 5f
    li x6, 0x123ab
5: 
    sd x6, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_48_0)
    
     # Testcase 235:  rs1:x3(0xfffffffffffffff7), rs2:x4(0x0), result Branch=0
    li x9, 0xcccc
    li x3, 0xfffffffffffffff7
    li x4, 0x0
    bge x3, x4, 1f
    li x9, 0x123ab
1: 
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x123ab)

     # Testcase 236:  rs1:x4(0xffffffffffffffef), rs2:x5(0x0), result Branch=0
    li x9, 0xcccc
    li x4, 0xffffffffffffffef
    li x5, 0x0
    bge x4, x5, 2f
    li x9, 0x123ab
2: 
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x123ab)

     # Testcase 237:  rs1:x5(0xffffffffffffffdf), rs2:x6(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x9, 0xcccc
    li x5, 0xffffffffffffffdf
    li x6, 0x0
    bge x5, x6, 2b
    li x9, 0x123ab
4:
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x123ab)

     # Testcase 238:  rs1:x6(0xffffffffffffffbf), rs2:x7(0x0), result Branch=0
    li x9, 0xcccc
    li x6, 0xffffffffffffffbf
    li x7, 0x0
    bge x6, x7, 4f
    li x9, 0x123ab
4: 
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x123ab)

     # Testcase 239:  rs1:x7(0xffffffffffffff7f), rs2:x8(0x0), result Branch=0
    li x9, 0xcccc
    li x7, 0xffffffffffffff7f
    li x8, 0x0
    bge x7, x8, 5f
    li x9, 0x123ab
5: 
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_49_0)
    
     # Testcase 240:  rs1:x8(0xfffffffffffffeff), rs2:x9(0x0), result Branch=0
    li x3, 0xcccc
    li x8, 0xfffffffffffffeff
    li x9, 0x0
    bge x8, x9, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 241:  rs1:x9(0xfffffffffffffdff), rs2:x10(0x0), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffffffffffdff
    li x10, 0x0
    bge x9, x10, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 242:  rs1:x10(0xfffffffffffffbff), rs2:x11(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x10, 0xfffffffffffffbff
    li x11, 0x0
    bge x10, x11, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 243:  rs1:x11(0xfffffffffffff7ff), rs2:x12(0x0), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffffffffffff7ff
    li x12, 0x0
    bge x11, x12, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 244:  rs1:x12(0xffffffffffffefff), rs2:x13(0x0), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffffffffffefff
    li x13, 0x0
    bge x12, x13, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_50_0)
    
     # Testcase 245:  rs1:x13(0xffffffffffffdfff), rs2:x14(0x0), result Branch=0
    li x3, 0xcccc
    li x13, 0xffffffffffffdfff
    li x14, 0x0
    bge x13, x14, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 246:  rs1:x14(0xffffffffffffbfff), rs2:x15(0x0), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffffffffffbfff
    li x15, 0x0
    bge x14, x15, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 247:  rs1:x15(0xffffffffffff7fff), rs2:x16(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x15, 0xffffffffffff7fff
    li x16, 0x0
    bge x15, x16, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 248:  rs1:x16(0xfffffffffffeffff), rs2:x17(0x0), result Branch=0
    li x3, 0xcccc
    li x16, 0xfffffffffffeffff
    li x17, 0x0
    bge x16, x17, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 249:  rs1:x17(0xfffffffffffdffff), rs2:x18(0x0), result Branch=0
    li x3, 0xcccc
    li x17, 0xfffffffffffdffff
    li x18, 0x0
    bge x17, x18, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_51_0)
    
     # Testcase 250:  rs1:x18(0xfffffffffffbffff), rs2:x19(0x0), result Branch=0
    li x3, 0xcccc
    li x18, 0xfffffffffffbffff
    li x19, 0x0
    bge x18, x19, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 251:  rs1:x19(0xfffffffffff7ffff), rs2:x20(0x0), result Branch=0
    li x3, 0xcccc
    li x19, 0xfffffffffff7ffff
    li x20, 0x0
    bge x19, x20, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 252:  rs1:x20(0xffffffffffefffff), rs2:x21(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x20, 0xffffffffffefffff
    li x21, 0x0
    bge x20, x21, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 253:  rs1:x21(0xffffffffffdfffff), rs2:x22(0x0), result Branch=0
    li x3, 0xcccc
    li x21, 0xffffffffffdfffff
    li x22, 0x0
    bge x21, x22, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 254:  rs1:x22(0xffffffffffbfffff), rs2:x23(0x0), result Branch=0
    li x3, 0xcccc
    li x22, 0xffffffffffbfffff
    li x23, 0x0
    bge x22, x23, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_52_0)
    
     # Testcase 255:  rs1:x23(0xffffffffff7fffff), rs2:x24(0x0), result Branch=0
    li x3, 0xcccc
    li x23, 0xffffffffff7fffff
    li x24, 0x0
    bge x23, x24, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 256:  rs1:x24(0xfffffffffeffffff), rs2:x25(0x0), result Branch=0
    li x3, 0xcccc
    li x24, 0xfffffffffeffffff
    li x25, 0x0
    bge x24, x25, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 257:  rs1:x25(0xfffffffffdffffff), rs2:x26(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x25, 0xfffffffffdffffff
    li x26, 0x0
    bge x25, x26, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 258:  rs1:x26(0xfffffffffbffffff), rs2:x27(0x0), result Branch=0
    li x3, 0xcccc
    li x26, 0xfffffffffbffffff
    li x27, 0x0
    bge x26, x27, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 259:  rs1:x27(0xfffffffff7ffffff), rs2:x28(0x0), result Branch=0
    li x3, 0xcccc
    li x27, 0xfffffffff7ffffff
    li x28, 0x0
    bge x27, x28, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x3,signature_53_0)
    
     # Testcase 260:  rs1:x28(0xffffffffefffffff), rs2:x29(0x0), result Branch=0
    li x5, 0xcccc
    li x28, 0xffffffffefffffff
    li x29, 0x0
    bge x28, x29, 1f
    li x5, 0x123ab
1: 
    sd x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 261:  rs1:x29(0xffffffffdfffffff), rs2:x30(0x0), result Branch=0
    li x5, 0xcccc
    li x29, 0xffffffffdfffffff
    li x30, 0x0
    bge x29, x30, 2f
    li x5, 0x123ab
2: 
    sd x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 262:  rs1:x30(0xffffffffbfffffff), rs2:x31(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x5, 0xcccc
    li x30, 0xffffffffbfffffff
    li x31, 0x0
    bge x30, x31, 2b
    li x5, 0x123ab
4:
    sd x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 263:  rs1:x31(0xffffffff7fffffff), rs2:x1(0x0), result Branch=0
    li x5, 0xcccc
    li x31, 0xffffffff7fffffff
    li x1, 0x0
    bge x31, x1, 4f
    li x5, 0x123ab
4: 
    sd x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)

     # Testcase 264:  rs1:x1(0xfffffffeffffffff), rs2:x2(0x0), result Branch=0
    li x5, 0xcccc
    li x1, 0xfffffffeffffffff
    li x2, 0x0
    bge x1, x2, 5f
    li x5, 0x123ab
5: 
    sd x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x123ab)



    

    RVTEST_SIGBASE(x7,signature_54_0)
    
     # Testcase 265:  rs1:x1(0xfffffffdffffffff), rs2:x2(0x0), result Branch=0
    li x9, 0xcccc
    li x1, 0xfffffffdffffffff
    li x2, 0x0
    bge x1, x2, 1f
    li x9, 0x123ab
1: 
    sd x9, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 266:  rs1:x2(0xfffffffbffffffff), rs2:x3(0x0), result Branch=0
    li x9, 0xcccc
    li x2, 0xfffffffbffffffff
    li x3, 0x0
    bge x2, x3, 2f
    li x9, 0x123ab
2: 
    sd x9, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 267:  rs1:x3(0xfffffff7ffffffff), rs2:x4(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x9, 0xcccc
    li x3, 0xfffffff7ffffffff
    li x4, 0x0
    bge x3, x4, 2b
    li x9, 0x123ab
4:
    sd x9, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 268:  rs1:x4(0xffffffefffffffff), rs2:x5(0x0), result Branch=0
    li x9, 0xcccc
    li x4, 0xffffffefffffffff
    li x5, 0x0
    bge x4, x5, 4f
    li x9, 0x123ab
4: 
    sd x9, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)

     # Testcase 269:  rs1:x5(0xffffffdfffffffff), rs2:x6(0x0), result Branch=0
    li x9, 0xcccc
    li x5, 0xffffffdfffffffff
    li x6, 0x0
    bge x5, x6, 5f
    li x9, 0x123ab
5: 
    sd x9, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_55_0)
    
     # Testcase 270:  rs1:x6(0xffffffbfffffffff), rs2:x7(0x0), result Branch=0
    li x3, 0xcccc
    li x6, 0xffffffbfffffffff
    li x7, 0x0
    bge x6, x7, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 271:  rs1:x7(0xffffff7fffffffff), rs2:x8(0x0), result Branch=0
    li x3, 0xcccc
    li x7, 0xffffff7fffffffff
    li x8, 0x0
    bge x7, x8, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 272:  rs1:x8(0xfffffeffffffffff), rs2:x9(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x8, 0xfffffeffffffffff
    li x9, 0x0
    bge x8, x9, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 273:  rs1:x9(0xfffffdffffffffff), rs2:x10(0x0), result Branch=0
    li x3, 0xcccc
    li x9, 0xfffffdffffffffff
    li x10, 0x0
    bge x9, x10, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 274:  rs1:x10(0xfffffbffffffffff), rs2:x11(0x0), result Branch=0
    li x3, 0xcccc
    li x10, 0xfffffbffffffffff
    li x11, 0x0
    bge x10, x11, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_56_0)
    
     # Testcase 275:  rs1:x11(0xfffff7ffffffffff), rs2:x12(0x0), result Branch=0
    li x3, 0xcccc
    li x11, 0xfffff7ffffffffff
    li x12, 0x0
    bge x11, x12, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 276:  rs1:x12(0xffffefffffffffff), rs2:x13(0x0), result Branch=0
    li x3, 0xcccc
    li x12, 0xffffefffffffffff
    li x13, 0x0
    bge x12, x13, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 277:  rs1:x13(0xffffdfffffffffff), rs2:x14(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x13, 0xffffdfffffffffff
    li x14, 0x0
    bge x13, x14, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 278:  rs1:x14(0xffffbfffffffffff), rs2:x15(0x0), result Branch=0
    li x3, 0xcccc
    li x14, 0xffffbfffffffffff
    li x15, 0x0
    bge x14, x15, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 279:  rs1:x15(0xffff7fffffffffff), rs2:x16(0x0), result Branch=0
    li x3, 0xcccc
    li x15, 0xffff7fffffffffff
    li x16, 0x0
    bge x15, x16, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_57_0)
    
     # Testcase 280:  rs1:x16(0xfffeffffffffffff), rs2:x17(0x0), result Branch=0
    li x3, 0xcccc
    li x16, 0xfffeffffffffffff
    li x17, 0x0
    bge x16, x17, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 281:  rs1:x17(0xfffdffffffffffff), rs2:x18(0x0), result Branch=0
    li x3, 0xcccc
    li x17, 0xfffdffffffffffff
    li x18, 0x0
    bge x17, x18, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 282:  rs1:x18(0xfffbffffffffffff), rs2:x19(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x18, 0xfffbffffffffffff
    li x19, 0x0
    bge x18, x19, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 283:  rs1:x19(0xfff7ffffffffffff), rs2:x20(0x0), result Branch=0
    li x3, 0xcccc
    li x19, 0xfff7ffffffffffff
    li x20, 0x0
    bge x19, x20, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 284:  rs1:x20(0xffefffffffffffff), rs2:x21(0x0), result Branch=0
    li x3, 0xcccc
    li x20, 0xffefffffffffffff
    li x21, 0x0
    bge x20, x21, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_58_0)
    
     # Testcase 285:  rs1:x21(0xffdfffffffffffff), rs2:x22(0x0), result Branch=0
    li x3, 0xcccc
    li x21, 0xffdfffffffffffff
    li x22, 0x0
    bge x21, x22, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 286:  rs1:x22(0xffbfffffffffffff), rs2:x23(0x0), result Branch=0
    li x3, 0xcccc
    li x22, 0xffbfffffffffffff
    li x23, 0x0
    bge x22, x23, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 287:  rs1:x23(0xff7fffffffffffff), rs2:x24(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x23, 0xff7fffffffffffff
    li x24, 0x0
    bge x23, x24, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 288:  rs1:x24(0xfeffffffffffffff), rs2:x25(0x0), result Branch=0
    li x3, 0xcccc
    li x24, 0xfeffffffffffffff
    li x25, 0x0
    bge x24, x25, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 289:  rs1:x25(0xfdffffffffffffff), rs2:x26(0x0), result Branch=0
    li x3, 0xcccc
    li x25, 0xfdffffffffffffff
    li x26, 0x0
    bge x25, x26, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x1,signature_59_0)
    
     # Testcase 290:  rs1:x26(0xfbffffffffffffff), rs2:x27(0x0), result Branch=0
    li x3, 0xcccc
    li x26, 0xfbffffffffffffff
    li x27, 0x0
    bge x26, x27, 1f
    li x3, 0x123ab
1: 
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 291:  rs1:x27(0xf7ffffffffffffff), rs2:x28(0x0), result Branch=0
    li x3, 0xcccc
    li x27, 0xf7ffffffffffffff
    li x28, 0x0
    bge x27, x28, 2f
    li x3, 0x123ab
2: 
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 292:  rs1:x28(0xefffffffffffffff), rs2:x29(0x0), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x3, 0xcccc
    li x28, 0xefffffffffffffff
    li x29, 0x0
    bge x28, x29, 2b
    li x3, 0x123ab
4:
    sd x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 293:  rs1:x29(0xdfffffffffffffff), rs2:x30(0x0), result Branch=0
    li x3, 0xcccc
    li x29, 0xdfffffffffffffff
    li x30, 0x0
    bge x29, x30, 4f
    li x3, 0x123ab
4: 
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)

     # Testcase 294:  rs1:x30(0xbfffffffffffffff), rs2:x31(0x0), result Branch=0
    li x3, 0xcccc
    li x30, 0xbfffffffffffffff
    li x31, 0x0
    bge x30, x31, 5f
    li x3, 0x123ab
5: 
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x123ab)



    

    RVTEST_SIGBASE(x2,signature_60_0)
    
     # Testcase 295:  rs1:x31(0x7fffffffffffffff), rs2:x1(0x0), result Branch=1
    li x4, 0xcccc
    li x31, 0x7fffffffffffffff
    li x1, 0x0
    bge x31, x1, 1f
    li x4, 0x123ab
1: 
    sd x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 296:  rs1:x22(0xe855a90ddbee5e94), rs2:x22(0x4e19ce2a982bc336), result Branch=1
    li x4, 0xcccc
    li x22, 0xe855a90ddbee5e94
    li x22, 0x4e19ce2a982bc336
    bge x22, x22, 2f
    li x4, 0x123ab
2: 
    sd x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

     # Testcase 297:  rs1:x0(0x2d16ccc963b91dcd), rs2:x13(0x41a04fab04b11e73), result Branch=0
    jal x0, 3f
2:
    jal x0, 4f
3:
     
    li x4, 0xcccc
    li x0, 0x2d16ccc963b91dcd
    li x13, 0x41a04fab04b11e73
    bge x0, x13, 2b
    li x4, 0x123ab
4:
    sd x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x123ab)

     # Testcase 298:  rs1:x7(0x5ebb29d895a74545), rs2:x0(0x5a5bb7368b4ecba8), result Branch=1
    li x4, 0xcccc
    li x7, 0x5ebb29d895a74545
    li x0, 0x5a5bb7368b4ecba8
    bge x7, x0, 4f
    li x4, 0x123ab
4: 
    sd x4, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcccc)

	
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

