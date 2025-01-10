// RISC-V Architectural Validation Test LWU-01
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
// Description: Testing instruction 'LWU'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",lwu)

    RVTEST_SIGBASE(x4,signature_1_0)

    # Testcase 0:  imm:0xd27, result rd:x19(0x00000000fffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x5, MASK_XLEN(729)
    add    x29, x29, x5
    lwu x19, -729(x29)
    sd x19, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x19, 0x00000000fffffffe)

    # Testcase 1:  imm:0xa51, result rd:x30(0x00000000fffffffd)
    la  x21, test_data
    addi    x21, x21,4
    li     x5, MASK_XLEN(1455)
    add    x21, x21, x5
    lwu x30, -1455(x21)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x30, 0x00000000fffffffd)

    # Testcase 2:  imm:0xc65, result rd:x10(0x00000000fffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x5, MASK_XLEN(923)
    add    x2, x2, x5
    lwu x10, -923(x2)
    sd x10, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x10, 0x00000000fffffffb)

    # Testcase 3:  imm:0xa64, result rd:x3(0x00000000fffffff7)
    la  x1, test_data
    addi    x1, x1,12
    li     x5, MASK_XLEN(1436)
    add    x1, x1, x5
    lwu x3, -1436(x1)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x00000000fffffff7)

    # Testcase 4:  imm:0xc1e, result rd:x29(0x00000000ffffffef)
    la  x6, test_data
    addi    x6, x6,16
    li     x5, MASK_XLEN(994)
    add    x6, x6, x5
    lwu x29, -994(x6)
    sd x29, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x29, 0x00000000ffffffef)



    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0xadf, result rd:x0(0x0000000000000000)
    la  x14, test_data
    addi    x14, x14,20
    li     x2, MASK_XLEN(1313)
    add    x14, x14, x2
    lwu x0, -1313(x14)
    sd x0, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)

    # Testcase 6:  imm:0xae7, result rd:x4(0x00000000ffffffbf)
    la  x12, test_data
    addi    x12, x12,24
    li     x2, MASK_XLEN(1305)
    add    x12, x12, x2
    lwu x4, -1305(x12)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x00000000ffffffbf)

    # Testcase 7:  imm:0x3d1, result rd:x25(0x00000000ffffff7f)
    la  x3, test_data
    addi    x3, x3,28
    li     x2, MASK_XLEN(-977)
    add    x3, x3, x2
    lwu x25, 977(x3)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0x00000000ffffff7f)

    # Testcase 8:  imm:0xff4, result rd:x18(0x00000000fffffeff)
    la  x19, test_data
    addi    x19, x19,32
    li     x2, MASK_XLEN(12)
    add    x19, x19, x2
    lwu x18, -12(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0x00000000fffffeff)

    # Testcase 9:  imm:0x4c0, result rd:x7(0x00000000fffffdff)
    la  x10, test_data
    addi    x10, x10,36
    li     x2, MASK_XLEN(-1216)
    add    x10, x10, x2
    lwu x7, 1216(x10)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x7, 0x00000000fffffdff)



    

    RVTEST_SIGBASE(x3,signature_3_0)

    # Testcase 10:  imm:0x63e, result rd:x31(0x00000000fffffeff)
    la  x18, test_data
    addi    x18, x18,40
    li     x4, MASK_XLEN(-1598)
    add    x18, x18, x4
    lwu x31, 1598(x18)
    sd x31, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x00000000fffffeff)

    # Testcase 11:  imm:0x9ae, result rd:x23(0x00000000fffff7ff)
    la  x1, test_data
    addi    x1, x1,44
    li     x4, MASK_XLEN(1618)
    add    x1, x1, x4
    lwu x23, -1618(x1)
    sd x23, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x23, 0x00000000fffff7ff)

    # Testcase 12:  imm:0x650, result rd:x21(0x00000000ffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x4, MASK_XLEN(-1616)
    add    x2, x2, x4
    lwu x21, 1616(x2)
    sd x21, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0x00000000ffffefff)

    # Testcase 13:  imm:0x71, result rd:x30(0x00000000ffffdfff)
    la  x1, test_data
    addi    x1, x1,52
    li     x4, MASK_XLEN(-113)
    add    x1, x1, x4
    lwu x30, 113(x1)
    sd x30, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x00000000ffffdfff)

    # Testcase 14:  imm:0xdd8, result rd:x17(0x00000000ffffefff)
    la  x1, test_data
    addi    x1, x1,56
    li     x4, MASK_XLEN(552)
    add    x1, x1, x4
    lwu x17, -552(x1)
    sd x17, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x17, 0x00000000ffffefff)



    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0xb6d, result rd:x6(0x00000000ffff7fff)
    la  x12, test_data
    addi    x12, x12,60
    li     x4, MASK_XLEN(1171)
    add    x12, x12, x4
    lwu x6, -1171(x12)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x6, 0x00000000ffff7fff)

    # Testcase 16:  imm:0x8a5, result rd:x22(0x00000000fffeffff)
    la  x10, test_data
    addi    x10, x10,64
    li     x4, MASK_XLEN(1883)
    add    x10, x10, x4
    lwu x22, -1883(x10)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0x00000000fffeffff)

    # Testcase 17:  imm:0x621, result rd:x2(0x00000000fffdffff)
    la  x8, test_data
    addi    x8, x8,68
    li     x4, MASK_XLEN(-1569)
    add    x8, x8, x4
    lwu x2, 1569(x8)
    sd x2, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x00000000fffdffff)

    # Testcase 18:  imm:0xba8, result rd:x13(0x00000000fffbffff)
    la  x8, test_data
    addi    x8, x8,72
    li     x4, MASK_XLEN(1112)
    add    x8, x8, x4
    lwu x13, -1112(x8)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x13, 0x00000000fffbffff)

    # Testcase 19:  imm:0x81b, result rd:x3(0x00000000fff7ffff)
    la  x14, test_data
    addi    x14, x14,76
    li     x4, MASK_XLEN(2021)
    add    x14, x14, x4
    lwu x3, -2021(x14)
    sd x3, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x00000000fff7ffff)



    

    RVTEST_SIGBASE(x2,signature_5_0)

    # Testcase 20:  imm:0xd8c, result rd:x24(0x00000000ffefffff)
    la  x13, test_data
    addi    x13, x13,80
    li     x5, MASK_XLEN(628)
    add    x13, x13, x5
    lwu x24, -628(x13)
    sd x24, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x24, 0x00000000ffefffff)

    # Testcase 21:  imm:0xeb5, result rd:x3(0x00000000ffdfffff)
    la  x18, test_data
    addi    x18, x18,84
    li     x5, MASK_XLEN(331)
    add    x18, x18, x5
    lwu x3, -331(x18)
    sd x3, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000000ffdfffff)

    # Testcase 22:  imm:0xd04, result rd:x14(0x00000000ffbfffff)
    la  x1, test_data
    addi    x1, x1,88
    li     x5, MASK_XLEN(764)
    add    x1, x1, x5
    lwu x14, -764(x1)
    sd x14, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x14, 0x00000000ffbfffff)

    # Testcase 23:  imm:0x686, result rd:x20(0x00000000ff7fffff)
    la  x19, test_data
    addi    x19, x19,92
    li     x5, MASK_XLEN(-1670)
    add    x19, x19, x5
    lwu x20, 1670(x19)
    sd x20, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x20, 0x00000000ff7fffff)

    # Testcase 24:  imm:0x92c, result rd:x4(0x00000000feffffff)
    la  x30, test_data
    addi    x30, x30,96
    li     x5, MASK_XLEN(1748)
    add    x30, x30, x5
    lwu x4, -1748(x30)
    sd x4, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x00000000feffffff)



    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 25:  imm:0x156, result rd:x29(0x00000000fdffffff)
    la  x31, test_data
    addi    x31, x31,100
    li     x5, MASK_XLEN(-342)
    add    x31, x31, x5
    lwu x29, 342(x31)
    sd x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0x00000000fdffffff)

    # Testcase 26:  imm:0x1d4, result rd:x17(0x00000000feffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x5, MASK_XLEN(-468)
    add    x2, x2, x5
    lwu x17, 468(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x17, 0x00000000feffffff)

    # Testcase 27:  imm:0x678, result rd:x22(0x00000000f7ffffff)
    la  x4, test_data
    addi    x4, x4,108
    li     x5, MASK_XLEN(-1656)
    add    x4, x4, x5
    lwu x22, 1656(x4)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x22, 0x00000000f7ffffff)

    # Testcase 28:  imm:0xddc, result rd:x3(0x00000000efffffff)
    la  x20, test_data
    addi    x20, x20,112
    li     x5, MASK_XLEN(548)
    add    x20, x20, x5
    lwu x3, -548(x20)
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000000efffffff)

    # Testcase 29:  imm:0x532, result rd:x15(0x00000000dfffffff)
    la  x14, test_data
    addi    x14, x14,116
    li     x5, MASK_XLEN(-1330)
    add    x14, x14, x5
    lwu x15, 1330(x14)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x15, 0x00000000dfffffff)



    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x28(0x00000000efffffff)
    la  x7, test_data
    addi    x7, x7,120
    li     x2, MASK_XLEN(0)
    add    x7, x7, x2
    lwu x28, 0(x7)
    sd x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000efffffff)

    # Testcase 31:  imm:0xfff, result rd:x14(0x000000007fffffff)
    la  x7, test_data
    addi    x7, x7,124
    li     x2, MASK_XLEN(1)
    add    x7, x7, x2
    lwu x14, -1(x7)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x000000007fffffff)

    # Testcase 32:  imm:0xfff, result rd:x9(0x00000000ffffffff)
    la  x18, test_data
    addi    x18, x18,128
    li     x2, MASK_XLEN(1)
    add    x18, x18, x2
    lwu x9, -1(x18)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000ffffffff)

    # Testcase 33:  imm:0xfff, result rd:x10(0x0000000000000001)
    la  x15, test_data
    addi    x15, x15,132
    li     x2, MASK_XLEN(1)
    add    x15, x15, x2
    lwu x10, -1(x15)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000001)

    # Testcase 34:  imm:0x0, result rd:x6(0x0000000000000002)
    la  x23, test_data
    addi    x23, x23,136
    li     x2, MASK_XLEN(0)
    add    x23, x23, x2
    lwu x6, 0(x23)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000002)



    

    RVTEST_SIGBASE(x3,signature_8_0)

    # Testcase 35:  imm:0xfff, result rd:x0(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,140
    li     x4, MASK_XLEN(1)
    add    x2, x2, x4
    lwu x0, -1(x2)
    sd x0, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x0, 0x0000000000000000)

    # Testcase 36:  imm:0xfff, result rd:x19(0x0000000000000008)
    la  x29, test_data
    addi    x29, x29,144
    li     x4, MASK_XLEN(1)
    add    x29, x29, x4
    lwu x19, -1(x29)
    sd x19, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0x0000000000000008)

    # Testcase 37:  imm:0xfff, result rd:x19(0x0000000000000010)
    la  x1, test_data
    addi    x1, x1,148
    li     x4, MASK_XLEN(1)
    add    x1, x1, x4
    lwu x19, -1(x1)
    sd x19, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0x0000000000000010)

    # Testcase 38:  imm:0x0, result rd:x30(0x0000000000000020)
    la  x28, test_data
    addi    x28, x28,152
    li     x4, MASK_XLEN(0)
    add    x28, x28, x4
    lwu x30, 0(x28)
    sd x30, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000000000020)

    # Testcase 39:  imm:0xfff, result rd:x21(0x0000000000000040)
    la  x24, test_data
    addi    x24, x24,156
    li     x4, MASK_XLEN(1)
    add    x24, x24, x4
    lwu x21, -1(x24)
    sd x21, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x21, 0x0000000000000040)



    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Testcase 40:  imm:0x1, result rd:x1(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x7, MASK_XLEN(-1)
    add    x2, x2, x7
    lwu x1, 1(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000000000080)

    # Testcase 41:  imm:0x2, result rd:x1(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x7, MASK_XLEN(-2)
    add    x2, x2, x7
    lwu x1, 2(x2)
    sd x1, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000000000100)

    # Testcase 42:  imm:0x4, result rd:x2(0x0000000000000200)
    la  x3, test_data
    addi    x3, x3,168
    li     x7, MASK_XLEN(-4)
    add    x3, x3, x7
    lwu x2, 4(x3)
    sd x2, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x2, 0x0000000000000200)

    # Testcase 43:  imm:0x8, result rd:x3(0x0000000000000400)
    la  x4, test_data
    addi    x4, x4,172
    li     x7, MASK_XLEN(-8)
    add    x4, x4, x7
    lwu x3, 8(x4)
    sd x3, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000400)

    # Testcase 44:  imm:0x10, result rd:x4(0x0000000000000800)
    la  x5, test_data
    addi    x5, x5,176
    li     x7, MASK_XLEN(-16)
    add    x5, x5, x7
    lwu x4, 16(x5)
    sd x4, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x0000000000000800)



    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x20, result rd:x5(0x0000000000001000)
    la  x6, test_data
    addi    x6, x6,180
    li     x2, MASK_XLEN(-32)
    add    x6, x6, x2
    lwu x5, 32(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x0000000000001000)

    # Testcase 46:  imm:0x40, result rd:x6(0x0000000000002000)
    la  x7, test_data
    addi    x7, x7,184
    li     x2, MASK_XLEN(-64)
    add    x7, x7, x2
    lwu x6, 64(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000002000)

    # Testcase 47:  imm:0x80, result rd:x7(0x0000000000004000)
    la  x8, test_data
    addi    x8, x8,188
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    lwu x7, 128(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000004000)

    # Testcase 48:  imm:0x100, result rd:x8(0x0000000000008000)
    la  x9, test_data
    addi    x9, x9,192
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    lwu x8, 256(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000008000)

    # Testcase 49:  imm:0x200, result rd:x9(0x0000000000000001)
    la  x10, test_data
    addi    x10, x10,196
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    lwu x9, 512(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000001)



    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x400, result rd:x10(0x0000000000000002)
    la  x11, test_data
    addi    x11, x11,200
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    lwu x10, 1024(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000002)

    # Testcase 51:  imm:0x800, result rd:x11(0x0000000000040000)
    la  x12, test_data
    addi    x12, x12,204
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    lwu x11, -2048(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000040000)

    # Testcase 52:  imm:0xffe, result rd:x12(0x0000000000080000)
    la  x13, test_data
    addi    x13, x13,208
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lwu x12, -2(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000080000)

    # Testcase 53:  imm:0xffd, result rd:x13(0x0000000000000010)
    la  x14, test_data
    addi    x14, x14,212
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lwu x13, -3(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000010)

    # Testcase 54:  imm:0xffb, result rd:x14(0x0000000000000020)
    la  x15, test_data
    addi    x15, x15,216
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lwu x14, -5(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000020)



    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0xff7, result rd:x15(0x0000000000400000)
    la  x16, test_data
    addi    x16, x16,220
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lwu x15, -9(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000400000)

    # Testcase 56:  imm:0xfef, result rd:x16(0x0000000000800000)
    la  x17, test_data
    addi    x17, x17,224
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lwu x16, -17(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000800000)

    # Testcase 57:  imm:0xfdf, result rd:x17(0x0000000000000100)
    la  x18, test_data
    addi    x18, x18,228
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lwu x17, -33(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000000100)

    # Testcase 58:  imm:0xfbf, result rd:x18(0x0000000000000200)
    la  x19, test_data
    addi    x19, x19,232
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lwu x18, -65(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000000200)

    # Testcase 59:  imm:0xf7f, result rd:x19(0x0000000004000000)
    la  x20, test_data
    addi    x20, x20,236
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lwu x19, -129(x20)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000004000000)



    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0xeff, result rd:x20(0x0000000008000000)
    la  x21, test_data
    addi    x21, x21,240
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lwu x20, -257(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000008000000)

    # Testcase 61:  imm:0xdff, result rd:x21(0x0000000000001000)
    la  x22, test_data
    addi    x22, x22,244
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lwu x21, -513(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000001000)

    # Testcase 62:  imm:0xbff, result rd:x22(0x0000000000002000)
    la  x23, test_data
    addi    x23, x23,248
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lwu x22, -1025(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000002000)

    # Testcase 63:  imm:0x7ff, result rd:x23(0x0000000040000000)
    la  x24, test_data
    addi    x24, x24,252
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lwu x23, 2047(x24)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000040000000)

    # Testcase 64:  imm:0xffe, result rd:x24(0x0000000080000000)
    la  x25, test_data
    addi    x25, x25,256
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lwu x24, -2(x25)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000080000000)



    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0xffd, result rd:x25(0x0000000000000000)
    la  x26, test_data
    addi    x26, x26,260
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lwu x25, -3(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000000000)

    # Testcase 66:  imm:0xffb, result rd:x26(0x00000000fffffffe)
    la  x27, test_data
    addi    x27, x27,0
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lwu x26, -5(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x00000000fffffffe)

    # Testcase 67:  imm:0xff7, result rd:x27(0x00000000fffffffd)
    la  x28, test_data
    addi    x28, x28,4
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lwu x27, -9(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x00000000fffffffd)

    # Testcase 68:  imm:0xfef, result rd:x28(0x00000000fffffffb)
    la  x29, test_data
    addi    x29, x29,8
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lwu x28, -17(x29)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000fffffffb)

    # Testcase 69:  imm:0xfdf, result rd:x29(0x00000000fffffff7)
    la  x30, test_data
    addi    x30, x30,12
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    lwu x29, -33(x30)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x00000000fffffff7)



    

    RVTEST_SIGBASE(x4,signature_15_0)

    # Testcase 70:  imm:0xfbf, result rd:x30(0x00000000ffffffef)
    la  x31, test_data
    addi    x31, x31,16
    li     x5, MASK_XLEN(65)
    add    x31, x31, x5
    lwu x30, -65(x31)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x00000000ffffffef)

    # Testcase 71:  imm:0xf7f, result rd:x31(0x00000000ffffffdf)
    la  x1, test_data
    addi    x1, x1,20
    li     x5, MASK_XLEN(129)
    add    x1, x1, x5
    lwu x31, -129(x1)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x00000000ffffffdf)

    # Testcase 72:  imm:0xeff, result rd:x1(0x00000000ffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x5, MASK_XLEN(257)
    add    x2, x2, x5
    lwu x1, -257(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x00000000ffffffbf)

    # Testcase 73:  imm:0xdff, result rd:x1(0x00000000ffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x5, MASK_XLEN(513)
    add    x2, x2, x5
    lwu x1, -513(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x00000000ffffff7f)

    # Testcase 74:  imm:0xbff, result rd:x2(0x00000000fffffeff)
    la  x3, test_data
    addi    x3, x3,32
    li     x5, MASK_XLEN(1025)
    add    x3, x3, x5
    lwu x2, -1025(x3)
    sd x2, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x00000000fffffeff)



    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x7ff, result rd:x3(0x00000000fffffdff)
    la  x4, test_data
    addi    x4, x4,36
    li     x2, MASK_XLEN(-2047)
    add    x4, x4, x2
    lwu x3, 2047(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x00000000fffffdff)

    # Testcase 76:  imm:0xffe, result rd:x4(0x00000000fffffeff)
    la  x5, test_data
    addi    x5, x5,40
    li     x2, MASK_XLEN(2)
    add    x5, x5, x2
    lwu x4, -2(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x00000000fffffeff)

    # Testcase 77:  imm:0xffd, result rd:x5(0x00000000fffff7ff)
    la  x6, test_data
    addi    x6, x6,44
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    lwu x5, -3(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x00000000fffff7ff)

    # Testcase 78:  imm:0xffb, result rd:x6(0x00000000ffffefff)
    la  x7, test_data
    addi    x7, x7,48
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    lwu x6, -5(x7)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x00000000ffffefff)

    # Testcase 79:  imm:0xff7, result rd:x7(0x00000000ffffdfff)
    la  x8, test_data
    addi    x8, x8,52
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    lwu x7, -9(x8)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x00000000ffffdfff)



    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0xfef, result rd:x8(0x00000000ffffefff)
    la  x9, test_data
    addi    x9, x9,56
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    lwu x8, -17(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000ffffefff)

    # Testcase 81:  imm:0xfdf, result rd:x9(0x00000000ffff7fff)
    la  x10, test_data
    addi    x10, x10,60
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    lwu x9, -33(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000ffff7fff)

    # Testcase 82:  imm:0xfbf, result rd:x10(0x00000000fffeffff)
    la  x11, test_data
    addi    x11, x11,64
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    lwu x10, -65(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000000fffeffff)

    # Testcase 83:  imm:0xf7f, result rd:x11(0x00000000fffdffff)
    la  x12, test_data
    addi    x12, x12,68
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    lwu x11, -129(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000000fffdffff)

    # Testcase 84:  imm:0xeff, result rd:x12(0x00000000fffbffff)
    la  x13, test_data
    addi    x13, x13,72
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    lwu x12, -257(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000000fffbffff)



    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0xdff, result rd:x13(0x00000000fff7ffff)
    la  x14, test_data
    addi    x14, x14,76
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    lwu x13, -513(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000000fff7ffff)

    # Testcase 86:  imm:0xbff, result rd:x14(0x00000000ffefffff)
    la  x15, test_data
    addi    x15, x15,80
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    lwu x14, -1025(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000000ffefffff)

    # Testcase 87:  imm:0x7ff, result rd:x15(0x00000000ffdfffff)
    la  x16, test_data
    addi    x16, x16,84
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    lwu x15, 2047(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000000ffdfffff)

    # Testcase 88:  imm:0xffe, result rd:x16(0x00000000ffbfffff)
    la  x17, test_data
    addi    x17, x17,88
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    lwu x16, -2(x17)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x00000000ffbfffff)

    # Testcase 89:  imm:0xffd, result rd:x17(0x00000000ff7fffff)
    la  x18, test_data
    addi    x18, x18,92
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    lwu x17, -3(x18)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x00000000ff7fffff)



    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0xffb, result rd:x18(0x00000000feffffff)
    la  x19, test_data
    addi    x19, x19,96
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    lwu x18, -5(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x00000000feffffff)

    # Testcase 91:  imm:0xff7, result rd:x19(0x00000000fdffffff)
    la  x20, test_data
    addi    x20, x20,100
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    lwu x19, -9(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x00000000fdffffff)

    # Testcase 92:  imm:0xfef, result rd:x20(0x00000000feffffff)
    la  x21, test_data
    addi    x21, x21,104
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    lwu x20, -17(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x00000000feffffff)

    # Testcase 93:  imm:0xfdf, result rd:x21(0x00000000f7ffffff)
    la  x22, test_data
    addi    x22, x22,108
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    lwu x21, -33(x22)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x00000000f7ffffff)

    # Testcase 94:  imm:0xfbf, result rd:x22(0x00000000efffffff)
    la  x23, test_data
    addi    x23, x23,112
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    lwu x22, -65(x23)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x00000000efffffff)



    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0xf7f, result rd:x23(0x00000000dfffffff)
    la  x24, test_data
    addi    x24, x24,116
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    lwu x23, -129(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x00000000dfffffff)

    # Testcase 96:  imm:0xeff, result rd:x24(0x00000000efffffff)
    la  x25, test_data
    addi    x25, x25,120
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    lwu x24, -257(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x00000000efffffff)

    # Testcase 97:  imm:0xdff, result rd:x25(0x000000007fffffff)
    la  x26, test_data
    addi    x26, x26,124
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    lwu x25, -513(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x000000007fffffff)

    # Testcase 98:  imm:0xbff, result rd:x26(0x00000000ffffffff)
    la  x27, test_data
    addi    x27, x27,128
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    lwu x26, -1025(x27)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x00000000ffffffff)

    # Testcase 99:  imm:0x7ff, result rd:x27(0x0000000000000001)
    la  x28, test_data
    addi    x28, x28,132
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    lwu x27, 2047(x28)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000001)



    

    RVTEST_SIGBASE(x3,signature_21_0)

    # Testcase 100:  imm:0xffe, result rd:x28(0x0000000000000002)
    la  x29, test_data
    addi    x29, x29,136
    li     x4, MASK_XLEN(2)
    add    x29, x29, x4
    lwu x28, -2(x29)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0x0000000000000002)

    # Testcase 101:  imm:0xffd, result rd:x29(0x0000000000000004)
    la  x30, test_data
    addi    x30, x30,140
    li     x4, MASK_XLEN(3)
    add    x30, x30, x4
    lwu x29, -3(x30)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x0000000000000004)

    # Testcase 102:  imm:0xffb, result rd:x30(0x0000000000000008)
    la  x31, test_data
    addi    x31, x31,144
    li     x4, MASK_XLEN(5)
    add    x31, x31, x4
    lwu x30, -5(x31)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000000000008)

    # Testcase 103:  imm:0xff7, result rd:x31(0x0000000000000010)
    la  x1, test_data
    addi    x1, x1,148
    li     x4, MASK_XLEN(9)
    add    x1, x1, x4
    lwu x31, -9(x1)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000010)

    # Testcase 104:  imm:0xfef, result rd:x1(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x4, MASK_XLEN(17)
    add    x2, x2, x4
    lwu x1, -17(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000020)



    

    RVTEST_SIGBASE(x7,signature_22_0)

    # Testcase 105:  imm:0xfdf, result rd:x1(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x8, MASK_XLEN(33)
    add    x2, x2, x8
    lwu x1, -33(x2)
    sd x1, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x1, 0x0000000000000040)

    # Testcase 106:  imm:0xfbf, result rd:x2(0x0000000000000080)
    la  x3, test_data
    addi    x3, x3,160
    li     x8, MASK_XLEN(65)
    add    x3, x3, x8
    lwu x2, -65(x3)
    sd x2, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0x0000000000000080)

    # Testcase 107:  imm:0xf7f, result rd:x3(0x0000000000000100)
    la  x4, test_data
    addi    x4, x4,164
    li     x8, MASK_XLEN(129)
    add    x4, x4, x8
    lwu x3, -129(x4)
    sd x3, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000000000000100)

    # Testcase 108:  imm:0xeff, result rd:x4(0x0000000000000200)
    la  x5, test_data
    addi    x5, x5,168
    li     x8, MASK_XLEN(257)
    add    x5, x5, x8
    lwu x4, -257(x5)
    sd x4, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000000200)

    # Testcase 109:  imm:0xdff, result rd:x5(0x0000000000000400)
    la  x6, test_data
    addi    x6, x6,172
    li     x8, MASK_XLEN(513)
    add    x6, x6, x8
    lwu x5, -513(x6)
    sd x5, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000000000400)



    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0xbff, result rd:x6(0x0000000000000800)
    la  x7, test_data
    addi    x7, x7,176
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    lwu x6, -1025(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x0000000000000800)

    # Testcase 111:  imm:0x7ff, result rd:x7(0x0000000000001000)
    la  x8, test_data
    addi    x8, x8,180
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    lwu x7, 2047(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000001000)

    # Testcase 112:  imm:0xffe, result rd:x8(0x0000000000002000)
    la  x9, test_data
    addi    x9, x9,184
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    lwu x8, -2(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000002000)

    # Testcase 113:  imm:0xffd, result rd:x9(0x0000000000004000)
    la  x10, test_data
    addi    x10, x10,188
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    lwu x9, -3(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000004000)

    # Testcase 114:  imm:0xffb, result rd:x10(0x0000000000008000)
    la  x11, test_data
    addi    x11, x11,192
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    lwu x10, -5(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000008000)



    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0xff7, result rd:x11(0x0000000000000001)
    la  x12, test_data
    addi    x12, x12,196
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    lwu x11, -9(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000001)

    # Testcase 116:  imm:0xfef, result rd:x12(0x0000000000000002)
    la  x13, test_data
    addi    x13, x13,200
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    lwu x12, -17(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000002)

    # Testcase 117:  imm:0xfdf, result rd:x13(0x0000000000040000)
    la  x14, test_data
    addi    x14, x14,204
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    lwu x13, -33(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000040000)

    # Testcase 118:  imm:0xfbf, result rd:x14(0x0000000000080000)
    la  x15, test_data
    addi    x15, x15,208
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    lwu x14, -65(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000080000)

    # Testcase 119:  imm:0xf7f, result rd:x15(0x0000000000000010)
    la  x16, test_data
    addi    x16, x16,212
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    lwu x15, -129(x16)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000010)



    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0xeff, result rd:x16(0x0000000000000020)
    la  x17, test_data
    addi    x17, x17,216
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    lwu x16, -257(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000000020)

    # Testcase 121:  imm:0xdff, result rd:x17(0x0000000000400000)
    la  x18, test_data
    addi    x18, x18,220
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    lwu x17, -513(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000400000)

    # Testcase 122:  imm:0xbff, result rd:x18(0x0000000000800000)
    la  x19, test_data
    addi    x19, x19,224
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    lwu x18, -1025(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000800000)

    # Testcase 123:  imm:0x7ff, result rd:x19(0x0000000000000100)
    la  x20, test_data
    addi    x20, x20,228
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    lwu x19, 2047(x20)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000000100)

    # Testcase 124:  imm:0xffe, result rd:x20(0x0000000000000200)
    la  x21, test_data
    addi    x21, x21,232
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    lwu x20, -2(x21)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0xffd, result rd:x21(0x0000000004000000)
    la  x22, test_data
    addi    x22, x22,236
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    lwu x21, -3(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000004000000)

    # Testcase 126:  imm:0xffb, result rd:x22(0x0000000008000000)
    la  x23, test_data
    addi    x23, x23,240
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    lwu x22, -5(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000008000000)

    # Testcase 127:  imm:0xff7, result rd:x23(0x0000000000001000)
    la  x24, test_data
    addi    x24, x24,244
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    lwu x23, -9(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000001000)

    # Testcase 128:  imm:0xfef, result rd:x24(0x0000000000002000)
    la  x25, test_data
    addi    x25, x25,248
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    lwu x24, -17(x25)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000000002000)

    # Testcase 129:  imm:0xfdf, result rd:x25(0x0000000040000000)
    la  x26, test_data
    addi    x26, x26,252
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    lwu x25, -33(x26)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000040000000)



    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 130:  imm:0xfbf, result rd:x26(0x0000000080000000)
    la  x27, test_data
    addi    x27, x27,256
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    lwu x26, -65(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000080000000)

    # Testcase 131:  imm:0xf7f, result rd:x27(0x0000000000000000)
    la  x28, test_data
    addi    x28, x28,260
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    lwu x27, -129(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000000000)

    # Testcase 132:  imm:0xeff, result rd:x28(0x00000000fffffffe)
    la  x29, test_data
    addi    x29, x29,0
    li     x2, MASK_XLEN(257)
    add    x29, x29, x2
    lwu x28, -257(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000fffffffe)

    # Testcase 133:  imm:0xdff, result rd:x29(0x00000000fffffffd)
    la  x30, test_data
    addi    x30, x30,4
    li     x2, MASK_XLEN(513)
    add    x30, x30, x2
    lwu x29, -513(x30)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x00000000fffffffd)

    # Testcase 134:  imm:0xbff, result rd:x30(0x00000000fffffffb)
    la  x31, test_data
    addi    x31, x31,8
    li     x2, MASK_XLEN(1025)
    add    x31, x31, x2
    lwu x30, -1025(x31)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x00000000fffffffb)



    

    RVTEST_SIGBASE(x5,signature_28_0)

    # Testcase 135:  imm:0x7ff, result rd:x31(0x00000000fffffff7)
    la  x1, test_data
    addi    x1, x1,12
    li     x6, MASK_XLEN(-2047)
    add    x1, x1, x6
    lwu x31, 2047(x1)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0x00000000fffffff7)

    # Testcase 136:  imm:0xffe, result rd:x1(0x00000000ffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x6, MASK_XLEN(2)
    add    x2, x2, x6
    lwu x1, -2(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x00000000ffffffef)

    # Testcase 137:  imm:0xffd, result rd:x1(0x00000000ffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x6, MASK_XLEN(3)
    add    x2, x2, x6
    lwu x1, -3(x2)
    sd x1, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x00000000ffffffdf)

    # Testcase 138:  imm:0xffb, result rd:x2(0x00000000ffffffbf)
    la  x3, test_data
    addi    x3, x3,24
    li     x6, MASK_XLEN(5)
    add    x3, x3, x6
    lwu x2, -5(x3)
    sd x2, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x2, 0x00000000ffffffbf)

    # Testcase 139:  imm:0xff7, result rd:x3(0x00000000ffffff7f)
    la  x4, test_data
    addi    x4, x4,28
    li     x6, MASK_XLEN(9)
    add    x4, x4, x6
    lwu x3, -9(x4)
    sd x3, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x00000000ffffff7f)



    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0xfef, result rd:x4(0x00000000fffffeff)
    la  x5, test_data
    addi    x5, x5,32
    li     x2, MASK_XLEN(17)
    add    x5, x5, x2
    lwu x4, -17(x5)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000fffffeff)

    # Testcase 141:  imm:0xfdf, result rd:x5(0x00000000fffffdff)
    la  x6, test_data
    addi    x6, x6,36
    li     x2, MASK_XLEN(33)
    add    x6, x6, x2
    lwu x5, -33(x6)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x00000000fffffdff)

    # Testcase 142:  imm:0xfbf, result rd:x6(0x00000000fffffeff)
    la  x7, test_data
    addi    x7, x7,40
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    lwu x6, -65(x7)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x00000000fffffeff)

    # Testcase 143:  imm:0xf7f, result rd:x7(0x00000000fffff7ff)
    la  x8, test_data
    addi    x8, x8,44
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    lwu x7, -129(x8)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x00000000fffff7ff)

    # Testcase 144:  imm:0xeff, result rd:x8(0x00000000ffffefff)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    lwu x8, -257(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000ffffefff)



    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0xdff, result rd:x9(0x00000000ffffdfff)
    la  x10, test_data
    addi    x10, x10,52
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    lwu x9, -513(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000ffffdfff)

    # Testcase 146:  imm:0xbff, result rd:x10(0x00000000ffffefff)
    la  x11, test_data
    addi    x11, x11,56
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    lwu x10, -1025(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000000ffffefff)

    # Testcase 147:  imm:0x7ff, result rd:x11(0x00000000ffff7fff)
    la  x12, test_data
    addi    x12, x12,60
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    lwu x11, 2047(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000000ffff7fff)

    # Testcase 148:  imm:0xffe, result rd:x12(0x00000000fffeffff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lwu x12, -2(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000000fffeffff)

    # Testcase 149:  imm:0xffd, result rd:x13(0x00000000fffdffff)
    la  x14, test_data
    addi    x14, x14,68
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lwu x13, -3(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000000fffdffff)



    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0xffb, result rd:x14(0x00000000fffbffff)
    la  x15, test_data
    addi    x15, x15,72
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lwu x14, -5(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000000fffbffff)

    # Testcase 151:  imm:0xff7, result rd:x15(0x00000000fff7ffff)
    la  x16, test_data
    addi    x16, x16,76
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lwu x15, -9(x16)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000000fff7ffff)

    # Testcase 152:  imm:0xfef, result rd:x16(0x00000000ffefffff)
    la  x17, test_data
    addi    x17, x17,80
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lwu x16, -17(x17)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x00000000ffefffff)

    # Testcase 153:  imm:0xfdf, result rd:x17(0x00000000ffdfffff)
    la  x18, test_data
    addi    x18, x18,84
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lwu x17, -33(x18)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x00000000ffdfffff)

    # Testcase 154:  imm:0xfbf, result rd:x18(0x00000000ffbfffff)
    la  x19, test_data
    addi    x19, x19,88
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lwu x18, -65(x19)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x00000000ffbfffff)



    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0xf7f, result rd:x19(0x00000000ff7fffff)
    la  x20, test_data
    addi    x20, x20,92
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lwu x19, -129(x20)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x00000000ff7fffff)

    # Testcase 156:  imm:0xeff, result rd:x20(0x00000000feffffff)
    la  x21, test_data
    addi    x21, x21,96
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lwu x20, -257(x21)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x00000000feffffff)

    # Testcase 157:  imm:0xdff, result rd:x21(0x00000000fdffffff)
    la  x22, test_data
    addi    x22, x22,100
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lwu x21, -513(x22)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x00000000fdffffff)

    # Testcase 158:  imm:0xbff, result rd:x22(0x00000000feffffff)
    la  x23, test_data
    addi    x23, x23,104
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lwu x22, -1025(x23)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x00000000feffffff)

    # Testcase 159:  imm:0x7ff, result rd:x23(0x00000000f7ffffff)
    la  x24, test_data
    addi    x24, x24,108
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lwu x23, 2047(x24)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x00000000f7ffffff)



    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 160:  imm:0xffe, result rd:x24(0x00000000efffffff)
    la  x25, test_data
    addi    x25, x25,112
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lwu x24, -2(x25)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x00000000efffffff)

    # Testcase 161:  imm:0xffd, result rd:x25(0x00000000dfffffff)
    la  x26, test_data
    addi    x26, x26,116
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lwu x25, -3(x26)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x00000000dfffffff)

    # Testcase 162:  imm:0xffb, result rd:x26(0x00000000efffffff)
    la  x27, test_data
    addi    x27, x27,120
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lwu x26, -5(x27)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x00000000efffffff)

    # Testcase 163:  imm:0xff7, result rd:x27(0x000000007fffffff)
    la  x28, test_data
    addi    x28, x28,124
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lwu x27, -9(x28)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x000000007fffffff)

    # Testcase 164:  imm:0xfef, result rd:x28(0x00000000ffffffff)
    la  x29, test_data
    addi    x29, x29,128
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lwu x28, -17(x29)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000ffffffff)



    

    RVTEST_SIGBASE(x3,signature_34_0)

    # Testcase 165:  imm:0xfdf, result rd:x29(0x0000000000000001)
    la  x30, test_data
    addi    x30, x30,132
    li     x4, MASK_XLEN(33)
    add    x30, x30, x4
    lwu x29, -33(x30)
    sd x29, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x0000000000000001)

    # Testcase 166:  imm:0xfbf, result rd:x30(0x0000000000000002)
    la  x31, test_data
    addi    x31, x31,136
    li     x4, MASK_XLEN(65)
    add    x31, x31, x4
    lwu x30, -65(x31)
    sd x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000000000002)

    # Testcase 167:  imm:0xf7f, result rd:x31(0x0000000000000004)
    la  x1, test_data
    addi    x1, x1,140
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    lwu x31, -129(x1)
    sd x31, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000004)

    # Testcase 168:  imm:0x1, result rd:x1(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x4, MASK_XLEN(-1)
    add    x2, x2, x4
    lwu x1, 1(x2)
    sd x1, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000008)

    # Testcase 169:  imm:0x2, result rd:x1(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x4, MASK_XLEN(-2)
    add    x2, x2, x4
    lwu x1, 2(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x0000000000000010)



    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x4, result rd:x2(0x0000000000000020)
    la  x3, test_data
    addi    x3, x3,152
    li     x8, MASK_XLEN(-4)
    add    x3, x3, x8
    lwu x2, 4(x3)
    sd x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0x0000000000000020)

    # Testcase 171:  imm:0x8, result rd:x3(0x0000000000000040)
    la  x4, test_data
    addi    x4, x4,156
    li     x8, MASK_XLEN(-8)
    add    x4, x4, x8
    lwu x3, 8(x4)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000000000000040)

    # Testcase 172:  imm:0x10, result rd:x4(0x0000000000000080)
    la  x5, test_data
    addi    x5, x5,160
    li     x8, MASK_XLEN(-16)
    add    x5, x5, x8
    lwu x4, 16(x5)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000000080)

    # Testcase 173:  imm:0x20, result rd:x5(0x0000000000000100)
    la  x6, test_data
    addi    x6, x6,164
    li     x8, MASK_XLEN(-32)
    add    x6, x6, x8
    lwu x5, 32(x6)
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000000000100)

    # Testcase 174:  imm:0x40, result rd:x6(0x0000000000000200)
    la  x7, test_data
    addi    x7, x7,168
    li     x8, MASK_XLEN(-64)
    add    x7, x7, x8
    lwu x6, 64(x7)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000000000000200)



    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0x80, result rd:x7(0x0000000000000400)
    la  x8, test_data
    addi    x8, x8,172
    li     x2, MASK_XLEN(-128)
    add    x8, x8, x2
    lwu x7, 128(x8)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x0000000000000400)

    # Testcase 176:  imm:0x100, result rd:x8(0x0000000000000800)
    la  x9, test_data
    addi    x9, x9,176
    li     x2, MASK_XLEN(-256)
    add    x9, x9, x2
    lwu x8, 256(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000800)

    # Testcase 177:  imm:0x200, result rd:x9(0x0000000000001000)
    la  x10, test_data
    addi    x10, x10,180
    li     x2, MASK_XLEN(-512)
    add    x10, x10, x2
    lwu x9, 512(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000001000)

    # Testcase 178:  imm:0x400, result rd:x10(0x0000000000002000)
    la  x11, test_data
    addi    x11, x11,184
    li     x2, MASK_XLEN(-1024)
    add    x11, x11, x2
    lwu x10, 1024(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000002000)

    # Testcase 179:  imm:0x800, result rd:x11(0x0000000000004000)
    la  x12, test_data
    addi    x12, x12,188
    li     x2, MASK_XLEN(2048)
    add    x12, x12, x2
    lwu x11, -2048(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000004000)



    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0xffe, result rd:x12(0x0000000000008000)
    la  x13, test_data
    addi    x13, x13,192
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lwu x12, -2(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000008000)

    # Testcase 181:  imm:0xffd, result rd:x13(0x0000000000000001)
    la  x14, test_data
    addi    x14, x14,196
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lwu x13, -3(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000001)

    # Testcase 182:  imm:0xffb, result rd:x14(0x0000000000000002)
    la  x15, test_data
    addi    x15, x15,200
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lwu x14, -5(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000002)

    # Testcase 183:  imm:0xff7, result rd:x15(0x0000000000040000)
    la  x16, test_data
    addi    x16, x16,204
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lwu x15, -9(x16)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000040000)

    # Testcase 184:  imm:0xfef, result rd:x16(0x0000000000080000)
    la  x17, test_data
    addi    x17, x17,208
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lwu x16, -17(x17)
    sd x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000080000)



    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0xfdf, result rd:x17(0x0000000000000010)
    la  x18, test_data
    addi    x18, x18,212
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lwu x17, -33(x18)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000000010)

    # Testcase 186:  imm:0xfbf, result rd:x18(0x0000000000000020)
    la  x19, test_data
    addi    x19, x19,216
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lwu x18, -65(x19)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000000020)

    # Testcase 187:  imm:0xf7f, result rd:x19(0x0000000000400000)
    la  x20, test_data
    addi    x20, x20,220
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lwu x19, -129(x20)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000400000)

    # Testcase 188:  imm:0xeff, result rd:x20(0x0000000000800000)
    la  x21, test_data
    addi    x21, x21,224
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lwu x20, -257(x21)
    sd x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000800000)

    # Testcase 189:  imm:0xdff, result rd:x21(0x0000000000000100)
    la  x22, test_data
    addi    x22, x22,228
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lwu x21, -513(x22)
    sd x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000000100)



    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0xbff, result rd:x22(0x0000000000000200)
    la  x23, test_data
    addi    x23, x23,232
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lwu x22, -1025(x23)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000000200)

    # Testcase 191:  imm:0x7ff, result rd:x23(0x0000000004000000)
    la  x24, test_data
    addi    x24, x24,236
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lwu x23, 2047(x24)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000004000000)

    # Testcase 192:  imm:0xffe, result rd:x24(0x0000000008000000)
    la  x25, test_data
    addi    x25, x25,240
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lwu x24, -2(x25)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000008000000)

    # Testcase 193:  imm:0xffd, result rd:x25(0x0000000000001000)
    la  x26, test_data
    addi    x26, x26,244
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lwu x25, -3(x26)
    sd x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000000001000)

    # Testcase 194:  imm:0xffb, result rd:x26(0x0000000000002000)
    la  x27, test_data
    addi    x27, x27,248
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lwu x26, -5(x27)
    sd x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000000002000)



    

    RVTEST_SIGBASE(x2,signature_40_0)

    # Testcase 195:  imm:0xff7, result rd:x27(0x0000000040000000)
    la  x28, test_data
    addi    x28, x28,252
    li     x3, MASK_XLEN(9)
    add    x28, x28, x3
    lwu x27, -9(x28)
    sd x27, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000040000000)

    # Testcase 196:  imm:0xfef, result rd:x28(0x0000000080000000)
    la  x29, test_data
    addi    x29, x29,256
    li     x3, MASK_XLEN(17)
    add    x29, x29, x3
    lwu x28, -17(x29)
    sd x28, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000080000000)

    # Testcase 197:  imm:0xfdf, result rd:x29(0x0000000000000000)
    la  x30, test_data
    addi    x30, x30,260
    li     x3, MASK_XLEN(33)
    add    x30, x30, x3
    lwu x29, -33(x30)
    sd x29, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000000000)

    # Testcase 198:  imm:0xfbf, result rd:x30(0x00000000fffffffe)
    la  x31, test_data
    addi    x31, x31,0
    li     x3, MASK_XLEN(65)
    add    x31, x31, x3
    lwu x30, -65(x31)
    sd x30, 24(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x00000000fffffffe)

    # Testcase 199:  imm:0xf7f, result rd:x31(0x00000000fffffffd)
    la  x1, test_data
    addi    x1, x1,4
    li     x3, MASK_XLEN(129)
    add    x1, x1, x3
    lwu x31, -129(x1)
    sd x31, 32(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x00000000fffffffd)



    

    RVTEST_SIGBASE(x6,signature_41_0)

    # Testcase 200:  imm:0xeff, result rd:x1(0x00000000fffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x7, MASK_XLEN(257)
    add    x2, x2, x7
    lwu x1, -257(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x00000000fffffffb)

    # Testcase 201:  imm:0xdff, result rd:x1(0x00000000fffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x7, MASK_XLEN(513)
    add    x2, x2, x7
    lwu x1, -513(x2)
    sd x1, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x00000000fffffff7)

    # Testcase 202:  imm:0xbff, result rd:x2(0x00000000ffffffef)
    la  x3, test_data
    addi    x3, x3,16
    li     x7, MASK_XLEN(1025)
    add    x3, x3, x7
    lwu x2, -1025(x3)
    sd x2, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x2, 0x00000000ffffffef)

    # Testcase 203:  imm:0x7ff, result rd:x3(0x00000000ffffffdf)
    la  x4, test_data
    addi    x4, x4,20
    li     x7, MASK_XLEN(-2047)
    add    x4, x4, x7
    lwu x3, 2047(x4)
    sd x3, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x00000000ffffffdf)

    # Testcase 204:  imm:0xffe, result rd:x4(0x00000000ffffffbf)
    la  x5, test_data
    addi    x5, x5,24
    li     x7, MASK_XLEN(2)
    add    x5, x5, x7
    lwu x4, -2(x5)
    sd x4, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x00000000ffffffbf)



    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0xffd, result rd:x5(0x00000000ffffff7f)
    la  x6, test_data
    addi    x6, x6,28
    li     x2, MASK_XLEN(3)
    add    x6, x6, x2
    lwu x5, -3(x6)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x00000000ffffff7f)

    # Testcase 206:  imm:0xffb, result rd:x6(0x00000000fffffeff)
    la  x7, test_data
    addi    x7, x7,32
    li     x2, MASK_XLEN(5)
    add    x7, x7, x2
    lwu x6, -5(x7)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x00000000fffffeff)

    # Testcase 207:  imm:0xff7, result rd:x7(0x00000000fffffdff)
    la  x8, test_data
    addi    x8, x8,36
    li     x2, MASK_XLEN(9)
    add    x8, x8, x2
    lwu x7, -9(x8)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x00000000fffffdff)

    # Testcase 208:  imm:0xfef, result rd:x8(0x00000000fffffeff)
    la  x9, test_data
    addi    x9, x9,40
    li     x2, MASK_XLEN(17)
    add    x9, x9, x2
    lwu x8, -17(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000fffffeff)

    # Testcase 209:  imm:0xfdf, result rd:x9(0x00000000fffff7ff)
    la  x10, test_data
    addi    x10, x10,44
    li     x2, MASK_XLEN(33)
    add    x10, x10, x2
    lwu x9, -33(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000fffff7ff)



    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0xfbf, result rd:x10(0x00000000ffffefff)
    la  x11, test_data
    addi    x11, x11,48
    li     x2, MASK_XLEN(65)
    add    x11, x11, x2
    lwu x10, -65(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000000ffffefff)

    # Testcase 211:  imm:0xf7f, result rd:x11(0x00000000ffffdfff)
    la  x12, test_data
    addi    x12, x12,52
    li     x2, MASK_XLEN(129)
    add    x12, x12, x2
    lwu x11, -129(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000000ffffdfff)

    # Testcase 212:  imm:0xeff, result rd:x12(0x00000000ffffefff)
    la  x13, test_data
    addi    x13, x13,56
    li     x2, MASK_XLEN(257)
    add    x13, x13, x2
    lwu x12, -257(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000000ffffefff)

    # Testcase 213:  imm:0xdff, result rd:x13(0x00000000ffff7fff)
    la  x14, test_data
    addi    x14, x14,60
    li     x2, MASK_XLEN(513)
    add    x14, x14, x2
    lwu x13, -513(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000000ffff7fff)

    # Testcase 214:  imm:0xbff, result rd:x14(0x00000000fffeffff)
    la  x15, test_data
    addi    x15, x15,64
    li     x2, MASK_XLEN(1025)
    add    x15, x15, x2
    lwu x14, -1025(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000000fffeffff)



    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0x7ff, result rd:x15(0x00000000fffdffff)
    la  x16, test_data
    addi    x16, x16,68
    li     x2, MASK_XLEN(-2047)
    add    x16, x16, x2
    lwu x15, 2047(x16)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000000fffdffff)

    # Testcase 216:  imm:0xffe, result rd:x16(0x00000000fffbffff)
    la  x17, test_data
    addi    x17, x17,72
    li     x2, MASK_XLEN(2)
    add    x17, x17, x2
    lwu x16, -2(x17)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x00000000fffbffff)

    # Testcase 217:  imm:0xffd, result rd:x17(0x00000000fff7ffff)
    la  x18, test_data
    addi    x18, x18,76
    li     x2, MASK_XLEN(3)
    add    x18, x18, x2
    lwu x17, -3(x18)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x00000000fff7ffff)

    # Testcase 218:  imm:0xffb, result rd:x18(0x00000000ffefffff)
    la  x19, test_data
    addi    x19, x19,80
    li     x2, MASK_XLEN(5)
    add    x19, x19, x2
    lwu x18, -5(x19)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x00000000ffefffff)

    # Testcase 219:  imm:0xff7, result rd:x19(0x00000000ffdfffff)
    la  x20, test_data
    addi    x20, x20,84
    li     x2, MASK_XLEN(9)
    add    x20, x20, x2
    lwu x19, -9(x20)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x00000000ffdfffff)



    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0xfef, result rd:x20(0x00000000ffbfffff)
    la  x21, test_data
    addi    x21, x21,88
    li     x2, MASK_XLEN(17)
    add    x21, x21, x2
    lwu x20, -17(x21)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x00000000ffbfffff)

    # Testcase 221:  imm:0xfdf, result rd:x21(0x00000000ff7fffff)
    la  x22, test_data
    addi    x22, x22,92
    li     x2, MASK_XLEN(33)
    add    x22, x22, x2
    lwu x21, -33(x22)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x00000000ff7fffff)

    # Testcase 222:  imm:0xfbf, result rd:x22(0x00000000feffffff)
    la  x23, test_data
    addi    x23, x23,96
    li     x2, MASK_XLEN(65)
    add    x23, x23, x2
    lwu x22, -65(x23)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x00000000feffffff)

    # Testcase 223:  imm:0xf7f, result rd:x23(0x00000000fdffffff)
    la  x24, test_data
    addi    x24, x24,100
    li     x2, MASK_XLEN(129)
    add    x24, x24, x2
    lwu x23, -129(x24)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x00000000fdffffff)

    # Testcase 224:  imm:0xeff, result rd:x24(0x00000000feffffff)
    la  x25, test_data
    addi    x25, x25,104
    li     x2, MASK_XLEN(257)
    add    x25, x25, x2
    lwu x24, -257(x25)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x00000000feffffff)



    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Testcase 225:  imm:0xdff, result rd:x25(0x00000000f7ffffff)
    la  x26, test_data
    addi    x26, x26,108
    li     x2, MASK_XLEN(513)
    add    x26, x26, x2
    lwu x25, -513(x26)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x00000000f7ffffff)

    # Testcase 226:  imm:0xbff, result rd:x26(0x00000000efffffff)
    la  x27, test_data
    addi    x27, x27,112
    li     x2, MASK_XLEN(1025)
    add    x27, x27, x2
    lwu x26, -1025(x27)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x00000000efffffff)

    # Testcase 227:  imm:0x7ff, result rd:x27(0x00000000dfffffff)
    la  x28, test_data
    addi    x28, x28,116
    li     x2, MASK_XLEN(-2047)
    add    x28, x28, x2
    lwu x27, 2047(x28)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x00000000dfffffff)

    # Testcase 228:  imm:0xffe, result rd:x28(0x00000000efffffff)
    la  x29, test_data
    addi    x29, x29,120
    li     x2, MASK_XLEN(2)
    add    x29, x29, x2
    lwu x28, -2(x29)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000efffffff)

    # Testcase 229:  imm:0xffd, result rd:x29(0x000000007fffffff)
    la  x30, test_data
    addi    x30, x30,124
    li     x2, MASK_XLEN(3)
    add    x30, x30, x2
    lwu x29, -3(x30)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x000000007fffffff)



    

    RVTEST_SIGBASE(x4,signature_47_0)

    # Testcase 230:  imm:0xffb, result rd:x30(0x00000000ffffffff)
    la  x31, test_data
    addi    x31, x31,128
    li     x5, MASK_XLEN(5)
    add    x31, x31, x5
    lwu x30, -5(x31)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x00000000ffffffff)

    # Testcase 231:  imm:0xff7, result rd:x31(0x0000000000000001)
    la  x1, test_data
    addi    x1, x1,132
    li     x5, MASK_XLEN(9)
    add    x1, x1, x5
    lwu x31, -9(x1)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000000000001)

    # Testcase 232:  imm:0xfef, result rd:x1(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x5, MASK_XLEN(17)
    add    x2, x2, x5
    lwu x1, -17(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000002)

    # Testcase 233:  imm:0xfdf, result rd:x1(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x5, MASK_XLEN(33)
    add    x2, x2, x5
    lwu x1, -33(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000004)

    # Testcase 234:  imm:0xfbf, result rd:x2(0x0000000000000008)
    la  x3, test_data
    addi    x3, x3,144
    li     x5, MASK_XLEN(65)
    add    x3, x3, x5
    lwu x2, -65(x3)
    sd x2, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x0000000000000008)



    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0xf7f, result rd:x3(0x0000000000000010)
    la  x4, test_data
    addi    x4, x4,148
    li     x2, MASK_XLEN(129)
    add    x4, x4, x2
    lwu x3, -129(x4)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x0000000000000010)

    # Testcase 236:  imm:0xeff, result rd:x4(0x0000000000000020)
    la  x5, test_data
    addi    x5, x5,152
    li     x2, MASK_XLEN(257)
    add    x5, x5, x2
    lwu x4, -257(x5)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000000020)

    # Testcase 237:  imm:0xdff, result rd:x5(0x0000000000000040)
    la  x6, test_data
    addi    x6, x6,156
    li     x2, MASK_XLEN(513)
    add    x6, x6, x2
    lwu x5, -513(x6)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000000000040)

    # Testcase 238:  imm:0xbff, result rd:x6(0x0000000000000080)
    la  x7, test_data
    addi    x7, x7,160
    li     x2, MASK_XLEN(1025)
    add    x7, x7, x2
    lwu x6, -1025(x7)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000000000000080)

    # Testcase 239:  imm:0x7ff, result rd:x7(0x0000000000000100)
    la  x8, test_data
    addi    x8, x8,164
    li     x2, MASK_XLEN(-2047)
    add    x8, x8, x2
    lwu x7, 2047(x8)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000000000000100)



    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0xffe, result rd:x8(0x0000000000000200)
    la  x9, test_data
    addi    x9, x9,168
    li     x2, MASK_XLEN(2)
    add    x9, x9, x2
    lwu x8, -2(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000200)

    # Testcase 241:  imm:0xffd, result rd:x9(0x0000000000000400)
    la  x10, test_data
    addi    x10, x10,172
    li     x2, MASK_XLEN(3)
    add    x10, x10, x2
    lwu x9, -3(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000400)

    # Testcase 242:  imm:0xffb, result rd:x10(0x0000000000000800)
    la  x11, test_data
    addi    x11, x11,176
    li     x2, MASK_XLEN(5)
    add    x11, x11, x2
    lwu x10, -5(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000800)

    # Testcase 243:  imm:0xff7, result rd:x11(0x0000000000001000)
    la  x12, test_data
    addi    x12, x12,180
    li     x2, MASK_XLEN(9)
    add    x12, x12, x2
    lwu x11, -9(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000001000)

    # Testcase 244:  imm:0xfef, result rd:x12(0x0000000000002000)
    la  x13, test_data
    addi    x13, x13,184
    li     x2, MASK_XLEN(17)
    add    x13, x13, x2
    lwu x12, -17(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000002000)



    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0xfdf, result rd:x13(0x0000000000004000)
    la  x14, test_data
    addi    x14, x14,188
    li     x2, MASK_XLEN(33)
    add    x14, x14, x2
    lwu x13, -33(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000004000)

    # Testcase 246:  imm:0xfbf, result rd:x14(0x0000000000008000)
    la  x15, test_data
    addi    x15, x15,192
    li     x2, MASK_XLEN(65)
    add    x15, x15, x2
    lwu x14, -65(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000008000)

    # Testcase 247:  imm:0xf7f, result rd:x15(0x0000000000000001)
    la  x16, test_data
    addi    x16, x16,196
    li     x2, MASK_XLEN(129)
    add    x16, x16, x2
    lwu x15, -129(x16)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000001)

    # Testcase 248:  imm:0xeff, result rd:x16(0x0000000000000002)
    la  x17, test_data
    addi    x17, x17,200
    li     x2, MASK_XLEN(257)
    add    x17, x17, x2
    lwu x16, -257(x17)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x0000000000000002)

    # Testcase 249:  imm:0xdff, result rd:x17(0x0000000000040000)
    la  x18, test_data
    addi    x18, x18,204
    li     x2, MASK_XLEN(513)
    add    x18, x18, x2
    lwu x17, -513(x18)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x0000000000040000)



    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0xbff, result rd:x18(0x0000000000080000)
    la  x19, test_data
    addi    x19, x19,208
    li     x2, MASK_XLEN(1025)
    add    x19, x19, x2
    lwu x18, -1025(x19)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x0000000000080000)

    # Testcase 251:  imm:0x7ff, result rd:x19(0x0000000000000010)
    la  x20, test_data
    addi    x20, x20,212
    li     x2, MASK_XLEN(-2047)
    add    x20, x20, x2
    lwu x19, 2047(x20)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x0000000000000010)

    # Testcase 252:  imm:0xffe, result rd:x20(0x0000000000000020)
    la  x21, test_data
    addi    x21, x21,216
    li     x2, MASK_XLEN(2)
    add    x21, x21, x2
    lwu x20, -2(x21)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x0000000000000020)

    # Testcase 253:  imm:0xffd, result rd:x21(0x0000000000400000)
    la  x22, test_data
    addi    x22, x22,220
    li     x2, MASK_XLEN(3)
    add    x22, x22, x2
    lwu x21, -3(x22)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x0000000000400000)

    # Testcase 254:  imm:0xffb, result rd:x22(0x0000000000800000)
    la  x23, test_data
    addi    x23, x23,224
    li     x2, MASK_XLEN(5)
    add    x23, x23, x2
    lwu x22, -5(x23)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x0000000000800000)



    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 255:  imm:0xff7, result rd:x23(0x0000000000000100)
    la  x24, test_data
    addi    x24, x24,228
    li     x2, MASK_XLEN(9)
    add    x24, x24, x2
    lwu x23, -9(x24)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x0000000000000100)

    # Testcase 256:  imm:0xfef, result rd:x24(0x0000000000000200)
    la  x25, test_data
    addi    x25, x25,232
    li     x2, MASK_XLEN(17)
    add    x25, x25, x2
    lwu x24, -17(x25)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x0000000000000200)

    # Testcase 257:  imm:0xfdf, result rd:x25(0x0000000004000000)
    la  x26, test_data
    addi    x26, x26,236
    li     x2, MASK_XLEN(33)
    add    x26, x26, x2
    lwu x25, -33(x26)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x0000000004000000)

    # Testcase 258:  imm:0xfbf, result rd:x26(0x0000000008000000)
    la  x27, test_data
    addi    x27, x27,240
    li     x2, MASK_XLEN(65)
    add    x27, x27, x2
    lwu x26, -65(x27)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x0000000008000000)

    # Testcase 259:  imm:0xf7f, result rd:x27(0x0000000000001000)
    la  x28, test_data
    addi    x28, x28,244
    li     x2, MASK_XLEN(129)
    add    x28, x28, x2
    lwu x27, -129(x28)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x0000000000001000)



    

    RVTEST_SIGBASE(x3,signature_53_0)

    # Testcase 260:  imm:0xeff, result rd:x28(0x0000000000002000)
    la  x29, test_data
    addi    x29, x29,248
    li     x4, MASK_XLEN(257)
    add    x29, x29, x4
    lwu x28, -257(x29)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0x0000000000002000)

    # Testcase 261:  imm:0xdff, result rd:x29(0x0000000040000000)
    la  x30, test_data
    addi    x30, x30,252
    li     x4, MASK_XLEN(513)
    add    x30, x30, x4
    lwu x29, -513(x30)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0x0000000040000000)

    # Testcase 262:  imm:0xbff, result rd:x30(0x0000000080000000)
    la  x31, test_data
    addi    x31, x31,256
    li     x4, MASK_XLEN(1025)
    add    x31, x31, x4
    lwu x30, -1025(x31)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0x0000000080000000)

    # Testcase 263:  imm:0x7ff, result rd:x31(0x0000000000000000)
    la  x1, test_data
    addi    x1, x1,260
    li     x4, MASK_XLEN(-2047)
    add    x1, x1, x4
    lwu x31, 2047(x1)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x0000000000000000)

    # Testcase 264:  imm:0xffe, result rd:x1(0x00000000fffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x4, MASK_XLEN(2)
    add    x2, x2, x4
    lwu x1, -2(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0x00000000fffffffe)



    

    RVTEST_SIGBASE(x7,signature_54_0)

    # Testcase 265:  imm:0xffd, result rd:x1(0x00000000fffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x8, MASK_XLEN(3)
    add    x2, x2, x8
    lwu x1, -3(x2)
    sd x1, 0(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x1, 0x00000000fffffffd)

    # Testcase 266:  imm:0xffb, result rd:x2(0x00000000fffffffb)
    la  x3, test_data
    addi    x3, x3,8
    li     x8, MASK_XLEN(5)
    add    x3, x3, x8
    lwu x2, -5(x3)
    sd x2, 8(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x2, 0x00000000fffffffb)

    # Testcase 267:  imm:0xff7, result rd:x3(0x00000000fffffff7)
    la  x4, test_data
    addi    x4, x4,12
    li     x8, MASK_XLEN(9)
    add    x4, x4, x8
    lwu x3, -9(x4)
    sd x3, 16(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0x00000000fffffff7)

    # Testcase 268:  imm:0xfef, result rd:x4(0x00000000ffffffef)
    la  x5, test_data
    addi    x5, x5,16
    li     x8, MASK_XLEN(17)
    add    x5, x5, x8
    lwu x4, -17(x5)
    sd x4, 24(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x00000000ffffffef)

    # Testcase 269:  imm:0xfdf, result rd:x5(0x00000000ffffffdf)
    la  x6, test_data
    addi    x6, x6,20
    li     x8, MASK_XLEN(33)
    add    x6, x6, x8
    lwu x5, -33(x6)
    sd x5, 32(x7)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x00000000ffffffdf)



    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0xfbf, result rd:x6(0x00000000ffffffbf)
    la  x7, test_data
    addi    x7, x7,24
    li     x2, MASK_XLEN(65)
    add    x7, x7, x2
    lwu x6, -65(x7)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x00000000ffffffbf)

    # Testcase 271:  imm:0xf7f, result rd:x7(0x00000000ffffff7f)
    la  x8, test_data
    addi    x8, x8,28
    li     x2, MASK_XLEN(129)
    add    x8, x8, x2
    lwu x7, -129(x8)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x00000000ffffff7f)

    # Testcase 272:  imm:0xeff, result rd:x8(0x00000000fffffeff)
    la  x9, test_data
    addi    x9, x9,32
    li     x2, MASK_XLEN(257)
    add    x9, x9, x2
    lwu x8, -257(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000fffffeff)

    # Testcase 273:  imm:0xdff, result rd:x9(0x00000000fffffdff)
    la  x10, test_data
    addi    x10, x10,36
    li     x2, MASK_XLEN(513)
    add    x10, x10, x2
    lwu x9, -513(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000fffffdff)

    # Testcase 274:  imm:0xbff, result rd:x10(0x00000000fffffeff)
    la  x11, test_data
    addi    x11, x11,40
    li     x2, MASK_XLEN(1025)
    add    x11, x11, x2
    lwu x10, -1025(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000000fffffeff)



    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0x7ff, result rd:x11(0x00000000fffff7ff)
    la  x12, test_data
    addi    x12, x12,44
    li     x2, MASK_XLEN(-2047)
    add    x12, x12, x2
    lwu x11, 2047(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000000fffff7ff)

    # Testcase 276:  imm:0xffe, result rd:x12(0x00000000ffffefff)
    la  x13, test_data
    addi    x13, x13,48
    li     x2, MASK_XLEN(2)
    add    x13, x13, x2
    lwu x12, -2(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000000ffffefff)

    # Testcase 277:  imm:0xffd, result rd:x13(0x00000000ffffdfff)
    la  x14, test_data
    addi    x14, x14,52
    li     x2, MASK_XLEN(3)
    add    x14, x14, x2
    lwu x13, -3(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000000ffffdfff)

    # Testcase 278:  imm:0xffb, result rd:x14(0x00000000ffffefff)
    la  x15, test_data
    addi    x15, x15,56
    li     x2, MASK_XLEN(5)
    add    x15, x15, x2
    lwu x14, -5(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000000ffffefff)

    # Testcase 279:  imm:0xff7, result rd:x15(0x00000000ffff7fff)
    la  x16, test_data
    addi    x16, x16,60
    li     x2, MASK_XLEN(9)
    add    x16, x16, x2
    lwu x15, -9(x16)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000000ffff7fff)



    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0xfef, result rd:x16(0x00000000fffeffff)
    la  x17, test_data
    addi    x17, x17,64
    li     x2, MASK_XLEN(17)
    add    x17, x17, x2
    lwu x16, -17(x17)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x16, 0x00000000fffeffff)

    # Testcase 281:  imm:0xfdf, result rd:x17(0x00000000fffdffff)
    la  x18, test_data
    addi    x18, x18,68
    li     x2, MASK_XLEN(33)
    add    x18, x18, x2
    lwu x17, -33(x18)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x17, 0x00000000fffdffff)

    # Testcase 282:  imm:0xfbf, result rd:x18(0x00000000fffbffff)
    la  x19, test_data
    addi    x19, x19,72
    li     x2, MASK_XLEN(65)
    add    x19, x19, x2
    lwu x18, -65(x19)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0x00000000fffbffff)

    # Testcase 283:  imm:0xf7f, result rd:x19(0x00000000fff7ffff)
    la  x20, test_data
    addi    x20, x20,76
    li     x2, MASK_XLEN(129)
    add    x20, x20, x2
    lwu x19, -129(x20)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x19, 0x00000000fff7ffff)

    # Testcase 284:  imm:0xeff, result rd:x20(0x00000000ffefffff)
    la  x21, test_data
    addi    x21, x21,80
    li     x2, MASK_XLEN(257)
    add    x21, x21, x2
    lwu x20, -257(x21)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x20, 0x00000000ffefffff)



    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 285:  imm:0xdff, result rd:x21(0x00000000ffdfffff)
    la  x22, test_data
    addi    x22, x22,84
    li     x2, MASK_XLEN(513)
    add    x22, x22, x2
    lwu x21, -513(x22)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x21, 0x00000000ffdfffff)

    # Testcase 286:  imm:0xbff, result rd:x22(0x00000000ffbfffff)
    la  x23, test_data
    addi    x23, x23,88
    li     x2, MASK_XLEN(1025)
    add    x23, x23, x2
    lwu x22, -1025(x23)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x22, 0x00000000ffbfffff)

    # Testcase 287:  imm:0x7ff, result rd:x23(0x00000000ff7fffff)
    la  x24, test_data
    addi    x24, x24,92
    li     x2, MASK_XLEN(-2047)
    add    x24, x24, x2
    lwu x23, 2047(x24)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x23, 0x00000000ff7fffff)

    # Testcase 288:  imm:0xffe, result rd:x24(0x00000000feffffff)
    la  x25, test_data
    addi    x25, x25,96
    li     x2, MASK_XLEN(2)
    add    x25, x25, x2
    lwu x24, -2(x25)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x24, 0x00000000feffffff)

    # Testcase 289:  imm:0xffd, result rd:x25(0x00000000fdffffff)
    la  x26, test_data
    addi    x26, x26,100
    li     x2, MASK_XLEN(3)
    add    x26, x26, x2
    lwu x25, -3(x26)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x25, 0x00000000fdffffff)



    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0xffb, result rd:x26(0x00000000feffffff)
    la  x27, test_data
    addi    x27, x27,104
    li     x2, MASK_XLEN(5)
    add    x27, x27, x2
    lwu x26, -5(x27)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x26, 0x00000000feffffff)

    # Testcase 291:  imm:0xff7, result rd:x27(0x00000000f7ffffff)
    la  x28, test_data
    addi    x28, x28,108
    li     x2, MASK_XLEN(9)
    add    x28, x28, x2
    lwu x27, -9(x28)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x27, 0x00000000f7ffffff)

    # Testcase 292:  imm:0xfef, result rd:x28(0x00000000efffffff)
    la  x29, test_data
    addi    x29, x29,112
    li     x2, MASK_XLEN(17)
    add    x29, x29, x2
    lwu x28, -17(x29)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x28, 0x00000000efffffff)

    # Testcase 293:  imm:0xfdf, result rd:x29(0x00000000dfffffff)
    la  x30, test_data
    addi    x30, x30,116
    li     x2, MASK_XLEN(33)
    add    x30, x30, x2
    lwu x29, -33(x30)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x29, 0x00000000dfffffff)

    # Testcase 294:  imm:0xfbf, result rd:x30(0x00000000efffffff)
    la  x31, test_data
    addi    x31, x31,120
    li     x2, MASK_XLEN(65)
    add    x31, x31, x2
    lwu x30, -65(x31)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0x00000000efffffff)



    

    RVTEST_SIGBASE(x2,signature_60_0)

    # Testcase 295:  imm:0xf7f, result rd:x31(0x000000007fffffff)
    la  x1, test_data
    addi    x1, x1,124
    li     x4, MASK_XLEN(129)
    add    x1, x1, x4
    lwu x31, -129(x1)
    sd x31, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x000000007fffffff)

    # Testcase 296:  imm:0xf6a, result rd:x0(0x0000000000000000)
    la  x3, test_data
    addi    x3, x3,128
    li     x4, MASK_XLEN(150)
    add    x3, x3, x4
    lwu x0, -150(x3)
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

	.dword 0xfffffffdfffffffe
	.dword 0xfffffff7fffffffb
	.dword 0xffffffdfffffffef
	.dword 0xffffff7fffffffbf
	.dword 0xfffffdfffffffeff
	.dword 0xfffff7fffffffeff
	.dword 0xffffdfffffffefff
	.dword 0xffff7fffffffefff
	.dword 0xfffdfffffffeffff
	.dword 0xfff7fffffffbffff
	.dword 0xffdfffffffefffff
	.dword 0xff7fffffffbfffff
	.dword 0xfdfffffffeffffff
	.dword 0xf7fffffffeffffff
	.dword 0xdfffffffefffffff
	.dword 0x7fffffffefffffff
	.dword 0x00000001ffffffff
	.dword 0x0000000400000002
	.dword 0x0000001000000008
	.dword 0x0000004000000020
	.dword 0x0000010000000080
	.dword 0x0000040000000200
	.dword 0x0000100000000800
	.dword 0x0000400000002000
	.dword 0x0000000100008000
	.dword 0x0004000000000002
	.dword 0x0000001000080000
	.dword 0x0040000000000020
	.dword 0x0000010000800000
	.dword 0x0400000000000200
	.dword 0x0000100008000000
	.dword 0x4000000000002000
	.dword 0x0000000080000000

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

