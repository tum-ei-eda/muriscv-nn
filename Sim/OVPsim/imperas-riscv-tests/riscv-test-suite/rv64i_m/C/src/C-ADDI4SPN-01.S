// RISC-V Architectural Validation Test C-ADDI4SPN-01
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
// Description: Testing instruction 'c.addi4spn'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.addi4spn)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.addi4spn)

    RVTEST_SIGBASE(x1,signature_1_0)

        # Testcase 0:  rd:x11(0x54f4aeeb151a01ef), imm:0x9c, result rd:x11(0x54f4aeeb151a028b)
    #li x11, 0x54f4aeeb151a01ef
    li x2, 0x54f4aeeb151a01ef
    c.addi4spn x11, x2, 0x9c
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x54f4aeeb151a028b)
        # Testcase 1:  rd:x12(0xe1b1199b429ede3d), imm:0x144, result rd:x12(0xe1b1199b429edf81)
    #li x12, 0xe1b1199b429ede3d
    li x2, 0xe1b1199b429ede3d
    c.addi4spn x12, x2, 0x144
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xe1b1199b429edf81)
        # Testcase 2:  rd:x14(0xb26566a091a8d5fd), imm:0x194, result rd:x14(0xb26566a091a8d791)
    #li x14, 0xb26566a091a8d5fd
    li x2, 0xb26566a091a8d5fd
    c.addi4spn x14, x2, 0x194
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xb26566a091a8d791)
        # Testcase 3:  rd:x12(0xf27008e60466250f), imm:0x190, result rd:x12(0xf27008e60466269f)
    #li x12, 0xf27008e60466250f
    li x2, 0xf27008e60466250f
    c.addi4spn x12, x2, 0x190
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf27008e60466269f)
        # Testcase 4:  rd:x10(0xc8484a3c737ad3a), imm:0x78, result rd:x10(0xc8484a3c737adb2)
    #li x10, 0xc8484a3c737ad3a
    li x2, 0xc8484a3c737ad3a
    c.addi4spn x10, x2, 0x78
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xc8484a3c737adb2)


    

    RVTEST_SIGBASE(x1,signature_2_0)

        # Testcase 5:  rd:x8(0xa783d03f7ca660db), imm:0x37c, result rd:x8(0xa783d03f7ca66457)
    #li x8, 0xa783d03f7ca660db
    li x2, 0xa783d03f7ca660db
    c.addi4spn x8, x2, 0x37c
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa783d03f7ca66457)
        # Testcase 6:  rd:x11(0xfd7b9df82c63c847), imm:0x39c, result rd:x11(0xfd7b9df82c63cbe3)
    #li x11, 0xfd7b9df82c63c847
    li x2, 0xfd7b9df82c63c847
    c.addi4spn x11, x2, 0x39c
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfd7b9df82c63cbe3)
        # Testcase 7:  rd:x15(0xafaa29d195b62bf), imm:0x344, result rd:x15(0xafaa29d195b6603)
    #li x15, 0xafaa29d195b62bf
    li x2, 0xafaa29d195b62bf
    c.addi4spn x15, x2, 0x344
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xafaa29d195b6603)
        # Testcase 8:  rd:x13(0x413f2c6234b80fd4), imm:0x3d0, result rd:x13(0x413f2c6234b813a4)
    #li x13, 0x413f2c6234b80fd4
    li x2, 0x413f2c6234b80fd4
    c.addi4spn x13, x2, 0x3d0
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x413f2c6234b813a4)
        # Testcase 9:  rd:x13(0x2c370a9a34267ad9), imm:0x300, result rd:x13(0x2c370a9a34267dd9)
    #li x13, 0x2c370a9a34267ad9
    li x2, 0x2c370a9a34267ad9
    c.addi4spn x13, x2, 0x300
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2c370a9a34267dd9)


    

    RVTEST_SIGBASE(x1,signature_3_0)

        # Testcase 10:  rd:x8(0x2882a0b367dd3492), imm:0xf8, result rd:x8(0x2882a0b367dd358a)
    #li x8, 0x2882a0b367dd3492
    li x2, 0x2882a0b367dd3492
    c.addi4spn x8, x2, 0xf8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2882a0b367dd358a)
        # Testcase 11:  rd:x13(0x91dd5ad6b2d3f1c5), imm:0x2b8, result rd:x13(0x91dd5ad6b2d3f47d)
    #li x13, 0x91dd5ad6b2d3f1c5
    li x2, 0x91dd5ad6b2d3f1c5
    c.addi4spn x13, x2, 0x2b8
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x91dd5ad6b2d3f47d)
        # Testcase 12:  rd:x12(0x42f1d6295233a4dd), imm:0x140, result rd:x12(0x42f1d6295233a61d)
    #li x12, 0x42f1d6295233a4dd
    li x2, 0x42f1d6295233a4dd
    c.addi4spn x12, x2, 0x140
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x42f1d6295233a61d)
        # Testcase 13:  rd:x11(0xcddbdf6f18fc88d5), imm:0x1c4, result rd:x11(0xcddbdf6f18fc8a99)
    #li x11, 0xcddbdf6f18fc88d5
    li x2, 0xcddbdf6f18fc88d5
    c.addi4spn x11, x2, 0x1c4
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xcddbdf6f18fc8a99)
        # Testcase 14:  rd:x9(0x4d236af8c83b3c30), imm:0x360, result rd:x9(0x4d236af8c83b3f90)
    #li x9, 0x4d236af8c83b3c30
    li x2, 0x4d236af8c83b3c30
    c.addi4spn x9, x2, 0x360
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x4d236af8c83b3f90)


    

    RVTEST_SIGBASE(x1,signature_4_0)

        # Testcase 15:  rd:x10(0x983b9f63a968a97f), imm:0x1b4, result rd:x10(0x983b9f63a968ab33)
    #li x10, 0x983b9f63a968a97f
    li x2, 0x983b9f63a968a97f
    c.addi4spn x10, x2, 0x1b4
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x983b9f63a968ab33)
        # Testcase 16:  rd:x10(0x1fbe3ca65b086787), imm:0x294, result rd:x10(0x1fbe3ca65b086a1b)
    #li x10, 0x1fbe3ca65b086787
    li x2, 0x1fbe3ca65b086787
    c.addi4spn x10, x2, 0x294
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x1fbe3ca65b086a1b)
        # Testcase 17:  rd:x10(0x353a85936075c1a2), imm:0x84, result rd:x10(0x353a85936075c226)
    #li x10, 0x353a85936075c1a2
    li x2, 0x353a85936075c1a2
    c.addi4spn x10, x2, 0x84
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x353a85936075c226)
        # Testcase 18:  rd:x15(0x66268a1a4ff09378), imm:0x2a0, result rd:x15(0x66268a1a4ff09618)
    #li x15, 0x66268a1a4ff09378
    li x2, 0x66268a1a4ff09378
    c.addi4spn x15, x2, 0x2a0
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x66268a1a4ff09618)
        # Testcase 19:  rd:x9(0x28ac54a3b32a4c52), imm:0x6c, result rd:x9(0x28ac54a3b32a4cbe)
    #li x9, 0x28ac54a3b32a4c52
    li x2, 0x28ac54a3b32a4c52
    c.addi4spn x9, x2, 0x6c
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x28ac54a3b32a4cbe)


    

    RVTEST_SIGBASE(x1,signature_5_0)

        # Testcase 20:  rd:x15(0xdc3713a217a2fb1a), imm:0x230, result rd:x15(0xdc3713a217a2fd4a)
    #li x15, 0xdc3713a217a2fb1a
    li x2, 0xdc3713a217a2fb1a
    c.addi4spn x15, x2, 0x230
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xdc3713a217a2fd4a)
        # Testcase 21:  rd:x9(0x74674399484605f6), imm:0x2d4, result rd:x9(0x74674399484608ca)
    #li x9, 0x74674399484605f6
    li x2, 0x74674399484605f6
    c.addi4spn x9, x2, 0x2d4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x74674399484608ca)
        # Testcase 22:  rd:x15(0x6bdd9821fc9d848f), imm:0x10, result rd:x15(0x6bdd9821fc9d849f)
    #li x15, 0x6bdd9821fc9d848f
    li x2, 0x6bdd9821fc9d848f
    c.addi4spn x15, x2, 0x10
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x6bdd9821fc9d849f)
        # Testcase 23:  rd:x15(0x825648e49b1a8042), imm:0x218, result rd:x15(0x825648e49b1a825a)
    #li x15, 0x825648e49b1a8042
    li x2, 0x825648e49b1a8042
    c.addi4spn x15, x2, 0x218
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x825648e49b1a825a)
        # Testcase 24:  rd:x13(0x7bf4ef1c426b8dfb), imm:0xb0, result rd:x13(0x7bf4ef1c426b8eab)
    #li x13, 0x7bf4ef1c426b8dfb
    li x2, 0x7bf4ef1c426b8dfb
    c.addi4spn x13, x2, 0xb0
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x7bf4ef1c426b8eab)


    

    RVTEST_SIGBASE(x1,signature_6_0)

        # Testcase 25:  rd:x8(0xf49a4b2f6323d52), imm:0x158, result rd:x8(0xf49a4b2f6323eaa)
    #li x8, 0xf49a4b2f6323d52
    li x2, 0xf49a4b2f6323d52
    c.addi4spn x8, x2, 0x158
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf49a4b2f6323eaa)
        # Testcase 26:  rd:x14(0xfe9b8abf4bfb003d), imm:0x350, result rd:x14(0xfe9b8abf4bfb038d)
    #li x14, 0xfe9b8abf4bfb003d
    li x2, 0xfe9b8abf4bfb003d
    c.addi4spn x14, x2, 0x350
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfe9b8abf4bfb038d)
        # Testcase 27:  rd:x8(0x347ebc89f22b6484), imm:0x1e0, result rd:x8(0x347ebc89f22b6664)
    #li x8, 0x347ebc89f22b6484
    li x2, 0x347ebc89f22b6484
    c.addi4spn x8, x2, 0x1e0
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x347ebc89f22b6664)
        # Testcase 28:  rd:x9(0xf52a52bf0cc9d6c8), imm:0x370, result rd:x9(0xf52a52bf0cc9da38)
    #li x9, 0xf52a52bf0cc9d6c8
    li x2, 0xf52a52bf0cc9d6c8
    c.addi4spn x9, x2, 0x370
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xf52a52bf0cc9da38)
        # Testcase 29:  rd:x15(0xcaa4b80e169dbce8), imm:0xc8, result rd:x15(0xcaa4b80e169dbdb0)
    #li x15, 0xcaa4b80e169dbce8
    li x2, 0xcaa4b80e169dbce8
    c.addi4spn x15, x2, 0xc8
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xcaa4b80e169dbdb0)


    

    RVTEST_SIGBASE(x1,signature_7_0)

        # Testcase 30:  rd:x14(0xffffffffffffffff), imm:0x4, result rd:x14(0x00000003)
    #li x14, 0xffffffffffffffff
    li x2, 0xffffffffffffffff
    c.addi4spn x14, x2, 0x4
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x3)
        # Testcase 31:  rd:x11(0x8000000000000000), imm:0x3fc, result rd:x11(0x80000000000003fc)
    #li x11, 0x8000000000000000
    li x2, 0x8000000000000000
    c.addi4spn x11, x2, 0x3fc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80000000000003fc)
        # Testcase 32:  rd:x14(0xffffffffffffffff), imm:0x3fc, result rd:x14(0x000003fb)
    #li x14, 0xffffffffffffffff
    li x2, 0xffffffffffffffff
    c.addi4spn x14, x2, 0x3fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x3fb)
        # Testcase 33:  rd:x9(0x00000001), imm:0x3fc, result rd:x9(0x000003fd)
    #li x9, 0x1
    li x2, 0x1
    c.addi4spn x9, x2, 0x3fc
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3fd)
        # Testcase 34:  rd:x10(0xffffffffffffffff), imm:0x4, result rd:x10(0x00000003)
    #li x10, 0xffffffffffffffff
    li x2, 0xffffffffffffffff
    c.addi4spn x10, x2, 0x4
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3)


    

    RVTEST_SIGBASE(x1,signature_8_0)

        # Testcase 35:  rd:x15(0x8000000000000000), imm:0x3fc, result rd:x15(0x80000000000003fc)
    #li x15, 0x8000000000000000
    li x2, 0x8000000000000000
    c.addi4spn x15, x2, 0x3fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000000000003fc)
        # Testcase 36:  rd:x13(0xffffffffffffffff), imm:0x3fc, result rd:x13(0x000003fb)
    #li x13, 0xffffffffffffffff
    li x2, 0xffffffffffffffff
    c.addi4spn x13, x2, 0x3fc
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x3fb)
        # Testcase 37:  rd:x15(0x00000001), imm:0x3fc, result rd:x15(0x000003fd)
    #li x15, 0x1
    li x2, 0x1
    c.addi4spn x15, x2, 0x3fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x3fd)
        # Testcase 38:  rd:x11(0xffffffffffffffff), imm:0x4, result rd:x11(0x00000003)
    #li x11, 0xffffffffffffffff
    li x2, 0xffffffffffffffff
    c.addi4spn x11, x2, 0x4
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3)
        # Testcase 39:  rd:x13(0x8000000000000000), imm:0x3fc, result rd:x13(0x80000000000003fc)
    #li x13, 0x8000000000000000
    li x2, 0x8000000000000000
    c.addi4spn x13, x2, 0x3fc
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x80000000000003fc)


    

    RVTEST_SIGBASE(x1,signature_9_0)

        # Testcase 40:  rd:x8(0x00000001), imm:0x4, result rd:x8(0x00000005)
    #li x8, 0x1
    li x2, 0x1
    c.addi4spn x8, x2, 0x4
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5)
        # Testcase 41:  rd:x9(0x00000002), imm:0x8, result rd:x9(0x0000000a)
    #li x9, 0x2
    li x2, 0x2
    c.addi4spn x9, x2, 0x8
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xa)
        # Testcase 42:  rd:x10(0x00000004), imm:0x10, result rd:x10(0x00000014)
    #li x10, 0x4
    li x2, 0x4
    c.addi4spn x10, x2, 0x10
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x14)
        # Testcase 43:  rd:x11(0x00000008), imm:0x20, result rd:x11(0x00000028)
    #li x11, 0x8
    li x2, 0x8
    c.addi4spn x11, x2, 0x20
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x28)
        # Testcase 44:  rd:x12(0x00000010), imm:0x40, result rd:x12(0x00000050)
    #li x12, 0x10
    li x2, 0x10
    c.addi4spn x12, x2, 0x40
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x50)


    

    RVTEST_SIGBASE(x1,signature_10_0)

        # Testcase 45:  rd:x13(0x00000020), imm:0x80, result rd:x13(0x000000a0)
    #li x13, 0x20
    li x2, 0x20
    c.addi4spn x13, x2, 0x80
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xa0)
        # Testcase 46:  rd:x14(0x00000040), imm:0x100, result rd:x14(0x00000140)
    #li x14, 0x40
    li x2, 0x40
    c.addi4spn x14, x2, 0x100
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x140)
        # Testcase 47:  rd:x15(0x00000080), imm:0x200, result rd:x15(0x00000280)
    #li x15, 0x80
    li x2, 0x80
    c.addi4spn x15, x2, 0x200
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x280)
        # Testcase 48:  rd:x8(0x00000100), imm:0x3f8, result rd:x8(0x000004f8)
    #li x8, 0x100
    li x2, 0x100
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f8)
        # Testcase 49:  rd:x9(0x00000200), imm:0x3f4, result rd:x9(0x000005f4)
    #li x9, 0x200
    li x2, 0x200
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x5f4)


    

    RVTEST_SIGBASE(x1,signature_11_0)

        # Testcase 50:  rd:x10(0x00000400), imm:0x3ec, result rd:x10(0x000007ec)
    #li x10, 0x400
    li x2, 0x400
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x7ec)
        # Testcase 51:  rd:x11(0x00000800), imm:0x3dc, result rd:x11(0x00000bdc)
    #li x11, 0x800
    li x2, 0x800
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xbdc)
        # Testcase 52:  rd:x12(0x00001000), imm:0x3bc, result rd:x12(0x000013bc)
    #li x12, 0x1000
    li x2, 0x1000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x13bc)
        # Testcase 53:  rd:x13(0x00002000), imm:0x37c, result rd:x13(0x0000237c)
    #li x13, 0x2000
    li x2, 0x2000
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x237c)
        # Testcase 54:  rd:x14(0x00004000), imm:0x2fc, result rd:x14(0x000042fc)
    #li x14, 0x4000
    li x2, 0x4000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x42fc)


    

    RVTEST_SIGBASE(x1,signature_12_0)

        # Testcase 55:  rd:x15(0x00008000), imm:0x1fc, result rd:x15(0x000081fc)
    #li x15, 0x8000
    li x2, 0x8000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x81fc)
        # Testcase 56:  rd:x8(0x00010000), imm:0x3f8, result rd:x8(0x000103f8)
    #li x8, 0x10000
    li x2, 0x10000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x103f8)
        # Testcase 57:  rd:x9(0x00020000), imm:0x3f4, result rd:x9(0x000203f4)
    #li x9, 0x20000
    li x2, 0x20000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x203f4)
        # Testcase 58:  rd:x10(0x00040000), imm:0x3ec, result rd:x10(0x000403ec)
    #li x10, 0x40000
    li x2, 0x40000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x403ec)
        # Testcase 59:  rd:x11(0x00080000), imm:0x3dc, result rd:x11(0x000803dc)
    #li x11, 0x80000
    li x2, 0x80000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x803dc)


    

    RVTEST_SIGBASE(x1,signature_13_0)

        # Testcase 60:  rd:x12(0x00100000), imm:0x3bc, result rd:x12(0x001003bc)
    #li x12, 0x100000
    li x2, 0x100000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1003bc)
        # Testcase 61:  rd:x13(0x00200000), imm:0x37c, result rd:x13(0x0020037c)
    #li x13, 0x200000
    li x2, 0x200000
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20037c)
        # Testcase 62:  rd:x14(0x00400000), imm:0x2fc, result rd:x14(0x004002fc)
    #li x14, 0x400000
    li x2, 0x400000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4002fc)
        # Testcase 63:  rd:x15(0x00800000), imm:0x1fc, result rd:x15(0x008001fc)
    #li x15, 0x800000
    li x2, 0x800000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8001fc)
        # Testcase 64:  rd:x8(0x01000000), imm:0x3f8, result rd:x8(0x010003f8)
    #li x8, 0x1000000
    li x2, 0x1000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10003f8)


    

    RVTEST_SIGBASE(x1,signature_14_0)

        # Testcase 65:  rd:x9(0x02000000), imm:0x3f4, result rd:x9(0x020003f4)
    #li x9, 0x2000000
    li x2, 0x2000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20003f4)
        # Testcase 66:  rd:x10(0x04000000), imm:0x3ec, result rd:x10(0x040003ec)
    #li x10, 0x4000000
    li x2, 0x4000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40003ec)
        # Testcase 67:  rd:x11(0x08000000), imm:0x3dc, result rd:x11(0x080003dc)
    #li x11, 0x8000000
    li x2, 0x8000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80003dc)
        # Testcase 68:  rd:x12(0x10000000), imm:0x3bc, result rd:x12(0x100003bc)
    #li x12, 0x10000000
    li x2, 0x10000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100003bc)
        # Testcase 69:  rd:x13(0x20000000), imm:0x37c, result rd:x13(0x2000037c)
    #li x13, 0x20000000
    li x2, 0x20000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000037c)


    

    RVTEST_SIGBASE(x1,signature_15_0)

        # Testcase 70:  rd:x14(0x40000000), imm:0x2fc, result rd:x14(0x400002fc)
    #li x14, 0x40000000
    li x2, 0x40000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400002fc)
        # Testcase 71:  rd:x15(0x80000000), imm:0x1fc, result rd:x15(0x800001fc)
    #li x15, 0x80000000
    li x2, 0x80000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fc)
        # Testcase 72:  rd:x8(0x100000000), imm:0x3f8, result rd:x8(0x1000003f8)
    #li x8, 0x100000000
    li x2, 0x100000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1000003f8)
        # Testcase 73:  rd:x9(0x200000000), imm:0x3f4, result rd:x9(0x2000003f4)
    #li x9, 0x200000000
    li x2, 0x200000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x2000003f4)
        # Testcase 74:  rd:x10(0x400000000), imm:0x3ec, result rd:x10(0x4000003ec)
    #li x10, 0x400000000
    li x2, 0x400000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x4000003ec)


    

    RVTEST_SIGBASE(x1,signature_16_0)

        # Testcase 75:  rd:x11(0x800000000), imm:0x3dc, result rd:x11(0x8000003dc)
    #li x11, 0x800000000
    li x2, 0x800000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x8000003dc)
        # Testcase 76:  rd:x12(0x1000000000), imm:0x3bc, result rd:x12(0x10000003bc)
    #li x12, 0x1000000000
    li x2, 0x1000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x10000003bc)
        # Testcase 77:  rd:x13(0x2000000000), imm:0x37c, result rd:x13(0x200000037c)
    #li x13, 0x2000000000
    li x2, 0x2000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x200000037c)
        # Testcase 78:  rd:x14(0x4000000000), imm:0x2fc, result rd:x14(0x40000002fc)
    #li x14, 0x4000000000
    li x2, 0x4000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x40000002fc)
        # Testcase 79:  rd:x15(0x8000000000), imm:0x1fc, result rd:x15(0x80000001fc)
    #li x15, 0x8000000000
    li x2, 0x8000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000001fc)


    

    RVTEST_SIGBASE(x1,signature_17_0)

        # Testcase 80:  rd:x8(0x10000000000), imm:0x3f8, result rd:x8(0x100000003f8)
    #li x8, 0x10000000000
    li x2, 0x10000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x100000003f8)
        # Testcase 81:  rd:x9(0x20000000000), imm:0x3f4, result rd:x9(0x200000003f4)
    #li x9, 0x20000000000
    li x2, 0x20000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x200000003f4)
        # Testcase 82:  rd:x10(0x40000000000), imm:0x3ec, result rd:x10(0x400000003ec)
    #li x10, 0x40000000000
    li x2, 0x40000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x400000003ec)
        # Testcase 83:  rd:x11(0x80000000000), imm:0x3dc, result rd:x11(0x800000003dc)
    #li x11, 0x80000000000
    li x2, 0x80000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x800000003dc)
        # Testcase 84:  rd:x12(0x100000000000), imm:0x3bc, result rd:x12(0x1000000003bc)
    #li x12, 0x100000000000
    li x2, 0x100000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1000000003bc)


    

    RVTEST_SIGBASE(x1,signature_18_0)

        # Testcase 85:  rd:x13(0x200000000000), imm:0x37c, result rd:x13(0x20000000037c)
    #li x13, 0x200000000000
    li x2, 0x200000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20000000037c)
        # Testcase 86:  rd:x14(0x400000000000), imm:0x2fc, result rd:x14(0x4000000002fc)
    #li x14, 0x400000000000
    li x2, 0x400000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4000000002fc)
        # Testcase 87:  rd:x15(0x800000000000), imm:0x1fc, result rd:x15(0x8000000001fc)
    #li x15, 0x800000000000
    li x2, 0x800000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8000000001fc)
        # Testcase 88:  rd:x8(0x1000000000000), imm:0x3f8, result rd:x8(0x10000000003f8)
    #li x8, 0x1000000000000
    li x2, 0x1000000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10000000003f8)
        # Testcase 89:  rd:x9(0x2000000000000), imm:0x3f4, result rd:x9(0x20000000003f4)
    #li x9, 0x2000000000000
    li x2, 0x2000000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20000000003f4)


    

    RVTEST_SIGBASE(x1,signature_19_0)

        # Testcase 90:  rd:x10(0x4000000000000), imm:0x3ec, result rd:x10(0x40000000003ec)
    #li x10, 0x4000000000000
    li x2, 0x4000000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40000000003ec)
        # Testcase 91:  rd:x11(0x8000000000000), imm:0x3dc, result rd:x11(0x80000000003dc)
    #li x11, 0x8000000000000
    li x2, 0x8000000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80000000003dc)
        # Testcase 92:  rd:x12(0x10000000000000), imm:0x3bc, result rd:x12(0x100000000003bc)
    #li x12, 0x10000000000000
    li x2, 0x10000000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100000000003bc)
        # Testcase 93:  rd:x13(0x20000000000000), imm:0x37c, result rd:x13(0x2000000000037c)
    #li x13, 0x20000000000000
    li x2, 0x20000000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000000000037c)
        # Testcase 94:  rd:x14(0x40000000000000), imm:0x2fc, result rd:x14(0x400000000002fc)
    #li x14, 0x40000000000000
    li x2, 0x40000000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400000000002fc)


    

    RVTEST_SIGBASE(x1,signature_20_0)

        # Testcase 95:  rd:x15(0x80000000000000), imm:0x1fc, result rd:x15(0x800000000001fc)
    #li x15, 0x80000000000000
    li x2, 0x80000000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800000000001fc)
        # Testcase 96:  rd:x8(0x100000000000000), imm:0x3f8, result rd:x8(0x1000000000003f8)
    #li x8, 0x100000000000000
    li x2, 0x100000000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1000000000003f8)
        # Testcase 97:  rd:x9(0x200000000000000), imm:0x3f4, result rd:x9(0x2000000000003f4)
    #li x9, 0x200000000000000
    li x2, 0x200000000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x2000000000003f4)
        # Testcase 98:  rd:x10(0x400000000000000), imm:0x3ec, result rd:x10(0x4000000000003ec)
    #li x10, 0x400000000000000
    li x2, 0x400000000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x4000000000003ec)
        # Testcase 99:  rd:x11(0x800000000000000), imm:0x3dc, result rd:x11(0x8000000000003dc)
    #li x11, 0x800000000000000
    li x2, 0x800000000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x8000000000003dc)


    

    RVTEST_SIGBASE(x1,signature_21_0)

        # Testcase 100:  rd:x12(0x1000000000000000), imm:0x3bc, result rd:x12(0x10000000000003bc)
    #li x12, 0x1000000000000000
    li x2, 0x1000000000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x10000000000003bc)
        # Testcase 101:  rd:x13(0x2000000000000000), imm:0x37c, result rd:x13(0x200000000000037c)
    #li x13, 0x2000000000000000
    li x2, 0x2000000000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x200000000000037c)
        # Testcase 102:  rd:x14(0x4000000000000000), imm:0x2fc, result rd:x14(0x40000000000002fc)
    #li x14, 0x4000000000000000
    li x2, 0x4000000000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x40000000000002fc)
        # Testcase 103:  rd:x15(0x8000000000000000), imm:0x1fc, result rd:x15(0x80000000000001fc)
    #li x15, 0x8000000000000000
    li x2, 0x8000000000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000000000001fc)
        # Testcase 104:  rd:x8(0xfffffffffffffffe), imm:0x3f8, result rd:x8(0x000003f6)
    #li x8, 0xfffffffffffffffe
    li x2, 0xfffffffffffffffe
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f6)


    

    RVTEST_SIGBASE(x1,signature_22_0)

        # Testcase 105:  rd:x9(0xfffffffffffffffd), imm:0x3f4, result rd:x9(0x000003f1)
    #li x9, 0xfffffffffffffffd
    li x2, 0xfffffffffffffffd
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3f1)
        # Testcase 106:  rd:x10(0xfffffffffffffffb), imm:0x3ec, result rd:x10(0x000003e7)
    #li x10, 0xfffffffffffffffb
    li x2, 0xfffffffffffffffb
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3e7)
        # Testcase 107:  rd:x11(0xfffffffffffffff7), imm:0x3dc, result rd:x11(0x000003d3)
    #li x11, 0xfffffffffffffff7
    li x2, 0xfffffffffffffff7
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3d3)
        # Testcase 108:  rd:x12(0xffffffffffffffef), imm:0x3bc, result rd:x12(0x000003ab)
    #li x12, 0xffffffffffffffef
    li x2, 0xffffffffffffffef
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x3ab)
        # Testcase 109:  rd:x13(0xffffffffffffffdf), imm:0x37c, result rd:x13(0x0000035b)
    #li x13, 0xffffffffffffffdf
    li x2, 0xffffffffffffffdf
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x35b)


    

    RVTEST_SIGBASE(x1,signature_23_0)

        # Testcase 110:  rd:x14(0xffffffffffffffbf), imm:0x2fc, result rd:x14(0x000002bb)
    #li x14, 0xffffffffffffffbf
    li x2, 0xffffffffffffffbf
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x2bb)
        # Testcase 111:  rd:x15(0xffffffffffffff7f), imm:0x1fc, result rd:x15(0x0000017b)
    #li x15, 0xffffffffffffff7f
    li x2, 0xffffffffffffff7f
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x17b)
        # Testcase 112:  rd:x8(0xfffffffffffffeff), imm:0x3f8, result rd:x8(0x000002f7)
    #li x8, 0xfffffffffffffeff
    li x2, 0xfffffffffffffeff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f7)
        # Testcase 113:  rd:x9(0xfffffffffffffdff), imm:0x3f4, result rd:x9(0x000001f3)
    #li x9, 0xfffffffffffffdff
    li x2, 0xfffffffffffffdff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x1f3)
        # Testcase 114:  rd:x10(0xfffffffffffffbff), imm:0x3ec, result rd:x10(0xffffffffffffffeb)
    #li x10, 0xfffffffffffffbff
    li x2, 0xfffffffffffffbff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffeb)


    

    RVTEST_SIGBASE(x1,signature_24_0)

        # Testcase 115:  rd:x11(0xfffffffffffff7ff), imm:0x3dc, result rd:x11(0xfffffffffffffbdb)
    #li x11, 0xfffffffffffff7ff
    li x2, 0xfffffffffffff7ff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffbdb)
        # Testcase 116:  rd:x12(0xffffffffffffefff), imm:0x3bc, result rd:x12(0xfffffffffffff3bb)
    #li x12, 0xffffffffffffefff
    li x2, 0xffffffffffffefff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffff3bb)
        # Testcase 117:  rd:x13(0xffffffffffffdfff), imm:0x37c, result rd:x13(0xffffffffffffe37b)
    #li x13, 0xffffffffffffdfff
    li x2, 0xffffffffffffdfff
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffe37b)
        # Testcase 118:  rd:x14(0xffffffffffffbfff), imm:0x2fc, result rd:x14(0xffffffffffffc2fb)
    #li x14, 0xffffffffffffbfff
    li x2, 0xffffffffffffbfff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffc2fb)
        # Testcase 119:  rd:x15(0xffffffffffff7fff), imm:0x1fc, result rd:x15(0xffffffffffff81fb)
    #li x15, 0xffffffffffff7fff
    li x2, 0xffffffffffff7fff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffff81fb)


    

    RVTEST_SIGBASE(x1,signature_25_0)

        # Testcase 120:  rd:x8(0xfffffffffffeffff), imm:0x3f8, result rd:x8(0xffffffffffff03f7)
    #li x8, 0xfffffffffffeffff
    li x2, 0xfffffffffffeffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffff03f7)
        # Testcase 121:  rd:x9(0xfffffffffffdffff), imm:0x3f4, result rd:x9(0xfffffffffffe03f3)
    #li x9, 0xfffffffffffdffff
    li x2, 0xfffffffffffdffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffe03f3)
        # Testcase 122:  rd:x10(0xfffffffffffbffff), imm:0x3ec, result rd:x10(0xfffffffffffc03eb)
    #li x10, 0xfffffffffffbffff
    li x2, 0xfffffffffffbffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffc03eb)
        # Testcase 123:  rd:x11(0xfffffffffff7ffff), imm:0x3dc, result rd:x11(0xfffffffffff803db)
    #li x11, 0xfffffffffff7ffff
    li x2, 0xfffffffffff7ffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffff803db)
        # Testcase 124:  rd:x12(0xffffffffffefffff), imm:0x3bc, result rd:x12(0xfffffffffff003bb)
    #li x12, 0xffffffffffefffff
    li x2, 0xffffffffffefffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffff003bb)


    

    RVTEST_SIGBASE(x1,signature_26_0)

        # Testcase 125:  rd:x13(0xffffffffffdfffff), imm:0x37c, result rd:x13(0xffffffffffe0037b)
    #li x13, 0xffffffffffdfffff
    li x2, 0xffffffffffdfffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffe0037b)
        # Testcase 126:  rd:x14(0xffffffffffbfffff), imm:0x2fc, result rd:x14(0xffffffffffc002fb)
    #li x14, 0xffffffffffbfffff
    li x2, 0xffffffffffbfffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffc002fb)
        # Testcase 127:  rd:x15(0xffffffffff7fffff), imm:0x1fc, result rd:x15(0xffffffffff8001fb)
    #li x15, 0xffffffffff7fffff
    li x2, 0xffffffffff7fffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffff8001fb)
        # Testcase 128:  rd:x8(0xfffffffffeffffff), imm:0x3f8, result rd:x8(0xffffffffff0003f7)
    #li x8, 0xfffffffffeffffff
    li x2, 0xfffffffffeffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffff0003f7)
        # Testcase 129:  rd:x9(0xfffffffffdffffff), imm:0x3f4, result rd:x9(0xfffffffffe0003f3)
    #li x9, 0xfffffffffdffffff
    li x2, 0xfffffffffdffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffe0003f3)


    

    RVTEST_SIGBASE(x1,signature_27_0)

        # Testcase 130:  rd:x10(0xfffffffffbffffff), imm:0x3ec, result rd:x10(0xfffffffffc0003eb)
    #li x10, 0xfffffffffbffffff
    li x2, 0xfffffffffbffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffc0003eb)
        # Testcase 131:  rd:x11(0xfffffffff7ffffff), imm:0x3dc, result rd:x11(0xfffffffff80003db)
    #li x11, 0xfffffffff7ffffff
    li x2, 0xfffffffff7ffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffff80003db)
        # Testcase 132:  rd:x12(0xffffffffefffffff), imm:0x3bc, result rd:x12(0xfffffffff00003bb)
    #li x12, 0xffffffffefffffff
    li x2, 0xffffffffefffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffff00003bb)
        # Testcase 133:  rd:x13(0xffffffffdfffffff), imm:0x37c, result rd:x13(0xffffffffe000037b)
    #li x13, 0xffffffffdfffffff
    li x2, 0xffffffffdfffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffe000037b)
        # Testcase 134:  rd:x14(0xffffffffbfffffff), imm:0x2fc, result rd:x14(0xffffffffc00002fb)
    #li x14, 0xffffffffbfffffff
    li x2, 0xffffffffbfffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffc00002fb)


    

    RVTEST_SIGBASE(x1,signature_28_0)

        # Testcase 135:  rd:x15(0xffffffff7fffffff), imm:0x1fc, result rd:x15(0xffffffff800001fb)
    #li x15, 0xffffffff7fffffff
    li x2, 0xffffffff7fffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffff800001fb)
        # Testcase 136:  rd:x8(0xfffffffeffffffff), imm:0x3f8, result rd:x8(0xffffffff000003f7)
    #li x8, 0xfffffffeffffffff
    li x2, 0xfffffffeffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff000003f7)
        # Testcase 137:  rd:x9(0xfffffffdffffffff), imm:0x3f4, result rd:x9(0xfffffffe000003f3)
    #li x9, 0xfffffffdffffffff
    li x2, 0xfffffffdffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffe000003f3)
        # Testcase 138:  rd:x10(0xfffffffbffffffff), imm:0x3ec, result rd:x10(0xfffffffc000003eb)
    #li x10, 0xfffffffbffffffff
    li x2, 0xfffffffbffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffc000003eb)
        # Testcase 139:  rd:x11(0xfffffff7ffffffff), imm:0x3dc, result rd:x11(0xfffffff8000003db)
    #li x11, 0xfffffff7ffffffff
    li x2, 0xfffffff7ffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffff8000003db)


    

    RVTEST_SIGBASE(x1,signature_29_0)

        # Testcase 140:  rd:x12(0xffffffefffffffff), imm:0x3bc, result rd:x12(0xfffffff0000003bb)
    #li x12, 0xffffffefffffffff
    li x2, 0xffffffefffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffff0000003bb)
        # Testcase 141:  rd:x13(0xffffffdfffffffff), imm:0x37c, result rd:x13(0xffffffe00000037b)
    #li x13, 0xffffffdfffffffff
    li x2, 0xffffffdfffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffe00000037b)
        # Testcase 142:  rd:x14(0xffffffbfffffffff), imm:0x2fc, result rd:x14(0xffffffc0000002fb)
    #li x14, 0xffffffbfffffffff
    li x2, 0xffffffbfffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffc0000002fb)
        # Testcase 143:  rd:x15(0xffffff7fffffffff), imm:0x1fc, result rd:x15(0xffffff80000001fb)
    #li x15, 0xffffff7fffffffff
    li x2, 0xffffff7fffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffff80000001fb)
        # Testcase 144:  rd:x8(0xfffffeffffffffff), imm:0x3f8, result rd:x8(0xffffff00000003f7)
    #li x8, 0xfffffeffffffffff
    li x2, 0xfffffeffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffff00000003f7)


    

    RVTEST_SIGBASE(x1,signature_30_0)

        # Testcase 145:  rd:x9(0xfffffdffffffffff), imm:0x3f4, result rd:x9(0xfffffe00000003f3)
    #li x9, 0xfffffdffffffffff
    li x2, 0xfffffdffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffe00000003f3)
        # Testcase 146:  rd:x10(0xfffffbffffffffff), imm:0x3ec, result rd:x10(0xfffffc00000003eb)
    #li x10, 0xfffffbffffffffff
    li x2, 0xfffffbffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffc00000003eb)
        # Testcase 147:  rd:x11(0xfffff7ffffffffff), imm:0x3dc, result rd:x11(0xfffff800000003db)
    #li x11, 0xfffff7ffffffffff
    li x2, 0xfffff7ffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffff800000003db)
        # Testcase 148:  rd:x12(0xffffefffffffffff), imm:0x3bc, result rd:x12(0xfffff000000003bb)
    #li x12, 0xffffefffffffffff
    li x2, 0xffffefffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffff000000003bb)
        # Testcase 149:  rd:x13(0xffffdfffffffffff), imm:0x37c, result rd:x13(0xffffe0000000037b)
    #li x13, 0xffffdfffffffffff
    li x2, 0xffffdfffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffe0000000037b)


    

    RVTEST_SIGBASE(x1,signature_31_0)

        # Testcase 150:  rd:x14(0xffffbfffffffffff), imm:0x2fc, result rd:x14(0xffffc000000002fb)
    #li x14, 0xffffbfffffffffff
    li x2, 0xffffbfffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffc000000002fb)
        # Testcase 151:  rd:x15(0xffff7fffffffffff), imm:0x1fc, result rd:x15(0xffff8000000001fb)
    #li x15, 0xffff7fffffffffff
    li x2, 0xffff7fffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffff8000000001fb)
        # Testcase 152:  rd:x8(0xfffeffffffffffff), imm:0x3f8, result rd:x8(0xffff0000000003f7)
    #li x8, 0xfffeffffffffffff
    li x2, 0xfffeffffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff0000000003f7)
        # Testcase 153:  rd:x9(0xfffdffffffffffff), imm:0x3f4, result rd:x9(0xfffe0000000003f3)
    #li x9, 0xfffdffffffffffff
    li x2, 0xfffdffffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffe0000000003f3)
        # Testcase 154:  rd:x10(0xfffbffffffffffff), imm:0x3ec, result rd:x10(0xfffc0000000003eb)
    #li x10, 0xfffbffffffffffff
    li x2, 0xfffbffffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffc0000000003eb)


    

    RVTEST_SIGBASE(x1,signature_32_0)

        # Testcase 155:  rd:x11(0xfff7ffffffffffff), imm:0x3dc, result rd:x11(0xfff80000000003db)
    #li x11, 0xfff7ffffffffffff
    li x2, 0xfff7ffffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfff80000000003db)
        # Testcase 156:  rd:x12(0xffefffffffffffff), imm:0x3bc, result rd:x12(0xfff00000000003bb)
    #li x12, 0xffefffffffffffff
    li x2, 0xffefffffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff00000000003bb)
        # Testcase 157:  rd:x13(0xffdfffffffffffff), imm:0x37c, result rd:x13(0xffe000000000037b)
    #li x13, 0xffdfffffffffffff
    li x2, 0xffdfffffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffe000000000037b)
        # Testcase 158:  rd:x14(0xffbfffffffffffff), imm:0x2fc, result rd:x14(0xffc00000000002fb)
    #li x14, 0xffbfffffffffffff
    li x2, 0xffbfffffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffc00000000002fb)
        # Testcase 159:  rd:x15(0xff7fffffffffffff), imm:0x1fc, result rd:x15(0xff800000000001fb)
    #li x15, 0xff7fffffffffffff
    li x2, 0xff7fffffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xff800000000001fb)


    

    RVTEST_SIGBASE(x1,signature_33_0)

        # Testcase 160:  rd:x8(0xfeffffffffffffff), imm:0x3f8, result rd:x8(0xff000000000003f7)
    #li x8, 0xfeffffffffffffff
    li x2, 0xfeffffffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff000000000003f7)
        # Testcase 161:  rd:x9(0xfdffffffffffffff), imm:0x3f4, result rd:x9(0xfe000000000003f3)
    #li x9, 0xfdffffffffffffff
    li x2, 0xfdffffffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfe000000000003f3)
        # Testcase 162:  rd:x10(0xfbffffffffffffff), imm:0x3ec, result rd:x10(0xfc000000000003eb)
    #li x10, 0xfbffffffffffffff
    li x2, 0xfbffffffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfc000000000003eb)
        # Testcase 163:  rd:x11(0xf7ffffffffffffff), imm:0x3dc, result rd:x11(0xf8000000000003db)
    #li x11, 0xf7ffffffffffffff
    li x2, 0xf7ffffffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xf8000000000003db)
        # Testcase 164:  rd:x12(0xefffffffffffffff), imm:0x3bc, result rd:x12(0xf0000000000003bb)
    #li x12, 0xefffffffffffffff
    li x2, 0xefffffffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf0000000000003bb)


    

    RVTEST_SIGBASE(x1,signature_34_0)

        # Testcase 165:  rd:x13(0xdfffffffffffffff), imm:0x37c, result rd:x13(0xe00000000000037b)
    #li x13, 0xdfffffffffffffff
    li x2, 0xdfffffffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xe00000000000037b)
        # Testcase 166:  rd:x14(0xbfffffffffffffff), imm:0x2fc, result rd:x14(0xc0000000000002fb)
    #li x14, 0xbfffffffffffffff
    li x2, 0xbfffffffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xc0000000000002fb)
        # Testcase 167:  rd:x15(0x7fffffffffffffff), imm:0x1fc, result rd:x15(0x80000000000001fb)
    #li x15, 0x7fffffffffffffff
    li x2, 0x7fffffffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000000000001fb)
        # Testcase 168:  rd:x8(0x00000001), imm:0x4, result rd:x8(0x00000005)
    #li x8, 0x1
    li x2, 0x1
    c.addi4spn x8, x2, 0x4
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5)
        # Testcase 169:  rd:x9(0x00000002), imm:0x8, result rd:x9(0x0000000a)
    #li x9, 0x2
    li x2, 0x2
    c.addi4spn x9, x2, 0x8
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xa)


    

    RVTEST_SIGBASE(x1,signature_35_0)

        # Testcase 170:  rd:x10(0x00000004), imm:0x10, result rd:x10(0x00000014)
    #li x10, 0x4
    li x2, 0x4
    c.addi4spn x10, x2, 0x10
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x14)
        # Testcase 171:  rd:x11(0x00000008), imm:0x20, result rd:x11(0x00000028)
    #li x11, 0x8
    li x2, 0x8
    c.addi4spn x11, x2, 0x20
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x28)
        # Testcase 172:  rd:x12(0x00000010), imm:0x40, result rd:x12(0x00000050)
    #li x12, 0x10
    li x2, 0x10
    c.addi4spn x12, x2, 0x40
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x50)
        # Testcase 173:  rd:x13(0x00000020), imm:0x80, result rd:x13(0x000000a0)
    #li x13, 0x20
    li x2, 0x20
    c.addi4spn x13, x2, 0x80
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xa0)
        # Testcase 174:  rd:x14(0x00000040), imm:0x100, result rd:x14(0x00000140)
    #li x14, 0x40
    li x2, 0x40
    c.addi4spn x14, x2, 0x100
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x140)


    

    RVTEST_SIGBASE(x1,signature_36_0)

        # Testcase 175:  rd:x15(0x00000080), imm:0x200, result rd:x15(0x00000280)
    #li x15, 0x80
    li x2, 0x80
    c.addi4spn x15, x2, 0x200
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x280)
        # Testcase 176:  rd:x8(0x00000100), imm:0x3f8, result rd:x8(0x000004f8)
    #li x8, 0x100
    li x2, 0x100
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f8)
        # Testcase 177:  rd:x9(0x00000200), imm:0x3f4, result rd:x9(0x000005f4)
    #li x9, 0x200
    li x2, 0x200
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x5f4)
        # Testcase 178:  rd:x10(0x00000400), imm:0x3ec, result rd:x10(0x000007ec)
    #li x10, 0x400
    li x2, 0x400
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x7ec)
        # Testcase 179:  rd:x11(0x00000800), imm:0x3dc, result rd:x11(0x00000bdc)
    #li x11, 0x800
    li x2, 0x800
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xbdc)


    

    RVTEST_SIGBASE(x1,signature_37_0)

        # Testcase 180:  rd:x12(0x00001000), imm:0x3bc, result rd:x12(0x000013bc)
    #li x12, 0x1000
    li x2, 0x1000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x13bc)
        # Testcase 181:  rd:x13(0x00002000), imm:0x37c, result rd:x13(0x0000237c)
    #li x13, 0x2000
    li x2, 0x2000
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x237c)
        # Testcase 182:  rd:x14(0x00004000), imm:0x2fc, result rd:x14(0x000042fc)
    #li x14, 0x4000
    li x2, 0x4000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x42fc)
        # Testcase 183:  rd:x15(0x00008000), imm:0x1fc, result rd:x15(0x000081fc)
    #li x15, 0x8000
    li x2, 0x8000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x81fc)
        # Testcase 184:  rd:x8(0x00010000), imm:0x3f8, result rd:x8(0x000103f8)
    #li x8, 0x10000
    li x2, 0x10000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x103f8)


    

    RVTEST_SIGBASE(x1,signature_38_0)

        # Testcase 185:  rd:x9(0x00020000), imm:0x3f4, result rd:x9(0x000203f4)
    #li x9, 0x20000
    li x2, 0x20000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x203f4)
        # Testcase 186:  rd:x10(0x00040000), imm:0x3ec, result rd:x10(0x000403ec)
    #li x10, 0x40000
    li x2, 0x40000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x403ec)
        # Testcase 187:  rd:x11(0x00080000), imm:0x3dc, result rd:x11(0x000803dc)
    #li x11, 0x80000
    li x2, 0x80000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x803dc)
        # Testcase 188:  rd:x12(0x00100000), imm:0x3bc, result rd:x12(0x001003bc)
    #li x12, 0x100000
    li x2, 0x100000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1003bc)
        # Testcase 189:  rd:x13(0x00200000), imm:0x37c, result rd:x13(0x0020037c)
    #li x13, 0x200000
    li x2, 0x200000
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20037c)


    

    RVTEST_SIGBASE(x1,signature_39_0)

        # Testcase 190:  rd:x14(0x00400000), imm:0x2fc, result rd:x14(0x004002fc)
    #li x14, 0x400000
    li x2, 0x400000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4002fc)
        # Testcase 191:  rd:x15(0x00800000), imm:0x1fc, result rd:x15(0x008001fc)
    #li x15, 0x800000
    li x2, 0x800000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8001fc)
        # Testcase 192:  rd:x8(0x01000000), imm:0x3f8, result rd:x8(0x010003f8)
    #li x8, 0x1000000
    li x2, 0x1000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10003f8)
        # Testcase 193:  rd:x9(0x02000000), imm:0x3f4, result rd:x9(0x020003f4)
    #li x9, 0x2000000
    li x2, 0x2000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20003f4)
        # Testcase 194:  rd:x10(0x04000000), imm:0x3ec, result rd:x10(0x040003ec)
    #li x10, 0x4000000
    li x2, 0x4000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40003ec)


    

    RVTEST_SIGBASE(x1,signature_40_0)

        # Testcase 195:  rd:x11(0x08000000), imm:0x3dc, result rd:x11(0x080003dc)
    #li x11, 0x8000000
    li x2, 0x8000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80003dc)
        # Testcase 196:  rd:x12(0x10000000), imm:0x3bc, result rd:x12(0x100003bc)
    #li x12, 0x10000000
    li x2, 0x10000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100003bc)
        # Testcase 197:  rd:x13(0x20000000), imm:0x37c, result rd:x13(0x2000037c)
    #li x13, 0x20000000
    li x2, 0x20000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000037c)
        # Testcase 198:  rd:x14(0x40000000), imm:0x2fc, result rd:x14(0x400002fc)
    #li x14, 0x40000000
    li x2, 0x40000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400002fc)
        # Testcase 199:  rd:x15(0x80000000), imm:0x1fc, result rd:x15(0x800001fc)
    #li x15, 0x80000000
    li x2, 0x80000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fc)


    

    RVTEST_SIGBASE(x1,signature_41_0)

        # Testcase 200:  rd:x8(0x100000000), imm:0x3f8, result rd:x8(0x1000003f8)
    #li x8, 0x100000000
    li x2, 0x100000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1000003f8)
        # Testcase 201:  rd:x9(0x200000000), imm:0x3f4, result rd:x9(0x2000003f4)
    #li x9, 0x200000000
    li x2, 0x200000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x2000003f4)
        # Testcase 202:  rd:x10(0x400000000), imm:0x3ec, result rd:x10(0x4000003ec)
    #li x10, 0x400000000
    li x2, 0x400000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x4000003ec)
        # Testcase 203:  rd:x11(0x800000000), imm:0x3dc, result rd:x11(0x8000003dc)
    #li x11, 0x800000000
    li x2, 0x800000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x8000003dc)
        # Testcase 204:  rd:x12(0x1000000000), imm:0x3bc, result rd:x12(0x10000003bc)
    #li x12, 0x1000000000
    li x2, 0x1000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x10000003bc)


    

    RVTEST_SIGBASE(x1,signature_42_0)

        # Testcase 205:  rd:x13(0x2000000000), imm:0x37c, result rd:x13(0x200000037c)
    #li x13, 0x2000000000
    li x2, 0x2000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x200000037c)
        # Testcase 206:  rd:x14(0x4000000000), imm:0x2fc, result rd:x14(0x40000002fc)
    #li x14, 0x4000000000
    li x2, 0x4000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x40000002fc)
        # Testcase 207:  rd:x15(0x8000000000), imm:0x1fc, result rd:x15(0x80000001fc)
    #li x15, 0x8000000000
    li x2, 0x8000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000001fc)
        # Testcase 208:  rd:x8(0x10000000000), imm:0x3f8, result rd:x8(0x100000003f8)
    #li x8, 0x10000000000
    li x2, 0x10000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x100000003f8)
        # Testcase 209:  rd:x9(0x20000000000), imm:0x3f4, result rd:x9(0x200000003f4)
    #li x9, 0x20000000000
    li x2, 0x20000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x200000003f4)


    

    RVTEST_SIGBASE(x1,signature_43_0)

        # Testcase 210:  rd:x10(0x40000000000), imm:0x3ec, result rd:x10(0x400000003ec)
    #li x10, 0x40000000000
    li x2, 0x40000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x400000003ec)
        # Testcase 211:  rd:x11(0x80000000000), imm:0x3dc, result rd:x11(0x800000003dc)
    #li x11, 0x80000000000
    li x2, 0x80000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x800000003dc)
        # Testcase 212:  rd:x12(0x100000000000), imm:0x3bc, result rd:x12(0x1000000003bc)
    #li x12, 0x100000000000
    li x2, 0x100000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1000000003bc)
        # Testcase 213:  rd:x13(0x200000000000), imm:0x37c, result rd:x13(0x20000000037c)
    #li x13, 0x200000000000
    li x2, 0x200000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20000000037c)
        # Testcase 214:  rd:x14(0x400000000000), imm:0x2fc, result rd:x14(0x4000000002fc)
    #li x14, 0x400000000000
    li x2, 0x400000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4000000002fc)


    

    RVTEST_SIGBASE(x1,signature_44_0)

        # Testcase 215:  rd:x15(0x800000000000), imm:0x1fc, result rd:x15(0x8000000001fc)
    #li x15, 0x800000000000
    li x2, 0x800000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8000000001fc)
        # Testcase 216:  rd:x8(0x1000000000000), imm:0x3f8, result rd:x8(0x10000000003f8)
    #li x8, 0x1000000000000
    li x2, 0x1000000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10000000003f8)
        # Testcase 217:  rd:x9(0x2000000000000), imm:0x3f4, result rd:x9(0x20000000003f4)
    #li x9, 0x2000000000000
    li x2, 0x2000000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20000000003f4)
        # Testcase 218:  rd:x10(0x4000000000000), imm:0x3ec, result rd:x10(0x40000000003ec)
    #li x10, 0x4000000000000
    li x2, 0x4000000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40000000003ec)
        # Testcase 219:  rd:x11(0x8000000000000), imm:0x3dc, result rd:x11(0x80000000003dc)
    #li x11, 0x8000000000000
    li x2, 0x8000000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80000000003dc)


    

    RVTEST_SIGBASE(x1,signature_45_0)

        # Testcase 220:  rd:x12(0x10000000000000), imm:0x3bc, result rd:x12(0x100000000003bc)
    #li x12, 0x10000000000000
    li x2, 0x10000000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100000000003bc)
        # Testcase 221:  rd:x13(0x20000000000000), imm:0x37c, result rd:x13(0x2000000000037c)
    #li x13, 0x20000000000000
    li x2, 0x20000000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000000000037c)
        # Testcase 222:  rd:x14(0x40000000000000), imm:0x2fc, result rd:x14(0x400000000002fc)
    #li x14, 0x40000000000000
    li x2, 0x40000000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400000000002fc)
        # Testcase 223:  rd:x15(0x80000000000000), imm:0x1fc, result rd:x15(0x800000000001fc)
    #li x15, 0x80000000000000
    li x2, 0x80000000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800000000001fc)
        # Testcase 224:  rd:x8(0x100000000000000), imm:0x3f8, result rd:x8(0x1000000000003f8)
    #li x8, 0x100000000000000
    li x2, 0x100000000000000
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1000000000003f8)


    

    RVTEST_SIGBASE(x1,signature_46_0)

        # Testcase 225:  rd:x9(0x200000000000000), imm:0x3f4, result rd:x9(0x2000000000003f4)
    #li x9, 0x200000000000000
    li x2, 0x200000000000000
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x2000000000003f4)
        # Testcase 226:  rd:x10(0x400000000000000), imm:0x3ec, result rd:x10(0x4000000000003ec)
    #li x10, 0x400000000000000
    li x2, 0x400000000000000
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x4000000000003ec)
        # Testcase 227:  rd:x11(0x800000000000000), imm:0x3dc, result rd:x11(0x8000000000003dc)
    #li x11, 0x800000000000000
    li x2, 0x800000000000000
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x8000000000003dc)
        # Testcase 228:  rd:x12(0x1000000000000000), imm:0x3bc, result rd:x12(0x10000000000003bc)
    #li x12, 0x1000000000000000
    li x2, 0x1000000000000000
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x10000000000003bc)
        # Testcase 229:  rd:x13(0x2000000000000000), imm:0x37c, result rd:x13(0x200000000000037c)
    #li x13, 0x2000000000000000
    li x2, 0x2000000000000000
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x200000000000037c)


    

    RVTEST_SIGBASE(x1,signature_47_0)

        # Testcase 230:  rd:x14(0x4000000000000000), imm:0x2fc, result rd:x14(0x40000000000002fc)
    #li x14, 0x4000000000000000
    li x2, 0x4000000000000000
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x40000000000002fc)
        # Testcase 231:  rd:x15(0x8000000000000000), imm:0x1fc, result rd:x15(0x80000000000001fc)
    #li x15, 0x8000000000000000
    li x2, 0x8000000000000000
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000000000001fc)
        # Testcase 232:  rd:x8(0xfffffffffffffffe), imm:0x3f8, result rd:x8(0x000003f6)
    #li x8, 0xfffffffffffffffe
    li x2, 0xfffffffffffffffe
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f6)
        # Testcase 233:  rd:x9(0xfffffffffffffffd), imm:0x3f4, result rd:x9(0x000003f1)
    #li x9, 0xfffffffffffffffd
    li x2, 0xfffffffffffffffd
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3f1)
        # Testcase 234:  rd:x10(0xfffffffffffffffb), imm:0x3ec, result rd:x10(0x000003e7)
    #li x10, 0xfffffffffffffffb
    li x2, 0xfffffffffffffffb
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3e7)


    

    RVTEST_SIGBASE(x1,signature_48_0)

        # Testcase 235:  rd:x11(0xfffffffffffffff7), imm:0x3dc, result rd:x11(0x000003d3)
    #li x11, 0xfffffffffffffff7
    li x2, 0xfffffffffffffff7
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3d3)
        # Testcase 236:  rd:x12(0xffffffffffffffef), imm:0x3bc, result rd:x12(0x000003ab)
    #li x12, 0xffffffffffffffef
    li x2, 0xffffffffffffffef
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x3ab)
        # Testcase 237:  rd:x13(0xffffffffffffffdf), imm:0x37c, result rd:x13(0x0000035b)
    #li x13, 0xffffffffffffffdf
    li x2, 0xffffffffffffffdf
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x35b)
        # Testcase 238:  rd:x14(0xffffffffffffffbf), imm:0x2fc, result rd:x14(0x000002bb)
    #li x14, 0xffffffffffffffbf
    li x2, 0xffffffffffffffbf
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x2bb)
        # Testcase 239:  rd:x15(0xffffffffffffff7f), imm:0x1fc, result rd:x15(0x0000017b)
    #li x15, 0xffffffffffffff7f
    li x2, 0xffffffffffffff7f
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x17b)


    

    RVTEST_SIGBASE(x1,signature_49_0)

        # Testcase 240:  rd:x8(0xfffffffffffffeff), imm:0x3f8, result rd:x8(0x000002f7)
    #li x8, 0xfffffffffffffeff
    li x2, 0xfffffffffffffeff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f7)
        # Testcase 241:  rd:x9(0xfffffffffffffdff), imm:0x3f4, result rd:x9(0x000001f3)
    #li x9, 0xfffffffffffffdff
    li x2, 0xfffffffffffffdff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x1f3)
        # Testcase 242:  rd:x10(0xfffffffffffffbff), imm:0x3ec, result rd:x10(0xffffffffffffffeb)
    #li x10, 0xfffffffffffffbff
    li x2, 0xfffffffffffffbff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffffffffffeb)
        # Testcase 243:  rd:x11(0xfffffffffffff7ff), imm:0x3dc, result rd:x11(0xfffffffffffffbdb)
    #li x11, 0xfffffffffffff7ff
    li x2, 0xfffffffffffff7ff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffffffbdb)
        # Testcase 244:  rd:x12(0xffffffffffffefff), imm:0x3bc, result rd:x12(0xfffffffffffff3bb)
    #li x12, 0xffffffffffffefff
    li x2, 0xffffffffffffefff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffffff3bb)


    

    RVTEST_SIGBASE(x1,signature_50_0)

        # Testcase 245:  rd:x13(0xffffffffffffdfff), imm:0x37c, result rd:x13(0xffffffffffffe37b)
    #li x13, 0xffffffffffffdfff
    li x2, 0xffffffffffffdfff
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffffe37b)
        # Testcase 246:  rd:x14(0xffffffffffffbfff), imm:0x2fc, result rd:x14(0xffffffffffffc2fb)
    #li x14, 0xffffffffffffbfff
    li x2, 0xffffffffffffbfff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffffc2fb)
        # Testcase 247:  rd:x15(0xffffffffffff7fff), imm:0x1fc, result rd:x15(0xffffffffffff81fb)
    #li x15, 0xffffffffffff7fff
    li x2, 0xffffffffffff7fff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffffff81fb)
        # Testcase 248:  rd:x8(0xfffffffffffeffff), imm:0x3f8, result rd:x8(0xffffffffffff03f7)
    #li x8, 0xfffffffffffeffff
    li x2, 0xfffffffffffeffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffffff03f7)
        # Testcase 249:  rd:x9(0xfffffffffffdffff), imm:0x3f4, result rd:x9(0xfffffffffffe03f3)
    #li x9, 0xfffffffffffdffff
    li x2, 0xfffffffffffdffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffe03f3)


    

    RVTEST_SIGBASE(x1,signature_51_0)

        # Testcase 250:  rd:x10(0xfffffffffffbffff), imm:0x3ec, result rd:x10(0xfffffffffffc03eb)
    #li x10, 0xfffffffffffbffff
    li x2, 0xfffffffffffbffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffffc03eb)
        # Testcase 251:  rd:x11(0xfffffffffff7ffff), imm:0x3dc, result rd:x11(0xfffffffffff803db)
    #li x11, 0xfffffffffff7ffff
    li x2, 0xfffffffffff7ffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffffff803db)
        # Testcase 252:  rd:x12(0xffffffffffefffff), imm:0x3bc, result rd:x12(0xfffffffffff003bb)
    #li x12, 0xffffffffffefffff
    li x2, 0xffffffffffefffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffffff003bb)
        # Testcase 253:  rd:x13(0xffffffffffdfffff), imm:0x37c, result rd:x13(0xffffffffffe0037b)
    #li x13, 0xffffffffffdfffff
    li x2, 0xffffffffffdfffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffffe0037b)
        # Testcase 254:  rd:x14(0xffffffffffbfffff), imm:0x2fc, result rd:x14(0xffffffffffc002fb)
    #li x14, 0xffffffffffbfffff
    li x2, 0xffffffffffbfffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffffc002fb)


    

    RVTEST_SIGBASE(x1,signature_52_0)

        # Testcase 255:  rd:x15(0xffffffffff7fffff), imm:0x1fc, result rd:x15(0xffffffffff8001fb)
    #li x15, 0xffffffffff7fffff
    li x2, 0xffffffffff7fffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffffff8001fb)
        # Testcase 256:  rd:x8(0xfffffffffeffffff), imm:0x3f8, result rd:x8(0xffffffffff0003f7)
    #li x8, 0xfffffffffeffffff
    li x2, 0xfffffffffeffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffffff0003f7)
        # Testcase 257:  rd:x9(0xfffffffffdffffff), imm:0x3f4, result rd:x9(0xfffffffffe0003f3)
    #li x9, 0xfffffffffdffffff
    li x2, 0xfffffffffdffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffe0003f3)
        # Testcase 258:  rd:x10(0xfffffffffbffffff), imm:0x3ec, result rd:x10(0xfffffffffc0003eb)
    #li x10, 0xfffffffffbffffff
    li x2, 0xfffffffffbffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffffc0003eb)
        # Testcase 259:  rd:x11(0xfffffffff7ffffff), imm:0x3dc, result rd:x11(0xfffffffff80003db)
    #li x11, 0xfffffffff7ffffff
    li x2, 0xfffffffff7ffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffffff80003db)


    

    RVTEST_SIGBASE(x1,signature_53_0)

        # Testcase 260:  rd:x12(0xffffffffefffffff), imm:0x3bc, result rd:x12(0xfffffffff00003bb)
    #li x12, 0xffffffffefffffff
    li x2, 0xffffffffefffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffffff00003bb)
        # Testcase 261:  rd:x13(0xffffffffdfffffff), imm:0x37c, result rd:x13(0xffffffffe000037b)
    #li x13, 0xffffffffdfffffff
    li x2, 0xffffffffdfffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffffe000037b)
        # Testcase 262:  rd:x14(0xffffffffbfffffff), imm:0x2fc, result rd:x14(0xffffffffc00002fb)
    #li x14, 0xffffffffbfffffff
    li x2, 0xffffffffbfffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffffc00002fb)
        # Testcase 263:  rd:x15(0xffffffff7fffffff), imm:0x1fc, result rd:x15(0xffffffff800001fb)
    #li x15, 0xffffffff7fffffff
    li x2, 0xffffffff7fffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffffff800001fb)
        # Testcase 264:  rd:x8(0xfffffffeffffffff), imm:0x3f8, result rd:x8(0xffffffff000003f7)
    #li x8, 0xfffffffeffffffff
    li x2, 0xfffffffeffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff000003f7)


    

    RVTEST_SIGBASE(x1,signature_54_0)

        # Testcase 265:  rd:x9(0xfffffffdffffffff), imm:0x3f4, result rd:x9(0xfffffffe000003f3)
    #li x9, 0xfffffffdffffffff
    li x2, 0xfffffffdffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffe000003f3)
        # Testcase 266:  rd:x10(0xfffffffbffffffff), imm:0x3ec, result rd:x10(0xfffffffc000003eb)
    #li x10, 0xfffffffbffffffff
    li x2, 0xfffffffbffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffffc000003eb)
        # Testcase 267:  rd:x11(0xfffffff7ffffffff), imm:0x3dc, result rd:x11(0xfffffff8000003db)
    #li x11, 0xfffffff7ffffffff
    li x2, 0xfffffff7ffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffff8000003db)
        # Testcase 268:  rd:x12(0xffffffefffffffff), imm:0x3bc, result rd:x12(0xfffffff0000003bb)
    #li x12, 0xffffffefffffffff
    li x2, 0xffffffefffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffffff0000003bb)
        # Testcase 269:  rd:x13(0xffffffdfffffffff), imm:0x37c, result rd:x13(0xffffffe00000037b)
    #li x13, 0xffffffdfffffffff
    li x2, 0xffffffdfffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffffe00000037b)


    

    RVTEST_SIGBASE(x1,signature_55_0)

        # Testcase 270:  rd:x14(0xffffffbfffffffff), imm:0x2fc, result rd:x14(0xffffffc0000002fb)
    #li x14, 0xffffffbfffffffff
    li x2, 0xffffffbfffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffffc0000002fb)
        # Testcase 271:  rd:x15(0xffffff7fffffffff), imm:0x1fc, result rd:x15(0xffffff80000001fb)
    #li x15, 0xffffff7fffffffff
    li x2, 0xffffff7fffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffffff80000001fb)
        # Testcase 272:  rd:x8(0xfffffeffffffffff), imm:0x3f8, result rd:x8(0xffffff00000003f7)
    #li x8, 0xfffffeffffffffff
    li x2, 0xfffffeffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffff00000003f7)
        # Testcase 273:  rd:x9(0xfffffdffffffffff), imm:0x3f4, result rd:x9(0xfffffe00000003f3)
    #li x9, 0xfffffdffffffffff
    li x2, 0xfffffdffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffe00000003f3)
        # Testcase 274:  rd:x10(0xfffffbffffffffff), imm:0x3ec, result rd:x10(0xfffffc00000003eb)
    #li x10, 0xfffffbffffffffff
    li x2, 0xfffffbffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffffc00000003eb)


    

    RVTEST_SIGBASE(x1,signature_56_0)

        # Testcase 275:  rd:x11(0xfffff7ffffffffff), imm:0x3dc, result rd:x11(0xfffff800000003db)
    #li x11, 0xfffff7ffffffffff
    li x2, 0xfffff7ffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffff800000003db)
        # Testcase 276:  rd:x12(0xffffefffffffffff), imm:0x3bc, result rd:x12(0xfffff000000003bb)
    #li x12, 0xffffefffffffffff
    li x2, 0xffffefffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffff000000003bb)
        # Testcase 277:  rd:x13(0xffffdfffffffffff), imm:0x37c, result rd:x13(0xffffe0000000037b)
    #li x13, 0xffffdfffffffffff
    li x2, 0xffffdfffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffe0000000037b)
        # Testcase 278:  rd:x14(0xffffbfffffffffff), imm:0x2fc, result rd:x14(0xffffc000000002fb)
    #li x14, 0xffffbfffffffffff
    li x2, 0xffffbfffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffc000000002fb)
        # Testcase 279:  rd:x15(0xffff7fffffffffff), imm:0x1fc, result rd:x15(0xffff8000000001fb)
    #li x15, 0xffff7fffffffffff
    li x2, 0xffff7fffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffff8000000001fb)


    

    RVTEST_SIGBASE(x1,signature_57_0)

        # Testcase 280:  rd:x8(0xfffeffffffffffff), imm:0x3f8, result rd:x8(0xffff0000000003f7)
    #li x8, 0xfffeffffffffffff
    li x2, 0xfffeffffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff0000000003f7)
        # Testcase 281:  rd:x9(0xfffdffffffffffff), imm:0x3f4, result rd:x9(0xfffe0000000003f3)
    #li x9, 0xfffdffffffffffff
    li x2, 0xfffdffffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffe0000000003f3)
        # Testcase 282:  rd:x10(0xfffbffffffffffff), imm:0x3ec, result rd:x10(0xfffc0000000003eb)
    #li x10, 0xfffbffffffffffff
    li x2, 0xfffbffffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffc0000000003eb)
        # Testcase 283:  rd:x11(0xfff7ffffffffffff), imm:0x3dc, result rd:x11(0xfff80000000003db)
    #li x11, 0xfff7ffffffffffff
    li x2, 0xfff7ffffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfff80000000003db)
        # Testcase 284:  rd:x12(0xffefffffffffffff), imm:0x3bc, result rd:x12(0xfff00000000003bb)
    #li x12, 0xffefffffffffffff
    li x2, 0xffefffffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff00000000003bb)


    

    RVTEST_SIGBASE(x1,signature_58_0)

        # Testcase 285:  rd:x13(0xffdfffffffffffff), imm:0x37c, result rd:x13(0xffe000000000037b)
    #li x13, 0xffdfffffffffffff
    li x2, 0xffdfffffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffe000000000037b)
        # Testcase 286:  rd:x14(0xffbfffffffffffff), imm:0x2fc, result rd:x14(0xffc00000000002fb)
    #li x14, 0xffbfffffffffffff
    li x2, 0xffbfffffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffc00000000002fb)
        # Testcase 287:  rd:x15(0xff7fffffffffffff), imm:0x1fc, result rd:x15(0xff800000000001fb)
    #li x15, 0xff7fffffffffffff
    li x2, 0xff7fffffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xff800000000001fb)
        # Testcase 288:  rd:x8(0xfeffffffffffffff), imm:0x3f8, result rd:x8(0xff000000000003f7)
    #li x8, 0xfeffffffffffffff
    li x2, 0xfeffffffffffffff
    c.addi4spn x8, x2, 0x3f8
    sd x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff000000000003f7)
        # Testcase 289:  rd:x9(0xfdffffffffffffff), imm:0x3f4, result rd:x9(0xfe000000000003f3)
    #li x9, 0xfdffffffffffffff
    li x2, 0xfdffffffffffffff
    c.addi4spn x9, x2, 0x3f4
    sd x9, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfe000000000003f3)


    

    RVTEST_SIGBASE(x1,signature_59_0)

        # Testcase 290:  rd:x10(0xfbffffffffffffff), imm:0x3ec, result rd:x10(0xfc000000000003eb)
    #li x10, 0xfbffffffffffffff
    li x2, 0xfbffffffffffffff
    c.addi4spn x10, x2, 0x3ec
    sd x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfc000000000003eb)
        # Testcase 291:  rd:x11(0xf7ffffffffffffff), imm:0x3dc, result rd:x11(0xf8000000000003db)
    #li x11, 0xf7ffffffffffffff
    li x2, 0xf7ffffffffffffff
    c.addi4spn x11, x2, 0x3dc
    sd x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xf8000000000003db)
        # Testcase 292:  rd:x12(0xefffffffffffffff), imm:0x3bc, result rd:x12(0xf0000000000003bb)
    #li x12, 0xefffffffffffffff
    li x2, 0xefffffffffffffff
    c.addi4spn x12, x2, 0x3bc
    sd x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf0000000000003bb)
        # Testcase 293:  rd:x13(0xdfffffffffffffff), imm:0x37c, result rd:x13(0xe00000000000037b)
    #li x13, 0xdfffffffffffffff
    li x2, 0xdfffffffffffffff
    c.addi4spn x13, x2, 0x37c
    sd x13, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xe00000000000037b)
        # Testcase 294:  rd:x14(0xbfffffffffffffff), imm:0x2fc, result rd:x14(0xc0000000000002fb)
    #li x14, 0xbfffffffffffffff
    li x2, 0xbfffffffffffffff
    c.addi4spn x14, x2, 0x2fc
    sd x14, 32(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xc0000000000002fb)


    

    RVTEST_SIGBASE(x1,signature_60_0)

        # Testcase 295:  rd:x15(0x7fffffffffffffff), imm:0x1fc, result rd:x15(0x80000000000001fb)
    #li x15, 0x7fffffffffffffff
    li x2, 0x7fffffffffffffff
    c.addi4spn x15, x2, 0x1fc
    sd x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x80000000000001fb)
	
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

