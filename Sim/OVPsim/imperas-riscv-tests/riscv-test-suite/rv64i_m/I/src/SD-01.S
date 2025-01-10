// RISC-V Architectural Validation Test SD-01
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
// Description: Testing instruction 'SD'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",sd)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x28, 0xf4bcf4a786569d27
    addi    x20, x1,0
    li     x2, MASK_XLEN(451)
    add    x20, x20, x2
    # Test Instruction 
    sd      x28, -451(x20)
    # Check results:  mem[test_1_res+0] = 0xf4bcf4a786569d27
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xf4bcf4a786569d27)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x20, 0xb26566a091a8d5fd
    addi    x31, x1,8
    li     x2, MASK_XLEN(923)
    add    x31, x31, x2
    # Test Instruction 
    sd      x20, -923(x31)
    # Check results:  mem[test_1_res+8] = 0xb26566a091a8d5fd
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xb26566a091a8d5fd)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x0, 0xc3e260bde31ffa64
    addi    x11, x1,16
    li     x2, MASK_XLEN(710)
    add    x11, x11, x2
    # Test Instruction 
    sd      x0, -710(x11)
    # Check results:  mem[test_1_res+16] = 0
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x31, 0xa783d03f7ca660db
    addi    x4, x1,24
    li     x2, MASK_XLEN(1313)
    add    x4, x4, x2
    # Test Instruction 
    sd      x31, -1313(x4)
    # Check results:  mem[test_1_res+24] = 0xa783d03f7ca660db
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xa783d03f7ca660db)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x5, 0x807fe203fbba7ae7
    addi    x30, x1,32
    li     x2, MASK_XLEN(-703)
    add    x30, x30, x2
    # Test Instruction 
    sd      x5, 703(x30)
    # Check results:  mem[test_1_res+32] = 0x807fe203fbba7ae7
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x807fe203fbba7ae7)



    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x413f2c6234b80fd4
    addi    x2, x1,0
    li     x3, MASK_XLEN(12)
    add    x2, x2, x3
    # Test Instruction 
    sd      x13, -12(x2)
    # Check results:  mem[test_2_res+0] = 0x413f2c6234b80fd4
    ld x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x413f2c6234b80fd4)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x701512f5681454c0
    addi    x5, x1,8
    li     x3, MASK_XLEN(-1170)
    add    x5, x5, x3
    # Test Instruction 
    sd      x11, 1170(x5)
    # Check results:  mem[test_2_res+8] = 0x701512f5681454c0
    ld x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x701512f5681454c0)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x2, 0x91dd5ad6b2d3f1c5
    addi    x26, x1,16
    li     x3, MASK_XLEN(1618)
    add    x26, x26, x3
    # Test Instruction 
    sd      x2, -1618(x26)
    # Check results:  mem[test_2_res+16] = 0x91dd5ad6b2d3f1c5
    ld x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x91dd5ad6b2d3f1c5)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x18, 0x589f2ccdd4983650
    addi    x19, x1,24
    li     x3, MASK_XLEN(1835)
    add    x19, x19, x3
    # Test Instruction 
    sd      x18, -1835(x19)
    # Check results:  mem[test_2_res+24] = 0x589f2ccdd4983650
    ld x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x589f2ccdd4983650)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x4d236af8c83b3c30
    addi    x8, x1,32
    li     x3, MASK_XLEN(552)
    add    x8, x8, x3
    # Test Instruction 
    sd      x9, -552(x8)
    # Check results:  mem[test_2_res+32] = 0x4d236af8c83b3c30
    ld x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4d236af8c83b3c30)



    

    RVTEST_SIGBASE(x2,signature_3_0)

    # Clear memory
    sd      x0, 0(x2)
    # Load values and compute offsets
    li      x17, 0x242b987862f6cb6d
    addi    x1, x2,0
    li     x3, MASK_XLEN(-1927)
    add    x1, x1, x3
    # Test Instruction 
    sd      x17, 1927(x1)
    # Check results:  mem[test_3_res+0] = 0x242b987862f6cb6d
    ld x4, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x242b987862f6cb6d)

    # Clear memory
    sd      x0, 8(x2)
    # Load values and compute offsets
    li      x31, 0x353a85936075c1a2
    addi    x24, x2,8
    li     x3, MASK_XLEN(-1569)
    add    x24, x24, x3
    # Test Instruction 
    sd      x31, 1569(x24)
    # Check results:  mem[test_3_res+8] = 0x353a85936075c1a2
    ld x4, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353a85936075c1a2)

    # Clear memory
    sd      x0, 16(x2)
    # Load values and compute offsets
    li      x0, 0xc357b9259b327ba8
    addi    x22, x2,16
    li     x3, MASK_XLEN(942)
    add    x22, x22, x3
    # Test Instruction 
    sd      x0, -942(x22)
    # Check results:  mem[test_3_res+16] = 0
    ld x4, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0)

    # Clear memory
    sd      x0, 24(x2)
    # Load values and compute offsets
    li      x0, 0xdc3713a217a2fb1a
    addi    x31, x2,24
    li     x3, MASK_XLEN(628)
    add    x31, x31, x3
    # Test Instruction 
    sd      x0, -628(x31)
    # Check results:  mem[test_3_res+24] = 0
    ld x4, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0)

    # Clear memory
    sd      x0, 32(x2)
    # Load values and compute offsets
    li      x31, 0x2ed729e0b5aeeeb5
    addi    x18, x2,32
    li     x3, MASK_XLEN(-1167)
    add    x18, x18, x3
    # Test Instruction 
    sd      x31, 1167(x18)
    # Check results:  mem[test_3_res+32] = 0x2ed729e0b5aeeeb5
    ld x4, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2ed729e0b5aeeeb5)



    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x825648e49b1a8042
    addi    x7, x1,0
    li     x2, MASK_XLEN(-1670)
    add    x7, x7, x2
    # Test Instruction 
    sd      x11, 1670(x7)
    # Check results:  mem[test_4_res+0] = 0x825648e49b1a8042
    ld x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x825648e49b1a8042)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0xf4cc30bce0e9092c
    addi    x23, x1,8
    li     x2, MASK_XLEN(686)
    add    x23, x23, x2
    # Test Instruction 
    sd      x9, -686(x23)
    # Check results:  mem[test_4_res+8] = 0xf4cc30bce0e9092c
    ld x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xf4cc30bce0e9092c)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x7, 0xfe9b8abf4bfb003d
    addi    x3, x1,16
    li     x2, MASK_XLEN(-468)
    add    x3, x3, x2
    # Test Instruction 
    sd      x7, 468(x3)
    # Check results:  mem[test_4_res+16] = 0xfe9b8abf4bfb003d
    ld x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xfe9b8abf4bfb003d)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x7, 0x8cc7e79093b06678
    addi    x14, x1,24
    li     x2, MASK_XLEN(-1736)
    add    x14, x14, x2
    # Test Instruction 
    sd      x7, 1736(x14)
    # Check results:  mem[test_4_res+24] = 0x8cc7e79093b06678
    ld x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x8cc7e79093b06678)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0xcaa4b80e169dbce8
    addi    x4, x1,32
    li     x2, MASK_XLEN(-1330)
    add    x4, x4, x2
    # Test Instruction 
    sd      x13, 1330(x4)
    # Check results:  mem[test_4_res+32] = 0xcaa4b80e169dbce8
    ld x5, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xcaa4b80e169dbce8)



    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0xfe96a9489fcbe57f
    addi    x25, x1,0
    li     x2, MASK_XLEN(-1867)
    add    x25, x25, x2
    # Test Instruction 
    sd      x12, 1867(x25)
    # Check results:  mem[test_5_res+0] = 0xfe96a9489fcbe57f
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfe96a9489fcbe57f)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x17, 0x8fe89d238bfcad15
    addi    x4, x1,8
    li     x2, MASK_XLEN(-489)
    add    x4, x4, x2
    # Test Instruction 
    sd      x17, 489(x4)
    # Check results:  mem[test_5_res+8] = 0x8fe89d238bfcad15
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x8fe89d238bfcad15)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x31, 0xe10f3f75ea35fe19
    addi    x15, x1,16
    li     x2, MASK_XLEN(-483)
    add    x15, x15, x2
    # Test Instruction 
    sd      x31, 483(x15)
    # Check results:  mem[test_5_res+16] = 0xe10f3f75ea35fe19
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xe10f3f75ea35fe19)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x18, 0x103e65150be793b3
    addi    x21, x1,24
    li     x2, MASK_XLEN(655)
    add    x21, x21, x2
    # Test Instruction 
    sd      x18, -655(x21)
    # Check results:  mem[test_5_res+24] = 0x103e65150be793b3
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x103e65150be793b3)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x29, 0xbd562c1247c6f638
    addi    x5, x1,32
    li     x2, MASK_XLEN(338)
    add    x5, x5, x2
    # Test Instruction 
    sd      x29, -338(x5)
    # Check results:  mem[test_5_res+32] = 0xbd562c1247c6f638
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xbd562c1247c6f638)



    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x17, 0x823f2c5e6b6a11c
    addi    x30, x1,0
    li     x5, MASK_XLEN(-1749)
    add    x30, x30, x5
    # Test Instruction 
    sd      x17, 1749(x30)
    # Check results:  mem[test_6_res+0] = 0x0823f2c5e6b6a11c
    ld x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0823f2c5e6b6a11c)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x22, 0x92d1fb3e66652ebf
    addi    x2, x1,8
    li     x5, MASK_XLEN(31)
    add    x2, x2, x5
    # Test Instruction 
    sd      x22, -31(x2)
    # Check results:  mem[test_6_res+8] = 0x92d1fb3e66652ebf
    ld x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x92d1fb3e66652ebf)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x3, 0x6a6a04cf69150191
    addi    x4, x1,16
    li     x5, MASK_XLEN(1971)
    add    x4, x4, x5
    # Test Instruction 
    sd      x3, -1971(x4)
    # Check results:  mem[test_6_res+16] = 0x6a6a04cf69150191
    ld x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x6a6a04cf69150191)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0xff3544a9353308fb
    addi    x20, x1,24
    li     x5, MASK_XLEN(-523)
    add    x20, x20, x5
    # Test Instruction 
    sd      x15, 523(x20)
    # Check results:  mem[test_6_res+24] = 0xff3544a9353308fb
    ld x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xff3544a9353308fb)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x28, 0xe855a90ddbee5e94
    addi    x14, x1,32
    li     x5, MASK_XLEN(-822)
    add    x14, x14, x5
    # Test Instruction 
    sd      x28, 822(x14)
    # Check results:  mem[test_6_res+32] = 0xe855a90ddbee5e94
    ld x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xe855a90ddbee5e94)



    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x7fffffffffffffff
    addi    x7, x1,0
    li     x2, MASK_XLEN(1)
    add    x7, x7, x2
    # Test Instruction 
    sd      x14, -1(x7)
    # Check results:  mem[test_7_res+0] = 0x7fffffffffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x8000000000000000
    addi    x7, x1,8
    li     x2, MASK_XLEN(1)
    add    x7, x7, x2
    # Test Instruction 
    sd      x9, -1(x7)
    # Check results:  mem[test_7_res+8] = 0x8000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x8000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0xffffffffffffffff
    addi    x18, x1,16
    li     x2, MASK_XLEN(-1)
    add    x18, x18, x2
    # Test Instruction 
    sd      x10, 1(x18)
    # Check results:  mem[test_7_res+16] = 0xffffffffffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x6, 0xffffffffffffffff
    addi    x15, x1,24
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    # Test Instruction 
    sd      x6, 0(x15)
    # Check results:  mem[test_7_res+24] = 0xffffffffffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x0, 0xffffffffffffffff
    addi    x23, x1,32
    li     x2, MASK_XLEN(1)
    add    x23, x23, x2
    # Test Instruction 
    sd      x0, -1(x23)
    # Check results:  mem[test_7_res+32] = 0
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0)



    

    RVTEST_SIGBASE(x3,signature_8_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x19, 0x1
    addi    x2, x3,0
    li     x4, MASK_XLEN(1)
    add    x2, x2, x4
    # Test Instruction 
    sd      x19, -1(x2)
    # Check results:  mem[test_8_res+0] = 0x0000000000000001
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000001)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x19, 0x0
    addi    x29, x3,8
    li     x4, MASK_XLEN(0)
    add    x29, x29, x4
    # Test Instruction 
    sd      x19, 0(x29)
    # Check results:  mem[test_8_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x30, 0xffffffffffffffff
    addi    x1, x3,16
    li     x4, MASK_XLEN(1)
    add    x1, x1, x4
    # Test Instruction 
    sd      x30, -1(x1)
    # Check results:  mem[test_8_res+16] = 0xffffffffffffffff
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffff)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x21, 0x7fffffffffffffff
    addi    x28, x3,24
    li     x4, MASK_XLEN(1)
    add    x28, x28, x4
    # Test Instruction 
    sd      x21, -1(x28)
    # Check results:  mem[test_8_res+24] = 0x7fffffffffffffff
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x16, 0x8000000000000000
    addi    x24, x3,32
    li     x4, MASK_XLEN(1)
    add    x24, x24, x4
    # Test Instruction 
    sd      x16, -1(x24)
    # Check results:  mem[test_8_res+32] = 0x8000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x8000000000000000)



    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Clear memory
    sd      x0, 0(x6)
    # Load values and compute offsets
    li      x2, 0xfffffffffffffffe
    addi    x1, x6,0
    li     x7, MASK_XLEN(-1)
    add    x1, x1, x7
    # Test Instruction 
    sd      x2, 1(x1)
    # Check results:  mem[test_9_res+0] = 0xfffffffffffffffe
    ld x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfffffffffffffffe)

    # Clear memory
    sd      x0, 8(x6)
    # Load values and compute offsets
    li      x1, 0x7fffffffffffffff
    addi    x2, x6,8
    li     x7, MASK_XLEN(-2)
    add    x2, x2, x7
    # Test Instruction 
    sd      x1, 2(x2)
    # Check results:  mem[test_9_res+8] = 0x7fffffffffffffff
    ld x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fffffffffffffff)

    # Clear memory
    sd      x0, 16(x6)
    # Load values and compute offsets
    li      x2, 0xbfffffffffffffff
    addi    x3, x6,16
    li     x7, MASK_XLEN(-4)
    add    x3, x3, x7
    # Test Instruction 
    sd      x2, 4(x3)
    # Check results:  mem[test_9_res+16] = 0xbfffffffffffffff
    ld x8, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbfffffffffffffff)

    # Clear memory
    sd      x0, 24(x6)
    # Load values and compute offsets
    li      x3, 0xdfffffffffffffff
    addi    x4, x6,24
    li     x7, MASK_XLEN(-8)
    add    x4, x4, x7
    # Test Instruction 
    sd      x3, 8(x4)
    # Check results:  mem[test_9_res+24] = 0xdfffffffffffffff
    ld x8, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdfffffffffffffff)

    # Clear memory
    sd      x0, 32(x6)
    # Load values and compute offsets
    li      x4, 0xefffffffffffffff
    addi    x5, x6,32
    li     x7, MASK_XLEN(-16)
    add    x5, x5, x7
    # Test Instruction 
    sd      x4, 16(x5)
    # Check results:  mem[test_9_res+32] = 0xefffffffffffffff
    ld x8, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xefffffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x5, 0xf7ffffffffffffff
    addi    x6, x1,0
    li     x2, MASK_XLEN(-32)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, 32(x6)
    # Check results:  mem[test_10_res+0] = 0xf7ffffffffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xf7ffffffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x6, 0xfbffffffffffffff
    addi    x7, x1,8
    li     x2, MASK_XLEN(-64)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, 64(x7)
    # Check results:  mem[test_10_res+8] = 0xfbffffffffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfbffffffffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x7, 0xfdffffffffffffff
    addi    x8, x1,16
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, 128(x8)
    # Check results:  mem[test_10_res+16] = 0xfdffffffffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfdffffffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0xfeffffffffffffff
    addi    x9, x1,24
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, 256(x9)
    # Check results:  mem[test_10_res+24] = 0xfeffffffffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfeffffffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0xff7fffffffffffff
    addi    x10, x1,32
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, 512(x10)
    # Check results:  mem[test_10_res+32] = 0xff7fffffffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xff7fffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0xffbfffffffffffff
    addi    x11, x1,0
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, 1024(x11)
    # Check results:  mem[test_11_res+0] = 0xffbfffffffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffbfffffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0xffdfffffffffffff
    addi    x12, x1,8
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -2048(x12)
    # Check results:  mem[test_11_res+8] = 0xffdfffffffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffdfffffffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0xffefffffffffffff
    addi    x13, x1,16
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -2(x13)
    # Check results:  mem[test_11_res+16] = 0xffefffffffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffefffffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0xfff7ffffffffffff
    addi    x14, x1,24
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -3(x14)
    # Check results:  mem[test_11_res+24] = 0xfff7ffffffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfff7ffffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0xfffbffffffffffff
    addi    x15, x1,32
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -5(x15)
    # Check results:  mem[test_11_res+32] = 0xfffbffffffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffbffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0xfffdffffffffffff
    addi    x16, x1,0
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -9(x16)
    # Check results:  mem[test_12_res+0] = 0xfffdffffffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffdffffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x16, 0xfffeffffffffffff
    addi    x17, x1,8
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -17(x17)
    # Check results:  mem[test_12_res+8] = 0xfffeffffffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffeffffffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x17, 0xffff7fffffffffff
    addi    x18, x1,16
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -33(x18)
    # Check results:  mem[test_12_res+16] = 0xffff7fffffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffff7fffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x18, 0xffffbfffffffffff
    addi    x19, x1,24
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -65(x19)
    # Check results:  mem[test_12_res+24] = 0xffffbfffffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffbfffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x19, 0xffffdfffffffffff
    addi    x20, x1,32
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -129(x20)
    # Check results:  mem[test_12_res+32] = 0xffffdfffffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffdfffffffffff)



    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x20, 0xffffefffffffffff
    addi    x21, x1,0
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -257(x21)
    # Check results:  mem[test_13_res+0] = 0xffffefffffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffefffffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x21, 0xfffff7ffffffffff
    addi    x22, x1,8
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -513(x22)
    # Check results:  mem[test_13_res+8] = 0xfffff7ffffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffff7ffffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x22, 0xfffffbffffffffff
    addi    x23, x1,16
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -1025(x23)
    # Check results:  mem[test_13_res+16] = 0xfffffbffffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffbffffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x23, 0xfffffdffffffffff
    addi    x24, x1,24
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, 2047(x24)
    # Check results:  mem[test_13_res+24] = 0xfffffdffffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffdffffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x24, 0xfffffeffffffffff
    addi    x25, x1,32
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -2(x25)
    # Check results:  mem[test_13_res+32] = 0xfffffeffffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffeffffffffff)



    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x25, 0xffffff7fffffffff
    addi    x26, x1,0
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -3(x26)
    # Check results:  mem[test_14_res+0] = 0xffffff7fffffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffff7fffffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x26, 0xffffffbfffffffff
    addi    x27, x1,8
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -5(x27)
    # Check results:  mem[test_14_res+8] = 0xffffffbfffffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffbfffffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x27, 0xffffffdfffffffff
    addi    x28, x1,16
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -9(x28)
    # Check results:  mem[test_14_res+16] = 0xffffffdfffffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffdfffffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x28, 0xffffffefffffffff
    addi    x29, x1,24
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    # Test Instruction 
    sd      x28, -17(x29)
    # Check results:  mem[test_14_res+24] = 0xffffffefffffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffefffffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x29, 0xfffffff7ffffffff
    addi    x30, x1,32
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    # Test Instruction 
    sd      x29, -33(x30)
    # Check results:  mem[test_14_res+32] = 0xfffffff7ffffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffff7ffffffff)



    

    RVTEST_SIGBASE(x5,signature_15_0)

    # Clear memory
    sd      x0, 0(x5)
    # Load values and compute offsets
    li      x30, 0xfffffffbffffffff
    addi    x31, x5,0
    li     x6, MASK_XLEN(65)
    add    x31, x31, x6
    # Test Instruction 
    sd      x30, -65(x31)
    # Check results:  mem[test_15_res+0] = 0xfffffffbffffffff
    ld x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffffffbffffffff)

    # Clear memory
    sd      x0, 8(x5)
    # Load values and compute offsets
    li      x2, 0xfffffffdffffffff
    addi    x1, x5,8
    li     x6, MASK_XLEN(129)
    add    x1, x1, x6
    # Test Instruction 
    sd      x2, -129(x1)
    # Check results:  mem[test_15_res+8] = 0xfffffffdffffffff
    ld x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffffffdffffffff)

    # Clear memory
    sd      x0, 16(x5)
    # Load values and compute offsets
    li      x1, 0xfffffffeffffffff
    addi    x2, x5,16
    li     x6, MASK_XLEN(257)
    add    x2, x2, x6
    # Test Instruction 
    sd      x1, -257(x2)
    # Check results:  mem[test_15_res+16] = 0xfffffffeffffffff
    ld x7, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffffffeffffffff)

    # Clear memory
    sd      x0, 24(x5)
    # Load values and compute offsets
    li      x2, 0xffffffff7fffffff
    addi    x3, x5,24
    li     x6, MASK_XLEN(513)
    add    x3, x3, x6
    # Test Instruction 
    sd      x2, -513(x3)
    # Check results:  mem[test_15_res+24] = 0xffffffff7fffffff
    ld x7, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff7fffffff)

    # Clear memory
    sd      x0, 32(x5)
    # Load values and compute offsets
    li      x3, 0xffffffffbfffffff
    addi    x4, x5,32
    li     x6, MASK_XLEN(1025)
    add    x4, x4, x6
    # Test Instruction 
    sd      x3, -1025(x4)
    # Check results:  mem[test_15_res+32] = 0xffffffffbfffffff
    ld x7, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffffbfffffff)



    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x4, 0xffffffffdfffffff
    addi    x5, x1,0
    li     x2, MASK_XLEN(-2047)
    add    x5, x5, x2
    # Test Instruction 
    sd      x4, 2047(x5)
    # Check results:  mem[test_16_res+0] = 0xffffffffdfffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffdfffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x5, 0xffffffffefffffff
    addi    x6, x1,8
    li     x2, MASK_XLEN(2)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, -2(x6)
    # Check results:  mem[test_16_res+8] = 0xffffffffefffffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffefffffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x6, 0xfffffffff7ffffff
    addi    x7, x1,16
    li     x2, MASK_XLEN(3)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, -3(x7)
    # Check results:  mem[test_16_res+16] = 0xfffffffff7ffffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffff7ffffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x7, 0xfffffffffbffffff
    addi    x8, x1,24
    li     x2, MASK_XLEN(5)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -5(x8)
    # Check results:  mem[test_16_res+24] = 0xfffffffffbffffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffbffffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffffdffffff
    addi    x9, x1,32
    li     x2, MASK_XLEN(9)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, -9(x9)
    # Check results:  mem[test_16_res+32] = 0xfffffffffdffffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffdffffff)



    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffffeffffff
    addi    x10, x1,0
    li     x2, MASK_XLEN(17)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, -17(x10)
    # Check results:  mem[test_17_res+0] = 0xfffffffffeffffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffeffffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0xffffffffff7fffff
    addi    x11, x1,8
    li     x2, MASK_XLEN(33)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -33(x11)
    # Check results:  mem[test_17_res+8] = 0xffffffffff7fffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffff7fffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0xffffffffffbfffff
    addi    x12, x1,16
    li     x2, MASK_XLEN(65)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -65(x12)
    # Check results:  mem[test_17_res+16] = 0xffffffffffbfffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffbfffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0xffffffffffdfffff
    addi    x13, x1,24
    li     x2, MASK_XLEN(129)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -129(x13)
    # Check results:  mem[test_17_res+24] = 0xffffffffffdfffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffdfffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0xffffffffffefffff
    addi    x14, x1,32
    li     x2, MASK_XLEN(257)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -257(x14)
    # Check results:  mem[test_17_res+32] = 0xffffffffffefffff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffefffff)



    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xfffffffffff7ffff
    addi    x15, x1,0
    li     x2, MASK_XLEN(513)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -513(x15)
    # Check results:  mem[test_18_res+0] = 0xfffffffffff7ffff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffff7ffff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffffffbffff
    addi    x16, x1,8
    li     x2, MASK_XLEN(1025)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -1025(x16)
    # Check results:  mem[test_18_res+8] = 0xfffffffffffbffff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffbffff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x16, 0xfffffffffffdffff
    addi    x17, x1,16
    li     x2, MASK_XLEN(-2047)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, 2047(x17)
    # Check results:  mem[test_18_res+16] = 0xfffffffffffdffff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffdffff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x17, 0xfffffffffffeffff
    addi    x18, x1,24
    li     x2, MASK_XLEN(2)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -2(x18)
    # Check results:  mem[test_18_res+24] = 0xfffffffffffeffff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffeffff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x18, 0xffffffffffff7fff
    addi    x19, x1,32
    li     x2, MASK_XLEN(3)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -3(x19)
    # Check results:  mem[test_18_res+32] = 0xffffffffffff7fff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffff7fff)



    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x19, 0xffffffffffffbfff
    addi    x20, x1,0
    li     x2, MASK_XLEN(5)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -5(x20)
    # Check results:  mem[test_19_res+0] = 0xffffffffffffbfff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffbfff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x20, 0xffffffffffffdfff
    addi    x21, x1,8
    li     x2, MASK_XLEN(9)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -9(x21)
    # Check results:  mem[test_19_res+8] = 0xffffffffffffdfff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffdfff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x21, 0xffffffffffffefff
    addi    x22, x1,16
    li     x2, MASK_XLEN(17)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -17(x22)
    # Check results:  mem[test_19_res+16] = 0xffffffffffffefff
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffefff)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x22, 0xfffffffffffff7ff
    addi    x23, x1,24
    li     x2, MASK_XLEN(33)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -33(x23)
    # Check results:  mem[test_19_res+24] = 0xfffffffffffff7ff
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffff7ff)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x23, 0xfffffffffffffbff
    addi    x24, x1,32
    li     x2, MASK_XLEN(65)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -65(x24)
    # Check results:  mem[test_19_res+32] = 0xfffffffffffffbff
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffffbff)



    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x24, 0xfffffffffffffdff
    addi    x25, x1,0
    li     x2, MASK_XLEN(129)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -129(x25)
    # Check results:  mem[test_20_res+0] = 0xfffffffffffffdff
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffffdff)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x25, 0xfffffffffffffeff
    addi    x26, x1,8
    li     x2, MASK_XLEN(257)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -257(x26)
    # Check results:  mem[test_20_res+8] = 0xfffffffffffffeff
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffffffffeff)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x26, 0xffffffffffffff7f
    addi    x27, x1,16
    li     x2, MASK_XLEN(513)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -513(x27)
    # Check results:  mem[test_20_res+16] = 0xffffffffffffff7f
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffff7f)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x27, 0xffffffffffffffbf
    addi    x28, x1,24
    li     x2, MASK_XLEN(1025)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -1025(x28)
    # Check results:  mem[test_20_res+24] = 0xffffffffffffffbf
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffffbf)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x28, 0xffffffffffffffdf
    addi    x29, x1,32
    li     x2, MASK_XLEN(-2047)
    add    x29, x29, x2
    # Test Instruction 
    sd      x28, 2047(x29)
    # Check results:  mem[test_20_res+32] = 0xffffffffffffffdf
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x4,signature_21_0)

    # Clear memory
    sd      x0, 0(x4)
    # Load values and compute offsets
    li      x29, 0xffffffffffffffef
    addi    x30, x4,0
    li     x5, MASK_XLEN(2)
    add    x30, x30, x5
    # Test Instruction 
    sd      x29, -2(x30)
    # Check results:  mem[test_21_res+0] = 0xffffffffffffffef
    ld x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xffffffffffffffef)

    # Clear memory
    sd      x0, 8(x4)
    # Load values and compute offsets
    li      x30, 0xfffffffffffffff7
    addi    x31, x4,8
    li     x5, MASK_XLEN(3)
    add    x31, x31, x5
    # Test Instruction 
    sd      x30, -3(x31)
    # Check results:  mem[test_21_res+8] = 0xfffffffffffffff7
    ld x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xfffffffffffffff7)

    # Clear memory
    sd      x0, 16(x4)
    # Load values and compute offsets
    li      x2, 0xfffffffffffffffb
    addi    x1, x4,16
    li     x5, MASK_XLEN(5)
    add    x1, x1, x5
    # Test Instruction 
    sd      x2, -5(x1)
    # Check results:  mem[test_21_res+16] = 0xfffffffffffffffb
    ld x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xfffffffffffffffb)

    # Clear memory
    sd      x0, 24(x4)
    # Load values and compute offsets
    li      x1, 0xfffffffffffffffd
    addi    x2, x4,24
    li     x5, MASK_XLEN(9)
    add    x2, x2, x5
    # Test Instruction 
    sd      x1, -9(x2)
    # Check results:  mem[test_21_res+24] = 0xfffffffffffffffd
    ld x6, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xfffffffffffffffd)

    # Clear memory
    sd      x0, 32(x4)
    # Load values and compute offsets
    li      x2, 0xfffffffffffffffe
    addi    x3, x4,32
    li     x5, MASK_XLEN(17)
    add    x3, x3, x5
    # Test Instruction 
    sd      x2, -17(x3)
    # Check results:  mem[test_21_res+32] = 0xfffffffffffffffe
    ld x6, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xfffffffffffffffe)



    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x3, 0x8000000000000000
    addi    x4, x1,0
    li     x2, MASK_XLEN(33)
    add    x4, x4, x2
    # Test Instruction 
    sd      x3, -33(x4)
    # Check results:  mem[test_22_res+0] = 0x8000000000000000
    ld x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x8000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x4, 0x4000000000000000
    addi    x5, x1,8
    li     x2, MASK_XLEN(65)
    add    x5, x5, x2
    # Test Instruction 
    sd      x4, -65(x5)
    # Check results:  mem[test_22_res+8] = 0x4000000000000000
    ld x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x4000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x5, 0x2000000000000000
    addi    x6, x1,16
    li     x2, MASK_XLEN(129)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, -129(x6)
    # Check results:  mem[test_22_res+16] = 0x2000000000000000
    ld x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x2000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x6, 0x1000000000000000
    addi    x7, x1,24
    li     x2, MASK_XLEN(257)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, -257(x7)
    # Check results:  mem[test_22_res+24] = 0x1000000000000000
    ld x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x1000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x7, 0x800000000000000
    addi    x8, x1,32
    li     x2, MASK_XLEN(513)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -513(x8)
    # Check results:  mem[test_22_res+32] = 0x0800000000000000
    ld x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0800000000000000)



    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x400000000000000
    addi    x9, x1,0
    li     x2, MASK_XLEN(1025)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, -1025(x9)
    # Check results:  mem[test_23_res+0] = 0x0400000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0400000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x200000000000000
    addi    x10, x1,8
    li     x2, MASK_XLEN(-2047)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, 2047(x10)
    # Check results:  mem[test_23_res+8] = 0x0200000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0200000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x100000000000000
    addi    x11, x1,16
    li     x2, MASK_XLEN(2)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -2(x11)
    # Check results:  mem[test_23_res+16] = 0x0100000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0100000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x80000000000000
    addi    x12, x1,24
    li     x2, MASK_XLEN(3)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -3(x12)
    # Check results:  mem[test_23_res+24] = 0x0080000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0080000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x40000000000000
    addi    x13, x1,32
    li     x2, MASK_XLEN(5)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -5(x13)
    # Check results:  mem[test_23_res+32] = 0x0040000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0040000000000000)



    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x20000000000000
    addi    x14, x1,0
    li     x2, MASK_XLEN(9)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -9(x14)
    # Check results:  mem[test_24_res+0] = 0x0020000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0020000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x10000000000000
    addi    x15, x1,8
    li     x2, MASK_XLEN(17)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -17(x15)
    # Check results:  mem[test_24_res+8] = 0x0010000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0010000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x8000000000000
    addi    x16, x1,16
    li     x2, MASK_XLEN(33)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -33(x16)
    # Check results:  mem[test_24_res+16] = 0x0008000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0008000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x16, 0x4000000000000
    addi    x17, x1,24
    li     x2, MASK_XLEN(65)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -65(x17)
    # Check results:  mem[test_24_res+24] = 0x0004000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0004000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x17, 0x2000000000000
    addi    x18, x1,32
    li     x2, MASK_XLEN(129)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -129(x18)
    # Check results:  mem[test_24_res+32] = 0x0002000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0002000000000000)



    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x18, 0x1000000000000
    addi    x19, x1,0
    li     x2, MASK_XLEN(257)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -257(x19)
    # Check results:  mem[test_25_res+0] = 0x0001000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0001000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x19, 0x800000000000
    addi    x20, x1,8
    li     x2, MASK_XLEN(513)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -513(x20)
    # Check results:  mem[test_25_res+8] = 0x0000800000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000800000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x20, 0x400000000000
    addi    x21, x1,16
    li     x2, MASK_XLEN(1025)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -1025(x21)
    # Check results:  mem[test_25_res+16] = 0x0000400000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000400000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x21, 0x200000000000
    addi    x22, x1,24
    li     x2, MASK_XLEN(-2047)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, 2047(x22)
    # Check results:  mem[test_25_res+24] = 0x0000200000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000200000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x22, 0x100000000000
    addi    x23, x1,32
    li     x2, MASK_XLEN(2)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -2(x23)
    # Check results:  mem[test_25_res+32] = 0x0000100000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000100000000000)



    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x23, 0x80000000000
    addi    x24, x1,0
    li     x2, MASK_XLEN(3)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -3(x24)
    # Check results:  mem[test_26_res+0] = 0x0000080000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000080000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x24, 0x40000000000
    addi    x25, x1,8
    li     x2, MASK_XLEN(5)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -5(x25)
    # Check results:  mem[test_26_res+8] = 0x0000040000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000040000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x25, 0x20000000000
    addi    x26, x1,16
    li     x2, MASK_XLEN(9)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -9(x26)
    # Check results:  mem[test_26_res+16] = 0x0000020000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000020000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x26, 0x10000000000
    addi    x27, x1,24
    li     x2, MASK_XLEN(17)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -17(x27)
    # Check results:  mem[test_26_res+24] = 0x0000010000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000010000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x27, 0x8000000000
    addi    x28, x1,32
    li     x2, MASK_XLEN(33)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -33(x28)
    # Check results:  mem[test_26_res+32] = 0x0000008000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000008000000000)



    

    RVTEST_SIGBASE(x3,signature_27_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x28, 0x4000000000
    addi    x29, x3,0
    li     x4, MASK_XLEN(65)
    add    x29, x29, x4
    # Test Instruction 
    sd      x28, -65(x29)
    # Check results:  mem[test_27_res+0] = 0x0000004000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000004000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x29, 0x2000000000
    addi    x30, x3,8
    li     x4, MASK_XLEN(129)
    add    x30, x30, x4
    # Test Instruction 
    sd      x29, -129(x30)
    # Check results:  mem[test_27_res+8] = 0x0000002000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000002000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x30, 0x1000000000
    addi    x31, x3,16
    li     x4, MASK_XLEN(257)
    add    x31, x31, x4
    # Test Instruction 
    sd      x30, -257(x31)
    # Check results:  mem[test_27_res+16] = 0x0000001000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000001000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x2, 0x800000000
    addi    x1, x3,24
    li     x4, MASK_XLEN(513)
    add    x1, x1, x4
    # Test Instruction 
    sd      x2, -513(x1)
    # Check results:  mem[test_27_res+24] = 0x0000000800000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000800000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x400000000
    addi    x2, x3,32
    li     x4, MASK_XLEN(1025)
    add    x2, x2, x4
    # Test Instruction 
    sd      x1, -1025(x2)
    # Check results:  mem[test_27_res+32] = 0x0000000400000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000400000000)



    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x2, 0x200000000
    addi    x3, x1,0
    li     x8, MASK_XLEN(-2047)
    add    x3, x3, x8
    # Test Instruction 
    sd      x2, 2047(x3)
    # Check results:  mem[test_28_res+0] = 0x0000000200000000
    ld x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000200000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x3, 0x100000000
    addi    x4, x1,8
    li     x8, MASK_XLEN(2)
    add    x4, x4, x8
    # Test Instruction 
    sd      x3, -2(x4)
    # Check results:  mem[test_28_res+8] = 0x0000000100000000
    ld x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000100000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x4, 0x80000000
    addi    x5, x1,16
    li     x8, MASK_XLEN(3)
    add    x5, x5, x8
    # Test Instruction 
    sd      x4, -3(x5)
    # Check results:  mem[test_28_res+16] = 0x0000000080000000
    ld x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000080000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x5, 0x40000000
    addi    x6, x1,24
    li     x8, MASK_XLEN(5)
    add    x6, x6, x8
    # Test Instruction 
    sd      x5, -5(x6)
    # Check results:  mem[test_28_res+24] = 0x0000000040000000
    ld x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000040000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x6, 0x20000000
    addi    x7, x1,32
    li     x8, MASK_XLEN(9)
    add    x7, x7, x8
    # Test Instruction 
    sd      x6, -9(x7)
    # Check results:  mem[test_28_res+32] = 0x0000000020000000
    ld x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000020000000)



    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x7, 0x10000000
    addi    x8, x1,0
    li     x2, MASK_XLEN(17)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -17(x8)
    # Check results:  mem[test_29_res+0] = 0x0000000010000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000010000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x8000000
    addi    x9, x1,8
    li     x2, MASK_XLEN(33)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, -33(x9)
    # Check results:  mem[test_29_res+8] = 0x0000000008000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000008000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x4000000
    addi    x10, x1,16
    li     x2, MASK_XLEN(65)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, -65(x10)
    # Check results:  mem[test_29_res+16] = 0x0000000004000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000004000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x10, 0x2000000
    addi    x11, x1,24
    li     x2, MASK_XLEN(129)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -129(x11)
    # Check results:  mem[test_29_res+24] = 0x0000000002000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000002000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x11, 0x1000000
    addi    x12, x1,32
    li     x2, MASK_XLEN(257)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -257(x12)
    # Check results:  mem[test_29_res+32] = 0x0000000001000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000001000000)



    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x800000
    addi    x13, x1,0
    li     x2, MASK_XLEN(513)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -513(x13)
    # Check results:  mem[test_30_res+0] = 0x0000000000800000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000800000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x400000
    addi    x14, x1,8
    li     x2, MASK_XLEN(1025)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -1025(x14)
    # Check results:  mem[test_30_res+8] = 0x0000000000400000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000400000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x200000
    addi    x15, x1,16
    li     x2, MASK_XLEN(-2047)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, 2047(x15)
    # Check results:  mem[test_30_res+16] = 0x0000000000200000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000200000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x15, 0x100000
    addi    x16, x1,24
    li     x2, MASK_XLEN(2)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -2(x16)
    # Check results:  mem[test_30_res+24] = 0x0000000000100000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000100000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x16, 0x80000
    addi    x17, x1,32
    li     x2, MASK_XLEN(3)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -3(x17)
    # Check results:  mem[test_30_res+32] = 0x0000000000080000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000080000)



    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x17, 0x40000
    addi    x18, x1,0
    li     x2, MASK_XLEN(5)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -5(x18)
    # Check results:  mem[test_31_res+0] = 0x0000000000040000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000040000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x18, 0x20000
    addi    x19, x1,8
    li     x2, MASK_XLEN(9)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -9(x19)
    # Check results:  mem[test_31_res+8] = 0x0000000000020000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000020000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x19, 0x10000
    addi    x20, x1,16
    li     x2, MASK_XLEN(17)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -17(x20)
    # Check results:  mem[test_31_res+16] = 0x0000000000010000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000010000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x20, 0x8000
    addi    x21, x1,24
    li     x2, MASK_XLEN(33)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -33(x21)
    # Check results:  mem[test_31_res+24] = 0x0000000000008000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000008000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x21, 0x4000
    addi    x22, x1,32
    li     x2, MASK_XLEN(65)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -65(x22)
    # Check results:  mem[test_31_res+32] = 0x0000000000004000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000004000)



    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x22, 0x2000
    addi    x23, x1,0
    li     x2, MASK_XLEN(129)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -129(x23)
    # Check results:  mem[test_32_res+0] = 0x0000000000002000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000002000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x23, 0x1000
    addi    x24, x1,8
    li     x2, MASK_XLEN(257)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -257(x24)
    # Check results:  mem[test_32_res+8] = 0x0000000000001000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000001000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x24, 0x800
    addi    x25, x1,16
    li     x2, MASK_XLEN(513)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -513(x25)
    # Check results:  mem[test_32_res+16] = 0x0000000000000800
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000800)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x25, 0x400
    addi    x26, x1,24
    li     x2, MASK_XLEN(1025)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -1025(x26)
    # Check results:  mem[test_32_res+24] = 0x0000000000000400
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000400)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x26, 0x200
    addi    x27, x1,32
    li     x2, MASK_XLEN(-2047)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, 2047(x27)
    # Check results:  mem[test_32_res+32] = 0x0000000000000200
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000200)



    

    RVTEST_SIGBASE(x3,signature_33_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x27, 0x100
    addi    x28, x3,0
    li     x4, MASK_XLEN(2)
    add    x28, x28, x4
    # Test Instruction 
    sd      x27, -2(x28)
    # Check results:  mem[test_33_res+0] = 0x0000000000000100
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000100)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x28, 0x80
    addi    x29, x3,8
    li     x4, MASK_XLEN(3)
    add    x29, x29, x4
    # Test Instruction 
    sd      x28, -3(x29)
    # Check results:  mem[test_33_res+8] = 0x0000000000000080
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000080)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x29, 0x40
    addi    x30, x3,16
    li     x4, MASK_XLEN(5)
    add    x30, x30, x4
    # Test Instruction 
    sd      x29, -5(x30)
    # Check results:  mem[test_33_res+16] = 0x0000000000000040
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000040)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x30, 0x20
    addi    x31, x3,24
    li     x4, MASK_XLEN(9)
    add    x31, x31, x4
    # Test Instruction 
    sd      x30, -9(x31)
    # Check results:  mem[test_33_res+24] = 0x0000000000000020
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000020)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x2, 0x10
    addi    x1, x3,32
    li     x4, MASK_XLEN(17)
    add    x1, x1, x4
    # Test Instruction 
    sd      x2, -17(x1)
    # Check results:  mem[test_33_res+32] = 0x0000000000000010
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000010)



    

    RVTEST_SIGBASE(x7,signature_34_0)

    # Clear memory
    sd      x0, 0(x7)
    # Load values and compute offsets
    li      x1, 0x8
    addi    x2, x7,0
    li     x8, MASK_XLEN(33)
    add    x2, x2, x8
    # Test Instruction 
    sd      x1, -33(x2)
    # Check results:  mem[test_34_res+0] = 0x0000000000000008
    ld x9, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000008)

    # Clear memory
    sd      x0, 8(x7)
    # Load values and compute offsets
    li      x2, 0x4
    addi    x3, x7,8
    li     x8, MASK_XLEN(65)
    add    x3, x3, x8
    # Test Instruction 
    sd      x2, -65(x3)
    # Check results:  mem[test_34_res+8] = 0x0000000000000004
    ld x9, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000004)

    # Clear memory
    sd      x0, 16(x7)
    # Load values and compute offsets
    li      x3, 0x2
    addi    x4, x7,16
    li     x8, MASK_XLEN(129)
    add    x4, x4, x8
    # Test Instruction 
    sd      x3, -129(x4)
    # Check results:  mem[test_34_res+16] = 0x0000000000000002
    ld x9, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000002)

    # Clear memory
    sd      x0, 24(x7)
    # Load values and compute offsets
    li      x4, 0x0
    addi    x5, x7,24
    li     x8, MASK_XLEN(-1)
    add    x5, x5, x8
    # Test Instruction 
    sd      x4, 1(x5)
    # Check results:  mem[test_34_res+24] = 0x0000000000000000
    ld x9, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x7)
    # Load values and compute offsets
    li      x5, 0x0
    addi    x6, x7,32
    li     x8, MASK_XLEN(-2)
    add    x6, x6, x8
    # Test Instruction 
    sd      x5, 2(x6)
    # Check results:  mem[test_34_res+32] = 0x0000000000000000
    ld x9, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x6, 0x0
    addi    x7, x1,0
    li     x2, MASK_XLEN(-4)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, 4(x7)
    # Check results:  mem[test_35_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x7, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-8)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, 8(x8)
    # Check results:  mem[test_35_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x9, x1,16
    li     x2, MASK_XLEN(-16)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, 16(x9)
    # Check results:  mem[test_35_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x10, x1,24
    li     x2, MASK_XLEN(-32)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, 32(x10)
    # Check results:  mem[test_35_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x11, x1,32
    li     x2, MASK_XLEN(-64)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, 64(x11)
    # Check results:  mem[test_35_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x12, x1,0
    li     x2, MASK_XLEN(-128)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, 128(x12)
    # Check results:  mem[test_36_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-256)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, 256(x13)
    # Check results:  mem[test_36_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x14, x1,16
    li     x2, MASK_XLEN(-512)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, 512(x14)
    # Check results:  mem[test_36_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x15, x1,24
    li     x2, MASK_XLEN(-1024)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, 1024(x15)
    # Check results:  mem[test_36_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x16, x1,32
    li     x2, MASK_XLEN(2048)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -2048(x16)
    # Check results:  mem[test_36_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x16, 0x0
    addi    x17, x1,0
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -2(x17)
    # Check results:  mem[test_37_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x17, 0x0
    addi    x18, x1,8
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -3(x18)
    # Check results:  mem[test_37_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x18, 0x0
    addi    x19, x1,16
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -5(x19)
    # Check results:  mem[test_37_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x19, 0x0
    addi    x20, x1,24
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -9(x20)
    # Check results:  mem[test_37_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x20, 0x0
    addi    x21, x1,32
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -17(x21)
    # Check results:  mem[test_37_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x21, 0x0
    addi    x22, x1,0
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -33(x22)
    # Check results:  mem[test_38_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x22, 0x0
    addi    x23, x1,8
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -65(x23)
    # Check results:  mem[test_38_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x23, 0x0
    addi    x24, x1,16
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -129(x24)
    # Check results:  mem[test_38_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x24, 0x0
    addi    x25, x1,24
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -257(x25)
    # Check results:  mem[test_38_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x25, 0x0
    addi    x26, x1,32
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -513(x26)
    # Check results:  mem[test_38_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x26, 0x0
    addi    x27, x1,0
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -1025(x27)
    # Check results:  mem[test_39_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x27, 0x0
    addi    x28, x1,8
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, 2047(x28)
    # Check results:  mem[test_39_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x28, 0x0
    addi    x29, x1,16
    li     x2, MASK_XLEN(2)
    add    x29, x29, x2
    # Test Instruction 
    sd      x28, -2(x29)
    # Check results:  mem[test_39_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x29, 0x0
    addi    x30, x1,24
    li     x2, MASK_XLEN(3)
    add    x30, x30, x2
    # Test Instruction 
    sd      x29, -3(x30)
    # Check results:  mem[test_39_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x30, 0x0
    addi    x31, x1,32
    li     x2, MASK_XLEN(5)
    add    x31, x31, x2
    # Test Instruction 
    sd      x30, -5(x31)
    # Check results:  mem[test_39_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x6,signature_40_0)

    # Clear memory
    sd      x0, 0(x6)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x1, x6,0
    li     x7, MASK_XLEN(9)
    add    x1, x1, x7
    # Test Instruction 
    sd      x2, -9(x1)
    # Check results:  mem[test_40_res+0] = 0x0000000000000000
    ld x8, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x6)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x6,8
    li     x7, MASK_XLEN(17)
    add    x2, x2, x7
    # Test Instruction 
    sd      x1, -17(x2)
    # Check results:  mem[test_40_res+8] = 0x0000000000000000
    ld x8, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x6)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x3, x6,16
    li     x7, MASK_XLEN(33)
    add    x3, x3, x7
    # Test Instruction 
    sd      x2, -33(x3)
    # Check results:  mem[test_40_res+16] = 0x0000000000000000
    ld x8, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x6)
    # Load values and compute offsets
    li      x3, 0x0
    addi    x4, x6,24
    li     x7, MASK_XLEN(65)
    add    x4, x4, x7
    # Test Instruction 
    sd      x3, -65(x4)
    # Check results:  mem[test_40_res+24] = 0x0000000000000000
    ld x8, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x6)
    # Load values and compute offsets
    li      x4, 0x0
    addi    x5, x6,32
    li     x7, MASK_XLEN(129)
    add    x5, x5, x7
    # Test Instruction 
    sd      x4, -129(x5)
    # Check results:  mem[test_40_res+32] = 0x0000000000000000
    ld x8, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x5, 0x0
    addi    x6, x1,0
    li     x2, MASK_XLEN(257)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, -257(x6)
    # Check results:  mem[test_41_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x6, 0x0
    addi    x7, x1,8
    li     x2, MASK_XLEN(513)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, -513(x7)
    # Check results:  mem[test_41_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x7, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(1025)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -1025(x8)
    # Check results:  mem[test_41_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x9, x1,24
    li     x2, MASK_XLEN(-2047)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, 2047(x9)
    # Check results:  mem[test_41_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x10, x1,32
    li     x2, MASK_XLEN(2)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, -2(x10)
    # Check results:  mem[test_41_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(3)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -3(x11)
    # Check results:  mem[test_42_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x12, x1,8
    li     x2, MASK_XLEN(5)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -5(x12)
    # Check results:  mem[test_42_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(9)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -9(x13)
    # Check results:  mem[test_42_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x14, x1,24
    li     x2, MASK_XLEN(17)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -17(x14)
    # Check results:  mem[test_42_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x15, x1,32
    li     x2, MASK_XLEN(33)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -33(x15)
    # Check results:  mem[test_42_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x16, x1,0
    li     x2, MASK_XLEN(65)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -65(x16)
    # Check results:  mem[test_43_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x16, 0x0
    addi    x17, x1,8
    li     x2, MASK_XLEN(129)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -129(x17)
    # Check results:  mem[test_43_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x17, 0x0
    addi    x18, x1,16
    li     x2, MASK_XLEN(257)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -257(x18)
    # Check results:  mem[test_43_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x18, 0x0
    addi    x19, x1,24
    li     x2, MASK_XLEN(513)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -513(x19)
    # Check results:  mem[test_43_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x19, 0x0
    addi    x20, x1,32
    li     x2, MASK_XLEN(1025)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -1025(x20)
    # Check results:  mem[test_43_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x20, 0x0
    addi    x21, x1,0
    li     x2, MASK_XLEN(-2047)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, 2047(x21)
    # Check results:  mem[test_44_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x21, 0x0
    addi    x22, x1,8
    li     x2, MASK_XLEN(2)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -2(x22)
    # Check results:  mem[test_44_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x22, 0x0
    addi    x23, x1,16
    li     x2, MASK_XLEN(3)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -3(x23)
    # Check results:  mem[test_44_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x23, 0x0
    addi    x24, x1,24
    li     x2, MASK_XLEN(5)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -5(x24)
    # Check results:  mem[test_44_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x24, 0x0
    addi    x25, x1,32
    li     x2, MASK_XLEN(9)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -9(x25)
    # Check results:  mem[test_44_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x25, 0x0
    addi    x26, x1,0
    li     x2, MASK_XLEN(17)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -17(x26)
    # Check results:  mem[test_45_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x26, 0x0
    addi    x27, x1,8
    li     x2, MASK_XLEN(33)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -33(x27)
    # Check results:  mem[test_45_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x27, 0x0
    addi    x28, x1,16
    li     x2, MASK_XLEN(65)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -65(x28)
    # Check results:  mem[test_45_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x28, 0x0
    addi    x29, x1,24
    li     x2, MASK_XLEN(129)
    add    x29, x29, x2
    # Test Instruction 
    sd      x28, -129(x29)
    # Check results:  mem[test_45_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x29, 0x0
    addi    x30, x1,32
    li     x2, MASK_XLEN(257)
    add    x30, x30, x2
    # Test Instruction 
    sd      x29, -257(x30)
    # Check results:  mem[test_45_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x5,signature_46_0)

    # Clear memory
    sd      x0, 0(x5)
    # Load values and compute offsets
    li      x30, 0x0
    addi    x31, x5,0
    li     x6, MASK_XLEN(513)
    add    x31, x31, x6
    # Test Instruction 
    sd      x30, -513(x31)
    # Check results:  mem[test_46_res+0] = 0x0000000000000000
    ld x7, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x5)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x1, x5,8
    li     x6, MASK_XLEN(1025)
    add    x1, x1, x6
    # Test Instruction 
    sd      x2, -1025(x1)
    # Check results:  mem[test_46_res+8] = 0x0000000000000000
    ld x7, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x5)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x5,16
    li     x6, MASK_XLEN(-2047)
    add    x2, x2, x6
    # Test Instruction 
    sd      x1, 2047(x2)
    # Check results:  mem[test_46_res+16] = 0x0000000000000000
    ld x7, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x5)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x3, x5,24
    li     x6, MASK_XLEN(2)
    add    x3, x3, x6
    # Test Instruction 
    sd      x2, -2(x3)
    # Check results:  mem[test_46_res+24] = 0x0000000000000000
    ld x7, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x5)
    # Load values and compute offsets
    li      x3, 0x0
    addi    x4, x5,32
    li     x6, MASK_XLEN(3)
    add    x4, x4, x6
    # Test Instruction 
    sd      x3, -3(x4)
    # Check results:  mem[test_46_res+32] = 0x0000000000000000
    ld x7, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x4, 0x0
    addi    x5, x1,0
    li     x2, MASK_XLEN(5)
    add    x5, x5, x2
    # Test Instruction 
    sd      x4, -5(x5)
    # Check results:  mem[test_47_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x5, 0x0
    addi    x6, x1,8
    li     x2, MASK_XLEN(9)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, -9(x6)
    # Check results:  mem[test_47_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x6, 0x0
    addi    x7, x1,16
    li     x2, MASK_XLEN(17)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, -17(x7)
    # Check results:  mem[test_47_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x7, 0x0
    addi    x8, x1,24
    li     x2, MASK_XLEN(33)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -33(x8)
    # Check results:  mem[test_47_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x9, x1,32
    li     x2, MASK_XLEN(65)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, -65(x9)
    # Check results:  mem[test_47_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(129)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, -129(x10)
    # Check results:  mem[test_48_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(257)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -257(x11)
    # Check results:  mem[test_48_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(513)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -513(x12)
    # Check results:  mem[test_48_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x13, x1,24
    li     x2, MASK_XLEN(1025)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -1025(x13)
    # Check results:  mem[test_48_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x14, x1,32
    li     x2, MASK_XLEN(-2047)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, 2047(x14)
    # Check results:  mem[test_48_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(2)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -2(x15)
    # Check results:  mem[test_49_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x16, x1,8
    li     x2, MASK_XLEN(3)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -3(x16)
    # Check results:  mem[test_49_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x16, 0x0
    addi    x17, x1,16
    li     x2, MASK_XLEN(5)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -5(x17)
    # Check results:  mem[test_49_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x17, 0x0
    addi    x18, x1,24
    li     x2, MASK_XLEN(9)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -9(x18)
    # Check results:  mem[test_49_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x18, 0x0
    addi    x19, x1,32
    li     x2, MASK_XLEN(17)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, -17(x19)
    # Check results:  mem[test_49_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x19, 0x0
    addi    x20, x1,0
    li     x2, MASK_XLEN(33)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -33(x20)
    # Check results:  mem[test_50_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x20, 0x0
    addi    x21, x1,8
    li     x2, MASK_XLEN(65)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -65(x21)
    # Check results:  mem[test_50_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x21, 0x0
    addi    x22, x1,16
    li     x2, MASK_XLEN(129)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -129(x22)
    # Check results:  mem[test_50_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x22, 0x0
    addi    x23, x1,24
    li     x2, MASK_XLEN(257)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -257(x23)
    # Check results:  mem[test_50_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x23, 0x0
    addi    x24, x1,32
    li     x2, MASK_XLEN(513)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -513(x24)
    # Check results:  mem[test_50_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x24, 0x0
    addi    x25, x1,0
    li     x2, MASK_XLEN(1025)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -1025(x25)
    # Check results:  mem[test_51_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x25, 0x0
    addi    x26, x1,8
    li     x2, MASK_XLEN(-2047)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, 2047(x26)
    # Check results:  mem[test_51_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x26, 0x0
    addi    x27, x1,16
    li     x2, MASK_XLEN(2)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -2(x27)
    # Check results:  mem[test_51_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x27, 0x0
    addi    x28, x1,24
    li     x2, MASK_XLEN(3)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -3(x28)
    # Check results:  mem[test_51_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x28, 0x0
    addi    x29, x1,32
    li     x2, MASK_XLEN(5)
    add    x29, x29, x2
    # Test Instruction 
    sd      x28, -5(x29)
    # Check results:  mem[test_51_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x4,signature_52_0)

    # Clear memory
    sd      x0, 0(x4)
    # Load values and compute offsets
    li      x29, 0x0
    addi    x30, x4,0
    li     x5, MASK_XLEN(9)
    add    x30, x30, x5
    # Test Instruction 
    sd      x29, -9(x30)
    # Check results:  mem[test_52_res+0] = 0x0000000000000000
    ld x6, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x4)
    # Load values and compute offsets
    li      x30, 0x0
    addi    x31, x4,8
    li     x5, MASK_XLEN(17)
    add    x31, x31, x5
    # Test Instruction 
    sd      x30, -17(x31)
    # Check results:  mem[test_52_res+8] = 0x0000000000000000
    ld x6, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x4)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x1, x4,16
    li     x5, MASK_XLEN(33)
    add    x1, x1, x5
    # Test Instruction 
    sd      x2, -33(x1)
    # Check results:  mem[test_52_res+16] = 0x0000000000000000
    ld x6, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x4)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x4,24
    li     x5, MASK_XLEN(65)
    add    x2, x2, x5
    # Test Instruction 
    sd      x1, -65(x2)
    # Check results:  mem[test_52_res+24] = 0x0000000000000000
    ld x6, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x4)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x3, x4,32
    li     x5, MASK_XLEN(129)
    add    x3, x3, x5
    # Test Instruction 
    sd      x2, -129(x3)
    # Check results:  mem[test_52_res+32] = 0x0000000000000000
    ld x6, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x3, 0x0
    addi    x4, x1,0
    li     x2, MASK_XLEN(257)
    add    x4, x4, x2
    # Test Instruction 
    sd      x3, -257(x4)
    # Check results:  mem[test_53_res+0] = 0x0000000000000000
    ld x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x4, 0x0
    addi    x5, x1,8
    li     x2, MASK_XLEN(513)
    add    x5, x5, x2
    # Test Instruction 
    sd      x4, -513(x5)
    # Check results:  mem[test_53_res+8] = 0x0000000000000000
    ld x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x5, 0x0
    addi    x6, x1,16
    li     x2, MASK_XLEN(1025)
    add    x6, x6, x2
    # Test Instruction 
    sd      x5, -1025(x6)
    # Check results:  mem[test_53_res+16] = 0x0000000000000000
    ld x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x6, 0x0
    addi    x7, x1,24
    li     x2, MASK_XLEN(-2047)
    add    x7, x7, x2
    # Test Instruction 
    sd      x6, 2047(x7)
    # Check results:  mem[test_53_res+24] = 0x0000000000000000
    ld x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x7, 0x0
    addi    x8, x1,32
    li     x2, MASK_XLEN(2)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -2(x8)
    # Check results:  mem[test_53_res+32] = 0x0000000000000000
    ld x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(3)
    add    x9, x9, x2
    # Test Instruction 
    sd      x8, -3(x9)
    # Check results:  mem[test_54_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(5)
    add    x10, x10, x2
    # Test Instruction 
    sd      x9, -5(x10)
    # Check results:  mem[test_54_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x11, x1,16
    li     x2, MASK_XLEN(9)
    add    x11, x11, x2
    # Test Instruction 
    sd      x10, -9(x11)
    # Check results:  mem[test_54_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x12, x1,24
    li     x2, MASK_XLEN(17)
    add    x12, x12, x2
    # Test Instruction 
    sd      x11, -17(x12)
    # Check results:  mem[test_54_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x13, x1,32
    li     x2, MASK_XLEN(33)
    add    x13, x13, x2
    # Test Instruction 
    sd      x12, -33(x13)
    # Check results:  mem[test_54_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(65)
    add    x14, x14, x2
    # Test Instruction 
    sd      x13, -65(x14)
    # Check results:  mem[test_55_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(129)
    add    x15, x15, x2
    # Test Instruction 
    sd      x14, -129(x15)
    # Check results:  mem[test_55_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x16, x1,16
    li     x2, MASK_XLEN(257)
    add    x16, x16, x2
    # Test Instruction 
    sd      x15, -257(x16)
    # Check results:  mem[test_55_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x16, 0x0
    addi    x17, x1,24
    li     x2, MASK_XLEN(513)
    add    x17, x17, x2
    # Test Instruction 
    sd      x16, -513(x17)
    # Check results:  mem[test_55_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x17, 0x0
    addi    x18, x1,32
    li     x2, MASK_XLEN(1025)
    add    x18, x18, x2
    # Test Instruction 
    sd      x17, -1025(x18)
    # Check results:  mem[test_55_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x18, 0x0
    addi    x19, x1,0
    li     x2, MASK_XLEN(-2047)
    add    x19, x19, x2
    # Test Instruction 
    sd      x18, 2047(x19)
    # Check results:  mem[test_56_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x19, 0x0
    addi    x20, x1,8
    li     x2, MASK_XLEN(2)
    add    x20, x20, x2
    # Test Instruction 
    sd      x19, -2(x20)
    # Check results:  mem[test_56_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x20, 0x0
    addi    x21, x1,16
    li     x2, MASK_XLEN(3)
    add    x21, x21, x2
    # Test Instruction 
    sd      x20, -3(x21)
    # Check results:  mem[test_56_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x21, 0x0
    addi    x22, x1,24
    li     x2, MASK_XLEN(5)
    add    x22, x22, x2
    # Test Instruction 
    sd      x21, -5(x22)
    # Check results:  mem[test_56_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x22, 0x0
    addi    x23, x1,32
    li     x2, MASK_XLEN(9)
    add    x23, x23, x2
    # Test Instruction 
    sd      x22, -9(x23)
    # Check results:  mem[test_56_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x23, 0x0
    addi    x24, x1,0
    li     x2, MASK_XLEN(17)
    add    x24, x24, x2
    # Test Instruction 
    sd      x23, -17(x24)
    # Check results:  mem[test_57_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x24, 0x0
    addi    x25, x1,8
    li     x2, MASK_XLEN(33)
    add    x25, x25, x2
    # Test Instruction 
    sd      x24, -33(x25)
    # Check results:  mem[test_57_res+8] = 0x0000000000000000
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x25, 0x0
    addi    x26, x1,16
    li     x2, MASK_XLEN(65)
    add    x26, x26, x2
    # Test Instruction 
    sd      x25, -65(x26)
    # Check results:  mem[test_57_res+16] = 0x0000000000000000
    ld x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x26, 0x0
    addi    x27, x1,24
    li     x2, MASK_XLEN(129)
    add    x27, x27, x2
    # Test Instruction 
    sd      x26, -129(x27)
    # Check results:  mem[test_57_res+24] = 0x0000000000000000
    ld x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x27, 0x0
    addi    x28, x1,32
    li     x2, MASK_XLEN(257)
    add    x28, x28, x2
    # Test Instruction 
    sd      x27, -257(x28)
    # Check results:  mem[test_57_res+32] = 0x0000000000000000
    ld x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)



    

    RVTEST_SIGBASE(x3,signature_58_0)

    # Clear memory
    sd      x0, 0(x3)
    # Load values and compute offsets
    li      x28, 0x0
    addi    x29, x3,0
    li     x4, MASK_XLEN(513)
    add    x29, x29, x4
    # Test Instruction 
    sd      x28, -513(x29)
    # Check results:  mem[test_58_res+0] = 0x0000000000000000
    ld x5, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x3)
    # Load values and compute offsets
    li      x29, 0x0
    addi    x30, x3,8
    li     x4, MASK_XLEN(1025)
    add    x30, x30, x4
    # Test Instruction 
    sd      x29, -1025(x30)
    # Check results:  mem[test_58_res+8] = 0x0000000000000000
    ld x5, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x3)
    # Load values and compute offsets
    li      x30, 0x0
    addi    x31, x3,16
    li     x4, MASK_XLEN(-2047)
    add    x31, x31, x4
    # Test Instruction 
    sd      x30, 2047(x31)
    # Check results:  mem[test_58_res+16] = 0x0000000000000000
    ld x5, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x3)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x1, x3,24
    li     x4, MASK_XLEN(2)
    add    x1, x1, x4
    # Test Instruction 
    sd      x2, -2(x1)
    # Check results:  mem[test_58_res+24] = 0x0000000000000000
    ld x5, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x3)
    # Load values and compute offsets
    li      x1, 0x0
    addi    x2, x3,32
    li     x4, MASK_XLEN(3)
    add    x2, x2, x4
    # Test Instruction 
    sd      x1, -3(x2)
    # Check results:  mem[test_58_res+32] = 0x0000000000000000
    ld x5, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x2, 0x0
    addi    x3, x1,0
    li     x8, MASK_XLEN(5)
    add    x3, x3, x8
    # Test Instruction 
    sd      x2, -5(x3)
    # Check results:  mem[test_59_res+0] = 0x0000000000000000
    ld x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x3, 0x0
    addi    x4, x1,8
    li     x8, MASK_XLEN(9)
    add    x4, x4, x8
    # Test Instruction 
    sd      x3, -9(x4)
    # Check results:  mem[test_59_res+8] = 0x0000000000000000
    ld x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 16(x1)
    # Load values and compute offsets
    li      x4, 0x0
    addi    x5, x1,16
    li     x8, MASK_XLEN(17)
    add    x5, x5, x8
    # Test Instruction 
    sd      x4, -17(x5)
    # Check results:  mem[test_59_res+16] = 0x0000000000000000
    ld x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 24(x1)
    # Load values and compute offsets
    li      x5, 0x0
    addi    x6, x1,24
    li     x8, MASK_XLEN(33)
    add    x6, x6, x8
    # Test Instruction 
    sd      x5, -33(x6)
    # Check results:  mem[test_59_res+24] = 0x0000000000000000
    ld x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)

    # Clear memory
    sd      x0, 32(x1)
    # Load values and compute offsets
    li      x6, 0x0
    addi    x7, x1,32
    li     x8, MASK_XLEN(65)
    add    x7, x7, x8
    # Test Instruction 
    sd      x6, -65(x7)
    # Check results:  mem[test_59_res+32] = 0x0000000000000000
    ld x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x9, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Clear memory
    sd      x0, 0(x1)
    # Load values and compute offsets
    li      x7, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    # Test Instruction 
    sd      x7, -129(x8)
    # Check results:  mem[test_60_res+0] = 0x0000000000000000
    ld x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0000000000000000)

    # Clear memory
    sd      x0, 8(x1)
    # Load values and compute offsets
    li      x0, 0x5a5bb7368b4ecba8
    addi    x26, x1,8
    li     x2, MASK_XLEN(-2021)
    add    x26, x26, x2
    # Test Instruction 
    sd      x0, 2021(x26)
    # Check results:  mem[test_60_res+8] = 0
    ld x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0)

	
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

