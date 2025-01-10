// RISC-V Architectural Validation Test C-LD-01
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
// Description: Testing instruction 'c.ld'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.ld)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.ld)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x38, result rd:x11(0xfffffffffffffffe)
    la  x12, test_data
    addi    x12, x12,0
    li     x2, MASK_XLEN(-56)
    add    x12, x12, x2
    c.ld x11, 56(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffffe)

    # Testcase 1:  imm:0x88, result rd:x14(0xfffffffffffffffd)
    la  x12, test_data
    addi    x12, x12,8
    li     x2, MASK_XLEN(-136)
    add    x12, x12, x2
    c.ld x14, 136(x12)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffd)

    # Testcase 2:  imm:0x28, result rd:x10(0xfffffffffffffffb)
    la  x8, test_data
    addi    x8, x8,16
    li     x2, MASK_XLEN(-40)
    add    x8, x8, x2
    c.ld x10, 40(x8)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffb)

    # Testcase 3:  imm:0x20, result rd:x11(0xfffffffffffffff7)
    la  x15, test_data
    addi    x15, x15,24
    li     x2, MASK_XLEN(-32)
    add    x15, x15, x2
    c.ld x11, 32(x15)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffff7)

    # Testcase 4:  imm:0xf0, result rd:x13(0xffffffffffffffef)
    la  x8, test_data
    addi    x8, x8,32
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x13, 240(x8)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffef)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 5:  imm:0xf8, result rd:x13(0xffffffffffffffdf)
    la  x12, test_data
    addi    x12, x12,40
    li     x2, MASK_XLEN(-248)
    add    x12, x12, x2
    c.ld x13, 248(x12)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffdf)

    # Testcase 6:  imm:0x38, result rd:x11(0xffffffffffffffbf)
    la  x9, test_data
    addi    x9, x9,48
    li     x2, MASK_XLEN(-56)
    add    x9, x9, x2
    c.ld x11, 56(x9)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x88, result rd:x10(0xffffffffffffff7f)
    la  x15, test_data
    addi    x15, x15,56
    li     x2, MASK_XLEN(-136)
    add    x15, x15, x2
    c.ld x10, 136(x15)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffff7f)

    # Testcase 8:  imm:0xa0, result rd:x9(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,64
    li     x2, MASK_XLEN(-160)
    add    x15, x15, x2
    c.ld x9, 160(x15)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffeff)

    # Testcase 9:  imm:0x0, result rd:x9(0xfffffffffffffdff)
    la  x15, test_data
    addi    x15, x15,72
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    c.ld x9, 0(x15)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0xf0, result rd:x15(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,80
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x15, 240(x13)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x70, result rd:x8(0xfffffffffffff7ff)
    la  x14, test_data
    addi    x14, x14,88
    li     x2, MASK_XLEN(-112)
    add    x14, x14, x2
    c.ld x8, 112(x14)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffff7ff)

    # Testcase 12:  imm:0x80, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,96
    li     x2, MASK_XLEN(-128)
    add    x9, x9, x2
    c.ld x8, 128(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)

    # Testcase 13:  imm:0x88, result rd:x15(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,104
    li     x2, MASK_XLEN(-136)
    add    x14, x14, x2
    c.ld x15, 136(x14)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffdfff)

    # Testcase 14:  imm:0xc0, result rd:x11(0xffffffffffffefff)
    la  x14, test_data
    addi    x14, x14,112
    li     x2, MASK_XLEN(-192)
    add    x14, x14, x2
    c.ld x11, 192(x14)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 15:  imm:0x68, result rd:x9(0xffffffffffff7fff)
    la  x10, test_data
    addi    x10, x10,120
    li     x2, MASK_XLEN(-104)
    add    x10, x10, x2
    c.ld x9, 104(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffff7fff)

    # Testcase 16:  imm:0x28, result rd:x15(0xfffffffffffeffff)
    la  x13, test_data
    addi    x13, x13,128
    li     x2, MASK_XLEN(-40)
    add    x13, x13, x2
    c.ld x15, 40(x13)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffeffff)

    # Testcase 17:  imm:0x8, result rd:x15(0xfffffffffffdffff)
    la  x11, test_data
    addi    x11, x11,136
    li     x2, MASK_XLEN(-8)
    add    x11, x11, x2
    c.ld x15, 8(x11)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffdffff)

    # Testcase 18:  imm:0x40, result rd:x13(0xfffffffffffbffff)
    la  x8, test_data
    addi    x8, x8,144
    li     x2, MASK_XLEN(-64)
    add    x8, x8, x2
    c.ld x13, 64(x8)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffbffff)

    # Testcase 19:  imm:0xd8, result rd:x12(0xfffffffffff7ffff)
    la  x11, test_data
    addi    x11, x11,152
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x12, 216(x11)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffff7ffff)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 20:  imm:0x60, result rd:x9(0xffffffffffefffff)
    la  x14, test_data
    addi    x14, x14,160
    li     x2, MASK_XLEN(-96)
    add    x14, x14, x2
    c.ld x9, 96(x14)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffefffff)

    # Testcase 21:  imm:0xa8, result rd:x15(0xffffffffffdfffff)
    la  x12, test_data
    addi    x12, x12,168
    li     x2, MASK_XLEN(-168)
    add    x12, x12, x2
    c.ld x15, 168(x12)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffdfffff)

    # Testcase 22:  imm:0x20, result rd:x10(0xffffffffffbfffff)
    la  x12, test_data
    addi    x12, x12,176
    li     x2, MASK_XLEN(-32)
    add    x12, x12, x2
    c.ld x10, 32(x12)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffbfffff)

    # Testcase 23:  imm:0x30, result rd:x13(0xffffffffff7fffff)
    la  x14, test_data
    addi    x14, x14,184
    li     x2, MASK_XLEN(-48)
    add    x14, x14, x2
    c.ld x13, 48(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffff7fffff)

    # Testcase 24:  imm:0x60, result rd:x9(0xfffffffffeffffff)
    la  x14, test_data
    addi    x14, x14,192
    li     x2, MASK_XLEN(-96)
    add    x14, x14, x2
    c.ld x9, 96(x14)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 25:  imm:0xb0, result rd:x11(0xfffffffffdffffff)
    la  x15, test_data
    addi    x15, x15,200
    li     x2, MASK_XLEN(-176)
    add    x15, x15, x2
    c.ld x11, 176(x15)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffdffffff)

    # Testcase 26:  imm:0xa0, result rd:x13(0xfffffffffeffffff)
    la  x12, test_data
    addi    x12, x12,208
    li     x2, MASK_XLEN(-160)
    add    x12, x12, x2
    c.ld x13, 160(x12)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffeffffff)

    # Testcase 27:  imm:0xc0, result rd:x14(0xfffffffff7ffffff)
    la  x9, test_data
    addi    x9, x9,216
    li     x2, MASK_XLEN(-192)
    add    x9, x9, x2
    c.ld x14, 192(x9)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffff7ffffff)

    # Testcase 28:  imm:0xe0, result rd:x9(0xffffffffefffffff)
    la  x10, test_data
    addi    x10, x10,224
    li     x2, MASK_XLEN(-224)
    add    x10, x10, x2
    c.ld x9, 224(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffefffffff)

    # Testcase 29:  imm:0x90, result rd:x14(0xffffffffdfffffff)
    la  x8, test_data
    addi    x8, x8,232
    li     x2, MASK_XLEN(-144)
    add    x8, x8, x2
    c.ld x14, 144(x8)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x8(0xffffffffefffffff)
    la  x11, test_data
    addi    x11, x11,240
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.ld x8, 0(x11)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffefffffff)

    # Testcase 31:  imm:0xf8, result rd:x12(0xffffffff7fffffff)
    la  x11, test_data
    addi    x11, x11,248
    li     x2, MASK_XLEN(-248)
    add    x11, x11, x2
    c.ld x12, 248(x11)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffff7fffffff)

    # Testcase 32:  imm:0xf8, result rd:x15(0xffffffffffffffff)
    la  x14, test_data
    addi    x14, x14,256
    li     x2, MASK_XLEN(-248)
    add    x14, x14, x2
    c.ld x15, 248(x14)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffffff)

    # Testcase 33:  imm:0xf8, result rd:x11(0xfffffffeffffffff)
    la  x13, test_data
    addi    x13, x13,264
    li     x2, MASK_XLEN(-248)
    add    x13, x13, x2
    c.ld x11, 248(x13)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffeffffffff)

    # Testcase 34:  imm:0x0, result rd:x15(0xfffffffdffffffff)
    la  x8, test_data
    addi    x8, x8,272
    li     x2, MASK_XLEN(0)
    add    x8, x8, x2
    c.ld x15, 0(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffdffffffff)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0xf8, result rd:x8(0xfffffffbffffffff)
    la  x12, test_data
    addi    x12, x12,280
    li     x2, MASK_XLEN(-248)
    add    x12, x12, x2
    c.ld x8, 248(x12)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffbffffffff)

    # Testcase 36:  imm:0xf8, result rd:x15(0xfffffff7ffffffff)
    la  x10, test_data
    addi    x10, x10,288
    li     x2, MASK_XLEN(-248)
    add    x10, x10, x2
    c.ld x15, 248(x10)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffff7ffffffff)

    # Testcase 37:  imm:0xf8, result rd:x8(0xffffffefffffffff)
    la  x13, test_data
    addi    x13, x13,296
    li     x2, MASK_XLEN(-248)
    add    x13, x13, x2
    c.ld x8, 248(x13)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffefffffffff)

    # Testcase 38:  imm:0x0, result rd:x13(0xffffffdfffffffff)
    la  x11, test_data
    addi    x11, x11,304
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    c.ld x13, 0(x11)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffdfffffffff)

    # Testcase 39:  imm:0xf8, result rd:x13(0xffffffbfffffffff)
    la  x8, test_data
    addi    x8, x8,312
    li     x2, MASK_XLEN(-248)
    add    x8, x8, x2
    c.ld x13, 248(x8)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffbfffffffff)





    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Testcase 40:  imm:0x8, result rd:x8(0xffffff7fffffffff)
    la  x9, test_data
    addi    x9, x9,320
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    c.ld x8, 8(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffff7fffffffff)

    # Testcase 41:  imm:0x10, result rd:x9(0xfffffeffffffffff)
    la  x10, test_data
    addi    x10, x10,328
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    c.ld x9, 16(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffeffffffffff)

    # Testcase 42:  imm:0x20, result rd:x10(0xfffffdffffffffff)
    la  x11, test_data
    addi    x11, x11,336
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    c.ld x10, 32(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffdffffffffff)

    # Testcase 43:  imm:0x40, result rd:x11(0xfffffeffffffffff)
    la  x12, test_data
    addi    x12, x12,344
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    c.ld x11, 64(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffeffffffffff)

    # Testcase 44:  imm:0x80, result rd:x12(0xfffff7ffffffffff)
    la  x13, test_data
    addi    x13, x13,352
    li     x2, MASK_XLEN(-128)
    add    x13, x13, x2
    c.ld x12, 128(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffff7ffffffffff)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0xf0, result rd:x13(0xffffefffffffffff)
    la  x14, test_data
    addi    x14, x14,360
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffefffffffffff)

    # Testcase 46:  imm:0xe8, result rd:x14(0xffffdfffffffffff)
    la  x15, test_data
    addi    x15, x15,368
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffdfffffffffff)

    # Testcase 47:  imm:0xd8, result rd:x15(0xffffefffffffffff)
    la  x8, test_data
    addi    x8, x8,376
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffefffffffffff)

    # Testcase 48:  imm:0xb8, result rd:x8(0xffff7fffffffffff)
    la  x9, test_data
    addi    x9, x9,384
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff7fffffffffff)

    # Testcase 49:  imm:0x78, result rd:x9(0xfffeffffffffffff)
    la  x10, test_data
    addi    x10, x10,392
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffeffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0xf0, result rd:x10(0xfffdffffffffffff)
    la  x11, test_data
    addi    x11, x11,400
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffdffffffffffff)

    # Testcase 51:  imm:0xe8, result rd:x11(0xfffbffffffffffff)
    la  x12, test_data
    addi    x12, x12,408
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffbffffffffffff)

    # Testcase 52:  imm:0xd8, result rd:x12(0xfff7ffffffffffff)
    la  x13, test_data
    addi    x13, x13,416
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff7ffffffffffff)

    # Testcase 53:  imm:0xb8, result rd:x13(0xffefffffffffffff)
    la  x14, test_data
    addi    x14, x14,424
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffefffffffffffff)

    # Testcase 54:  imm:0x78, result rd:x14(0xffdfffffffffffff)
    la  x15, test_data
    addi    x15, x15,432
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffdfffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0xf0, result rd:x15(0xffbfffffffffffff)
    la  x8, test_data
    addi    x8, x8,440
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffbfffffffffffff)

    # Testcase 56:  imm:0xe8, result rd:x8(0xff7fffffffffffff)
    la  x9, test_data
    addi    x9, x9,448
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff7fffffffffffff)

    # Testcase 57:  imm:0xd8, result rd:x9(0xfeffffffffffffff)
    la  x10, test_data
    addi    x10, x10,456
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfeffffffffffffff)

    # Testcase 58:  imm:0xb8, result rd:x10(0xfdffffffffffffff)
    la  x11, test_data
    addi    x11, x11,464
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfdffffffffffffff)

    # Testcase 59:  imm:0x78, result rd:x11(0xfeffffffffffffff)
    la  x12, test_data
    addi    x12, x12,472
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfeffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0xf0, result rd:x12(0xf7ffffffffffffff)
    la  x13, test_data
    addi    x13, x13,480
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf7ffffffffffffff)

    # Testcase 61:  imm:0xe8, result rd:x13(0xefffffffffffffff)
    la  x14, test_data
    addi    x14, x14,488
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xefffffffffffffff)

    # Testcase 62:  imm:0xd8, result rd:x14(0xdfffffffffffffff)
    la  x15, test_data
    addi    x15, x15,496
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xdfffffffffffffff)

    # Testcase 63:  imm:0xb8, result rd:x15(0xefffffffffffffff)
    la  x8, test_data
    addi    x8, x8,504
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xefffffffffffffff)

    # Testcase 64:  imm:0x78, result rd:x8(0x7fffffffffffffff)
    la  x9, test_data
    addi    x9, x9,512
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7fffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0xf0, result rd:x9(0xffffffffffffffff)
    la  x10, test_data
    addi    x10, x10,520
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffffff)

    # Testcase 66:  imm:0xe8, result rd:x10(0x0000000000000001)
    la  x11, test_data
    addi    x11, x11,528
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000001)

    # Testcase 67:  imm:0xd8, result rd:x11(0x0000000000000002)
    la  x12, test_data
    addi    x12, x12,536
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000002)

    # Testcase 68:  imm:0xb8, result rd:x12(0x0000000000000004)
    la  x13, test_data
    addi    x13, x13,544
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000004)

    # Testcase 69:  imm:0x78, result rd:x13(0x0000000000000008)
    la  x14, test_data
    addi    x14, x14,552
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000008)





    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Testcase 70:  imm:0xf0, result rd:x14(0x0000000000000010)
    la  x15, test_data
    addi    x15, x15,560
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000010)

    # Testcase 71:  imm:0xe8, result rd:x15(0x0000000000000020)
    la  x8, test_data
    addi    x8, x8,568
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000020)

    # Testcase 72:  imm:0xd8, result rd:x8(0x0000000000000040)
    la  x9, test_data
    addi    x9, x9,576
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000040)

    # Testcase 73:  imm:0xb8, result rd:x9(0x0000000000000080)
    la  x10, test_data
    addi    x10, x10,584
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000080)

    # Testcase 74:  imm:0x78, result rd:x10(0x0000000000000100)
    la  x11, test_data
    addi    x11, x11,592
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0xf0, result rd:x11(0x0000000000000200)
    la  x12, test_data
    addi    x12, x12,600
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000200)

    # Testcase 76:  imm:0xe8, result rd:x12(0x0000000000000400)
    la  x13, test_data
    addi    x13, x13,608
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000400)

    # Testcase 77:  imm:0xd8, result rd:x13(0x0000000000000800)
    la  x14, test_data
    addi    x14, x14,616
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000800)

    # Testcase 78:  imm:0xb8, result rd:x14(0x0000000000001000)
    la  x15, test_data
    addi    x15, x15,624
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000001000)

    # Testcase 79:  imm:0x78, result rd:x15(0x0000000000002000)
    la  x8, test_data
    addi    x8, x8,632
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000002000)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0xf0, result rd:x8(0x0000000000004000)
    la  x9, test_data
    addi    x9, x9,640
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000004000)

    # Testcase 81:  imm:0xe8, result rd:x9(0x0000000000008000)
    la  x10, test_data
    addi    x10, x10,648
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000008000)

    # Testcase 82:  imm:0xd8, result rd:x10(0x0000000000010000)
    la  x11, test_data
    addi    x11, x11,656
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000010000)

    # Testcase 83:  imm:0xb8, result rd:x11(0x0000000000020000)
    la  x12, test_data
    addi    x12, x12,664
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000020000)

    # Testcase 84:  imm:0x78, result rd:x12(0x0000000000040000)
    la  x13, test_data
    addi    x13, x13,672
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000040000)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0xf0, result rd:x13(0x0000000000080000)
    la  x14, test_data
    addi    x14, x14,680
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000080000)

    # Testcase 86:  imm:0xe8, result rd:x14(0x0000000000100000)
    la  x15, test_data
    addi    x15, x15,688
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000100000)

    # Testcase 87:  imm:0xd8, result rd:x15(0x0000000000200000)
    la  x8, test_data
    addi    x8, x8,696
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000200000)

    # Testcase 88:  imm:0xb8, result rd:x8(0x0000000000400000)
    la  x9, test_data
    addi    x9, x9,704
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000400000)

    # Testcase 89:  imm:0x78, result rd:x9(0x0000000000800000)
    la  x10, test_data
    addi    x10, x10,712
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000800000)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0xf0, result rd:x10(0x0000000001000000)
    la  x11, test_data
    addi    x11, x11,720
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000001000000)

    # Testcase 91:  imm:0xe8, result rd:x11(0x0000000002000000)
    la  x12, test_data
    addi    x12, x12,728
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000002000000)

    # Testcase 92:  imm:0xd8, result rd:x12(0x0000000004000000)
    la  x13, test_data
    addi    x13, x13,736
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000004000000)

    # Testcase 93:  imm:0xb8, result rd:x13(0x0000000008000000)
    la  x14, test_data
    addi    x14, x14,744
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000008000000)

    # Testcase 94:  imm:0x78, result rd:x14(0x0000000010000000)
    la  x15, test_data
    addi    x15, x15,752
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000010000000)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0xf0, result rd:x15(0x0000000020000000)
    la  x8, test_data
    addi    x8, x8,760
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000020000000)

    # Testcase 96:  imm:0xe8, result rd:x8(0x0000000040000000)
    la  x9, test_data
    addi    x9, x9,768
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000040000000)

    # Testcase 97:  imm:0xd8, result rd:x9(0x0000000080000000)
    la  x10, test_data
    addi    x10, x10,776
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000080000000)

    # Testcase 98:  imm:0xb8, result rd:x10(0x0000000000000000)
    la  x11, test_data
    addi    x11, x11,784
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000000)

    # Testcase 99:  imm:0x78, result rd:x11(0x0000000100000000)
    la  x12, test_data
    addi    x12, x12,792
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000100000000)





    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Testcase 100:  imm:0xf0, result rd:x12(0x0000000200000000)
    la  x13, test_data
    addi    x13, x13,800
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000200000000)

    # Testcase 101:  imm:0xe8, result rd:x13(0x0000000400000000)
    la  x14, test_data
    addi    x14, x14,808
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000400000000)

    # Testcase 102:  imm:0xd8, result rd:x14(0x0000000800000000)
    la  x15, test_data
    addi    x15, x15,816
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000800000000)

    # Testcase 103:  imm:0xb8, result rd:x15(0x0000001000000000)
    la  x8, test_data
    addi    x8, x8,824
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000001000000000)

    # Testcase 104:  imm:0x78, result rd:x8(0x0000002000000000)
    la  x9, test_data
    addi    x9, x9,832
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000002000000000)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0xf0, result rd:x9(0x0000004000000000)
    la  x10, test_data
    addi    x10, x10,840
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000004000000000)

    # Testcase 106:  imm:0xe8, result rd:x10(0x0000008000000000)
    la  x11, test_data
    addi    x11, x11,848
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000008000000000)

    # Testcase 107:  imm:0xd8, result rd:x11(0x0000010000000000)
    la  x12, test_data
    addi    x12, x12,856
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000010000000000)

    # Testcase 108:  imm:0xb8, result rd:x12(0x0000020000000000)
    la  x13, test_data
    addi    x13, x13,864
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000020000000000)

    # Testcase 109:  imm:0x78, result rd:x13(0x0000040000000000)
    la  x14, test_data
    addi    x14, x14,872
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000040000000000)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0xf0, result rd:x14(0x0000080000000000)
    la  x15, test_data
    addi    x15, x15,880
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000080000000000)

    # Testcase 111:  imm:0xe8, result rd:x15(0x0000100000000000)
    la  x8, test_data
    addi    x8, x8,888
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000100000000000)

    # Testcase 112:  imm:0xd8, result rd:x8(0x0000200000000000)
    la  x9, test_data
    addi    x9, x9,896
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000200000000000)

    # Testcase 113:  imm:0xb8, result rd:x9(0x0000400000000000)
    la  x10, test_data
    addi    x10, x10,904
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000400000000000)

    # Testcase 114:  imm:0x78, result rd:x10(0x0000800000000000)
    la  x11, test_data
    addi    x11, x11,912
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000800000000000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0xf0, result rd:x11(0x0001000000000000)
    la  x12, test_data
    addi    x12, x12,920
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0001000000000000)

    # Testcase 116:  imm:0xe8, result rd:x12(0x0002000000000000)
    la  x13, test_data
    addi    x13, x13,928
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0002000000000000)

    # Testcase 117:  imm:0xd8, result rd:x13(0x0004000000000000)
    la  x14, test_data
    addi    x14, x14,936
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0004000000000000)

    # Testcase 118:  imm:0xb8, result rd:x14(0x0008000000000000)
    la  x15, test_data
    addi    x15, x15,944
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0008000000000000)

    # Testcase 119:  imm:0x78, result rd:x15(0x0010000000000000)
    la  x8, test_data
    addi    x8, x8,952
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0010000000000000)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0xf0, result rd:x8(0x0020000000000000)
    la  x9, test_data
    addi    x9, x9,960
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0020000000000000)

    # Testcase 121:  imm:0xe8, result rd:x9(0x0040000000000000)
    la  x10, test_data
    addi    x10, x10,968
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0040000000000000)

    # Testcase 122:  imm:0xd8, result rd:x10(0x0080000000000000)
    la  x11, test_data
    addi    x11, x11,976
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0080000000000000)

    # Testcase 123:  imm:0xb8, result rd:x11(0x0100000000000000)
    la  x12, test_data
    addi    x12, x12,984
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0100000000000000)

    # Testcase 124:  imm:0x78, result rd:x12(0x0200000000000000)
    la  x13, test_data
    addi    x13, x13,992
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0200000000000000)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0xf0, result rd:x13(0x0400000000000000)
    la  x14, test_data
    addi    x14, x14,1000
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0400000000000000)

    # Testcase 126:  imm:0xe8, result rd:x14(0x0800000000000000)
    la  x15, test_data
    addi    x15, x15,1008
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0800000000000000)

    # Testcase 127:  imm:0xd8, result rd:x15(0x1000000000000000)
    la  x8, test_data
    addi    x8, x8,1016
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x1000000000000000)

    # Testcase 128:  imm:0xb8, result rd:x8(0x2000000000000000)
    la  x9, test_data
    addi    x9, x9,1024
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2000000000000000)

    # Testcase 129:  imm:0x78, result rd:x9(0x4000000000000000)
    la  x10, test_data
    addi    x10, x10,1032
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x4000000000000000)





    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 130:  imm:0xf0, result rd:x10(0x8000000000000000)
    la  x11, test_data
    addi    x11, x11,1040
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x8000000000000000)

    # Testcase 131:  imm:0xe8, result rd:x11(0x0000000000000000)
    la  x12, test_data
    addi    x12, x12,1048
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000000)

    # Testcase 132:  imm:0xd8, result rd:x12(0xfffffffffffffffe)
    la  x13, test_data
    addi    x13, x13,0
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffffe)

    # Testcase 133:  imm:0xb8, result rd:x13(0xfffffffffffffffd)
    la  x14, test_data
    addi    x14, x14,8
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffffd)

    # Testcase 134:  imm:0x78, result rd:x14(0xfffffffffffffffb)
    la  x15, test_data
    addi    x15, x15,16
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0xf0, result rd:x15(0xfffffffffffffff7)
    la  x8, test_data
    addi    x8, x8,24
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffffff7)

    # Testcase 136:  imm:0xe8, result rd:x8(0xffffffffffffffef)
    la  x9, test_data
    addi    x9, x9,32
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffffef)

    # Testcase 137:  imm:0xd8, result rd:x9(0xffffffffffffffdf)
    la  x10, test_data
    addi    x10, x10,40
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffffdf)

    # Testcase 138:  imm:0xb8, result rd:x10(0xffffffffffffffbf)
    la  x11, test_data
    addi    x11, x11,48
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffbf)

    # Testcase 139:  imm:0x78, result rd:x11(0xffffffffffffff7f)
    la  x12, test_data
    addi    x12, x12,56
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0xf0, result rd:x12(0xfffffffffffffeff)
    la  x13, test_data
    addi    x13, x13,64
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffffeff)

    # Testcase 141:  imm:0xe8, result rd:x13(0xfffffffffffffdff)
    la  x14, test_data
    addi    x14, x14,72
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffffdff)

    # Testcase 142:  imm:0xd8, result rd:x14(0xfffffffffffffeff)
    la  x15, test_data
    addi    x15, x15,80
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffffeff)

    # Testcase 143:  imm:0xb8, result rd:x15(0xfffffffffffff7ff)
    la  x8, test_data
    addi    x8, x8,88
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffffff7ff)

    # Testcase 144:  imm:0x78, result rd:x8(0xffffffffffffefff)
    la  x9, test_data
    addi    x9, x9,96
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0xf0, result rd:x9(0xffffffffffffdfff)
    la  x10, test_data
    addi    x10, x10,104
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffffdfff)

    # Testcase 146:  imm:0xe8, result rd:x10(0xffffffffffffefff)
    la  x11, test_data
    addi    x11, x11,112
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffefff)

    # Testcase 147:  imm:0xd8, result rd:x11(0xffffffffffff7fff)
    la  x12, test_data
    addi    x12, x12,120
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffffff7fff)

    # Testcase 148:  imm:0xb8, result rd:x12(0xfffffffffffeffff)
    la  x13, test_data
    addi    x13, x13,128
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffeffff)

    # Testcase 149:  imm:0x78, result rd:x13(0xfffffffffffdffff)
    la  x14, test_data
    addi    x14, x14,136
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0xf0, result rd:x14(0xfffffffffffbffff)
    la  x15, test_data
    addi    x15, x15,144
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffffbffff)

    # Testcase 151:  imm:0xe8, result rd:x15(0xfffffffffff7ffff)
    la  x8, test_data
    addi    x8, x8,152
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffffff7ffff)

    # Testcase 152:  imm:0xd8, result rd:x8(0xffffffffffefffff)
    la  x9, test_data
    addi    x9, x9,160
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffefffff)

    # Testcase 153:  imm:0xb8, result rd:x9(0xffffffffffdfffff)
    la  x10, test_data
    addi    x10, x10,168
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffffdfffff)

    # Testcase 154:  imm:0x78, result rd:x10(0xffffffffffbfffff)
    la  x11, test_data
    addi    x11, x11,176
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0xf0, result rd:x11(0xffffffffff7fffff)
    la  x12, test_data
    addi    x12, x12,184
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffffff7fffff)

    # Testcase 156:  imm:0xe8, result rd:x12(0xfffffffffeffffff)
    la  x13, test_data
    addi    x13, x13,192
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffeffffff)

    # Testcase 157:  imm:0xd8, result rd:x13(0xfffffffffdffffff)
    la  x14, test_data
    addi    x14, x14,200
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffdffffff)

    # Testcase 158:  imm:0xb8, result rd:x14(0xfffffffffeffffff)
    la  x15, test_data
    addi    x15, x15,208
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffffeffffff)

    # Testcase 159:  imm:0x78, result rd:x15(0xfffffffff7ffffff)
    la  x8, test_data
    addi    x8, x8,216
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffff7ffffff)





    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 160:  imm:0xf0, result rd:x8(0xffffffffefffffff)
    la  x9, test_data
    addi    x9, x9,224
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffefffffff)

    # Testcase 161:  imm:0xe8, result rd:x9(0xffffffffdfffffff)
    la  x10, test_data
    addi    x10, x10,232
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffffdfffffff)

    # Testcase 162:  imm:0xd8, result rd:x10(0xffffffffefffffff)
    la  x11, test_data
    addi    x11, x11,240
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffefffffff)

    # Testcase 163:  imm:0xb8, result rd:x11(0xffffffff7fffffff)
    la  x12, test_data
    addi    x12, x12,248
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffff7fffffff)

    # Testcase 164:  imm:0x78, result rd:x12(0xffffffffffffffff)
    la  x13, test_data
    addi    x13, x13,256
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0xf0, result rd:x13(0xfffffffeffffffff)
    la  x14, test_data
    addi    x14, x14,264
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffeffffffff)

    # Testcase 166:  imm:0xe8, result rd:x14(0xfffffffdffffffff)
    la  x15, test_data
    addi    x15, x15,272
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffffdffffffff)

    # Testcase 167:  imm:0xd8, result rd:x15(0xfffffffbffffffff)
    la  x8, test_data
    addi    x8, x8,280
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffffbffffffff)

    # Testcase 168:  imm:0x8, result rd:x8(0xfffffff7ffffffff)
    la  x9, test_data
    addi    x9, x9,288
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    c.ld x8, 8(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffff7ffffffff)

    # Testcase 169:  imm:0x10, result rd:x9(0xffffffefffffffff)
    la  x10, test_data
    addi    x10, x10,296
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    c.ld x9, 16(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffffefffffffff)





    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x20, result rd:x10(0xffffffdfffffffff)
    la  x11, test_data
    addi    x11, x11,304
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    c.ld x10, 32(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffdfffffffff)

    # Testcase 171:  imm:0x40, result rd:x11(0xffffffbfffffffff)
    la  x12, test_data
    addi    x12, x12,312
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    c.ld x11, 64(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffffbfffffffff)

    # Testcase 172:  imm:0x80, result rd:x12(0xffffff7fffffffff)
    la  x13, test_data
    addi    x13, x13,320
    li     x2, MASK_XLEN(-128)
    add    x13, x13, x2
    c.ld x12, 128(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffff7fffffffff)

    # Testcase 173:  imm:0xf0, result rd:x13(0xfffffeffffffffff)
    la  x14, test_data
    addi    x14, x14,328
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffeffffffffff)

    # Testcase 174:  imm:0xe8, result rd:x14(0xfffffdffffffffff)
    la  x15, test_data
    addi    x15, x15,336
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffffdffffffffff)





    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0xd8, result rd:x15(0xfffffeffffffffff)
    la  x8, test_data
    addi    x8, x8,344
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffffeffffffffff)

    # Testcase 176:  imm:0xb8, result rd:x8(0xfffff7ffffffffff)
    la  x9, test_data
    addi    x9, x9,352
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffff7ffffffffff)

    # Testcase 177:  imm:0x78, result rd:x9(0xffffefffffffffff)
    la  x10, test_data
    addi    x10, x10,360
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffffefffffffffff)

    # Testcase 178:  imm:0xf0, result rd:x10(0xffffdfffffffffff)
    la  x11, test_data
    addi    x11, x11,368
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffdfffffffffff)

    # Testcase 179:  imm:0xe8, result rd:x11(0xffffefffffffffff)
    la  x12, test_data
    addi    x12, x12,376
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffffefffffffffff)





    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0xd8, result rd:x12(0xffff7fffffffffff)
    la  x13, test_data
    addi    x13, x13,384
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffff7fffffffffff)

    # Testcase 181:  imm:0xb8, result rd:x13(0xfffeffffffffffff)
    la  x14, test_data
    addi    x14, x14,392
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffeffffffffffff)

    # Testcase 182:  imm:0x78, result rd:x14(0xfffdffffffffffff)
    la  x15, test_data
    addi    x15, x15,400
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfffdffffffffffff)

    # Testcase 183:  imm:0xf0, result rd:x15(0xfffbffffffffffff)
    la  x8, test_data
    addi    x8, x8,408
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfffbffffffffffff)

    # Testcase 184:  imm:0xe8, result rd:x8(0xfff7ffffffffffff)
    la  x9, test_data
    addi    x9, x9,416
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff7ffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0xd8, result rd:x9(0xffefffffffffffff)
    la  x10, test_data
    addi    x10, x10,424
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xffefffffffffffff)

    # Testcase 186:  imm:0xb8, result rd:x10(0xffdfffffffffffff)
    la  x11, test_data
    addi    x11, x11,432
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffdfffffffffffff)

    # Testcase 187:  imm:0x78, result rd:x11(0xffbfffffffffffff)
    la  x12, test_data
    addi    x12, x12,440
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xffbfffffffffffff)

    # Testcase 188:  imm:0xf0, result rd:x12(0xff7fffffffffffff)
    la  x13, test_data
    addi    x13, x13,448
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xff7fffffffffffff)

    # Testcase 189:  imm:0xe8, result rd:x13(0xfeffffffffffffff)
    la  x14, test_data
    addi    x14, x14,456
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfeffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0xd8, result rd:x14(0xfdffffffffffffff)
    la  x15, test_data
    addi    x15, x15,464
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfdffffffffffffff)

    # Testcase 191:  imm:0xb8, result rd:x15(0xfeffffffffffffff)
    la  x8, test_data
    addi    x8, x8,472
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xfeffffffffffffff)

    # Testcase 192:  imm:0x78, result rd:x8(0xf7ffffffffffffff)
    la  x9, test_data
    addi    x9, x9,480
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf7ffffffffffffff)

    # Testcase 193:  imm:0xf0, result rd:x9(0xefffffffffffffff)
    la  x10, test_data
    addi    x10, x10,488
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xefffffffffffffff)

    # Testcase 194:  imm:0xe8, result rd:x10(0xdfffffffffffffff)
    la  x11, test_data
    addi    x11, x11,496
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xdfffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Testcase 195:  imm:0xd8, result rd:x11(0xefffffffffffffff)
    la  x12, test_data
    addi    x12, x12,504
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xefffffffffffffff)

    # Testcase 196:  imm:0xb8, result rd:x12(0x7fffffffffffffff)
    la  x13, test_data
    addi    x13, x13,512
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x7fffffffffffffff)

    # Testcase 197:  imm:0x78, result rd:x13(0xffffffffffffffff)
    la  x14, test_data
    addi    x14, x14,520
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffff)

    # Testcase 198:  imm:0xf0, result rd:x14(0x0000000000000001)
    la  x15, test_data
    addi    x15, x15,528
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000001)

    # Testcase 199:  imm:0xe8, result rd:x15(0x0000000000000002)
    la  x8, test_data
    addi    x8, x8,536
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000002)





    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 200:  imm:0xd8, result rd:x8(0x0000000000000004)
    la  x9, test_data
    addi    x9, x9,544
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000004)

    # Testcase 201:  imm:0xb8, result rd:x9(0x0000000000000008)
    la  x10, test_data
    addi    x10, x10,552
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000008)

    # Testcase 202:  imm:0x78, result rd:x10(0x0000000000000010)
    la  x11, test_data
    addi    x11, x11,560
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000000010)

    # Testcase 203:  imm:0xf0, result rd:x11(0x0000000000000020)
    la  x12, test_data
    addi    x12, x12,568
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000000020)

    # Testcase 204:  imm:0xe8, result rd:x12(0x0000000000000040)
    la  x13, test_data
    addi    x13, x13,576
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000000040)





    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0xd8, result rd:x13(0x0000000000000080)
    la  x14, test_data
    addi    x14, x14,584
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000000080)

    # Testcase 206:  imm:0xb8, result rd:x14(0x0000000000000100)
    la  x15, test_data
    addi    x15, x15,592
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000100)

    # Testcase 207:  imm:0x78, result rd:x15(0x0000000000000200)
    la  x8, test_data
    addi    x8, x8,600
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000200)

    # Testcase 208:  imm:0xf0, result rd:x8(0x0000000000000400)
    la  x9, test_data
    addi    x9, x9,608
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000000400)

    # Testcase 209:  imm:0xe8, result rd:x9(0x0000000000000800)
    la  x10, test_data
    addi    x10, x10,616
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000000800)





    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0xd8, result rd:x10(0x0000000000001000)
    la  x11, test_data
    addi    x11, x11,624
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000001000)

    # Testcase 211:  imm:0xb8, result rd:x11(0x0000000000002000)
    la  x12, test_data
    addi    x12, x12,632
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000002000)

    # Testcase 212:  imm:0x78, result rd:x12(0x0000000000004000)
    la  x13, test_data
    addi    x13, x13,640
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000004000)

    # Testcase 213:  imm:0xf0, result rd:x13(0x0000000000008000)
    la  x14, test_data
    addi    x14, x14,648
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000008000)

    # Testcase 214:  imm:0xe8, result rd:x14(0x0000000000010000)
    la  x15, test_data
    addi    x15, x15,656
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000010000)





    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0xd8, result rd:x15(0x0000000000020000)
    la  x8, test_data
    addi    x8, x8,664
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000020000)

    # Testcase 216:  imm:0xb8, result rd:x8(0x0000000000040000)
    la  x9, test_data
    addi    x9, x9,672
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000000040000)

    # Testcase 217:  imm:0x78, result rd:x9(0x0000000000080000)
    la  x10, test_data
    addi    x10, x10,680
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000000080000)

    # Testcase 218:  imm:0xf0, result rd:x10(0x0000000000100000)
    la  x11, test_data
    addi    x11, x11,688
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000000100000)

    # Testcase 219:  imm:0xe8, result rd:x11(0x0000000000200000)
    la  x12, test_data
    addi    x12, x12,696
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000000200000)





    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0xd8, result rd:x12(0x0000000000400000)
    la  x13, test_data
    addi    x13, x13,704
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000000400000)

    # Testcase 221:  imm:0xb8, result rd:x13(0x0000000000800000)
    la  x14, test_data
    addi    x14, x14,712
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000000800000)

    # Testcase 222:  imm:0x78, result rd:x14(0x0000000001000000)
    la  x15, test_data
    addi    x15, x15,720
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000001000000)

    # Testcase 223:  imm:0xf0, result rd:x15(0x0000000002000000)
    la  x8, test_data
    addi    x8, x8,728
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000002000000)

    # Testcase 224:  imm:0xe8, result rd:x8(0x0000000004000000)
    la  x9, test_data
    addi    x9, x9,736
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000004000000)





    

    RVTEST_SIGBASE(x1,signature_46_0)

    # Testcase 225:  imm:0xd8, result rd:x9(0x0000000008000000)
    la  x10, test_data
    addi    x10, x10,744
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000008000000)

    # Testcase 226:  imm:0xb8, result rd:x10(0x0000000010000000)
    la  x11, test_data
    addi    x11, x11,752
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000010000000)

    # Testcase 227:  imm:0x78, result rd:x11(0x0000000020000000)
    la  x12, test_data
    addi    x12, x12,760
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000000020000000)

    # Testcase 228:  imm:0xf0, result rd:x12(0x0000000040000000)
    la  x13, test_data
    addi    x13, x13,768
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000000040000000)

    # Testcase 229:  imm:0xe8, result rd:x13(0x0000000080000000)
    la  x14, test_data
    addi    x14, x14,776
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000000080000000)





    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 230:  imm:0xd8, result rd:x14(0x0000000000000000)
    la  x15, test_data
    addi    x15, x15,784
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000000000000000)

    # Testcase 231:  imm:0xb8, result rd:x15(0x0000000100000000)
    la  x8, test_data
    addi    x8, x8,792
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000100000000)

    # Testcase 232:  imm:0x78, result rd:x8(0x0000000200000000)
    la  x9, test_data
    addi    x9, x9,800
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000000200000000)

    # Testcase 233:  imm:0xf0, result rd:x9(0x0000000400000000)
    la  x10, test_data
    addi    x10, x10,808
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000000400000000)

    # Testcase 234:  imm:0xe8, result rd:x10(0x0000000800000000)
    la  x11, test_data
    addi    x11, x11,816
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000000800000000)





    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0xd8, result rd:x11(0x0000001000000000)
    la  x12, test_data
    addi    x12, x12,824
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000001000000000)

    # Testcase 236:  imm:0xb8, result rd:x12(0x0000002000000000)
    la  x13, test_data
    addi    x13, x13,832
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000002000000000)

    # Testcase 237:  imm:0x78, result rd:x13(0x0000004000000000)
    la  x14, test_data
    addi    x14, x14,840
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000004000000000)

    # Testcase 238:  imm:0xf0, result rd:x14(0x0000008000000000)
    la  x15, test_data
    addi    x15, x15,848
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000008000000000)

    # Testcase 239:  imm:0xe8, result rd:x15(0x0000010000000000)
    la  x8, test_data
    addi    x8, x8,856
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000010000000000)





    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0xd8, result rd:x8(0x0000020000000000)
    la  x9, test_data
    addi    x9, x9,864
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000020000000000)

    # Testcase 241:  imm:0xb8, result rd:x9(0x0000040000000000)
    la  x10, test_data
    addi    x10, x10,872
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0000040000000000)

    # Testcase 242:  imm:0x78, result rd:x10(0x0000080000000000)
    la  x11, test_data
    addi    x11, x11,880
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0000080000000000)

    # Testcase 243:  imm:0xf0, result rd:x11(0x0000100000000000)
    la  x12, test_data
    addi    x12, x12,888
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0000100000000000)

    # Testcase 244:  imm:0xe8, result rd:x12(0x0000200000000000)
    la  x13, test_data
    addi    x13, x13,896
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0000200000000000)





    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0xd8, result rd:x13(0x0000400000000000)
    la  x14, test_data
    addi    x14, x14,904
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0000400000000000)

    # Testcase 246:  imm:0xb8, result rd:x14(0x0000800000000000)
    la  x15, test_data
    addi    x15, x15,912
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0000800000000000)

    # Testcase 247:  imm:0x78, result rd:x15(0x0001000000000000)
    la  x8, test_data
    addi    x8, x8,920
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0001000000000000)

    # Testcase 248:  imm:0xf0, result rd:x8(0x0002000000000000)
    la  x9, test_data
    addi    x9, x9,928
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0002000000000000)

    # Testcase 249:  imm:0xe8, result rd:x9(0x0004000000000000)
    la  x10, test_data
    addi    x10, x10,936
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0004000000000000)





    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0xd8, result rd:x10(0x0008000000000000)
    la  x11, test_data
    addi    x11, x11,944
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0008000000000000)

    # Testcase 251:  imm:0xb8, result rd:x11(0x0010000000000000)
    la  x12, test_data
    addi    x12, x12,952
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x0010000000000000)

    # Testcase 252:  imm:0x78, result rd:x12(0x0020000000000000)
    la  x13, test_data
    addi    x13, x13,960
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x0020000000000000)

    # Testcase 253:  imm:0xf0, result rd:x13(0x0040000000000000)
    la  x14, test_data
    addi    x14, x14,968
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x0040000000000000)

    # Testcase 254:  imm:0xe8, result rd:x14(0x0080000000000000)
    la  x15, test_data
    addi    x15, x15,976
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x0080000000000000)





    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 255:  imm:0xd8, result rd:x15(0x0100000000000000)
    la  x8, test_data
    addi    x8, x8,984
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0100000000000000)

    # Testcase 256:  imm:0xb8, result rd:x8(0x0200000000000000)
    la  x9, test_data
    addi    x9, x9,992
    li     x2, MASK_XLEN(-184)
    add    x9, x9, x2
    c.ld x8, 184(x9)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0200000000000000)

    # Testcase 257:  imm:0x78, result rd:x9(0x0400000000000000)
    la  x10, test_data
    addi    x10, x10,1000
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    c.ld x9, 120(x10)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x0400000000000000)

    # Testcase 258:  imm:0xf0, result rd:x10(0x0800000000000000)
    la  x11, test_data
    addi    x11, x11,1008
    li     x2, MASK_XLEN(-240)
    add    x11, x11, x2
    c.ld x10, 240(x11)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x0800000000000000)

    # Testcase 259:  imm:0xe8, result rd:x11(0x1000000000000000)
    la  x12, test_data
    addi    x12, x12,1016
    li     x2, MASK_XLEN(-232)
    add    x12, x12, x2
    c.ld x11, 232(x12)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x1000000000000000)





    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 260:  imm:0xd8, result rd:x12(0x2000000000000000)
    la  x13, test_data
    addi    x13, x13,1024
    li     x2, MASK_XLEN(-216)
    add    x13, x13, x2
    c.ld x12, 216(x13)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x2000000000000000)

    # Testcase 261:  imm:0xb8, result rd:x13(0x4000000000000000)
    la  x14, test_data
    addi    x14, x14,1032
    li     x2, MASK_XLEN(-184)
    add    x14, x14, x2
    c.ld x13, 184(x14)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x4000000000000000)

    # Testcase 262:  imm:0x78, result rd:x14(0x8000000000000000)
    la  x15, test_data
    addi    x15, x15,1040
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    c.ld x14, 120(x15)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x8000000000000000)

    # Testcase 263:  imm:0xf0, result rd:x15(0x0000000000000000)
    la  x8, test_data
    addi    x8, x8,1048
    li     x2, MASK_XLEN(-240)
    add    x8, x8, x2
    c.ld x15, 240(x8)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x0000000000000000)

    # Testcase 264:  imm:0xe8, result rd:x8(0xfffffffffffffffe)
    la  x9, test_data
    addi    x9, x9,0
    li     x2, MASK_XLEN(-232)
    add    x9, x9, x2
    c.ld x8, 232(x9)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffffe)





    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 265:  imm:0xd8, result rd:x9(0xfffffffffffffffd)
    la  x10, test_data
    addi    x10, x10,8
    li     x2, MASK_XLEN(-216)
    add    x10, x10, x2
    c.ld x9, 216(x10)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffffd)

    # Testcase 266:  imm:0xb8, result rd:x10(0xfffffffffffffffb)
    la  x11, test_data
    addi    x11, x11,16
    li     x2, MASK_XLEN(-184)
    add    x11, x11, x2
    c.ld x10, 184(x11)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffffb)

    # Testcase 267:  imm:0x78, result rd:x11(0xfffffffffffffff7)
    la  x12, test_data
    addi    x12, x12,24
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    c.ld x11, 120(x12)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffff7)

    # Testcase 268:  imm:0xf0, result rd:x12(0xffffffffffffffef)
    la  x13, test_data
    addi    x13, x13,32
    li     x2, MASK_XLEN(-240)
    add    x13, x13, x2
    c.ld x12, 240(x13)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffffef)

    # Testcase 269:  imm:0xe8, result rd:x13(0xffffffffffffffdf)
    la  x14, test_data
    addi    x14, x14,40
    li     x2, MASK_XLEN(-232)
    add    x14, x14, x2
    c.ld x13, 232(x14)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffffdf)





    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0xd8, result rd:x14(0xffffffffffffffbf)
    la  x15, test_data
    addi    x15, x15,48
    li     x2, MASK_XLEN(-216)
    add    x15, x15, x2
    c.ld x14, 216(x15)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffffbf)

    # Testcase 271:  imm:0xb8, result rd:x15(0xffffffffffffff7f)
    la  x8, test_data
    addi    x8, x8,56
    li     x2, MASK_XLEN(-184)
    add    x8, x8, x2
    c.ld x15, 184(x8)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffffff7f)

    # Testcase 272:  imm:0x78, result rd:x8(0xfffffffffffffeff)
    la  x9, test_data
    addi    x9, x9,64
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    c.ld x8, 120(x9)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffffeff)

    # Testcase 273:  imm:0xf0, result rd:x9(0xfffffffffffffdff)
    la  x10, test_data
    addi    x10, x10,72
    li     x2, MASK_XLEN(-240)
    add    x10, x10, x2
    c.ld x9, 240(x10)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffffdff)

    # Testcase 274:  imm:0xe8, result rd:x10(0xfffffffffffffeff)
    la  x11, test_data
    addi    x11, x11,80
    li     x2, MASK_XLEN(-232)
    add    x11, x11, x2
    c.ld x10, 232(x11)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0xd8, result rd:x11(0xfffffffffffff7ff)
    la  x12, test_data
    addi    x12, x12,88
    li     x2, MASK_XLEN(-216)
    add    x12, x12, x2
    c.ld x11, 216(x12)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffff7ff)

    # Testcase 276:  imm:0xb8, result rd:x12(0xffffffffffffefff)
    la  x13, test_data
    addi    x13, x13,96
    li     x2, MASK_XLEN(-184)
    add    x13, x13, x2
    c.ld x12, 184(x13)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffffefff)

    # Testcase 277:  imm:0x78, result rd:x13(0xffffffffffffdfff)
    la  x14, test_data
    addi    x14, x14,104
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    c.ld x13, 120(x14)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffdfff)

    # Testcase 278:  imm:0xf0, result rd:x14(0xffffffffffffefff)
    la  x15, test_data
    addi    x15, x15,112
    li     x2, MASK_XLEN(-240)
    add    x15, x15, x2
    c.ld x14, 240(x15)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffefff)

    # Testcase 279:  imm:0xe8, result rd:x15(0xffffffffffff7fff)
    la  x8, test_data
    addi    x8, x8,120
    li     x2, MASK_XLEN(-232)
    add    x8, x8, x2
    c.ld x15, 232(x8)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffff7fff)





    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0xd8, result rd:x8(0xfffffffffffeffff)
    la  x9, test_data
    addi    x9, x9,128
    li     x2, MASK_XLEN(-216)
    add    x9, x9, x2
    c.ld x8, 216(x9)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffffeffff)

    # Testcase 281:  imm:0xb8, result rd:x9(0xfffffffffffdffff)
    la  x10, test_data
    addi    x10, x10,136
    li     x2, MASK_XLEN(-184)
    add    x10, x10, x2
    c.ld x9, 184(x10)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffdffff)

    # Testcase 282:  imm:0x78, result rd:x10(0xfffffffffffbffff)
    la  x11, test_data
    addi    x11, x11,144
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    c.ld x10, 120(x11)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffbffff)

    # Testcase 283:  imm:0xf0, result rd:x11(0xfffffffffff7ffff)
    la  x12, test_data
    addi    x12, x12,152
    li     x2, MASK_XLEN(-240)
    add    x12, x12, x2
    c.ld x11, 240(x12)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffff7ffff)

    # Testcase 284:  imm:0xe8, result rd:x12(0xffffffffffefffff)
    la  x13, test_data
    addi    x13, x13,160
    li     x2, MASK_XLEN(-232)
    add    x13, x13, x2
    c.ld x12, 232(x13)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffffefffff)





    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 285:  imm:0xd8, result rd:x13(0xffffffffffdfffff)
    la  x14, test_data
    addi    x14, x14,168
    li     x2, MASK_XLEN(-216)
    add    x14, x14, x2
    c.ld x13, 216(x14)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffdfffff)

    # Testcase 286:  imm:0xb8, result rd:x14(0xffffffffffbfffff)
    la  x15, test_data
    addi    x15, x15,176
    li     x2, MASK_XLEN(-184)
    add    x15, x15, x2
    c.ld x14, 184(x15)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffbfffff)

    # Testcase 287:  imm:0x78, result rd:x15(0xffffffffff7fffff)
    la  x8, test_data
    addi    x8, x8,184
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    c.ld x15, 120(x8)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffff7fffff)

    # Testcase 288:  imm:0xf0, result rd:x8(0xfffffffffeffffff)
    la  x9, test_data
    addi    x9, x9,192
    li     x2, MASK_XLEN(-240)
    add    x9, x9, x2
    c.ld x8, 240(x9)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffffffffeffffff)

    # Testcase 289:  imm:0xe8, result rd:x9(0xfffffffffdffffff)
    la  x10, test_data
    addi    x10, x10,200
    li     x2, MASK_XLEN(-232)
    add    x10, x10, x2
    c.ld x9, 232(x10)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffdffffff)





    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0xd8, result rd:x10(0xfffffffffeffffff)
    la  x11, test_data
    addi    x11, x11,208
    li     x2, MASK_XLEN(-216)
    add    x11, x11, x2
    c.ld x10, 216(x11)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffeffffff)

    # Testcase 291:  imm:0xb8, result rd:x11(0xfffffffff7ffffff)
    la  x12, test_data
    addi    x12, x12,216
    li     x2, MASK_XLEN(-184)
    add    x12, x12, x2
    c.ld x11, 184(x12)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffff7ffffff)

    # Testcase 292:  imm:0x78, result rd:x12(0xffffffffefffffff)
    la  x13, test_data
    addi    x13, x13,224
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    c.ld x12, 120(x13)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xffffffffefffffff)

    # Testcase 293:  imm:0xf0, result rd:x13(0xffffffffdfffffff)
    la  x14, test_data
    addi    x14, x14,232
    li     x2, MASK_XLEN(-240)
    add    x14, x14, x2
    c.ld x13, 240(x14)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffdfffffff)

    # Testcase 294:  imm:0xe8, result rd:x14(0xffffffffefffffff)
    la  x15, test_data
    addi    x15, x15,240
    li     x2, MASK_XLEN(-232)
    add    x15, x15, x2
    c.ld x14, 232(x15)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 295:  imm:0xd8, result rd:x15(0xffffffff7fffffff)
    la  x8, test_data
    addi    x8, x8,248
    li     x2, MASK_XLEN(-216)
    add    x8, x8, x2
    c.ld x15, 216(x8)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffff7fffffff)


	
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

