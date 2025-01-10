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
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.lw)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.lw)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x1c, result rd:x11(0xfffffffffffffffe)
    la  x12, test_data
    addi    x12, x12,0
    li     x2, MASK_XLEN(-28)
    add    x12, x12, x2
    c.lw x11, 28(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffffe)

    # Testcase 1:  imm:0x44, result rd:x14(0xfffffffffffffffd)
    la  x12, test_data
    addi    x12, x12,4
    li     x2, MASK_XLEN(-68)
    add    x12, x12, x2
    c.lw x14, 68(x12)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffd)

    # Testcase 2:  imm:0x14, result rd:x10(0xfffffffffffffffb)
    la  x8, test_data
    addi    x8, x8,8
    li     x2, MASK_XLEN(-20)
    add    x8, x8, x2
    c.lw x10, 20(x8)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffb)

    # Testcase 3:  imm:0x10, result rd:x11(0xfffffffffffffff7)
    la  x15, test_data
    addi    x15, x15,12
    li     x2, MASK_XLEN(-16)
    add    x15, x15, x2
    c.lw x11, 16(x15)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffff7)

    # Testcase 4:  imm:0x78, result rd:x13(0xffffffffffffffef)
    la  x8, test_data
    addi    x8, x8,16
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x13, 120(x8)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffef)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0x7c, result rd:x13(0xffffffffffffffdf)
    la  x12, test_data
    addi    x12, x12,20
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    c.lw x13, 124(x12)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffdf)

    # Testcase 6:  imm:0x1c, result rd:x11(0xffffffffffffffbf)
    la  x9, test_data
    addi    x9, x9,24
    li     x2, MASK_XLEN(-28)
    add    x9, x9, x2
    c.lw x11, 28(x9)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x44, result rd:x10(0xffffffffffffff7f)
    la  x15, test_data
    addi    x15, x15,28
    li     x2, MASK_XLEN(-68)
    add    x15, x15, x2
    c.lw x10, 68(x15)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffff7f)

    # Testcase 8:  imm:0x50, result rd:x9(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,32
    li     x2, MASK_XLEN(-80)
    add    x15, x15, x2
    c.lw x9, 80(x15)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffeff)

    # Testcase 9:  imm:0x0, result rd:x9(0xfffffffffffffdff)
    la  x15, test_data
    addi    x15, x15,36
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    c.lw x9, 0(x15)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x78, result rd:x15(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,40
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x15, 120(x13)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x38, result rd:x8(0xfffffffffffff7ff)
    la  x14, test_data
    addi    x14, x14,44
    li     x2, MASK_XLEN(-56)
    add    x14, x14, x2
    c.lw x8, 56(x14)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffff7ff)

    # Testcase 12:  imm:0x40, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(-64)
    add    x9, x9, x2
    c.lw x8, 64(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)

    # Testcase 13:  imm:0x44, result rd:x15(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,52
    li     x2, MASK_XLEN(-68)
    add    x14, x14, x2
    c.lw x15, 68(x14)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffdfff)

    # Testcase 14:  imm:0x60, result rd:x11(0xffffffffffffefff)
    la  x14, test_data
    addi    x14, x14,56
    li     x2, MASK_XLEN(-96)
    add    x14, x14, x2
    c.lw x11, 96(x14)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0x34, result rd:x9(0xffffffffffff7fff)
    la  x10, test_data
    addi    x10, x10,60
    li     x2, MASK_XLEN(-52)
    add    x10, x10, x2
    c.lw x9, 52(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffff7fff)

    # Testcase 16:  imm:0x14, result rd:x15(0xfffffffffffeffff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(-20)
    add    x13, x13, x2
    c.lw x15, 20(x13)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffeffff)

    # Testcase 17:  imm:0x4, result rd:x15(0xfffffffffffdffff)
    la  x11, test_data
    addi    x11, x11,68
    li     x2, MASK_XLEN(-4)
    add    x11, x11, x2
    c.lw x15, 4(x11)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffdffff)

    # Testcase 18:  imm:0x20, result rd:x13(0xfffffffffffbffff)
    la  x8, test_data
    addi    x8, x8,72
    li     x2, MASK_XLEN(-32)
    add    x8, x8, x2
    c.lw x13, 32(x8)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffbffff)

    # Testcase 19:  imm:0x6c, result rd:x12(0xfffffffffff7ffff)
    la  x11, test_data
    addi    x11, x11,76
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x12, 108(x11)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffff7ffff)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 20:  imm:0x30, result rd:x9(0xffffffffffefffff)
    la  x14, test_data
    addi    x14, x14,80
    li     x2, MASK_XLEN(-48)
    add    x14, x14, x2
    c.lw x9, 48(x14)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffefffff)

    # Testcase 21:  imm:0x54, result rd:x15(0xffffffffffdfffff)
    la  x12, test_data
    addi    x12, x12,84
    li     x2, MASK_XLEN(-84)
    add    x12, x12, x2
    c.lw x15, 84(x12)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffdfffff)

    # Testcase 22:  imm:0x10, result rd:x10(0xffffffffffbfffff)
    la  x12, test_data
    addi    x12, x12,88
    li     x2, MASK_XLEN(-16)
    add    x12, x12, x2
    c.lw x10, 16(x12)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffbfffff)

    # Testcase 23:  imm:0x18, result rd:x13(0xffffffffff7fffff)
    la  x14, test_data
    addi    x14, x14,92
    li     x2, MASK_XLEN(-24)
    add    x14, x14, x2
    c.lw x13, 24(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffff7fffff)

    # Testcase 24:  imm:0x30, result rd:x9(0xfffffffffeffffff)
    la  x14, test_data
    addi    x14, x14,96
    li     x2, MASK_XLEN(-48)
    add    x14, x14, x2
    c.lw x9, 48(x14)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 25:  imm:0x58, result rd:x11(0xfffffffffdffffff)
    la  x15, test_data
    addi    x15, x15,100
    li     x2, MASK_XLEN(-88)
    add    x15, x15, x2
    c.lw x11, 88(x15)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffdffffff)

    # Testcase 26:  imm:0x50, result rd:x13(0xfffffffffeffffff)
    la  x12, test_data
    addi    x12, x12,104
    li     x2, MASK_XLEN(-80)
    add    x12, x12, x2
    c.lw x13, 80(x12)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffeffffff)

    # Testcase 27:  imm:0x60, result rd:x14(0xfffffffff7ffffff)
    la  x9, test_data
    addi    x9, x9,108
    li     x2, MASK_XLEN(-96)
    add    x9, x9, x2
    c.lw x14, 96(x9)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffff7ffffff)

    # Testcase 28:  imm:0x70, result rd:x9(0xffffffffefffffff)
    la  x10, test_data
    addi    x10, x10,112
    li     x2, MASK_XLEN(-112)
    add    x10, x10, x2
    c.lw x9, 112(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffefffffff)

    # Testcase 29:  imm:0x48, result rd:x14(0xffffffffdfffffff)
    la  x8, test_data
    addi    x8, x8,116
    li     x2, MASK_XLEN(-72)
    add    x8, x8, x2
    c.lw x14, 72(x8)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x8(0xffffffffefffffff)
    la  x11, test_data
    addi    x11, x11,120
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.lw x8, 0(x11)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffefffffff)

    # Testcase 31:  imm:0x7c, result rd:x12(0x000000007fffffff)
    la  x11, test_data
    addi    x11, x11,124
    li     x2, MASK_XLEN(-124)
    add    x11, x11, x2
    c.lw x12, 124(x11)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x000000007fffffff)

    # Testcase 32:  imm:0x7c, result rd:x15(0xffffffffffffffff)
    la  x14, test_data
    addi    x14, x14,128
    li     x2, MASK_XLEN(-124)
    add    x14, x14, x2
    c.lw x15, 124(x14)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffffff)

    # Testcase 33:  imm:0x7c, result rd:x11(0x0000000000000001)
    la  x13, test_data
    addi    x13, x13,132
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    c.lw x11, 124(x13)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000001)

    # Testcase 34:  imm:0x0, result rd:x15(0x0000000000000002)
    la  x8, test_data
    addi    x8, x8,136
    li     x2, MASK_XLEN(0)
    add    x8, x8, x2
    c.lw x15, 0(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000002)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x7c, result rd:x8(0x0000000000000004)
    la  x12, test_data
    addi    x12, x12,140
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    c.lw x8, 124(x12)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000004)

    # Testcase 36:  imm:0x7c, result rd:x15(0x0000000000000008)
    la  x10, test_data
    addi    x10, x10,144
    li     x2, MASK_XLEN(-124)
    add    x10, x10, x2
    c.lw x15, 124(x10)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000008)

    # Testcase 37:  imm:0x7c, result rd:x8(0x0000000000000010)
    la  x13, test_data
    addi    x13, x13,148
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    c.lw x8, 124(x13)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000010)

    # Testcase 38:  imm:0x0, result rd:x13(0x0000000000000020)
    la  x11, test_data
    addi    x11, x11,152
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.lw x13, 0(x11)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000020)

    # Testcase 39:  imm:0x7c, result rd:x13(0x0000000000000040)
    la  x8, test_data
    addi    x8, x8,156
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    c.lw x13, 124(x8)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000040)





    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Testcase 40:  imm:0x4, result rd:x8(0x0000000000000080)
    la  x9, test_data
    addi    x9, x9,160
    li     x2, MASK_XLEN(-4)
    add    x9, x9, x2
    c.lw x8, 4(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000080)

    # Testcase 41:  imm:0x8, result rd:x9(0x0000000000000100)
    la  x10, test_data
    addi    x10, x10,164
    li     x2, MASK_XLEN(-8)
    add    x10, x10, x2
    c.lw x9, 8(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000100)

    # Testcase 42:  imm:0x10, result rd:x10(0x0000000000000200)
    la  x11, test_data
    addi    x11, x11,168
    li     x2, MASK_XLEN(-16)
    add    x11, x11, x2
    c.lw x10, 16(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000200)

    # Testcase 43:  imm:0x20, result rd:x11(0x0000000000000400)
    la  x12, test_data
    addi    x12, x12,172
    li     x2, MASK_XLEN(-32)
    add    x12, x12, x2
    c.lw x11, 32(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000400)

    # Testcase 44:  imm:0x40, result rd:x12(0x0000000000000800)
    la  x13, test_data
    addi    x13, x13,176
    li     x2, MASK_XLEN(-64)
    add    x13, x13, x2
    c.lw x12, 64(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000800)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x78, result rd:x13(0x0000000000001000)
    la  x14, test_data
    addi    x14, x14,180
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000001000)

    # Testcase 46:  imm:0x74, result rd:x14(0x0000000000002000)
    la  x15, test_data
    addi    x15, x15,184
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000002000)

    # Testcase 47:  imm:0x6c, result rd:x15(0x0000000000004000)
    la  x8, test_data
    addi    x8, x8,188
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000004000)

    # Testcase 48:  imm:0x5c, result rd:x8(0x0000000000008000)
    la  x9, test_data
    addi    x9, x9,192
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000008000)

    # Testcase 49:  imm:0x3c, result rd:x9(0x0000000000000001)
    la  x10, test_data
    addi    x10, x10,196
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000001)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x78, result rd:x10(0x0000000000000002)
    la  x11, test_data
    addi    x11, x11,200
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000002)

    # Testcase 51:  imm:0x74, result rd:x11(0x0000000000040000)
    la  x12, test_data
    addi    x12, x12,204
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000040000)

    # Testcase 52:  imm:0x6c, result rd:x12(0x0000000000080000)
    la  x13, test_data
    addi    x13, x13,208
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000080000)

    # Testcase 53:  imm:0x5c, result rd:x13(0x0000000000000010)
    la  x14, test_data
    addi    x14, x14,212
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000010)

    # Testcase 54:  imm:0x3c, result rd:x14(0x0000000000000020)
    la  x15, test_data
    addi    x15, x15,216
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000020)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x78, result rd:x15(0x0000000000400000)
    la  x8, test_data
    addi    x8, x8,220
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000400000)

    # Testcase 56:  imm:0x74, result rd:x8(0x0000000000800000)
    la  x9, test_data
    addi    x9, x9,224
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000800000)

    # Testcase 57:  imm:0x6c, result rd:x9(0x0000000000000100)
    la  x10, test_data
    addi    x10, x10,228
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000100)

    # Testcase 58:  imm:0x5c, result rd:x10(0x0000000000000200)
    la  x11, test_data
    addi    x11, x11,232
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000200)

    # Testcase 59:  imm:0x3c, result rd:x11(0x0000000004000000)
    la  x12, test_data
    addi    x12, x12,236
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000004000000)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x78, result rd:x12(0x0000000008000000)
    la  x13, test_data
    addi    x13, x13,240
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000008000000)

    # Testcase 61:  imm:0x74, result rd:x13(0x0000000000001000)
    la  x14, test_data
    addi    x14, x14,244
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000001000)

    # Testcase 62:  imm:0x6c, result rd:x14(0x0000000000002000)
    la  x15, test_data
    addi    x15, x15,248
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000002000)

    # Testcase 63:  imm:0x5c, result rd:x15(0x0000000040000000)
    la  x8, test_data
    addi    x8, x8,252
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000040000000)

    # Testcase 64:  imm:0x3c, result rd:x8(0xffffffff80000000)
    la  x9, test_data
    addi    x9, x9,256
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff80000000)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x78, result rd:x9(0x0000000000000000)
    la  x10, test_data
    addi    x10, x10,260
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000000)

    # Testcase 66:  imm:0x74, result rd:x10(0xfffffffffffffffe)
    la  x11, test_data
    addi    x11, x11,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffe)

    # Testcase 67:  imm:0x6c, result rd:x11(0xfffffffffffffffd)
    la  x12, test_data
    addi    x12, x12,4
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffffd)

    # Testcase 68:  imm:0x5c, result rd:x12(0xfffffffffffffffb)
    la  x13, test_data
    addi    x13, x13,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffffb)

    # Testcase 69:  imm:0x3c, result rd:x13(0xfffffffffffffff7)
    la  x14, test_data
    addi    x14, x14,12
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffff7)





    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Testcase 70:  imm:0x78, result rd:x14(0xffffffffffffffef)
    la  x15, test_data
    addi    x15, x15,16
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffffef)

    # Testcase 71:  imm:0x74, result rd:x15(0xffffffffffffffdf)
    la  x8, test_data
    addi    x8, x8,20
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffffdf)

    # Testcase 72:  imm:0x6c, result rd:x8(0xffffffffffffffbf)
    la  x9, test_data
    addi    x9, x9,24
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffffbf)

    # Testcase 73:  imm:0x5c, result rd:x9(0xffffffffffffff7f)
    la  x10, test_data
    addi    x10, x10,28
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffff7f)

    # Testcase 74:  imm:0x3c, result rd:x10(0xfffffffffffffeff)
    la  x11, test_data
    addi    x11, x11,32
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x78, result rd:x11(0xfffffffffffffdff)
    la  x12, test_data
    addi    x12, x12,36
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffdff)

    # Testcase 76:  imm:0x74, result rd:x12(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,40
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffeff)

    # Testcase 77:  imm:0x6c, result rd:x13(0xfffffffffffff7ff)
    la  x14, test_data
    addi    x14, x14,44
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffff7ff)

    # Testcase 78:  imm:0x5c, result rd:x14(0xffffffffffffefff)
    la  x15, test_data
    addi    x15, x15,48
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffefff)

    # Testcase 79:  imm:0x3c, result rd:x15(0xffffffffffffdfff)
    la  x8, test_data
    addi    x8, x8,52
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffdfff)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x78, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,56
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)

    # Testcase 81:  imm:0x74, result rd:x9(0xffffffffffff7fff)
    la  x10, test_data
    addi    x10, x10,60
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffff7fff)

    # Testcase 82:  imm:0x6c, result rd:x10(0xfffffffffffeffff)
    la  x11, test_data
    addi    x11, x11,64
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffeffff)

    # Testcase 83:  imm:0x5c, result rd:x11(0xfffffffffffdffff)
    la  x12, test_data
    addi    x12, x12,68
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffdffff)

    # Testcase 84:  imm:0x3c, result rd:x12(0xfffffffffffbffff)
    la  x13, test_data
    addi    x13, x13,72
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffbffff)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x78, result rd:x13(0xfffffffffff7ffff)
    la  x14, test_data
    addi    x14, x14,76
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffff7ffff)

    # Testcase 86:  imm:0x74, result rd:x14(0xffffffffffefffff)
    la  x15, test_data
    addi    x15, x15,80
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffefffff)

    # Testcase 87:  imm:0x6c, result rd:x15(0xffffffffffdfffff)
    la  x8, test_data
    addi    x8, x8,84
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffdfffff)

    # Testcase 88:  imm:0x5c, result rd:x8(0xffffffffffbfffff)
    la  x9, test_data
    addi    x9, x9,88
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffbfffff)

    # Testcase 89:  imm:0x3c, result rd:x9(0xffffffffff7fffff)
    la  x10, test_data
    addi    x10, x10,92
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffff7fffff)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x78, result rd:x10(0xfffffffffeffffff)
    la  x11, test_data
    addi    x11, x11,96
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffeffffff)

    # Testcase 91:  imm:0x74, result rd:x11(0xfffffffffdffffff)
    la  x12, test_data
    addi    x12, x12,100
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffdffffff)

    # Testcase 92:  imm:0x6c, result rd:x12(0xfffffffffeffffff)
    la  x13, test_data
    addi    x13, x13,104
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffeffffff)

    # Testcase 93:  imm:0x5c, result rd:x13(0xfffffffff7ffffff)
    la  x14, test_data
    addi    x14, x14,108
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffff7ffffff)

    # Testcase 94:  imm:0x3c, result rd:x14(0xffffffffefffffff)
    la  x15, test_data
    addi    x15, x15,112
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x78, result rd:x15(0xffffffffdfffffff)
    la  x8, test_data
    addi    x8, x8,116
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffdfffffff)

    # Testcase 96:  imm:0x74, result rd:x8(0xffffffffefffffff)
    la  x9, test_data
    addi    x9, x9,120
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffefffffff)

    # Testcase 97:  imm:0x6c, result rd:x9(0x000000007fffffff)
    la  x10, test_data
    addi    x10, x10,124
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x000000007fffffff)

    # Testcase 98:  imm:0x5c, result rd:x10(0xffffffffffffffff)
    la  x11, test_data
    addi    x11, x11,128
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffff)

    # Testcase 99:  imm:0x3c, result rd:x11(0x0000000000000001)
    la  x12, test_data
    addi    x12, x12,132
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000001)





    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Testcase 100:  imm:0x78, result rd:x12(0x0000000000000002)
    la  x13, test_data
    addi    x13, x13,136
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000002)

    # Testcase 101:  imm:0x74, result rd:x13(0x0000000000000004)
    la  x14, test_data
    addi    x14, x14,140
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000004)

    # Testcase 102:  imm:0x6c, result rd:x14(0x0000000000000008)
    la  x15, test_data
    addi    x15, x15,144
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000008)

    # Testcase 103:  imm:0x5c, result rd:x15(0x0000000000000010)
    la  x8, test_data
    addi    x8, x8,148
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000010)

    # Testcase 104:  imm:0x3c, result rd:x8(0x0000000000000020)
    la  x9, test_data
    addi    x9, x9,152
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000020)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x78, result rd:x9(0x0000000000000040)
    la  x10, test_data
    addi    x10, x10,156
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000040)

    # Testcase 106:  imm:0x74, result rd:x10(0x0000000000000080)
    la  x11, test_data
    addi    x11, x11,160
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000080)

    # Testcase 107:  imm:0x6c, result rd:x11(0x0000000000000100)
    la  x12, test_data
    addi    x12, x12,164
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000100)

    # Testcase 108:  imm:0x5c, result rd:x12(0x0000000000000200)
    la  x13, test_data
    addi    x13, x13,168
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000200)

    # Testcase 109:  imm:0x3c, result rd:x13(0x0000000000000400)
    la  x14, test_data
    addi    x14, x14,172
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000400)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x78, result rd:x14(0x0000000000000800)
    la  x15, test_data
    addi    x15, x15,176
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000800)

    # Testcase 111:  imm:0x74, result rd:x15(0x0000000000001000)
    la  x8, test_data
    addi    x8, x8,180
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000001000)

    # Testcase 112:  imm:0x6c, result rd:x8(0x0000000000002000)
    la  x9, test_data
    addi    x9, x9,184
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000002000)

    # Testcase 113:  imm:0x5c, result rd:x9(0x0000000000004000)
    la  x10, test_data
    addi    x10, x10,188
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000004000)

    # Testcase 114:  imm:0x3c, result rd:x10(0x0000000000008000)
    la  x11, test_data
    addi    x11, x11,192
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000008000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x78, result rd:x11(0x0000000000000001)
    la  x12, test_data
    addi    x12, x12,196
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000001)

    # Testcase 116:  imm:0x74, result rd:x12(0x0000000000000002)
    la  x13, test_data
    addi    x13, x13,200
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000002)

    # Testcase 117:  imm:0x6c, result rd:x13(0x0000000000040000)
    la  x14, test_data
    addi    x14, x14,204
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000040000)

    # Testcase 118:  imm:0x5c, result rd:x14(0x0000000000080000)
    la  x15, test_data
    addi    x15, x15,208
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000080000)

    # Testcase 119:  imm:0x3c, result rd:x15(0x0000000000000010)
    la  x8, test_data
    addi    x8, x8,212
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000010)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x78, result rd:x8(0x0000000000000020)
    la  x9, test_data
    addi    x9, x9,216
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000020)

    # Testcase 121:  imm:0x74, result rd:x9(0x0000000000400000)
    la  x10, test_data
    addi    x10, x10,220
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000400000)

    # Testcase 122:  imm:0x6c, result rd:x10(0x0000000000800000)
    la  x11, test_data
    addi    x11, x11,224
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000800000)

    # Testcase 123:  imm:0x5c, result rd:x11(0x0000000000000100)
    la  x12, test_data
    addi    x12, x12,228
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000100)

    # Testcase 124:  imm:0x3c, result rd:x12(0x0000000000000200)
    la  x13, test_data
    addi    x13, x13,232
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000200)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x78, result rd:x13(0x0000000004000000)
    la  x14, test_data
    addi    x14, x14,236
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000004000000)

    # Testcase 126:  imm:0x74, result rd:x14(0x0000000008000000)
    la  x15, test_data
    addi    x15, x15,240
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000008000000)

    # Testcase 127:  imm:0x6c, result rd:x15(0x0000000000001000)
    la  x8, test_data
    addi    x8, x8,244
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000001000)

    # Testcase 128:  imm:0x5c, result rd:x8(0x0000000000002000)
    la  x9, test_data
    addi    x9, x9,248
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000002000)

    # Testcase 129:  imm:0x3c, result rd:x9(0x0000000040000000)
    la  x10, test_data
    addi    x10, x10,252
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000040000000)





    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 130:  imm:0x78, result rd:x10(0xffffffff80000000)
    la  x11, test_data
    addi    x11, x11,256
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffff80000000)

    # Testcase 131:  imm:0x74, result rd:x11(0x0000000000000000)
    la  x12, test_data
    addi    x12, x12,260
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000000)

    # Testcase 132:  imm:0x6c, result rd:x12(0xfffffffffffffffe)
    la  x13, test_data
    addi    x13, x13,0
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffffe)

    # Testcase 133:  imm:0x5c, result rd:x13(0xfffffffffffffffd)
    la  x14, test_data
    addi    x14, x14,4
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffffd)

    # Testcase 134:  imm:0x3c, result rd:x14(0xfffffffffffffffb)
    la  x15, test_data
    addi    x15, x15,8
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x78, result rd:x15(0xfffffffffffffff7)
    la  x8, test_data
    addi    x8, x8,12
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffff7)

    # Testcase 136:  imm:0x74, result rd:x8(0xffffffffffffffef)
    la  x9, test_data
    addi    x9, x9,16
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffffef)

    # Testcase 137:  imm:0x6c, result rd:x9(0xffffffffffffffdf)
    la  x10, test_data
    addi    x10, x10,20
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffffdf)

    # Testcase 138:  imm:0x5c, result rd:x10(0xffffffffffffffbf)
    la  x11, test_data
    addi    x11, x11,24
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffbf)

    # Testcase 139:  imm:0x3c, result rd:x11(0xffffffffffffff7f)
    la  x12, test_data
    addi    x12, x12,28
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x78, result rd:x12(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,32
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffeff)

    # Testcase 141:  imm:0x74, result rd:x13(0xfffffffffffffdff)
    la  x14, test_data
    addi    x14, x14,36
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffdff)

    # Testcase 142:  imm:0x6c, result rd:x14(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,40
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffeff)

    # Testcase 143:  imm:0x5c, result rd:x15(0xfffffffffffff7ff)
    la  x8, test_data
    addi    x8, x8,44
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffff7ff)

    # Testcase 144:  imm:0x3c, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x78, result rd:x9(0xffffffffffffdfff)
    la  x10, test_data
    addi    x10, x10,52
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffdfff)

    # Testcase 146:  imm:0x74, result rd:x10(0xffffffffffffefff)
    la  x11, test_data
    addi    x11, x11,56
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffefff)

    # Testcase 147:  imm:0x6c, result rd:x11(0xffffffffffff7fff)
    la  x12, test_data
    addi    x12, x12,60
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffff7fff)

    # Testcase 148:  imm:0x5c, result rd:x12(0xfffffffffffeffff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffeffff)

    # Testcase 149:  imm:0x3c, result rd:x13(0xfffffffffffdffff)
    la  x14, test_data
    addi    x14, x14,68
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x78, result rd:x14(0xfffffffffffbffff)
    la  x15, test_data
    addi    x15, x15,72
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffbffff)

    # Testcase 151:  imm:0x74, result rd:x15(0xfffffffffff7ffff)
    la  x8, test_data
    addi    x8, x8,76
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffff7ffff)

    # Testcase 152:  imm:0x6c, result rd:x8(0xffffffffffefffff)
    la  x9, test_data
    addi    x9, x9,80
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffefffff)

    # Testcase 153:  imm:0x5c, result rd:x9(0xffffffffffdfffff)
    la  x10, test_data
    addi    x10, x10,84
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffdfffff)

    # Testcase 154:  imm:0x3c, result rd:x10(0xffffffffffbfffff)
    la  x11, test_data
    addi    x11, x11,88
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x78, result rd:x11(0xffffffffff7fffff)
    la  x12, test_data
    addi    x12, x12,92
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffff7fffff)

    # Testcase 156:  imm:0x74, result rd:x12(0xfffffffffeffffff)
    la  x13, test_data
    addi    x13, x13,96
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffeffffff)

    # Testcase 157:  imm:0x6c, result rd:x13(0xfffffffffdffffff)
    la  x14, test_data
    addi    x14, x14,100
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffdffffff)

    # Testcase 158:  imm:0x5c, result rd:x14(0xfffffffffeffffff)
    la  x15, test_data
    addi    x15, x15,104
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffeffffff)

    # Testcase 159:  imm:0x3c, result rd:x15(0xfffffffff7ffffff)
    la  x8, test_data
    addi    x8, x8,108
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffff7ffffff)





    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 160:  imm:0x78, result rd:x8(0xffffffffefffffff)
    la  x9, test_data
    addi    x9, x9,112
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffefffffff)

    # Testcase 161:  imm:0x74, result rd:x9(0xffffffffdfffffff)
    la  x10, test_data
    addi    x10, x10,116
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffdfffffff)

    # Testcase 162:  imm:0x6c, result rd:x10(0xffffffffefffffff)
    la  x11, test_data
    addi    x11, x11,120
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffefffffff)

    # Testcase 163:  imm:0x5c, result rd:x11(0x000000007fffffff)
    la  x12, test_data
    addi    x12, x12,124
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x000000007fffffff)

    # Testcase 164:  imm:0x3c, result rd:x12(0xffffffffffffffff)
    la  x13, test_data
    addi    x13, x13,128
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x78, result rd:x13(0x0000000000000001)
    la  x14, test_data
    addi    x14, x14,132
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000001)

    # Testcase 166:  imm:0x74, result rd:x14(0x0000000000000002)
    la  x15, test_data
    addi    x15, x15,136
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000002)

    # Testcase 167:  imm:0x6c, result rd:x15(0x0000000000000004)
    la  x8, test_data
    addi    x8, x8,140
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000004)

    # Testcase 168:  imm:0x4, result rd:x8(0x0000000000000008)
    la  x9, test_data
    addi    x9, x9,144
    li     x2, MASK_XLEN(-4)
    add    x9, x9, x2
    c.lw x8, 4(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000008)

    # Testcase 169:  imm:0x8, result rd:x9(0x0000000000000010)
    la  x10, test_data
    addi    x10, x10,148
    li     x2, MASK_XLEN(-8)
    add    x10, x10, x2
    c.lw x9, 8(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000010)





    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x10, result rd:x10(0x0000000000000020)
    la  x11, test_data
    addi    x11, x11,152
    li     x2, MASK_XLEN(-16)
    add    x11, x11, x2
    c.lw x10, 16(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000020)

    # Testcase 171:  imm:0x20, result rd:x11(0x0000000000000040)
    la  x12, test_data
    addi    x12, x12,156
    li     x2, MASK_XLEN(-32)
    add    x12, x12, x2
    c.lw x11, 32(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000040)

    # Testcase 172:  imm:0x40, result rd:x12(0x0000000000000080)
    la  x13, test_data
    addi    x13, x13,160
    li     x2, MASK_XLEN(-64)
    add    x13, x13, x2
    c.lw x12, 64(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000080)

    # Testcase 173:  imm:0x78, result rd:x13(0x0000000000000100)
    la  x14, test_data
    addi    x14, x14,164
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000100)

    # Testcase 174:  imm:0x74, result rd:x14(0x0000000000000200)
    la  x15, test_data
    addi    x15, x15,168
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000200)





    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0x6c, result rd:x15(0x0000000000000400)
    la  x8, test_data
    addi    x8, x8,172
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000400)

    # Testcase 176:  imm:0x5c, result rd:x8(0x0000000000000800)
    la  x9, test_data
    addi    x9, x9,176
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000800)

    # Testcase 177:  imm:0x3c, result rd:x9(0x0000000000001000)
    la  x10, test_data
    addi    x10, x10,180
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000001000)

    # Testcase 178:  imm:0x78, result rd:x10(0x0000000000002000)
    la  x11, test_data
    addi    x11, x11,184
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000002000)

    # Testcase 179:  imm:0x74, result rd:x11(0x0000000000004000)
    la  x12, test_data
    addi    x12, x12,188
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000004000)





    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0x6c, result rd:x12(0x0000000000008000)
    la  x13, test_data
    addi    x13, x13,192
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000008000)

    # Testcase 181:  imm:0x5c, result rd:x13(0x0000000000000001)
    la  x14, test_data
    addi    x14, x14,196
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000001)

    # Testcase 182:  imm:0x3c, result rd:x14(0x0000000000000002)
    la  x15, test_data
    addi    x15, x15,200
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000002)

    # Testcase 183:  imm:0x78, result rd:x15(0x0000000000040000)
    la  x8, test_data
    addi    x8, x8,204
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000040000)

    # Testcase 184:  imm:0x74, result rd:x8(0x0000000000080000)
    la  x9, test_data
    addi    x9, x9,208
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000080000)





    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0x6c, result rd:x9(0x0000000000000010)
    la  x10, test_data
    addi    x10, x10,212
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000010)

    # Testcase 186:  imm:0x5c, result rd:x10(0x0000000000000020)
    la  x11, test_data
    addi    x11, x11,216
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000020)

    # Testcase 187:  imm:0x3c, result rd:x11(0x0000000000400000)
    la  x12, test_data
    addi    x12, x12,220
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000400000)

    # Testcase 188:  imm:0x78, result rd:x12(0x0000000000800000)
    la  x13, test_data
    addi    x13, x13,224
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000800000)

    # Testcase 189:  imm:0x74, result rd:x13(0x0000000000000100)
    la  x14, test_data
    addi    x14, x14,228
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0x6c, result rd:x14(0x0000000000000200)
    la  x15, test_data
    addi    x15, x15,232
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000200)

    # Testcase 191:  imm:0x5c, result rd:x15(0x0000000004000000)
    la  x8, test_data
    addi    x8, x8,236
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000004000000)

    # Testcase 192:  imm:0x3c, result rd:x8(0x0000000008000000)
    la  x9, test_data
    addi    x9, x9,240
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000008000000)

    # Testcase 193:  imm:0x78, result rd:x9(0x0000000000001000)
    la  x10, test_data
    addi    x10, x10,244
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000001000)

    # Testcase 194:  imm:0x74, result rd:x10(0x0000000000002000)
    la  x11, test_data
    addi    x11, x11,248
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000002000)





    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Testcase 195:  imm:0x6c, result rd:x11(0x0000000040000000)
    la  x12, test_data
    addi    x12, x12,252
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000040000000)

    # Testcase 196:  imm:0x5c, result rd:x12(0xffffffff80000000)
    la  x13, test_data
    addi    x13, x13,256
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffff80000000)

    # Testcase 197:  imm:0x3c, result rd:x13(0x0000000000000000)
    la  x14, test_data
    addi    x14, x14,260
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000000)

    # Testcase 198:  imm:0x78, result rd:x14(0xfffffffffffffffe)
    la  x15, test_data
    addi    x15, x15,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffe)

    # Testcase 199:  imm:0x74, result rd:x15(0xfffffffffffffffd)
    la  x8, test_data
    addi    x8, x8,4
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffffd)





    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 200:  imm:0x6c, result rd:x8(0xfffffffffffffffb)
    la  x9, test_data
    addi    x9, x9,8
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffffb)

    # Testcase 201:  imm:0x5c, result rd:x9(0xfffffffffffffff7)
    la  x10, test_data
    addi    x10, x10,12
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffff7)

    # Testcase 202:  imm:0x3c, result rd:x10(0xffffffffffffffef)
    la  x11, test_data
    addi    x11, x11,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffef)

    # Testcase 203:  imm:0x78, result rd:x11(0xffffffffffffffdf)
    la  x12, test_data
    addi    x12, x12,20
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffffdf)

    # Testcase 204:  imm:0x74, result rd:x12(0xffffffffffffffbf)
    la  x13, test_data
    addi    x13, x13,24
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffbf)





    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0x6c, result rd:x13(0xffffffffffffff7f)
    la  x14, test_data
    addi    x14, x14,28
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffff7f)

    # Testcase 206:  imm:0x5c, result rd:x14(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,32
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffeff)

    # Testcase 207:  imm:0x3c, result rd:x15(0xfffffffffffffdff)
    la  x8, test_data
    addi    x8, x8,36
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffdff)

    # Testcase 208:  imm:0x78, result rd:x8(0xfffffffffffffeff)
    la  x9, test_data
    addi    x9, x9,40
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffeff)

    # Testcase 209:  imm:0x74, result rd:x9(0xfffffffffffff7ff)
    la  x10, test_data
    addi    x10, x10,44
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffff7ff)





    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0x6c, result rd:x10(0xffffffffffffefff)
    la  x11, test_data
    addi    x11, x11,48
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffefff)

    # Testcase 211:  imm:0x5c, result rd:x11(0xffffffffffffdfff)
    la  x12, test_data
    addi    x12, x12,52
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffdfff)

    # Testcase 212:  imm:0x3c, result rd:x12(0xffffffffffffefff)
    la  x13, test_data
    addi    x13, x13,56
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffefff)

    # Testcase 213:  imm:0x78, result rd:x13(0xffffffffffff7fff)
    la  x14, test_data
    addi    x14, x14,60
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffff7fff)

    # Testcase 214:  imm:0x74, result rd:x14(0xfffffffffffeffff)
    la  x15, test_data
    addi    x15, x15,64
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffeffff)





    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0x6c, result rd:x15(0xfffffffffffdffff)
    la  x8, test_data
    addi    x8, x8,68
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffdffff)

    # Testcase 216:  imm:0x5c, result rd:x8(0xfffffffffffbffff)
    la  x9, test_data
    addi    x9, x9,72
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffbffff)

    # Testcase 217:  imm:0x3c, result rd:x9(0xfffffffffff7ffff)
    la  x10, test_data
    addi    x10, x10,76
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffff7ffff)

    # Testcase 218:  imm:0x78, result rd:x10(0xffffffffffefffff)
    la  x11, test_data
    addi    x11, x11,80
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffefffff)

    # Testcase 219:  imm:0x74, result rd:x11(0xffffffffffdfffff)
    la  x12, test_data
    addi    x12, x12,84
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffdfffff)





    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0x6c, result rd:x12(0xffffffffffbfffff)
    la  x13, test_data
    addi    x13, x13,88
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffbfffff)

    # Testcase 221:  imm:0x5c, result rd:x13(0xffffffffff7fffff)
    la  x14, test_data
    addi    x14, x14,92
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffff7fffff)

    # Testcase 222:  imm:0x3c, result rd:x14(0xfffffffffeffffff)
    la  x15, test_data
    addi    x15, x15,96
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffeffffff)

    # Testcase 223:  imm:0x78, result rd:x15(0xfffffffffdffffff)
    la  x8, test_data
    addi    x8, x8,100
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffdffffff)

    # Testcase 224:  imm:0x74, result rd:x8(0xfffffffffeffffff)
    la  x9, test_data
    addi    x9, x9,104
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Testcase 225:  imm:0x6c, result rd:x9(0xfffffffff7ffffff)
    la  x10, test_data
    addi    x10, x10,108
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffff7ffffff)

    # Testcase 226:  imm:0x5c, result rd:x10(0xffffffffefffffff)
    la  x11, test_data
    addi    x11, x11,112
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffefffffff)

    # Testcase 227:  imm:0x3c, result rd:x11(0xffffffffdfffffff)
    la  x12, test_data
    addi    x12, x12,116
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffdfffffff)

    # Testcase 228:  imm:0x78, result rd:x12(0xffffffffefffffff)
    la  x13, test_data
    addi    x13, x13,120
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffefffffff)

    # Testcase 229:  imm:0x74, result rd:x13(0x000000007fffffff)
    la  x14, test_data
    addi    x14, x14,124
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x000000007fffffff)





    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 230:  imm:0x6c, result rd:x14(0xffffffffffffffff)
    la  x15, test_data
    addi    x15, x15,128
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffffff)

    # Testcase 231:  imm:0x5c, result rd:x15(0x0000000000000001)
    la  x8, test_data
    addi    x8, x8,132
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000001)

    # Testcase 232:  imm:0x3c, result rd:x8(0x0000000000000002)
    la  x9, test_data
    addi    x9, x9,136
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000002)

    # Testcase 233:  imm:0x78, result rd:x9(0x0000000000000004)
    la  x10, test_data
    addi    x10, x10,140
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000004)

    # Testcase 234:  imm:0x74, result rd:x10(0x0000000000000008)
    la  x11, test_data
    addi    x11, x11,144
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000008)





    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0x6c, result rd:x11(0x0000000000000010)
    la  x12, test_data
    addi    x12, x12,148
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000010)

    # Testcase 236:  imm:0x5c, result rd:x12(0x0000000000000020)
    la  x13, test_data
    addi    x13, x13,152
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000020)

    # Testcase 237:  imm:0x3c, result rd:x13(0x0000000000000040)
    la  x14, test_data
    addi    x14, x14,156
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000040)

    # Testcase 238:  imm:0x78, result rd:x14(0x0000000000000080)
    la  x15, test_data
    addi    x15, x15,160
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000080)

    # Testcase 239:  imm:0x74, result rd:x15(0x0000000000000100)
    la  x8, test_data
    addi    x8, x8,164
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0x6c, result rd:x8(0x0000000000000200)
    la  x9, test_data
    addi    x9, x9,168
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000200)

    # Testcase 241:  imm:0x5c, result rd:x9(0x0000000000000400)
    la  x10, test_data
    addi    x10, x10,172
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000400)

    # Testcase 242:  imm:0x3c, result rd:x10(0x0000000000000800)
    la  x11, test_data
    addi    x11, x11,176
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000800)

    # Testcase 243:  imm:0x78, result rd:x11(0x0000000000001000)
    la  x12, test_data
    addi    x12, x12,180
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000001000)

    # Testcase 244:  imm:0x74, result rd:x12(0x0000000000002000)
    la  x13, test_data
    addi    x13, x13,184
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000002000)





    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0x6c, result rd:x13(0x0000000000004000)
    la  x14, test_data
    addi    x14, x14,188
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000004000)

    # Testcase 246:  imm:0x5c, result rd:x14(0x0000000000008000)
    la  x15, test_data
    addi    x15, x15,192
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000008000)

    # Testcase 247:  imm:0x3c, result rd:x15(0x0000000000000001)
    la  x8, test_data
    addi    x8, x8,196
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000001)

    # Testcase 248:  imm:0x78, result rd:x8(0x0000000000000002)
    la  x9, test_data
    addi    x9, x9,200
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000002)

    # Testcase 249:  imm:0x74, result rd:x9(0x0000000000040000)
    la  x10, test_data
    addi    x10, x10,204
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000040000)





    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0x6c, result rd:x10(0x0000000000080000)
    la  x11, test_data
    addi    x11, x11,208
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000080000)

    # Testcase 251:  imm:0x5c, result rd:x11(0x0000000000000010)
    la  x12, test_data
    addi    x12, x12,212
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000010)

    # Testcase 252:  imm:0x3c, result rd:x12(0x0000000000000020)
    la  x13, test_data
    addi    x13, x13,216
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000020)

    # Testcase 253:  imm:0x78, result rd:x13(0x0000000000400000)
    la  x14, test_data
    addi    x14, x14,220
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000400000)

    # Testcase 254:  imm:0x74, result rd:x14(0x0000000000800000)
    la  x15, test_data
    addi    x15, x15,224
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000800000)





    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 255:  imm:0x6c, result rd:x15(0x0000000000000100)
    la  x8, test_data
    addi    x8, x8,228
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000100)

    # Testcase 256:  imm:0x5c, result rd:x8(0x0000000000000200)
    la  x9, test_data
    addi    x9, x9,232
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    c.lw x8, 92(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000200)

    # Testcase 257:  imm:0x3c, result rd:x9(0x0000000004000000)
    la  x10, test_data
    addi    x10, x10,236
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    c.lw x9, 60(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000004000000)

    # Testcase 258:  imm:0x78, result rd:x10(0x0000000008000000)
    la  x11, test_data
    addi    x11, x11,240
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.lw x10, 120(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000008000000)

    # Testcase 259:  imm:0x74, result rd:x11(0x0000000000001000)
    la  x12, test_data
    addi    x12, x12,244
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    c.lw x11, 116(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000001000)





    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 260:  imm:0x6c, result rd:x12(0x0000000000002000)
    la  x13, test_data
    addi    x13, x13,248
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    c.lw x12, 108(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000002000)

    # Testcase 261:  imm:0x5c, result rd:x13(0x0000000040000000)
    la  x14, test_data
    addi    x14, x14,252
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    c.lw x13, 92(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000040000000)

    # Testcase 262:  imm:0x3c, result rd:x14(0xffffffff80000000)
    la  x15, test_data
    addi    x15, x15,256
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    c.lw x14, 60(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffff80000000)

    # Testcase 263:  imm:0x78, result rd:x15(0x0000000000000000)
    la  x8, test_data
    addi    x8, x8,260
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.lw x15, 120(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000000)

    # Testcase 264:  imm:0x74, result rd:x8(0xfffffffffffffffe)
    la  x9, test_data
    addi    x9, x9,0
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    c.lw x8, 116(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffffe)





    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 265:  imm:0x6c, result rd:x9(0xfffffffffffffffd)
    la  x10, test_data
    addi    x10, x10,4
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    c.lw x9, 108(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffffd)

    # Testcase 266:  imm:0x5c, result rd:x10(0xfffffffffffffffb)
    la  x11, test_data
    addi    x11, x11,8
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    c.lw x10, 92(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffb)

    # Testcase 267:  imm:0x3c, result rd:x11(0xfffffffffffffff7)
    la  x12, test_data
    addi    x12, x12,12
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    c.lw x11, 60(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffff7)

    # Testcase 268:  imm:0x78, result rd:x12(0xffffffffffffffef)
    la  x13, test_data
    addi    x13, x13,16
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.lw x12, 120(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffef)

    # Testcase 269:  imm:0x74, result rd:x13(0xffffffffffffffdf)
    la  x14, test_data
    addi    x14, x14,20
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    c.lw x13, 116(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffdf)





    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0x6c, result rd:x14(0xffffffffffffffbf)
    la  x15, test_data
    addi    x15, x15,24
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    c.lw x14, 108(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffffbf)

    # Testcase 271:  imm:0x5c, result rd:x15(0xffffffffffffff7f)
    la  x8, test_data
    addi    x8, x8,28
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    c.lw x15, 92(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffff7f)

    # Testcase 272:  imm:0x3c, result rd:x8(0xfffffffffffffeff)
    la  x9, test_data
    addi    x9, x9,32
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    c.lw x8, 60(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffeff)

    # Testcase 273:  imm:0x78, result rd:x9(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,36
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.lw x9, 120(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)

    # Testcase 274:  imm:0x74, result rd:x10(0xfffffffffffffeff)
    la  x11, test_data
    addi    x11, x11,40
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    c.lw x10, 116(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0x6c, result rd:x11(0xfffffffffffff7ff)
    la  x12, test_data
    addi    x12, x12,44
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    c.lw x11, 108(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffff7ff)

    # Testcase 276:  imm:0x5c, result rd:x12(0xffffffffffffefff)
    la  x13, test_data
    addi    x13, x13,48
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    c.lw x12, 92(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffefff)

    # Testcase 277:  imm:0x3c, result rd:x13(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,52
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    c.lw x13, 60(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffdfff)

    # Testcase 278:  imm:0x78, result rd:x14(0xffffffffffffefff)
    la  x15, test_data
    addi    x15, x15,56
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.lw x14, 120(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffefff)

    # Testcase 279:  imm:0x74, result rd:x15(0xffffffffffff7fff)
    la  x8, test_data
    addi    x8, x8,60
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    c.lw x15, 116(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffff7fff)





    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0x6c, result rd:x8(0xfffffffffffeffff)
    la  x9, test_data
    addi    x9, x9,64
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    c.lw x8, 108(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffeffff)

    # Testcase 281:  imm:0x5c, result rd:x9(0xfffffffffffdffff)
    la  x10, test_data
    addi    x10, x10,68
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    c.lw x9, 92(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffdffff)

    # Testcase 282:  imm:0x3c, result rd:x10(0xfffffffffffbffff)
    la  x11, test_data
    addi    x11, x11,72
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    c.lw x10, 60(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffbffff)

    # Testcase 283:  imm:0x78, result rd:x11(0xfffffffffff7ffff)
    la  x12, test_data
    addi    x12, x12,76
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.lw x11, 120(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffff7ffff)

    # Testcase 284:  imm:0x74, result rd:x12(0xffffffffffefffff)
    la  x13, test_data
    addi    x13, x13,80
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    c.lw x12, 116(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffefffff)





    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 285:  imm:0x6c, result rd:x13(0xffffffffffdfffff)
    la  x14, test_data
    addi    x14, x14,84
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    c.lw x13, 108(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffdfffff)

    # Testcase 286:  imm:0x5c, result rd:x14(0xffffffffffbfffff)
    la  x15, test_data
    addi    x15, x15,88
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    c.lw x14, 92(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffbfffff)

    # Testcase 287:  imm:0x3c, result rd:x15(0xffffffffff7fffff)
    la  x8, test_data
    addi    x8, x8,92
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    c.lw x15, 60(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffff7fffff)

    # Testcase 288:  imm:0x78, result rd:x8(0xfffffffffeffffff)
    la  x9, test_data
    addi    x9, x9,96
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.lw x8, 120(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffeffffff)

    # Testcase 289:  imm:0x74, result rd:x9(0xfffffffffdffffff)
    la  x10, test_data
    addi    x10, x10,100
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    c.lw x9, 116(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffdffffff)





    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0x6c, result rd:x10(0xfffffffffeffffff)
    la  x11, test_data
    addi    x11, x11,104
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    c.lw x10, 108(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffeffffff)

    # Testcase 291:  imm:0x5c, result rd:x11(0xfffffffff7ffffff)
    la  x12, test_data
    addi    x12, x12,108
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    c.lw x11, 92(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffff7ffffff)

    # Testcase 292:  imm:0x3c, result rd:x12(0xffffffffefffffff)
    la  x13, test_data
    addi    x13, x13,112
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    c.lw x12, 60(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffefffffff)

    # Testcase 293:  imm:0x78, result rd:x13(0xffffffffdfffffff)
    la  x14, test_data
    addi    x14, x14,116
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.lw x13, 120(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffdfffffff)

    # Testcase 294:  imm:0x74, result rd:x14(0xffffffffefffffff)
    la  x15, test_data
    addi    x15, x15,120
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    c.lw x14, 116(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 295:  imm:0x6c, result rd:x15(0x000000007fffffff)
    la  x8, test_data
    addi    x8, x8,124
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    c.lw x15, 108(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x000000007fffffff)


	
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

