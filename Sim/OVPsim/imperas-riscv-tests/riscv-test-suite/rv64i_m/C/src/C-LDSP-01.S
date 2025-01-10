// RISC-V Architectural Validation Test C-LDSP-01
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
// Description: Testing instruction 'c.ldsp'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.ldsp)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.ldsp)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0x38, result rd:x20(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-56)
    add    x2, x2, x3
    c.ldsp x20, 56(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffffffffffffffe)

    # Testcase 1:  imm:0x88, result rd:x29(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-136)
    add    x2, x2, x3
    c.ldsp x29, 136(x2)
    sd x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xfffffffffffffffd)

    # Testcase 2:  imm:0x28, result rd:x31(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-40)
    add    x2, x2, x3
    c.ldsp x31, 40(x2)
    sd x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xfffffffffffffffb)

    # Testcase 3:  imm:0x20, result rd:x21(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,24
    li     x3, MASK_XLEN(-32)
    add    x2, x2, x3
    c.ldsp x21, 32(x2)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfffffffffffffff7)

    # Testcase 4:  imm:0xf0, result rd:x11(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x11, 240(x2)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xffffffffffffffef)





    

    RVTEST_SIGBASE(x3,signature_2_0)

    # Testcase 5:  imm:0xf8, result rd:x4(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,40
    li     x5, MASK_XLEN(-248)
    add    x2, x2, x5
    c.ldsp x4, 248(x2)
    sd x4, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0xffffffffffffffdf)

    # Testcase 6:  imm:0x38, result rd:x1(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,48
    li     x5, MASK_XLEN(-56)
    add    x2, x2, x5
    c.ldsp x1, 56(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0xffffffffffffffbf)

    # Testcase 7:  imm:0x88, result rd:x30(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,56
    li     x5, MASK_XLEN(-136)
    add    x2, x2, x5
    c.ldsp x30, 136(x2)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x30, 0xffffffffffffff7f)

    # Testcase 8:  imm:0xa0, result rd:x6(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,64
    li     x5, MASK_XLEN(-160)
    add    x2, x2, x5
    c.ldsp x6, 160(x2)
    sd x6, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x6, 0xfffffffffffffeff)

    # Testcase 9:  imm:0x0, result rd:x14(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,72
    li     x5, MASK_XLEN(0)
    add    x2, x2, x5
    c.ldsp x14, 0(x2)
    sd x14, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x14, 0xfffffffffffffdff)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 10:  imm:0xf0, result rd:x5(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,80
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    c.ldsp x5, 240(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x5, 0xfffffffffffffeff)

    # Testcase 11:  imm:0x70, result rd:x12(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,88
    li     x4, MASK_XLEN(-112)
    add    x2, x2, x4
    c.ldsp x12, 112(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x12, 0xfffffffffffff7ff)

    # Testcase 12:  imm:0x80, result rd:x26(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,96
    li     x4, MASK_XLEN(-128)
    add    x2, x2, x4
    c.ldsp x26, 128(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x26, 0xffffffffffffefff)

    # Testcase 13:  imm:0x88, result rd:x3(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,104
    li     x4, MASK_XLEN(-136)
    add    x2, x2, x4
    c.ldsp x3, 136(x2)
    sd x3, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xffffffffffffdfff)

    # Testcase 14:  imm:0xc0, result rd:x19(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,112
    li     x4, MASK_XLEN(-192)
    add    x2, x2, x4
    c.ldsp x19, 192(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x19, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x3,signature_4_0)

    # Testcase 15:  imm:0x68, result rd:x19(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,120
    li     x4, MASK_XLEN(-104)
    add    x2, x2, x4
    c.ldsp x19, 104(x2)
    sd x19, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x19, 0xffffffffffff7fff)

    # Testcase 16:  imm:0x28, result rd:x8(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x4, MASK_XLEN(-40)
    add    x2, x2, x4
    c.ldsp x8, 40(x2)
    sd x8, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xfffffffffffeffff)

    # Testcase 17:  imm:0x8, result rd:x10(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,136
    li     x4, MASK_XLEN(-8)
    add    x2, x2, x4
    c.ldsp x10, 8(x2)
    sd x10, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xfffffffffffdffff)

    # Testcase 18:  imm:0x40, result rd:x1(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,144
    li     x4, MASK_XLEN(-64)
    add    x2, x2, x4
    c.ldsp x1, 64(x2)
    sd x1, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffffbffff)

    # Testcase 19:  imm:0xd8, result rd:x18(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,152
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    c.ldsp x18, 216(x2)
    sd x18, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffff7ffff)





    

    RVTEST_SIGBASE(x3,signature_5_0)

    # Testcase 20:  imm:0x60, result rd:x24(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,160
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.ldsp x24, 96(x2)
    sd x24, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x24, 0xffffffffffefffff)

    # Testcase 21:  imm:0xa8, result rd:x1(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,168
    li     x4, MASK_XLEN(-168)
    add    x2, x2, x4
    c.ldsp x1, 168(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffdfffff)

    # Testcase 22:  imm:0x20, result rd:x22(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,176
    li     x4, MASK_XLEN(-32)
    add    x2, x2, x4
    c.ldsp x22, 32(x2)
    sd x22, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x22, 0xffffffffffbfffff)

    # Testcase 23:  imm:0x30, result rd:x31(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,184
    li     x4, MASK_XLEN(-48)
    add    x2, x2, x4
    c.ldsp x31, 48(x2)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xffffffffff7fffff)

    # Testcase 24:  imm:0x60, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,192
    li     x4, MASK_XLEN(-96)
    add    x2, x2, x4
    c.ldsp x1, 96(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffeffffff)





    

    RVTEST_SIGBASE(x3,signature_6_0)

    # Testcase 25:  imm:0xb0, result rd:x18(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,200
    li     x4, MASK_XLEN(-176)
    add    x2, x2, x4
    c.ldsp x18, 176(x2)
    sd x18, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x18, 0xfffffffffdffffff)

    # Testcase 26:  imm:0xa0, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,208
    li     x4, MASK_XLEN(-160)
    add    x2, x2, x4
    c.ldsp x1, 160(x2)
    sd x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffeffffff)

    # Testcase 27:  imm:0xc0, result rd:x7(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,216
    li     x4, MASK_XLEN(-192)
    add    x2, x2, x4
    c.ldsp x7, 192(x2)
    sd x7, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x7, 0xfffffffff7ffffff)

    # Testcase 28:  imm:0xe0, result rd:x12(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,224
    li     x4, MASK_XLEN(-224)
    add    x2, x2, x4
    c.ldsp x12, 224(x2)
    sd x12, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x12, 0xffffffffefffffff)

    # Testcase 29:  imm:0x90, result rd:x23(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,232
    li     x4, MASK_XLEN(-144)
    add    x2, x2, x4
    c.ldsp x23, 144(x2)
    sd x23, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x23, 0xffffffffdfffffff)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 30:  imm:0x0, result rd:x10(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,240
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.ldsp x10, 0(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x10, 0xffffffffefffffff)

    # Testcase 31:  imm:0xf8, result rd:x3(0xffffffff7fffffff)
    la  x2, test_data
    addi    x2, x2,248
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    c.ldsp x3, 248(x2)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xffffffff7fffffff)

    # Testcase 32:  imm:0xf8, result rd:x8(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,256
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    c.ldsp x8, 248(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xffffffffffffffff)

    # Testcase 33:  imm:0xf8, result rd:x14(0xfffffffeffffffff)
    la  x2, test_data
    addi    x2, x2,264
    li     x4, MASK_XLEN(-248)
    add    x2, x2, x4
    c.ldsp x14, 248(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0xfffffffeffffffff)

    # Testcase 34:  imm:0x0, result rd:x8(0xfffffffdffffffff)
    la  x2, test_data
    addi    x2, x2,272
    li     x4, MASK_XLEN(0)
    add    x2, x2, x4
    c.ldsp x8, 0(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x8, 0xfffffffdffffffff)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 35:  imm:0xf8, result rd:x4(0xfffffffbffffffff)
    la  x2, test_data
    addi    x2, x2,280
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    c.ldsp x4, 248(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xfffffffbffffffff)

    # Testcase 36:  imm:0xf8, result rd:x14(0xfffffff7ffffffff)
    la  x2, test_data
    addi    x2, x2,288
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    c.ldsp x14, 248(x2)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x14, 0xfffffff7ffffffff)

    # Testcase 37:  imm:0xf8, result rd:x25(0xffffffefffffffff)
    la  x2, test_data
    addi    x2, x2,296
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    c.ldsp x25, 248(x2)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x25, 0xffffffefffffffff)

    # Testcase 38:  imm:0x0, result rd:x13(0xffffffdfffffffff)
    la  x2, test_data
    addi    x2, x2,304
    li     x3, MASK_XLEN(0)
    add    x2, x2, x3
    c.ldsp x13, 0(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x13, 0xffffffdfffffffff)

    # Testcase 39:  imm:0xf8, result rd:x4(0xffffffbfffffffff)
    la  x2, test_data
    addi    x2, x2,312
    li     x3, MASK_XLEN(-248)
    add    x2, x2, x3
    c.ldsp x4, 248(x2)
    sd x4, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xffffffbfffffffff)





    

    RVTEST_SIGBASE(x6,signature_9_0)

    # Testcase 40:  imm:0x8, result rd:x1(0xffffff7fffffffff)
    la  x2, test_data
    addi    x2, x2,320
    li     x7, MASK_XLEN(-8)
    add    x2, x2, x7
    c.ldsp x1, 8(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0xffffff7fffffffff)

    # Testcase 41:  imm:0x10, result rd:x3(0xfffffeffffffffff)
    la  x2, test_data
    addi    x2, x2,328
    li     x7, MASK_XLEN(-16)
    add    x2, x2, x7
    c.ldsp x3, 16(x2)
    sd x3, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xfffffeffffffffff)

    # Testcase 42:  imm:0x20, result rd:x3(0xfffffdffffffffff)
    la  x2, test_data
    addi    x2, x2,336
    li     x7, MASK_XLEN(-32)
    add    x2, x2, x7
    c.ldsp x3, 32(x2)
    sd x3, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xfffffdffffffffff)

    # Testcase 43:  imm:0x40, result rd:x4(0xfffffeffffffffff)
    la  x2, test_data
    addi    x2, x2,344
    li     x7, MASK_XLEN(-64)
    add    x2, x2, x7
    c.ldsp x4, 64(x2)
    sd x4, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0xfffffeffffffffff)

    # Testcase 44:  imm:0x80, result rd:x5(0xfffff7ffffffffff)
    la  x2, test_data
    addi    x2, x2,352
    li     x7, MASK_XLEN(-128)
    add    x2, x2, x7
    c.ldsp x5, 128(x2)
    sd x5, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0xfffff7ffffffffff)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 45:  imm:0xf0, result rd:x6(0xffffefffffffffff)
    la  x2, test_data
    addi    x2, x2,360
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x6, 240(x2)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0xffffefffffffffff)

    # Testcase 46:  imm:0xe8, result rd:x7(0xffffdfffffffffff)
    la  x2, test_data
    addi    x2, x2,368
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x7, 232(x2)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xffffdfffffffffff)

    # Testcase 47:  imm:0xd8, result rd:x8(0xffffefffffffffff)
    la  x2, test_data
    addi    x2, x2,376
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x8, 216(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffefffffffffff)

    # Testcase 48:  imm:0xb8, result rd:x9(0xffff7fffffffffff)
    la  x2, test_data
    addi    x2, x2,384
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x9, 184(x2)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xffff7fffffffffff)

    # Testcase 49:  imm:0x78, result rd:x10(0xfffeffffffffffff)
    la  x2, test_data
    addi    x2, x2,392
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x10, 120(x2)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffeffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 50:  imm:0xf0, result rd:x11(0xfffdffffffffffff)
    la  x2, test_data
    addi    x2, x2,400
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x11, 240(x2)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffdffffffffffff)

    # Testcase 51:  imm:0xe8, result rd:x12(0xfffbffffffffffff)
    la  x2, test_data
    addi    x2, x2,408
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x12, 232(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xfffbffffffffffff)

    # Testcase 52:  imm:0xd8, result rd:x13(0xfff7ffffffffffff)
    la  x2, test_data
    addi    x2, x2,416
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x13, 216(x2)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xfff7ffffffffffff)

    # Testcase 53:  imm:0xb8, result rd:x14(0xffefffffffffffff)
    la  x2, test_data
    addi    x2, x2,424
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x14, 184(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffefffffffffffff)

    # Testcase 54:  imm:0x78, result rd:x15(0xffdfffffffffffff)
    la  x2, test_data
    addi    x2, x2,432
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x15, 120(x2)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffdfffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 55:  imm:0xf0, result rd:x16(0xffbfffffffffffff)
    la  x2, test_data
    addi    x2, x2,440
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x16, 240(x2)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xffbfffffffffffff)

    # Testcase 56:  imm:0xe8, result rd:x17(0xff7fffffffffffff)
    la  x2, test_data
    addi    x2, x2,448
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x17, 232(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xff7fffffffffffff)

    # Testcase 57:  imm:0xd8, result rd:x18(0xfeffffffffffffff)
    la  x2, test_data
    addi    x2, x2,456
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x18, 216(x2)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfeffffffffffffff)

    # Testcase 58:  imm:0xb8, result rd:x19(0xfdffffffffffffff)
    la  x2, test_data
    addi    x2, x2,464
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x19, 184(x2)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfdffffffffffffff)

    # Testcase 59:  imm:0x78, result rd:x20(0xfeffffffffffffff)
    la  x2, test_data
    addi    x2, x2,472
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x20, 120(x2)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfeffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 60:  imm:0xf0, result rd:x21(0xf7ffffffffffffff)
    la  x2, test_data
    addi    x2, x2,480
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x21, 240(x2)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xf7ffffffffffffff)

    # Testcase 61:  imm:0xe8, result rd:x22(0xefffffffffffffff)
    la  x2, test_data
    addi    x2, x2,488
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x22, 232(x2)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xefffffffffffffff)

    # Testcase 62:  imm:0xd8, result rd:x23(0xdfffffffffffffff)
    la  x2, test_data
    addi    x2, x2,496
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x23, 216(x2)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xdfffffffffffffff)

    # Testcase 63:  imm:0xb8, result rd:x24(0xefffffffffffffff)
    la  x2, test_data
    addi    x2, x2,504
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x24, 184(x2)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xefffffffffffffff)

    # Testcase 64:  imm:0x78, result rd:x25(0x7fffffffffffffff)
    la  x2, test_data
    addi    x2, x2,512
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x25, 120(x2)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x7fffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Testcase 65:  imm:0xf0, result rd:x26(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,520
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x26, 240(x2)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xffffffffffffffff)

    # Testcase 66:  imm:0xe8, result rd:x27(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,528
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x27, 232(x2)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000000000001)

    # Testcase 67:  imm:0xd8, result rd:x28(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,536
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x28, 216(x2)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000000000002)

    # Testcase 68:  imm:0xb8, result rd:x29(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,544
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x29, 184(x2)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000000000004)

    # Testcase 69:  imm:0x78, result rd:x30(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,552
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x30, 120(x2)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0000000000000008)





    

    RVTEST_SIGBASE(x5,signature_15_0)

    # Testcase 70:  imm:0xf0, result rd:x31(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,560
    li     x6, MASK_XLEN(-240)
    add    x2, x2, x6
    c.ldsp x31, 240(x2)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0x0000000000000010)

    # Testcase 71:  imm:0xe8, result rd:x1(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,568
    li     x6, MASK_XLEN(-232)
    add    x2, x2, x6
    c.ldsp x1, 232(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x0000000000000020)

    # Testcase 72:  imm:0xd8, result rd:x3(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,576
    li     x6, MASK_XLEN(-216)
    add    x2, x2, x6
    c.ldsp x3, 216(x2)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000000040)

    # Testcase 73:  imm:0xb8, result rd:x3(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,584
    li     x6, MASK_XLEN(-184)
    add    x2, x2, x6
    c.ldsp x3, 184(x2)
    sd x3, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000000000080)

    # Testcase 74:  imm:0x78, result rd:x4(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,592
    li     x6, MASK_XLEN(-120)
    add    x2, x2, x6
    c.ldsp x4, 120(x2)
    sd x4, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x0000000000000100)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 75:  imm:0xf0, result rd:x5(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,600
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x5, 240(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000200)

    # Testcase 76:  imm:0xe8, result rd:x6(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,608
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x6, 232(x2)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000000000400)

    # Testcase 77:  imm:0xd8, result rd:x7(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,616
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x7, 216(x2)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000000000800)

    # Testcase 78:  imm:0xb8, result rd:x8(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,624
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x8, 184(x2)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000000001000)

    # Testcase 79:  imm:0x78, result rd:x9(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,632
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x9, 120(x2)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000002000)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 80:  imm:0xf0, result rd:x10(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,640
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x10, 240(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000004000)

    # Testcase 81:  imm:0xe8, result rd:x11(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,648
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x11, 232(x2)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000008000)

    # Testcase 82:  imm:0xd8, result rd:x12(0x0000000000010000)
    la  x2, test_data
    addi    x2, x2,656
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x12, 216(x2)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000010000)

    # Testcase 83:  imm:0xb8, result rd:x13(0x0000000000020000)
    la  x2, test_data
    addi    x2, x2,664
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x13, 184(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000020000)

    # Testcase 84:  imm:0x78, result rd:x14(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,672
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x14, 120(x2)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000040000)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 85:  imm:0xf0, result rd:x15(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,680
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x15, 240(x2)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000080000)

    # Testcase 86:  imm:0xe8, result rd:x16(0x0000000000100000)
    la  x2, test_data
    addi    x2, x2,688
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x16, 232(x2)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000100000)

    # Testcase 87:  imm:0xd8, result rd:x17(0x0000000000200000)
    la  x2, test_data
    addi    x2, x2,696
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x17, 216(x2)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000200000)

    # Testcase 88:  imm:0xb8, result rd:x18(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,704
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x18, 184(x2)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000400000)

    # Testcase 89:  imm:0x78, result rd:x19(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,712
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x19, 120(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000800000)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 90:  imm:0xf0, result rd:x20(0x0000000001000000)
    la  x2, test_data
    addi    x2, x2,720
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x20, 240(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000001000000)

    # Testcase 91:  imm:0xe8, result rd:x21(0x0000000002000000)
    la  x2, test_data
    addi    x2, x2,728
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x21, 232(x2)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000002000000)

    # Testcase 92:  imm:0xd8, result rd:x22(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,736
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x22, 216(x2)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000004000000)

    # Testcase 93:  imm:0xb8, result rd:x23(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,744
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x23, 184(x2)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000008000000)

    # Testcase 94:  imm:0x78, result rd:x24(0x0000000010000000)
    la  x2, test_data
    addi    x2, x2,752
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x24, 120(x2)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000010000000)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 95:  imm:0xf0, result rd:x25(0x0000000020000000)
    la  x2, test_data
    addi    x2, x2,760
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x25, 240(x2)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0000000020000000)

    # Testcase 96:  imm:0xe8, result rd:x26(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,768
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x26, 232(x2)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000040000000)

    # Testcase 97:  imm:0xd8, result rd:x27(0x0000000080000000)
    la  x2, test_data
    addi    x2, x2,776
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x27, 216(x2)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000080000000)

    # Testcase 98:  imm:0xb8, result rd:x28(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,784
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x28, 184(x2)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000000000000)

    # Testcase 99:  imm:0x78, result rd:x29(0x0000000100000000)
    la  x2, test_data
    addi    x2, x2,792
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x29, 120(x2)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000100000000)





    

    RVTEST_SIGBASE(x4,signature_21_0)

    # Testcase 100:  imm:0xf0, result rd:x30(0x0000000200000000)
    la  x2, test_data
    addi    x2, x2,800
    li     x5, MASK_XLEN(-240)
    add    x2, x2, x5
    c.ldsp x30, 240(x2)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000200000000)

    # Testcase 101:  imm:0xe8, result rd:x31(0x0000000400000000)
    la  x2, test_data
    addi    x2, x2,808
    li     x5, MASK_XLEN(-232)
    add    x2, x2, x5
    c.ldsp x31, 232(x2)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0000000400000000)

    # Testcase 102:  imm:0xd8, result rd:x1(0x0000000800000000)
    la  x2, test_data
    addi    x2, x2,816
    li     x5, MASK_XLEN(-216)
    add    x2, x2, x5
    c.ldsp x1, 216(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0000000800000000)

    # Testcase 103:  imm:0xb8, result rd:x3(0x0000001000000000)
    la  x2, test_data
    addi    x2, x2,824
    li     x5, MASK_XLEN(-184)
    add    x2, x2, x5
    c.ldsp x3, 184(x2)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000001000000000)

    # Testcase 104:  imm:0x78, result rd:x3(0x0000002000000000)
    la  x2, test_data
    addi    x2, x2,832
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.ldsp x3, 120(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0000002000000000)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 105:  imm:0xf0, result rd:x4(0x0000004000000000)
    la  x2, test_data
    addi    x2, x2,840
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x4, 240(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x0000004000000000)

    # Testcase 106:  imm:0xe8, result rd:x5(0x0000008000000000)
    la  x2, test_data
    addi    x2, x2,848
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x5, 232(x2)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x0000008000000000)

    # Testcase 107:  imm:0xd8, result rd:x6(0x0000010000000000)
    la  x2, test_data
    addi    x2, x2,856
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x6, 216(x2)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x0000010000000000)

    # Testcase 108:  imm:0xb8, result rd:x7(0x0000020000000000)
    la  x2, test_data
    addi    x2, x2,864
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x7, 184(x2)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000020000000000)

    # Testcase 109:  imm:0x78, result rd:x8(0x0000040000000000)
    la  x2, test_data
    addi    x2, x2,872
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x8, 120(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x8, 0x0000040000000000)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 110:  imm:0xf0, result rd:x9(0x0000080000000000)
    la  x2, test_data
    addi    x2, x2,880
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x9, 240(x2)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000080000000000)

    # Testcase 111:  imm:0xe8, result rd:x10(0x0000100000000000)
    la  x2, test_data
    addi    x2, x2,888
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x10, 232(x2)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000100000000000)

    # Testcase 112:  imm:0xd8, result rd:x11(0x0000200000000000)
    la  x2, test_data
    addi    x2, x2,896
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x11, 216(x2)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000200000000000)

    # Testcase 113:  imm:0xb8, result rd:x12(0x0000400000000000)
    la  x2, test_data
    addi    x2, x2,904
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x12, 184(x2)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000400000000000)

    # Testcase 114:  imm:0x78, result rd:x13(0x0000800000000000)
    la  x2, test_data
    addi    x2, x2,912
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x13, 120(x2)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000800000000000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 115:  imm:0xf0, result rd:x14(0x0001000000000000)
    la  x2, test_data
    addi    x2, x2,920
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x14, 240(x2)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0001000000000000)

    # Testcase 116:  imm:0xe8, result rd:x15(0x0002000000000000)
    la  x2, test_data
    addi    x2, x2,928
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x15, 232(x2)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0002000000000000)

    # Testcase 117:  imm:0xd8, result rd:x16(0x0004000000000000)
    la  x2, test_data
    addi    x2, x2,936
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x16, 216(x2)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0004000000000000)

    # Testcase 118:  imm:0xb8, result rd:x17(0x0008000000000000)
    la  x2, test_data
    addi    x2, x2,944
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x17, 184(x2)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0008000000000000)

    # Testcase 119:  imm:0x78, result rd:x18(0x0010000000000000)
    la  x2, test_data
    addi    x2, x2,952
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x18, 120(x2)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0010000000000000)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Testcase 120:  imm:0xf0, result rd:x19(0x0020000000000000)
    la  x2, test_data
    addi    x2, x2,960
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x19, 240(x2)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0020000000000000)

    # Testcase 121:  imm:0xe8, result rd:x20(0x0040000000000000)
    la  x2, test_data
    addi    x2, x2,968
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x20, 232(x2)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0040000000000000)

    # Testcase 122:  imm:0xd8, result rd:x21(0x0080000000000000)
    la  x2, test_data
    addi    x2, x2,976
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x21, 216(x2)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0080000000000000)

    # Testcase 123:  imm:0xb8, result rd:x22(0x0100000000000000)
    la  x2, test_data
    addi    x2, x2,984
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x22, 184(x2)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0100000000000000)

    # Testcase 124:  imm:0x78, result rd:x23(0x0200000000000000)
    la  x2, test_data
    addi    x2, x2,992
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x23, 120(x2)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0200000000000000)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 125:  imm:0xf0, result rd:x24(0x0400000000000000)
    la  x2, test_data
    addi    x2, x2,1000
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x24, 240(x2)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0400000000000000)

    # Testcase 126:  imm:0xe8, result rd:x25(0x0800000000000000)
    la  x2, test_data
    addi    x2, x2,1008
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x25, 232(x2)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0800000000000000)

    # Testcase 127:  imm:0xd8, result rd:x26(0x1000000000000000)
    la  x2, test_data
    addi    x2, x2,1016
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x26, 216(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x1000000000000000)

    # Testcase 128:  imm:0xb8, result rd:x27(0x2000000000000000)
    la  x2, test_data
    addi    x2, x2,1024
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x27, 184(x2)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x2000000000000000)

    # Testcase 129:  imm:0x78, result rd:x28(0x4000000000000000)
    la  x2, test_data
    addi    x2, x2,1032
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x28, 120(x2)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x4000000000000000)





    

    RVTEST_SIGBASE(x4,signature_27_0)

    # Testcase 130:  imm:0xf0, result rd:x29(0x8000000000000000)
    la  x2, test_data
    addi    x2, x2,1040
    li     x5, MASK_XLEN(-240)
    add    x2, x2, x5
    c.ldsp x29, 240(x2)
    sd x29, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0x8000000000000000)

    # Testcase 131:  imm:0xe8, result rd:x30(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,1048
    li     x5, MASK_XLEN(-232)
    add    x2, x2, x5
    c.ldsp x30, 232(x2)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0000000000000000)

    # Testcase 132:  imm:0xd8, result rd:x31(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x5, MASK_XLEN(-216)
    add    x2, x2, x5
    c.ldsp x31, 216(x2)
    sd x31, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0xfffffffffffffffe)

    # Testcase 133:  imm:0xb8, result rd:x1(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,8
    li     x5, MASK_XLEN(-184)
    add    x2, x2, x5
    c.ldsp x1, 184(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffffffffd)

    # Testcase 134:  imm:0x78, result rd:x3(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,16
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.ldsp x3, 120(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffffffffffb)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 135:  imm:0xf0, result rd:x3(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,24
    li     x8, MASK_XLEN(-240)
    add    x2, x2, x8
    c.ldsp x3, 240(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffffffffffff7)

    # Testcase 136:  imm:0xe8, result rd:x4(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,32
    li     x8, MASK_XLEN(-232)
    add    x2, x2, x8
    c.ldsp x4, 232(x2)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xffffffffffffffef)

    # Testcase 137:  imm:0xd8, result rd:x5(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,40
    li     x8, MASK_XLEN(-216)
    add    x2, x2, x8
    c.ldsp x5, 216(x2)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffffffffffdf)

    # Testcase 138:  imm:0xb8, result rd:x6(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,48
    li     x8, MASK_XLEN(-184)
    add    x2, x2, x8
    c.ldsp x6, 184(x2)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffffffffffbf)

    # Testcase 139:  imm:0x78, result rd:x7(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,56
    li     x8, MASK_XLEN(-120)
    add    x2, x2, x8
    c.ldsp x7, 120(x2)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0xffffffffffffff7f)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 140:  imm:0xf0, result rd:x8(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x8, 240(x2)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xfffffffffffffeff)

    # Testcase 141:  imm:0xe8, result rd:x9(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x9, 232(x2)
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xfffffffffffffdff)

    # Testcase 142:  imm:0xd8, result rd:x10(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x10, 216(x2)
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffffffffffeff)

    # Testcase 143:  imm:0xb8, result rd:x11(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x11, 184(x2)
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffffffffffff7ff)

    # Testcase 144:  imm:0x78, result rd:x12(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x12, 120(x2)
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xffffffffffffefff)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 145:  imm:0xf0, result rd:x13(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x13, 240(x2)
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xffffffffffffdfff)

    # Testcase 146:  imm:0xe8, result rd:x14(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,112
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x14, 232(x2)
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffffffffffefff)

    # Testcase 147:  imm:0xd8, result rd:x15(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,120
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x15, 216(x2)
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffffffffffff7fff)

    # Testcase 148:  imm:0xb8, result rd:x16(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x16, 184(x2)
    sd x16, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xfffffffffffeffff)

    # Testcase 149:  imm:0x78, result rd:x17(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,136
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x17, 120(x2)
    sd x17, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xfffffffffffdffff)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 150:  imm:0xf0, result rd:x18(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,144
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x18, 240(x2)
    sd x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffffffffffbffff)

    # Testcase 151:  imm:0xe8, result rd:x19(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x19, 232(x2)
    sd x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffff7ffff)

    # Testcase 152:  imm:0xd8, result rd:x20(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x20, 216(x2)
    sd x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xffffffffffefffff)

    # Testcase 153:  imm:0xb8, result rd:x21(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,168
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x21, 184(x2)
    sd x21, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xffffffffffdfffff)

    # Testcase 154:  imm:0x78, result rd:x22(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,176
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x22, 120(x2)
    sd x22, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffffffffffbfffff)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 155:  imm:0xf0, result rd:x23(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,184
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x23, 240(x2)
    sd x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xffffffffff7fffff)

    # Testcase 156:  imm:0xe8, result rd:x24(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,192
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x24, 232(x2)
    sd x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xfffffffffeffffff)

    # Testcase 157:  imm:0xd8, result rd:x25(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,200
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x25, 216(x2)
    sd x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xfffffffffdffffff)

    # Testcase 158:  imm:0xb8, result rd:x26(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,208
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x26, 184(x2)
    sd x26, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfffffffffeffffff)

    # Testcase 159:  imm:0x78, result rd:x27(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,216
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x27, 120(x2)
    sd x27, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffff7ffffff)





    

    RVTEST_SIGBASE(x3,signature_33_0)

    # Testcase 160:  imm:0xf0, result rd:x28(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,224
    li     x4, MASK_XLEN(-240)
    add    x2, x2, x4
    c.ldsp x28, 240(x2)
    sd x28, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x28, 0xffffffffefffffff)

    # Testcase 161:  imm:0xe8, result rd:x29(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,232
    li     x4, MASK_XLEN(-232)
    add    x2, x2, x4
    c.ldsp x29, 232(x2)
    sd x29, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x29, 0xffffffffdfffffff)

    # Testcase 162:  imm:0xd8, result rd:x30(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,240
    li     x4, MASK_XLEN(-216)
    add    x2, x2, x4
    c.ldsp x30, 216(x2)
    sd x30, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x30, 0xffffffffefffffff)

    # Testcase 163:  imm:0xb8, result rd:x31(0xffffffff7fffffff)
    la  x2, test_data
    addi    x2, x2,248
    li     x4, MASK_XLEN(-184)
    add    x2, x2, x4
    c.ldsp x31, 184(x2)
    sd x31, 24(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x31, 0xffffffff7fffffff)

    # Testcase 164:  imm:0x78, result rd:x1(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,256
    li     x4, MASK_XLEN(-120)
    add    x2, x2, x4
    c.ldsp x1, 120(x2)
    sd x1, 32(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xffffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 165:  imm:0xf0, result rd:x3(0xfffffffeffffffff)
    la  x2, test_data
    addi    x2, x2,264
    li     x7, MASK_XLEN(-240)
    add    x2, x2, x7
    c.ldsp x3, 240(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xfffffffeffffffff)

    # Testcase 166:  imm:0xe8, result rd:x3(0xfffffffdffffffff)
    la  x2, test_data
    addi    x2, x2,272
    li     x7, MASK_XLEN(-232)
    add    x2, x2, x7
    c.ldsp x3, 232(x2)
    sd x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xfffffffdffffffff)

    # Testcase 167:  imm:0xd8, result rd:x4(0xfffffffbffffffff)
    la  x2, test_data
    addi    x2, x2,280
    li     x7, MASK_XLEN(-216)
    add    x2, x2, x7
    c.ldsp x4, 216(x2)
    sd x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0xfffffffbffffffff)

    # Testcase 168:  imm:0x8, result rd:x5(0xfffffff7ffffffff)
    la  x2, test_data
    addi    x2, x2,288
    li     x7, MASK_XLEN(-8)
    add    x2, x2, x7
    c.ldsp x5, 8(x2)
    sd x5, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0xfffffff7ffffffff)

    # Testcase 169:  imm:0x10, result rd:x6(0xffffffefffffffff)
    la  x2, test_data
    addi    x2, x2,296
    li     x7, MASK_XLEN(-16)
    add    x2, x2, x7
    c.ldsp x6, 16(x2)
    sd x6, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x6, 0xffffffefffffffff)





    

    RVTEST_SIGBASE(x1,signature_35_0)

    # Testcase 170:  imm:0x20, result rd:x7(0xffffffdfffffffff)
    la  x2, test_data
    addi    x2, x2,304
    li     x3, MASK_XLEN(-32)
    add    x2, x2, x3
    c.ldsp x7, 32(x2)
    sd x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0xffffffdfffffffff)

    # Testcase 171:  imm:0x40, result rd:x8(0xffffffbfffffffff)
    la  x2, test_data
    addi    x2, x2,312
    li     x3, MASK_XLEN(-64)
    add    x2, x2, x3
    c.ldsp x8, 64(x2)
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffffbfffffffff)

    # Testcase 172:  imm:0x80, result rd:x9(0xffffff7fffffffff)
    la  x2, test_data
    addi    x2, x2,320
    li     x3, MASK_XLEN(-128)
    add    x2, x2, x3
    c.ldsp x9, 128(x2)
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xffffff7fffffffff)

    # Testcase 173:  imm:0xf0, result rd:x10(0xfffffeffffffffff)
    la  x2, test_data
    addi    x2, x2,328
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x10, 240(x2)
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffeffffffffff)

    # Testcase 174:  imm:0xe8, result rd:x11(0xfffffdffffffffff)
    la  x2, test_data
    addi    x2, x2,336
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x11, 232(x2)
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffffdffffffffff)





    

    RVTEST_SIGBASE(x1,signature_36_0)

    # Testcase 175:  imm:0xd8, result rd:x12(0xfffffeffffffffff)
    la  x2, test_data
    addi    x2, x2,344
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x12, 216(x2)
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xfffffeffffffffff)

    # Testcase 176:  imm:0xb8, result rd:x13(0xfffff7ffffffffff)
    la  x2, test_data
    addi    x2, x2,352
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x13, 184(x2)
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xfffff7ffffffffff)

    # Testcase 177:  imm:0x78, result rd:x14(0xffffefffffffffff)
    la  x2, test_data
    addi    x2, x2,360
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x14, 120(x2)
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffefffffffffff)

    # Testcase 178:  imm:0xf0, result rd:x15(0xffffdfffffffffff)
    la  x2, test_data
    addi    x2, x2,368
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x15, 240(x2)
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffffdfffffffffff)

    # Testcase 179:  imm:0xe8, result rd:x16(0xffffefffffffffff)
    la  x2, test_data
    addi    x2, x2,376
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x16, 232(x2)
    sd x16, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xffffefffffffffff)





    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 180:  imm:0xd8, result rd:x17(0xffff7fffffffffff)
    la  x2, test_data
    addi    x2, x2,384
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x17, 216(x2)
    sd x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xffff7fffffffffff)

    # Testcase 181:  imm:0xb8, result rd:x18(0xfffeffffffffffff)
    la  x2, test_data
    addi    x2, x2,392
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x18, 184(x2)
    sd x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffeffffffffffff)

    # Testcase 182:  imm:0x78, result rd:x19(0xfffdffffffffffff)
    la  x2, test_data
    addi    x2, x2,400
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x19, 120(x2)
    sd x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffdffffffffffff)

    # Testcase 183:  imm:0xf0, result rd:x20(0xfffbffffffffffff)
    la  x2, test_data
    addi    x2, x2,408
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x20, 240(x2)
    sd x20, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xfffbffffffffffff)

    # Testcase 184:  imm:0xe8, result rd:x21(0xfff7ffffffffffff)
    la  x2, test_data
    addi    x2, x2,416
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x21, 232(x2)
    sd x21, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xfff7ffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 185:  imm:0xd8, result rd:x22(0xffefffffffffffff)
    la  x2, test_data
    addi    x2, x2,424
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x22, 216(x2)
    sd x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffefffffffffffff)

    # Testcase 186:  imm:0xb8, result rd:x23(0xffdfffffffffffff)
    la  x2, test_data
    addi    x2, x2,432
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x23, 184(x2)
    sd x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xffdfffffffffffff)

    # Testcase 187:  imm:0x78, result rd:x24(0xffbfffffffffffff)
    la  x2, test_data
    addi    x2, x2,440
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x24, 120(x2)
    sd x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xffbfffffffffffff)

    # Testcase 188:  imm:0xf0, result rd:x25(0xff7fffffffffffff)
    la  x2, test_data
    addi    x2, x2,448
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x25, 240(x2)
    sd x25, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xff7fffffffffffff)

    # Testcase 189:  imm:0xe8, result rd:x26(0xfeffffffffffffff)
    la  x2, test_data
    addi    x2, x2,456
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x26, 232(x2)
    sd x26, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfeffffffffffffff)





    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 190:  imm:0xd8, result rd:x27(0xfdffffffffffffff)
    la  x2, test_data
    addi    x2, x2,464
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x27, 216(x2)
    sd x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfdffffffffffffff)

    # Testcase 191:  imm:0xb8, result rd:x28(0xfeffffffffffffff)
    la  x2, test_data
    addi    x2, x2,472
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x28, 184(x2)
    sd x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xfeffffffffffffff)

    # Testcase 192:  imm:0x78, result rd:x29(0xf7ffffffffffffff)
    la  x2, test_data
    addi    x2, x2,480
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x29, 120(x2)
    sd x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0xf7ffffffffffffff)

    # Testcase 193:  imm:0xf0, result rd:x30(0xefffffffffffffff)
    la  x2, test_data
    addi    x2, x2,488
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x30, 240(x2)
    sd x30, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0xefffffffffffffff)

    # Testcase 194:  imm:0xe8, result rd:x31(0xdfffffffffffffff)
    la  x2, test_data
    addi    x2, x2,496
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x31, 232(x2)
    sd x31, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x31, 0xdfffffffffffffff)





    

    RVTEST_SIGBASE(x6,signature_40_0)

    # Testcase 195:  imm:0xd8, result rd:x1(0xefffffffffffffff)
    la  x2, test_data
    addi    x2, x2,504
    li     x7, MASK_XLEN(-216)
    add    x2, x2, x7
    c.ldsp x1, 216(x2)
    sd x1, 0(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x1, 0xefffffffffffffff)

    # Testcase 196:  imm:0xb8, result rd:x3(0x7fffffffffffffff)
    la  x2, test_data
    addi    x2, x2,512
    li     x7, MASK_XLEN(-184)
    add    x2, x2, x7
    c.ldsp x3, 184(x2)
    sd x3, 8(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0x7fffffffffffffff)

    # Testcase 197:  imm:0x78, result rd:x3(0xffffffffffffffff)
    la  x2, test_data
    addi    x2, x2,520
    li     x7, MASK_XLEN(-120)
    add    x2, x2, x7
    c.ldsp x3, 120(x2)
    sd x3, 16(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x3, 0xffffffffffffffff)

    # Testcase 198:  imm:0xf0, result rd:x4(0x0000000000000001)
    la  x2, test_data
    addi    x2, x2,528
    li     x7, MASK_XLEN(-240)
    add    x2, x2, x7
    c.ldsp x4, 240(x2)
    sd x4, 24(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x4, 0x0000000000000001)

    # Testcase 199:  imm:0xe8, result rd:x5(0x0000000000000002)
    la  x2, test_data
    addi    x2, x2,536
    li     x7, MASK_XLEN(-232)
    add    x2, x2, x7
    c.ldsp x5, 232(x2)
    sd x5, 32(x6)
    RVMODEL_IO_ASSERT_GPR_EQ(x8, x5, 0x0000000000000002)





    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 200:  imm:0xd8, result rd:x6(0x0000000000000004)
    la  x2, test_data
    addi    x2, x2,544
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x6, 216(x2)
    sd x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000000000004)

    # Testcase 201:  imm:0xb8, result rd:x7(0x0000000000000008)
    la  x2, test_data
    addi    x2, x2,552
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x7, 184(x2)
    sd x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000000000008)

    # Testcase 202:  imm:0x78, result rd:x8(0x0000000000000010)
    la  x2, test_data
    addi    x2, x2,560
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x8, 120(x2)
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000000000010)

    # Testcase 203:  imm:0xf0, result rd:x9(0x0000000000000020)
    la  x2, test_data
    addi    x2, x2,568
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x9, 240(x2)
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000000000020)

    # Testcase 204:  imm:0xe8, result rd:x10(0x0000000000000040)
    la  x2, test_data
    addi    x2, x2,576
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x10, 232(x2)
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000000000000040)





    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 205:  imm:0xd8, result rd:x11(0x0000000000000080)
    la  x2, test_data
    addi    x2, x2,584
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x11, 216(x2)
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000000000000080)

    # Testcase 206:  imm:0xb8, result rd:x12(0x0000000000000100)
    la  x2, test_data
    addi    x2, x2,592
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x12, 184(x2)
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000000000000100)

    # Testcase 207:  imm:0x78, result rd:x13(0x0000000000000200)
    la  x2, test_data
    addi    x2, x2,600
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x13, 120(x2)
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000000000000200)

    # Testcase 208:  imm:0xf0, result rd:x14(0x0000000000000400)
    la  x2, test_data
    addi    x2, x2,608
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x14, 240(x2)
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000000000000400)

    # Testcase 209:  imm:0xe8, result rd:x15(0x0000000000000800)
    la  x2, test_data
    addi    x2, x2,616
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x15, 232(x2)
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000000000000800)





    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 210:  imm:0xd8, result rd:x16(0x0000000000001000)
    la  x2, test_data
    addi    x2, x2,624
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x16, 216(x2)
    sd x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000000000001000)

    # Testcase 211:  imm:0xb8, result rd:x17(0x0000000000002000)
    la  x2, test_data
    addi    x2, x2,632
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x17, 184(x2)
    sd x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000000000002000)

    # Testcase 212:  imm:0x78, result rd:x18(0x0000000000004000)
    la  x2, test_data
    addi    x2, x2,640
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x18, 120(x2)
    sd x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000000000004000)

    # Testcase 213:  imm:0xf0, result rd:x19(0x0000000000008000)
    la  x2, test_data
    addi    x2, x2,648
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x19, 240(x2)
    sd x19, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000000000008000)

    # Testcase 214:  imm:0xe8, result rd:x20(0x0000000000010000)
    la  x2, test_data
    addi    x2, x2,656
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x20, 232(x2)
    sd x20, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000000000010000)





    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 215:  imm:0xd8, result rd:x21(0x0000000000020000)
    la  x2, test_data
    addi    x2, x2,664
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x21, 216(x2)
    sd x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000000000020000)

    # Testcase 216:  imm:0xb8, result rd:x22(0x0000000000040000)
    la  x2, test_data
    addi    x2, x2,672
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x22, 184(x2)
    sd x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0000000000040000)

    # Testcase 217:  imm:0x78, result rd:x23(0x0000000000080000)
    la  x2, test_data
    addi    x2, x2,680
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x23, 120(x2)
    sd x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0000000000080000)

    # Testcase 218:  imm:0xf0, result rd:x24(0x0000000000100000)
    la  x2, test_data
    addi    x2, x2,688
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x24, 240(x2)
    sd x24, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0000000000100000)

    # Testcase 219:  imm:0xe8, result rd:x25(0x0000000000200000)
    la  x2, test_data
    addi    x2, x2,696
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x25, 232(x2)
    sd x25, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0000000000200000)





    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 220:  imm:0xd8, result rd:x26(0x0000000000400000)
    la  x2, test_data
    addi    x2, x2,704
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x26, 216(x2)
    sd x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0000000000400000)

    # Testcase 221:  imm:0xb8, result rd:x27(0x0000000000800000)
    la  x2, test_data
    addi    x2, x2,712
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x27, 184(x2)
    sd x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0000000000800000)

    # Testcase 222:  imm:0x78, result rd:x28(0x0000000001000000)
    la  x2, test_data
    addi    x2, x2,720
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x28, 120(x2)
    sd x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0000000001000000)

    # Testcase 223:  imm:0xf0, result rd:x29(0x0000000002000000)
    la  x2, test_data
    addi    x2, x2,728
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x29, 240(x2)
    sd x29, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0000000002000000)

    # Testcase 224:  imm:0xe8, result rd:x30(0x0000000004000000)
    la  x2, test_data
    addi    x2, x2,736
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x30, 232(x2)
    sd x30, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x30, 0x0000000004000000)





    

    RVTEST_SIGBASE(x5,signature_46_0)

    # Testcase 225:  imm:0xd8, result rd:x31(0x0000000008000000)
    la  x2, test_data
    addi    x2, x2,744
    li     x6, MASK_XLEN(-216)
    add    x2, x2, x6
    c.ldsp x31, 216(x2)
    sd x31, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x31, 0x0000000008000000)

    # Testcase 226:  imm:0xb8, result rd:x1(0x0000000010000000)
    la  x2, test_data
    addi    x2, x2,752
    li     x6, MASK_XLEN(-184)
    add    x2, x2, x6
    c.ldsp x1, 184(x2)
    sd x1, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x1, 0x0000000010000000)

    # Testcase 227:  imm:0x78, result rd:x3(0x0000000020000000)
    la  x2, test_data
    addi    x2, x2,760
    li     x6, MASK_XLEN(-120)
    add    x2, x2, x6
    c.ldsp x3, 120(x2)
    sd x3, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000020000000)

    # Testcase 228:  imm:0xf0, result rd:x3(0x0000000040000000)
    la  x2, test_data
    addi    x2, x2,768
    li     x6, MASK_XLEN(-240)
    add    x2, x2, x6
    c.ldsp x3, 240(x2)
    sd x3, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x3, 0x0000000040000000)

    # Testcase 229:  imm:0xe8, result rd:x4(0x0000000080000000)
    la  x2, test_data
    addi    x2, x2,776
    li     x6, MASK_XLEN(-232)
    add    x2, x2, x6
    c.ldsp x4, 232(x2)
    sd x4, 32(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x4, 0x0000000080000000)





    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 230:  imm:0xd8, result rd:x5(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,784
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x5, 216(x2)
    sd x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x5, 0x0000000000000000)

    # Testcase 231:  imm:0xb8, result rd:x6(0x0000000100000000)
    la  x2, test_data
    addi    x2, x2,792
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x6, 184(x2)
    sd x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x6, 0x0000000100000000)

    # Testcase 232:  imm:0x78, result rd:x7(0x0000000200000000)
    la  x2, test_data
    addi    x2, x2,800
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x7, 120(x2)
    sd x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x7, 0x0000000200000000)

    # Testcase 233:  imm:0xf0, result rd:x8(0x0000000400000000)
    la  x2, test_data
    addi    x2, x2,808
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x8, 240(x2)
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0x0000000400000000)

    # Testcase 234:  imm:0xe8, result rd:x9(0x0000000800000000)
    la  x2, test_data
    addi    x2, x2,816
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x9, 232(x2)
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0x0000000800000000)





    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 235:  imm:0xd8, result rd:x10(0x0000001000000000)
    la  x2, test_data
    addi    x2, x2,824
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x10, 216(x2)
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0x0000001000000000)

    # Testcase 236:  imm:0xb8, result rd:x11(0x0000002000000000)
    la  x2, test_data
    addi    x2, x2,832
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x11, 184(x2)
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0x0000002000000000)

    # Testcase 237:  imm:0x78, result rd:x12(0x0000004000000000)
    la  x2, test_data
    addi    x2, x2,840
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x12, 120(x2)
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0x0000004000000000)

    # Testcase 238:  imm:0xf0, result rd:x13(0x0000008000000000)
    la  x2, test_data
    addi    x2, x2,848
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x13, 240(x2)
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0x0000008000000000)

    # Testcase 239:  imm:0xe8, result rd:x14(0x0000010000000000)
    la  x2, test_data
    addi    x2, x2,856
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x14, 232(x2)
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0x0000010000000000)





    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 240:  imm:0xd8, result rd:x15(0x0000020000000000)
    la  x2, test_data
    addi    x2, x2,864
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x15, 216(x2)
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0x0000020000000000)

    # Testcase 241:  imm:0xb8, result rd:x16(0x0000040000000000)
    la  x2, test_data
    addi    x2, x2,872
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x16, 184(x2)
    sd x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0x0000040000000000)

    # Testcase 242:  imm:0x78, result rd:x17(0x0000080000000000)
    la  x2, test_data
    addi    x2, x2,880
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x17, 120(x2)
    sd x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0x0000080000000000)

    # Testcase 243:  imm:0xf0, result rd:x18(0x0000100000000000)
    la  x2, test_data
    addi    x2, x2,888
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x18, 240(x2)
    sd x18, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0x0000100000000000)

    # Testcase 244:  imm:0xe8, result rd:x19(0x0000200000000000)
    la  x2, test_data
    addi    x2, x2,896
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x19, 232(x2)
    sd x19, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0x0000200000000000)





    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 245:  imm:0xd8, result rd:x20(0x0000400000000000)
    la  x2, test_data
    addi    x2, x2,904
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x20, 216(x2)
    sd x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0x0000400000000000)

    # Testcase 246:  imm:0xb8, result rd:x21(0x0000800000000000)
    la  x2, test_data
    addi    x2, x2,912
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x21, 184(x2)
    sd x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0x0000800000000000)

    # Testcase 247:  imm:0x78, result rd:x22(0x0001000000000000)
    la  x2, test_data
    addi    x2, x2,920
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x22, 120(x2)
    sd x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0x0001000000000000)

    # Testcase 248:  imm:0xf0, result rd:x23(0x0002000000000000)
    la  x2, test_data
    addi    x2, x2,928
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x23, 240(x2)
    sd x23, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0x0002000000000000)

    # Testcase 249:  imm:0xe8, result rd:x24(0x0004000000000000)
    la  x2, test_data
    addi    x2, x2,936
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x24, 232(x2)
    sd x24, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0x0004000000000000)





    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 250:  imm:0xd8, result rd:x25(0x0008000000000000)
    la  x2, test_data
    addi    x2, x2,944
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x25, 216(x2)
    sd x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0x0008000000000000)

    # Testcase 251:  imm:0xb8, result rd:x26(0x0010000000000000)
    la  x2, test_data
    addi    x2, x2,952
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x26, 184(x2)
    sd x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0x0010000000000000)

    # Testcase 252:  imm:0x78, result rd:x27(0x0020000000000000)
    la  x2, test_data
    addi    x2, x2,960
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x27, 120(x2)
    sd x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0x0020000000000000)

    # Testcase 253:  imm:0xf0, result rd:x28(0x0040000000000000)
    la  x2, test_data
    addi    x2, x2,968
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x28, 240(x2)
    sd x28, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0x0040000000000000)

    # Testcase 254:  imm:0xe8, result rd:x29(0x0080000000000000)
    la  x2, test_data
    addi    x2, x2,976
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x29, 232(x2)
    sd x29, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x29, 0x0080000000000000)





    

    RVTEST_SIGBASE(x4,signature_52_0)

    # Testcase 255:  imm:0xd8, result rd:x30(0x0100000000000000)
    la  x2, test_data
    addi    x2, x2,984
    li     x5, MASK_XLEN(-216)
    add    x2, x2, x5
    c.ldsp x30, 216(x2)
    sd x30, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0x0100000000000000)

    # Testcase 256:  imm:0xb8, result rd:x31(0x0200000000000000)
    la  x2, test_data
    addi    x2, x2,992
    li     x5, MASK_XLEN(-184)
    add    x2, x2, x5
    c.ldsp x31, 184(x2)
    sd x31, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0x0200000000000000)

    # Testcase 257:  imm:0x78, result rd:x1(0x0400000000000000)
    la  x2, test_data
    addi    x2, x2,1000
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.ldsp x1, 120(x2)
    sd x1, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x0400000000000000)

    # Testcase 258:  imm:0xf0, result rd:x3(0x0800000000000000)
    la  x2, test_data
    addi    x2, x2,1008
    li     x5, MASK_XLEN(-240)
    add    x2, x2, x5
    c.ldsp x3, 240(x2)
    sd x3, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x0800000000000000)

    # Testcase 259:  imm:0xe8, result rd:x3(0x1000000000000000)
    la  x2, test_data
    addi    x2, x2,1016
    li     x5, MASK_XLEN(-232)
    add    x2, x2, x5
    c.ldsp x3, 232(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x1000000000000000)





    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 260:  imm:0xd8, result rd:x4(0x2000000000000000)
    la  x2, test_data
    addi    x2, x2,1024
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x4, 216(x2)
    sd x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0x2000000000000000)

    # Testcase 261:  imm:0xb8, result rd:x5(0x4000000000000000)
    la  x2, test_data
    addi    x2, x2,1032
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x5, 184(x2)
    sd x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0x4000000000000000)

    # Testcase 262:  imm:0x78, result rd:x6(0x8000000000000000)
    la  x2, test_data
    addi    x2, x2,1040
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x6, 120(x2)
    sd x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0x8000000000000000)

    # Testcase 263:  imm:0xf0, result rd:x7(0x0000000000000000)
    la  x2, test_data
    addi    x2, x2,1048
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x7, 240(x2)
    sd x7, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0x0000000000000000)

    # Testcase 264:  imm:0xe8, result rd:x8(0xfffffffffffffffe)
    la  x2, test_data
    addi    x2, x2,0
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x8, 232(x2)
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x8, 0xfffffffffffffffe)





    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 265:  imm:0xd8, result rd:x9(0xfffffffffffffffd)
    la  x2, test_data
    addi    x2, x2,8
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x9, 216(x2)
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x9, 0xfffffffffffffffd)

    # Testcase 266:  imm:0xb8, result rd:x10(0xfffffffffffffffb)
    la  x2, test_data
    addi    x2, x2,16
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x10, 184(x2)
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x10, 0xfffffffffffffffb)

    # Testcase 267:  imm:0x78, result rd:x11(0xfffffffffffffff7)
    la  x2, test_data
    addi    x2, x2,24
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x11, 120(x2)
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x11, 0xfffffffffffffff7)

    # Testcase 268:  imm:0xf0, result rd:x12(0xffffffffffffffef)
    la  x2, test_data
    addi    x2, x2,32
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x12, 240(x2)
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x12, 0xffffffffffffffef)

    # Testcase 269:  imm:0xe8, result rd:x13(0xffffffffffffffdf)
    la  x2, test_data
    addi    x2, x2,40
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x13, 232(x2)
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x13, 0xffffffffffffffdf)





    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 270:  imm:0xd8, result rd:x14(0xffffffffffffffbf)
    la  x2, test_data
    addi    x2, x2,48
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x14, 216(x2)
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x14, 0xffffffffffffffbf)

    # Testcase 271:  imm:0xb8, result rd:x15(0xffffffffffffff7f)
    la  x2, test_data
    addi    x2, x2,56
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x15, 184(x2)
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x15, 0xffffffffffffff7f)

    # Testcase 272:  imm:0x78, result rd:x16(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,64
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x16, 120(x2)
    sd x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x16, 0xfffffffffffffeff)

    # Testcase 273:  imm:0xf0, result rd:x17(0xfffffffffffffdff)
    la  x2, test_data
    addi    x2, x2,72
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x17, 240(x2)
    sd x17, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x17, 0xfffffffffffffdff)

    # Testcase 274:  imm:0xe8, result rd:x18(0xfffffffffffffeff)
    la  x2, test_data
    addi    x2, x2,80
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x18, 232(x2)
    sd x18, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x18, 0xfffffffffffffeff)





    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 275:  imm:0xd8, result rd:x19(0xfffffffffffff7ff)
    la  x2, test_data
    addi    x2, x2,88
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x19, 216(x2)
    sd x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x19, 0xfffffffffffff7ff)

    # Testcase 276:  imm:0xb8, result rd:x20(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,96
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x20, 184(x2)
    sd x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x20, 0xffffffffffffefff)

    # Testcase 277:  imm:0x78, result rd:x21(0xffffffffffffdfff)
    la  x2, test_data
    addi    x2, x2,104
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x21, 120(x2)
    sd x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x21, 0xffffffffffffdfff)

    # Testcase 278:  imm:0xf0, result rd:x22(0xffffffffffffefff)
    la  x2, test_data
    addi    x2, x2,112
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x22, 240(x2)
    sd x22, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x22, 0xffffffffffffefff)

    # Testcase 279:  imm:0xe8, result rd:x23(0xffffffffffff7fff)
    la  x2, test_data
    addi    x2, x2,120
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x23, 232(x2)
    sd x23, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x23, 0xffffffffffff7fff)





    

    RVTEST_SIGBASE(x1,signature_57_0)

    # Testcase 280:  imm:0xd8, result rd:x24(0xfffffffffffeffff)
    la  x2, test_data
    addi    x2, x2,128
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x24, 216(x2)
    sd x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x24, 0xfffffffffffeffff)

    # Testcase 281:  imm:0xb8, result rd:x25(0xfffffffffffdffff)
    la  x2, test_data
    addi    x2, x2,136
    li     x3, MASK_XLEN(-184)
    add    x2, x2, x3
    c.ldsp x25, 184(x2)
    sd x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x25, 0xfffffffffffdffff)

    # Testcase 282:  imm:0x78, result rd:x26(0xfffffffffffbffff)
    la  x2, test_data
    addi    x2, x2,144
    li     x3, MASK_XLEN(-120)
    add    x2, x2, x3
    c.ldsp x26, 120(x2)
    sd x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x26, 0xfffffffffffbffff)

    # Testcase 283:  imm:0xf0, result rd:x27(0xfffffffffff7ffff)
    la  x2, test_data
    addi    x2, x2,152
    li     x3, MASK_XLEN(-240)
    add    x2, x2, x3
    c.ldsp x27, 240(x2)
    sd x27, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x27, 0xfffffffffff7ffff)

    # Testcase 284:  imm:0xe8, result rd:x28(0xffffffffffefffff)
    la  x2, test_data
    addi    x2, x2,160
    li     x3, MASK_XLEN(-232)
    add    x2, x2, x3
    c.ldsp x28, 232(x2)
    sd x28, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x28, 0xffffffffffefffff)





    

    RVTEST_SIGBASE(x4,signature_58_0)

    # Testcase 285:  imm:0xd8, result rd:x29(0xffffffffffdfffff)
    la  x2, test_data
    addi    x2, x2,168
    li     x5, MASK_XLEN(-216)
    add    x2, x2, x5
    c.ldsp x29, 216(x2)
    sd x29, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x29, 0xffffffffffdfffff)

    # Testcase 286:  imm:0xb8, result rd:x30(0xffffffffffbfffff)
    la  x2, test_data
    addi    x2, x2,176
    li     x5, MASK_XLEN(-184)
    add    x2, x2, x5
    c.ldsp x30, 184(x2)
    sd x30, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x30, 0xffffffffffbfffff)

    # Testcase 287:  imm:0x78, result rd:x31(0xffffffffff7fffff)
    la  x2, test_data
    addi    x2, x2,184
    li     x5, MASK_XLEN(-120)
    add    x2, x2, x5
    c.ldsp x31, 120(x2)
    sd x31, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x31, 0xffffffffff7fffff)

    # Testcase 288:  imm:0xf0, result rd:x1(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,192
    li     x5, MASK_XLEN(-240)
    add    x2, x2, x5
    c.ldsp x1, 240(x2)
    sd x1, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0xfffffffffeffffff)

    # Testcase 289:  imm:0xe8, result rd:x3(0xfffffffffdffffff)
    la  x2, test_data
    addi    x2, x2,200
    li     x5, MASK_XLEN(-232)
    add    x2, x2, x5
    c.ldsp x3, 232(x2)
    sd x3, 32(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0xfffffffffdffffff)





    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 290:  imm:0xd8, result rd:x3(0xfffffffffeffffff)
    la  x2, test_data
    addi    x2, x2,208
    li     x8, MASK_XLEN(-216)
    add    x2, x2, x8
    c.ldsp x3, 216(x2)
    sd x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x3, 0xfffffffffeffffff)

    # Testcase 291:  imm:0xb8, result rd:x4(0xfffffffff7ffffff)
    la  x2, test_data
    addi    x2, x2,216
    li     x8, MASK_XLEN(-184)
    add    x2, x2, x8
    c.ldsp x4, 184(x2)
    sd x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x4, 0xfffffffff7ffffff)

    # Testcase 292:  imm:0x78, result rd:x5(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,224
    li     x8, MASK_XLEN(-120)
    add    x2, x2, x8
    c.ldsp x5, 120(x2)
    sd x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x5, 0xffffffffefffffff)

    # Testcase 293:  imm:0xf0, result rd:x6(0xffffffffdfffffff)
    la  x2, test_data
    addi    x2, x2,232
    li     x8, MASK_XLEN(-240)
    add    x2, x2, x8
    c.ldsp x6, 240(x2)
    sd x6, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x6, 0xffffffffdfffffff)

    # Testcase 294:  imm:0xe8, result rd:x7(0xffffffffefffffff)
    la  x2, test_data
    addi    x2, x2,240
    li     x8, MASK_XLEN(-232)
    add    x2, x2, x8
    c.ldsp x7, 232(x2)
    sd x7, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x9, x7, 0xffffffffefffffff)





    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 295:  imm:0xd8, result rd:x8(0xffffffff7fffffff)
    la  x2, test_data
    addi    x2, x2,248
    li     x3, MASK_XLEN(-216)
    add    x2, x2, x3
    c.ldsp x8, 216(x2)
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x8, 0xffffffff7fffffff)


	
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

