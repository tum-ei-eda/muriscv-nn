// RISC-V Architectural Validation Test C-SDSP-01
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
// Description: Testing instruction 'c.sdsp'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.sdsp)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.sdsp)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x19, 0xf4bcf4a786569d27
    addi    x2, x1,0
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x19, 232(x2)
    # Check results:  mem[test_1_res+0] = 0xf4bcf4a786569d27
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf4bcf4a786569d27)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x28, 0xb26566a091a8d5fd
    addi    x2, x1,8
    li     x3, MASK_XLEN(-40)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x28, 40(x2)
    # Check results:  mem[test_1_res+8] = 0xb26566a091a8d5fd
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb26566a091a8d5fd)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x30, 0xc3e260bde31ffa64
    addi    x2, x1,16
    li     x3, MASK_XLEN(-208)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x30, 208(x2)
    # Check results:  mem[test_1_res+16] = 0xc3e260bde31ffa64
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3e260bde31ffa64)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x20, 0xa783d03f7ca660db
    addi    x2, x1,24
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x20, 248(x2)
    # Check results:  mem[test_1_res+24] = 0xa783d03f7ca660db
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa783d03f7ca660db)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x807fe203fbba7ae7
    addi    x2, x1,32
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x10, 248(x2)
    # Check results:  mem[test_1_res+32] = 0x807fe203fbba7ae7
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x807fe203fbba7ae7)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x0, 0x413f2c6234b80fd4
    addi    x2, x1,0
    li     x4, MASK_XLEN(-160)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x0, 160(x2)
    # Check results:  mem[test_2_res+0] = 0
    ld x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x3, 0x701512f5681454c0
    addi    x2, x1,8
    li     x4, MASK_XLEN(-144)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x3, 144(x2)
    # Check results:  mem[test_2_res+8] = 0x701512f5681454c0
    ld x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x701512f5681454c0)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x31, 0x91dd5ad6b2d3f1c5
    addi    x2, x1,16
    li     x4, MASK_XLEN(-112)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x31, 112(x2)
    # Check results:  mem[test_2_res+16] = 0x91dd5ad6b2d3f1c5
    ld x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x91dd5ad6b2d3f1c5)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x29, 0x589f2ccdd4983650
    addi    x2, x1,24
    li     x4, MASK_XLEN(-168)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x29, 168(x2)
    # Check results:  mem[test_2_res+24] = 0x589f2ccdd4983650
    ld x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x589f2ccdd4983650)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x5, 0x4d236af8c83b3c30
    addi    x2, x1,32
    li     x4, MASK_XLEN(-192)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x5, 192(x2)
    # Check results:  mem[test_2_res+32] = 0x4d236af8c83b3c30
    ld x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x4d236af8c83b3c30)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x0, 0x242b987862f6cb6d
    addi    x2, x1,0
    li     x3, MASK_XLEN(-56)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x0, 56(x2)
    # Check results:  mem[test_3_res+0] = 0
    ld x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x353a85936075c1a2
    addi    x2, x1,8
    li     x3, MASK_XLEN(-8)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x13, 8(x2)
    # Check results:  mem[test_3_res+8] = 0x353a85936075c1a2
    ld x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x353a85936075c1a2)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x4, 0xc357b9259b327ba8
    addi    x2, x1,16
    li     x3, MASK_XLEN(-144)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x4, 144(x2)
    # Check results:  mem[test_3_res+16] = 0xc357b9259b327ba8
    ld x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xc357b9259b327ba8)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0xdc3713a217a2fb1a
    addi    x2, x1,24
    li     x3, MASK_XLEN(-96)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x11, 96(x2)
    # Check results:  mem[test_3_res+24] = 0xdc3713a217a2fb1a
    ld x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xdc3713a217a2fb1a)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x25, 0x2ed729e0b5aeeeb5
    addi    x2, x1,32
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x25, 120(x2)
    # Check results:  mem[test_3_res+32] = 0x2ed729e0b5aeeeb5
    ld x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x2ed729e0b5aeeeb5)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x18, 0x825648e49b1a8042
    addi    x2, x1,0
    li     x3, MASK_XLEN(-48)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x18, 48(x2)
    # Check results:  mem[test_4_res+0] = 0x825648e49b1a8042
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x825648e49b1a8042)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x18, 0xf4cc30bce0e9092c
    addi    x2, x1,8
    li     x3, MASK_XLEN(-144)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x18, 144(x2)
    # Check results:  mem[test_4_res+8] = 0xf4cc30bce0e9092c
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf4cc30bce0e9092c)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x7, 0xfe9b8abf4bfb003d
    addi    x2, x1,16
    li     x3, MASK_XLEN(-160)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x7, 160(x2)
    # Check results:  mem[test_4_res+16] = 0xfe9b8abf4bfb003d
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfe9b8abf4bfb003d)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x8cc7e79093b06678
    addi    x2, x1,24
    li     x3, MASK_XLEN(-64)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x9, 64(x2)
    # Check results:  mem[test_4_res+24] = 0x8cc7e79093b06678
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8cc7e79093b06678)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x31, 0xcaa4b80e169dbce8
    addi    x2, x1,32
    li     x3, MASK_XLEN(-144)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x31, 144(x2)
    # Check results:  mem[test_4_res+32] = 0xcaa4b80e169dbce8
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcaa4b80e169dbce8)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x17, 0xfe96a9489fcbe57f
    addi    x2, x1,0
    li     x3, MASK_XLEN(-88)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x17, 88(x2)
    # Check results:  mem[test_5_res+0] = 0xfe96a9489fcbe57f
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfe96a9489fcbe57f)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x23, 0x8fe89d238bfcad15
    addi    x2, x1,8
    li     x3, MASK_XLEN(-72)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x23, 72(x2)
    # Check results:  mem[test_5_res+8] = 0x8fe89d238bfcad15
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8fe89d238bfcad15)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x31, 0xe10f3f75ea35fe19
    addi    x2, x1,16
    li     x3, MASK_XLEN(-24)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x31, 24(x2)
    # Check results:  mem[test_5_res+16] = 0xe10f3f75ea35fe19
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe10f3f75ea35fe19)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x21, 0x103e65150be793b3
    addi    x2, x1,24
    li     x3, MASK_XLEN(-136)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x21, 136(x2)
    # Check results:  mem[test_5_res+24] = 0x103e65150be793b3
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x103e65150be793b3)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x0, 0xbd562c1247c6f638
    addi    x2, x1,32
    li     x3, MASK_XLEN(-112)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x0, 112(x2)
    # Check results:  mem[test_5_res+32] = 0
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x30, 0x823f2c5e6b6a11c
    addi    x2, x1,0
    li     x3, MASK_XLEN(-168)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x30, 168(x2)
    # Check results:  mem[test_6_res+0] = 0x0823f2c5e6b6a11c
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0823f2c5e6b6a11c)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x0, 0x92d1fb3e66652ebf
    addi    x2, x1,8
    li     x3, MASK_XLEN(-8)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x0, 8(x2)
    # Check results:  mem[test_6_res+8] = 0
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x17, 0x6a6a04cf69150191
    addi    x2, x1,16
    li     x3, MASK_XLEN(-104)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x17, 104(x2)
    # Check results:  mem[test_6_res+16] = 0x6a6a04cf69150191
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6a6a04cf69150191)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x31, 0xff3544a9353308fb
    addi    x2, x1,24
    li     x3, MASK_XLEN(-88)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x31, 88(x2)
    # Check results:  mem[test_6_res+24] = 0xff3544a9353308fb
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff3544a9353308fb)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x6, 0xe855a90ddbee5e94
    addi    x2, x1,32
    li     x3, MASK_XLEN(-176)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x6, 176(x2)
    # Check results:  mem[test_6_res+32] = 0xe855a90ddbee5e94
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe855a90ddbee5e94)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x7fffffffffffffff
    addi    x2, x1,0
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x11, 248(x2)
    # Check results:  mem[test_7_res+0] = 0x7fffffffffffffff
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x22, 0x8000000000000000
    addi    x2, x1,8
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x22, 248(x2)
    # Check results:  mem[test_7_res+8] = 0x8000000000000000
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0xffffffffffffffff
    addi    x2, x1,16
    li     x3, MASK_XLEN(-8)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x9, 8(x2)
    # Check results:  mem[test_7_res+16] = 0xffffffffffffffff
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x7, 0xffffffffffffffff
    addi    x2, x1,24
    li     x3, MASK_XLEN(0)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x7, 0(x2)
    # Check results:  mem[test_7_res+24] = 0xffffffffffffffff
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffffff
    addi    x2, x1,32
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    # Test Instruction 
    c.sdsp      x13, 248(x2)
    # Check results:  mem[test_7_res+32] = 0xffffffffffffffff
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x7, 0x1
    addi    x2, x1,0
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x7, 248(x2)
    # Check results:  mem[test_8_res+0] = 0x0000000000000001
    ld x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000001)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x3, 0x0
    addi    x2, x1,8
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x3, 0(x2)
    # Check results:  mem[test_8_res+8] = 0x0000000000000000
    ld x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffffffff
    addi    x2, x1,16
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x13, 248(x2)
    # Check results:  mem[test_8_res+16] = 0xffffffffffffffff
    ld x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x24, 0x7fffffffffffffff
    addi    x2, x1,24
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x24, 248(x2)
    # Check results:  mem[test_8_res+24] = 0x7fffffffffffffff
    ld x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x8000000000000000
    addi    x2, x1,32
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x12, 248(x2)
    # Check results:  mem[test_8_res+32] = 0x8000000000000000
    ld x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x8000000000000000)





    

    RVTEST_SIGBASE(x3,signature_9_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffffe
    addi    x2, x3,0
    li     x4, MASK_XLEN(-8)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 8(x2)
    # Check results:  mem[test_9_res+0] = 0xfffffffffffffffe
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffffe)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x7fffffffffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-16)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 16(x2)
    # Check results:  mem[test_9_res+8] = 0x7fffffffffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xbfffffffffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-32)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 32(x2)
    # Check results:  mem[test_9_res+16] = 0xbfffffffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xbfffffffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xdfffffffffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-64)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 64(x2)
    # Check results:  mem[test_9_res+24] = 0xdfffffffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xdfffffffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xefffffffffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-128)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 128(x2)
    # Check results:  mem[test_9_res+32] = 0xefffffffffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xefffffffffffffff)





    

    RVTEST_SIGBASE(x3,signature_10_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xf7ffffffffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_10_res+0] = 0xf7ffffffffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xf7ffffffffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfbffffffffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_10_res+8] = 0xfbffffffffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfbffffffffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfdffffffffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_10_res+16] = 0xfdffffffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfdffffffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfeffffffffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_10_res+24] = 0xfeffffffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfeffffffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xff7fffffffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_10_res+32] = 0xff7fffffffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xff7fffffffffffff)





    

    RVTEST_SIGBASE(x3,signature_11_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffbfffffffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_11_res+0] = 0xffbfffffffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffbfffffffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xffdfffffffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_11_res+8] = 0xffdfffffffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffdfffffffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffefffffffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_11_res+16] = 0xffefffffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffefffffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfff7ffffffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_11_res+24] = 0xfff7ffffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfff7ffffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffbffffffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_11_res+32] = 0xfffbffffffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffbffffffffffff)





    

    RVTEST_SIGBASE(x3,signature_12_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffdffffffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_12_res+0] = 0xfffdffffffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffdffffffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffeffffffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_12_res+8] = 0xfffeffffffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffeffffffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffff7fffffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_12_res+16] = 0xffff7fffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffff7fffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xffffbfffffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_12_res+24] = 0xffffbfffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffbfffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xffffdfffffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_12_res+32] = 0xffffdfffffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffdfffffffffff)





    

    RVTEST_SIGBASE(x3,signature_13_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffffefffffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_13_res+0] = 0xffffefffffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffefffffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffff7ffffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_13_res+8] = 0xfffff7ffffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffff7ffffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfffffbffffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_13_res+16] = 0xfffffbffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffbffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfffffdffffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_13_res+24] = 0xfffffdffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffdffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffffeffffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_13_res+32] = 0xfffffeffffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffeffffffffff)





    

    RVTEST_SIGBASE(x3,signature_14_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffffff7fffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_14_res+0] = 0xffffff7fffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffff7fffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xffffffbfffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_14_res+8] = 0xffffffbfffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffbfffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffffffdfffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_14_res+16] = 0xffffffdfffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffdfffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xffffffefffffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_14_res+24] = 0xffffffefffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffefffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffffff7ffffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_14_res+32] = 0xfffffff7ffffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffff7ffffffff)





    

    RVTEST_SIGBASE(x3,signature_15_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffbffffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_15_res+0] = 0xfffffffbffffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffbffffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffdffffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_15_res+8] = 0xfffffffdffffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffdffffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffeffffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_15_res+16] = 0xfffffffeffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffeffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xffffffff7fffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_15_res+24] = 0xffffffff7fffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffff7fffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffbfffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_15_res+32] = 0xffffffffbfffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffbfffffff)





    

    RVTEST_SIGBASE(x3,signature_16_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffdfffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_16_res+0] = 0xffffffffdfffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffdfffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffefffffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_16_res+8] = 0xffffffffefffffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffefffffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffff7ffffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_16_res+16] = 0xfffffffff7ffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffff7ffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffbffffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_16_res+24] = 0xfffffffffbffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffbffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffdffffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_16_res+32] = 0xfffffffffdffffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffdffffff)





    

    RVTEST_SIGBASE(x3,signature_17_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffeffffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_17_res+0] = 0xfffffffffeffffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffeffffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffff7fffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_17_res+8] = 0xffffffffff7fffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffff7fffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffbfffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_17_res+16] = 0xffffffffffbfffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffbfffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffdfffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_17_res+24] = 0xffffffffffdfffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffdfffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffefffff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_17_res+32] = 0xffffffffffefffff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffefffff)





    

    RVTEST_SIGBASE(x3,signature_18_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffff7ffff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_18_res+0] = 0xfffffffffff7ffff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffff7ffff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffbffff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_18_res+8] = 0xfffffffffffbffff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffbffff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffdffff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_18_res+16] = 0xfffffffffffdffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffdffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffeffff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_18_res+24] = 0xfffffffffffeffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffeffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffff7fff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_18_res+32] = 0xffffffffffff7fff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffff7fff)





    

    RVTEST_SIGBASE(x3,signature_19_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffbfff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_19_res+0] = 0xffffffffffffbfff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffbfff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffdfff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_19_res+8] = 0xffffffffffffdfff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffdfff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffefff
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_19_res+16] = 0xffffffffffffefff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffefff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffff7ff
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_19_res+24] = 0xfffffffffffff7ff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffff7ff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffbff
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_19_res+32] = 0xfffffffffffffbff
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffbff)





    

    RVTEST_SIGBASE(x3,signature_20_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffdff
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_20_res+0] = 0xfffffffffffffdff
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffdff)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffeff
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_20_res+8] = 0xfffffffffffffeff
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffeff)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffff7f
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_20_res+16] = 0xffffffffffffff7f
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffff7f)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffffbf
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_20_res+24] = 0xffffffffffffffbf
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffbf)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffffdf
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_20_res+32] = 0xffffffffffffffdf
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffdf)





    

    RVTEST_SIGBASE(x3,signature_21_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0xffffffffffffffef
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_21_res+0] = 0xffffffffffffffef
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffef)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffff7
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_21_res+8] = 0xfffffffffffffff7
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffff7)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffffb
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_21_res+16] = 0xfffffffffffffffb
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffffb)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffffd
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_21_res+24] = 0xfffffffffffffffd
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffffd)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffffe
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_21_res+32] = 0xfffffffffffffffe
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffffe)





    

    RVTEST_SIGBASE(x3,signature_22_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x8000000000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_22_res+0] = 0x8000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x8000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x4000000000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_22_res+8] = 0x4000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x4000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x2000000000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_22_res+16] = 0x2000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x2000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x1000000000000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_22_res+24] = 0x1000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x1000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x800000000000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_22_res+32] = 0x0800000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0800000000000000)





    

    RVTEST_SIGBASE(x3,signature_23_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x400000000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_23_res+0] = 0x0400000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0400000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x200000000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_23_res+8] = 0x0200000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0200000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x100000000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_23_res+16] = 0x0100000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0100000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x80000000000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_23_res+24] = 0x0080000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0080000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x40000000000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_23_res+32] = 0x0040000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0040000000000000)





    

    RVTEST_SIGBASE(x3,signature_24_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x20000000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_24_res+0] = 0x0020000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0020000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x10000000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_24_res+8] = 0x0010000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0010000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x8000000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_24_res+16] = 0x0008000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0008000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x4000000000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_24_res+24] = 0x0004000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0004000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x2000000000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_24_res+32] = 0x0002000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0002000000000000)





    

    RVTEST_SIGBASE(x3,signature_25_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x1000000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_25_res+0] = 0x0001000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0001000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x800000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_25_res+8] = 0x0000800000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000800000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x400000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_25_res+16] = 0x0000400000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000400000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x200000000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_25_res+24] = 0x0000200000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000200000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x100000000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_25_res+32] = 0x0000100000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000100000000000)





    

    RVTEST_SIGBASE(x3,signature_26_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x80000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_26_res+0] = 0x0000080000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000080000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x40000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_26_res+8] = 0x0000040000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000040000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x20000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_26_res+16] = 0x0000020000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000020000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x10000000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_26_res+24] = 0x0000010000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000010000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x8000000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_26_res+32] = 0x0000008000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000008000000000)





    

    RVTEST_SIGBASE(x3,signature_27_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x4000000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_27_res+0] = 0x0000004000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000004000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x2000000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_27_res+8] = 0x0000002000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000002000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x1000000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_27_res+16] = 0x0000001000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000001000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x800000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_27_res+24] = 0x0000000800000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000800000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x400000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_27_res+32] = 0x0000000400000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000400000000)





    

    RVTEST_SIGBASE(x3,signature_28_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x200000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_28_res+0] = 0x0000000200000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000200000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x100000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_28_res+8] = 0x0000000100000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000100000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x80000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_28_res+16] = 0x0000000080000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000080000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x40000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_28_res+24] = 0x0000000040000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000040000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x20000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_28_res+32] = 0x0000000020000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000020000000)





    

    RVTEST_SIGBASE(x3,signature_29_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x10000000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_29_res+0] = 0x0000000010000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000010000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x8000000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_29_res+8] = 0x0000000008000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000008000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x4000000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_29_res+16] = 0x0000000004000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000004000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x2000000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_29_res+24] = 0x0000000002000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000002000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x1000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_29_res+32] = 0x0000000001000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000001000000)





    

    RVTEST_SIGBASE(x3,signature_30_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x800000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_30_res+0] = 0x0000000000800000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000800000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x400000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_30_res+8] = 0x0000000000400000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000400000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x200000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_30_res+16] = 0x0000000000200000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000200000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x100000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_30_res+24] = 0x0000000000100000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000100000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x80000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_30_res+32] = 0x0000000000080000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000080000)





    

    RVTEST_SIGBASE(x3,signature_31_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x40000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_31_res+0] = 0x0000000000040000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000040000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x20000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_31_res+8] = 0x0000000000020000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000020000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x10000
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_31_res+16] = 0x0000000000010000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000010000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x8000
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_31_res+24] = 0x0000000000008000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000008000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x4000
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_31_res+32] = 0x0000000000004000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000004000)





    

    RVTEST_SIGBASE(x3,signature_32_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x2000
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_32_res+0] = 0x0000000000002000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000002000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x1000
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_32_res+8] = 0x0000000000001000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000001000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x800
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_32_res+16] = 0x0000000000000800
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000800)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x400
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_32_res+24] = 0x0000000000000400
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000400)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x200
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_32_res+32] = 0x0000000000000200
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000200)





    

    RVTEST_SIGBASE(x3,signature_33_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x100
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_33_res+0] = 0x0000000000000100
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000100)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x80
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_33_res+8] = 0x0000000000000080
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000080)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x40
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_33_res+16] = 0x0000000000000040
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000040)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x20
    addi    x2, x3,24
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_33_res+24] = 0x0000000000000020
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000020)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x10
    addi    x2, x3,32
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_33_res+32] = 0x0000000000000010
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000010)





    

    RVTEST_SIGBASE(x3,signature_34_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x8
    addi    x2, x3,0
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_34_res+0] = 0x0000000000000008
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000008)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x4
    addi    x2, x3,8
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_34_res+8] = 0x0000000000000004
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000004)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x2
    addi    x2, x3,16
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_34_res+16] = 0x0000000000000002
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000002)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-8)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 8(x2)
    # Check results:  mem[test_34_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-16)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 16(x2)
    # Check results:  mem[test_34_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_35_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-32)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 32(x2)
    # Check results:  mem[test_35_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-64)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 64(x2)
    # Check results:  mem[test_35_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-128)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 128(x2)
    # Check results:  mem[test_35_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_35_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_35_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_36_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_36_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_36_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_36_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_36_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_36_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_37_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_37_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_37_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_37_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_37_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_37_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_38_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_38_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_38_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_38_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_38_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_38_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_39_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_39_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_39_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_39_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_39_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_39_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_40_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_40_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_40_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_40_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_40_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_40_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_41_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_41_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_41_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_41_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_41_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_41_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_42_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_42_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_42_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_42_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_42_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_42_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_43_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_43_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_43_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_43_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_43_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_43_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_44_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_44_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_44_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_44_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_44_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_44_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_45_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_45_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_45_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_45_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_45_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_45_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_46_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_46_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_46_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_46_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_46_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_46_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_47_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_47_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_47_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_47_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_47_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_47_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_48_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_48_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_48_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_48_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_48_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_48_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_49_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_49_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_49_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_49_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_49_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_49_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_50_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_50_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_50_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_50_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_50_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_50_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_51_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_51_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_51_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_51_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_51_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_51_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_52_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_52_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_52_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_52_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_52_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_52_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_53_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_53_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_53_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_53_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_53_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_53_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_54_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_54_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_54_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_54_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_54_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_54_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_55_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_55_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_55_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_55_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_55_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_55_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_56_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_56_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_56_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_56_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_56_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_56_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_57_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_57_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_57_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_57_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_57_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_57_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_58_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_58_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_58_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_58_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_58_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_58_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_59_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_59_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,8
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 184(x2)
    # Check results:  mem[test_59_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,16
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 120(x2)
    # Check results:  mem[test_59_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,24
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 240(x2)
    # Check results:  mem[test_59_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 232(x2)
    # Check results:  mem[test_59_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)





    

    RVTEST_SIGBASE(x3,signature_60_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,0
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x1, 216(x2)
    # Check results:  mem[test_60_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x0, 0x5a5bb7368b4ecba8
    addi    x2, x3,8
    li     x4, MASK_XLEN(-40)
    add    x2, x2, x4
    # Test Instruction 
    c.sdsp      x0, 40(x2)
    # Check results:  mem[test_60_res+8] = 0
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0)


	
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

