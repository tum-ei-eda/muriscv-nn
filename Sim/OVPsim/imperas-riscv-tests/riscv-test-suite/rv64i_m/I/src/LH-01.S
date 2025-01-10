// RISC-V Architectural Validation Test LH-01
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
// Description: Testing instruction 'LH'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",lh)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0xd27, result rd:x19(0xfffffffffffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x3, MASK_XLEN(729)
    add    x29, x29, x3
    lh x19, -729(x29)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffffffffe)

    # Testcase 1:  imm:0xa51, result rd:x30(0xfffffffffffffffd)
    la  x21, test_data
    addi    x21, x21,2
    li     x3, MASK_XLEN(1455)
    add    x21, x21, x3
    lh x30, -1455(x21)
    sd x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffffffffd)

    # Testcase 2:  imm:0xc65, result rd:x10(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(923)
    add    x2, x2, x3
    lh x10, -923(x2)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x2,signature_2_0)

    # Testcase 3:  imm:0xa64, result rd:x3(0xfffffffffffffff7)
    la  x1, test_data
    addi    x1, x1,6
    li     x4, MASK_XLEN(1436)
    add    x1, x1, x4
    lh x3, -1436(x1)
    sd x3, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xfffffffffffffff7)

    # Testcase 4:  imm:0xc1e, result rd:x29(0xffffffffffffffef)
    la  x6, test_data
    addi    x6, x6,8
    li     x4, MASK_XLEN(994)
    add    x6, x6, x4
    lh x29, -994(x6)
    sd x29, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0xffffffffffffffef)

    # Testcase 5:  imm:0xadf, result rd:x0(0x0000000000000000)
    la  x14, test_data
    addi    x14, x14,10
    li     x4, MASK_XLEN(1313)
    add    x14, x14, x4
    lh x0, -1313(x14)
    sd x0, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)



    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 6:  imm:0xae7, result rd:x4(0xffffffffffffffbf)
    la  x12, test_data
    addi    x12, x12,12
    li     x2, MASK_XLEN(1305)
    add    x12, x12, x2
    lh x4, -1305(x12)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x3d1, result rd:x25(0xffffffffffffff7f)
    la  x3, test_data
    addi    x3, x3,14
    li     x2, MASK_XLEN(-977)
    add    x3, x3, x2
    lh x25, 977(x3)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0xffffffffffffff7f)

    # Testcase 8:  imm:0xff4, result rd:x18(0xfffffffffffffeff)
    la  x19, test_data
    addi    x19, x19,16
    li     x2, MASK_XLEN(12)
    add    x19, x19, x2
    lh x18, -12(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x2,signature_4_0)

    # Testcase 9:  imm:0x4c0, result rd:x7(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,18
    li     x3, MASK_XLEN(-1216)
    add    x10, x10, x3
    lh x7, 1216(x10)
    sd x7, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xfffffffffffffdff)

    # Testcase 10:  imm:0x63e, result rd:x31(0xfffffffffffffeff)
    la  x18, test_data
    addi    x18, x18,20
    li     x3, MASK_XLEN(-1598)
    add    x18, x18, x3
    lh x31, 1598(x18)
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x9ae, result rd:x23(0xfffffffffffff7ff)
    la  x1, test_data
    addi    x1, x1,22
    li     x3, MASK_XLEN(1618)
    add    x1, x1, x3
    lh x23, -1618(x1)
    sd x23, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x3,signature_5_0)

    # Testcase 12:  imm:0x650, result rd:x21(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,24
    li     x4, MASK_XLEN(-1616)
    add    x2, x2, x4
    lh x21, 1616(x2)
    sd x21, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0xffffffffffffefff)

    # Testcase 13:  imm:0x71, result rd:x30(0xffffffffffffdfff)
    la  x1, test_data
    addi    x1, x1,26
    li     x4, MASK_XLEN(-113)
    add    x1, x1, x4
    lh x30, 113(x1)
    sd x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffffffffdfff)

    # Testcase 14:  imm:0xdd8, result rd:x17(0xffffffffffffefff)
    la  x1, test_data
    addi    x1, x1,28
    li     x4, MASK_XLEN(552)
    add    x1, x1, x4
    lh x17, -552(x1)
    sd x17, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 15:  imm:0xb6d, result rd:x6(0x0000000000007fff)
    la  x12, test_data
    addi    x12, x12,30
    li     x3, MASK_XLEN(1171)
    add    x12, x12, x3
    lh x6, -1171(x12)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000000007fff)

    # Testcase 16:  imm:0x8a5, result rd:x22(0xffffffffffffffff)
    la  x10, test_data
    addi    x10, x10,32
    li     x3, MASK_XLEN(1883)
    add    x10, x10, x3
    lh x22, -1883(x10)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffffffffffffffff)

    # Testcase 17:  imm:0x621, result rd:x2(0x0000000000000001)
    la  x8, test_data
    addi    x8, x8,34
    li     x3, MASK_XLEN(-1569)
    add    x8, x8, x3
    lh x2, 1569(x8)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 18:  imm:0xba8, result rd:x13(0x0000000000000002)
    la  x8, test_data
    addi    x8, x8,36
    li     x2, MASK_XLEN(1112)
    add    x8, x8, x2
    lh x13, -1112(x8)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000000002)

    # Testcase 19:  imm:0x81b, result rd:x3(0x0000000000000004)
    la  x14, test_data
    addi    x14, x14,38
    li     x2, MASK_XLEN(2021)
    add    x14, x14, x2
    lh x3, -2021(x14)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x3, 0x0000000000000004)

    # Testcase 20:  imm:0xd8c, result rd:x24(0x0000000000000008)
    la  x13, test_data
    addi    x13, x13,40
    li     x2, MASK_XLEN(628)
    add    x13, x13, x2
    lh x24, -628(x13)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000000000008)



    

    RVTEST_SIGBASE(x2,signature_8_0)

    # Testcase 21:  imm:0xeb5, result rd:x3(0x0000000000000010)
    la  x18, test_data
    addi    x18, x18,42
    li     x4, MASK_XLEN(331)
    add    x18, x18, x4
    lh x3, -331(x18)
    sd x3, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x0000000000000010)

    # Testcase 22:  imm:0xd04, result rd:x14(0x0000000000000020)
    la  x1, test_data
    addi    x1, x1,44
    li     x4, MASK_XLEN(764)
    add    x1, x1, x4
    lh x14, -764(x1)
    sd x14, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0x0000000000000020)

    # Testcase 23:  imm:0x686, result rd:x20(0x0000000000000040)
    la  x19, test_data
    addi    x19, x19,46
    li     x4, MASK_XLEN(-1670)
    add    x19, x19, x4
    lh x20, 1670(x19)
    sd x20, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x20, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Testcase 24:  imm:0x92c, result rd:x4(0x0000000000000080)
    la  x30, test_data
    addi    x30, x30,48
    li     x3, MASK_XLEN(1748)
    add    x30, x30, x3
    lh x4, -1748(x30)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x0000000000000080)

    # Testcase 25:  imm:0x156, result rd:x29(0x0000000000000100)
    la  x31, test_data
    addi    x31, x31,50
    li     x3, MASK_XLEN(-342)
    add    x31, x31, x3
    lh x29, 342(x31)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x0000000000000100)

    # Testcase 26:  imm:0x1d4, result rd:x17(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-468)
    add    x2, x2, x3
    lh x17, 468(x2)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 27:  imm:0x678, result rd:x22(0x0000000000000400)
    la  x4, test_data
    addi    x4, x4,54
    li     x2, MASK_XLEN(-1656)
    add    x4, x4, x2
    lh x22, 1656(x4)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0x0000000000000400)

    # Testcase 28:  imm:0xddc, result rd:x3(0x0000000000000800)
    la  x20, test_data
    addi    x20, x20,56
    li     x2, MASK_XLEN(548)
    add    x20, x20, x2
    lh x3, -548(x20)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x0000000000000800)

    # Testcase 29:  imm:0x532, result rd:x15(0x0000000000001000)
    la  x14, test_data
    addi    x14, x14,58
    li     x2, MASK_XLEN(-1330)
    add    x14, x14, x2
    lh x15, 1330(x14)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x15, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 30:  imm:0x0, result rd:x28(0x0000000000002000)
    la  x7, test_data
    addi    x7, x7,60
    li     x2, MASK_XLEN(0)
    add    x7, x7, x2
    lh x28, 0(x7)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000000002000)

    # Testcase 31:  imm:0xfff, result rd:x14(0x0000000000004000)
    la  x7, test_data
    addi    x7, x7,62
    li     x2, MASK_XLEN(1)
    add    x7, x7, x2
    lh x14, -1(x7)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000004000)

    # Testcase 32:  imm:0xfff, result rd:x9(0xffffffffffff8000)
    la  x18, test_data
    addi    x18, x18,64
    li     x2, MASK_XLEN(1)
    add    x18, x18, x2
    lh x9, -1(x18)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 33:  imm:0xfff, result rd:x10(0x0000000000000000)
    la  x15, test_data
    addi    x15, x15,66
    li     x3, MASK_XLEN(1)
    add    x15, x15, x3
    lh x10, -1(x15)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000000000)

    # Testcase 34:  imm:0x0, result rd:x6(0xfffffffffffffffe)
    la  x23, test_data
    addi    x23, x23,68
    li     x3, MASK_XLEN(0)
    add    x23, x23, x3
    lh x6, 0(x23)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xfffffffffffffffe)

    # Testcase 35:  imm:0xfff, result rd:x0(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,70
    li     x3, MASK_XLEN(1)
    add    x2, x2, x3
    lh x0, -1(x2)
    sd x0, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x0, 0x0000000000000000)



    

    RVTEST_SIGBASE(x2,signature_13_0)

    # Testcase 36:  imm:0xfff, result rd:x19(0xfffffffffffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x3, MASK_XLEN(1)
    add    x29, x29, x3
    lh x19, -1(x29)
    sd x19, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffffffffe)

    # Testcase 37:  imm:0xfff, result rd:x19(0xfffffffffffffffd)
    la  x1, test_data
    addi    x1, x1,2
    li     x3, MASK_XLEN(1)
    add    x1, x1, x3
    lh x19, -1(x1)
    sd x19, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffffffffd)

    # Testcase 38:  imm:0x0, result rd:x30(0xfffffffffffffffb)
    la  x28, test_data
    addi    x28, x28,4
    li     x3, MASK_XLEN(0)
    add    x28, x28, x3
    lh x30, 0(x28)
    sd x30, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x3,signature_14_0)

    # Testcase 39:  imm:0xfff, result rd:x21(0xfffffffffffffff7)
    la  x24, test_data
    addi    x24, x24,6
    li     x4, MASK_XLEN(1)
    add    x24, x24, x4
    lh x21, -1(x24)
    sd x21, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0xfffffffffffffff7)

    # Testcase 40:  imm:0x1, result rd:x1(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,8
    li     x4, MASK_XLEN(-1)
    add    x2, x2, x4
    lh x1, 1(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffffffef)

    # Testcase 41:  imm:0x2, result rd:x1(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,10
    li     x4, MASK_XLEN(-2)
    add    x2, x2, x4
    lh x1, 2(x2)
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Testcase 42:  imm:0x4, result rd:x2(0xffffffffffffffbf)
    la  x3, test_data
    addi    x3, x3,12
    li     x6, MASK_XLEN(-4)
    add    x3, x3, x6
    lh x2, 4(x3)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0xffffffffffffffbf)

    # Testcase 43:  imm:0x8, result rd:x3(0xffffffffffffff7f)
    la  x4, test_data
    addi    x4, x4,14
    li     x6, MASK_XLEN(-8)
    add    x4, x4, x6
    lh x3, 8(x4)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffffffff7f)

    # Testcase 44:  imm:0x10, result rd:x4(0xfffffffffffffeff)
    la  x5, test_data
    addi    x5, x5,16
    li     x6, MASK_XLEN(-16)
    add    x5, x5, x6
    lh x4, 16(x5)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 45:  imm:0x20, result rd:x5(0xfffffffffffffdff)
    la  x6, test_data
    addi    x6, x6,18
    li     x2, MASK_XLEN(-32)
    add    x6, x6, x2
    lh x5, 32(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xfffffffffffffdff)

    # Testcase 46:  imm:0x40, result rd:x6(0xfffffffffffffeff)
    la  x7, test_data
    addi    x7, x7,20
    li     x2, MASK_XLEN(-64)
    add    x7, x7, x2
    lh x6, 64(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xfffffffffffffeff)

    # Testcase 47:  imm:0x80, result rd:x7(0xfffffffffffff7ff)
    la  x8, test_data
    addi    x8, x8,22
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    lh x7, 128(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 48:  imm:0x100, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,24
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    lh x8, 256(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)

    # Testcase 49:  imm:0x200, result rd:x9(0xffffffffffffdfff)
    la  x10, test_data
    addi    x10, x10,26
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    lh x9, 512(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffdfff)

    # Testcase 50:  imm:0x400, result rd:x10(0xffffffffffffefff)
    la  x11, test_data
    addi    x11, x11,28
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    lh x10, 1024(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 51:  imm:0x800, result rd:x11(0x0000000000007fff)
    la  x12, test_data
    addi    x12, x12,30
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    lh x11, -2048(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000007fff)

    # Testcase 52:  imm:0xffe, result rd:x12(0xffffffffffffffff)
    la  x13, test_data
    addi    x13, x13,32
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lh x12, -2(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffff)

    # Testcase 53:  imm:0xffd, result rd:x13(0x0000000000000001)
    la  x14, test_data
    addi    x14, x14,34
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lh x13, -3(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 54:  imm:0xffb, result rd:x14(0x0000000000000002)
    la  x15, test_data
    addi    x15, x15,36
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lh x14, -5(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000002)

    # Testcase 55:  imm:0xff7, result rd:x15(0x0000000000000004)
    la  x16, test_data
    addi    x16, x16,38
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lh x15, -9(x16)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000004)

    # Testcase 56:  imm:0xfef, result rd:x16(0x0000000000000008)
    la  x17, test_data
    addi    x17, x17,40
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lh x16, -17(x17)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 57:  imm:0xfdf, result rd:x17(0x0000000000000010)
    la  x18, test_data
    addi    x18, x18,42
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lh x17, -33(x18)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000000010)

    # Testcase 58:  imm:0xfbf, result rd:x18(0x0000000000000020)
    la  x19, test_data
    addi    x19, x19,44
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lh x18, -65(x19)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000000020)

    # Testcase 59:  imm:0xf7f, result rd:x19(0x0000000000000040)
    la  x20, test_data
    addi    x20, x20,46
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lh x19, -129(x20)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Testcase 60:  imm:0xeff, result rd:x20(0x0000000000000080)
    la  x21, test_data
    addi    x21, x21,48
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lh x20, -257(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000000080)

    # Testcase 61:  imm:0xdff, result rd:x21(0x0000000000000100)
    la  x22, test_data
    addi    x22, x22,50
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lh x21, -513(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000000100)

    # Testcase 62:  imm:0xbff, result rd:x22(0x0000000000000200)
    la  x23, test_data
    addi    x23, x23,52
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lh x22, -1025(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 63:  imm:0x7ff, result rd:x23(0x0000000000000400)
    la  x24, test_data
    addi    x24, x24,54
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lh x23, 2047(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000000400)

    # Testcase 64:  imm:0xffe, result rd:x24(0x0000000000000800)
    la  x25, test_data
    addi    x25, x25,56
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lh x24, -2(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000000000800)

    # Testcase 65:  imm:0xffd, result rd:x25(0x0000000000001000)
    la  x26, test_data
    addi    x26, x26,58
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lh x25, -3(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 66:  imm:0xffb, result rd:x26(0x0000000000002000)
    la  x27, test_data
    addi    x27, x27,60
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lh x26, -5(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000002000)

    # Testcase 67:  imm:0xff7, result rd:x27(0x0000000000004000)
    la  x28, test_data
    addi    x28, x28,62
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lh x27, -9(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000004000)

    # Testcase 68:  imm:0xfef, result rd:x28(0xffffffffffff8000)
    la  x29, test_data
    addi    x29, x29,64
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lh x28, -17(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x2,signature_24_0)

    # Testcase 69:  imm:0xfdf, result rd:x29(0x0000000000000000)
    la  x30, test_data
    addi    x30, x30,66
    li     x3, MASK_XLEN(33)
    add    x30, x30, x3
    lh x29, -33(x30)
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000000000)

    # Testcase 70:  imm:0xfbf, result rd:x30(0xfffffffffffffffe)
    la  x31, test_data
    addi    x31, x31,68
    li     x3, MASK_XLEN(65)
    add    x31, x31, x3
    lh x30, -65(x31)
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffffffffe)

    # Testcase 71:  imm:0xf7f, result rd:x31(0xfffffffffffffffd)
    la  x1, test_data
    addi    x1, x1,70
    li     x3, MASK_XLEN(129)
    add    x1, x1, x3
    lh x31, -129(x1)
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x4,signature_25_0)

    # Testcase 72:  imm:0xeff, result rd:x1(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x5, MASK_XLEN(257)
    add    x2, x2, x5
    lh x1, -257(x2)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffffffffe)

    # Testcase 73:  imm:0xdff, result rd:x1(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,2
    li     x5, MASK_XLEN(513)
    add    x2, x2, x5
    lh x1, -513(x2)
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffffffffd)

    # Testcase 74:  imm:0xbff, result rd:x2(0xfffffffffffffffb)
    la  x3, test_data
    addi    x3, x3,4
    li     x5, MASK_XLEN(1025)
    add    x3, x3, x5
    lh x2, -1025(x3)
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 75:  imm:0x7ff, result rd:x3(0xfffffffffffffff7)
    la  x4, test_data
    addi    x4, x4,6
    li     x2, MASK_XLEN(-2047)
    add    x4, x4, x2
    lh x3, 2047(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xfffffffffffffff7)

    # Testcase 76:  imm:0xffe, result rd:x4(0xffffffffffffffef)
    la  x5, test_data
    addi    x5, x5,8
    li     x2, MASK_XLEN(2)
    add    x5, x5, x2
    lh x4, -2(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffffffffffef)

    # Testcase 77:  imm:0xffd, result rd:x5(0xffffffffffffffdf)
    la  x6, test_data
    addi    x6, x6,10
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    lh x5, -3(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 78:  imm:0xffb, result rd:x6(0xffffffffffffffbf)
    la  x7, test_data
    addi    x7, x7,12
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    lh x6, -5(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xffffffffffffffbf)

    # Testcase 79:  imm:0xff7, result rd:x7(0xffffffffffffff7f)
    la  x8, test_data
    addi    x8, x8,14
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    lh x7, -9(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xffffffffffffff7f)

    # Testcase 80:  imm:0xfef, result rd:x8(0xfffffffffffffeff)
    la  x9, test_data
    addi    x9, x9,16
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    lh x8, -17(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 81:  imm:0xfdf, result rd:x9(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,18
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    lh x9, -33(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)

    # Testcase 82:  imm:0xfbf, result rd:x10(0xfffffffffffffeff)
    la  x11, test_data
    addi    x11, x11,20
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    lh x10, -65(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffeff)

    # Testcase 83:  imm:0xf7f, result rd:x11(0xfffffffffffff7ff)
    la  x12, test_data
    addi    x12, x12,22
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    lh x11, -129(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 84:  imm:0xeff, result rd:x12(0xffffffffffffefff)
    la  x13, test_data
    addi    x13, x13,24
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    lh x12, -257(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffefff)

    # Testcase 85:  imm:0xdff, result rd:x13(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,26
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    lh x13, -513(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffdfff)

    # Testcase 86:  imm:0xbff, result rd:x14(0xffffffffffffefff)
    la  x15, test_data
    addi    x15, x15,28
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    lh x14, -1025(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 87:  imm:0x7ff, result rd:x15(0x0000000000007fff)
    la  x16, test_data
    addi    x16, x16,30
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    lh x15, 2047(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000007fff)

    # Testcase 88:  imm:0xffe, result rd:x16(0xffffffffffffffff)
    la  x17, test_data
    addi    x17, x17,32
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    lh x16, -2(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xffffffffffffffff)

    # Testcase 89:  imm:0xffd, result rd:x17(0x0000000000000001)
    la  x18, test_data
    addi    x18, x18,34
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    lh x17, -3(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 90:  imm:0xffb, result rd:x18(0x0000000000000002)
    la  x19, test_data
    addi    x19, x19,36
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    lh x18, -5(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000000002)

    # Testcase 91:  imm:0xff7, result rd:x19(0x0000000000000004)
    la  x20, test_data
    addi    x20, x20,38
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    lh x19, -9(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000000004)

    # Testcase 92:  imm:0xfef, result rd:x20(0x0000000000000008)
    la  x21, test_data
    addi    x21, x21,40
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    lh x20, -17(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 93:  imm:0xfdf, result rd:x21(0x0000000000000010)
    la  x22, test_data
    addi    x22, x22,42
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    lh x21, -33(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000000010)

    # Testcase 94:  imm:0xfbf, result rd:x22(0x0000000000000020)
    la  x23, test_data
    addi    x23, x23,44
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    lh x22, -65(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000000020)

    # Testcase 95:  imm:0xf7f, result rd:x23(0x0000000000000040)
    la  x24, test_data
    addi    x24, x24,46
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    lh x23, -129(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 96:  imm:0xeff, result rd:x24(0x0000000000000080)
    la  x25, test_data
    addi    x25, x25,48
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    lh x24, -257(x25)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000000000080)

    # Testcase 97:  imm:0xdff, result rd:x25(0x0000000000000100)
    la  x26, test_data
    addi    x26, x26,50
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    lh x25, -513(x26)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000000100)

    # Testcase 98:  imm:0xbff, result rd:x26(0x0000000000000200)
    la  x27, test_data
    addi    x27, x27,52
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    lh x26, -1025(x27)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 99:  imm:0x7ff, result rd:x27(0x0000000000000400)
    la  x28, test_data
    addi    x28, x28,54
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    lh x27, 2047(x28)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000400)

    # Testcase 100:  imm:0xffe, result rd:x28(0x0000000000000800)
    la  x29, test_data
    addi    x29, x29,56
    li     x2, MASK_XLEN(2)
    add    x29, x29, x2
    lh x28, -2(x29)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000000000800)

    # Testcase 101:  imm:0xffd, result rd:x29(0x0000000000001000)
    la  x30, test_data
    addi    x30, x30,58
    li     x2, MASK_XLEN(3)
    add    x30, x30, x2
    lh x29, -3(x30)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0000000000001000)



    

    RVTEST_SIGBASE(x3,signature_35_0)

    # Testcase 102:  imm:0xffb, result rd:x30(0x0000000000002000)
    la  x31, test_data
    addi    x31, x31,60
    li     x4, MASK_XLEN(5)
    add    x31, x31, x4
    lh x30, -5(x31)
    sd x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000000002000)

    # Testcase 103:  imm:0xff7, result rd:x31(0x0000000000004000)
    la  x1, test_data
    addi    x1, x1,62
    li     x4, MASK_XLEN(9)
    add    x1, x1, x4
    lh x31, -9(x1)
    sd x31, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000004000)

    # Testcase 104:  imm:0xfef, result rd:x1(0xffffffffffff8000)
    la  x2, test_data
    addi    x2, x2,64
    li     x4, MASK_XLEN(17)
    add    x2, x2, x4
    lh x1, -17(x2)
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x5,signature_36_0)

    # Testcase 105:  imm:0xfdf, result rd:x1(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,66
    li     x6, MASK_XLEN(33)
    add    x2, x2, x6
    lh x1, -33(x2)
    sd x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x0000000000000000)

    # Testcase 106:  imm:0xfbf, result rd:x2(0xfffffffffffffffe)
    la  x3, test_data
    addi    x3, x3,68
    li     x6, MASK_XLEN(65)
    add    x3, x3, x6
    lh x2, -65(x3)
    sd x2, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0xfffffffffffffffe)

    # Testcase 107:  imm:0xf7f, result rd:x3(0xfffffffffffffffd)
    la  x4, test_data
    addi    x4, x4,70
    li     x6, MASK_XLEN(129)
    add    x4, x4, x6
    lh x3, -129(x4)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 108:  imm:0xeff, result rd:x4(0xfffffffffffffffe)
    la  x5, test_data
    addi    x5, x5,0
    li     x2, MASK_XLEN(257)
    add    x5, x5, x2
    lh x4, -257(x5)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffffffffffffffe)

    # Testcase 109:  imm:0xdff, result rd:x5(0xfffffffffffffffd)
    la  x6, test_data
    addi    x6, x6,2
    li     x2, MASK_XLEN(513)
    add    x6, x6, x2
    lh x5, -513(x6)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0xfffffffffffffffd)

    # Testcase 110:  imm:0xbff, result rd:x6(0xfffffffffffffffb)
    la  x7, test_data
    addi    x7, x7,4
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    lh x6, -1025(x7)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 111:  imm:0x7ff, result rd:x7(0xfffffffffffffff7)
    la  x8, test_data
    addi    x8, x8,6
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    lh x7, 2047(x8)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffffffffffff7)

    # Testcase 112:  imm:0xffe, result rd:x8(0xffffffffffffffef)
    la  x9, test_data
    addi    x9, x9,8
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    lh x8, -2(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffffef)

    # Testcase 113:  imm:0xffd, result rd:x9(0xffffffffffffffdf)
    la  x10, test_data
    addi    x10, x10,10
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    lh x9, -3(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 114:  imm:0xffb, result rd:x10(0xffffffffffffffbf)
    la  x11, test_data
    addi    x11, x11,12
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    lh x10, -5(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffbf)

    # Testcase 115:  imm:0xff7, result rd:x11(0xffffffffffffff7f)
    la  x12, test_data
    addi    x12, x12,14
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    lh x11, -9(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffff7f)

    # Testcase 116:  imm:0xfef, result rd:x12(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,16
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    lh x12, -17(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Testcase 117:  imm:0xfdf, result rd:x13(0xfffffffffffffdff)
    la  x14, test_data
    addi    x14, x14,18
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    lh x13, -33(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffdff)

    # Testcase 118:  imm:0xfbf, result rd:x14(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,20
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    lh x14, -65(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffeff)

    # Testcase 119:  imm:0xf7f, result rd:x15(0xfffffffffffff7ff)
    la  x16, test_data
    addi    x16, x16,22
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    lh x15, -129(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 120:  imm:0xeff, result rd:x16(0xffffffffffffefff)
    la  x17, test_data
    addi    x17, x17,24
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    lh x16, -257(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xffffffffffffefff)

    # Testcase 121:  imm:0xdff, result rd:x17(0xffffffffffffdfff)
    la  x18, test_data
    addi    x18, x18,26
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    lh x17, -513(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xffffffffffffdfff)

    # Testcase 122:  imm:0xbff, result rd:x18(0xffffffffffffefff)
    la  x19, test_data
    addi    x19, x19,28
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    lh x18, -1025(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 123:  imm:0x7ff, result rd:x19(0x0000000000007fff)
    la  x20, test_data
    addi    x20, x20,30
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    lh x19, 2047(x20)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000007fff)

    # Testcase 124:  imm:0xffe, result rd:x20(0xffffffffffffffff)
    la  x21, test_data
    addi    x21, x21,32
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    lh x20, -2(x21)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffffffff)

    # Testcase 125:  imm:0xffd, result rd:x21(0x0000000000000001)
    la  x22, test_data
    addi    x22, x22,34
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    lh x21, -3(x22)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 126:  imm:0xffb, result rd:x22(0x0000000000000002)
    la  x23, test_data
    addi    x23, x23,36
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    lh x22, -5(x23)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000000002)

    # Testcase 127:  imm:0xff7, result rd:x23(0x0000000000000004)
    la  x24, test_data
    addi    x24, x24,38
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    lh x23, -9(x24)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000000004)

    # Testcase 128:  imm:0xfef, result rd:x24(0x0000000000000008)
    la  x25, test_data
    addi    x25, x25,40
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    lh x24, -17(x25)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 129:  imm:0xfdf, result rd:x25(0x0000000000000010)
    la  x26, test_data
    addi    x26, x26,42
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    lh x25, -33(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000000010)

    # Testcase 130:  imm:0xfbf, result rd:x26(0x0000000000000020)
    la  x27, test_data
    addi    x27, x27,44
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    lh x26, -65(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000000020)

    # Testcase 131:  imm:0xf7f, result rd:x27(0x0000000000000040)
    la  x28, test_data
    addi    x28, x28,46
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    lh x27, -129(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 132:  imm:0xeff, result rd:x28(0x0000000000000080)
    la  x29, test_data
    addi    x29, x29,48
    li     x2, MASK_XLEN(257)
    add    x29, x29, x2
    lh x28, -257(x29)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000000000080)

    # Testcase 133:  imm:0xdff, result rd:x29(0x0000000000000100)
    la  x30, test_data
    addi    x30, x30,50
    li     x2, MASK_XLEN(513)
    add    x30, x30, x2
    lh x29, -513(x30)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0000000000000100)

    # Testcase 134:  imm:0xbff, result rd:x30(0x0000000000000200)
    la  x31, test_data
    addi    x31, x31,52
    li     x2, MASK_XLEN(1025)
    add    x31, x31, x2
    lh x30, -1025(x31)
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x0000000000000200)



    

    RVTEST_SIGBASE(x3,signature_46_0)

    # Testcase 135:  imm:0x7ff, result rd:x31(0x0000000000000400)
    la  x1, test_data
    addi    x1, x1,54
    li     x4, MASK_XLEN(-2047)
    add    x1, x1, x4
    lh x31, 2047(x1)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000400)

    # Testcase 136:  imm:0xffe, result rd:x1(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,56
    li     x4, MASK_XLEN(2)
    add    x2, x2, x4
    lh x1, -2(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000800)

    # Testcase 137:  imm:0xffd, result rd:x1(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,58
    li     x4, MASK_XLEN(3)
    add    x2, x2, x4
    lh x1, -3(x2)
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 138:  imm:0xffb, result rd:x2(0x0000000000002000)
    la  x3, test_data
    addi    x3, x3,60
    li     x6, MASK_XLEN(5)
    add    x3, x3, x6
    lh x2, -5(x3)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0x0000000000002000)

    # Testcase 139:  imm:0xff7, result rd:x3(0x0000000000004000)
    la  x4, test_data
    addi    x4, x4,62
    li     x6, MASK_XLEN(9)
    add    x4, x4, x6
    lh x3, -9(x4)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000004000)

    # Testcase 140:  imm:0xfef, result rd:x4(0xffffffffffff8000)
    la  x5, test_data
    addi    x5, x5,64
    li     x6, MASK_XLEN(17)
    add    x5, x5, x6
    lh x4, -17(x5)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 141:  imm:0xfdf, result rd:x5(0x0000000000000000)
    la  x6, test_data
    addi    x6, x6,66
    li     x2, MASK_XLEN(33)
    add    x6, x6, x2
    lh x5, -33(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x0000000000000000)

    # Testcase 142:  imm:0xfbf, result rd:x6(0xfffffffffffffffe)
    la  x7, test_data
    addi    x7, x7,68
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    lh x6, -65(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0xfffffffffffffffe)

    # Testcase 143:  imm:0xf7f, result rd:x7(0xfffffffffffffffd)
    la  x8, test_data
    addi    x8, x8,70
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    lh x7, -129(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 144:  imm:0xeff, result rd:x8(0xfffffffffffffffe)
    la  x9, test_data
    addi    x9, x9,0
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    lh x8, -257(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffffe)

    # Testcase 145:  imm:0xdff, result rd:x9(0xfffffffffffffffd)
    la  x10, test_data
    addi    x10, x10,2
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    lh x9, -513(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffffd)

    # Testcase 146:  imm:0xbff, result rd:x10(0xfffffffffffffffb)
    la  x11, test_data
    addi    x11, x11,4
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    lh x10, -1025(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 147:  imm:0x7ff, result rd:x11(0xfffffffffffffff7)
    la  x12, test_data
    addi    x12, x12,6
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    lh x11, 2047(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffff7)

    # Testcase 148:  imm:0xffe, result rd:x12(0xffffffffffffffef)
    la  x13, test_data
    addi    x13, x13,8
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lh x12, -2(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffef)

    # Testcase 149:  imm:0xffd, result rd:x13(0xffffffffffffffdf)
    la  x14, test_data
    addi    x14, x14,10
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lh x13, -3(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 150:  imm:0xffb, result rd:x14(0xffffffffffffffbf)
    la  x15, test_data
    addi    x15, x15,12
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lh x14, -5(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffffbf)

    # Testcase 151:  imm:0xff7, result rd:x15(0xffffffffffffff7f)
    la  x16, test_data
    addi    x16, x16,14
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lh x15, -9(x16)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffff7f)

    # Testcase 152:  imm:0xfef, result rd:x16(0xfffffffffffffeff)
    la  x17, test_data
    addi    x17, x17,16
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lh x16, -17(x17)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 153:  imm:0xfdf, result rd:x17(0xfffffffffffffdff)
    la  x18, test_data
    addi    x18, x18,18
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lh x17, -33(x18)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xfffffffffffffdff)

    # Testcase 154:  imm:0xfbf, result rd:x18(0xfffffffffffffeff)
    la  x19, test_data
    addi    x19, x19,20
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lh x18, -65(x19)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfffffffffffffeff)

    # Testcase 155:  imm:0xf7f, result rd:x19(0xfffffffffffff7ff)
    la  x20, test_data
    addi    x20, x20,22
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lh x19, -129(x20)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 156:  imm:0xeff, result rd:x20(0xffffffffffffefff)
    la  x21, test_data
    addi    x21, x21,24
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lh x20, -257(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffffefff)

    # Testcase 157:  imm:0xdff, result rd:x21(0xffffffffffffdfff)
    la  x22, test_data
    addi    x22, x22,26
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lh x21, -513(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xffffffffffffdfff)

    # Testcase 158:  imm:0xbff, result rd:x22(0xffffffffffffefff)
    la  x23, test_data
    addi    x23, x23,28
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lh x22, -1025(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 159:  imm:0x7ff, result rd:x23(0x0000000000007fff)
    la  x24, test_data
    addi    x24, x24,30
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lh x23, 2047(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000007fff)

    # Testcase 160:  imm:0xffe, result rd:x24(0xffffffffffffffff)
    la  x25, test_data
    addi    x25, x25,32
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lh x24, -2(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xffffffffffffffff)

    # Testcase 161:  imm:0xffd, result rd:x25(0x0000000000000001)
    la  x26, test_data
    addi    x26, x26,34
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lh x25, -3(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 162:  imm:0xffb, result rd:x26(0x0000000000000002)
    la  x27, test_data
    addi    x27, x27,36
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lh x26, -5(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000000002)

    # Testcase 163:  imm:0xff7, result rd:x27(0x0000000000000004)
    la  x28, test_data
    addi    x28, x28,38
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lh x27, -9(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000004)

    # Testcase 164:  imm:0xfef, result rd:x28(0x0000000000000008)
    la  x29, test_data
    addi    x29, x29,40
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lh x28, -17(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x0000000000000008)



    

    RVTEST_SIGBASE(x2,signature_56_0)

    # Testcase 165:  imm:0xfdf, result rd:x29(0x0000000000000010)
    la  x30, test_data
    addi    x30, x30,42
    li     x3, MASK_XLEN(33)
    add    x30, x30, x3
    lh x29, -33(x30)
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000000010)

    # Testcase 166:  imm:0xfbf, result rd:x30(0x0000000000000020)
    la  x31, test_data
    addi    x31, x31,44
    li     x3, MASK_XLEN(65)
    add    x31, x31, x3
    lh x30, -65(x31)
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0000000000000020)

    # Testcase 167:  imm:0xf7f, result rd:x31(0x0000000000000040)
    la  x1, test_data
    addi    x1, x1,46
    li     x3, MASK_XLEN(129)
    add    x1, x1, x3
    lh x31, -129(x1)
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0000000000000040)



    

    RVTEST_SIGBASE(x4,signature_57_0)

    # Testcase 168:  imm:0x1, result rd:x1(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,48
    li     x5, MASK_XLEN(-1)
    add    x2, x2, x5
    lh x1, 1(x2)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000080)

    # Testcase 169:  imm:0x2, result rd:x1(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,50
    li     x5, MASK_XLEN(-2)
    add    x2, x2, x5
    lh x1, 2(x2)
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000100)

    # Testcase 170:  imm:0x4, result rd:x2(0x0000000000000200)
    la  x3, test_data
    addi    x3, x3,52
    li     x5, MASK_XLEN(-4)
    add    x3, x3, x5
    lh x2, 4(x3)
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 171:  imm:0x8, result rd:x3(0x0000000000000400)
    la  x4, test_data
    addi    x4, x4,54
    li     x2, MASK_XLEN(-8)
    add    x4, x4, x2
    lh x3, 8(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000000400)

    # Testcase 172:  imm:0x10, result rd:x4(0x0000000000000800)
    la  x5, test_data
    addi    x5, x5,56
    li     x2, MASK_XLEN(-16)
    add    x5, x5, x2
    lh x4, 16(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x0000000000000800)

    # Testcase 173:  imm:0x20, result rd:x5(0x0000000000001000)
    la  x6, test_data
    addi    x6, x6,58
    li     x2, MASK_XLEN(-32)
    add    x6, x6, x2
    lh x5, 32(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 174:  imm:0x40, result rd:x6(0x0000000000002000)
    la  x7, test_data
    addi    x7, x7,60
    li     x2, MASK_XLEN(-64)
    add    x7, x7, x2
    lh x6, 64(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000002000)

    # Testcase 175:  imm:0x80, result rd:x7(0x0000000000004000)
    la  x8, test_data
    addi    x8, x8,62
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    lh x7, 128(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000004000)

    # Testcase 176:  imm:0x100, result rd:x8(0xffffffffffff8000)
    la  x9, test_data
    addi    x9, x9,64
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    lh x8, 256(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 177:  imm:0x200, result rd:x9(0x0000000000000000)
    la  x10, test_data
    addi    x10, x10,66
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    lh x9, 512(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000000)

    # Testcase 178:  imm:0x400, result rd:x10(0xfffffffffffffffe)
    la  x11, test_data
    addi    x11, x11,68
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    lh x10, 1024(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffe)

    # Testcase 179:  imm:0x800, result rd:x11(0xfffffffffffffffd)
    la  x12, test_data
    addi    x12, x12,70
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    lh x11, -2048(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_61_0)

    # Testcase 180:  imm:0xffe, result rd:x12(0xfffffffffffffffe)
    la  x13, test_data
    addi    x13, x13,0
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lh x12, -2(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffffe)

    # Testcase 181:  imm:0xffd, result rd:x13(0xfffffffffffffffd)
    la  x14, test_data
    addi    x14, x14,2
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lh x13, -3(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffffd)

    # Testcase 182:  imm:0xffb, result rd:x14(0xfffffffffffffffb)
    la  x15, test_data
    addi    x15, x15,4
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lh x14, -5(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_62_0)

    # Testcase 183:  imm:0xff7, result rd:x15(0xfffffffffffffff7)
    la  x16, test_data
    addi    x16, x16,6
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lh x15, -9(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffff7)

    # Testcase 184:  imm:0xfef, result rd:x16(0xffffffffffffffef)
    la  x17, test_data
    addi    x17, x17,8
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lh x16, -17(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xffffffffffffffef)

    # Testcase 185:  imm:0xfdf, result rd:x17(0xffffffffffffffdf)
    la  x18, test_data
    addi    x18, x18,10
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lh x17, -33(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_63_0)

    # Testcase 186:  imm:0xfbf, result rd:x18(0xffffffffffffffbf)
    la  x19, test_data
    addi    x19, x19,12
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lh x18, -65(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xffffffffffffffbf)

    # Testcase 187:  imm:0xf7f, result rd:x19(0xffffffffffffff7f)
    la  x20, test_data
    addi    x20, x20,14
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lh x19, -129(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xffffffffffffff7f)

    # Testcase 188:  imm:0xeff, result rd:x20(0xfffffffffffffeff)
    la  x21, test_data
    addi    x21, x21,16
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lh x20, -257(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_64_0)

    # Testcase 189:  imm:0xdff, result rd:x21(0xfffffffffffffdff)
    la  x22, test_data
    addi    x22, x22,18
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lh x21, -513(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xfffffffffffffdff)

    # Testcase 190:  imm:0xbff, result rd:x22(0xfffffffffffffeff)
    la  x23, test_data
    addi    x23, x23,20
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lh x22, -1025(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xfffffffffffffeff)

    # Testcase 191:  imm:0x7ff, result rd:x23(0xfffffffffffff7ff)
    la  x24, test_data
    addi    x24, x24,22
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lh x23, 2047(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_65_0)

    # Testcase 192:  imm:0xffe, result rd:x24(0xffffffffffffefff)
    la  x25, test_data
    addi    x25, x25,24
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lh x24, -2(x25)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xffffffffffffefff)

    # Testcase 193:  imm:0xffd, result rd:x25(0xffffffffffffdfff)
    la  x26, test_data
    addi    x26, x26,26
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lh x25, -3(x26)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xffffffffffffdfff)

    # Testcase 194:  imm:0xffb, result rd:x26(0xffffffffffffefff)
    la  x27, test_data
    addi    x27, x27,28
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lh x26, -5(x27)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_66_0)

    # Testcase 195:  imm:0xff7, result rd:x27(0x0000000000007fff)
    la  x28, test_data
    addi    x28, x28,30
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lh x27, -9(x28)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000007fff)

    # Testcase 196:  imm:0xfef, result rd:x28(0xffffffffffffffff)
    la  x29, test_data
    addi    x29, x29,32
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lh x28, -17(x29)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffffffffff)

    # Testcase 197:  imm:0xfdf, result rd:x29(0x0000000000000001)
    la  x30, test_data
    addi    x30, x30,34
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    lh x29, -33(x30)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x0000000000000001)



    

    RVTEST_SIGBASE(x3,signature_67_0)

    # Testcase 198:  imm:0xfbf, result rd:x30(0x0000000000000002)
    la  x31, test_data
    addi    x31, x31,36
    li     x4, MASK_XLEN(65)
    add    x31, x31, x4
    lh x30, -65(x31)
    sd x30, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000000000002)

    # Testcase 199:  imm:0xf7f, result rd:x31(0x0000000000000004)
    la  x1, test_data
    addi    x1, x1,38
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    lh x31, -129(x1)
    sd x31, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000004)

    # Testcase 200:  imm:0xeff, result rd:x1(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,40
    li     x4, MASK_XLEN(257)
    add    x2, x2, x4
    lh x1, -257(x2)
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000008)



    

    RVTEST_SIGBASE(x5,signature_68_0)

    # Testcase 201:  imm:0xdff, result rd:x1(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,42
    li     x6, MASK_XLEN(513)
    add    x2, x2, x6
    lh x1, -513(x2)
    sd x1, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x0000000000000010)

    # Testcase 202:  imm:0xbff, result rd:x2(0x0000000000000020)
    la  x3, test_data
    addi    x3, x3,44
    li     x6, MASK_XLEN(1025)
    add    x3, x3, x6
    lh x2, -1025(x3)
    sd x2, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0x0000000000000020)

    # Testcase 203:  imm:0x7ff, result rd:x3(0x0000000000000040)
    la  x4, test_data
    addi    x4, x4,46
    li     x6, MASK_XLEN(-2047)
    add    x4, x4, x6
    lh x3, 2047(x4)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_69_0)

    # Testcase 204:  imm:0xffe, result rd:x4(0x0000000000000080)
    la  x5, test_data
    addi    x5, x5,48
    li     x2, MASK_XLEN(2)
    add    x5, x5, x2
    lh x4, -2(x5)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0000000000000080)

    # Testcase 205:  imm:0xffd, result rd:x5(0x0000000000000100)
    la  x6, test_data
    addi    x6, x6,50
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    lh x5, -3(x6)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x0000000000000100)

    # Testcase 206:  imm:0xffb, result rd:x6(0x0000000000000200)
    la  x7, test_data
    addi    x7, x7,52
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    lh x6, -5(x7)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_70_0)

    # Testcase 207:  imm:0xff7, result rd:x7(0x0000000000000400)
    la  x8, test_data
    addi    x8, x8,54
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    lh x7, -9(x8)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000000400)

    # Testcase 208:  imm:0xfef, result rd:x8(0x0000000000000800)
    la  x9, test_data
    addi    x9, x9,56
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    lh x8, -17(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000800)

    # Testcase 209:  imm:0xfdf, result rd:x9(0x0000000000001000)
    la  x10, test_data
    addi    x10, x10,58
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    lh x9, -33(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_71_0)

    # Testcase 210:  imm:0xfbf, result rd:x10(0x0000000000002000)
    la  x11, test_data
    addi    x11, x11,60
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    lh x10, -65(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000002000)

    # Testcase 211:  imm:0xf7f, result rd:x11(0x0000000000004000)
    la  x12, test_data
    addi    x12, x12,62
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    lh x11, -129(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000004000)

    # Testcase 212:  imm:0xeff, result rd:x12(0xffffffffffff8000)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    lh x12, -257(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_72_0)

    # Testcase 213:  imm:0xdff, result rd:x13(0x0000000000000000)
    la  x14, test_data
    addi    x14, x14,66
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    lh x13, -513(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000000)

    # Testcase 214:  imm:0xbff, result rd:x14(0xfffffffffffffffe)
    la  x15, test_data
    addi    x15, x15,68
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    lh x14, -1025(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffe)

    # Testcase 215:  imm:0x7ff, result rd:x15(0xfffffffffffffffd)
    la  x16, test_data
    addi    x16, x16,70
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    lh x15, 2047(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_73_0)

    # Testcase 216:  imm:0xffe, result rd:x16(0xfffffffffffffffe)
    la  x17, test_data
    addi    x17, x17,0
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    lh x16, -2(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xfffffffffffffffe)

    # Testcase 217:  imm:0xffd, result rd:x17(0xfffffffffffffffd)
    la  x18, test_data
    addi    x18, x18,2
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    lh x17, -3(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0xfffffffffffffffd)

    # Testcase 218:  imm:0xffb, result rd:x18(0xfffffffffffffffb)
    la  x19, test_data
    addi    x19, x19,4
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    lh x18, -5(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_74_0)

    # Testcase 219:  imm:0xff7, result rd:x19(0xfffffffffffffff7)
    la  x20, test_data
    addi    x20, x20,6
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    lh x19, -9(x20)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xfffffffffffffff7)

    # Testcase 220:  imm:0xfef, result rd:x20(0xffffffffffffffef)
    la  x21, test_data
    addi    x21, x21,8
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    lh x20, -17(x21)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffffffef)

    # Testcase 221:  imm:0xfdf, result rd:x21(0xffffffffffffffdf)
    la  x22, test_data
    addi    x22, x22,10
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    lh x21, -33(x22)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_75_0)

    # Testcase 222:  imm:0xfbf, result rd:x22(0xffffffffffffffbf)
    la  x23, test_data
    addi    x23, x23,12
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    lh x22, -65(x23)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xffffffffffffffbf)

    # Testcase 223:  imm:0xf7f, result rd:x23(0xffffffffffffff7f)
    la  x24, test_data
    addi    x24, x24,14
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    lh x23, -129(x24)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xffffffffffffff7f)

    # Testcase 224:  imm:0xeff, result rd:x24(0xfffffffffffffeff)
    la  x25, test_data
    addi    x25, x25,16
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    lh x24, -257(x25)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x1,signature_76_0)

    # Testcase 225:  imm:0xdff, result rd:x25(0xfffffffffffffdff)
    la  x26, test_data
    addi    x26, x26,18
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    lh x25, -513(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xfffffffffffffdff)

    # Testcase 226:  imm:0xbff, result rd:x26(0xfffffffffffffeff)
    la  x27, test_data
    addi    x27, x27,20
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    lh x26, -1025(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xfffffffffffffeff)

    # Testcase 227:  imm:0x7ff, result rd:x27(0xfffffffffffff7ff)
    la  x28, test_data
    addi    x28, x28,22
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    lh x27, 2047(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x1,signature_77_0)

    # Testcase 228:  imm:0xffe, result rd:x28(0xffffffffffffefff)
    la  x29, test_data
    addi    x29, x29,24
    li     x2, MASK_XLEN(2)
    add    x29, x29, x2
    lh x28, -2(x29)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffffffefff)

    # Testcase 229:  imm:0xffd, result rd:x29(0xffffffffffffdfff)
    la  x30, test_data
    addi    x30, x30,26
    li     x2, MASK_XLEN(3)
    add    x30, x30, x2
    lh x29, -3(x30)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0xffffffffffffdfff)

    # Testcase 230:  imm:0xffb, result rd:x30(0xffffffffffffefff)
    la  x31, test_data
    addi    x31, x31,28
    li     x2, MASK_XLEN(5)
    add    x31, x31, x2
    lh x30, -5(x31)
    sd x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x3,signature_78_0)

    # Testcase 231:  imm:0xff7, result rd:x31(0x0000000000007fff)
    la  x1, test_data
    addi    x1, x1,30
    li     x4, MASK_XLEN(9)
    add    x1, x1, x4
    lh x31, -9(x1)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000007fff)

    # Testcase 232:  imm:0xfef, result rd:x1(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,32
    li     x4, MASK_XLEN(17)
    add    x2, x2, x4
    lh x1, -17(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffffffff)

    # Testcase 233:  imm:0xfdf, result rd:x1(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,34
    li     x4, MASK_XLEN(33)
    add    x2, x2, x4
    lh x1, -33(x2)
    sd x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_79_0)

    # Testcase 234:  imm:0xfbf, result rd:x2(0x0000000000000002)
    la  x3, test_data
    addi    x3, x3,36
    li     x6, MASK_XLEN(65)
    add    x3, x3, x6
    lh x2, -65(x3)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0x0000000000000002)

    # Testcase 235:  imm:0xf7f, result rd:x3(0x0000000000000004)
    la  x4, test_data
    addi    x4, x4,38
    li     x6, MASK_XLEN(129)
    add    x4, x4, x6
    lh x3, -129(x4)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000000004)

    # Testcase 236:  imm:0xeff, result rd:x4(0x0000000000000008)
    la  x5, test_data
    addi    x5, x5,40
    li     x6, MASK_XLEN(257)
    add    x5, x5, x6
    lh x4, -257(x5)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_80_0)

    # Testcase 237:  imm:0xdff, result rd:x5(0x0000000000000010)
    la  x6, test_data
    addi    x6, x6,42
    li     x2, MASK_XLEN(513)
    add    x6, x6, x2
    lh x5, -513(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x0000000000000010)

    # Testcase 238:  imm:0xbff, result rd:x6(0x0000000000000020)
    la  x7, test_data
    addi    x7, x7,44
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    lh x6, -1025(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000020)

    # Testcase 239:  imm:0x7ff, result rd:x7(0x0000000000000040)
    la  x8, test_data
    addi    x8, x8,46
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    lh x7, 2047(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_81_0)

    # Testcase 240:  imm:0xffe, result rd:x8(0x0000000000000080)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    lh x8, -2(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000080)

    # Testcase 241:  imm:0xffd, result rd:x9(0x0000000000000100)
    la  x10, test_data
    addi    x10, x10,50
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    lh x9, -3(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000100)

    # Testcase 242:  imm:0xffb, result rd:x10(0x0000000000000200)
    la  x11, test_data
    addi    x11, x11,52
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    lh x10, -5(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_82_0)

    # Testcase 243:  imm:0xff7, result rd:x11(0x0000000000000400)
    la  x12, test_data
    addi    x12, x12,54
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    lh x11, -9(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000400)

    # Testcase 244:  imm:0xfef, result rd:x12(0x0000000000000800)
    la  x13, test_data
    addi    x13, x13,56
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    lh x12, -17(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000800)

    # Testcase 245:  imm:0xfdf, result rd:x13(0x0000000000001000)
    la  x14, test_data
    addi    x14, x14,58
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    lh x13, -33(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_83_0)

    # Testcase 246:  imm:0xfbf, result rd:x14(0x0000000000002000)
    la  x15, test_data
    addi    x15, x15,60
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    lh x14, -65(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000002000)

    # Testcase 247:  imm:0xf7f, result rd:x15(0x0000000000004000)
    la  x16, test_data
    addi    x16, x16,62
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    lh x15, -129(x16)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000004000)

    # Testcase 248:  imm:0xeff, result rd:x16(0xffffffffffff8000)
    la  x17, test_data
    addi    x17, x17,64
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    lh x16, -257(x17)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_84_0)

    # Testcase 249:  imm:0xdff, result rd:x17(0x0000000000000000)
    la  x18, test_data
    addi    x18, x18,66
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    lh x17, -513(x18)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000000000)

    # Testcase 250:  imm:0xbff, result rd:x18(0xfffffffffffffffe)
    la  x19, test_data
    addi    x19, x19,68
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    lh x18, -1025(x19)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfffffffffffffffe)

    # Testcase 251:  imm:0x7ff, result rd:x19(0xfffffffffffffffd)
    la  x20, test_data
    addi    x20, x20,70
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    lh x19, 2047(x20)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_85_0)

    # Testcase 252:  imm:0xffe, result rd:x20(0xfffffffffffffffe)
    la  x21, test_data
    addi    x21, x21,0
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    lh x20, -2(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xfffffffffffffffe)

    # Testcase 253:  imm:0xffd, result rd:x21(0xfffffffffffffffd)
    la  x22, test_data
    addi    x22, x22,2
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    lh x21, -3(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0xfffffffffffffffd)

    # Testcase 254:  imm:0xffb, result rd:x22(0xfffffffffffffffb)
    la  x23, test_data
    addi    x23, x23,4
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    lh x22, -5(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_86_0)

    # Testcase 255:  imm:0xff7, result rd:x23(0xfffffffffffffff7)
    la  x24, test_data
    addi    x24, x24,6
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    lh x23, -9(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xfffffffffffffff7)

    # Testcase 256:  imm:0xfef, result rd:x24(0xffffffffffffffef)
    la  x25, test_data
    addi    x25, x25,8
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    lh x24, -17(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xffffffffffffffef)

    # Testcase 257:  imm:0xfdf, result rd:x25(0xffffffffffffffdf)
    la  x26, test_data
    addi    x26, x26,10
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    lh x25, -33(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x1,signature_87_0)

    # Testcase 258:  imm:0xfbf, result rd:x26(0xffffffffffffffbf)
    la  x27, test_data
    addi    x27, x27,12
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    lh x26, -65(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xffffffffffffffbf)

    # Testcase 259:  imm:0xf7f, result rd:x27(0xffffffffffffff7f)
    la  x28, test_data
    addi    x28, x28,14
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    lh x27, -129(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0xffffffffffffff7f)

    # Testcase 260:  imm:0xeff, result rd:x28(0xfffffffffffffeff)
    la  x29, test_data
    addi    x29, x29,16
    li     x2, MASK_XLEN(257)
    add    x29, x29, x2
    lh x28, -257(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xfffffffffffffeff)



    

    RVTEST_SIGBASE(x2,signature_88_0)

    # Testcase 261:  imm:0xdff, result rd:x29(0xfffffffffffffdff)
    la  x30, test_data
    addi    x30, x30,18
    li     x3, MASK_XLEN(513)
    add    x30, x30, x3
    lh x29, -513(x30)
    sd x29, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffffffffdff)

    # Testcase 262:  imm:0xbff, result rd:x30(0xfffffffffffffeff)
    la  x31, test_data
    addi    x31, x31,20
    li     x3, MASK_XLEN(1025)
    add    x31, x31, x3
    lh x30, -1025(x31)
    sd x30, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffffffeff)

    # Testcase 263:  imm:0x7ff, result rd:x31(0xfffffffffffff7ff)
    la  x1, test_data
    addi    x1, x1,22
    li     x3, MASK_XLEN(-2047)
    add    x1, x1, x3
    lh x31, 2047(x1)
    sd x31, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffffffff7ff)



    

    RVTEST_SIGBASE(x4,signature_89_0)

    # Testcase 264:  imm:0xffe, result rd:x1(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,24
    li     x5, MASK_XLEN(2)
    add    x2, x2, x5
    lh x1, -2(x2)
    sd x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xffffffffffffefff)

    # Testcase 265:  imm:0xffd, result rd:x1(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,26
    li     x5, MASK_XLEN(3)
    add    x2, x2, x5
    lh x1, -3(x2)
    sd x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xffffffffffffdfff)

    # Testcase 266:  imm:0xffb, result rd:x2(0xffffffffffffefff)
    la  x3, test_data
    addi    x3, x3,28
    li     x5, MASK_XLEN(5)
    add    x3, x3, x5
    lh x2, -5(x3)
    sd x2, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0xffffffffffffefff)



    

    RVTEST_SIGBASE(x1,signature_90_0)

    # Testcase 267:  imm:0xff7, result rd:x3(0x0000000000007fff)
    la  x4, test_data
    addi    x4, x4,30
    li     x2, MASK_XLEN(9)
    add    x4, x4, x2
    lh x3, -9(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000007fff)

    # Testcase 268:  imm:0xfef, result rd:x4(0xffffffffffffffff)
    la  x5, test_data
    addi    x5, x5,32
    li     x2, MASK_XLEN(17)
    add    x5, x5, x2
    lh x4, -17(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffffffffffff)

    # Testcase 269:  imm:0xfdf, result rd:x5(0x0000000000000001)
    la  x6, test_data
    addi    x6, x6,34
    li     x2, MASK_XLEN(33)
    add    x6, x6, x2
    lh x5, -33(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x5, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_91_0)

    # Testcase 270:  imm:0xfbf, result rd:x6(0x0000000000000002)
    la  x7, test_data
    addi    x7, x7,36
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    lh x6, -65(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000002)

    # Testcase 271:  imm:0xf7f, result rd:x7(0x0000000000000004)
    la  x8, test_data
    addi    x8, x8,38
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    lh x7, -129(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000000004)

    # Testcase 272:  imm:0xeff, result rd:x8(0x0000000000000008)
    la  x9, test_data
    addi    x9, x9,40
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    lh x8, -257(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_92_0)

    # Testcase 273:  imm:0xdff, result rd:x9(0x0000000000000010)
    la  x10, test_data
    addi    x10, x10,42
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    lh x9, -513(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000010)

    # Testcase 274:  imm:0xbff, result rd:x10(0x0000000000000020)
    la  x11, test_data
    addi    x11, x11,44
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    lh x10, -1025(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000020)

    # Testcase 275:  imm:0x7ff, result rd:x11(0x0000000000000040)
    la  x12, test_data
    addi    x12, x12,46
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    lh x11, 2047(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000040)



    

    RVTEST_SIGBASE(x1,signature_93_0)

    # Testcase 276:  imm:0xffe, result rd:x12(0x0000000000000080)
    la  x13, test_data
    addi    x13, x13,48
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lh x12, -2(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000080)

    # Testcase 277:  imm:0xffd, result rd:x13(0x0000000000000100)
    la  x14, test_data
    addi    x14, x14,50
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lh x13, -3(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000100)

    # Testcase 278:  imm:0xffb, result rd:x14(0x0000000000000200)
    la  x15, test_data
    addi    x15, x15,52
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lh x14, -5(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_94_0)

    # Testcase 279:  imm:0xff7, result rd:x15(0x0000000000000400)
    la  x16, test_data
    addi    x16, x16,54
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lh x15, -9(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000400)

    # Testcase 280:  imm:0xfef, result rd:x16(0x0000000000000800)
    la  x17, test_data
    addi    x17, x17,56
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lh x16, -17(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000000800)

    # Testcase 281:  imm:0xfdf, result rd:x17(0x0000000000001000)
    la  x18, test_data
    addi    x18, x18,58
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lh x17, -33(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000001000)



    

    RVTEST_SIGBASE(x1,signature_95_0)

    # Testcase 282:  imm:0xfbf, result rd:x18(0x0000000000002000)
    la  x19, test_data
    addi    x19, x19,60
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lh x18, -65(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000002000)

    # Testcase 283:  imm:0xf7f, result rd:x19(0x0000000000004000)
    la  x20, test_data
    addi    x20, x20,62
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lh x19, -129(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000004000)

    # Testcase 284:  imm:0xeff, result rd:x20(0xffffffffffff8000)
    la  x21, test_data
    addi    x21, x21,64
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lh x20, -257(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0xffffffffffff8000)



    

    RVTEST_SIGBASE(x1,signature_96_0)

    # Testcase 285:  imm:0xdff, result rd:x21(0x0000000000000000)
    la  x22, test_data
    addi    x22, x22,66
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lh x21, -513(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000000000)

    # Testcase 286:  imm:0xbff, result rd:x22(0xfffffffffffffffe)
    la  x23, test_data
    addi    x23, x23,68
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lh x22, -1025(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0xfffffffffffffffe)

    # Testcase 287:  imm:0x7ff, result rd:x23(0xfffffffffffffffd)
    la  x24, test_data
    addi    x24, x24,70
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lh x23, 2047(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0xfffffffffffffffd)



    

    RVTEST_SIGBASE(x1,signature_97_0)

    # Testcase 288:  imm:0xffe, result rd:x24(0xfffffffffffffffe)
    la  x25, test_data
    addi    x25, x25,0
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lh x24, -2(x25)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0xfffffffffffffffe)

    # Testcase 289:  imm:0xffd, result rd:x25(0xfffffffffffffffd)
    la  x26, test_data
    addi    x26, x26,2
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lh x25, -3(x26)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0xfffffffffffffffd)

    # Testcase 290:  imm:0xffb, result rd:x26(0xfffffffffffffffb)
    la  x27, test_data
    addi    x27, x27,4
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lh x26, -5(x27)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0xfffffffffffffffb)



    

    RVTEST_SIGBASE(x1,signature_98_0)

    # Testcase 291:  imm:0xff7, result rd:x27(0xfffffffffffffff7)
    la  x28, test_data
    addi    x28, x28,6
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lh x27, -9(x28)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0xfffffffffffffff7)

    # Testcase 292:  imm:0xfef, result rd:x28(0xffffffffffffffef)
    la  x29, test_data
    addi    x29, x29,8
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lh x28, -17(x29)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0xffffffffffffffef)

    # Testcase 293:  imm:0xfdf, result rd:x29(0xffffffffffffffdf)
    la  x30, test_data
    addi    x30, x30,10
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    lh x29, -33(x30)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0xffffffffffffffdf)



    

    RVTEST_SIGBASE(x2,signature_99_0)

    # Testcase 294:  imm:0xfbf, result rd:x30(0xffffffffffffffbf)
    la  x31, test_data
    addi    x31, x31,12
    li     x4, MASK_XLEN(65)
    add    x31, x31, x4
    lh x30, -65(x31)
    sd x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffffffffffbf)

    # Testcase 295:  imm:0xf7f, result rd:x31(0xffffffffffffff7f)
    la  x1, test_data
    addi    x1, x1,14
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    lh x31, -129(x1)
    sd x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xffffffffffffff7f)

    # Testcase 296:  imm:0xf6a, result rd:x0(0x0000000000000000)
    la  x3, test_data
    addi    x3, x3,16
    li     x4, MASK_XLEN(150)
    add    x3, x3, x4
    lh x0, -150(x3)
    sd x0, 16(x2)
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

	.dword 0xfff7fffbfffdfffe
	.dword 0xff7fffbfffdfffef
	.dword 0xf7fffefffdfffeff
	.dword 0x7fffefffdfffefff
	.dword 0x000400020001ffff
	.dword 0x0040002000100008
	.dword 0x0400020001000080
	.dword 0x4000200010000800
	.dword 0xfffdfffe00008000

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

