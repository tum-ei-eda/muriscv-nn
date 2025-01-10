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
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.lwsp)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.lwsp)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x1c, result rd:x20(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-28)
    add    x2, x2, x3
    c.lwsp x20, 28(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffffffffffffffe)

    # Testcase 1:  imm:0x44, result rd:x29(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(-68)
    add    x2, x2, x3
    c.lwsp x29, 68(x2)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffffffffffd)

    # Testcase 2:  imm:0x14, result rd:x31(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-20)
    add    x2, x2, x3
    c.lwsp x31, 20(x2)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffffffffffb)

    # Testcase 3:  imm:0x10, result rd:x21(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-16)
    add    x2, x2, x3
    c.lwsp x21, 16(x2)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfffffffffffffff7)

    # Testcase 4:  imm:0x78, result rd:x11(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x11, 120(x2)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffffffffffffffef)





    

    RVTEST_SIGBASE(x3,signature_2_0)

    # Testcase 5:  imm:0x7c, result rd:x4(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x5, MASK_XLEN(-124)
    add    x2, x2, x5
    c.lwsp x4, 124(x2)
    sd x4, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffffffffffdf)

    # Testcase 6:  imm:0x1c, result rd:x1(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x5, MASK_XLEN(-28)
    add    x2, x2, x5
    c.lwsp x1, 28(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x44, result rd:x30(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x5, MASK_XLEN(-68)
    add    x2, x2, x5
    c.lwsp x30, 68(x2)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x30, 0xffffffffffffff7f)

    # Testcase 8:  imm:0x50, result rd:x6(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x5, MASK_XLEN(-80)
    add    x2, x2, x5
    c.lwsp x6, 80(x2)
    sd x6, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xfffffffffffffeff)

    # Testcase 9:  imm:0x0, result rd:x14(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x5, MASK_XLEN(0)
    add    x2, x2, x5
    c.lwsp x14, 0(x2)
    sd x14, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x14, 0xfffffffffffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0x78, result rd:x5(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    c.lwsp x5, 120(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x5, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x38, result rd:x12(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x4, MASK_XLEN(-56)
    add    x2, x2, x4
    c.lwsp x12, 56(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x12, 0xfffffffffffff7ff)

    # Testcase 12:  imm:0x40, result rd:x26(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x4, MASK_XLEN(-64)
    add    x2, x2, x4
    c.lwsp x26, 64(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x26, 0xffffffffffffefff)

    # Testcase 13:  imm:0x44, result rd:x3(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x4, MASK_XLEN(-68)
    add    x2, x2, x4
    c.lwsp x3, 68(x2)
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffffffffffdfff)

    # Testcase 14:  imm:0x60, result rd:x19(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.lwsp x19, 96(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x19, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x3,signature_4_0)

    # Testcase 15:  imm:0x34, result rd:x19(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x4, MASK_XLEN(-52)
    add    x2, x2, x4
    c.lwsp x19, 52(x2)
    sd x19, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0xffffffffffff7fff)

    # Testcase 16:  imm:0x14, result rd:x8(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x4, MASK_XLEN(-20)
    add    x2, x2, x4
    c.lwsp x8, 20(x2)
    sd x8, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xfffffffffffeffff)

    # Testcase 17:  imm:0x4, result rd:x10(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x4, MASK_XLEN(-4)
    add    x2, x2, x4
    c.lwsp x10, 4(x2)
    sd x10, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xfffffffffffdffff)

    # Testcase 18:  imm:0x20, result rd:x1(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x4, MASK_XLEN(-32)
    add    x2, x2, x4
    c.lwsp x1, 32(x2)
    sd x1, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffffbffff)

    # Testcase 19:  imm:0x6c, result rd:x18(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x4, MASK_XLEN(-108)
    add    x2, x2, x4
    c.lwsp x18, 108(x2)
    sd x18, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffff7ffff)





    

    RVTEST_SIGBASE(x3,signature_5_0)

    # Testcase 20:  imm:0x30, result rd:x24(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x4, MASK_XLEN(-48)
    add    x2, x2, x4
    c.lwsp x24, 48(x2)
    sd x24, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x24, 0xffffffffffefffff)

    # Testcase 21:  imm:0x54, result rd:x1(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x4, MASK_XLEN(-84)
    add    x2, x2, x4
    c.lwsp x1, 84(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffdfffff)

    # Testcase 22:  imm:0x10, result rd:x22(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x4, MASK_XLEN(-16)
    add    x2, x2, x4
    c.lwsp x22, 16(x2)
    sd x22, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0xffffffffffbfffff)

    # Testcase 23:  imm:0x18, result rd:x31(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x4, MASK_XLEN(-24)
    add    x2, x2, x4
    c.lwsp x31, 24(x2)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xffffffffff7fffff)

    # Testcase 24:  imm:0x30, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x4, MASK_XLEN(-48)
    add    x2, x2, x4
    c.lwsp x1, 48(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x3,signature_6_0)

    # Testcase 25:  imm:0x58, result rd:x18(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x4, MASK_XLEN(-88)
    add    x2, x2, x4
    c.lwsp x18, 88(x2)
    sd x18, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffdffffff)

    # Testcase 26:  imm:0x50, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x4, MASK_XLEN(-80)
    add    x2, x2, x4
    c.lwsp x1, 80(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffeffffff)

    # Testcase 27:  imm:0x60, result rd:x7(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.lwsp x7, 96(x2)
    sd x7, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x7, 0xfffffffff7ffffff)

    # Testcase 28:  imm:0x70, result rd:x12(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x4, MASK_XLEN(-112)
    add    x2, x2, x4
    c.lwsp x12, 112(x2)
    sd x12, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x12, 0xffffffffefffffff)

    # Testcase 29:  imm:0x48, result rd:x23(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x4, MASK_XLEN(-72)
    add    x2, x2, x4
    c.lwsp x23, 72(x2)
    sd x23, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x23, 0xffffffffdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x10(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.lwsp x10, 0(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xffffffffefffffff)

    # Testcase 31:  imm:0x7c, result rd:x3(0x000000007fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x3, 124(x2)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x000000007fffffff)

    # Testcase 32:  imm:0x7c, result rd:x8(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x8, 124(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xffffffffffffffff)

    # Testcase 33:  imm:0x7c, result rd:x14(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x4, MASK_XLEN(-124)
    add    x2, x2, x4
    c.lwsp x14, 124(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0x0000000000000001)

    # Testcase 34:  imm:0x0, result rd:x8(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.lwsp x8, 0(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0x0000000000000002)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0x7c, result rd:x4(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x4, 124(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x0000000000000004)

    # Testcase 36:  imm:0x7c, result rd:x14(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x14, 124(x2)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0x0000000000000008)

    # Testcase 37:  imm:0x7c, result rd:x25(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x25, 124(x2)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0x0000000000000010)

    # Testcase 38:  imm:0x0, result rd:x13(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(0)
    add    x2, x2, x3
    c.lwsp x13, 0(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x13, 0x0000000000000020)

    # Testcase 39:  imm:0x7c, result rd:x4(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-124)
    add    x2, x2, x3
    c.lwsp x4, 124(x2)
    sd x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x0000000000000040)





    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Testcase 40:  imm:0x4, result rd:x1(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x7, MASK_XLEN(-4)
    add    x2, x2, x7
    c.lwsp x1, 4(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000000000080)

    # Testcase 41:  imm:0x8, result rd:x3(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x7, MASK_XLEN(-8)
    add    x2, x2, x7
    c.lwsp x3, 8(x2)
    sd x3, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000100)

    # Testcase 42:  imm:0x10, result rd:x3(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x7, MASK_XLEN(-16)
    add    x2, x2, x7
    c.lwsp x3, 16(x2)
    sd x3, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000200)

    # Testcase 43:  imm:0x20, result rd:x4(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x7, MASK_XLEN(-32)
    add    x2, x2, x7
    c.lwsp x4, 32(x2)
    sd x4, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x0000000000000400)

    # Testcase 44:  imm:0x40, result rd:x5(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x7, MASK_XLEN(-64)
    add    x2, x2, x7
    c.lwsp x5, 64(x2)
    sd x5, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0x0000000000000800)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0x78, result rd:x6(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x6, 120(x2)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000000001000)

    # Testcase 46:  imm:0x74, result rd:x7(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x7, 116(x2)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000000002000)

    # Testcase 47:  imm:0x6c, result rd:x8(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x8, 108(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000000004000)

    # Testcase 48:  imm:0x5c, result rd:x9(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x9, 92(x2)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000008000)

    # Testcase 49:  imm:0x3c, result rd:x10(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x10, 60(x2)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000000001)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0x78, result rd:x11(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x11, 120(x2)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000000002)

    # Testcase 51:  imm:0x74, result rd:x12(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x12, 116(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000040000)

    # Testcase 52:  imm:0x6c, result rd:x13(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x13, 108(x2)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000080000)

    # Testcase 53:  imm:0x5c, result rd:x14(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x14, 92(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000000010)

    # Testcase 54:  imm:0x3c, result rd:x15(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x15, 60(x2)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000000020)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0x78, result rd:x16(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x16, 120(x2)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000400000)

    # Testcase 56:  imm:0x74, result rd:x17(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x17, 116(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000800000)

    # Testcase 57:  imm:0x6c, result rd:x18(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x18, 108(x2)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000000100)

    # Testcase 58:  imm:0x5c, result rd:x19(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x19, 92(x2)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000000200)

    # Testcase 59:  imm:0x3c, result rd:x20(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x20, 60(x2)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000004000000)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0x78, result rd:x21(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x21, 120(x2)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000008000000)

    # Testcase 61:  imm:0x74, result rd:x22(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x22, 116(x2)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000000001000)

    # Testcase 62:  imm:0x6c, result rd:x23(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x23, 108(x2)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000000002000)

    # Testcase 63:  imm:0x5c, result rd:x24(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x24, 92(x2)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000040000000)

    # Testcase 64:  imm:0x3c, result rd:x25(0xffffffff80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x25, 60(x2)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xffffffff80000000)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0x78, result rd:x26(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x26, 120(x2)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000000000000)

    # Testcase 66:  imm:0x74, result rd:x27(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x27, 116(x2)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffffffffffe)

    # Testcase 67:  imm:0x6c, result rd:x28(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x28, 108(x2)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xfffffffffffffffd)

    # Testcase 68:  imm:0x5c, result rd:x29(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x29, 92(x2)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffffffffffb)

    # Testcase 69:  imm:0x3c, result rd:x30(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x30, 60(x2)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffffffff7)





    

    RVTEST_SIGBASE(x5,signature_15_0)

    # Testcase 70:  imm:0x78, result rd:x31(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x6, MASK_XLEN(-120)
    add    x2, x2, x6
    c.lwsp x31, 120(x2)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0xffffffffffffffef)

    # Testcase 71:  imm:0x74, result rd:x1(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x6, MASK_XLEN(-116)
    add    x2, x2, x6
    c.lwsp x1, 116(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffffffffdf)

    # Testcase 72:  imm:0x6c, result rd:x3(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x6, MASK_XLEN(-108)
    add    x2, x2, x6
    c.lwsp x3, 108(x2)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffffffffbf)

    # Testcase 73:  imm:0x5c, result rd:x3(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x6, MASK_XLEN(-92)
    add    x2, x2, x6
    c.lwsp x3, 92(x2)
    sd x3, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffffffff7f)

    # Testcase 74:  imm:0x3c, result rd:x4(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x6, MASK_XLEN(-60)
    add    x2, x2, x6
    c.lwsp x4, 60(x2)
    sd x4, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0x78, result rd:x5(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x5, 120(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xfffffffffffffdff)

    # Testcase 76:  imm:0x74, result rd:x6(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x6, 116(x2)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xfffffffffffffeff)

    # Testcase 77:  imm:0x6c, result rd:x7(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x7, 108(x2)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xfffffffffffff7ff)

    # Testcase 78:  imm:0x5c, result rd:x8(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x8, 92(x2)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffffffffffefff)

    # Testcase 79:  imm:0x3c, result rd:x9(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x9, 60(x2)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xffffffffffffdfff)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0x78, result rd:x10(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x10, 120(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xffffffffffffefff)

    # Testcase 81:  imm:0x74, result rd:x11(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x11, 116(x2)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffffffffffff7fff)

    # Testcase 82:  imm:0x6c, result rd:x12(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x12, 108(x2)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xfffffffffffeffff)

    # Testcase 83:  imm:0x5c, result rd:x13(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x13, 92(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xfffffffffffdffff)

    # Testcase 84:  imm:0x3c, result rd:x14(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x14, 60(x2)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xfffffffffffbffff)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0x78, result rd:x15(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x15, 120(x2)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xfffffffffff7ffff)

    # Testcase 86:  imm:0x74, result rd:x16(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x16, 116(x2)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xffffffffffefffff)

    # Testcase 87:  imm:0x6c, result rd:x17(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x17, 108(x2)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xffffffffffdfffff)

    # Testcase 88:  imm:0x5c, result rd:x18(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x18, 92(x2)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xffffffffffbfffff)

    # Testcase 89:  imm:0x3c, result rd:x19(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x19, 60(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xffffffffff7fffff)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0x78, result rd:x20(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x20, 120(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffffffffeffffff)

    # Testcase 91:  imm:0x74, result rd:x21(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x21, 116(x2)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfffffffffdffffff)

    # Testcase 92:  imm:0x6c, result rd:x22(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x22, 108(x2)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xfffffffffeffffff)

    # Testcase 93:  imm:0x5c, result rd:x23(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x23, 92(x2)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xfffffffff7ffffff)

    # Testcase 94:  imm:0x3c, result rd:x24(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x24, 60(x2)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0x78, result rd:x25(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x25, 120(x2)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xffffffffdfffffff)

    # Testcase 96:  imm:0x74, result rd:x26(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x26, 116(x2)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xffffffffefffffff)

    # Testcase 97:  imm:0x6c, result rd:x27(0x000000007fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x27, 108(x2)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x000000007fffffff)

    # Testcase 98:  imm:0x5c, result rd:x28(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x28, 92(x2)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xffffffffffffffff)

    # Testcase 99:  imm:0x3c, result rd:x29(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x29, 60(x2)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000000001)





    

    RVTEST_SIGBASE(x4,signature_21_0)

    # Testcase 100:  imm:0x78, result rd:x30(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x30, 120(x2)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000002)

    # Testcase 101:  imm:0x74, result rd:x31(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x31, 116(x2)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000000000004)

    # Testcase 102:  imm:0x6c, result rd:x1(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x1, 108(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000000000008)

    # Testcase 103:  imm:0x5c, result rd:x3(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x3, 92(x2)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000000000000010)

    # Testcase 104:  imm:0x3c, result rd:x3(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x5, MASK_XLEN(-60)
    add    x2, x2, x5
    c.lwsp x3, 60(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000000000000020)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0x78, result rd:x4(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x4, 120(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000000040)

    # Testcase 106:  imm:0x74, result rd:x5(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x5, 116(x2)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000000000080)

    # Testcase 107:  imm:0x6c, result rd:x6(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x6, 108(x2)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000000000000100)

    # Testcase 108:  imm:0x5c, result rd:x7(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x7, 92(x2)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000000000000200)

    # Testcase 109:  imm:0x3c, result rd:x8(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x8, 60(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x8, 0x0000000000000400)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0x78, result rd:x9(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x9, 120(x2)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000000800)

    # Testcase 111:  imm:0x74, result rd:x10(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x10, 116(x2)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000001000)

    # Testcase 112:  imm:0x6c, result rd:x11(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x11, 108(x2)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000002000)

    # Testcase 113:  imm:0x5c, result rd:x12(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x12, 92(x2)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000004000)

    # Testcase 114:  imm:0x3c, result rd:x13(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x13, 60(x2)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000008000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0x78, result rd:x14(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x14, 120(x2)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000000001)

    # Testcase 116:  imm:0x74, result rd:x15(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x15, 116(x2)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000000002)

    # Testcase 117:  imm:0x6c, result rd:x16(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x16, 108(x2)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000040000)

    # Testcase 118:  imm:0x5c, result rd:x17(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x17, 92(x2)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000080000)

    # Testcase 119:  imm:0x3c, result rd:x18(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x18, 60(x2)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000000010)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0x78, result rd:x19(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x19, 120(x2)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000000020)

    # Testcase 121:  imm:0x74, result rd:x20(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x20, 116(x2)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000000400000)

    # Testcase 122:  imm:0x6c, result rd:x21(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x21, 108(x2)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000000800000)

    # Testcase 123:  imm:0x5c, result rd:x22(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x22, 92(x2)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000000000100)

    # Testcase 124:  imm:0x3c, result rd:x23(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x23, 60(x2)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000000000200)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0x78, result rd:x24(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x24, 120(x2)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000004000000)

    # Testcase 126:  imm:0x74, result rd:x25(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x25, 116(x2)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0000000008000000)

    # Testcase 127:  imm:0x6c, result rd:x26(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x26, 108(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000000001000)

    # Testcase 128:  imm:0x5c, result rd:x27(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x27, 92(x2)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000000002000)

    # Testcase 129:  imm:0x3c, result rd:x28(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x28, 60(x2)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000040000000)





    

    RVTEST_SIGBASE(x4,signature_27_0)

    # Testcase 130:  imm:0x78, result rd:x29(0xffffffff80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x29, 120(x2)
    sd x29, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0xffffffff80000000)

    # Testcase 131:  imm:0x74, result rd:x30(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x30, 116(x2)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000000)

    # Testcase 132:  imm:0x6c, result rd:x31(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x31, 108(x2)
    sd x31, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0xfffffffffffffffe)

    # Testcase 133:  imm:0x5c, result rd:x1(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x1, 92(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffffffffd)

    # Testcase 134:  imm:0x3c, result rd:x3(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x5, MASK_XLEN(-60)
    add    x2, x2, x5
    c.lwsp x3, 60(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffffffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0x78, result rd:x3(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x8, MASK_XLEN(-120)
    add    x2, x2, x8
    c.lwsp x3, 120(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffffffffffff7)

    # Testcase 136:  imm:0x74, result rd:x4(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x8, MASK_XLEN(-116)
    add    x2, x2, x8
    c.lwsp x4, 116(x2)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xffffffffffffffef)

    # Testcase 137:  imm:0x6c, result rd:x5(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x8, MASK_XLEN(-108)
    add    x2, x2, x8
    c.lwsp x5, 108(x2)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffffffffffdf)

    # Testcase 138:  imm:0x5c, result rd:x6(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x8, MASK_XLEN(-92)
    add    x2, x2, x8
    c.lwsp x6, 92(x2)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffffffffffbf)

    # Testcase 139:  imm:0x3c, result rd:x7(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x8, MASK_XLEN(-60)
    add    x2, x2, x8
    c.lwsp x7, 60(x2)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0xffffffffffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0x78, result rd:x8(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x8, 120(x2)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xfffffffffffffeff)

    # Testcase 141:  imm:0x74, result rd:x9(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x9, 116(x2)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xfffffffffffffdff)

    # Testcase 142:  imm:0x6c, result rd:x10(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x10, 108(x2)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffffffffffeff)

    # Testcase 143:  imm:0x5c, result rd:x11(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x11, 92(x2)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffffffffffff7ff)

    # Testcase 144:  imm:0x3c, result rd:x12(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x12, 60(x2)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0x78, result rd:x13(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x13, 120(x2)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xffffffffffffdfff)

    # Testcase 146:  imm:0x74, result rd:x14(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x14, 116(x2)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffffffffffefff)

    # Testcase 147:  imm:0x6c, result rd:x15(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x15, 108(x2)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffffffffffff7fff)

    # Testcase 148:  imm:0x5c, result rd:x16(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x16, 92(x2)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xfffffffffffeffff)

    # Testcase 149:  imm:0x3c, result rd:x17(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x17, 60(x2)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xfffffffffffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0x78, result rd:x18(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x18, 120(x2)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffffffffffbffff)

    # Testcase 151:  imm:0x74, result rd:x19(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x19, 116(x2)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffff7ffff)

    # Testcase 152:  imm:0x6c, result rd:x20(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x20, 108(x2)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xffffffffffefffff)

    # Testcase 153:  imm:0x5c, result rd:x21(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x21, 92(x2)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xffffffffffdfffff)

    # Testcase 154:  imm:0x3c, result rd:x22(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x22, 60(x2)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffffffffffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0x78, result rd:x23(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x23, 120(x2)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xffffffffff7fffff)

    # Testcase 156:  imm:0x74, result rd:x24(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x24, 116(x2)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xfffffffffeffffff)

    # Testcase 157:  imm:0x6c, result rd:x25(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x25, 108(x2)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xfffffffffdffffff)

    # Testcase 158:  imm:0x5c, result rd:x26(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x26, 92(x2)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfffffffffeffffff)

    # Testcase 159:  imm:0x3c, result rd:x27(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x27, 60(x2)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffff7ffffff)





    

    RVTEST_SIGBASE(x3,signature_33_0)

    # Testcase 160:  imm:0x78, result rd:x28(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    c.lwsp x28, 120(x2)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0xffffffffefffffff)

    # Testcase 161:  imm:0x74, result rd:x29(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x4, MASK_XLEN(-116)
    add    x2, x2, x4
    c.lwsp x29, 116(x2)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0xffffffffdfffffff)

    # Testcase 162:  imm:0x6c, result rd:x30(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x4, MASK_XLEN(-108)
    add    x2, x2, x4
    c.lwsp x30, 108(x2)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffffefffffff)

    # Testcase 163:  imm:0x5c, result rd:x31(0x000000007fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x4, MASK_XLEN(-92)
    add    x2, x2, x4
    c.lwsp x31, 92(x2)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0x000000007fffffff)

    # Testcase 164:  imm:0x3c, result rd:x1(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x4, MASK_XLEN(-60)
    add    x2, x2, x4
    c.lwsp x1, 60(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0x78, result rd:x3(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x7, MASK_XLEN(-120)
    add    x2, x2, x7
    c.lwsp x3, 120(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000001)

    # Testcase 166:  imm:0x74, result rd:x3(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x7, MASK_XLEN(-116)
    add    x2, x2, x7
    c.lwsp x3, 116(x2)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000002)

    # Testcase 167:  imm:0x6c, result rd:x4(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x7, MASK_XLEN(-108)
    add    x2, x2, x7
    c.lwsp x4, 108(x2)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x0000000000000004)

    # Testcase 168:  imm:0x4, result rd:x5(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x7, MASK_XLEN(-4)
    add    x2, x2, x7
    c.lwsp x5, 4(x2)
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0x0000000000000008)

    # Testcase 169:  imm:0x8, result rd:x6(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x7, MASK_XLEN(-8)
    add    x2, x2, x7
    c.lwsp x6, 8(x2)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x6, 0x0000000000000010)





    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x10, result rd:x7(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(-16)
    add    x2, x2, x3
    c.lwsp x7, 16(x2)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000000000020)

    # Testcase 171:  imm:0x20, result rd:x8(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-32)
    add    x2, x2, x3
    c.lwsp x8, 32(x2)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000000000040)

    # Testcase 172:  imm:0x40, result rd:x9(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-64)
    add    x2, x2, x3
    c.lwsp x9, 64(x2)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000000080)

    # Testcase 173:  imm:0x78, result rd:x10(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x10, 120(x2)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000000100)

    # Testcase 174:  imm:0x74, result rd:x11(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x11, 116(x2)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000000200)





    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0x6c, result rd:x12(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x12, 108(x2)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000000400)

    # Testcase 176:  imm:0x5c, result rd:x13(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x13, 92(x2)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000000800)

    # Testcase 177:  imm:0x3c, result rd:x14(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x14, 60(x2)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000001000)

    # Testcase 178:  imm:0x78, result rd:x15(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x15, 120(x2)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000002000)

    # Testcase 179:  imm:0x74, result rd:x16(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x16, 116(x2)
    sd x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000004000)





    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0x6c, result rd:x17(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x17, 108(x2)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000008000)

    # Testcase 181:  imm:0x5c, result rd:x18(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x18, 92(x2)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000000001)

    # Testcase 182:  imm:0x3c, result rd:x19(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x19, 60(x2)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000000002)

    # Testcase 183:  imm:0x78, result rd:x20(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x20, 120(x2)
    sd x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000000040000)

    # Testcase 184:  imm:0x74, result rd:x21(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x21, 116(x2)
    sd x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000000080000)





    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0x6c, result rd:x22(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x22, 108(x2)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000000000010)

    # Testcase 186:  imm:0x5c, result rd:x23(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x23, 92(x2)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000000000020)

    # Testcase 187:  imm:0x3c, result rd:x24(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x24, 60(x2)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000000400000)

    # Testcase 188:  imm:0x78, result rd:x25(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x25, 120(x2)
    sd x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0000000000800000)

    # Testcase 189:  imm:0x74, result rd:x26(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x26, 116(x2)
    sd x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0x6c, result rd:x27(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x27, 108(x2)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000000000200)

    # Testcase 191:  imm:0x5c, result rd:x28(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x28, 92(x2)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000004000000)

    # Testcase 192:  imm:0x3c, result rd:x29(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x29, 60(x2)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000008000000)

    # Testcase 193:  imm:0x78, result rd:x30(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x30, 120(x2)
    sd x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0000000000001000)

    # Testcase 194:  imm:0x74, result rd:x31(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x31, 116(x2)
    sd x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0x0000000000002000)





    

    RVTEST_SIGBASE(x6,signature_40_0)

    # Testcase 195:  imm:0x6c, result rd:x1(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x7, MASK_XLEN(-108)
    add    x2, x2, x7
    c.lwsp x1, 108(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0x0000000040000000)

    # Testcase 196:  imm:0x5c, result rd:x3(0xffffffff80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x7, MASK_XLEN(-92)
    add    x2, x2, x7
    c.lwsp x3, 92(x2)
    sd x3, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xffffffff80000000)

    # Testcase 197:  imm:0x3c, result rd:x3(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x7, MASK_XLEN(-60)
    add    x2, x2, x7
    c.lwsp x3, 60(x2)
    sd x3, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x0000000000000000)

    # Testcase 198:  imm:0x78, result rd:x4(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x7, MASK_XLEN(-120)
    add    x2, x2, x7
    c.lwsp x4, 120(x2)
    sd x4, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0xfffffffffffffffe)

    # Testcase 199:  imm:0x74, result rd:x5(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x7, MASK_XLEN(-116)
    add    x2, x2, x7
    c.lwsp x5, 116(x2)
    sd x5, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0xfffffffffffffffd)





    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 200:  imm:0x6c, result rd:x6(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x6, 108(x2)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xfffffffffffffffb)

    # Testcase 201:  imm:0x5c, result rd:x7(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x7, 92(x2)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xfffffffffffffff7)

    # Testcase 202:  imm:0x3c, result rd:x8(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x8, 60(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffffffffffffef)

    # Testcase 203:  imm:0x78, result rd:x9(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x9, 120(x2)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xffffffffffffffdf)

    # Testcase 204:  imm:0x74, result rd:x10(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x10, 116(x2)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xffffffffffffffbf)





    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0x6c, result rd:x11(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x11, 108(x2)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffffffffffffff7f)

    # Testcase 206:  imm:0x5c, result rd:x12(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x12, 92(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xfffffffffffffeff)

    # Testcase 207:  imm:0x3c, result rd:x13(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x13, 60(x2)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xfffffffffffffdff)

    # Testcase 208:  imm:0x78, result rd:x14(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x14, 120(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xfffffffffffffeff)

    # Testcase 209:  imm:0x74, result rd:x15(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x15, 116(x2)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xfffffffffffff7ff)





    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0x6c, result rd:x16(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x16, 108(x2)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xffffffffffffefff)

    # Testcase 211:  imm:0x5c, result rd:x17(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x17, 92(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xffffffffffffdfff)

    # Testcase 212:  imm:0x3c, result rd:x18(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x18, 60(x2)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xffffffffffffefff)

    # Testcase 213:  imm:0x78, result rd:x19(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x19, 120(x2)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xffffffffffff7fff)

    # Testcase 214:  imm:0x74, result rd:x20(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x20, 116(x2)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffffffffffeffff)





    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0x6c, result rd:x21(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x21, 108(x2)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfffffffffffdffff)

    # Testcase 216:  imm:0x5c, result rd:x22(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x22, 92(x2)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xfffffffffffbffff)

    # Testcase 217:  imm:0x3c, result rd:x23(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x23, 60(x2)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xfffffffffff7ffff)

    # Testcase 218:  imm:0x78, result rd:x24(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x24, 120(x2)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xffffffffffefffff)

    # Testcase 219:  imm:0x74, result rd:x25(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x25, 116(x2)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xffffffffffdfffff)





    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0x6c, result rd:x26(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x26, 108(x2)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xffffffffffbfffff)

    # Testcase 221:  imm:0x5c, result rd:x27(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x27, 92(x2)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xffffffffff7fffff)

    # Testcase 222:  imm:0x3c, result rd:x28(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x28, 60(x2)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xfffffffffeffffff)

    # Testcase 223:  imm:0x78, result rd:x29(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x29, 120(x2)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffffdffffff)

    # Testcase 224:  imm:0x74, result rd:x30(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x30, 116(x2)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x5,signature_46_0)

    # Testcase 225:  imm:0x6c, result rd:x31(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x6, MASK_XLEN(-108)
    add    x2, x2, x6
    c.lwsp x31, 108(x2)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0xfffffffff7ffffff)

    # Testcase 226:  imm:0x5c, result rd:x1(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x6, MASK_XLEN(-92)
    add    x2, x2, x6
    c.lwsp x1, 92(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffefffffff)

    # Testcase 227:  imm:0x3c, result rd:x3(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x6, MASK_XLEN(-60)
    add    x2, x2, x6
    c.lwsp x3, 60(x2)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffdfffffff)

    # Testcase 228:  imm:0x78, result rd:x3(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x6, MASK_XLEN(-120)
    add    x2, x2, x6
    c.lwsp x3, 120(x2)
    sd x3, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0xffffffffefffffff)

    # Testcase 229:  imm:0x74, result rd:x4(0x000000007fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x6, MASK_XLEN(-116)
    add    x2, x2, x6
    c.lwsp x4, 116(x2)
    sd x4, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x000000007fffffff)





    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 230:  imm:0x6c, result rd:x5(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x5, 108(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0xffffffffffffffff)

    # Testcase 231:  imm:0x5c, result rd:x6(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,132
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x6, 92(x2)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000000000001)

    # Testcase 232:  imm:0x3c, result rd:x7(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,136
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x7, 60(x2)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000000000002)

    # Testcase 233:  imm:0x78, result rd:x8(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,140
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x8, 120(x2)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000000000004)

    # Testcase 234:  imm:0x74, result rd:x9(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,144
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x9, 116(x2)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000000008)





    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0x6c, result rd:x10(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,148
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x10, 108(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000000010)

    # Testcase 236:  imm:0x5c, result rd:x11(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x11, 92(x2)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000000020)

    # Testcase 237:  imm:0x3c, result rd:x12(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,156
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x12, 60(x2)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000000040)

    # Testcase 238:  imm:0x78, result rd:x13(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x13, 120(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000000080)

    # Testcase 239:  imm:0x74, result rd:x14(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,164
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x14, 116(x2)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0x6c, result rd:x15(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,168
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x15, 108(x2)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000000200)

    # Testcase 241:  imm:0x5c, result rd:x16(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,172
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x16, 92(x2)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000000400)

    # Testcase 242:  imm:0x3c, result rd:x17(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,176
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x17, 60(x2)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000000800)

    # Testcase 243:  imm:0x78, result rd:x18(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,180
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x18, 120(x2)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000001000)

    # Testcase 244:  imm:0x74, result rd:x19(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x19, 116(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000002000)





    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0x6c, result rd:x20(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,188
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x20, 108(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000000004000)

    # Testcase 246:  imm:0x5c, result rd:x21(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x21, 92(x2)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000000008000)

    # Testcase 247:  imm:0x3c, result rd:x22(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,196
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x22, 60(x2)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000000000001)

    # Testcase 248:  imm:0x78, result rd:x23(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x23, 120(x2)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000000000002)

    # Testcase 249:  imm:0x74, result rd:x24(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,204
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x24, 116(x2)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000000040000)





    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0x6c, result rd:x25(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x25, 108(x2)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0000000000080000)

    # Testcase 251:  imm:0x5c, result rd:x26(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,212
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x26, 92(x2)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000000000010)

    # Testcase 252:  imm:0x3c, result rd:x27(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x27, 60(x2)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000000000020)

    # Testcase 253:  imm:0x78, result rd:x28(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,220
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x28, 120(x2)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000000400000)

    # Testcase 254:  imm:0x74, result rd:x29(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,224
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x29, 116(x2)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000800000)





    

    RVTEST_SIGBASE(x4,signature_52_0)

    # Testcase 255:  imm:0x6c, result rd:x30(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,228
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x30, 108(x2)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000100)

    # Testcase 256:  imm:0x5c, result rd:x31(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,232
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x31, 92(x2)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000000000200)

    # Testcase 257:  imm:0x3c, result rd:x1(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,236
    li     x5, MASK_XLEN(-60)
    add    x2, x2, x5
    c.lwsp x1, 60(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000004000000)

    # Testcase 258:  imm:0x78, result rd:x3(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,240
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x3, 120(x2)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000000008000000)

    # Testcase 259:  imm:0x74, result rd:x3(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,244
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x3, 116(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000000000001000)





    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 260:  imm:0x6c, result rd:x4(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x4, 108(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000000000002000)

    # Testcase 261:  imm:0x5c, result rd:x5(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,252
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x5, 92(x2)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000000040000000)

    # Testcase 262:  imm:0x3c, result rd:x6(0xffffffff80000000)
    la  x2, test_data
    addi    x2, x2,256
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x6, 60(x2)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffff80000000)

    # Testcase 263:  imm:0x78, result rd:x7(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,260
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x7, 120(x2)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000000000000000)

    # Testcase 264:  imm:0x74, result rd:x8(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x8, 116(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x8, 0xfffffffffffffffe)





    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 265:  imm:0x6c, result rd:x9(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,4
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x9, 108(x2)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xfffffffffffffffd)

    # Testcase 266:  imm:0x5c, result rd:x10(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x10, 92(x2)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffffffffffffb)

    # Testcase 267:  imm:0x3c, result rd:x11(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,12
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x11, 60(x2)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffffffffffffff7)

    # Testcase 268:  imm:0x78, result rd:x12(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x12, 120(x2)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xffffffffffffffef)

    # Testcase 269:  imm:0x74, result rd:x13(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,20
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x13, 116(x2)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xffffffffffffffdf)





    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0x6c, result rd:x14(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,24
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x14, 108(x2)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffffffffffffbf)

    # Testcase 271:  imm:0x5c, result rd:x15(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,28
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x15, 92(x2)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffffffffffffff7f)

    # Testcase 272:  imm:0x3c, result rd:x16(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x16, 60(x2)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xfffffffffffffeff)

    # Testcase 273:  imm:0x78, result rd:x17(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,36
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x17, 120(x2)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xfffffffffffffdff)

    # Testcase 274:  imm:0x74, result rd:x18(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x18, 116(x2)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0x6c, result rd:x19(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,44
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x19, 108(x2)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffffff7ff)

    # Testcase 276:  imm:0x5c, result rd:x20(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x20, 92(x2)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xffffffffffffefff)

    # Testcase 277:  imm:0x3c, result rd:x21(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,52
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x21, 60(x2)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xffffffffffffdfff)

    # Testcase 278:  imm:0x78, result rd:x22(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x22, 120(x2)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffffffffffffefff)

    # Testcase 279:  imm:0x74, result rd:x23(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,60
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x23, 116(x2)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xffffffffffff7fff)





    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0x6c, result rd:x24(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x24, 108(x2)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xfffffffffffeffff)

    # Testcase 281:  imm:0x5c, result rd:x25(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,68
    li     x3, MASK_XLEN(-92)
    add    x2, x2, x3
    c.lwsp x25, 92(x2)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xfffffffffffdffff)

    # Testcase 282:  imm:0x3c, result rd:x26(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-60)
    add    x2, x2, x3
    c.lwsp x26, 60(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfffffffffffbffff)

    # Testcase 283:  imm:0x78, result rd:x27(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,76
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.lwsp x27, 120(x2)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffffff7ffff)

    # Testcase 284:  imm:0x74, result rd:x28(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-116)
    add    x2, x2, x3
    c.lwsp x28, 116(x2)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xffffffffffefffff)





    

    RVTEST_SIGBASE(x4,signature_58_0)

    # Testcase 285:  imm:0x6c, result rd:x29(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,84
    li     x5, MASK_XLEN(-108)
    add    x2, x2, x5
    c.lwsp x29, 108(x2)
    sd x29, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0xffffffffffdfffff)

    # Testcase 286:  imm:0x5c, result rd:x30(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,88
    li     x5, MASK_XLEN(-92)
    add    x2, x2, x5
    c.lwsp x30, 92(x2)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0xffffffffffbfffff)

    # Testcase 287:  imm:0x3c, result rd:x31(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,92
    li     x5, MASK_XLEN(-60)
    add    x2, x2, x5
    c.lwsp x31, 60(x2)
    sd x31, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0xffffffffff7fffff)

    # Testcase 288:  imm:0x78, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,96
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.lwsp x1, 120(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffeffffff)

    # Testcase 289:  imm:0x74, result rd:x3(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,100
    li     x5, MASK_XLEN(-116)
    add    x2, x2, x5
    c.lwsp x3, 116(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffffdffffff)





    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0x6c, result rd:x3(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,104
    li     x8, MASK_XLEN(-108)
    add    x2, x2, x8
    c.lwsp x3, 108(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffffffeffffff)

    # Testcase 291:  imm:0x5c, result rd:x4(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,108
    li     x8, MASK_XLEN(-92)
    add    x2, x2, x8
    c.lwsp x4, 92(x2)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xfffffffff7ffffff)

    # Testcase 292:  imm:0x3c, result rd:x5(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,112
    li     x8, MASK_XLEN(-60)
    add    x2, x2, x8
    c.lwsp x5, 60(x2)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffffefffffff)

    # Testcase 293:  imm:0x78, result rd:x6(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,116
    li     x8, MASK_XLEN(-120)
    add    x2, x2, x8
    c.lwsp x6, 120(x2)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffffdfffffff)

    # Testcase 294:  imm:0x74, result rd:x7(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,120
    li     x8, MASK_XLEN(-116)
    add    x2, x2, x8
    c.lwsp x7, 116(x2)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 295:  imm:0x6c, result rd:x8(0x000000007fffffff)
    la  x2, test_data
    addi    x2, x2,124
    li     x3, MASK_XLEN(-108)
    add    x2, x2, x3
    c.lwsp x8, 108(x2)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x000000007fffffff)


	
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

