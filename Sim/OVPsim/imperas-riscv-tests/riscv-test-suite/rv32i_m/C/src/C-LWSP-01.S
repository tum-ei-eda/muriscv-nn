// RISC-V Architectural Validation Test C-LWSP-01
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
// Description: Testing instruction 'c.lwsp'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.lwsp)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.lwsp)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x1c, result rd:x20(0xfffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-28)
    add    x2, x2, x3
    c.lwsp x20, 28(x2)
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffffffe)

    # Testcase 1:  imm:0x44, result rd:x29(0xfffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(-68)
    add    x2, x2, x3
    c.lwsp x29, 68(x2)
    sw x29, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffd)

    # Testcase 2:  imm:0x14, result rd:x31(0xfffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-20)
    add    x2, x2, x3
    c.lwsp x31, 20(x2)
    sw x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffb)

    # Testcase 3:  imm:0x10, result rd:x21(0xfffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-16)
    add    x2, x2, x3
    c.lwsp x21, 16(x2)
    sw x21, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfffffff7)

    # Testcase 4:  imm:0x78, result rd:x11(0xffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x11, 120(x2)
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffffffef)





    

    RVTEST_SIGBASE(x3,signature_2_0)

    # Testcase 5:  imm:0x7c, result rd:x4(0xffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x5, MASK_XLEN(-124)
    add    x2, x2, x5
    c.lwsp x4, 124(x2)
    sw x4, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffdf)

    # Testcase 6:  imm:0x1c, result rd:x1(0xffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x5, MASK_XLEN(-28)
    add    x2, x2, x5
    c.lwsp x1, 28(x2)
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffbf)

    # Testcase 7:  imm:0x44, result rd:x30(0xffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x5, MASK_XLEN(-68)
    add    x2, x2, x5
    c.lwsp x30, 68(x2)
    sw x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x30, 0xffffff7f)

    # Testcase 8:  imm:0x50, result rd:x6(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x5, MASK_XLEN(-80)
    add    x2, x2, x5
    c.lwsp x6, 80(x2)
    sw x6, 12(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xfffffeff)

    # Testcase 9:  imm:0x0, result rd:x14(0xfffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x5, MASK_XLEN(0)
    add    x2, x2, x5
    c.lwsp x14, 0(x2)
    sw x14, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x14, 0xfffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x78, result rd:x5(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    c.lwsp x5, 120(x2)
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x5, 0xfffffeff)

    # Testcase 11:  imm:0x38, result rd:x12(0xfffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x4, MASK_XLEN(-56)
    add    x2, x2, x4
    c.lwsp x12, 56(x2)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x12, 0xfffff7ff)

    # Testcase 12:  imm:0x40, result rd:x26(0xffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x4, MASK_XLEN(-64)
    add    x2, x2, x4
    c.lwsp x26, 64(x2)
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x26, 0xffffefff)

    # Testcase 13:  imm:0x44, result rd:x3(0xffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x4, MASK_XLEN(-68)
    add    x2, x2, x4
    c.lwsp x3, 68(x2)
    sw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffdfff)

    # Testcase 14:  imm:0x60, result rd:x19(0xffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.lwsp x19, 96(x2)
    sw x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x19, 0xffffefff)





    

    RVTEST_SIGBASE(x3,signature_4_0)

    # Testcase 15:  imm:0x34, result rd:x19(0xffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x4, MASK_XLEN(-52)
    add    x2, x2, x4
    c.lwsp x19, 52(x2)
    sw x19, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0xffff7fff)

    # Testcase 16:  imm:0x14, result rd:x8(0xfffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x4, MASK_XLEN(-20)
    add    x2, x2, x4
    c.lwsp x8, 20(x2)
    sw x8, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xfffeffff)

    # Testcase 17:  imm:0x4, result rd:x10(0xfffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x4, MASK_XLEN(-4)
    add    x2, x2, x4
    c.lwsp x10, 4(x2)
    sw x10, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xfffdffff)

    # Testcase 18:  imm:0x20, result rd:x1(0xfffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x4, MASK_XLEN(-32)
    add    x2, x2, x4
    c.lwsp x1, 32(x2)
    sw x1, 12(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffbffff)

    # Testcase 19:  imm:0x6c, result rd:x18(0xfff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x4, MASK_XLEN(-108)
    add    x2, x2, x4
    c.lwsp x18, 108(x2)
    sw x18, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfff7ffff)





    

    RVTEST_SIGBASE(x3,signature_5_0)

    # Testcase 20:  imm:0x30, result rd:x24(0xffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x4, MASK_XLEN(-48)
    add    x2, x2, x4
    c.lwsp x24, 48(x2)
    sw x24, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x24, 0xffefffff)

    # Testcase 21:  imm:0x54, result rd:x1(0xffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x4, MASK_XLEN(-84)
    add    x2, x2, x4
    c.lwsp x1, 84(x2)
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffdfffff)

    # Testcase 22:  imm:0x10, result rd:x22(0xffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x4, MASK_XLEN(-16)
    add    x2, x2, x4
    c.lwsp x22, 16(x2)
    sw x22, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0xffbfffff)

    # Testcase 23:  imm:0x18, result rd:x31(0xff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x4, MASK_XLEN(-24)
    add    x2, x2, x4
    c.lwsp x31, 24(x2)
    sw x31, 12(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xff7fffff)

    # Testcase 24:  imm:0x30, result rd:x1(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x4, MASK_XLEN(-48)
    add    x2, x2, x4
    c.lwsp x1, 48(x2)
    sw x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfeffffff)





    

    RVTEST_SIGBASE(x3,signature_6_0)

    # Testcase 25:  imm:0x58, result rd:x18(0xfdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x4, MASK_XLEN(-88)
    add    x2, x2, x4
    c.lwsp x18, 88(x2)
    sw x18, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfdffffff)

    # Testcase 26:  imm:0x50, result rd:x1(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x4, MASK_XLEN(-80)
    add    x2, x2, x4
    c.lwsp x1, 80(x2)
    sw x1, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfeffffff)

    # Testcase 27:  imm:0x60, result rd:x7(0xf7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.lwsp x7, 96(x2)
    sw x7, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x7, 0xf7ffffff)

    # Testcase 28:  imm:0x70, result rd:x12(0xefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x4, MASK_XLEN(-112)
    add    x2, x2, x4
    c.lwsp x12, 112(x2)
    sw x12, 12(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x12, 0xefffffff)

    # Testcase 29:  imm:0x48, result rd:x23(0xdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x4, MASK_XLEN(-72)
    add    x2, x2, x4
    c.lwsp x23, 72(x2)
    sw x23, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x23, 0xdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x10(0xefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.lwsp x10, 0(x2)
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xefffffff)

    # Testcase 31:  imm:0x7c, result rd:x3(0x7fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x3, 124(x2)
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x7fffffff)

    # Testcase 32:  imm:0x7c, result rd:x8(0xffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x8, 124(x2)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xffffffff)

    # Testcase 33:  imm:0x7c, result rd:x14(0x00000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x14, 124(x2)
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0x00000001)

    # Testcase 34:  imm:0x0, result rd:x8(0x00000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.lwsp x8, 0(x2)
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0x00000002)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x7c, result rd:x4(0x00000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x4, 124(x2)
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x00000004)

    # Testcase 36:  imm:0x7c, result rd:x14(0x00000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x14, 124(x2)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0x00000008)

    # Testcase 37:  imm:0x7c, result rd:x25(0x00000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x25, 124(x2)
    sw x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0x00000010)

    # Testcase 38:  imm:0x0, result rd:x13(0x00000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(0)
    add    x2, x2, x3
    c.lwsp x13, 0(x2)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x13, 0x00000020)

    # Testcase 39:  imm:0x7c, result rd:x4(0x00000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x4, 124(x2)
    sw x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x00000040)





    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Testcase 40:  imm:0x4, result rd:x1(0x00000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x7, MASK_XLEN(-4)
    add    x2, x2, x7
    c.lwsp x1, 4(x2)
    sw x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x00000080)

    # Testcase 41:  imm:0x8, result rd:x3(0x00000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x7, MASK_XLEN(-8)
    add    x2, x2, x7
    c.lwsp x3, 8(x2)
    sw x3, 4(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x00000100)

    # Testcase 42:  imm:0x10, result rd:x3(0x00000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x7, MASK_XLEN(-16)
    add    x2, x2, x7
    c.lwsp x3, 16(x2)
    sw x3, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x00000200)

    # Testcase 43:  imm:0x20, result rd:x4(0x00000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x7, MASK_XLEN(-32)
    add    x2, x2, x7
    c.lwsp x4, 32(x2)
    sw x4, 12(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x00000400)

    # Testcase 44:  imm:0x40, result rd:x5(0x00000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x7, MASK_XLEN(-64)
    add    x2, x2, x7
    c.lwsp x5, 64(x2)
    sw x5, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0x00000800)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x78, result rd:x6(0x00001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x6, 120(x2)
    sw x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x00001000)

    # Testcase 46:  imm:0x74, result rd:x7(0x00002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x7, 116(x2)
    sw x7, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x00002000)

    # Testcase 47:  imm:0x6c, result rd:x8(0x00004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x8, 108(x2)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x00004000)

    # Testcase 48:  imm:0x5c, result rd:x9(0x00008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x9, 92(x2)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x00008000)

    # Testcase 49:  imm:0x3c, result rd:x10(0x00000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x10, 60(x2)
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x00000001)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x78, result rd:x11(0x00000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x11, 120(x2)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x00000002)

    # Testcase 51:  imm:0x74, result rd:x12(0x00040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x12, 116(x2)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x00040000)

    # Testcase 52:  imm:0x6c, result rd:x13(0x00080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x13, 108(x2)
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x00080000)

    # Testcase 53:  imm:0x5c, result rd:x14(0x00000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x14, 92(x2)
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x00000010)

    # Testcase 54:  imm:0x3c, result rd:x15(0x00000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x15, 60(x2)
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x00000020)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x78, result rd:x16(0x00400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x16, 120(x2)
    sw x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x00400000)

    # Testcase 56:  imm:0x74, result rd:x17(0x00800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x17, 116(x2)
    sw x17, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x00800000)

    # Testcase 57:  imm:0x6c, result rd:x18(0x00000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x18, 108(x2)
    sw x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x00000100)

    # Testcase 58:  imm:0x5c, result rd:x19(0x00000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x19, 92(x2)
    sw x19, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x00000200)

    # Testcase 59:  imm:0x3c, result rd:x20(0x04000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x20, 60(x2)
    sw x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x04000000)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x78, result rd:x21(0x08000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x21, 120(x2)
    sw x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x08000000)

    # Testcase 61:  imm:0x74, result rd:x22(0x00001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x22, 116(x2)
    sw x22, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x00001000)

    # Testcase 62:  imm:0x6c, result rd:x23(0x00002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x23, 108(x2)
    sw x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x00002000)

    # Testcase 63:  imm:0x5c, result rd:x24(0x40000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x24, 92(x2)
    sw x24, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x40000000)

    # Testcase 64:  imm:0x3c, result rd:x25(0x80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x25, 60(x2)
    sw x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x80000000)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x78, result rd:x26(0x00000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x26, 120(x2)
    sw x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x00000000)

    # Testcase 66:  imm:0x74, result rd:x27(0xfffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x27, 116(x2)
    sw x27, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffe)

    # Testcase 67:  imm:0x6c, result rd:x28(0xfffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x28, 108(x2)
    sw x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xfffffffd)

    # Testcase 68:  imm:0x5c, result rd:x29(0xfffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x29, 92(x2)
    sw x29, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffb)

    # Testcase 69:  imm:0x3c, result rd:x30(0xfffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x30, 60(x2)
    sw x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffff7)





    

    RVTEST_SIGBASE(x5,signature_15_0)

    # Testcase 70:  imm:0x78, result rd:x31(0xffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x6, MASK_XLEN(-120)
    add    x2, x2, x6
    c.lwsp x31, 120(x2)
    sw x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0xffffffef)

    # Testcase 71:  imm:0x74, result rd:x1(0xffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x6, MASK_XLEN(-116)
    add    x2, x2, x6
    c.lwsp x1, 116(x2)
    sw x1, 4(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffdf)

    # Testcase 72:  imm:0x6c, result rd:x3(0xffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x6, MASK_XLEN(-108)
    add    x2, x2, x6
    c.lwsp x3, 108(x2)
    sw x3, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffbf)

    # Testcase 73:  imm:0x5c, result rd:x3(0xffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x6, MASK_XLEN(-92)
    add    x2, x2, x6
    c.lwsp x3, 92(x2)
    sw x3, 12(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffff7f)

    # Testcase 74:  imm:0x3c, result rd:x4(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x6, MASK_XLEN(-60)
    add    x2, x2, x6
    c.lwsp x4, 60(x2)
    sw x4, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xfffffeff)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x78, result rd:x5(0xfffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x5, 120(x2)
    sw x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffdff)

    # Testcase 76:  imm:0x74, result rd:x6(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x6, 116(x2)
    sw x6, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xfffffeff)

    # Testcase 77:  imm:0x6c, result rd:x7(0xfffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x7, 108(x2)
    sw x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xfffff7ff)

    # Testcase 78:  imm:0x5c, result rd:x8(0xffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x8, 92(x2)
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffefff)

    # Testcase 79:  imm:0x3c, result rd:x9(0xffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x9, 60(x2)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xffffdfff)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x78, result rd:x10(0xffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x10, 120(x2)
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xffffefff)

    # Testcase 81:  imm:0x74, result rd:x11(0xffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x11, 116(x2)
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffff7fff)

    # Testcase 82:  imm:0x6c, result rd:x12(0xfffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x12, 108(x2)
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xfffeffff)

    # Testcase 83:  imm:0x5c, result rd:x13(0xfffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x13, 92(x2)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xfffdffff)

    # Testcase 84:  imm:0x3c, result rd:x14(0xfffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x14, 60(x2)
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xfffbffff)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x78, result rd:x15(0xfff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x15, 120(x2)
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xfff7ffff)

    # Testcase 86:  imm:0x74, result rd:x16(0xffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x16, 116(x2)
    sw x16, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xffefffff)

    # Testcase 87:  imm:0x6c, result rd:x17(0xffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x17, 108(x2)
    sw x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xffdfffff)

    # Testcase 88:  imm:0x5c, result rd:x18(0xffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x18, 92(x2)
    sw x18, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xffbfffff)

    # Testcase 89:  imm:0x3c, result rd:x19(0xff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x19, 60(x2)
    sw x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xff7fffff)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x78, result rd:x20(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x20, 120(x2)
    sw x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfeffffff)

    # Testcase 91:  imm:0x74, result rd:x21(0xfdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x21, 116(x2)
    sw x21, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfdffffff)

    # Testcase 92:  imm:0x6c, result rd:x22(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x22, 108(x2)
    sw x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xfeffffff)

    # Testcase 93:  imm:0x5c, result rd:x23(0xf7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x23, 92(x2)
    sw x23, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xf7ffffff)

    # Testcase 94:  imm:0x3c, result rd:x24(0xefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x24, 60(x2)
    sw x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xefffffff)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x78, result rd:x25(0xdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x25, 120(x2)
    sw x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xdfffffff)

    # Testcase 96:  imm:0x74, result rd:x26(0xefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x26, 116(x2)
    sw x26, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xefffffff)

    # Testcase 97:  imm:0x6c, result rd:x27(0x7fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x27, 108(x2)
    sw x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x7fffffff)

    # Testcase 98:  imm:0x5c, result rd:x28(0xffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x28, 92(x2)
    sw x28, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xffffffff)

    # Testcase 99:  imm:0x3c, result rd:x29(0x00000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x29, 60(x2)
    sw x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x00000001)





    

    RVTEST_SIGBASE(x4,signature_21_0)

    # Testcase 100:  imm:0x78, result rd:x30(0x00000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x30, 120(x2)
    sw x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x00000002)

    # Testcase 101:  imm:0x74, result rd:x31(0x00000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x31, 116(x2)
    sw x31, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x00000004)

    # Testcase 102:  imm:0x6c, result rd:x1(0x00000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x1, 108(x2)
    sw x1, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x00000008)

    # Testcase 103:  imm:0x5c, result rd:x3(0x00000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x3, 92(x2)
    sw x3, 12(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000010)

    # Testcase 104:  imm:0x4, result rd:x3(0x00000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x5, MASK_XLEN(-4)
    add    x2, x2, x5
    c.lwsp x3, 4(x2)
    sw x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000020)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x8, result rd:x4(0x00000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-8)
    add    x2, x2, x3
    c.lwsp x4, 8(x2)
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x00000040)

    # Testcase 106:  imm:0x10, result rd:x5(0x00000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-16)
    add    x2, x2, x3
    c.lwsp x5, 16(x2)
    sw x5, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x00000080)

    # Testcase 107:  imm:0x20, result rd:x6(0x00000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x3, MASK_XLEN(-32)
    add    x2, x2, x3
    c.lwsp x6, 32(x2)
    sw x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x00000100)

    # Testcase 108:  imm:0x40, result rd:x7(0x00000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x3, MASK_XLEN(-64)
    add    x2, x2, x3
    c.lwsp x7, 64(x2)
    sw x7, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x00000200)

    # Testcase 109:  imm:0x78, result rd:x8(0x00000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x8, 120(x2)
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x8, 0x00000400)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x74, result rd:x9(0x00000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x9, 116(x2)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x00000800)

    # Testcase 111:  imm:0x6c, result rd:x10(0x00001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x10, 108(x2)
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x00001000)

    # Testcase 112:  imm:0x5c, result rd:x11(0x00002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x11, 92(x2)
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x00002000)

    # Testcase 113:  imm:0x3c, result rd:x12(0x00004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x12, 60(x2)
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x00004000)

    # Testcase 114:  imm:0x78, result rd:x13(0x00008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x13, 120(x2)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x00008000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x74, result rd:x14(0x00000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x14, 116(x2)
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x00000001)

    # Testcase 116:  imm:0x6c, result rd:x15(0x00000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x15, 108(x2)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x00000002)

    # Testcase 117:  imm:0x5c, result rd:x16(0x00040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x16, 92(x2)
    sw x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x00040000)

    # Testcase 118:  imm:0x3c, result rd:x17(0x00080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x17, 60(x2)
    sw x17, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x00080000)

    # Testcase 119:  imm:0x78, result rd:x18(0x00000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x18, 120(x2)
    sw x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x00000010)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x74, result rd:x19(0x00000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x19, 116(x2)
    sw x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x00000020)

    # Testcase 121:  imm:0x6c, result rd:x20(0x00400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x20, 108(x2)
    sw x20, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x00400000)

    # Testcase 122:  imm:0x5c, result rd:x21(0x00800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x21, 92(x2)
    sw x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x00800000)

    # Testcase 123:  imm:0x3c, result rd:x22(0x00000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x22, 60(x2)
    sw x22, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x00000100)

    # Testcase 124:  imm:0x78, result rd:x23(0x00000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x23, 120(x2)
    sw x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x00000200)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x74, result rd:x24(0x04000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x24, 116(x2)
    sw x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x04000000)

    # Testcase 126:  imm:0x6c, result rd:x25(0x08000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x25, 108(x2)
    sw x25, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x08000000)

    # Testcase 127:  imm:0x5c, result rd:x26(0x00001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x26, 92(x2)
    sw x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x00001000)

    # Testcase 128:  imm:0x3c, result rd:x27(0x00002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x27, 60(x2)
    sw x27, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x00002000)

    # Testcase 129:  imm:0x78, result rd:x28(0x40000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x28, 120(x2)
    sw x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x40000000)





    

    RVTEST_SIGBASE(x4,signature_27_0)

    # Testcase 130:  imm:0x74, result rd:x29(0x80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x29, 116(x2)
    sw x29, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0x80000000)

    # Testcase 131:  imm:0x6c, result rd:x30(0x00000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x30, 108(x2)
    sw x30, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x00000000)

    # Testcase 132:  imm:0x5c, result rd:x31(0xfffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x31, 92(x2)
    sw x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0xfffffffe)

    # Testcase 133:  imm:0x3c, result rd:x1(0xfffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x5, MASK_XLEN(-60)
    add    x2, x2, x5
    c.lwsp x1, 60(x2)
    sw x1, 12(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffd)

    # Testcase 134:  imm:0x78, result rd:x3(0xfffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x3, 120(x2)
    sw x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x74, result rd:x3(0xfffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x8, MASK_XLEN(-116)
    add    x2, x2, x8
    c.lwsp x3, 116(x2)
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffff7)

    # Testcase 136:  imm:0x6c, result rd:x4(0xffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x8, MASK_XLEN(-108)
    add    x2, x2, x8
    c.lwsp x4, 108(x2)
    sw x4, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xffffffef)

    # Testcase 137:  imm:0x5c, result rd:x5(0xffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x8, MASK_XLEN(-92)
    add    x2, x2, x8
    c.lwsp x5, 92(x2)
    sw x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffdf)

    # Testcase 138:  imm:0x3c, result rd:x6(0xffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x8, MASK_XLEN(-60)
    add    x2, x2, x8
    c.lwsp x6, 60(x2)
    sw x6, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffbf)

    # Testcase 139:  imm:0x78, result rd:x7(0xffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x8, MASK_XLEN(-120)
    add    x2, x2, x8
    c.lwsp x7, 120(x2)
    sw x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0xffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x74, result rd:x8(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x8, 116(x2)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xfffffeff)

    # Testcase 141:  imm:0x6c, result rd:x9(0xfffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x9, 108(x2)
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xfffffdff)

    # Testcase 142:  imm:0x5c, result rd:x10(0xfffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x10, 92(x2)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffeff)

    # Testcase 143:  imm:0x3c, result rd:x11(0xfffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x11, 60(x2)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffff7ff)

    # Testcase 144:  imm:0x78, result rd:x12(0xffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x12, 120(x2)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x74, result rd:x13(0xffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x13, 116(x2)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xffffdfff)

    # Testcase 146:  imm:0x6c, result rd:x14(0xffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x14, 108(x2)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffefff)

    # Testcase 147:  imm:0x5c, result rd:x15(0xffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x15, 92(x2)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffff7fff)

    # Testcase 148:  imm:0x3c, result rd:x16(0xfffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x16, 60(x2)
    sw x16, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xfffeffff)

    # Testcase 149:  imm:0x78, result rd:x17(0xfffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x17, 120(x2)
    sw x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xfffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x74, result rd:x18(0xfffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x18, 116(x2)
    sw x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffbffff)

    # Testcase 151:  imm:0x6c, result rd:x19(0xfff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x19, 108(x2)
    sw x19, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfff7ffff)

    # Testcase 152:  imm:0x5c, result rd:x20(0xffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x20, 92(x2)
    sw x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xffefffff)

    # Testcase 153:  imm:0x3c, result rd:x21(0xffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x21, 60(x2)
    sw x21, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xffdfffff)

    # Testcase 154:  imm:0x78, result rd:x22(0xffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x22, 120(x2)
    sw x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x74, result rd:x23(0xff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x23, 116(x2)
    sw x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xff7fffff)

    # Testcase 156:  imm:0x6c, result rd:x24(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x24, 108(x2)
    sw x24, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xfeffffff)

    # Testcase 157:  imm:0x5c, result rd:x25(0xfdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x25, 92(x2)
    sw x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xfdffffff)

    # Testcase 158:  imm:0x3c, result rd:x26(0xfeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x26, 60(x2)
    sw x26, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfeffffff)

    # Testcase 159:  imm:0x78, result rd:x27(0xf7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x27, 120(x2)
    sw x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xf7ffffff)





    

    RVTEST_SIGBASE(x3,signature_33_0)

    # Testcase 160:  imm:0x74, result rd:x28(0xefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x4, MASK_XLEN(-116)
    add    x2, x2, x4
    c.lwsp x28, 116(x2)
    sw x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0xefffffff)

    # Testcase 161:  imm:0x6c, result rd:x29(0xdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x4, MASK_XLEN(-108)
    add    x2, x2, x4
    c.lwsp x29, 108(x2)
    sw x29, 4(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0xdfffffff)

    # Testcase 162:  imm:0x5c, result rd:x30(0xefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x4, MASK_XLEN(-92)
    add    x2, x2, x4
    c.lwsp x30, 92(x2)
    sw x30, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xefffffff)

    # Testcase 163:  imm:0x3c, result rd:x31(0x7fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x4, MASK_XLEN(-60)
    add    x2, x2, x4
    c.lwsp x31, 60(x2)
    sw x31, 12(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x7fffffff)

    # Testcase 164:  imm:0x78, result rd:x1(0xffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    c.lwsp x1, 120(x2)
    sw x1, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x74, result rd:x3(0x00000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x3, 116(x2)
    sw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000001)

    # Testcase 166:  imm:0x6c, result rd:x3(0x00000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x3, 108(x2)
    sw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000002)

    # Testcase 167:  imm:0x5c, result rd:x4(0x00000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x4, 92(x2)
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x4, 0x00000004)


	
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe

# Input data section.
	.data

	.align 4
test_data:

	.word 0xfffffffe
	.word 0xfffffffd
	.word 0xfffffffb
	.word 0xfffffff7
	.word 0xffffffef
	.word 0xffffffdf
	.word 0xffffffbf
	.word 0xffffff7f
	.word 0xfffffeff
	.word 0xfffffdff
	.word 0xfffffeff
	.word 0xfffff7ff
	.word 0xffffefff
	.word 0xffffdfff
	.word 0xffffefff
	.word 0xffff7fff
	.word 0xfffeffff
	.word 0xfffdffff
	.word 0xfffbffff
	.word 0xfff7ffff
	.word 0xffefffff
	.word 0xffdfffff
	.word 0xffbfffff
	.word 0xff7fffff
	.word 0xfeffffff
	.word 0xfdffffff
	.word 0xfeffffff
	.word 0xf7ffffff
	.word 0xefffffff
	.word 0xdfffffff
	.word 0xefffffff
	.word 0x7fffffff
	.word 0xffffffff
	.word 0x00000001
	.word 0x00000002
	.word 0x00000004
	.word 0x00000008
	.word 0x00000010
	.word 0x00000020
	.word 0x00000040
	.word 0x00000080
	.word 0x00000100
	.word 0x00000200
	.word 0x00000400
	.word 0x00000800
	.word 0x00001000
	.word 0x00002000
	.word 0x00004000
	.word 0x00008000
	.word 0x00000001
	.word 0x00000002
	.word 0x00040000
	.word 0x00080000
	.word 0x00000010
	.word 0x00000020
	.word 0x00400000
	.word 0x00800000
	.word 0x00000100
	.word 0x00000200
	.word 0x04000000
	.word 0x08000000
	.word 0x00001000
	.word 0x00002000
	.word 0x40000000
	.word 0x80000000
	.word 0x00000000

RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 5, 4, 0xdeadbeef
signature_2_0:
	.fill 5, 4, 0xdeadbeef
signature_3_0:
	.fill 5, 4, 0xdeadbeef
signature_4_0:
	.fill 5, 4, 0xdeadbeef
signature_5_0:
	.fill 5, 4, 0xdeadbeef
signature_6_0:
	.fill 5, 4, 0xdeadbeef
signature_7_0:
	.fill 5, 4, 0xdeadbeef
signature_8_0:
	.fill 5, 4, 0xdeadbeef
signature_9_0:
	.fill 5, 4, 0xdeadbeef
signature_10_0:
	.fill 5, 4, 0xdeadbeef
signature_11_0:
	.fill 5, 4, 0xdeadbeef
signature_12_0:
	.fill 5, 4, 0xdeadbeef
signature_13_0:
	.fill 5, 4, 0xdeadbeef
signature_14_0:
	.fill 5, 4, 0xdeadbeef
signature_15_0:
	.fill 5, 4, 0xdeadbeef
signature_16_0:
	.fill 5, 4, 0xdeadbeef
signature_17_0:
	.fill 5, 4, 0xdeadbeef
signature_18_0:
	.fill 5, 4, 0xdeadbeef
signature_19_0:
	.fill 5, 4, 0xdeadbeef
signature_20_0:
	.fill 5, 4, 0xdeadbeef
signature_21_0:
	.fill 5, 4, 0xdeadbeef
signature_22_0:
	.fill 5, 4, 0xdeadbeef
signature_23_0:
	.fill 5, 4, 0xdeadbeef
signature_24_0:
	.fill 5, 4, 0xdeadbeef
signature_25_0:
	.fill 5, 4, 0xdeadbeef
signature_26_0:
	.fill 5, 4, 0xdeadbeef
signature_27_0:
	.fill 5, 4, 0xdeadbeef
signature_28_0:
	.fill 5, 4, 0xdeadbeef
signature_29_0:
	.fill 5, 4, 0xdeadbeef
signature_30_0:
	.fill 5, 4, 0xdeadbeef
signature_31_0:
	.fill 5, 4, 0xdeadbeef
signature_32_0:
	.fill 5, 4, 0xdeadbeef
signature_33_0:
	.fill 5, 4, 0xdeadbeef
signature_34_0:
	.fill 5, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

