// RISC-V Architectural Validation Test C-SW-01
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
// Description: Testing instruction 'c.sw'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.sw)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.sw)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0xf4bcf4a786569d27
    addi    x11, x1,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_1_res+0] = 0x0000000086569d27
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000086569d27)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0xb26566a091a8d5fd
    addi    x14, x1,8
    li     x2, MASK_XLEN(-20)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x12, 20(x14)
    # Check results:  mem[test_1_res+8] = 0x0000000091a8d5fd
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000091a8d5fd)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0xc3e260bde31ffa64
    addi    x10, x1,16
    li     x2, MASK_XLEN(-104)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x8, 104(x10)
    # Check results:  mem[test_1_res+16] = 0x00000000e31ffa64
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000e31ffa64)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0xa783d03f7ca660db
    addi    x11, x1,24
    li     x2, MASK_XLEN(-124)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x15, 124(x11)
    # Check results:  mem[test_1_res+24] = 0x000000007ca660db
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000007ca660db)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x807fe203fbba7ae7
    addi    x13, x1,32
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 124(x13)
    # Check results:  mem[test_1_res+32] = 0x00000000fbba7ae7
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fbba7ae7)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x413f2c6234b80fd4
    addi    x13, x1,0
    li     x2, MASK_XLEN(-80)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x12, 80(x13)
    # Check results:  mem[test_2_res+0] = 0x0000000034b80fd4
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000034b80fd4)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x701512f5681454c0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-72)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x9, 72(x11)
    # Check results:  mem[test_2_res+8] = 0x00000000681454c0
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000681454c0)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x91dd5ad6b2d3f1c5
    addi    x10, x1,16
    li     x2, MASK_XLEN(-56)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x15, 56(x10)
    # Check results:  mem[test_2_res+16] = 0x00000000b2d3f1c5
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000b2d3f1c5)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x589f2ccdd4983650
    addi    x9, x1,24
    li     x2, MASK_XLEN(-84)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x15, 84(x9)
    # Check results:  mem[test_2_res+24] = 0x00000000d4983650
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000d4983650)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x4d236af8c83b3c30
    addi    x9, x1,32
    li     x2, MASK_XLEN(-96)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x15, 96(x9)
    # Check results:  mem[test_2_res+32] = 0x00000000c83b3c30
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000c83b3c30)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x242b987862f6cb6d
    addi    x15, x1,0
    li     x2, MASK_XLEN(-28)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x13, 28(x15)
    # Check results:  mem[test_3_res+0] = 0x0000000062f6cb6d
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000062f6cb6d)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x353a85936075c1a2
    addi    x8, x1,8
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x14, 4(x8)
    # Check results:  mem[test_3_res+8] = 0x000000006075c1a2
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000006075c1a2)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0xc357b9259b327ba8
    addi    x8, x1,16
    li     x2, MASK_XLEN(-72)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 72(x8)
    # Check results:  mem[test_3_res+16] = 0x000000009b327ba8
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000009b327ba8)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0xdc3713a217a2fb1a
    addi    x15, x1,24
    li     x2, MASK_XLEN(-48)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x14, 48(x15)
    # Check results:  mem[test_3_res+24] = 0x0000000017a2fb1a
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000017a2fb1a)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x2ed729e0b5aeeeb5
    addi    x11, x1,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x14, 60(x11)
    # Check results:  mem[test_3_res+32] = 0x00000000b5aeeeb5
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000b5aeeeb5)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x825648e49b1a8042
    addi    x9, x1,0
    li     x2, MASK_XLEN(-24)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 24(x9)
    # Check results:  mem[test_4_res+0] = 0x000000009b1a8042
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000009b1a8042)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0xf4cc30bce0e9092c
    addi    x15, x1,8
    li     x2, MASK_XLEN(-72)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x13, 72(x15)
    # Check results:  mem[test_4_res+8] = 0x00000000e0e9092c
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000e0e9092c)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0xfe9b8abf4bfb003d
    addi    x15, x1,16
    li     x2, MASK_XLEN(-80)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x11, 80(x15)
    # Check results:  mem[test_4_res+16] = 0x000000004bfb003d
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000004bfb003d)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x8cc7e79093b06678
    addi    x13, x1,24
    li     x2, MASK_XLEN(-32)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 32(x13)
    # Check results:  mem[test_4_res+24] = 0x0000000093b06678
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000093b06678)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0xcaa4b80e169dbce8
    addi    x12, x1,32
    li     x2, MASK_XLEN(-72)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x11, 72(x12)
    # Check results:  mem[test_4_res+32] = 0x00000000169dbce8
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000169dbce8)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xfe96a9489fcbe57f
    addi    x9, x1,0
    li     x2, MASK_XLEN(-44)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x14, 44(x9)
    # Check results:  mem[test_5_res+0] = 0x000000009fcbe57f
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000009fcbe57f)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x8fe89d238bfcad15
    addi    x15, x1,8
    li     x2, MASK_XLEN(-36)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x12, 36(x15)
    # Check results:  mem[test_5_res+8] = 0x000000008bfcad15
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000008bfcad15)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0xe10f3f75ea35fe19
    addi    x10, x1,16
    li     x2, MASK_XLEN(-12)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x12, 12(x10)
    # Check results:  mem[test_5_res+16] = 0x00000000ea35fe19
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ea35fe19)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x103e65150be793b3
    addi    x13, x1,24
    li     x2, MASK_XLEN(-68)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 68(x13)
    # Check results:  mem[test_5_res+24] = 0x000000000be793b3
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000000be793b3)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0xbd562c1247c6f638
    addi    x9, x1,32
    li     x2, MASK_XLEN(-56)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x14, 56(x9)
    # Check results:  mem[test_5_res+32] = 0x0000000047c6f638
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000047c6f638)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x823f2c5e6b6a11c
    addi    x11, x1,0
    li     x2, MASK_XLEN(-84)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x15, 84(x11)
    # Check results:  mem[test_6_res+0] = 0x00000000e6b6a11c
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000e6b6a11c)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x92d1fb3e66652ebf
    addi    x13, x1,8
    li     x2, MASK_XLEN(-4)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x12, 4(x13)
    # Check results:  mem[test_6_res+8] = 0x0000000066652ebf
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000066652ebf)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x6a6a04cf69150191
    addi    x14, x1,16
    li     x2, MASK_XLEN(-52)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x9, 52(x14)
    # Check results:  mem[test_6_res+16] = 0x0000000069150191
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000069150191)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0xff3544a9353308fb
    addi    x9, x1,24
    li     x2, MASK_XLEN(-44)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 44(x9)
    # Check results:  mem[test_6_res+24] = 0x00000000353308fb
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000353308fb)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0xe855a90ddbee5e94
    addi    x14, x1,32
    li     x2, MASK_XLEN(-88)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x8, 88(x14)
    # Check results:  mem[test_6_res+32] = 0x00000000dbee5e94
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000dbee5e94)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x7fffffffffffffff
    addi    x8, x1,0
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x11, 124(x8)
    # Check results:  mem[test_7_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x8000000000000000
    addi    x12, x1,8
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x11, 124(x12)
    # Check results:  mem[test_7_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0xffffffffffffffff
    addi    x15, x1,16
    li     x2, MASK_XLEN(-4)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x14, 4(x15)
    # Check results:  mem[test_7_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffffff
    addi    x11, x1,24
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x13, 0(x11)
    # Check results:  mem[test_7_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0xffffffffffffffff
    addi    x15, x1,32
    li     x2, MASK_XLEN(-124)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 124(x15)
    # Check results:  mem[test_7_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x1
    addi    x8, x1,0
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x12, 124(x8)
    # Check results:  mem[test_8_res+0] = 0x0000000000000001
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000001)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x10, 0(x15)
    # Check results:  mem[test_8_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffffff
    addi    x8, x1,16
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x13, 124(x8)
    # Check results:  mem[test_8_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x7fffffffffffffff
    addi    x13, x1,24
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x11, 124(x13)
    # Check results:  mem[test_8_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x8000000000000000
    addi    x13, x1,32
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 124(x13)
    # Check results:  mem[test_8_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffffffffe
    addi    x8, x1,0
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 4(x8)
    # Check results:  mem[test_9_res+0] = 0x00000000fffffffe
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffffe)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x7fffffffffffffff
    addi    x9, x1,8
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 8(x9)
    # Check results:  mem[test_9_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0xbfffffffffffffff
    addi    x10, x1,16
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 16(x10)
    # Check results:  mem[test_9_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0xdfffffffffffffff
    addi    x11, x1,24
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 32(x11)
    # Check results:  mem[test_9_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0xefffffffffffffff
    addi    x12, x1,32
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 64(x12)
    # Check results:  mem[test_9_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xf7ffffffffffffff
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_10_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0xfbffffffffffffff
    addi    x14, x1,8
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_10_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0xfdffffffffffffff
    addi    x15, x1,16
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_10_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0xfeffffffffffffff
    addi    x8, x1,24
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_10_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0xff7fffffffffffff
    addi    x9, x1,32
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_10_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0xffbfffffffffffff
    addi    x10, x1,0
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_11_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0xffdfffffffffffff
    addi    x11, x1,8
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_11_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0xffefffffffffffff
    addi    x12, x1,16
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_11_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0xfff7ffffffffffff
    addi    x13, x1,24
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_11_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0xfffbffffffffffff
    addi    x14, x1,32
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_11_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0xfffdffffffffffff
    addi    x15, x1,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_12_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0xfffeffffffffffff
    addi    x8, x1,8
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_12_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0xffff7fffffffffff
    addi    x9, x1,16
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_12_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0xffffbfffffffffff
    addi    x10, x1,24
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_12_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0xffffdfffffffffff
    addi    x11, x1,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_12_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0xffffefffffffffff
    addi    x12, x1,0
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_13_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0xfffff7ffffffffff
    addi    x13, x1,8
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_13_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0xfffffbffffffffff
    addi    x14, x1,16
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_13_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0xfffffdffffffffff
    addi    x15, x1,24
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_13_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0xfffffeffffffffff
    addi    x8, x1,32
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_13_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0xffffff7fffffffff
    addi    x9, x1,0
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_14_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0xffffffbfffffffff
    addi    x10, x1,8
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_14_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0xffffffdfffffffff
    addi    x11, x1,16
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_14_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0xffffffefffffffff
    addi    x12, x1,24
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_14_res+24] = 0x00000000ffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0xfffffff7ffffffff
    addi    x13, x1,32
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_14_res+32] = 0x00000000ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)





    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffbffffffff
    addi    x14, x1,0
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_15_res+0] = 0x00000000ffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffdffffffff
    addi    x15, x1,8
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_15_res+8] = 0x00000000ffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffeffffffff
    addi    x8, x1,16
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_15_res+16] = 0x00000000ffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0xffffffff7fffffff
    addi    x9, x1,24
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_15_res+24] = 0x000000007fffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x000000007fffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0xffffffffbfffffff
    addi    x10, x1,32
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_15_res+32] = 0x00000000bfffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000bfffffff)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0xffffffffdfffffff
    addi    x11, x1,0
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_16_res+0] = 0x00000000dfffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000dfffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffefffffff
    addi    x12, x1,8
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_16_res+8] = 0x00000000efffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000efffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0xfffffffff7ffffff
    addi    x13, x1,16
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_16_res+16] = 0x00000000f7ffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000f7ffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffffbffffff
    addi    x14, x1,24
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_16_res+24] = 0x00000000fbffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fbffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffffdffffff
    addi    x15, x1,32
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_16_res+32] = 0x00000000fdffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fdffffff)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffeffffff
    addi    x8, x1,0
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_17_res+0] = 0x00000000feffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000feffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0xffffffffff7fffff
    addi    x9, x1,8
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_17_res+8] = 0x00000000ff7fffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ff7fffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0xffffffffffbfffff
    addi    x10, x1,16
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_17_res+16] = 0x00000000ffbfffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffbfffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0xffffffffffdfffff
    addi    x11, x1,24
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_17_res+24] = 0x00000000ffdfffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffdfffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffefffff
    addi    x12, x1,32
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_17_res+32] = 0x00000000ffefffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffefffff)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xfffffffffff7ffff
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_18_res+0] = 0x00000000fff7ffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fff7ffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffffffbffff
    addi    x14, x1,8
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_18_res+8] = 0x00000000fffbffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffbffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffffffdffff
    addi    x15, x1,16
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_18_res+16] = 0x00000000fffdffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffdffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffffeffff
    addi    x8, x1,24
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_18_res+24] = 0x00000000fffeffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffeffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0xffffffffffff7fff
    addi    x9, x1,32
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_18_res+32] = 0x00000000ffff7fff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffff7fff)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0xffffffffffffbfff
    addi    x10, x1,0
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_19_res+0] = 0x00000000ffffbfff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffbfff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0xffffffffffffdfff
    addi    x11, x1,8
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_19_res+8] = 0x00000000ffffdfff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffdfff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffefff
    addi    x12, x1,16
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_19_res+16] = 0x00000000ffffefff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffefff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0xfffffffffffff7ff
    addi    x13, x1,24
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_19_res+24] = 0x00000000fffff7ff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffff7ff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffffffffbff
    addi    x14, x1,32
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_19_res+32] = 0x00000000fffffbff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffbff)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffffffffdff
    addi    x15, x1,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_20_res+0] = 0x00000000fffffdff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffdff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffffffeff
    addi    x8, x1,8
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_20_res+8] = 0x00000000fffffeff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffeff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0xffffffffffffff7f
    addi    x9, x1,16
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_20_res+16] = 0x00000000ffffff7f
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffff7f)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0xffffffffffffffbf
    addi    x10, x1,24
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_20_res+24] = 0x00000000ffffffbf
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffbf)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0xffffffffffffffdf
    addi    x11, x1,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_20_res+32] = 0x00000000ffffffdf
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffdf)





    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffffef
    addi    x12, x1,0
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_21_res+0] = 0x00000000ffffffef
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000ffffffef)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0xfffffffffffffff7
    addi    x13, x1,8
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_21_res+8] = 0x00000000fffffff7
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffff7)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffffffffffb
    addi    x14, x1,16
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_21_res+16] = 0x00000000fffffffb
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffffb)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffffffffffd
    addi    x15, x1,24
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_21_res+24] = 0x00000000fffffffd
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffffd)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffffffffe
    addi    x8, x1,32
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_21_res+32] = 0x00000000fffffffe
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000fffffffe)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x8000000000000000
    addi    x9, x1,0
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_22_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x4000000000000000
    addi    x10, x1,8
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_22_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x2000000000000000
    addi    x11, x1,16
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_22_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x1000000000000000
    addi    x12, x1,24
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_22_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x800000000000000
    addi    x13, x1,32
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_22_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x400000000000000
    addi    x14, x1,0
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_23_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x200000000000000
    addi    x15, x1,8
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_23_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x100000000000000
    addi    x8, x1,16
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_23_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x80000000000000
    addi    x9, x1,24
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_23_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x40000000000000
    addi    x10, x1,32
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_23_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x20000000000000
    addi    x11, x1,0
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_24_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x10000000000000
    addi    x12, x1,8
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_24_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x8000000000000
    addi    x13, x1,16
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_24_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x4000000000000
    addi    x14, x1,24
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_24_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x2000000000000
    addi    x15, x1,32
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_24_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x1000000000000
    addi    x8, x1,0
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_25_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x800000000000
    addi    x9, x1,8
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_25_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x400000000000
    addi    x10, x1,16
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_25_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x200000000000
    addi    x11, x1,24
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_25_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x100000000000
    addi    x12, x1,32
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_25_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x80000000000
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_26_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x40000000000
    addi    x14, x1,8
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_26_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x20000000000
    addi    x15, x1,16
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_26_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x10000000000
    addi    x8, x1,24
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_26_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x8000000000
    addi    x9, x1,32
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_26_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x4000000000
    addi    x10, x1,0
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_27_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x2000000000
    addi    x11, x1,8
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_27_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x1000000000
    addi    x12, x1,16
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_27_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x800000000
    addi    x13, x1,24
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_27_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x400000000
    addi    x14, x1,32
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_27_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x200000000
    addi    x15, x1,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_28_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x100000000
    addi    x8, x1,8
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_28_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x80000000
    addi    x9, x1,16
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_28_res+16] = 0x0000000080000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000080000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x40000000
    addi    x10, x1,24
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_28_res+24] = 0x0000000040000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000040000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x20000000
    addi    x11, x1,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_28_res+32] = 0x0000000020000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000020000000)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x10000000
    addi    x12, x1,0
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_29_res+0] = 0x0000000010000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000010000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x8000000
    addi    x13, x1,8
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_29_res+8] = 0x0000000008000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000008000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x4000000
    addi    x14, x1,16
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_29_res+16] = 0x0000000004000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000004000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x2000000
    addi    x15, x1,24
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_29_res+24] = 0x0000000002000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000002000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x1000000
    addi    x8, x1,32
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_29_res+32] = 0x0000000001000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000001000000)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x800000
    addi    x9, x1,0
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_30_res+0] = 0x0000000000800000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000800000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x400000
    addi    x10, x1,8
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_30_res+8] = 0x0000000000400000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000400000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x200000
    addi    x11, x1,16
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_30_res+16] = 0x0000000000200000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000200000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x100000
    addi    x12, x1,24
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_30_res+24] = 0x0000000000100000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000100000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x80000
    addi    x13, x1,32
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_30_res+32] = 0x0000000000080000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000080000)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x40000
    addi    x14, x1,0
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_31_res+0] = 0x0000000000040000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000040000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x20000
    addi    x15, x1,8
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_31_res+8] = 0x0000000000020000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000020000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x10000
    addi    x8, x1,16
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_31_res+16] = 0x0000000000010000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000010000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x8000
    addi    x9, x1,24
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_31_res+24] = 0x0000000000008000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000008000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x4000
    addi    x10, x1,32
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_31_res+32] = 0x0000000000004000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000004000)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x2000
    addi    x11, x1,0
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_32_res+0] = 0x0000000000002000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000002000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x1000
    addi    x12, x1,8
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_32_res+8] = 0x0000000000001000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000001000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x800
    addi    x13, x1,16
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_32_res+16] = 0x0000000000000800
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000800)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x400
    addi    x14, x1,24
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_32_res+24] = 0x0000000000000400
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000400)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x200
    addi    x15, x1,32
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_32_res+32] = 0x0000000000000200
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000200)





    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x100
    addi    x8, x1,0
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_33_res+0] = 0x0000000000000100
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000100)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x80
    addi    x9, x1,8
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_33_res+8] = 0x0000000000000080
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000080)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x40
    addi    x10, x1,16
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_33_res+16] = 0x0000000000000040
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000040)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x20
    addi    x11, x1,24
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_33_res+24] = 0x0000000000000020
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000020)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x10
    addi    x12, x1,32
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_33_res+32] = 0x0000000000000010
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000010)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x8
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_34_res+0] = 0x0000000000000008
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000008)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x4
    addi    x14, x1,8
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_34_res+8] = 0x0000000000000004
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000004)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x2
    addi    x15, x1,16
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_34_res+16] = 0x0000000000000002
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000002)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,24
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 4(x8)
    # Check results:  mem[test_34_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,32
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 8(x9)
    # Check results:  mem[test_34_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 16(x10)
    # Check results:  mem[test_35_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 32(x11)
    # Check results:  mem[test_35_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 64(x12)
    # Check results:  mem[test_35_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,24
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_35_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,32
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_35_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_36_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_36_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,16
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_36_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,24
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_36_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,32
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_36_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,0
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_37_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_37_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,16
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_37_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,24
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_37_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,32
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_37_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_38_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_38_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_38_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,24
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_38_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,32
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_38_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_39_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_39_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_39_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,24
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_39_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,32
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_39_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_40_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,8
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_40_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_40_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,24
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_40_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,32
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_40_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_41_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,8
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_41_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,16
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_41_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,24
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_41_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,32
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_41_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,0
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_42_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,8
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_42_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,16
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_42_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,24
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_42_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,32
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_42_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_43_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_43_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_43_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,24
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_43_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,32
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_43_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_44_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_44_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,16
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_44_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,24
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_44_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,32
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_44_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,0
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_45_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_45_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,16
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_45_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,24
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_45_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,32
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_45_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_46_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_46_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_46_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,24
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_46_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,32
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_46_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_47_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_47_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_47_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,24
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_47_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,32
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_47_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_48_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,8
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_48_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_48_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,24
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_48_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,32
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_48_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_49_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,8
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_49_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,16
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_49_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,24
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_49_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,32
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_49_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,0
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_50_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,8
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_50_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,16
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_50_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,24
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_50_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,32
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_50_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_51_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_51_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_51_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,24
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_51_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,32
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_51_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_52_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_52_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,16
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_52_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,24
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_52_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,32
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_52_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,0
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_53_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_53_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,16
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_53_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,24
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_53_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,32
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_53_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_54_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_54_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_54_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,24
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_54_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,32
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_54_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_55_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_55_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_55_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,24
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_55_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,32
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_55_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_56_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,8
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_56_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_56_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,24
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_56_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,32
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_56_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_57_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,8
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_57_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,16
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_57_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,24
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_57_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,32
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_57_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,0
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_58_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,8
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_58_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,16
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_58_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,24
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_58_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,32
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_58_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_59_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_59_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_59_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,24
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_59_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,32
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_59_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)





    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_60_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)


	
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

