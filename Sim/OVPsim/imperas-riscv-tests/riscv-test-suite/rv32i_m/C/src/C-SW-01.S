// RISC-V Architectural Validation Test C-SW-01
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
// Description: Testing instruction 'c.sw'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1



    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.sw)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.sw)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0xf4bcf4a7
    addi    x11, x1,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_1_res+0] = 0xf4bcf4a7
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xf4bcf4a7)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0xb26566a0
    addi    x14, x1,4
    li     x2, MASK_XLEN(-20)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x12, 20(x14)
    # Check results:  mem[test_1_res+4] = 0xb26566a0
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xb26566a0)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0xc3e260bd
    addi    x10, x1,8
    li     x2, MASK_XLEN(-104)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x8, 104(x10)
    # Check results:  mem[test_1_res+8] = 0xc3e260bd
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xc3e260bd)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x15, 0xa783d03f
    addi    x11, x1,12
    li     x2, MASK_XLEN(-124)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x15, 124(x11)
    # Check results:  mem[test_1_res+12] = 0xa783d03f
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xa783d03f)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x807fe203
    addi    x13, x1,16
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 124(x13)
    # Check results:  mem[test_1_res+16] = 0x807fe203
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x807fe203)





    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x413f2c62
    addi    x13, x1,0
    li     x2, MASK_XLEN(-80)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x12, 80(x13)
    # Check results:  mem[test_2_res+0] = 0x413f2c62
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x413f2c62)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x9, 0x701512f5
    addi    x11, x1,4
    li     x2, MASK_XLEN(-72)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x9, 72(x11)
    # Check results:  mem[test_2_res+4] = 0x701512f5
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x701512f5)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x91dd5ad6
    addi    x10, x1,8
    li     x2, MASK_XLEN(-56)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x15, 56(x10)
    # Check results:  mem[test_2_res+8] = 0x91dd5ad6
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x91dd5ad6)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x15, 0x589f2ccd
    addi    x9, x1,12
    li     x2, MASK_XLEN(-84)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x15, 84(x9)
    # Check results:  mem[test_2_res+12] = 0x589f2ccd
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x589f2ccd)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x4d236af8
    addi    x9, x1,16
    li     x2, MASK_XLEN(-96)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x15, 96(x9)
    # Check results:  mem[test_2_res+16] = 0x4d236af8
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x4d236af8)





    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x242b9878
    addi    x15, x1,0
    li     x2, MASK_XLEN(-28)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x13, 28(x15)
    # Check results:  mem[test_3_res+0] = 0x242b9878
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x242b9878)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x14, 0x353a8593
    addi    x8, x1,4
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x14, 4(x8)
    # Check results:  mem[test_3_res+4] = 0x353a8593
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x353a8593)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0xc357b925
    addi    x8, x1,8
    li     x2, MASK_XLEN(-72)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 72(x8)
    # Check results:  mem[test_3_res+8] = 0xc357b925
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xc357b925)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x14, 0xdc3713a2
    addi    x15, x1,12
    li     x2, MASK_XLEN(-48)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x14, 48(x15)
    # Check results:  mem[test_3_res+12] = 0xdc3713a2
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xdc3713a2)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x2ed729e0
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x14, 60(x11)
    # Check results:  mem[test_3_res+16] = 0x2ed729e0
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x2ed729e0)





    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x825648e4
    addi    x9, x1,0
    li     x2, MASK_XLEN(-24)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 24(x9)
    # Check results:  mem[test_4_res+0] = 0x825648e4
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x825648e4)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x13, 0xf4cc30bc
    addi    x15, x1,4
    li     x2, MASK_XLEN(-72)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x13, 72(x15)
    # Check results:  mem[test_4_res+4] = 0xf4cc30bc
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xf4cc30bc)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0xfe9b8abf
    addi    x15, x1,8
    li     x2, MASK_XLEN(-80)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x11, 80(x15)
    # Check results:  mem[test_4_res+8] = 0xfe9b8abf
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfe9b8abf)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x8, 0x8cc7e790
    addi    x13, x1,12
    li     x2, MASK_XLEN(-32)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 32(x13)
    # Check results:  mem[test_4_res+12] = 0x8cc7e790
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x8cc7e790)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0xcaa4b80e
    addi    x12, x1,16
    li     x2, MASK_XLEN(-72)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x11, 72(x12)
    # Check results:  mem[test_4_res+16] = 0xcaa4b80e
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xcaa4b80e)





    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xfe96a948
    addi    x9, x1,0
    li     x2, MASK_XLEN(-44)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x14, 44(x9)
    # Check results:  mem[test_5_res+0] = 0xfe96a948
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfe96a948)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0x8fe89d23
    addi    x15, x1,4
    li     x2, MASK_XLEN(-36)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x12, 36(x15)
    # Check results:  mem[test_5_res+4] = 0x8fe89d23
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x8fe89d23)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0xe10f3f75
    addi    x10, x1,8
    li     x2, MASK_XLEN(-12)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x12, 12(x10)
    # Check results:  mem[test_5_res+8] = 0xe10f3f75
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xe10f3f75)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x14, 0x103e6515
    addi    x13, x1,12
    li     x2, MASK_XLEN(-68)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 68(x13)
    # Check results:  mem[test_5_res+12] = 0x103e6515
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x103e6515)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0xbd562c12
    addi    x9, x1,16
    li     x2, MASK_XLEN(-56)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x14, 56(x9)
    # Check results:  mem[test_5_res+16] = 0xbd562c12
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xbd562c12)





    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x823f2c5
    addi    x11, x1,0
    li     x2, MASK_XLEN(-84)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x15, 84(x11)
    # Check results:  mem[test_6_res+0] = 0x0823f2c5
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0823f2c5)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0x92d1fb3e
    addi    x13, x1,4
    li     x2, MASK_XLEN(-4)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x12, 4(x13)
    # Check results:  mem[test_6_res+4] = 0x92d1fb3e
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x92d1fb3e)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x6a6a04cf
    addi    x14, x1,8
    li     x2, MASK_XLEN(-52)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x9, 52(x14)
    # Check results:  mem[test_6_res+8] = 0x6a6a04cf
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x6a6a04cf)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x10, 0xff3544a9
    addi    x9, x1,12
    li     x2, MASK_XLEN(-44)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 44(x9)
    # Check results:  mem[test_6_res+12] = 0xff3544a9
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xff3544a9)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0xe855a90d
    addi    x14, x1,16
    li     x2, MASK_XLEN(-88)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x8, 88(x14)
    # Check results:  mem[test_6_res+16] = 0xe855a90d
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xe855a90d)





    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x7fffffff
    addi    x8, x1,0
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x11, 124(x8)
    # Check results:  mem[test_7_res+0] = 0x7fffffff
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x7fffffff)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x11, 0x80000000
    addi    x12, x1,4
    li     x2, MASK_XLEN(-124)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x11, 124(x12)
    # Check results:  mem[test_7_res+4] = 0x80000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x80000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0xffffffff
    addi    x15, x1,8
    li     x2, MASK_XLEN(-4)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x14, 4(x15)
    # Check results:  mem[test_7_res+8] = 0xffffffff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x13, 0xffffffff
    addi    x11, x1,12
    li     x2, MASK_XLEN(0)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x13, 0(x11)
    # Check results:  mem[test_7_res+12] = 0xffffffff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0xffffffff
    addi    x15, x1,16
    li     x2, MASK_XLEN(-124)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 124(x15)
    # Check results:  mem[test_7_res+16] = 0xffffffff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffff)





    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x12, 124(x8)
    # Check results:  mem[test_8_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x15, x1,4
    li     x2, MASK_XLEN(0)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x10, 0(x15)
    # Check results:  mem[test_8_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0xffffffff
    addi    x8, x1,8
    li     x2, MASK_XLEN(-124)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x13, 124(x8)
    # Check results:  mem[test_8_res+8] = 0xffffffff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x11, 0x7fffffff
    addi    x13, x1,12
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x11, 124(x13)
    # Check results:  mem[test_8_res+12] = 0x7fffffff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x7fffffff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x80000000
    addi    x13, x1,16
    li     x2, MASK_XLEN(-124)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x8, 124(x13)
    # Check results:  mem[test_8_res+16] = 0x80000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x80000000)





    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffe
    addi    x8, x1,0
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 4(x8)
    # Check results:  mem[test_9_res+0] = 0xfffffffe
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffe)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x10, 0x7fffffff
    addi    x9, x1,4
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 8(x9)
    # Check results:  mem[test_9_res+4] = 0x7fffffff
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x7fffffff)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0xbfffffff
    addi    x10, x1,8
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 16(x10)
    # Check results:  mem[test_9_res+8] = 0xbfffffff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xbfffffff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x12, 0xdfffffff
    addi    x11, x1,12
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 32(x11)
    # Check results:  mem[test_9_res+12] = 0xdfffffff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xdfffffff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0xefffffff
    addi    x12, x1,16
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 64(x12)
    # Check results:  mem[test_9_res+16] = 0xefffffff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xefffffff)





    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0xf7ffffff
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_10_res+0] = 0xf7ffffff
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xf7ffffff)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x15, 0xfbffffff
    addi    x14, x1,4
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_10_res+4] = 0xfbffffff
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfbffffff)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0xfdffffff
    addi    x15, x1,8
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_10_res+8] = 0xfdffffff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfdffffff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x9, 0xfeffffff
    addi    x8, x1,12
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_10_res+12] = 0xfeffffff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfeffffff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0xff7fffff
    addi    x9, x1,16
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_10_res+16] = 0xff7fffff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xff7fffff)





    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0xffbfffff
    addi    x10, x1,0
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_11_res+0] = 0xffbfffff
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffbfffff)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0xffdfffff
    addi    x11, x1,4
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_11_res+4] = 0xffdfffff
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffdfffff)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0xffefffff
    addi    x12, x1,8
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_11_res+8] = 0xffefffff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffefffff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x14, 0xfff7ffff
    addi    x13, x1,12
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_11_res+12] = 0xfff7ffff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfff7ffff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0xfffbffff
    addi    x14, x1,16
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_11_res+16] = 0xfffbffff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffbffff)





    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0xfffdffff
    addi    x15, x1,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_12_res+0] = 0xfffdffff
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffdffff)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x9, 0xfffeffff
    addi    x8, x1,4
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_12_res+4] = 0xfffeffff
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffeffff)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0xffff7fff
    addi    x9, x1,8
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_12_res+8] = 0xffff7fff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffff7fff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x11, 0xffffbfff
    addi    x10, x1,12
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_12_res+12] = 0xffffbfff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffbfff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0xffffdfff
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_12_res+16] = 0xffffdfff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffdfff)





    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0xffffefff
    addi    x12, x1,0
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_13_res+0] = 0xffffefff
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffefff)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x14, 0xfffff7ff
    addi    x13, x1,4
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_13_res+4] = 0xfffff7ff
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffff7ff)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0xfffffbff
    addi    x14, x1,8
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_13_res+8] = 0xfffffbff
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffbff)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x8, 0xfffffdff
    addi    x15, x1,12
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_13_res+12] = 0xfffffdff
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffdff)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0xfffffeff
    addi    x8, x1,16
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_13_res+16] = 0xfffffeff
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffeff)





    

    RVTEST_SIGBASE(x1,signature_14_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0xffffff7f
    addi    x9, x1,0
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_14_res+0] = 0xffffff7f
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffff7f)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x11, 0xffffffbf
    addi    x10, x1,4
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_14_res+4] = 0xffffffbf
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffbf)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0xffffffdf
    addi    x11, x1,8
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_14_res+8] = 0xffffffdf
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffdf)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x13, 0xffffffef
    addi    x12, x1,12
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_14_res+12] = 0xffffffef
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xffffffef)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0xfffffff7
    addi    x13, x1,16
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_14_res+16] = 0xfffffff7
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffff7)





    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0xfffffffb
    addi    x14, x1,0
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_15_res+0] = 0xfffffffb
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffb)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x8, 0xfffffffd
    addi    x15, x1,4
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_15_res+4] = 0xfffffffd
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffd)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0xfffffffe
    addi    x8, x1,8
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_15_res+8] = 0xfffffffe
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffe)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x10, 0x80000000
    addi    x9, x1,12
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_15_res+12] = 0x80000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x80000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x40000000
    addi    x10, x1,16
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_15_res+16] = 0x40000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x40000000)





    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x20000000
    addi    x11, x1,0
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_16_res+0] = 0x20000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x20000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x13, 0x10000000
    addi    x12, x1,4
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_16_res+4] = 0x10000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x10000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x8000000
    addi    x13, x1,8
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_16_res+8] = 0x08000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x08000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x15, 0x4000000
    addi    x14, x1,12
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_16_res+12] = 0x04000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x04000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x2000000
    addi    x15, x1,16
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_16_res+16] = 0x02000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x02000000)





    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x1000000
    addi    x8, x1,0
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_17_res+0] = 0x01000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x01000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x10, 0x800000
    addi    x9, x1,4
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_17_res+4] = 0x00800000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00800000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x400000
    addi    x10, x1,8
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_17_res+8] = 0x00400000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00400000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x12, 0x200000
    addi    x11, x1,12
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_17_res+12] = 0x00200000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00200000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x100000
    addi    x12, x1,16
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_17_res+16] = 0x00100000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00100000)





    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x80000
    addi    x13, x1,0
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_18_res+0] = 0x00080000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00080000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x15, 0x40000
    addi    x14, x1,4
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_18_res+4] = 0x00040000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00040000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x20000
    addi    x15, x1,8
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_18_res+8] = 0x00020000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00020000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x9, 0x10000
    addi    x8, x1,12
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_18_res+12] = 0x00010000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00010000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x8000
    addi    x9, x1,16
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_18_res+16] = 0x00008000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00008000)





    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x4000
    addi    x10, x1,0
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_19_res+0] = 0x00004000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00004000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0x2000
    addi    x11, x1,4
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_19_res+4] = 0x00002000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00002000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x1000
    addi    x12, x1,8
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_19_res+8] = 0x00001000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00001000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x14, 0x800
    addi    x13, x1,12
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_19_res+12] = 0x00000800
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000800)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x400
    addi    x14, x1,16
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_19_res+16] = 0x00000400
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000400)





    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x200
    addi    x15, x1,0
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_20_res+0] = 0x00000200
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000200)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x9, 0x100
    addi    x8, x1,4
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_20_res+4] = 0x00000100
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000100)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x80
    addi    x9, x1,8
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_20_res+8] = 0x00000080
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000080)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x11, 0x40
    addi    x10, x1,12
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_20_res+12] = 0x00000040
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000040)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x20
    addi    x11, x1,16
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_20_res+16] = 0x00000020
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000020)





    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x10
    addi    x12, x1,0
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_21_res+0] = 0x00000010
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000010)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x14, 0x8
    addi    x13, x1,4
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_21_res+4] = 0x00000008
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000008)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x4
    addi    x14, x1,8
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_21_res+8] = 0x00000004
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000004)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x8, 0x2
    addi    x15, x1,12
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_21_res+12] = 0x00000002
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000002)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(-4)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 4(x8)
    # Check results:  mem[test_21_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(-8)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 8(x9)
    # Check results:  mem[test_22_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,4
    li     x2, MASK_XLEN(-16)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 16(x10)
    # Check results:  mem[test_22_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-32)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 32(x11)
    # Check results:  mem[test_22_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,12
    li     x2, MASK_XLEN(-64)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 64(x12)
    # Check results:  mem[test_22_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_22_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_23_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,4
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_23_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_23_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,12
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_23_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,16
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_23_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_24_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,4
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_24_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_24_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,12
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_24_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,16
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_24_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_25_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_25_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,4
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_25_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_25_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,12
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_25_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_25_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,0
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_26_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,4
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_26_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_26_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,12
    li     x2, MASK_XLEN(-60)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 60(x8)
    # Check results:  mem[test_26_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,16
    li     x2, MASK_XLEN(-120)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 120(x9)
    # Check results:  mem[test_26_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,0
    li     x2, MASK_XLEN(-116)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 116(x10)
    # Check results:  mem[test_27_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,4
    li     x2, MASK_XLEN(-108)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 108(x11)
    # Check results:  mem[test_27_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,8
    li     x2, MASK_XLEN(-92)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 92(x12)
    # Check results:  mem[test_27_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,12
    li     x2, MASK_XLEN(-60)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 60(x13)
    # Check results:  mem[test_27_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,16
    li     x2, MASK_XLEN(-120)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 120(x14)
    # Check results:  mem[test_27_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,0
    li     x2, MASK_XLEN(-116)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 116(x15)
    # Check results:  mem[test_28_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,4
    li     x2, MASK_XLEN(-108)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 108(x8)
    # Check results:  mem[test_28_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,8
    li     x2, MASK_XLEN(-92)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 92(x9)
    # Check results:  mem[test_28_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,12
    li     x2, MASK_XLEN(-60)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 60(x10)
    # Check results:  mem[test_28_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,16
    li     x2, MASK_XLEN(-120)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 120(x11)
    # Check results:  mem[test_28_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,0
    li     x2, MASK_XLEN(-116)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 116(x12)
    # Check results:  mem[test_29_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,4
    li     x2, MASK_XLEN(-108)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 108(x13)
    # Check results:  mem[test_29_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,8
    li     x2, MASK_XLEN(-92)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 92(x14)
    # Check results:  mem[test_29_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,12
    li     x2, MASK_XLEN(-60)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 60(x15)
    # Check results:  mem[test_29_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,16
    li     x2, MASK_XLEN(-120)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 120(x8)
    # Check results:  mem[test_29_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,0
    li     x2, MASK_XLEN(-116)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 116(x9)
    # Check results:  mem[test_30_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,4
    li     x2, MASK_XLEN(-108)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 108(x10)
    # Check results:  mem[test_30_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,8
    li     x2, MASK_XLEN(-92)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 92(x11)
    # Check results:  mem[test_30_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,12
    li     x2, MASK_XLEN(-60)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 60(x12)
    # Check results:  mem[test_30_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,16
    li     x2, MASK_XLEN(-120)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 120(x13)
    # Check results:  mem[test_30_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,0
    li     x2, MASK_XLEN(-116)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 116(x14)
    # Check results:  mem[test_31_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,4
    li     x2, MASK_XLEN(-108)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 108(x15)
    # Check results:  mem[test_31_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,8
    li     x2, MASK_XLEN(-92)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 92(x8)
    # Check results:  mem[test_31_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,12
    li     x2, MASK_XLEN(-60)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 60(x9)
    # Check results:  mem[test_31_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,16
    li     x2, MASK_XLEN(-120)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 120(x10)
    # Check results:  mem[test_31_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,0
    li     x2, MASK_XLEN(-116)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 116(x11)
    # Check results:  mem[test_32_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,4
    li     x2, MASK_XLEN(-108)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 108(x12)
    # Check results:  mem[test_32_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,8
    li     x2, MASK_XLEN(-92)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 92(x13)
    # Check results:  mem[test_32_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,12
    li     x2, MASK_XLEN(-60)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 60(x14)
    # Check results:  mem[test_32_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,16
    li     x2, MASK_XLEN(-120)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 120(x15)
    # Check results:  mem[test_32_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x9, 0x0
    addi    x8, x1,0
    li     x2, MASK_XLEN(-116)
    add    x8, x8, x2
    # Test Instruction 
    c.sw      x9, 116(x8)
    # Check results:  mem[test_33_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x10, 0x0
    addi    x9, x1,4
    li     x2, MASK_XLEN(-108)
    add    x9, x9, x2
    # Test Instruction 
    c.sw      x10, 108(x9)
    # Check results:  mem[test_33_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x11, 0x0
    addi    x10, x1,8
    li     x2, MASK_XLEN(-92)
    add    x10, x10, x2
    # Test Instruction 
    c.sw      x11, 92(x10)
    # Check results:  mem[test_33_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 12(x1)
    # Load values and compute offsets
    li      x12, 0x0
    addi    x11, x1,12
    li     x2, MASK_XLEN(-60)
    add    x11, x11, x2
    # Test Instruction 
    c.sw      x12, 60(x11)
    # Check results:  mem[test_33_res+12] = 0x00000000
    lw x3, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 16(x1)
    # Load values and compute offsets
    li      x13, 0x0
    addi    x12, x1,16
    li     x2, MASK_XLEN(-120)
    add    x12, x12, x2
    # Test Instruction 
    c.sw      x13, 120(x12)
    # Check results:  mem[test_33_res+16] = 0x00000000
    lw x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)





    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Clear memory
    sw      x0, 0(x1)
    # Load values and compute offsets
    li      x14, 0x0
    addi    x13, x1,0
    li     x2, MASK_XLEN(-116)
    add    x13, x13, x2
    # Test Instruction 
    c.sw      x14, 116(x13)
    # Check results:  mem[test_34_res+0] = 0x00000000
    lw x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 4(x1)
    # Load values and compute offsets
    li      x15, 0x0
    addi    x14, x1,4
    li     x2, MASK_XLEN(-108)
    add    x14, x14, x2
    # Test Instruction 
    c.sw      x15, 108(x14)
    # Check results:  mem[test_34_res+4] = 0x00000000
    lw x3, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)

    # Clear memory
    sw      x0, 8(x1)
    # Load values and compute offsets
    li      x8, 0x0
    addi    x15, x1,8
    li     x2, MASK_XLEN(-92)
    add    x15, x15, x2
    # Test Instruction 
    c.sw      x8, 92(x15)
    # Check results:  mem[test_34_res+8] = 0x00000000
    lw x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x00000000)


	
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

