// RISC-V Architectural Validation Test C-LW-01
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
// Description: Testing instruction 'c.lw'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.lw)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.lw)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x1c, result rd:x11(0xfffffffe)
    la  x12, test_data
    addi    x12, x12,0
    li     x2, MASK_XLEN(-28)
    add    x12, x12, x2
    c.lw x11, 28(x12)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffe)

    # Testcase 1:  imm:0x44, result rd:x14(0xfffffffd)
    la  x12, test_data
    addi    x12, x12,4
    li     x2, MASK_XLEN(-68)
    add    x12, x12, x2
    c.lw x14, 68(x12)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffd)

    # Testcase 2:  imm:0x14, result rd:x10(0xfffffffb)
    la  x8, test_data
    addi    x8, x8,8
    li     x2, MASK_XLEN(-20)
    add    x8, x8, x2
    c.lw x10, 20(x8)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffb)

    # Testcase 3:  imm:0x10, result rd:x11(0xfffffff7)
    la  x15, test_data
    addi    x15, x15,12
    li     x2, MASK_XLEN(-16)
    add    x15, x15, x2
    c.lw x11, 16(x15)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffff7)

    # Testcase 4:  imm:0x78, result rd:x13(0xffffffef)
    la  x8, test_data
    addi    x8, x8,16
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x13, 120(x8)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffef)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0x7c, result rd:x13(0xffffffdf)
    la  x12, test_data
    addi    x12, x12,20
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    c.lw x13, 124(x12)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffdf)

    # Testcase 6:  imm:0x1c, result rd:x11(0xffffffbf)
    la  x9, test_data
    addi    x9, x9,24
    li     x2, MASK_XLEN(-28)
    add    x9, x9, x2
    c.lw x11, 28(x9)
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffbf)

    # Testcase 7:  imm:0x44, result rd:x10(0xffffff7f)
    la  x15, test_data
    addi    x15, x15,28
    li     x2, MASK_XLEN(-68)
    add    x15, x15, x2
    c.lw x10, 68(x15)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffff7f)

    # Testcase 8:  imm:0x50, result rd:x9(0xfffffeff)
    la  x15, test_data
    addi    x15, x15,32
    li     x2, MASK_XLEN(-80)
    add    x15, x15, x2
    c.lw x9, 80(x15)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffeff)

    # Testcase 9:  imm:0x0, result rd:x9(0xfffffdff)
    la  x15, test_data
    addi    x15, x15,36
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    c.lw x9, 0(x15)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x78, result rd:x15(0xfffffeff)
    la  x13, test_data
    addi    x13, x13,40
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x15, 120(x13)
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffeff)

    # Testcase 11:  imm:0x38, result rd:x8(0xfffff7ff)
    la  x14, test_data
    addi    x14, x14,44
    li     x2, MASK_XLEN(-56)
    add    x14, x14, x2
    c.lw x8, 56(x14)
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffff7ff)

    # Testcase 12:  imm:0x40, result rd:x8(0xffffefff)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(-64)
    add    x9, x9, x2
    c.lw x8, 64(x9)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffefff)

    # Testcase 13:  imm:0x44, result rd:x15(0xffffdfff)
    la  x14, test_data
    addi    x14, x14,52
    li     x2, MASK_XLEN(-68)
    add    x14, x14, x2
    c.lw x15, 68(x14)
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffdfff)

    # Testcase 14:  imm:0x60, result rd:x11(0xffffefff)
    la  x14, test_data
    addi    x14, x14,56
    li     x2, MASK_XLEN(-96)
    add    x14, x14, x2
    c.lw x11, 96(x14)
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffefff)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0x34, result rd:x9(0xffff7fff)
    la  x10, test_data
    addi    x10, x10,60
    li     x2, MASK_XLEN(-52)
    add    x10, x10, x2
    c.lw x9, 52(x10)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffff7fff)

    # Testcase 16:  imm:0x14, result rd:x15(0xfffeffff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(-20)
    add    x13, x13, x2
    c.lw x15, 20(x13)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffeffff)

    # Testcase 17:  imm:0x4, result rd:x15(0xfffdffff)
    la  x11, test_data
    addi    x11, x11,68
    li     x2, MASK_XLEN(-4)
    add    x11, x11, x2
    c.lw x15, 4(x11)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffdffff)

    # Testcase 18:  imm:0x20, result rd:x13(0xfffbffff)
    la  x8, test_data
    addi    x8, x8,72
    li     x2, MASK_XLEN(-32)
    add    x8, x8, x2
    c.lw x13, 32(x8)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffbffff)

    # Testcase 19:  imm:0x6c, result rd:x12(0xfff7ffff)
    la  x11, test_data
    addi    x11, x11,76
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x12, 108(x11)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff7ffff)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 20:  imm:0x30, result rd:x9(0xffefffff)
    la  x14, test_data
    addi    x14, x14,80
    li     x2, MASK_XLEN(-48)
    add    x14, x14, x2
    c.lw x9, 48(x14)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffefffff)

    # Testcase 21:  imm:0x54, result rd:x15(0xffdfffff)
    la  x12, test_data
    addi    x12, x12,84
    li     x2, MASK_XLEN(-84)
    add    x12, x12, x2
    c.lw x15, 84(x12)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffdfffff)

    # Testcase 22:  imm:0x10, result rd:x10(0xffbfffff)
    la  x12, test_data
    addi    x12, x12,88
    li     x2, MASK_XLEN(-16)
    add    x12, x12, x2
    c.lw x10, 16(x12)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffbfffff)

    # Testcase 23:  imm:0x18, result rd:x13(0xff7fffff)
    la  x14, test_data
    addi    x14, x14,92
    li     x2, MASK_XLEN(-24)
    add    x14, x14, x2
    c.lw x13, 24(x14)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xff7fffff)

    # Testcase 24:  imm:0x30, result rd:x9(0xfeffffff)
    la  x14, test_data
    addi    x14, x14,96
    li     x2, MASK_XLEN(-48)
    add    x14, x14, x2
    c.lw x9, 48(x14)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfeffffff)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 25:  imm:0x58, result rd:x11(0xfdffffff)
    la  x15, test_data
    addi    x15, x15,100
    li     x2, MASK_XLEN(-88)
    add    x15, x15, x2
    c.lw x11, 88(x15)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfdffffff)

    # Testcase 26:  imm:0x50, result rd:x13(0xfeffffff)
    la  x12, test_data
    addi    x12, x12,104
    li     x2, MASK_XLEN(-80)
    add    x12, x12, x2
    c.lw x13, 80(x12)
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfeffffff)

    # Testcase 27:  imm:0x60, result rd:x14(0xf7ffffff)
    la  x9, test_data
    addi    x9, x9,108
    li     x2, MASK_XLEN(-96)
    add    x9, x9, x2
    c.lw x14, 96(x9)
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xf7ffffff)

    # Testcase 28:  imm:0x70, result rd:x9(0xefffffff)
    la  x10, test_data
    addi    x10, x10,112
    li     x2, MASK_XLEN(-112)
    add    x10, x10, x2
    c.lw x9, 112(x10)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xefffffff)

    # Testcase 29:  imm:0x48, result rd:x14(0xdfffffff)
    la  x8, test_data
    addi    x8, x8,116
    li     x2, MASK_XLEN(-72)
    add    x8, x8, x2
    c.lw x14, 72(x8)
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x8(0xefffffff)
    la  x11, test_data
    addi    x11, x11,120
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.lw x8, 0(x11)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xefffffff)

    # Testcase 31:  imm:0x7c, result rd:x12(0x7fffffff)
    la  x11, test_data
    addi    x11, x11,124
    li     x2, MASK_XLEN(-124)
    add    x11, x11, x2
    c.lw x12, 124(x11)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x7fffffff)

    # Testcase 32:  imm:0x7c, result rd:x15(0xffffffff)
    la  x14, test_data
    addi    x14, x14,128
    li     x2, MASK_XLEN(-124)
    add    x14, x14, x2
    c.lw x15, 124(x14)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffff)

    # Testcase 33:  imm:0x7c, result rd:x11(0x00000001)
    la  x13, test_data
    addi    x13, x13,132
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    c.lw x11, 124(x13)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000001)

    # Testcase 34:  imm:0x0, result rd:x15(0x00000002)
    la  x8, test_data
    addi    x8, x8,136
    li     x2, MASK_XLEN(0)
    add    x8, x8, x2
    c.lw x15, 0(x8)
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000002)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x7c, result rd:x8(0x00000004)
    la  x12, test_data
    addi    x12, x12,140
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    c.lw x8, 124(x12)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000004)

    # Testcase 36:  imm:0x7c, result rd:x15(0x00000008)
    la  x10, test_data
    addi    x10, x10,144
    li     x2, MASK_XLEN(-124)
    add    x10, x10, x2
    c.lw x15, 124(x10)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000008)

    # Testcase 37:  imm:0x7c, result rd:x8(0x00000010)
    la  x13, test_data
    addi    x13, x13,148
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    c.lw x8, 124(x13)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000010)

    # Testcase 38:  imm:0x0, result rd:x13(0x00000020)
    la  x11, test_data
    addi    x11, x11,152
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.lw x13, 0(x11)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000020)

    # Testcase 39:  imm:0x7c, result rd:x13(0x00000040)
    la  x8, test_data
    addi    x8, x8,156
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    c.lw x13, 124(x8)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000040)





    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Testcase 40:  imm:0x4, result rd:x8(0x00000080)
    la  x9, test_data
    addi    x9, x9,160
    li     x2, MASK_XLEN(-4)
    add    x9, x9, x2
    c.lw x8, 4(x9)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000080)

    # Testcase 41:  imm:0x8, result rd:x9(0x00000100)
    la  x10, test_data
    addi    x10, x10,164
    li     x2, MASK_XLEN(-8)
    add    x10, x10, x2
    c.lw x9, 8(x10)
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000100)

    # Testcase 42:  imm:0x10, result rd:x10(0x00000200)
    la  x11, test_data
    addi    x11, x11,168
    li     x2, MASK_XLEN(-16)
    add    x11, x11, x2
    c.lw x10, 16(x11)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000200)

    # Testcase 43:  imm:0x20, result rd:x11(0x00000400)
    la  x12, test_data
    addi    x12, x12,172
    li     x2, MASK_XLEN(-32)
    add    x12, x12, x2
    c.lw x11, 32(x12)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000400)

    # Testcase 44:  imm:0x40, result rd:x12(0x00000800)
    la  x13, test_data
    addi    x13, x13,176
    li     x2, MASK_XLEN(-64)
    add    x13, x13, x2
    c.lw x12, 64(x13)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000800)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x78, result rd:x13(0x00001000)
    la  x14, test_data
    addi    x14, x14,180
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00001000)

    # Testcase 46:  imm:0x74, result rd:x14(0x00002000)
    la  x15, test_data
    addi    x15, x15,184
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00002000)

    # Testcase 47:  imm:0x6c, result rd:x15(0x00004000)
    la  x8, test_data
    addi    x8, x8,188
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00004000)

    # Testcase 48:  imm:0x5c, result rd:x8(0x00008000)
    la  x9, test_data
    addi    x9, x9,192
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00008000)

    # Testcase 49:  imm:0x3c, result rd:x9(0x00000001)
    la  x10, test_data
    addi    x10, x10,196
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000001)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x78, result rd:x10(0x00000002)
    la  x11, test_data
    addi    x11, x11,200
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000002)

    # Testcase 51:  imm:0x74, result rd:x11(0x00040000)
    la  x12, test_data
    addi    x12, x12,204
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00040000)

    # Testcase 52:  imm:0x6c, result rd:x12(0x00080000)
    la  x13, test_data
    addi    x13, x13,208
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00080000)

    # Testcase 53:  imm:0x5c, result rd:x13(0x00000010)
    la  x14, test_data
    addi    x14, x14,212
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000010)

    # Testcase 54:  imm:0x3c, result rd:x14(0x00000020)
    la  x15, test_data
    addi    x15, x15,216
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000020)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x78, result rd:x15(0x00400000)
    la  x8, test_data
    addi    x8, x8,220
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00400000)

    # Testcase 56:  imm:0x74, result rd:x8(0x00800000)
    la  x9, test_data
    addi    x9, x9,224
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00800000)

    # Testcase 57:  imm:0x6c, result rd:x9(0x00000100)
    la  x10, test_data
    addi    x10, x10,228
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000100)

    # Testcase 58:  imm:0x5c, result rd:x10(0x00000200)
    la  x11, test_data
    addi    x11, x11,232
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000200)

    # Testcase 59:  imm:0x3c, result rd:x11(0x04000000)
    la  x12, test_data
    addi    x12, x12,236
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x04000000)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x78, result rd:x12(0x08000000)
    la  x13, test_data
    addi    x13, x13,240
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x08000000)

    # Testcase 61:  imm:0x74, result rd:x13(0x00001000)
    la  x14, test_data
    addi    x14, x14,244
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00001000)

    # Testcase 62:  imm:0x6c, result rd:x14(0x00002000)
    la  x15, test_data
    addi    x15, x15,248
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00002000)

    # Testcase 63:  imm:0x5c, result rd:x15(0x40000000)
    la  x8, test_data
    addi    x8, x8,252
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x40000000)

    # Testcase 64:  imm:0x3c, result rd:x8(0x80000000)
    la  x9, test_data
    addi    x9, x9,256
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x80000000)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x78, result rd:x9(0x00000000)
    la  x10, test_data
    addi    x10, x10,260
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000000)

    # Testcase 66:  imm:0x74, result rd:x10(0xfffffffe)
    la  x11, test_data
    addi    x11, x11,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffe)

    # Testcase 67:  imm:0x6c, result rd:x11(0xfffffffd)
    la  x12, test_data
    addi    x12, x12,4
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffd)

    # Testcase 68:  imm:0x5c, result rd:x12(0xfffffffb)
    la  x13, test_data
    addi    x13, x13,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffb)

    # Testcase 69:  imm:0x3c, result rd:x13(0xfffffff7)
    la  x14, test_data
    addi    x14, x14,12
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffff7)





    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Testcase 70:  imm:0x78, result rd:x14(0xffffffef)
    la  x15, test_data
    addi    x15, x15,16
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffef)

    # Testcase 71:  imm:0x74, result rd:x15(0xffffffdf)
    la  x8, test_data
    addi    x8, x8,20
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffdf)

    # Testcase 72:  imm:0x6c, result rd:x8(0xffffffbf)
    la  x9, test_data
    addi    x9, x9,24
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffbf)

    # Testcase 73:  imm:0x5c, result rd:x9(0xffffff7f)
    la  x10, test_data
    addi    x10, x10,28
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffff7f)

    # Testcase 74:  imm:0x3c, result rd:x10(0xfffffeff)
    la  x11, test_data
    addi    x11, x11,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffeff)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x78, result rd:x11(0xfffffdff)
    la  x12, test_data
    addi    x12, x12,36
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffdff)

    # Testcase 76:  imm:0x74, result rd:x12(0xfffffeff)
    la  x13, test_data
    addi    x13, x13,40
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffeff)

    # Testcase 77:  imm:0x6c, result rd:x13(0xfffff7ff)
    la  x14, test_data
    addi    x14, x14,44
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffff7ff)

    # Testcase 78:  imm:0x5c, result rd:x14(0xffffefff)
    la  x15, test_data
    addi    x15, x15,48
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffefff)

    # Testcase 79:  imm:0x3c, result rd:x15(0xffffdfff)
    la  x8, test_data
    addi    x8, x8,52
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffdfff)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x78, result rd:x8(0xffffefff)
    la  x9, test_data
    addi    x9, x9,56
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffefff)

    # Testcase 81:  imm:0x74, result rd:x9(0xffff7fff)
    la  x10, test_data
    addi    x10, x10,60
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffff7fff)

    # Testcase 82:  imm:0x6c, result rd:x10(0xfffeffff)
    la  x11, test_data
    addi    x11, x11,64
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffeffff)

    # Testcase 83:  imm:0x5c, result rd:x11(0xfffdffff)
    la  x12, test_data
    addi    x12, x12,68
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffdffff)

    # Testcase 84:  imm:0x3c, result rd:x12(0xfffbffff)
    la  x13, test_data
    addi    x13, x13,72
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffbffff)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x78, result rd:x13(0xfff7ffff)
    la  x14, test_data
    addi    x14, x14,76
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfff7ffff)

    # Testcase 86:  imm:0x74, result rd:x14(0xffefffff)
    la  x15, test_data
    addi    x15, x15,80
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffefffff)

    # Testcase 87:  imm:0x6c, result rd:x15(0xffdfffff)
    la  x8, test_data
    addi    x8, x8,84
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffdfffff)

    # Testcase 88:  imm:0x5c, result rd:x8(0xffbfffff)
    la  x9, test_data
    addi    x9, x9,88
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffbfffff)

    # Testcase 89:  imm:0x3c, result rd:x9(0xff7fffff)
    la  x10, test_data
    addi    x10, x10,92
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xff7fffff)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x78, result rd:x10(0xfeffffff)
    la  x11, test_data
    addi    x11, x11,96
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfeffffff)

    # Testcase 91:  imm:0x74, result rd:x11(0xfdffffff)
    la  x12, test_data
    addi    x12, x12,100
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfdffffff)

    # Testcase 92:  imm:0x6c, result rd:x12(0xfeffffff)
    la  x13, test_data
    addi    x13, x13,104
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfeffffff)

    # Testcase 93:  imm:0x5c, result rd:x13(0xf7ffffff)
    la  x14, test_data
    addi    x14, x14,108
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xf7ffffff)

    # Testcase 94:  imm:0x3c, result rd:x14(0xefffffff)
    la  x15, test_data
    addi    x15, x15,112
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xefffffff)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x78, result rd:x15(0xdfffffff)
    la  x8, test_data
    addi    x8, x8,116
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xdfffffff)

    # Testcase 96:  imm:0x74, result rd:x8(0xefffffff)
    la  x9, test_data
    addi    x9, x9,120
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xefffffff)

    # Testcase 97:  imm:0x6c, result rd:x9(0x7fffffff)
    la  x10, test_data
    addi    x10, x10,124
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x7fffffff)

    # Testcase 98:  imm:0x5c, result rd:x10(0xffffffff)
    la  x11, test_data
    addi    x11, x11,128
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffff)

    # Testcase 99:  imm:0x3c, result rd:x11(0x00000001)
    la  x12, test_data
    addi    x12, x12,132
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000001)





    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Testcase 100:  imm:0x78, result rd:x12(0x00000002)
    la  x13, test_data
    addi    x13, x13,136
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000002)

    # Testcase 101:  imm:0x74, result rd:x13(0x00000004)
    la  x14, test_data
    addi    x14, x14,140
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000004)

    # Testcase 102:  imm:0x6c, result rd:x14(0x00000008)
    la  x15, test_data
    addi    x15, x15,144
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000008)

    # Testcase 103:  imm:0x5c, result rd:x15(0x00000010)
    la  x8, test_data
    addi    x8, x8,148
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000010)

    # Testcase 104:  imm:0x4, result rd:x8(0x00000020)
    la  x9, test_data
    addi    x9, x9,152
    li     x2, MASK_XLEN(-4)
    add    x9, x9, x2
    c.lw x8, 4(x9)
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000020)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x8, result rd:x9(0x00000040)
    la  x10, test_data
    addi    x10, x10,156
    li     x2, MASK_XLEN(-8)
    add    x10, x10, x2
    c.lw x9, 8(x10)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000040)

    # Testcase 106:  imm:0x10, result rd:x10(0x00000080)
    la  x11, test_data
    addi    x11, x11,160
    li     x2, MASK_XLEN(-16)
    add    x11, x11, x2
    c.lw x10, 16(x11)
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000080)

    # Testcase 107:  imm:0x20, result rd:x11(0x00000100)
    la  x12, test_data
    addi    x12, x12,164
    li     x2, MASK_XLEN(-32)
    add    x12, x12, x2
    c.lw x11, 32(x12)
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000100)

    # Testcase 108:  imm:0x40, result rd:x12(0x00000200)
    la  x13, test_data
    addi    x13, x13,168
    li     x2, MASK_XLEN(-64)
    add    x13, x13, x2
    c.lw x12, 64(x13)
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000200)

    # Testcase 109:  imm:0x78, result rd:x13(0x00000400)
    la  x14, test_data
    addi    x14, x14,172
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000400)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x74, result rd:x14(0x00000800)
    la  x15, test_data
    addi    x15, x15,176
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000800)

    # Testcase 111:  imm:0x6c, result rd:x15(0x00001000)
    la  x8, test_data
    addi    x8, x8,180
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00001000)

    # Testcase 112:  imm:0x5c, result rd:x8(0x00002000)
    la  x9, test_data
    addi    x9, x9,184
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00002000)

    # Testcase 113:  imm:0x3c, result rd:x9(0x00004000)
    la  x10, test_data
    addi    x10, x10,188
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00004000)

    # Testcase 114:  imm:0x78, result rd:x10(0x00008000)
    la  x11, test_data
    addi    x11, x11,192
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00008000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x74, result rd:x11(0x00000001)
    la  x12, test_data
    addi    x12, x12,196
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000001)

    # Testcase 116:  imm:0x6c, result rd:x12(0x00000002)
    la  x13, test_data
    addi    x13, x13,200
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000002)

    # Testcase 117:  imm:0x5c, result rd:x13(0x00040000)
    la  x14, test_data
    addi    x14, x14,204
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00040000)

    # Testcase 118:  imm:0x3c, result rd:x14(0x00080000)
    la  x15, test_data
    addi    x15, x15,208
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00080000)

    # Testcase 119:  imm:0x78, result rd:x15(0x00000010)
    la  x8, test_data
    addi    x8, x8,212
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000010)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x74, result rd:x8(0x00000020)
    la  x9, test_data
    addi    x9, x9,216
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000020)

    # Testcase 121:  imm:0x6c, result rd:x9(0x00400000)
    la  x10, test_data
    addi    x10, x10,220
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00400000)

    # Testcase 122:  imm:0x5c, result rd:x10(0x00800000)
    la  x11, test_data
    addi    x11, x11,224
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00800000)

    # Testcase 123:  imm:0x3c, result rd:x11(0x00000100)
    la  x12, test_data
    addi    x12, x12,228
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000100)

    # Testcase 124:  imm:0x78, result rd:x12(0x00000200)
    la  x13, test_data
    addi    x13, x13,232
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x00000200)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x74, result rd:x13(0x04000000)
    la  x14, test_data
    addi    x14, x14,236
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x04000000)

    # Testcase 126:  imm:0x6c, result rd:x14(0x08000000)
    la  x15, test_data
    addi    x15, x15,240
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x08000000)

    # Testcase 127:  imm:0x5c, result rd:x15(0x00001000)
    la  x8, test_data
    addi    x8, x8,244
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00001000)

    # Testcase 128:  imm:0x3c, result rd:x8(0x00002000)
    la  x9, test_data
    addi    x9, x9,248
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00002000)

    # Testcase 129:  imm:0x78, result rd:x9(0x40000000)
    la  x10, test_data
    addi    x10, x10,252
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x40000000)





    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 130:  imm:0x74, result rd:x10(0x80000000)
    la  x11, test_data
    addi    x11, x11,256
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x80000000)

    # Testcase 131:  imm:0x6c, result rd:x11(0x00000000)
    la  x12, test_data
    addi    x12, x12,260
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000000)

    # Testcase 132:  imm:0x5c, result rd:x12(0xfffffffe)
    la  x13, test_data
    addi    x13, x13,0
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffe)

    # Testcase 133:  imm:0x3c, result rd:x13(0xfffffffd)
    la  x14, test_data
    addi    x14, x14,4
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffd)

    # Testcase 134:  imm:0x78, result rd:x14(0xfffffffb)
    la  x15, test_data
    addi    x15, x15,8
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x74, result rd:x15(0xfffffff7)
    la  x8, test_data
    addi    x8, x8,12
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffff7)

    # Testcase 136:  imm:0x6c, result rd:x8(0xffffffef)
    la  x9, test_data
    addi    x9, x9,16
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffef)

    # Testcase 137:  imm:0x5c, result rd:x9(0xffffffdf)
    la  x10, test_data
    addi    x10, x10,20
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffdf)

    # Testcase 138:  imm:0x3c, result rd:x10(0xffffffbf)
    la  x11, test_data
    addi    x11, x11,24
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffbf)

    # Testcase 139:  imm:0x78, result rd:x11(0xffffff7f)
    la  x12, test_data
    addi    x12, x12,28
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x74, result rd:x12(0xfffffeff)
    la  x13, test_data
    addi    x13, x13,32
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffeff)

    # Testcase 141:  imm:0x6c, result rd:x13(0xfffffdff)
    la  x14, test_data
    addi    x14, x14,36
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffdff)

    # Testcase 142:  imm:0x5c, result rd:x14(0xfffffeff)
    la  x15, test_data
    addi    x15, x15,40
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffeff)

    # Testcase 143:  imm:0x3c, result rd:x15(0xfffff7ff)
    la  x8, test_data
    addi    x8, x8,44
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffff7ff)

    # Testcase 144:  imm:0x78, result rd:x8(0xffffefff)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x74, result rd:x9(0xffffdfff)
    la  x10, test_data
    addi    x10, x10,52
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffdfff)

    # Testcase 146:  imm:0x6c, result rd:x10(0xffffefff)
    la  x11, test_data
    addi    x11, x11,56
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffefff)

    # Testcase 147:  imm:0x5c, result rd:x11(0xffff7fff)
    la  x12, test_data
    addi    x12, x12,60
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffff7fff)

    # Testcase 148:  imm:0x3c, result rd:x12(0xfffeffff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffeffff)

    # Testcase 149:  imm:0x78, result rd:x13(0xfffdffff)
    la  x14, test_data
    addi    x14, x14,68
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x74, result rd:x14(0xfffbffff)
    la  x15, test_data
    addi    x15, x15,72
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffbffff)

    # Testcase 151:  imm:0x6c, result rd:x15(0xfff7ffff)
    la  x8, test_data
    addi    x8, x8,76
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfff7ffff)

    # Testcase 152:  imm:0x5c, result rd:x8(0xffefffff)
    la  x9, test_data
    addi    x9, x9,80
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffefffff)

    # Testcase 153:  imm:0x3c, result rd:x9(0xffdfffff)
    la  x10, test_data
    addi    x10, x10,84
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffdfffff)

    # Testcase 154:  imm:0x78, result rd:x10(0xffbfffff)
    la  x11, test_data
    addi    x11, x11,88
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x74, result rd:x11(0xff7fffff)
    la  x12, test_data
    addi    x12, x12,92
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xff7fffff)

    # Testcase 156:  imm:0x6c, result rd:x12(0xfeffffff)
    la  x13, test_data
    addi    x13, x13,96
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfeffffff)

    # Testcase 157:  imm:0x5c, result rd:x13(0xfdffffff)
    la  x14, test_data
    addi    x14, x14,100
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfdffffff)

    # Testcase 158:  imm:0x3c, result rd:x14(0xfeffffff)
    la  x15, test_data
    addi    x15, x15,104
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfeffffff)

    # Testcase 159:  imm:0x78, result rd:x15(0xf7ffffff)
    la  x8, test_data
    addi    x8, x8,108
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xf7ffffff)





    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 160:  imm:0x74, result rd:x8(0xefffffff)
    la  x9, test_data
    addi    x9, x9,112
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xefffffff)

    # Testcase 161:  imm:0x6c, result rd:x9(0xdfffffff)
    la  x10, test_data
    addi    x10, x10,116
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xdfffffff)

    # Testcase 162:  imm:0x5c, result rd:x10(0xefffffff)
    la  x11, test_data
    addi    x11, x11,120
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xefffffff)

    # Testcase 163:  imm:0x3c, result rd:x11(0x7fffffff)
    la  x12, test_data
    addi    x12, x12,124
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x7fffffff)

    # Testcase 164:  imm:0x78, result rd:x12(0xffffffff)
    la  x13, test_data
    addi    x13, x13,128
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x74, result rd:x13(0x00000001)
    la  x14, test_data
    addi    x14, x14,132
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x00000001)

    # Testcase 166:  imm:0x6c, result rd:x14(0x00000002)
    la  x15, test_data
    addi    x15, x15,136
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x00000002)

    # Testcase 167:  imm:0x5c, result rd:x15(0x00000004)
    la  x8, test_data
    addi    x8, x8,140
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x00000004)


	
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

