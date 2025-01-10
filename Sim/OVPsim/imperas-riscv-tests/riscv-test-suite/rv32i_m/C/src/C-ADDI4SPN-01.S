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
RVTEST_ISA("RV32C")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*C.*);def TEST_CASE_1=True;",c.addi4spn)
    RVTEST_CASE(1,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zca.*);def TEST_CASE_1=True;",c.addi4spn)

    RVTEST_SIGBASE(x1,signature_1_0)

        # Testcase 0:  rd:x11(0x54f4aeeb), imm:0x9c, result rd:x11(0x54f4af87)
    #li x11, 0x54f4aeeb
    li x2, 0x54f4aeeb
    c.addi4spn x11, x2, 0x9c
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x54f4af87)
        # Testcase 1:  rd:x12(0xe1b1199b), imm:0x144, result rd:x12(0xe1b11adf)
    #li x12, 0xe1b1199b
    li x2, 0xe1b1199b
    c.addi4spn x12, x2, 0x144
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xe1b11adf)
        # Testcase 2:  rd:x14(0xb26566a0), imm:0x194, result rd:x14(0xb2656834)
    #li x14, 0xb26566a0
    li x2, 0xb26566a0
    c.addi4spn x14, x2, 0x194
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xb2656834)
        # Testcase 3:  rd:x12(0xf27008e6), imm:0x190, result rd:x12(0xf2700a76)
    #li x12, 0xf27008e6
    li x2, 0xf27008e6
    c.addi4spn x12, x2, 0x190
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf2700a76)
        # Testcase 4:  rd:x10(0x0c8484a3), imm:0x78, result rd:x10(0x0c84851b)
    #li x10, 0xc8484a3
    li x2, 0xc8484a3
    c.addi4spn x10, x2, 0x78
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xc84851b)


    

    RVTEST_SIGBASE(x1,signature_2_0)

        # Testcase 5:  rd:x8(0xa783d03f), imm:0x37c, result rd:x8(0xa783d3bb)
    #li x8, 0xa783d03f
    li x2, 0xa783d03f
    c.addi4spn x8, x2, 0x37c
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa783d3bb)
        # Testcase 6:  rd:x11(0xfd7b9df8), imm:0x39c, result rd:x11(0xfd7ba194)
    #li x11, 0xfd7b9df8
    li x2, 0xfd7b9df8
    c.addi4spn x11, x2, 0x39c
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfd7ba194)
        # Testcase 7:  rd:x15(0x0afaa29d), imm:0x344, result rd:x15(0x0afaa5e1)
    #li x15, 0xafaa29d
    li x2, 0xafaa29d
    c.addi4spn x15, x2, 0x344
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xafaa5e1)
        # Testcase 8:  rd:x13(0x413f2c62), imm:0x3d0, result rd:x13(0x413f3032)
    #li x13, 0x413f2c62
    li x2, 0x413f2c62
    c.addi4spn x13, x2, 0x3d0
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x413f3032)
        # Testcase 9:  rd:x13(0x2c370a9a), imm:0x300, result rd:x13(0x2c370d9a)
    #li x13, 0x2c370a9a
    li x2, 0x2c370a9a
    c.addi4spn x13, x2, 0x300
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2c370d9a)


    

    RVTEST_SIGBASE(x1,signature_3_0)

        # Testcase 10:  rd:x8(0x2882a0b3), imm:0xf8, result rd:x8(0x2882a1ab)
    #li x8, 0x2882a0b3
    li x2, 0x2882a0b3
    c.addi4spn x8, x2, 0xf8
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2882a1ab)
        # Testcase 11:  rd:x13(0x91dd5ad6), imm:0x2b8, result rd:x13(0x91dd5d8e)
    #li x13, 0x91dd5ad6
    li x2, 0x91dd5ad6
    c.addi4spn x13, x2, 0x2b8
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x91dd5d8e)
        # Testcase 12:  rd:x12(0x42f1d629), imm:0x140, result rd:x12(0x42f1d769)
    #li x12, 0x42f1d629
    li x2, 0x42f1d629
    c.addi4spn x12, x2, 0x140
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x42f1d769)
        # Testcase 13:  rd:x11(0xcddbdf6f), imm:0x1c4, result rd:x11(0xcddbe133)
    #li x11, 0xcddbdf6f
    li x2, 0xcddbdf6f
    c.addi4spn x11, x2, 0x1c4
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xcddbe133)
        # Testcase 14:  rd:x9(0x4d236af8), imm:0x360, result rd:x9(0x4d236e58)
    #li x9, 0x4d236af8
    li x2, 0x4d236af8
    c.addi4spn x9, x2, 0x360
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x4d236e58)


    

    RVTEST_SIGBASE(x1,signature_4_0)

        # Testcase 15:  rd:x10(0x983b9f63), imm:0x1b4, result rd:x10(0x983ba117)
    #li x10, 0x983b9f63
    li x2, 0x983b9f63
    c.addi4spn x10, x2, 0x1b4
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x983ba117)
        # Testcase 16:  rd:x10(0x1fbe3ca6), imm:0x294, result rd:x10(0x1fbe3f3a)
    #li x10, 0x1fbe3ca6
    li x2, 0x1fbe3ca6
    c.addi4spn x10, x2, 0x294
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x1fbe3f3a)
        # Testcase 17:  rd:x10(0x353a8593), imm:0x84, result rd:x10(0x353a8617)
    #li x10, 0x353a8593
    li x2, 0x353a8593
    c.addi4spn x10, x2, 0x84
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x353a8617)
        # Testcase 18:  rd:x15(0x66268a1a), imm:0x2a0, result rd:x15(0x66268cba)
    #li x15, 0x66268a1a
    li x2, 0x66268a1a
    c.addi4spn x15, x2, 0x2a0
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x66268cba)
        # Testcase 19:  rd:x9(0x28ac54a3), imm:0x6c, result rd:x9(0x28ac550f)
    #li x9, 0x28ac54a3
    li x2, 0x28ac54a3
    c.addi4spn x9, x2, 0x6c
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x28ac550f)


    

    RVTEST_SIGBASE(x1,signature_5_0)

        # Testcase 20:  rd:x15(0xdc3713a2), imm:0x230, result rd:x15(0xdc3715d2)
    #li x15, 0xdc3713a2
    li x2, 0xdc3713a2
    c.addi4spn x15, x2, 0x230
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xdc3715d2)
        # Testcase 21:  rd:x9(0x74674399), imm:0x2d4, result rd:x9(0x7467466d)
    #li x9, 0x74674399
    li x2, 0x74674399
    c.addi4spn x9, x2, 0x2d4
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x7467466d)
        # Testcase 22:  rd:x15(0x6bdd9821), imm:0x10, result rd:x15(0x6bdd9831)
    #li x15, 0x6bdd9821
    li x2, 0x6bdd9821
    c.addi4spn x15, x2, 0x10
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x6bdd9831)
        # Testcase 23:  rd:x15(0x825648e4), imm:0x218, result rd:x15(0x82564afc)
    #li x15, 0x825648e4
    li x2, 0x825648e4
    c.addi4spn x15, x2, 0x218
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x82564afc)
        # Testcase 24:  rd:x13(0x7bf4ef1c), imm:0xb0, result rd:x13(0x7bf4efcc)
    #li x13, 0x7bf4ef1c
    li x2, 0x7bf4ef1c
    c.addi4spn x13, x2, 0xb0
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x7bf4efcc)


    

    RVTEST_SIGBASE(x1,signature_6_0)

        # Testcase 25:  rd:x8(0x0f49a4b2), imm:0x158, result rd:x8(0x0f49a60a)
    #li x8, 0xf49a4b2
    li x2, 0xf49a4b2
    c.addi4spn x8, x2, 0x158
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf49a60a)
        # Testcase 26:  rd:x14(0xfe9b8abf), imm:0x350, result rd:x14(0xfe9b8e0f)
    #li x14, 0xfe9b8abf
    li x2, 0xfe9b8abf
    c.addi4spn x14, x2, 0x350
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xfe9b8e0f)
        # Testcase 27:  rd:x8(0x347ebc89), imm:0x1e0, result rd:x8(0x347ebe69)
    #li x8, 0x347ebc89
    li x2, 0x347ebc89
    c.addi4spn x8, x2, 0x1e0
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x347ebe69)
        # Testcase 28:  rd:x9(0xf52a52bf), imm:0x370, result rd:x9(0xf52a562f)
    #li x9, 0xf52a52bf
    li x2, 0xf52a52bf
    c.addi4spn x9, x2, 0x370
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xf52a562f)
        # Testcase 29:  rd:x15(0xcaa4b80e), imm:0xc8, result rd:x15(0xcaa4b8d6)
    #li x15, 0xcaa4b80e
    li x2, 0xcaa4b80e
    c.addi4spn x15, x2, 0xc8
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xcaa4b8d6)


    

    RVTEST_SIGBASE(x1,signature_7_0)

        # Testcase 30:  rd:x14(0xffffffff), imm:0x4, result rd:x14(0x00000003)
    #li x14, 0xffffffff
    li x2, 0xffffffff
    c.addi4spn x14, x2, 0x4
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x3)
        # Testcase 31:  rd:x11(0x80000000), imm:0x3fc, result rd:x11(0x800003fc)
    #li x11, 0x80000000
    li x2, 0x80000000
    c.addi4spn x11, x2, 0x3fc
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x800003fc)
        # Testcase 32:  rd:x14(0xffffffff), imm:0x3fc, result rd:x14(0x000003fb)
    #li x14, 0xffffffff
    li x2, 0xffffffff
    c.addi4spn x14, x2, 0x3fc
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x3fb)
        # Testcase 33:  rd:x9(0x00000000), imm:0x3fc, result rd:x9(0x000003fc)
    #li x9, 0x0
    li x2, 0x0
    c.addi4spn x9, x2, 0x3fc
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3fc)
        # Testcase 34:  rd:x10(0xffffffff), imm:0x4, result rd:x10(0x00000003)
    #li x10, 0xffffffff
    li x2, 0xffffffff
    c.addi4spn x10, x2, 0x4
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3)


    

    RVTEST_SIGBASE(x1,signature_8_0)

        # Testcase 35:  rd:x15(0x80000000), imm:0x3fc, result rd:x15(0x800003fc)
    #li x15, 0x80000000
    li x2, 0x80000000
    c.addi4spn x15, x2, 0x3fc
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800003fc)
        # Testcase 36:  rd:x13(0xffffffff), imm:0x3fc, result rd:x13(0x000003fb)
    #li x13, 0xffffffff
    li x2, 0xffffffff
    c.addi4spn x13, x2, 0x3fc
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x3fb)
        # Testcase 37:  rd:x15(0x00000000), imm:0x3fc, result rd:x15(0x000003fc)
    #li x15, 0x0
    li x2, 0x0
    c.addi4spn x15, x2, 0x3fc
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x3fc)
        # Testcase 38:  rd:x11(0xffffffff), imm:0x4, result rd:x11(0x00000003)
    #li x11, 0xffffffff
    li x2, 0xffffffff
    c.addi4spn x11, x2, 0x4
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3)
        # Testcase 39:  rd:x13(0x80000000), imm:0x3fc, result rd:x13(0x800003fc)
    #li x13, 0x80000000
    li x2, 0x80000000
    c.addi4spn x13, x2, 0x3fc
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x800003fc)


    

    RVTEST_SIGBASE(x1,signature_9_0)

        # Testcase 40:  rd:x8(0x00000001), imm:0x4, result rd:x8(0x00000005)
    #li x8, 0x1
    li x2, 0x1
    c.addi4spn x8, x2, 0x4
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5)
        # Testcase 41:  rd:x9(0x00000002), imm:0x8, result rd:x9(0x0000000a)
    #li x9, 0x2
    li x2, 0x2
    c.addi4spn x9, x2, 0x8
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xa)
        # Testcase 42:  rd:x10(0x00000004), imm:0x10, result rd:x10(0x00000014)
    #li x10, 0x4
    li x2, 0x4
    c.addi4spn x10, x2, 0x10
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x14)
        # Testcase 43:  rd:x11(0x00000008), imm:0x20, result rd:x11(0x00000028)
    #li x11, 0x8
    li x2, 0x8
    c.addi4spn x11, x2, 0x20
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x28)
        # Testcase 44:  rd:x12(0x00000010), imm:0x40, result rd:x12(0x00000050)
    #li x12, 0x10
    li x2, 0x10
    c.addi4spn x12, x2, 0x40
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x50)


    

    RVTEST_SIGBASE(x1,signature_10_0)

        # Testcase 45:  rd:x13(0x00000020), imm:0x80, result rd:x13(0x000000a0)
    #li x13, 0x20
    li x2, 0x20
    c.addi4spn x13, x2, 0x80
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xa0)
        # Testcase 46:  rd:x14(0x00000040), imm:0x100, result rd:x14(0x00000140)
    #li x14, 0x40
    li x2, 0x40
    c.addi4spn x14, x2, 0x100
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x140)
        # Testcase 47:  rd:x15(0x00000080), imm:0x200, result rd:x15(0x00000280)
    #li x15, 0x80
    li x2, 0x80
    c.addi4spn x15, x2, 0x200
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x280)
        # Testcase 48:  rd:x8(0x00000100), imm:0x3f8, result rd:x8(0x000004f8)
    #li x8, 0x100
    li x2, 0x100
    c.addi4spn x8, x2, 0x3f8
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f8)
        # Testcase 49:  rd:x9(0x00000200), imm:0x3f4, result rd:x9(0x000005f4)
    #li x9, 0x200
    li x2, 0x200
    c.addi4spn x9, x2, 0x3f4
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x5f4)


    

    RVTEST_SIGBASE(x1,signature_11_0)

        # Testcase 50:  rd:x10(0x00000400), imm:0x3ec, result rd:x10(0x000007ec)
    #li x10, 0x400
    li x2, 0x400
    c.addi4spn x10, x2, 0x3ec
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x7ec)
        # Testcase 51:  rd:x11(0x00000800), imm:0x3dc, result rd:x11(0x00000bdc)
    #li x11, 0x800
    li x2, 0x800
    c.addi4spn x11, x2, 0x3dc
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xbdc)
        # Testcase 52:  rd:x12(0x00001000), imm:0x3bc, result rd:x12(0x000013bc)
    #li x12, 0x1000
    li x2, 0x1000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x13bc)
        # Testcase 53:  rd:x13(0x00002000), imm:0x37c, result rd:x13(0x0000237c)
    #li x13, 0x2000
    li x2, 0x2000
    c.addi4spn x13, x2, 0x37c
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x237c)
        # Testcase 54:  rd:x14(0x00004000), imm:0x2fc, result rd:x14(0x000042fc)
    #li x14, 0x4000
    li x2, 0x4000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x42fc)


    

    RVTEST_SIGBASE(x1,signature_12_0)

        # Testcase 55:  rd:x15(0x00008000), imm:0x1fc, result rd:x15(0x000081fc)
    #li x15, 0x8000
    li x2, 0x8000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x81fc)
        # Testcase 56:  rd:x8(0x00010000), imm:0x3f8, result rd:x8(0x000103f8)
    #li x8, 0x10000
    li x2, 0x10000
    c.addi4spn x8, x2, 0x3f8
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x103f8)
        # Testcase 57:  rd:x9(0x00020000), imm:0x3f4, result rd:x9(0x000203f4)
    #li x9, 0x20000
    li x2, 0x20000
    c.addi4spn x9, x2, 0x3f4
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x203f4)
        # Testcase 58:  rd:x10(0x00040000), imm:0x3ec, result rd:x10(0x000403ec)
    #li x10, 0x40000
    li x2, 0x40000
    c.addi4spn x10, x2, 0x3ec
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x403ec)
        # Testcase 59:  rd:x11(0x00080000), imm:0x3dc, result rd:x11(0x000803dc)
    #li x11, 0x80000
    li x2, 0x80000
    c.addi4spn x11, x2, 0x3dc
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x803dc)


    

    RVTEST_SIGBASE(x1,signature_13_0)

        # Testcase 60:  rd:x12(0x00100000), imm:0x3bc, result rd:x12(0x001003bc)
    #li x12, 0x100000
    li x2, 0x100000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1003bc)
        # Testcase 61:  rd:x13(0x00200000), imm:0x37c, result rd:x13(0x0020037c)
    #li x13, 0x200000
    li x2, 0x200000
    c.addi4spn x13, x2, 0x37c
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20037c)
        # Testcase 62:  rd:x14(0x00400000), imm:0x2fc, result rd:x14(0x004002fc)
    #li x14, 0x400000
    li x2, 0x400000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4002fc)
        # Testcase 63:  rd:x15(0x00800000), imm:0x1fc, result rd:x15(0x008001fc)
    #li x15, 0x800000
    li x2, 0x800000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8001fc)
        # Testcase 64:  rd:x8(0x01000000), imm:0x3f8, result rd:x8(0x010003f8)
    #li x8, 0x1000000
    li x2, 0x1000000
    c.addi4spn x8, x2, 0x3f8
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10003f8)


    

    RVTEST_SIGBASE(x1,signature_14_0)

        # Testcase 65:  rd:x9(0x02000000), imm:0x3f4, result rd:x9(0x020003f4)
    #li x9, 0x2000000
    li x2, 0x2000000
    c.addi4spn x9, x2, 0x3f4
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20003f4)
        # Testcase 66:  rd:x10(0x04000000), imm:0x3ec, result rd:x10(0x040003ec)
    #li x10, 0x4000000
    li x2, 0x4000000
    c.addi4spn x10, x2, 0x3ec
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40003ec)
        # Testcase 67:  rd:x11(0x08000000), imm:0x3dc, result rd:x11(0x080003dc)
    #li x11, 0x8000000
    li x2, 0x8000000
    c.addi4spn x11, x2, 0x3dc
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80003dc)
        # Testcase 68:  rd:x12(0x10000000), imm:0x3bc, result rd:x12(0x100003bc)
    #li x12, 0x10000000
    li x2, 0x10000000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100003bc)
        # Testcase 69:  rd:x13(0x20000000), imm:0x37c, result rd:x13(0x2000037c)
    #li x13, 0x20000000
    li x2, 0x20000000
    c.addi4spn x13, x2, 0x37c
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000037c)


    

    RVTEST_SIGBASE(x1,signature_15_0)

        # Testcase 70:  rd:x14(0x40000000), imm:0x2fc, result rd:x14(0x400002fc)
    #li x14, 0x40000000
    li x2, 0x40000000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400002fc)
        # Testcase 71:  rd:x15(0x80000000), imm:0x1fc, result rd:x15(0x800001fc)
    #li x15, 0x80000000
    li x2, 0x80000000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fc)
        # Testcase 72:  rd:x8(0xfffffffe), imm:0x3f8, result rd:x8(0x000003f6)
    #li x8, 0xfffffffe
    li x2, 0xfffffffe
    c.addi4spn x8, x2, 0x3f8
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f6)
        # Testcase 73:  rd:x9(0xfffffffd), imm:0x3f4, result rd:x9(0x000003f1)
    #li x9, 0xfffffffd
    li x2, 0xfffffffd
    c.addi4spn x9, x2, 0x3f4
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3f1)
        # Testcase 74:  rd:x10(0xfffffffb), imm:0x3ec, result rd:x10(0x000003e7)
    #li x10, 0xfffffffb
    li x2, 0xfffffffb
    c.addi4spn x10, x2, 0x3ec
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3e7)


    

    RVTEST_SIGBASE(x1,signature_16_0)

        # Testcase 75:  rd:x11(0xfffffff7), imm:0x3dc, result rd:x11(0x000003d3)
    #li x11, 0xfffffff7
    li x2, 0xfffffff7
    c.addi4spn x11, x2, 0x3dc
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3d3)
        # Testcase 76:  rd:x12(0xffffffef), imm:0x3bc, result rd:x12(0x000003ab)
    #li x12, 0xffffffef
    li x2, 0xffffffef
    c.addi4spn x12, x2, 0x3bc
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x3ab)
        # Testcase 77:  rd:x13(0xffffffdf), imm:0x37c, result rd:x13(0x0000035b)
    #li x13, 0xffffffdf
    li x2, 0xffffffdf
    c.addi4spn x13, x2, 0x37c
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x35b)
        # Testcase 78:  rd:x14(0xffffffbf), imm:0x2fc, result rd:x14(0x000002bb)
    #li x14, 0xffffffbf
    li x2, 0xffffffbf
    c.addi4spn x14, x2, 0x2fc
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x2bb)
        # Testcase 79:  rd:x15(0xffffff7f), imm:0x1fc, result rd:x15(0x0000017b)
    #li x15, 0xffffff7f
    li x2, 0xffffff7f
    c.addi4spn x15, x2, 0x1fc
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x17b)


    

    RVTEST_SIGBASE(x1,signature_17_0)

        # Testcase 80:  rd:x8(0xfffffeff), imm:0x3f8, result rd:x8(0x000002f7)
    #li x8, 0xfffffeff
    li x2, 0xfffffeff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f7)
        # Testcase 81:  rd:x9(0xfffffdff), imm:0x3f4, result rd:x9(0x000001f3)
    #li x9, 0xfffffdff
    li x2, 0xfffffdff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x1f3)
        # Testcase 82:  rd:x10(0xfffffbff), imm:0x3ec, result rd:x10(0xffffffeb)
    #li x10, 0xfffffbff
    li x2, 0xfffffbff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffeb)
        # Testcase 83:  rd:x11(0xfffff7ff), imm:0x3dc, result rd:x11(0xfffffbdb)
    #li x11, 0xfffff7ff
    li x2, 0xfffff7ff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffbdb)
        # Testcase 84:  rd:x12(0xffffefff), imm:0x3bc, result rd:x12(0xfffff3bb)
    #li x12, 0xffffefff
    li x2, 0xffffefff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffff3bb)


    

    RVTEST_SIGBASE(x1,signature_18_0)

        # Testcase 85:  rd:x13(0xffffdfff), imm:0x37c, result rd:x13(0xffffe37b)
    #li x13, 0xffffdfff
    li x2, 0xffffdfff
    c.addi4spn x13, x2, 0x37c
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffe37b)
        # Testcase 86:  rd:x14(0xffffbfff), imm:0x2fc, result rd:x14(0xffffc2fb)
    #li x14, 0xffffbfff
    li x2, 0xffffbfff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffc2fb)
        # Testcase 87:  rd:x15(0xffff7fff), imm:0x1fc, result rd:x15(0xffff81fb)
    #li x15, 0xffff7fff
    li x2, 0xffff7fff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffff81fb)
        # Testcase 88:  rd:x8(0xfffeffff), imm:0x3f8, result rd:x8(0xffff03f7)
    #li x8, 0xfffeffff
    li x2, 0xfffeffff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff03f7)
        # Testcase 89:  rd:x9(0xfffdffff), imm:0x3f4, result rd:x9(0xfffe03f3)
    #li x9, 0xfffdffff
    li x2, 0xfffdffff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffe03f3)


    

    RVTEST_SIGBASE(x1,signature_19_0)

        # Testcase 90:  rd:x10(0xfffbffff), imm:0x3ec, result rd:x10(0xfffc03eb)
    #li x10, 0xfffbffff
    li x2, 0xfffbffff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffc03eb)
        # Testcase 91:  rd:x11(0xfff7ffff), imm:0x3dc, result rd:x11(0xfff803db)
    #li x11, 0xfff7ffff
    li x2, 0xfff7ffff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfff803db)
        # Testcase 92:  rd:x12(0xffefffff), imm:0x3bc, result rd:x12(0xfff003bb)
    #li x12, 0xffefffff
    li x2, 0xffefffff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff003bb)
        # Testcase 93:  rd:x13(0xffdfffff), imm:0x37c, result rd:x13(0xffe0037b)
    #li x13, 0xffdfffff
    li x2, 0xffdfffff
    c.addi4spn x13, x2, 0x37c
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffe0037b)
        # Testcase 94:  rd:x14(0xffbfffff), imm:0x2fc, result rd:x14(0xffc002fb)
    #li x14, 0xffbfffff
    li x2, 0xffbfffff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffc002fb)


    

    RVTEST_SIGBASE(x1,signature_20_0)

        # Testcase 95:  rd:x15(0xff7fffff), imm:0x1fc, result rd:x15(0xff8001fb)
    #li x15, 0xff7fffff
    li x2, 0xff7fffff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xff8001fb)
        # Testcase 96:  rd:x8(0xfeffffff), imm:0x3f8, result rd:x8(0xff0003f7)
    #li x8, 0xfeffffff
    li x2, 0xfeffffff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff0003f7)
        # Testcase 97:  rd:x9(0xfdffffff), imm:0x3f4, result rd:x9(0xfe0003f3)
    #li x9, 0xfdffffff
    li x2, 0xfdffffff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfe0003f3)
        # Testcase 98:  rd:x10(0xfbffffff), imm:0x3ec, result rd:x10(0xfc0003eb)
    #li x10, 0xfbffffff
    li x2, 0xfbffffff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfc0003eb)
        # Testcase 99:  rd:x11(0xf7ffffff), imm:0x3dc, result rd:x11(0xf80003db)
    #li x11, 0xf7ffffff
    li x2, 0xf7ffffff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xf80003db)


    

    RVTEST_SIGBASE(x1,signature_21_0)

        # Testcase 100:  rd:x12(0xefffffff), imm:0x3bc, result rd:x12(0xf00003bb)
    #li x12, 0xefffffff
    li x2, 0xefffffff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf00003bb)
        # Testcase 101:  rd:x13(0xdfffffff), imm:0x37c, result rd:x13(0xe000037b)
    #li x13, 0xdfffffff
    li x2, 0xdfffffff
    c.addi4spn x13, x2, 0x37c
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xe000037b)
        # Testcase 102:  rd:x14(0xbfffffff), imm:0x2fc, result rd:x14(0xc00002fb)
    #li x14, 0xbfffffff
    li x2, 0xbfffffff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xc00002fb)
        # Testcase 103:  rd:x15(0x7fffffff), imm:0x1fc, result rd:x15(0x800001fb)
    #li x15, 0x7fffffff
    li x2, 0x7fffffff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fb)
        # Testcase 104:  rd:x8(0x00000001), imm:0x4, result rd:x8(0x00000005)
    #li x8, 0x1
    li x2, 0x1
    c.addi4spn x8, x2, 0x4
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5)


    

    RVTEST_SIGBASE(x1,signature_22_0)

        # Testcase 105:  rd:x9(0x00000002), imm:0x8, result rd:x9(0x0000000a)
    #li x9, 0x2
    li x2, 0x2
    c.addi4spn x9, x2, 0x8
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xa)
        # Testcase 106:  rd:x10(0x00000004), imm:0x10, result rd:x10(0x00000014)
    #li x10, 0x4
    li x2, 0x4
    c.addi4spn x10, x2, 0x10
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x14)
        # Testcase 107:  rd:x11(0x00000008), imm:0x20, result rd:x11(0x00000028)
    #li x11, 0x8
    li x2, 0x8
    c.addi4spn x11, x2, 0x20
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x28)
        # Testcase 108:  rd:x12(0x00000010), imm:0x40, result rd:x12(0x00000050)
    #li x12, 0x10
    li x2, 0x10
    c.addi4spn x12, x2, 0x40
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x50)
        # Testcase 109:  rd:x13(0x00000020), imm:0x80, result rd:x13(0x000000a0)
    #li x13, 0x20
    li x2, 0x20
    c.addi4spn x13, x2, 0x80
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xa0)


    

    RVTEST_SIGBASE(x1,signature_23_0)

        # Testcase 110:  rd:x14(0x00000040), imm:0x100, result rd:x14(0x00000140)
    #li x14, 0x40
    li x2, 0x40
    c.addi4spn x14, x2, 0x100
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x140)
        # Testcase 111:  rd:x15(0x00000080), imm:0x200, result rd:x15(0x00000280)
    #li x15, 0x80
    li x2, 0x80
    c.addi4spn x15, x2, 0x200
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x280)
        # Testcase 112:  rd:x8(0x00000100), imm:0x3f8, result rd:x8(0x000004f8)
    #li x8, 0x100
    li x2, 0x100
    c.addi4spn x8, x2, 0x3f8
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f8)
        # Testcase 113:  rd:x9(0x00000200), imm:0x3f4, result rd:x9(0x000005f4)
    #li x9, 0x200
    li x2, 0x200
    c.addi4spn x9, x2, 0x3f4
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x5f4)
        # Testcase 114:  rd:x10(0x00000400), imm:0x3ec, result rd:x10(0x000007ec)
    #li x10, 0x400
    li x2, 0x400
    c.addi4spn x10, x2, 0x3ec
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x7ec)


    

    RVTEST_SIGBASE(x1,signature_24_0)

        # Testcase 115:  rd:x11(0x00000800), imm:0x3dc, result rd:x11(0x00000bdc)
    #li x11, 0x800
    li x2, 0x800
    c.addi4spn x11, x2, 0x3dc
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xbdc)
        # Testcase 116:  rd:x12(0x00001000), imm:0x3bc, result rd:x12(0x000013bc)
    #li x12, 0x1000
    li x2, 0x1000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x13bc)
        # Testcase 117:  rd:x13(0x00002000), imm:0x37c, result rd:x13(0x0000237c)
    #li x13, 0x2000
    li x2, 0x2000
    c.addi4spn x13, x2, 0x37c
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x237c)
        # Testcase 118:  rd:x14(0x00004000), imm:0x2fc, result rd:x14(0x000042fc)
    #li x14, 0x4000
    li x2, 0x4000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x42fc)
        # Testcase 119:  rd:x15(0x00008000), imm:0x1fc, result rd:x15(0x000081fc)
    #li x15, 0x8000
    li x2, 0x8000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x81fc)


    

    RVTEST_SIGBASE(x1,signature_25_0)

        # Testcase 120:  rd:x8(0x00010000), imm:0x3f8, result rd:x8(0x000103f8)
    #li x8, 0x10000
    li x2, 0x10000
    c.addi4spn x8, x2, 0x3f8
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x103f8)
        # Testcase 121:  rd:x9(0x00020000), imm:0x3f4, result rd:x9(0x000203f4)
    #li x9, 0x20000
    li x2, 0x20000
    c.addi4spn x9, x2, 0x3f4
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x203f4)
        # Testcase 122:  rd:x10(0x00040000), imm:0x3ec, result rd:x10(0x000403ec)
    #li x10, 0x40000
    li x2, 0x40000
    c.addi4spn x10, x2, 0x3ec
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x403ec)
        # Testcase 123:  rd:x11(0x00080000), imm:0x3dc, result rd:x11(0x000803dc)
    #li x11, 0x80000
    li x2, 0x80000
    c.addi4spn x11, x2, 0x3dc
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x803dc)
        # Testcase 124:  rd:x12(0x00100000), imm:0x3bc, result rd:x12(0x001003bc)
    #li x12, 0x100000
    li x2, 0x100000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x1003bc)


    

    RVTEST_SIGBASE(x1,signature_26_0)

        # Testcase 125:  rd:x13(0x00200000), imm:0x37c, result rd:x13(0x0020037c)
    #li x13, 0x200000
    li x2, 0x200000
    c.addi4spn x13, x2, 0x37c
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x20037c)
        # Testcase 126:  rd:x14(0x00400000), imm:0x2fc, result rd:x14(0x004002fc)
    #li x14, 0x400000
    li x2, 0x400000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x4002fc)
        # Testcase 127:  rd:x15(0x00800000), imm:0x1fc, result rd:x15(0x008001fc)
    #li x15, 0x800000
    li x2, 0x800000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x8001fc)
        # Testcase 128:  rd:x8(0x01000000), imm:0x3f8, result rd:x8(0x010003f8)
    #li x8, 0x1000000
    li x2, 0x1000000
    c.addi4spn x8, x2, 0x3f8
    sw x8, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x10003f8)
        # Testcase 129:  rd:x9(0x02000000), imm:0x3f4, result rd:x9(0x020003f4)
    #li x9, 0x2000000
    li x2, 0x2000000
    c.addi4spn x9, x2, 0x3f4
    sw x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x20003f4)


    

    RVTEST_SIGBASE(x1,signature_27_0)

        # Testcase 130:  rd:x10(0x04000000), imm:0x3ec, result rd:x10(0x040003ec)
    #li x10, 0x4000000
    li x2, 0x4000000
    c.addi4spn x10, x2, 0x3ec
    sw x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x40003ec)
        # Testcase 131:  rd:x11(0x08000000), imm:0x3dc, result rd:x11(0x080003dc)
    #li x11, 0x8000000
    li x2, 0x8000000
    c.addi4spn x11, x2, 0x3dc
    sw x11, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x80003dc)
        # Testcase 132:  rd:x12(0x10000000), imm:0x3bc, result rd:x12(0x100003bc)
    #li x12, 0x10000000
    li x2, 0x10000000
    c.addi4spn x12, x2, 0x3bc
    sw x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x100003bc)
        # Testcase 133:  rd:x13(0x20000000), imm:0x37c, result rd:x13(0x2000037c)
    #li x13, 0x20000000
    li x2, 0x20000000
    c.addi4spn x13, x2, 0x37c
    sw x13, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x2000037c)
        # Testcase 134:  rd:x14(0x40000000), imm:0x2fc, result rd:x14(0x400002fc)
    #li x14, 0x40000000
    li x2, 0x40000000
    c.addi4spn x14, x2, 0x2fc
    sw x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x400002fc)


    

    RVTEST_SIGBASE(x1,signature_28_0)

        # Testcase 135:  rd:x15(0x80000000), imm:0x1fc, result rd:x15(0x800001fc)
    #li x15, 0x80000000
    li x2, 0x80000000
    c.addi4spn x15, x2, 0x1fc
    sw x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fc)
        # Testcase 136:  rd:x8(0xfffffffe), imm:0x3f8, result rd:x8(0x000003f6)
    #li x8, 0xfffffffe
    li x2, 0xfffffffe
    c.addi4spn x8, x2, 0x3f8
    sw x8, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f6)
        # Testcase 137:  rd:x9(0xfffffffd), imm:0x3f4, result rd:x9(0x000003f1)
    #li x9, 0xfffffffd
    li x2, 0xfffffffd
    c.addi4spn x9, x2, 0x3f4
    sw x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x3f1)
        # Testcase 138:  rd:x10(0xfffffffb), imm:0x3ec, result rd:x10(0x000003e7)
    #li x10, 0xfffffffb
    li x2, 0xfffffffb
    c.addi4spn x10, x2, 0x3ec
    sw x10, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x3e7)
        # Testcase 139:  rd:x11(0xfffffff7), imm:0x3dc, result rd:x11(0x000003d3)
    #li x11, 0xfffffff7
    li x2, 0xfffffff7
    c.addi4spn x11, x2, 0x3dc
    sw x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x3d3)


    

    RVTEST_SIGBASE(x1,signature_29_0)

        # Testcase 140:  rd:x12(0xffffffef), imm:0x3bc, result rd:x12(0x000003ab)
    #li x12, 0xffffffef
    li x2, 0xffffffef
    c.addi4spn x12, x2, 0x3bc
    sw x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0x3ab)
        # Testcase 141:  rd:x13(0xffffffdf), imm:0x37c, result rd:x13(0x0000035b)
    #li x13, 0xffffffdf
    li x2, 0xffffffdf
    c.addi4spn x13, x2, 0x37c
    sw x13, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0x35b)
        # Testcase 142:  rd:x14(0xffffffbf), imm:0x2fc, result rd:x14(0x000002bb)
    #li x14, 0xffffffbf
    li x2, 0xffffffbf
    c.addi4spn x14, x2, 0x2fc
    sw x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0x2bb)
        # Testcase 143:  rd:x15(0xffffff7f), imm:0x1fc, result rd:x15(0x0000017b)
    #li x15, 0xffffff7f
    li x2, 0xffffff7f
    c.addi4spn x15, x2, 0x1fc
    sw x15, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x17b)
        # Testcase 144:  rd:x8(0xfffffeff), imm:0x3f8, result rd:x8(0x000002f7)
    #li x8, 0xfffffeff
    li x2, 0xfffffeff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f7)


    

    RVTEST_SIGBASE(x1,signature_30_0)

        # Testcase 145:  rd:x9(0xfffffdff), imm:0x3f4, result rd:x9(0x000001f3)
    #li x9, 0xfffffdff
    li x2, 0xfffffdff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x1f3)
        # Testcase 146:  rd:x10(0xfffffbff), imm:0x3ec, result rd:x10(0xffffffeb)
    #li x10, 0xfffffbff
    li x2, 0xfffffbff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xffffffeb)
        # Testcase 147:  rd:x11(0xfffff7ff), imm:0x3dc, result rd:x11(0xfffffbdb)
    #li x11, 0xfffff7ff
    li x2, 0xfffff7ff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfffffbdb)
        # Testcase 148:  rd:x12(0xffffefff), imm:0x3bc, result rd:x12(0xfffff3bb)
    #li x12, 0xffffefff
    li x2, 0xffffefff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfffff3bb)
        # Testcase 149:  rd:x13(0xffffdfff), imm:0x37c, result rd:x13(0xffffe37b)
    #li x13, 0xffffdfff
    li x2, 0xffffdfff
    c.addi4spn x13, x2, 0x37c
    sw x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffffe37b)


    

    RVTEST_SIGBASE(x1,signature_31_0)

        # Testcase 150:  rd:x14(0xffffbfff), imm:0x2fc, result rd:x14(0xffffc2fb)
    #li x14, 0xffffbfff
    li x2, 0xffffbfff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffffc2fb)
        # Testcase 151:  rd:x15(0xffff7fff), imm:0x1fc, result rd:x15(0xffff81fb)
    #li x15, 0xffff7fff
    li x2, 0xffff7fff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xffff81fb)
        # Testcase 152:  rd:x8(0xfffeffff), imm:0x3f8, result rd:x8(0xffff03f7)
    #li x8, 0xfffeffff
    li x2, 0xfffeffff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff03f7)
        # Testcase 153:  rd:x9(0xfffdffff), imm:0x3f4, result rd:x9(0xfffe03f3)
    #li x9, 0xfffdffff
    li x2, 0xfffdffff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffe03f3)
        # Testcase 154:  rd:x10(0xfffbffff), imm:0x3ec, result rd:x10(0xfffc03eb)
    #li x10, 0xfffbffff
    li x2, 0xfffbffff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfffc03eb)


    

    RVTEST_SIGBASE(x1,signature_32_0)

        # Testcase 155:  rd:x11(0xfff7ffff), imm:0x3dc, result rd:x11(0xfff803db)
    #li x11, 0xfff7ffff
    li x2, 0xfff7ffff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xfff803db)
        # Testcase 156:  rd:x12(0xffefffff), imm:0x3bc, result rd:x12(0xfff003bb)
    #li x12, 0xffefffff
    li x2, 0xffefffff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xfff003bb)
        # Testcase 157:  rd:x13(0xffdfffff), imm:0x37c, result rd:x13(0xffe0037b)
    #li x13, 0xffdfffff
    li x2, 0xffdfffff
    c.addi4spn x13, x2, 0x37c
    sw x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xffe0037b)
        # Testcase 158:  rd:x14(0xffbfffff), imm:0x2fc, result rd:x14(0xffc002fb)
    #li x14, 0xffbfffff
    li x2, 0xffbfffff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xffc002fb)
        # Testcase 159:  rd:x15(0xff7fffff), imm:0x1fc, result rd:x15(0xff8001fb)
    #li x15, 0xff7fffff
    li x2, 0xff7fffff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0xff8001fb)


    

    RVTEST_SIGBASE(x1,signature_33_0)

        # Testcase 160:  rd:x8(0xfeffffff), imm:0x3f8, result rd:x8(0xff0003f7)
    #li x8, 0xfeffffff
    li x2, 0xfeffffff
    c.addi4spn x8, x2, 0x3f8
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff0003f7)
        # Testcase 161:  rd:x9(0xfdffffff), imm:0x3f4, result rd:x9(0xfe0003f3)
    #li x9, 0xfdffffff
    li x2, 0xfdffffff
    c.addi4spn x9, x2, 0x3f4
    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfe0003f3)
        # Testcase 162:  rd:x10(0xfbffffff), imm:0x3ec, result rd:x10(0xfc0003eb)
    #li x10, 0xfbffffff
    li x2, 0xfbffffff
    c.addi4spn x10, x2, 0x3ec
    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0xfc0003eb)
        # Testcase 163:  rd:x11(0xf7ffffff), imm:0x3dc, result rd:x11(0xf80003db)
    #li x11, 0xf7ffffff
    li x2, 0xf7ffffff
    c.addi4spn x11, x2, 0x3dc
    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0xf80003db)
        # Testcase 164:  rd:x12(0xefffffff), imm:0x3bc, result rd:x12(0xf00003bb)
    #li x12, 0xefffffff
    li x2, 0xefffffff
    c.addi4spn x12, x2, 0x3bc
    sw x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x12, 0xf00003bb)


    

    RVTEST_SIGBASE(x1,signature_34_0)

        # Testcase 165:  rd:x13(0xdfffffff), imm:0x37c, result rd:x13(0xe000037b)
    #li x13, 0xdfffffff
    li x2, 0xdfffffff
    c.addi4spn x13, x2, 0x37c
    sw x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xe000037b)
        # Testcase 166:  rd:x14(0xbfffffff), imm:0x2fc, result rd:x14(0xc00002fb)
    #li x14, 0xbfffffff
    li x2, 0xbfffffff
    c.addi4spn x14, x2, 0x2fc
    sw x14, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x14, 0xc00002fb)
        # Testcase 167:  rd:x15(0x7fffffff), imm:0x1fc, result rd:x15(0x800001fb)
    #li x15, 0x7fffffff
    li x2, 0x7fffffff
    c.addi4spn x15, x2, 0x1fc
    sw x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x15, 0x800001fb)
	
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

