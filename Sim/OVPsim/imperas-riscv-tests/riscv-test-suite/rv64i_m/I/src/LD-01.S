// RISC-V Architectural Validation Test LD-01
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
// Description: Testing instruction 'LD'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",ld)

    RVTEST_SIGBASE(x4,signature_1_0)

    # Testcase 0:  imm:0xd27, result rd:x19(0xfffffffffffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x5, MASK_XLEN(729)
    add    x29, x29, x5
    ld x19, -729(x29)
    sd x19, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x19, 0xfffffffffffffffe)

    # Testcase 1:  imm:0xa51, result rd:x30(0xfffffffffffffffd)
    la  x21, test_data
    addi    x21, x21,8
    li     x5, MASK_XLEN(1455)
    add    x21, x21, x5
    ld x30, -1455(x21)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x30, 0xfffffffffffffffd)

    # Testcase 2:  imm:0xc65, result rd:x10(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,16
    li     x5, MASK_XLEN(923)
    add    x2, x2, x5
    ld x10, -923(x2)
    sd x10, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x10, 0xfffffffffffffffb)

    # Testcase 3:  imm:0xa64, result rd:x3(0xfffffffffffffff7)
    la  x1, test_data
    addi    x1, x1,24
    li     x5, MASK_XLEN(1436)
    add    x1, x1, x5
    ld x3, -1436(x1)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xfffffffffffffff7)

    # Testcase 4:  imm:0xc1e, result rd:x29(0xffffffffffffffef)
    la  x6, test_data
    addi    x6, x6,32
    li     x5, MASK_XLEN(994)
    add    x6, x6, x5
    ld x29, -994(x6)
    sd x29, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x29, 0xffffffffffffffef)



    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0xadf, result rd:x0(0x0000000000000000)
    la  x14, test_data
    addi    x14, x14,40
    li     x2, MASK_XLEN(1313)
    add    x14, x14, x2
    ld x0, -1313(x14)
    sd x0, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)

    # Testcase 6:  imm:0xae7, result rd:x4(0xffffffffffffffbf)
    la  x12, test_data
    addi    x12, x12,48
    li     x2, MASK_XLEN(1305)
    add    x12, x12, x2
    ld x4, -1305(x12)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x3d1, result rd:x25(0xffffffffffffff7f)
    la  x3, test_data
    addi    x3, x3,56
    li     x2, MASK_XLEN(-977)
    add    x3, x3, x2
    ld x25, 977(x3)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0xffffffffffffff7f)

    # Testcase 8:  imm:0xff4, result rd:x18(0xfffffffffffffeff)
    la  x19, test_data
    addi    x19, x19,64
    li     x2, MASK_XLEN(12)
    add    x19, x19, x2
    ld x18, -12(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffffffeff)

    # Testcase 9:  imm:0x4c0, result rd:x7(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,72
    li     x2, MASK_XLEN(-1216)
    add    x10, x10, x2
    ld x7, 1216(x10)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x7, 0xfffffffffffffdff)



    

    RVTEST_SIGBASE(x3,signature_3_0)

    # Testcase 10:  imm:0x63e, result rd:x31(0xfffffffffffffeff)
    la  x18, test_data
    addi    x18, x18,80
    li     x4, MASK_XLEN(-1598)
    add    x18, x18, x4
    ld x31, 1598(x18)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x9ae, result rd:x23(0xfffffffffffff7ff)
    la  x1, test_data
    addi    x1, x1,88
    li     x4, MASK_XLEN(1618)
    add    x1, x1, x4
    ld x23, -1618(x1)
    sd x23, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x23, 0xfffffffffffff7ff)

    # Testcase 12:  imm:0x650, result rd:x21(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,96
    li     x4, MASK_XLEN(-1616)
    add    x2, x2, x4
    ld x21, 1616(x2)
    sd x21, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0xffffffffffffefff)

    # Testcase 13:  imm:0x71, result rd:x30(0xffffffffffffdfff)
    la  x1, test_data
    addi    x1, x1,104
    li     x4, MASK_XLEN(-113)
    add    x1, x1, x4
    ld x30, 113(x1)
    sd x30, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffffffffdfff)

    # Testcase 14:  imm:0xdd8, result rd:x17(0xffffffffffffefff)
    la  x1, test_data
    addi    x1, x1,112
    li     x4, MASK_XLEN(552)
    add    x1, x1, x4
    ld x17, -552(x1)
    sd x17, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0xb6d, result rd:x6(0xffffffffffff7fff)
    la  x12, test_data
    addi    x12, x12,120
    li     x4, MASK_XLEN(1171)
    add    x12, x12, x4
    ld x6, -1171(x12)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0xffffffffffff7fff)

    # Testcase 16:  imm:0x8a5, result rd:x22(0xfffffffffffeffff)
    la  x10, test_data
    addi    x10, x10,128
    li     x4, MASK_XLEN(1883)
    add    x10, x10, x4
    ld x22, -1883(x10)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0xfffffffffffeffff)

    # Testcase 17:  imm:0x621, result rd:x2(0xfffffffffffdffff)
    la  x8, test_data
    addi    x8, x8,136
    li     x4, MASK_XLEN(-1569)
    add    x8, x8, x4
    ld x2, 1569(x8)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0xfffffffffffdffff)

    # Testcase 18:  imm:0xba8, result rd:x13(0xfffffffffffbffff)
    la  x8, test_data
    addi    x8, x8,144
    li     x4, MASK_XLEN(1112)
    add    x8, x8, x4
    ld x13, -1112(x8)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x13, 0xfffffffffffbffff)

    # Testcase 19:  imm:0x81b, result rd:x3(0xfffffffffff7ffff)
    la  x14, test_data
    addi    x14, x14,152
    li     x4, MASK_XLEN(2021)
    add    x14, x14, x4
    ld x3, -2021(x14)
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xfffffffffff7ffff)



    

    RVTEST_SIGBASE(x2,signature_5_0)

    # Testcase 20:  imm:0xd8c, result rd:x24(0xffffffffffefffff)
    la  x13, test_data
    addi    x13, x13,160
    li     x5, MASK_XLEN(628)
    add    x13, x13, x5
    ld x24, -628(x13)
    sd x24, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x24, 0xffffffffffefffff)

    # Testcase 21:  imm:0xeb5, result rd:x3(0xffffffffffdfffff)
    la  x18, test_data
    addi    x18, x18,168
    li     x5, MASK_XLEN(331)
    add    x18, x18, x5
    ld x3, -331(x18)
    sd x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffffffffdfffff)

    # Testcase 22:  imm:0xd04, result rd:x14(0xffffffffffbfffff)
    la  x1, test_data
    addi    x1, x1,176
    li     x5, MASK_XLEN(764)
    add    x1, x1, x5
    ld x14, -764(x1)
    sd x14, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x14, 0xffffffffffbfffff)

    # Testcase 23:  imm:0x686, result rd:x20(0xffffffffff7fffff)
    la  x19, test_data
    addi    x19, x19,184
    li     x5, MASK_XLEN(-1670)
    add    x19, x19, x5
    ld x20, 1670(x19)
    sd x20, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x20, 0xffffffffff7fffff)

    # Testcase 24:  imm:0x92c, result rd:x4(0xfffffffffeffffff)
    la  x30, test_data
    addi    x30, x30,192
    li     x5, MASK_XLEN(1748)
    add    x30, x30, x5
    ld x4, -1748(x30)
    sd x4, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0xfffffffffeffffff)



    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 25:  imm:0x156, result rd:x29(0xfffffffffdffffff)
    la  x31, test_data
    addi    x31, x31,200
    li     x5, MASK_XLEN(-342)
    add    x31, x31, x5
    ld x29, 342(x31)
    sd x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0xfffffffffdffffff)

    # Testcase 26:  imm:0x1d4, result rd:x17(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,208
    li     x5, MASK_XLEN(-468)
    add    x2, x2, x5
    ld x17, 468(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x17, 0xfffffffffeffffff)

    # Testcase 27:  imm:0x678, result rd:x22(0xfffffffff7ffffff)
    la  x4, test_data
    addi    x4, x4,216
    li     x5, MASK_XLEN(-1656)
    add    x4, x4, x5
    ld x22, 1656(x4)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x22, 0xfffffffff7ffffff)

    # Testcase 28:  imm:0xddc, result rd:x3(0xffffffffefffffff)
    la  x20, test_data
    addi    x20, x20,224
    li     x5, MASK_XLEN(548)
    add    x20, x20, x5
    ld x3, -548(x20)
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffffffefffffff)

    # Testcase 29:  imm:0x532, result rd:x15(0xffffffffdfffffff)
    la  x14, test_data
    addi    x14, x14,232
    li     x5, MASK_XLEN(-1330)
    add    x14, x14, x5
    ld x15, 1330(x14)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x15, 0xffffffffdfffffff)



    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x28(0xffffffffefffffff)
    la  x7, test_data
    addi    x7, x7,240
    li     x2, MASK_XLEN(0)
    add    x7, x7, x2
    ld x28, 0(x7)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffefffffff)

    # Testcase 31:  imm:0xfff, result rd:x14(0xffffffff7fffffff)
    la  x7, test_data
    addi    x7, x7,248
    li     x2, MASK_XLEN(1)
    add    x7, x7, x2
    ld x14, -1(x7)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffff7fffffff)

    # Testcase 32:  imm:0xfff, result rd:x9(0xffffffffffffffff)
    la  x18, test_data
    addi    x18, x18,256
    li     x2, MASK_XLEN(1)
    add    x18, x18, x2
    ld x9, -1(x18)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffffff)

    # Testcase 33:  imm:0xfff, result rd:x10(0xfffffffeffffffff)
    la  x15, test_data
    addi    x15, x15,264
    li     x2, MASK_XLEN(1)
    add    x15, x15, x2
    ld x10, -1(x15)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffeffffffff)

    # Testcase 34:  imm:0x0, result rd:x6(0xfffffffdffffffff)
    la  x23, test_data
    addi    x23, x23,272
    li     x2, MASK_XLEN(0)
    add    x23, x23, x2
    ld x6, 0(x23)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xfffffffdffffffff)



    

    RVTEST_SIGBASE(x3,signature_8_0)

    # Testcase 35:  imm:0xfff, result rd:x0(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,280
    li     x4, MASK_XLEN(1)
    add    x2, x2, x4
    ld x0, -1(x2)
    sd x0, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)

    # Testcase 36:  imm:0xfff, result rd:x19(0xfffffff7ffffffff)
    la  x29, test_data
    addi    x29, x29,288
    li     x4, MASK_XLEN(1)
    add    x29, x29, x4
    ld x19, -1(x29)
    sd x19, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0xfffffff7ffffffff)

    # Testcase 37:  imm:0xfff, result rd:x19(0xffffffefffffffff)
    la  x1, test_data
    addi    x1, x1,296
    li     x4, MASK_XLEN(1)
    add    x1, x1, x4
    ld x19, -1(x1)
    sd x19, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0xffffffefffffffff)

    # Testcase 38:  imm:0x0, result rd:x30(0xffffffdfffffffff)
    la  x28, test_data
    addi    x28, x28,304
    li     x4, MASK_XLEN(0)
    add    x28, x28, x4
    ld x30, 0(x28)
    sd x30, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffdfffffffff)

    # Testcase 39:  imm:0xfff, result rd:x21(0xffffffbfffffffff)
    la  x24, test_data
    addi    x24, x24,312
    li     x4, MASK_XLEN(1)
    add    x24, x24, x4
    ld x21, -1(x24)
    sd x21, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0xffffffbfffffffff)



    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Testcase 40:  imm:0x1, result rd:x1(0xffffff7fffffffff)
    la  x2, test_data
    addi    x2, x2,320
    li     x7, MASK_XLEN(-1)
    add    x2, x2, x7
    ld x1, 1(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0xffffff7fffffffff)

    # Testcase 41:  imm:0x2, result rd:x1(0xfffffeffffffffff)
    la  x2, test_data
    addi    x2, x2,328
    li     x7, MASK_XLEN(-2)
    add    x2, x2, x7
    ld x1, 2(x2)
    sd x1, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0xfffffeffffffffff)

    # Testcase 42:  imm:0x4, result rd:x2(0xfffffdffffffffff)
    la  x3, test_data
    addi    x3, x3,336
    li     x7, MASK_XLEN(-4)
    add    x3, x3, x7
    ld x2, 4(x3)
    sd x2, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x2, 0xfffffdffffffffff)

    # Testcase 43:  imm:0x8, result rd:x3(0xfffffeffffffffff)
    la  x4, test_data
    addi    x4, x4,344
    li     x7, MASK_XLEN(-8)
    add    x4, x4, x7
    ld x3, 8(x4)
    sd x3, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xfffffeffffffffff)

    # Testcase 44:  imm:0x10, result rd:x4(0xfffff7ffffffffff)
    la  x5, test_data
    addi    x5, x5,352
    li     x7, MASK_XLEN(-16)
    add    x5, x5, x7
    ld x4, 16(x5)
    sd x4, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0xfffff7ffffffffff)



    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x20, result rd:x5(0xffffefffffffffff)
    la  x6, test_data
    addi    x6, x6,360
    li     x2, MASK_XLEN(-32)
    add    x6, x6, x2
    ld x5, 32(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xffffefffffffffff)

    # Testcase 46:  imm:0x40, result rd:x6(0xffffdfffffffffff)
    la  x7, test_data
    addi    x7, x7,368
    li     x2, MASK_XLEN(-64)
    add    x7, x7, x2
    ld x6, 64(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xffffdfffffffffff)

    # Testcase 47:  imm:0x80, result rd:x7(0xffffefffffffffff)
    la  x8, test_data
    addi    x8, x8,376
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    ld x7, 128(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xffffefffffffffff)

    # Testcase 48:  imm:0x100, result rd:x8(0xffff7fffffffffff)
    la  x9, test_data
    addi    x9, x9,384
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    ld x8, 256(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff7fffffffffff)

    # Testcase 49:  imm:0x200, result rd:x9(0xfffeffffffffffff)
    la  x10, test_data
    addi    x10, x10,392
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    ld x9, 512(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffeffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x400, result rd:x10(0xfffdffffffffffff)
    la  x11, test_data
    addi    x11, x11,400
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    ld x10, 1024(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffdffffffffffff)

    # Testcase 51:  imm:0x800, result rd:x11(0xfffbffffffffffff)
    la  x12, test_data
    addi    x12, x12,408
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    ld x11, -2048(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffbffffffffffff)

    # Testcase 52:  imm:0xffe, result rd:x12(0xfff7ffffffffffff)
    la  x13, test_data
    addi    x13, x13,416
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    ld x12, -2(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff7ffffffffffff)

    # Testcase 53:  imm:0xffd, result rd:x13(0xffefffffffffffff)
    la  x14, test_data
    addi    x14, x14,424
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    ld x13, -3(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffefffffffffffff)

    # Testcase 54:  imm:0xffb, result rd:x14(0xffdfffffffffffff)
    la  x15, test_data
    addi    x15, x15,432
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    ld x14, -5(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffdfffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0xff7, result rd:x15(0xffbfffffffffffff)
    la  x16, test_data
    addi    x16, x16,440
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    ld x15, -9(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffbfffffffffffff)

    # Testcase 56:  imm:0xfef, result rd:x16(0xff7fffffffffffff)
    la  x17, test_data
    addi    x17, x17,448
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    ld x16, -17(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xff7fffffffffffff)

    # Testcase 57:  imm:0xfdf, result rd:x17(0xfeffffffffffffff)
    la  x18, test_data
    addi    x18, x18,456
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    ld x17, -33(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xfeffffffffffffff)

    # Testcase 58:  imm:0xfbf, result rd:x18(0xfdffffffffffffff)
    la  x19, test_data
    addi    x19, x19,464
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    ld x18, -65(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfdffffffffffffff)

    # Testcase 59:  imm:0xf7f, result rd:x19(0xfeffffffffffffff)
    la  x20, test_data
    addi    x20, x20,472
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    ld x19, -129(x20)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xfeffffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0xeff, result rd:x20(0xf7ffffffffffffff)
    la  x21, test_data
    addi    x21, x21,480
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    ld x20, -257(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xf7ffffffffffffff)

    # Testcase 61:  imm:0xdff, result rd:x21(0xefffffffffffffff)
    la  x22, test_data
    addi    x22, x22,488
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    ld x21, -513(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xefffffffffffffff)

    # Testcase 62:  imm:0xbff, result rd:x22(0xdfffffffffffffff)
    la  x23, test_data
    addi    x23, x23,496
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    ld x22, -1025(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xdfffffffffffffff)

    # Testcase 63:  imm:0x7ff, result rd:x23(0xefffffffffffffff)
    la  x24, test_data
    addi    x24, x24,504
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    ld x23, 2047(x24)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xefffffffffffffff)

    # Testcase 64:  imm:0xffe, result rd:x24(0x7fffffffffffffff)
    la  x25, test_data
    addi    x25, x25,512
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    ld x24, -2(x25)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x7fffffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0xffd, result rd:x25(0xffffffffffffffff)
    la  x26, test_data
    addi    x26, x26,520
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    ld x25, -3(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xffffffffffffffff)

    # Testcase 66:  imm:0xffb, result rd:x26(0x0000000000000001)
    la  x27, test_data
    addi    x27, x27,528
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    ld x26, -5(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000000001)

    # Testcase 67:  imm:0xff7, result rd:x27(0x0000000000000002)
    la  x28, test_data
    addi    x28, x28,536
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    ld x27, -9(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000002)

    # Testcase 68:  imm:0xfef, result rd:x28(0x0000000000000004)
    la  x29, test_data
    addi    x29, x29,544
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    ld x28, -17(x29)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000000000004)

    # Testcase 69:  imm:0xfdf, result rd:x29(0x0000000000000008)
    la  x30, test_data
    addi    x30, x30,552
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    ld x29, -33(x30)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0000000000000008)



    

    RVTEST_SIGBASE(x4,signature_15_0)

    # Testcase 70:  imm:0xfbf, result rd:x30(0x0000000000000010)
    la  x31, test_data
    addi    x31, x31,560
    li     x5, MASK_XLEN(65)
    add    x31, x31, x5
    ld x30, -65(x31)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000010)

    # Testcase 71:  imm:0xf7f, result rd:x31(0x0000000000000020)
    la  x1, test_data
    addi    x1, x1,568
    li     x5, MASK_XLEN(129)
    add    x1, x1, x5
    ld x31, -129(x1)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000000000020)

    # Testcase 72:  imm:0xeff, result rd:x1(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,576
    li     x5, MASK_XLEN(257)
    add    x2, x2, x5
    ld x1, -257(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000040)

    # Testcase 73:  imm:0xdff, result rd:x1(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,584
    li     x5, MASK_XLEN(513)
    add    x2, x2, x5
    ld x1, -513(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000080)

    # Testcase 74:  imm:0xbff, result rd:x2(0x0000000000000100)
    la  x3, test_data
    addi    x3, x3,592
    li     x5, MASK_XLEN(1025)
    add    x3, x3, x5
    ld x2, -1025(x3)
    sd x2, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0000000000000100)



    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x7ff, result rd:x3(0x0000000000000200)
    la  x4, test_data
    addi    x4, x4,600
    li     x2, MASK_XLEN(-2047)
    add    x4, x4, x2
    ld x3, 2047(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000000000000200)

    # Testcase 76:  imm:0xffe, result rd:x4(0x0000000000000400)
    la  x5, test_data
    addi    x5, x5,608
    li     x2, MASK_XLEN(2)
    add    x5, x5, x2
    ld x4, -2(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000000400)

    # Testcase 77:  imm:0xffd, result rd:x5(0x0000000000000800)
    la  x6, test_data
    addi    x6, x6,616
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    ld x5, -3(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000000000800)

    # Testcase 78:  imm:0xffb, result rd:x6(0x0000000000001000)
    la  x7, test_data
    addi    x7, x7,624
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    ld x6, -5(x7)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000000000001000)

    # Testcase 79:  imm:0xff7, result rd:x7(0x0000000000002000)
    la  x8, test_data
    addi    x8, x8,632
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    ld x7, -9(x8)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000000000002000)



    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0xfef, result rd:x8(0x0000000000004000)
    la  x9, test_data
    addi    x9, x9,640
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    ld x8, -17(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000004000)

    # Testcase 81:  imm:0xfdf, result rd:x9(0x0000000000008000)
    la  x10, test_data
    addi    x10, x10,648
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    ld x9, -33(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000008000)

    # Testcase 82:  imm:0xfbf, result rd:x10(0x0000000000010000)
    la  x11, test_data
    addi    x11, x11,656
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    ld x10, -65(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000010000)

    # Testcase 83:  imm:0xf7f, result rd:x11(0x0000000000020000)
    la  x12, test_data
    addi    x12, x12,664
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    ld x11, -129(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000020000)

    # Testcase 84:  imm:0xeff, result rd:x12(0x0000000000040000)
    la  x13, test_data
    addi    x13, x13,672
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    ld x12, -257(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000040000)



    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0xdff, result rd:x13(0x0000000000080000)
    la  x14, test_data
    addi    x14, x14,680
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    ld x13, -513(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000080000)

    # Testcase 86:  imm:0xbff, result rd:x14(0x0000000000100000)
    la  x15, test_data
    addi    x15, x15,688
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    ld x14, -1025(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000100000)

    # Testcase 87:  imm:0x7ff, result rd:x15(0x0000000000200000)
    la  x16, test_data
    addi    x16, x16,696
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    ld x15, 2047(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000200000)

    # Testcase 88:  imm:0xffe, result rd:x16(0x0000000000400000)
    la  x17, test_data
    addi    x17, x17,704
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    ld x16, -2(x17)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000400000)

    # Testcase 89:  imm:0xffd, result rd:x17(0x0000000000800000)
    la  x18, test_data
    addi    x18, x18,712
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    ld x17, -3(x18)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000800000)



    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0xffb, result rd:x18(0x0000000001000000)
    la  x19, test_data
    addi    x19, x19,720
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    ld x18, -5(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000001000000)

    # Testcase 91:  imm:0xff7, result rd:x19(0x0000000002000000)
    la  x20, test_data
    addi    x20, x20,728
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    ld x19, -9(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000002000000)

    # Testcase 92:  imm:0xfef, result rd:x20(0x0000000004000000)
    la  x21, test_data
    addi    x21, x21,736
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    ld x20, -17(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000004000000)

    # Testcase 93:  imm:0xfdf, result rd:x21(0x0000000008000000)
    la  x22, test_data
    addi    x22, x22,744
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    ld x21, -33(x22)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000008000000)

    # Testcase 94:  imm:0xfbf, result rd:x22(0x0000000010000000)
    la  x23, test_data
    addi    x23, x23,752
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    ld x22, -65(x23)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000010000000)



    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0xf7f, result rd:x23(0x0000000020000000)
    la  x24, test_data
    addi    x24, x24,760
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    ld x23, -129(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000020000000)

    # Testcase 96:  imm:0xeff, result rd:x24(0x0000000040000000)
    la  x25, test_data
    addi    x25, x25,768
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    ld x24, -257(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000040000000)

    # Testcase 97:  imm:0xdff, result rd:x25(0x0000000080000000)
    la  x26, test_data
    addi    x26, x26,776
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    ld x25, -513(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000080000000)

    # Testcase 98:  imm:0xbff, result rd:x26(0x0000000000000000)
    la  x27, test_data
    addi    x27, x27,784
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    ld x26, -1025(x27)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000000000)

    # Testcase 99:  imm:0x7ff, result rd:x27(0x0000000100000000)
    la  x28, test_data
    addi    x28, x28,792
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    ld x27, 2047(x28)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000100000000)



    

    RVTEST_SIGBASE(x3,signature_21_0)

    # Testcase 100:  imm:0xffe, result rd:x28(0x0000000200000000)
    la  x29, test_data
    addi    x29, x29,800
    li     x4, MASK_XLEN(2)
    add    x29, x29, x4
    ld x28, -2(x29)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0x0000000200000000)

    # Testcase 101:  imm:0xffd, result rd:x29(0x0000000400000000)
    la  x30, test_data
    addi    x30, x30,808
    li     x4, MASK_XLEN(3)
    add    x30, x30, x4
    ld x29, -3(x30)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x0000000400000000)

    # Testcase 102:  imm:0xffb, result rd:x30(0x0000000800000000)
    la  x31, test_data
    addi    x31, x31,816
    li     x4, MASK_XLEN(5)
    add    x31, x31, x4
    ld x30, -5(x31)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000800000000)

    # Testcase 103:  imm:0xff7, result rd:x31(0x0000001000000000)
    la  x1, test_data
    addi    x1, x1,824
    li     x4, MASK_XLEN(9)
    add    x1, x1, x4
    ld x31, -9(x1)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000001000000000)

    # Testcase 104:  imm:0xfef, result rd:x1(0x0000002000000000)
    la  x2, test_data
    addi    x2, x2,832
    li     x4, MASK_XLEN(17)
    add    x2, x2, x4
    ld x1, -17(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000002000000000)



    

    RVTEST_SIGBASE(x7,signature_22_0)

    # Testcase 105:  imm:0xfdf, result rd:x1(0x0000004000000000)
    la  x2, test_data
    addi    x2, x2,840
    li     x8, MASK_XLEN(33)
    add    x2, x2, x8
    ld x1, -33(x2)
    sd x1, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x1, 0x0000004000000000)

    # Testcase 106:  imm:0xfbf, result rd:x2(0x0000008000000000)
    la  x3, test_data
    addi    x3, x3,848
    li     x8, MASK_XLEN(65)
    add    x3, x3, x8
    ld x2, -65(x3)
    sd x2, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0x0000008000000000)

    # Testcase 107:  imm:0xf7f, result rd:x3(0x0000010000000000)
    la  x4, test_data
    addi    x4, x4,856
    li     x8, MASK_XLEN(129)
    add    x4, x4, x8
    ld x3, -129(x4)
    sd x3, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000010000000000)

    # Testcase 108:  imm:0xeff, result rd:x4(0x0000020000000000)
    la  x5, test_data
    addi    x5, x5,864
    li     x8, MASK_XLEN(257)
    add    x5, x5, x8
    ld x4, -257(x5)
    sd x4, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000020000000000)

    # Testcase 109:  imm:0xdff, result rd:x5(0x0000040000000000)
    la  x6, test_data
    addi    x6, x6,872
    li     x8, MASK_XLEN(513)
    add    x6, x6, x8
    ld x5, -513(x6)
    sd x5, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000040000000000)



    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0xbff, result rd:x6(0x0000080000000000)
    la  x7, test_data
    addi    x7, x7,880
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    ld x6, -1025(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000080000000000)

    # Testcase 111:  imm:0x7ff, result rd:x7(0x0000100000000000)
    la  x8, test_data
    addi    x8, x8,888
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    ld x7, 2047(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000100000000000)

    # Testcase 112:  imm:0xffe, result rd:x8(0x0000200000000000)
    la  x9, test_data
    addi    x9, x9,896
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    ld x8, -2(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000200000000000)

    # Testcase 113:  imm:0xffd, result rd:x9(0x0000400000000000)
    la  x10, test_data
    addi    x10, x10,904
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    ld x9, -3(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000400000000000)

    # Testcase 114:  imm:0xffb, result rd:x10(0x0000800000000000)
    la  x11, test_data
    addi    x11, x11,912
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    ld x10, -5(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000800000000000)



    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0xff7, result rd:x11(0x0001000000000000)
    la  x12, test_data
    addi    x12, x12,920
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    ld x11, -9(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0001000000000000)

    # Testcase 116:  imm:0xfef, result rd:x12(0x0002000000000000)
    la  x13, test_data
    addi    x13, x13,928
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    ld x12, -17(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0002000000000000)

    # Testcase 117:  imm:0xfdf, result rd:x13(0x0004000000000000)
    la  x14, test_data
    addi    x14, x14,936
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    ld x13, -33(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0004000000000000)

    # Testcase 118:  imm:0xfbf, result rd:x14(0x0008000000000000)
    la  x15, test_data
    addi    x15, x15,944
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    ld x14, -65(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0008000000000000)

    # Testcase 119:  imm:0xf7f, result rd:x15(0x0010000000000000)
    la  x16, test_data
    addi    x16, x16,952
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    ld x15, -129(x16)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0010000000000000)



    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0xeff, result rd:x16(0x0020000000000000)
    la  x17, test_data
    addi    x17, x17,960
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    ld x16, -257(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0020000000000000)

    # Testcase 121:  imm:0xdff, result rd:x17(0x0040000000000000)
    la  x18, test_data
    addi    x18, x18,968
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    ld x17, -513(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0040000000000000)

    # Testcase 122:  imm:0xbff, result rd:x18(0x0080000000000000)
    la  x19, test_data
    addi    x19, x19,976
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    ld x18, -1025(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0080000000000000)

    # Testcase 123:  imm:0x7ff, result rd:x19(0x0100000000000000)
    la  x20, test_data
    addi    x20, x20,984
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    ld x19, 2047(x20)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0100000000000000)

    # Testcase 124:  imm:0xffe, result rd:x20(0x0200000000000000)
    la  x21, test_data
    addi    x21, x21,992
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    ld x20, -2(x21)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0200000000000000)



    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0xffd, result rd:x21(0x0400000000000000)
    la  x22, test_data
    addi    x22, x22,1000
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    ld x21, -3(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0400000000000000)

    # Testcase 126:  imm:0xffb, result rd:x22(0x0800000000000000)
    la  x23, test_data
    addi    x23, x23,1008
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    ld x22, -5(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0800000000000000)

    # Testcase 127:  imm:0xff7, result rd:x23(0x1000000000000000)
    la  x24, test_data
    addi    x24, x24,1016
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    ld x23, -9(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x1000000000000000)

    # Testcase 128:  imm:0xfef, result rd:x24(0x2000000000000000)
    la  x25, test_data
    addi    x25, x25,1024
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    ld x24, -17(x25)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x2000000000000000)

    # Testcase 129:  imm:0xfdf, result rd:x25(0x4000000000000000)
    la  x26, test_data
    addi    x26, x26,1032
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    ld x25, -33(x26)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x4000000000000000)



    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 130:  imm:0xfbf, result rd:x26(0x8000000000000000)
    la  x27, test_data
    addi    x27, x27,1040
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    ld x26, -65(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x8000000000000000)

    # Testcase 131:  imm:0xf7f, result rd:x27(0x0000000000000000)
    la  x28, test_data
    addi    x28, x28,1048
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    ld x27, -129(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000000)

    # Testcase 132:  imm:0xeff, result rd:x28(0xfffffffffffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x2, MASK_XLEN(257)
    add    x29, x29, x2
    ld x28, -257(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xfffffffffffffffe)

    # Testcase 133:  imm:0xdff, result rd:x29(0xfffffffffffffffd)
    la  x30, test_data
    addi    x30, x30,8
    li     x2, MASK_XLEN(513)
    add    x30, x30, x2
    ld x29, -513(x30)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0xfffffffffffffffd)

    # Testcase 134:  imm:0xbff, result rd:x30(0xfffffffffffffffb)
    la  x31, test_data
    addi    x31, x31,16
    li     x2, MASK_XLEN(1025)
    add    x31, x31, x2
    ld x30, -1025(x31)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x5,signature_28_0)

    # Testcase 135:  imm:0x7ff, result rd:x31(0xfffffffffffffff7)
    la  x1, test_data
    addi    x1, x1,24
    li     x6, MASK_XLEN(-2047)
    add    x1, x1, x6
    ld x31, 2047(x1)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0xfffffffffffffff7)

    # Testcase 136:  imm:0xffe, result rd:x1(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,32
    li     x6, MASK_XLEN(2)
    add    x2, x2, x6
    ld x1, -2(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffffffffef)

    # Testcase 137:  imm:0xffd, result rd:x1(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,40
    li     x6, MASK_XLEN(3)
    add    x2, x2, x6
    ld x1, -3(x2)
    sd x1, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffffffffdf)

    # Testcase 138:  imm:0xffb, result rd:x2(0xffffffffffffffbf)
    la  x3, test_data
    addi    x3, x3,48
    li     x6, MASK_XLEN(5)
    add    x3, x3, x6
    ld x2, -5(x3)
    sd x2, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0xffffffffffffffbf)

    # Testcase 139:  imm:0xff7, result rd:x3(0xffffffffffffff7f)
    la  x4, test_data
    addi    x4, x4,56
    li     x6, MASK_XLEN(9)
    add    x4, x4, x6
    ld x3, -9(x4)
    sd x3, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffffffff7f)



    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0xfef, result rd:x4(0xfffffffffffffeff)
    la  x5, test_data
    addi    x5, x5,64
    li     x2, MASK_XLEN(17)
    add    x5, x5, x2
    ld x4, -17(x5)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffffffffffeff)

    # Testcase 141:  imm:0xfdf, result rd:x5(0xfffffffffffffdff)
    la  x6, test_data
    addi    x6, x6,72
    li     x2, MASK_XLEN(33)
    add    x6, x6, x2
    ld x5, -33(x6)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xfffffffffffffdff)

    # Testcase 142:  imm:0xfbf, result rd:x6(0xfffffffffffffeff)
    la  x7, test_data
    addi    x7, x7,80
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    ld x6, -65(x7)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xfffffffffffffeff)

    # Testcase 143:  imm:0xf7f, result rd:x7(0xfffffffffffff7ff)
    la  x8, test_data
    addi    x8, x8,88
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    ld x7, -129(x8)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffffffffff7ff)

    # Testcase 144:  imm:0xeff, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,96
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    ld x8, -257(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0xdff, result rd:x9(0xffffffffffffdfff)
    la  x10, test_data
    addi    x10, x10,104
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    ld x9, -513(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffdfff)

    # Testcase 146:  imm:0xbff, result rd:x10(0xffffffffffffefff)
    la  x11, test_data
    addi    x11, x11,112
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    ld x10, -1025(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffefff)

    # Testcase 147:  imm:0x7ff, result rd:x11(0xffffffffffff7fff)
    la  x12, test_data
    addi    x12, x12,120
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    ld x11, 2047(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffff7fff)

    # Testcase 148:  imm:0xffe, result rd:x12(0xfffffffffffeffff)
    la  x13, test_data
    addi    x13, x13,128
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    ld x12, -2(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffeffff)

    # Testcase 149:  imm:0xffd, result rd:x13(0xfffffffffffdffff)
    la  x14, test_data
    addi    x14, x14,136
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    ld x13, -3(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffdffff)



    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0xffb, result rd:x14(0xfffffffffffbffff)
    la  x15, test_data
    addi    x15, x15,144
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    ld x14, -5(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffbffff)

    # Testcase 151:  imm:0xff7, result rd:x15(0xfffffffffff7ffff)
    la  x16, test_data
    addi    x16, x16,152
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    ld x15, -9(x16)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffff7ffff)

    # Testcase 152:  imm:0xfef, result rd:x16(0xffffffffffefffff)
    la  x17, test_data
    addi    x17, x17,160
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    ld x16, -17(x17)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xffffffffffefffff)

    # Testcase 153:  imm:0xfdf, result rd:x17(0xffffffffffdfffff)
    la  x18, test_data
    addi    x18, x18,168
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    ld x17, -33(x18)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xffffffffffdfffff)

    # Testcase 154:  imm:0xfbf, result rd:x18(0xffffffffffbfffff)
    la  x19, test_data
    addi    x19, x19,176
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    ld x18, -65(x19)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xffffffffffbfffff)



    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0xf7f, result rd:x19(0xffffffffff7fffff)
    la  x20, test_data
    addi    x20, x20,184
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    ld x19, -129(x20)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xffffffffff7fffff)

    # Testcase 156:  imm:0xeff, result rd:x20(0xfffffffffeffffff)
    la  x21, test_data
    addi    x21, x21,192
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    ld x20, -257(x21)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xfffffffffeffffff)

    # Testcase 157:  imm:0xdff, result rd:x21(0xfffffffffdffffff)
    la  x22, test_data
    addi    x22, x22,200
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    ld x21, -513(x22)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xfffffffffdffffff)

    # Testcase 158:  imm:0xbff, result rd:x22(0xfffffffffeffffff)
    la  x23, test_data
    addi    x23, x23,208
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    ld x22, -1025(x23)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xfffffffffeffffff)

    # Testcase 159:  imm:0x7ff, result rd:x23(0xfffffffff7ffffff)
    la  x24, test_data
    addi    x24, x24,216
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    ld x23, 2047(x24)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xfffffffff7ffffff)



    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 160:  imm:0xffe, result rd:x24(0xffffffffefffffff)
    la  x25, test_data
    addi    x25, x25,224
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    ld x24, -2(x25)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xffffffffefffffff)

    # Testcase 161:  imm:0xffd, result rd:x25(0xffffffffdfffffff)
    la  x26, test_data
    addi    x26, x26,232
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    ld x25, -3(x26)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xffffffffdfffffff)

    # Testcase 162:  imm:0xffb, result rd:x26(0xffffffffefffffff)
    la  x27, test_data
    addi    x27, x27,240
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    ld x26, -5(x27)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xffffffffefffffff)

    # Testcase 163:  imm:0xff7, result rd:x27(0xffffffff7fffffff)
    la  x28, test_data
    addi    x28, x28,248
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    ld x27, -9(x28)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0xffffffff7fffffff)

    # Testcase 164:  imm:0xfef, result rd:x28(0xffffffffffffffff)
    la  x29, test_data
    addi    x29, x29,256
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    ld x28, -17(x29)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffffffffff)



    

    RVTEST_SIGBASE(x3,signature_34_0)

    # Testcase 165:  imm:0xfdf, result rd:x29(0xfffffffeffffffff)
    la  x30, test_data
    addi    x30, x30,264
    li     x4, MASK_XLEN(33)
    add    x30, x30, x4
    ld x29, -33(x30)
    sd x29, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0xfffffffeffffffff)

    # Testcase 166:  imm:0xfbf, result rd:x30(0xfffffffdffffffff)
    la  x31, test_data
    addi    x31, x31,272
    li     x4, MASK_XLEN(65)
    add    x31, x31, x4
    ld x30, -65(x31)
    sd x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xfffffffdffffffff)

    # Testcase 167:  imm:0xf7f, result rd:x31(0xfffffffbffffffff)
    la  x1, test_data
    addi    x1, x1,280
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    ld x31, -129(x1)
    sd x31, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xfffffffbffffffff)

    # Testcase 168:  imm:0x1, result rd:x1(0xfffffff7ffffffff)
    la  x2, test_data
    addi    x2, x2,288
    li     x4, MASK_XLEN(-1)
    add    x2, x2, x4
    ld x1, 1(x2)
    sd x1, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffff7ffffffff)

    # Testcase 169:  imm:0x2, result rd:x1(0xffffffefffffffff)
    la  x2, test_data
    addi    x2, x2,296
    li     x4, MASK_XLEN(-2)
    add    x2, x2, x4
    ld x1, 2(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffefffffffff)



    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x4, result rd:x2(0xffffffdfffffffff)
    la  x3, test_data
    addi    x3, x3,304
    li     x8, MASK_XLEN(-4)
    add    x3, x3, x8
    ld x2, 4(x3)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0xffffffdfffffffff)

    # Testcase 171:  imm:0x8, result rd:x3(0xffffffbfffffffff)
    la  x4, test_data
    addi    x4, x4,312
    li     x8, MASK_XLEN(-8)
    add    x4, x4, x8
    ld x3, 8(x4)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xffffffbfffffffff)

    # Testcase 172:  imm:0x10, result rd:x4(0xffffff7fffffffff)
    la  x5, test_data
    addi    x5, x5,320
    li     x8, MASK_XLEN(-16)
    add    x5, x5, x8
    ld x4, 16(x5)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xffffff7fffffffff)

    # Testcase 173:  imm:0x20, result rd:x5(0xfffffeffffffffff)
    la  x6, test_data
    addi    x6, x6,328
    li     x8, MASK_XLEN(-32)
    add    x6, x6, x8
    ld x5, 32(x6)
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xfffffeffffffffff)

    # Testcase 174:  imm:0x40, result rd:x6(0xfffffdffffffffff)
    la  x7, test_data
    addi    x7, x7,336
    li     x8, MASK_XLEN(-64)
    add    x7, x7, x8
    ld x6, 64(x7)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xfffffdffffffffff)



    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0x80, result rd:x7(0xfffffeffffffffff)
    la  x8, test_data
    addi    x8, x8,344
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    ld x7, 128(x8)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffeffffffffff)

    # Testcase 176:  imm:0x100, result rd:x8(0xfffff7ffffffffff)
    la  x9, test_data
    addi    x9, x9,352
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    ld x8, 256(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffff7ffffffffff)

    # Testcase 177:  imm:0x200, result rd:x9(0xffffefffffffffff)
    la  x10, test_data
    addi    x10, x10,360
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    ld x9, 512(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffefffffffffff)

    # Testcase 178:  imm:0x400, result rd:x10(0xffffdfffffffffff)
    la  x11, test_data
    addi    x11, x11,368
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    ld x10, 1024(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffdfffffffffff)

    # Testcase 179:  imm:0x800, result rd:x11(0xffffefffffffffff)
    la  x12, test_data
    addi    x12, x12,376
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    ld x11, -2048(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffefffffffffff)



    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0xffe, result rd:x12(0xffff7fffffffffff)
    la  x13, test_data
    addi    x13, x13,384
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    ld x12, -2(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffff7fffffffffff)

    # Testcase 181:  imm:0xffd, result rd:x13(0xfffeffffffffffff)
    la  x14, test_data
    addi    x14, x14,392
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    ld x13, -3(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffeffffffffffff)

    # Testcase 182:  imm:0xffb, result rd:x14(0xfffdffffffffffff)
    la  x15, test_data
    addi    x15, x15,400
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    ld x14, -5(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffdffffffffffff)

    # Testcase 183:  imm:0xff7, result rd:x15(0xfffbffffffffffff)
    la  x16, test_data
    addi    x16, x16,408
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    ld x15, -9(x16)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffbffffffffffff)

    # Testcase 184:  imm:0xfef, result rd:x16(0xfff7ffffffffffff)
    la  x17, test_data
    addi    x17, x17,416
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    ld x16, -17(x17)
    sd x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xfff7ffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0xfdf, result rd:x17(0xffefffffffffffff)
    la  x18, test_data
    addi    x18, x18,424
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    ld x17, -33(x18)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xffefffffffffffff)

    # Testcase 186:  imm:0xfbf, result rd:x18(0xffdfffffffffffff)
    la  x19, test_data
    addi    x19, x19,432
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    ld x18, -65(x19)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xffdfffffffffffff)

    # Testcase 187:  imm:0xf7f, result rd:x19(0xffbfffffffffffff)
    la  x20, test_data
    addi    x20, x20,440
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    ld x19, -129(x20)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xffbfffffffffffff)

    # Testcase 188:  imm:0xeff, result rd:x20(0xff7fffffffffffff)
    la  x21, test_data
    addi    x21, x21,448
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    ld x20, -257(x21)
    sd x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xff7fffffffffffff)

    # Testcase 189:  imm:0xdff, result rd:x21(0xfeffffffffffffff)
    la  x22, test_data
    addi    x22, x22,456
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    ld x21, -513(x22)
    sd x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xfeffffffffffffff)



    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0xbff, result rd:x22(0xfdffffffffffffff)
    la  x23, test_data
    addi    x23, x23,464
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    ld x22, -1025(x23)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xfdffffffffffffff)

    # Testcase 191:  imm:0x7ff, result rd:x23(0xfeffffffffffffff)
    la  x24, test_data
    addi    x24, x24,472
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    ld x23, 2047(x24)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xfeffffffffffffff)

    # Testcase 192:  imm:0xffe, result rd:x24(0xf7ffffffffffffff)
    la  x25, test_data
    addi    x25, x25,480
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    ld x24, -2(x25)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xf7ffffffffffffff)

    # Testcase 193:  imm:0xffd, result rd:x25(0xefffffffffffffff)
    la  x26, test_data
    addi    x26, x26,488
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    ld x25, -3(x26)
    sd x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xefffffffffffffff)

    # Testcase 194:  imm:0xffb, result rd:x26(0xdfffffffffffffff)
    la  x27, test_data
    addi    x27, x27,496
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    ld x26, -5(x27)
    sd x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xdfffffffffffffff)



    

    RVTEST_SIGBASE(x2,signature_40_0)

    # Testcase 195:  imm:0xff7, result rd:x27(0xefffffffffffffff)
    la  x28, test_data
    addi    x28, x28,504
    li     x3, MASK_XLEN(9)
    add    x28, x28, x3
    ld x27, -9(x28)
    sd x27, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xefffffffffffffff)

    # Testcase 196:  imm:0xfef, result rd:x28(0x7fffffffffffffff)
    la  x29, test_data
    addi    x29, x29,512
    li     x3, MASK_XLEN(17)
    add    x29, x29, x3
    ld x28, -17(x29)
    sd x28, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x7fffffffffffffff)

    # Testcase 197:  imm:0xfdf, result rd:x29(0xffffffffffffffff)
    la  x30, test_data
    addi    x30, x30,520
    li     x3, MASK_XLEN(33)
    add    x30, x30, x3
    ld x29, -33(x30)
    sd x29, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xffffffffffffffff)

    # Testcase 198:  imm:0xfbf, result rd:x30(0x0000000000000001)
    la  x31, test_data
    addi    x31, x31,528
    li     x3, MASK_XLEN(65)
    add    x31, x31, x3
    ld x30, -65(x31)
    sd x30, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0000000000000001)

    # Testcase 199:  imm:0xf7f, result rd:x31(0x0000000000000002)
    la  x1, test_data
    addi    x1, x1,536
    li     x3, MASK_XLEN(129)
    add    x1, x1, x3
    ld x31, -129(x1)
    sd x31, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0000000000000002)



    

    RVTEST_SIGBASE(x6,signature_41_0)

    # Testcase 200:  imm:0xeff, result rd:x1(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,544
    li     x7, MASK_XLEN(257)
    add    x2, x2, x7
    ld x1, -257(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000000000004)

    # Testcase 201:  imm:0xdff, result rd:x1(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,552
    li     x7, MASK_XLEN(513)
    add    x2, x2, x7
    ld x1, -513(x2)
    sd x1, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000000000008)

    # Testcase 202:  imm:0xbff, result rd:x2(0x0000000000000010)
    la  x3, test_data
    addi    x3, x3,560
    li     x7, MASK_XLEN(1025)
    add    x3, x3, x7
    ld x2, -1025(x3)
    sd x2, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x2, 0x0000000000000010)

    # Testcase 203:  imm:0x7ff, result rd:x3(0x0000000000000020)
    la  x4, test_data
    addi    x4, x4,568
    li     x7, MASK_XLEN(-2047)
    add    x4, x4, x7
    ld x3, 2047(x4)
    sd x3, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000020)

    # Testcase 204:  imm:0xffe, result rd:x4(0x0000000000000040)
    la  x5, test_data
    addi    x5, x5,576
    li     x7, MASK_XLEN(2)
    add    x5, x5, x7
    ld x4, -2(x5)
    sd x4, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0xffd, result rd:x5(0x0000000000000080)
    la  x6, test_data
    addi    x6, x6,584
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    ld x5, -3(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x0000000000000080)

    # Testcase 206:  imm:0xffb, result rd:x6(0x0000000000000100)
    la  x7, test_data
    addi    x7, x7,592
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    ld x6, -5(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000100)

    # Testcase 207:  imm:0xff7, result rd:x7(0x0000000000000200)
    la  x8, test_data
    addi    x8, x8,600
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    ld x7, -9(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000000200)

    # Testcase 208:  imm:0xfef, result rd:x8(0x0000000000000400)
    la  x9, test_data
    addi    x9, x9,608
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    ld x8, -17(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000400)

    # Testcase 209:  imm:0xfdf, result rd:x9(0x0000000000000800)
    la  x10, test_data
    addi    x10, x10,616
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    ld x9, -33(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000800)



    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0xfbf, result rd:x10(0x0000000000001000)
    la  x11, test_data
    addi    x11, x11,624
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    ld x10, -65(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000001000)

    # Testcase 211:  imm:0xf7f, result rd:x11(0x0000000000002000)
    la  x12, test_data
    addi    x12, x12,632
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    ld x11, -129(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000002000)

    # Testcase 212:  imm:0xeff, result rd:x12(0x0000000000004000)
    la  x13, test_data
    addi    x13, x13,640
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    ld x12, -257(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000004000)

    # Testcase 213:  imm:0xdff, result rd:x13(0x0000000000008000)
    la  x14, test_data
    addi    x14, x14,648
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    ld x13, -513(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000008000)

    # Testcase 214:  imm:0xbff, result rd:x14(0x0000000000010000)
    la  x15, test_data
    addi    x15, x15,656
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    ld x14, -1025(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000010000)



    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0x7ff, result rd:x15(0x0000000000020000)
    la  x16, test_data
    addi    x16, x16,664
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    ld x15, 2047(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000020000)

    # Testcase 216:  imm:0xffe, result rd:x16(0x0000000000040000)
    la  x17, test_data
    addi    x17, x17,672
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    ld x16, -2(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000040000)

    # Testcase 217:  imm:0xffd, result rd:x17(0x0000000000080000)
    la  x18, test_data
    addi    x18, x18,680
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    ld x17, -3(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000080000)

    # Testcase 218:  imm:0xffb, result rd:x18(0x0000000000100000)
    la  x19, test_data
    addi    x19, x19,688
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    ld x18, -5(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000100000)

    # Testcase 219:  imm:0xff7, result rd:x19(0x0000000000200000)
    la  x20, test_data
    addi    x20, x20,696
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    ld x19, -9(x20)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000200000)



    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0xfef, result rd:x20(0x0000000000400000)
    la  x21, test_data
    addi    x21, x21,704
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    ld x20, -17(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000400000)

    # Testcase 221:  imm:0xfdf, result rd:x21(0x0000000000800000)
    la  x22, test_data
    addi    x22, x22,712
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    ld x21, -33(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000800000)

    # Testcase 222:  imm:0xfbf, result rd:x22(0x0000000001000000)
    la  x23, test_data
    addi    x23, x23,720
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    ld x22, -65(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000001000000)

    # Testcase 223:  imm:0xf7f, result rd:x23(0x0000000002000000)
    la  x24, test_data
    addi    x24, x24,728
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    ld x23, -129(x24)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000002000000)

    # Testcase 224:  imm:0xeff, result rd:x24(0x0000000004000000)
    la  x25, test_data
    addi    x25, x25,736
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    ld x24, -257(x25)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000004000000)



    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Testcase 225:  imm:0xdff, result rd:x25(0x0000000008000000)
    la  x26, test_data
    addi    x26, x26,744
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    ld x25, -513(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000008000000)

    # Testcase 226:  imm:0xbff, result rd:x26(0x0000000010000000)
    la  x27, test_data
    addi    x27, x27,752
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    ld x26, -1025(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000010000000)

    # Testcase 227:  imm:0x7ff, result rd:x27(0x0000000020000000)
    la  x28, test_data
    addi    x28, x28,760
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    ld x27, 2047(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000020000000)

    # Testcase 228:  imm:0xffe, result rd:x28(0x0000000040000000)
    la  x29, test_data
    addi    x29, x29,768
    li     x2, MASK_XLEN(2)
    add    x29, x29, x2
    ld x28, -2(x29)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000040000000)

    # Testcase 229:  imm:0xffd, result rd:x29(0x0000000080000000)
    la  x30, test_data
    addi    x30, x30,776
    li     x2, MASK_XLEN(3)
    add    x30, x30, x2
    ld x29, -3(x30)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0000000080000000)



    

    RVTEST_SIGBASE(x4,signature_47_0)

    # Testcase 230:  imm:0xffb, result rd:x30(0x0000000000000000)
    la  x31, test_data
    addi    x31, x31,784
    li     x5, MASK_XLEN(5)
    add    x31, x31, x5
    ld x30, -5(x31)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000000)

    # Testcase 231:  imm:0xff7, result rd:x31(0x0000000100000000)
    la  x1, test_data
    addi    x1, x1,792
    li     x5, MASK_XLEN(9)
    add    x1, x1, x5
    ld x31, -9(x1)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000100000000)

    # Testcase 232:  imm:0xfef, result rd:x1(0x0000000200000000)
    la  x2, test_data
    addi    x2, x2,800
    li     x5, MASK_XLEN(17)
    add    x2, x2, x5
    ld x1, -17(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000200000000)

    # Testcase 233:  imm:0xfdf, result rd:x1(0x0000000400000000)
    la  x2, test_data
    addi    x2, x2,808
    li     x5, MASK_XLEN(33)
    add    x2, x2, x5
    ld x1, -33(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000400000000)

    # Testcase 234:  imm:0xfbf, result rd:x2(0x0000000800000000)
    la  x3, test_data
    addi    x3, x3,816
    li     x5, MASK_XLEN(65)
    add    x3, x3, x5
    ld x2, -65(x3)
    sd x2, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0000000800000000)



    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0xf7f, result rd:x3(0x0000001000000000)
    la  x4, test_data
    addi    x4, x4,824
    li     x2, MASK_XLEN(129)
    add    x4, x4, x2
    ld x3, -129(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000001000000000)

    # Testcase 236:  imm:0xeff, result rd:x4(0x0000002000000000)
    la  x5, test_data
    addi    x5, x5,832
    li     x2, MASK_XLEN(257)
    add    x5, x5, x2
    ld x4, -257(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000002000000000)

    # Testcase 237:  imm:0xdff, result rd:x5(0x0000004000000000)
    la  x6, test_data
    addi    x6, x6,840
    li     x2, MASK_XLEN(513)
    add    x6, x6, x2
    ld x5, -513(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000004000000000)

    # Testcase 238:  imm:0xbff, result rd:x6(0x0000008000000000)
    la  x7, test_data
    addi    x7, x7,848
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    ld x6, -1025(x7)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000008000000000)

    # Testcase 239:  imm:0x7ff, result rd:x7(0x0000010000000000)
    la  x8, test_data
    addi    x8, x8,856
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    ld x7, 2047(x8)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000010000000000)



    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0xffe, result rd:x8(0x0000020000000000)
    la  x9, test_data
    addi    x9, x9,864
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    ld x8, -2(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000020000000000)

    # Testcase 241:  imm:0xffd, result rd:x9(0x0000040000000000)
    la  x10, test_data
    addi    x10, x10,872
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    ld x9, -3(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000040000000000)

    # Testcase 242:  imm:0xffb, result rd:x10(0x0000080000000000)
    la  x11, test_data
    addi    x11, x11,880
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    ld x10, -5(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000080000000000)

    # Testcase 243:  imm:0xff7, result rd:x11(0x0000100000000000)
    la  x12, test_data
    addi    x12, x12,888
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    ld x11, -9(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000100000000000)

    # Testcase 244:  imm:0xfef, result rd:x12(0x0000200000000000)
    la  x13, test_data
    addi    x13, x13,896
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    ld x12, -17(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000200000000000)



    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0xfdf, result rd:x13(0x0000400000000000)
    la  x14, test_data
    addi    x14, x14,904
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    ld x13, -33(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000400000000000)

    # Testcase 246:  imm:0xfbf, result rd:x14(0x0000800000000000)
    la  x15, test_data
    addi    x15, x15,912
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    ld x14, -65(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000800000000000)

    # Testcase 247:  imm:0xf7f, result rd:x15(0x0001000000000000)
    la  x16, test_data
    addi    x16, x16,920
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    ld x15, -129(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0001000000000000)

    # Testcase 248:  imm:0xeff, result rd:x16(0x0002000000000000)
    la  x17, test_data
    addi    x17, x17,928
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    ld x16, -257(x17)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0002000000000000)

    # Testcase 249:  imm:0xdff, result rd:x17(0x0004000000000000)
    la  x18, test_data
    addi    x18, x18,936
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    ld x17, -513(x18)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0004000000000000)



    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0xbff, result rd:x18(0x0008000000000000)
    la  x19, test_data
    addi    x19, x19,944
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    ld x18, -1025(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0008000000000000)

    # Testcase 251:  imm:0x7ff, result rd:x19(0x0010000000000000)
    la  x20, test_data
    addi    x20, x20,952
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    ld x19, 2047(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0010000000000000)

    # Testcase 252:  imm:0xffe, result rd:x20(0x0020000000000000)
    la  x21, test_data
    addi    x21, x21,960
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    ld x20, -2(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0020000000000000)

    # Testcase 253:  imm:0xffd, result rd:x21(0x0040000000000000)
    la  x22, test_data
    addi    x22, x22,968
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    ld x21, -3(x22)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0040000000000000)

    # Testcase 254:  imm:0xffb, result rd:x22(0x0080000000000000)
    la  x23, test_data
    addi    x23, x23,976
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    ld x22, -5(x23)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0080000000000000)



    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 255:  imm:0xff7, result rd:x23(0x0100000000000000)
    la  x24, test_data
    addi    x24, x24,984
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    ld x23, -9(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0100000000000000)

    # Testcase 256:  imm:0xfef, result rd:x24(0x0200000000000000)
    la  x25, test_data
    addi    x25, x25,992
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    ld x24, -17(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0200000000000000)

    # Testcase 257:  imm:0xfdf, result rd:x25(0x0400000000000000)
    la  x26, test_data
    addi    x26, x26,1000
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    ld x25, -33(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0400000000000000)

    # Testcase 258:  imm:0xfbf, result rd:x26(0x0800000000000000)
    la  x27, test_data
    addi    x27, x27,1008
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    ld x26, -65(x27)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0800000000000000)

    # Testcase 259:  imm:0xf7f, result rd:x27(0x1000000000000000)
    la  x28, test_data
    addi    x28, x28,1016
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    ld x27, -129(x28)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x1000000000000000)



    

    RVTEST_SIGBASE(x3,signature_53_0)

    # Testcase 260:  imm:0xeff, result rd:x28(0x2000000000000000)
    la  x29, test_data
    addi    x29, x29,1024
    li     x4, MASK_XLEN(257)
    add    x29, x29, x4
    ld x28, -257(x29)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0x2000000000000000)

    # Testcase 261:  imm:0xdff, result rd:x29(0x4000000000000000)
    la  x30, test_data
    addi    x30, x30,1032
    li     x4, MASK_XLEN(513)
    add    x30, x30, x4
    ld x29, -513(x30)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x4000000000000000)

    # Testcase 262:  imm:0xbff, result rd:x30(0x8000000000000000)
    la  x31, test_data
    addi    x31, x31,1040
    li     x4, MASK_XLEN(1025)
    add    x31, x31, x4
    ld x30, -1025(x31)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x8000000000000000)

    # Testcase 263:  imm:0x7ff, result rd:x31(0x0000000000000000)
    la  x1, test_data
    addi    x1, x1,1048
    li     x4, MASK_XLEN(-2047)
    add    x1, x1, x4
    ld x31, 2047(x1)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000000)

    # Testcase 264:  imm:0xffe, result rd:x1(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x4, MASK_XLEN(2)
    add    x2, x2, x4
    ld x1, -2(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffffffffe)



    

    RVTEST_SIGBASE(x7,signature_54_0)

    # Testcase 265:  imm:0xffd, result rd:x1(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,8
    li     x8, MASK_XLEN(3)
    add    x2, x2, x8
    ld x1, -3(x2)
    sd x1, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x1, 0xfffffffffffffffd)

    # Testcase 266:  imm:0xffb, result rd:x2(0xfffffffffffffffb)
    la  x3, test_data
    addi    x3, x3,16
    li     x8, MASK_XLEN(5)
    add    x3, x3, x8
    ld x2, -5(x3)
    sd x2, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0xfffffffffffffffb)

    # Testcase 267:  imm:0xff7, result rd:x3(0xfffffffffffffff7)
    la  x4, test_data
    addi    x4, x4,24
    li     x8, MASK_XLEN(9)
    add    x4, x4, x8
    ld x3, -9(x4)
    sd x3, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffffffffffff7)

    # Testcase 268:  imm:0xfef, result rd:x4(0xffffffffffffffef)
    la  x5, test_data
    addi    x5, x5,32
    li     x8, MASK_XLEN(17)
    add    x5, x5, x8
    ld x4, -17(x5)
    sd x4, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xffffffffffffffef)

    # Testcase 269:  imm:0xfdf, result rd:x5(0xffffffffffffffdf)
    la  x6, test_data
    addi    x6, x6,40
    li     x8, MASK_XLEN(33)
    add    x6, x6, x8
    ld x5, -33(x6)
    sd x5, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0xfbf, result rd:x6(0xffffffffffffffbf)
    la  x7, test_data
    addi    x7, x7,48
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    ld x6, -65(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xffffffffffffffbf)

    # Testcase 271:  imm:0xf7f, result rd:x7(0xffffffffffffff7f)
    la  x8, test_data
    addi    x8, x8,56
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    ld x7, -129(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xffffffffffffff7f)

    # Testcase 272:  imm:0xeff, result rd:x8(0xfffffffffffffeff)
    la  x9, test_data
    addi    x9, x9,64
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    ld x8, -257(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffeff)

    # Testcase 273:  imm:0xdff, result rd:x9(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,72
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    ld x9, -513(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)

    # Testcase 274:  imm:0xbff, result rd:x10(0xfffffffffffffeff)
    la  x11, test_data
    addi    x11, x11,80
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    ld x10, -1025(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0x7ff, result rd:x11(0xfffffffffffff7ff)
    la  x12, test_data
    addi    x12, x12,88
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    ld x11, 2047(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffff7ff)

    # Testcase 276:  imm:0xffe, result rd:x12(0xffffffffffffefff)
    la  x13, test_data
    addi    x13, x13,96
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    ld x12, -2(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffefff)

    # Testcase 277:  imm:0xffd, result rd:x13(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,104
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    ld x13, -3(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffdfff)

    # Testcase 278:  imm:0xffb, result rd:x14(0xffffffffffffefff)
    la  x15, test_data
    addi    x15, x15,112
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    ld x14, -5(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffefff)

    # Testcase 279:  imm:0xff7, result rd:x15(0xffffffffffff7fff)
    la  x16, test_data
    addi    x16, x16,120
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    ld x15, -9(x16)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffff7fff)



    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0xfef, result rd:x16(0xfffffffffffeffff)
    la  x17, test_data
    addi    x17, x17,128
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    ld x16, -17(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xfffffffffffeffff)

    # Testcase 281:  imm:0xfdf, result rd:x17(0xfffffffffffdffff)
    la  x18, test_data
    addi    x18, x18,136
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    ld x17, -33(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xfffffffffffdffff)

    # Testcase 282:  imm:0xfbf, result rd:x18(0xfffffffffffbffff)
    la  x19, test_data
    addi    x19, x19,144
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    ld x18, -65(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfffffffffffbffff)

    # Testcase 283:  imm:0xf7f, result rd:x19(0xfffffffffff7ffff)
    la  x20, test_data
    addi    x20, x20,152
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    ld x19, -129(x20)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xfffffffffff7ffff)

    # Testcase 284:  imm:0xeff, result rd:x20(0xffffffffffefffff)
    la  x21, test_data
    addi    x21, x21,160
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    ld x20, -257(x21)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffefffff)



    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 285:  imm:0xdff, result rd:x21(0xffffffffffdfffff)
    la  x22, test_data
    addi    x22, x22,168
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    ld x21, -513(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xffffffffffdfffff)

    # Testcase 286:  imm:0xbff, result rd:x22(0xffffffffffbfffff)
    la  x23, test_data
    addi    x23, x23,176
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    ld x22, -1025(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xffffffffffbfffff)

    # Testcase 287:  imm:0x7ff, result rd:x23(0xffffffffff7fffff)
    la  x24, test_data
    addi    x24, x24,184
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    ld x23, 2047(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xffffffffff7fffff)

    # Testcase 288:  imm:0xffe, result rd:x24(0xfffffffffeffffff)
    la  x25, test_data
    addi    x25, x25,192
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    ld x24, -2(x25)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xfffffffffeffffff)

    # Testcase 289:  imm:0xffd, result rd:x25(0xfffffffffdffffff)
    la  x26, test_data
    addi    x26, x26,200
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    ld x25, -3(x26)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xfffffffffdffffff)



    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0xffb, result rd:x26(0xfffffffffeffffff)
    la  x27, test_data
    addi    x27, x27,208
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    ld x26, -5(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xfffffffffeffffff)

    # Testcase 291:  imm:0xff7, result rd:x27(0xfffffffff7ffffff)
    la  x28, test_data
    addi    x28, x28,216
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    ld x27, -9(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0xfffffffff7ffffff)

    # Testcase 292:  imm:0xfef, result rd:x28(0xffffffffefffffff)
    la  x29, test_data
    addi    x29, x29,224
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    ld x28, -17(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffefffffff)

    # Testcase 293:  imm:0xfdf, result rd:x29(0xffffffffdfffffff)
    la  x30, test_data
    addi    x30, x30,232
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    ld x29, -33(x30)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0xffffffffdfffffff)

    # Testcase 294:  imm:0xfbf, result rd:x30(0xffffffffefffffff)
    la  x31, test_data
    addi    x31, x31,240
    li     x2, MASK_XLEN(65)
    add    x31, x31, x2
    ld x30, -65(x31)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xffffffffefffffff)



    

    RVTEST_SIGBASE(x2,signature_60_0)

    # Testcase 295:  imm:0xf7f, result rd:x31(0xffffffff7fffffff)
    la  x1, test_data
    addi    x1, x1,248
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    ld x31, -129(x1)
    sd x31, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xffffffff7fffffff)

    # Testcase 296:  imm:0xf6a, result rd:x0(0x0000000000000000)
    la  x3, test_data
    addi    x3, x3,256
    li     x4, MASK_XLEN(150)
    add    x3, x3, x4
    ld x0, -150(x3)
    sd x0, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)

	
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe

# Input data section.
	.data

	.align 8
test_data:

	.dword 0xfffffffffffffffe
	.dword 0xfffffffffffffffd
	.dword 0xfffffffffffffffb
	.dword 0xfffffffffffffff7
	.dword 0xffffffffffffffef
	.dword 0xffffffffffffffdf
	.dword 0xffffffffffffffbf
	.dword 0xffffffffffffff7f
	.dword 0xfffffffffffffeff
	.dword 0xfffffffffffffdff
	.dword 0xfffffffffffffeff
	.dword 0xfffffffffffff7ff
	.dword 0xffffffffffffefff
	.dword 0xffffffffffffdfff
	.dword 0xffffffffffffefff
	.dword 0xffffffffffff7fff
	.dword 0xfffffffffffeffff
	.dword 0xfffffffffffdffff
	.dword 0xfffffffffffbffff
	.dword 0xfffffffffff7ffff
	.dword 0xffffffffffefffff
	.dword 0xffffffffffdfffff
	.dword 0xffffffffffbfffff
	.dword 0xffffffffff7fffff
	.dword 0xfffffffffeffffff
	.dword 0xfffffffffdffffff
	.dword 0xfffffffffeffffff
	.dword 0xfffffffff7ffffff
	.dword 0xffffffffefffffff
	.dword 0xffffffffdfffffff
	.dword 0xffffffffefffffff
	.dword 0xffffffff7fffffff
	.dword 0xffffffffffffffff
	.dword 0xfffffffeffffffff
	.dword 0xfffffffdffffffff
	.dword 0xfffffffbffffffff
	.dword 0xfffffff7ffffffff
	.dword 0xffffffefffffffff
	.dword 0xffffffdfffffffff
	.dword 0xffffffbfffffffff
	.dword 0xffffff7fffffffff
	.dword 0xfffffeffffffffff
	.dword 0xfffffdffffffffff
	.dword 0xfffffeffffffffff
	.dword 0xfffff7ffffffffff
	.dword 0xffffefffffffffff
	.dword 0xffffdfffffffffff
	.dword 0xffffefffffffffff
	.dword 0xffff7fffffffffff
	.dword 0xfffeffffffffffff
	.dword 0xfffdffffffffffff
	.dword 0xfffbffffffffffff
	.dword 0xfff7ffffffffffff
	.dword 0xffefffffffffffff
	.dword 0xffdfffffffffffff
	.dword 0xffbfffffffffffff
	.dword 0xff7fffffffffffff
	.dword 0xfeffffffffffffff
	.dword 0xfdffffffffffffff
	.dword 0xfeffffffffffffff
	.dword 0xf7ffffffffffffff
	.dword 0xefffffffffffffff
	.dword 0xdfffffffffffffff
	.dword 0xefffffffffffffff
	.dword 0x7fffffffffffffff
	.dword 0xffffffffffffffff
	.dword 0x0000000000000001
	.dword 0x0000000000000002
	.dword 0x0000000000000004
	.dword 0x0000000000000008
	.dword 0x0000000000000010
	.dword 0x0000000000000020
	.dword 0x0000000000000040
	.dword 0x0000000000000080
	.dword 0x0000000000000100
	.dword 0x0000000000000200
	.dword 0x0000000000000400
	.dword 0x0000000000000800
	.dword 0x0000000000001000
	.dword 0x0000000000002000
	.dword 0x0000000000004000
	.dword 0x0000000000008000
	.dword 0x0000000000010000
	.dword 0x0000000000020000
	.dword 0x0000000000040000
	.dword 0x0000000000080000
	.dword 0x0000000000100000
	.dword 0x0000000000200000
	.dword 0x0000000000400000
	.dword 0x0000000000800000
	.dword 0x0000000001000000
	.dword 0x0000000002000000
	.dword 0x0000000004000000
	.dword 0x0000000008000000
	.dword 0x0000000010000000
	.dword 0x0000000020000000
	.dword 0x0000000040000000
	.dword 0x0000000080000000
	.dword 0x0000000000000000
	.dword 0x0000000100000000
	.dword 0x0000000200000000
	.dword 0x0000000400000000
	.dword 0x0000000800000000
	.dword 0x0000001000000000
	.dword 0x0000002000000000
	.dword 0x0000004000000000
	.dword 0x0000008000000000
	.dword 0x0000010000000000
	.dword 0x0000020000000000
	.dword 0x0000040000000000
	.dword 0x0000080000000000
	.dword 0x0000100000000000
	.dword 0x0000200000000000
	.dword 0x0000400000000000
	.dword 0x0000800000000000
	.dword 0x0001000000000000
	.dword 0x0002000000000000
	.dword 0x0004000000000000
	.dword 0x0008000000000000
	.dword 0x0010000000000000
	.dword 0x0020000000000000
	.dword 0x0040000000000000
	.dword 0x0080000000000000
	.dword 0x0100000000000000
	.dword 0x0200000000000000
	.dword 0x0400000000000000
	.dword 0x0800000000000000
	.dword 0x1000000000000000
	.dword 0x2000000000000000
	.dword 0x4000000000000000
	.dword 0x8000000000000000
	.dword 0x0000000000000000

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

