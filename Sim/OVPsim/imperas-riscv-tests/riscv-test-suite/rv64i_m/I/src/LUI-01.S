// RISC-V Architectural Validation Test LUI-01
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
// Description: Testing instruction 'LUI'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64IM")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*I.*);def TEST_CASE_1=True;",lui)

    RVTEST_SIGBASE(x1,signature_1_0)

    # Testcase 0:  imm:0xa01ef, result rd:x19(0xffffffffa01ef000)
    lui x19, 0xa01ef
    sd  x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffa01ef000)
    
    # Testcase 1:  imm:0x69d27, result rd:x28(0x69d27000)
    lui x28, 0x69d27
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0x69d27000)
    
    # Testcase 2:  imm:0xede3d, result rd:x30(0xffffffffede3d000)
    lui x30, 0xede3d
    sd  x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xffffffffede3d000)
    


    

    RVTEST_SIGBASE(x1,signature_2_0)

    # Testcase 3:  imm:0x19a51, result rd:x20(0x19a51000)
    lui x20, 0x19a51
    sd  x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0x19a51000)
    
    # Testcase 4:  imm:0x8d5fd, result rd:x10(0xffffffff8d5fd000)
    lui x10, 0x8d5fd
    sd  x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffff8d5fd000)
    
    # Testcase 5:  imm:0xf6c65, result rd:x0(0x0)
    lui x0, 0xf6c65
    sd  x0, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x0, 0x0)
    


    

    RVTEST_SIGBASE(x1,signature_3_0)

    # Testcase 6:  imm:0x6250f, result rd:x3(0x6250f000)
    lui x3, 0x6250f
    sd  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x6250f000)
    
    # Testcase 7:  imm:0xffa64, result rd:x31(0xffffffffffa64000)
    lui x31, 0xffa64
    sd  x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xffffffffffa64000)
    
    # Testcase 8:  imm:0x7ad3a, result rd:x29(0x7ad3a000)
    lui x29, 0x7ad3a
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0x7ad3a000)
    


    

    RVTEST_SIGBASE(x1,signature_4_0)

    # Testcase 9:  imm:0xc8c1e, result rd:x5(0xffffffffc8c1e000)
    lui x5, 0xc8c1e
    sd  x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffc8c1e000)
    
    # Testcase 10:  imm:0x660db, result rd:x0(0x0)
    lui x0, 0x660db
    sd  x0, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x0, 0x0)
    
    # Testcase 11:  imm:0x2dadf, result rd:x13(0x2dadf000)
    lui x13, 0x2dadf
    sd  x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x2dadf000)
    


    

    RVTEST_SIGBASE(x1,signature_5_0)

    # Testcase 12:  imm:0x3c847, result rd:x4(0x3c847000)
    lui x4, 0x3c847
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x3c847000)
    
    # Testcase 13:  imm:0xa7ae7, result rd:x11(0xffffffffa7ae7000)
    lui x11, 0xa7ae7
    sd  x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffa7ae7000)
    
    # Testcase 14:  imm:0xb62bf, result rd:x25(0xffffffffb62bf000)
    lui x25, 0xb62bf
    sd  x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffb62bf000)
    


    

    RVTEST_SIGBASE(x1,signature_6_0)

    # Testcase 15:  imm:0xa3d1, result rd:x2(0xa3d1000)
    lui x2, 0xa3d1
    sd  x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0xa3d1000)
    
    # Testcase 16:  imm:0x80fd4, result rd:x18(0xffffffff80fd4000)
    lui x18, 0x80fd4
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xffffffff80fd4000)
    
    # Testcase 17:  imm:0xf5ff4, result rd:x18(0xfffffffff5ff4000)
    lui x18, 0xf5ff4
    sd  x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x18, 0xfffffffff5ff4000)
    


    

    RVTEST_SIGBASE(x1,signature_7_0)

    # Testcase 18:  imm:0x67ad9, result rd:x7(0x67ad9000)
    lui x7, 0x67ad9
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x67ad9000)
    
    # Testcase 19:  imm:0x454c0, result rd:x9(0x454c0000)
    lui x9, 0x454c0
    sd  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x454c0000)
    
    # Testcase 20:  imm:0xd3492, result rd:x31(0xffffffffd3492000)
    lui x31, 0xd3492
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xffffffffd3492000)
    


    

    RVTEST_SIGBASE(x1,signature_8_0)

    # Testcase 21:  imm:0xd663e, result rd:x17(0xffffffffd663e000)
    lui x17, 0xd663e
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffd663e000)
    
    # Testcase 22:  imm:0x3f1c5, result rd:x23(0x3f1c5000)
    lui x23, 0x3f1c5
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x3f1c5000)
    
    # Testcase 23:  imm:0xd39ae, result rd:x31(0xffffffffd39ae000)
    lui x31, 0xd39ae
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xffffffffd39ae000)
    


    

    RVTEST_SIGBASE(x1,signature_9_0)

    # Testcase 24:  imm:0x3a4dd, result rd:x21(0x3a4dd000)
    lui x21, 0x3a4dd
    sd  x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0x3a4dd000)
    
    # Testcase 25:  imm:0x83650, result rd:x0(0x0)
    lui x0, 0x83650
    sd  x0, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x0, 0x0)
    
    # Testcase 26:  imm:0xc88d5, result rd:x30(0xffffffffc88d5000)
    lui x30, 0xc88d5
    sd  x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xffffffffc88d5000)
    


    

    RVTEST_SIGBASE(x1,signature_10_0)

    # Testcase 27:  imm:0xf4071, result rd:x0(0x0)
    lui x0, 0xf4071
    sd  x0, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x0, 0x0)
    
    # Testcase 28:  imm:0xb3c30, result rd:x17(0xffffffffb3c30000)
    lui x17, 0xb3c30
    sd  x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffb3c30000)
    
    # Testcase 29:  imm:0xc7dd8, result rd:x31(0xffffffffc7dd8000)
    lui x31, 0xc7dd8
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xffffffffc7dd8000)
    


    

    RVTEST_SIGBASE(x1,signature_11_0)

    # Testcase 30:  imm:0x0, result rd:x6(0x0)
    lui x6, 0x0
    sd  x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x0)
    
    # Testcase 31:  imm:0xfffff, result rd:x11(0xfffffffffffff000)
    lui x11, 0xfffff
    sd  x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffffffff000)
    
    # Testcase 32:  imm:0xfffff, result rd:x22(0xfffffffffffff000)
    lui x22, 0xfffff
    sd  x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffffffffffff000)
    


    

    RVTEST_SIGBASE(x1,signature_12_0)

    # Testcase 33:  imm:0xfffff, result rd:x9(0xfffffffffffff000)
    lui x9, 0xfffff
    sd  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0xfffffffffffff000)
    
    # Testcase 34:  imm:0x1, result rd:x2(0x1000)
    lui x2, 0x1
    sd  x2, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x2, 0x1000)
    
    # Testcase 35:  imm:0xfffff, result rd:x7(0xfffffffffffff000)
    lui x7, 0xfffff
    sd  x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0xfffffffffffff000)
    


    

    RVTEST_SIGBASE(x1,signature_13_0)

    # Testcase 36:  imm:0xfffff, result rd:x13(0xfffffffffffff000)
    lui x13, 0xfffff
    sd  x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffffff000)
    
    # Testcase 37:  imm:0x0, result rd:x7(0x0)
    lui x7, 0x0
    sd  x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x0)
    
    # Testcase 38:  imm:0x0, result rd:x3(0x0)
    lui x3, 0x0
    sd  x3, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x0)
    


    

    RVTEST_SIGBASE(x2,signature_14_0)

    # Testcase 39:  imm:0xfffff, result rd:x13(0xfffffffffffff000)
    lui x13, 0xfffff
    sd  x13, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x13, 0xfffffffffffff000)
    
    # Testcase 40:  imm:0x1, result rd:x1(0x1000)
    lui x1, 0x1
    sd  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x1000)
    
    # Testcase 41:  imm:0x2, result rd:x1(0x2000)
    lui x1, 0x2
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0x2000)
    


    

    RVTEST_SIGBASE(x1,signature_15_0)

    # Testcase 42:  imm:0x4, result rd:x2(0x4000)
    lui x2, 0x4
    sd  x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0x4000)
    
    # Testcase 43:  imm:0x8, result rd:x3(0x8000)
    lui x3, 0x8
    sd  x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x8000)
    
    # Testcase 44:  imm:0x10, result rd:x4(0x10000)
    lui x4, 0x10
    sd  x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0x10000)
    


    

    RVTEST_SIGBASE(x1,signature_16_0)

    # Testcase 45:  imm:0x20, result rd:x5(0x20000)
    lui x5, 0x20
    sd  x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x20000)
    
    # Testcase 46:  imm:0x40, result rd:x6(0x40000)
    lui x6, 0x40
    sd  x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x40000)
    
    # Testcase 47:  imm:0x80, result rd:x7(0x80000)
    lui x7, 0x80
    sd  x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x80000)
    


    

    RVTEST_SIGBASE(x1,signature_17_0)

    # Testcase 48:  imm:0x100, result rd:x8(0x100000)
    lui x8, 0x100
    sd  x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x100000)
    
    # Testcase 49:  imm:0x200, result rd:x9(0x200000)
    lui x9, 0x200
    sd  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x200000)
    
    # Testcase 50:  imm:0x400, result rd:x10(0x400000)
    lui x10, 0x400
    sd  x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x400000)
    


    

    RVTEST_SIGBASE(x1,signature_18_0)

    # Testcase 51:  imm:0x800, result rd:x11(0x800000)
    lui x11, 0x800
    sd  x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x800000)
    
    # Testcase 52:  imm:0x1000, result rd:x12(0x1000000)
    lui x12, 0x1000
    sd  x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1000000)
    
    # Testcase 53:  imm:0x2000, result rd:x13(0x2000000)
    lui x13, 0x2000
    sd  x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x2000000)
    


    

    RVTEST_SIGBASE(x1,signature_19_0)

    # Testcase 54:  imm:0x4000, result rd:x14(0x4000000)
    lui x14, 0x4000
    sd  x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x4000000)
    
    # Testcase 55:  imm:0x8000, result rd:x15(0x8000000)
    lui x15, 0x8000
    sd  x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x8000000)
    
    # Testcase 56:  imm:0x10000, result rd:x16(0x10000000)
    lui x16, 0x10000
    sd  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x10000000)
    


    

    RVTEST_SIGBASE(x1,signature_20_0)

    # Testcase 57:  imm:0x20000, result rd:x17(0x20000000)
    lui x17, 0x20000
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x20000000)
    
    # Testcase 58:  imm:0x40000, result rd:x18(0x40000000)
    lui x18, 0x40000
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x40000000)
    
    # Testcase 59:  imm:0x80000, result rd:x19(0xffffffff80000000)
    lui x19, 0x80000
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffff80000000)
    


    

    RVTEST_SIGBASE(x1,signature_21_0)

    # Testcase 60:  imm:0xffffe, result rd:x20(0xffffffffffffe000)
    lui x20, 0xffffe
    sd  x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffffffffffe000)
    
    # Testcase 61:  imm:0xffffd, result rd:x21(0xffffffffffffd000)
    lui x21, 0xffffd
    sd  x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffffffffffd000)
    
    # Testcase 62:  imm:0xffffb, result rd:x22(0xffffffffffffb000)
    lui x22, 0xffffb
    sd  x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xffffffffffffb000)
    


    

    RVTEST_SIGBASE(x1,signature_22_0)

    # Testcase 63:  imm:0xffff7, result rd:x23(0xffffffffffff7000)
    lui x23, 0xffff7
    sd  x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xffffffffffff7000)
    
    # Testcase 64:  imm:0xfffef, result rd:x24(0xfffffffffffef000)
    lui x24, 0xfffef
    sd  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xfffffffffffef000)
    
    # Testcase 65:  imm:0xfffdf, result rd:x25(0xfffffffffffdf000)
    lui x25, 0xfffdf
    sd  x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xfffffffffffdf000)
    


    

    RVTEST_SIGBASE(x1,signature_23_0)

    # Testcase 66:  imm:0xfffbf, result rd:x26(0xfffffffffffbf000)
    lui x26, 0xfffbf
    sd  x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xfffffffffffbf000)
    
    # Testcase 67:  imm:0xfff7f, result rd:x27(0xfffffffffff7f000)
    lui x27, 0xfff7f
    sd  x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xfffffffffff7f000)
    
    # Testcase 68:  imm:0xffeff, result rd:x28(0xffffffffffeff000)
    lui x28, 0xffeff
    sd  x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffffffeff000)
    


    

    RVTEST_SIGBASE(x1,signature_24_0)

    # Testcase 69:  imm:0xffdff, result rd:x29(0xffffffffffdff000)
    lui x29, 0xffdff
    sd  x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffffffdff000)
    
    # Testcase 70:  imm:0xffbff, result rd:x30(0xffffffffffbff000)
    lui x30, 0xffbff
    sd  x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xffffffffffbff000)
    
    # Testcase 71:  imm:0xff7ff, result rd:x31(0xffffffffff7ff000)
    lui x31, 0xff7ff
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xffffffffff7ff000)
    


    

    RVTEST_SIGBASE(x3,signature_25_0)

    # Testcase 72:  imm:0xfefff, result rd:x1(0xfffffffffefff000)
    lui x1, 0xfefff
    sd  x1, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xfffffffffefff000)
    
    # Testcase 73:  imm:0xfdfff, result rd:x1(0xfffffffffdfff000)
    lui x1, 0xfdfff
    sd  x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xfffffffffdfff000)
    
    # Testcase 74:  imm:0xfbfff, result rd:x2(0xfffffffffbfff000)
    lui x2, 0xfbfff
    sd  x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xfffffffffbfff000)
    


    

    RVTEST_SIGBASE(x1,signature_26_0)

    # Testcase 75:  imm:0xf7fff, result rd:x3(0xfffffffff7fff000)
    lui x3, 0xf7fff
    sd  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0xfffffffff7fff000)
    
    # Testcase 76:  imm:0xeffff, result rd:x4(0xffffffffeffff000)
    lui x4, 0xeffff
    sd  x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xffffffffeffff000)
    
    # Testcase 77:  imm:0xdffff, result rd:x5(0xffffffffdffff000)
    lui x5, 0xdffff
    sd  x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffdffff000)
    


    

    RVTEST_SIGBASE(x1,signature_27_0)

    # Testcase 78:  imm:0xbffff, result rd:x6(0xffffffffbffff000)
    lui x6, 0xbffff
    sd  x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffbffff000)
    
    # Testcase 79:  imm:0x7ffff, result rd:x7(0x7ffff000)
    lui x7, 0x7ffff
    sd  x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x7ffff000)
    
    # Testcase 80:  imm:0xffffe, result rd:x8(0xffffffffffffe000)
    lui x8, 0xffffe
    sd  x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffffffe000)
    


    

    RVTEST_SIGBASE(x1,signature_28_0)

    # Testcase 81:  imm:0xffffd, result rd:x9(0xffffffffffffd000)
    lui x9, 0xffffd
    sd  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffffffd000)
    
    # Testcase 82:  imm:0xffffb, result rd:x10(0xffffffffffffb000)
    lui x10, 0xffffb
    sd  x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffffb000)
    
    # Testcase 83:  imm:0xffff7, result rd:x11(0xffffffffffff7000)
    lui x11, 0xffff7
    sd  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffff7000)
    


    

    RVTEST_SIGBASE(x1,signature_29_0)

    # Testcase 84:  imm:0xfffef, result rd:x12(0xfffffffffffef000)
    lui x12, 0xfffef
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffffffef000)
    
    # Testcase 85:  imm:0xfffdf, result rd:x13(0xfffffffffffdf000)
    lui x13, 0xfffdf
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffffdf000)
    
    # Testcase 86:  imm:0xfffbf, result rd:x14(0xfffffffffffbf000)
    lui x14, 0xfffbf
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffffbf000)
    


    

    RVTEST_SIGBASE(x1,signature_30_0)

    # Testcase 87:  imm:0xfff7f, result rd:x15(0xfffffffffff7f000)
    lui x15, 0xfff7f
    sd  x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffff7f000)
    
    # Testcase 88:  imm:0xffeff, result rd:x16(0xffffffffffeff000)
    lui x16, 0xffeff
    sd  x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xffffffffffeff000)
    
    # Testcase 89:  imm:0xffdff, result rd:x17(0xffffffffffdff000)
    lui x17, 0xffdff
    sd  x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffffdff000)
    


    

    RVTEST_SIGBASE(x1,signature_31_0)

    # Testcase 90:  imm:0xffbff, result rd:x18(0xffffffffffbff000)
    lui x18, 0xffbff
    sd  x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffffffffffbff000)
    
    # Testcase 91:  imm:0xff7ff, result rd:x19(0xffffffffff7ff000)
    lui x19, 0xff7ff
    sd  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffff7ff000)
    
    # Testcase 92:  imm:0xfefff, result rd:x20(0xfffffffffefff000)
    lui x20, 0xfefff
    sd  x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xfffffffffefff000)
    


    

    RVTEST_SIGBASE(x1,signature_32_0)

    # Testcase 93:  imm:0xfdfff, result rd:x21(0xfffffffffdfff000)
    lui x21, 0xfdfff
    sd  x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xfffffffffdfff000)
    
    # Testcase 94:  imm:0xfbfff, result rd:x22(0xfffffffffbfff000)
    lui x22, 0xfbfff
    sd  x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffffffffbfff000)
    
    # Testcase 95:  imm:0xf7fff, result rd:x23(0xfffffffff7fff000)
    lui x23, 0xf7fff
    sd  x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffffff7fff000)
    


    

    RVTEST_SIGBASE(x1,signature_33_0)

    # Testcase 96:  imm:0xeffff, result rd:x24(0xffffffffeffff000)
    lui x24, 0xeffff
    sd  x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffeffff000)
    
    # Testcase 97:  imm:0xdffff, result rd:x25(0xffffffffdffff000)
    lui x25, 0xdffff
    sd  x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffdffff000)
    
    # Testcase 98:  imm:0xbffff, result rd:x26(0xffffffffbffff000)
    lui x26, 0xbffff
    sd  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffbffff000)
    


    

    RVTEST_SIGBASE(x1,signature_34_0)

    # Testcase 99:  imm:0x7ffff, result rd:x27(0x7ffff000)
    lui x27, 0x7ffff
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x7ffff000)
    
    # Testcase 100:  imm:0xffffe, result rd:x28(0xffffffffffffe000)
    lui x28, 0xffffe
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffffffffe000)
    
    # Testcase 101:  imm:0xffffd, result rd:x29(0xffffffffffffd000)
    lui x29, 0xffffd
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffffffffd000)
    


    

    RVTEST_SIGBASE(x2,signature_35_0)

    # Testcase 102:  imm:0xffffb, result rd:x30(0xffffffffffffb000)
    lui x30, 0xffffb
    sd  x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xffffffffffffb000)
    
    # Testcase 103:  imm:0xffff7, result rd:x31(0xffffffffffff7000)
    lui x31, 0xffff7
    sd  x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xffffffffffff7000)
    
    # Testcase 104:  imm:0xfffef, result rd:x1(0xfffffffffffef000)
    lui x1, 0xfffef
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xfffffffffffef000)
    


    

    RVTEST_SIGBASE(x4,signature_36_0)

    # Testcase 105:  imm:0xfffdf, result rd:x1(0xfffffffffffdf000)
    lui x1, 0xfffdf
    sd  x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffffdf000)
    
    # Testcase 106:  imm:0xfffbf, result rd:x2(0xfffffffffffbf000)
    lui x2, 0xfffbf
    sd  x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0xfffffffffffbf000)
    
    # Testcase 107:  imm:0xfff7f, result rd:x3(0xfffffffffff7f000)
    lui x3, 0xfff7f
    sd  x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xfffffffffff7f000)
    


    

    RVTEST_SIGBASE(x1,signature_37_0)

    # Testcase 108:  imm:0xffeff, result rd:x4(0xffffffffffeff000)
    lui x4, 0xffeff
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xffffffffffeff000)
    
    # Testcase 109:  imm:0xffdff, result rd:x5(0xffffffffffdff000)
    lui x5, 0xffdff
    sd  x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffffdff000)
    
    # Testcase 110:  imm:0xffbff, result rd:x6(0xffffffffffbff000)
    lui x6, 0xffbff
    sd  x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffffbff000)
    


    

    RVTEST_SIGBASE(x1,signature_38_0)

    # Testcase 111:  imm:0xff7ff, result rd:x7(0xffffffffff7ff000)
    lui x7, 0xff7ff
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xffffffffff7ff000)
    
    # Testcase 112:  imm:0xfefff, result rd:x8(0xfffffffffefff000)
    lui x8, 0xfefff
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffffefff000)
    
    # Testcase 113:  imm:0xfdfff, result rd:x9(0xfffffffffdfff000)
    lui x9, 0xfdfff
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfffffffffdfff000)
    


    

    RVTEST_SIGBASE(x1,signature_39_0)

    # Testcase 114:  imm:0xfbfff, result rd:x10(0xfffffffffbfff000)
    lui x10, 0xfbfff
    sd  x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xfffffffffbfff000)
    
    # Testcase 115:  imm:0xf7fff, result rd:x11(0xfffffffff7fff000)
    lui x11, 0xf7fff
    sd  x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffff7fff000)
    
    # Testcase 116:  imm:0xeffff, result rd:x12(0xffffffffeffff000)
    lui x12, 0xeffff
    sd  x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffffeffff000)
    


    

    RVTEST_SIGBASE(x1,signature_40_0)

    # Testcase 117:  imm:0xdffff, result rd:x13(0xffffffffdffff000)
    lui x13, 0xdffff
    sd  x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffdffff000)
    
    # Testcase 118:  imm:0xbffff, result rd:x14(0xffffffffbffff000)
    lui x14, 0xbffff
    sd  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffbffff000)
    
    # Testcase 119:  imm:0x7ffff, result rd:x15(0x7ffff000)
    lui x15, 0x7ffff
    sd  x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x7ffff000)
    


    

    RVTEST_SIGBASE(x1,signature_41_0)

    # Testcase 120:  imm:0xffffe, result rd:x16(0xffffffffffffe000)
    lui x16, 0xffffe
    sd  x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xffffffffffffe000)
    
    # Testcase 121:  imm:0xffffd, result rd:x17(0xffffffffffffd000)
    lui x17, 0xffffd
    sd  x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffffffd000)
    
    # Testcase 122:  imm:0xffffb, result rd:x18(0xffffffffffffb000)
    lui x18, 0xffffb
    sd  x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffffffffffffb000)
    


    

    RVTEST_SIGBASE(x1,signature_42_0)

    # Testcase 123:  imm:0xffff7, result rd:x19(0xffffffffffff7000)
    lui x19, 0xffff7
    sd  x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffffff7000)
    
    # Testcase 124:  imm:0xfffef, result rd:x20(0xfffffffffffef000)
    lui x20, 0xfffef
    sd  x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xfffffffffffef000)
    
    # Testcase 125:  imm:0xfffdf, result rd:x21(0xfffffffffffdf000)
    lui x21, 0xfffdf
    sd  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xfffffffffffdf000)
    


    

    RVTEST_SIGBASE(x1,signature_43_0)

    # Testcase 126:  imm:0xfffbf, result rd:x22(0xfffffffffffbf000)
    lui x22, 0xfffbf
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffffffffffbf000)
    
    # Testcase 127:  imm:0xfff7f, result rd:x23(0xfffffffffff7f000)
    lui x23, 0xfff7f
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffffffff7f000)
    
    # Testcase 128:  imm:0xffeff, result rd:x24(0xffffffffffeff000)
    lui x24, 0xffeff
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffffeff000)
    


    

    RVTEST_SIGBASE(x1,signature_44_0)

    # Testcase 129:  imm:0xffdff, result rd:x25(0xffffffffffdff000)
    lui x25, 0xffdff
    sd  x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffffdff000)
    
    # Testcase 130:  imm:0xffbff, result rd:x26(0xffffffffffbff000)
    lui x26, 0xffbff
    sd  x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffffbff000)
    
    # Testcase 131:  imm:0xff7ff, result rd:x27(0xffffffffff7ff000)
    lui x27, 0xff7ff
    sd  x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffffff7ff000)
    


    

    RVTEST_SIGBASE(x1,signature_45_0)

    # Testcase 132:  imm:0xfefff, result rd:x28(0xfffffffffefff000)
    lui x28, 0xfefff
    sd  x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xfffffffffefff000)
    
    # Testcase 133:  imm:0xfdfff, result rd:x29(0xfffffffffdfff000)
    lui x29, 0xfdfff
    sd  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xfffffffffdfff000)
    
    # Testcase 134:  imm:0xfbfff, result rd:x30(0xfffffffffbfff000)
    lui x30, 0xfbfff
    sd  x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xfffffffffbfff000)
    


    

    RVTEST_SIGBASE(x2,signature_46_0)

    # Testcase 135:  imm:0xf7fff, result rd:x31(0xfffffffff7fff000)
    lui x31, 0xf7fff
    sd  x31, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xfffffffff7fff000)
    
    # Testcase 136:  imm:0xeffff, result rd:x1(0xffffffffeffff000)
    lui x1, 0xeffff
    sd  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xffffffffeffff000)
    
    # Testcase 137:  imm:0xdffff, result rd:x1(0xffffffffdffff000)
    lui x1, 0xdffff
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xffffffffdffff000)
    


    

    RVTEST_SIGBASE(x1,signature_47_0)

    # Testcase 138:  imm:0xbffff, result rd:x2(0xffffffffbffff000)
    lui x2, 0xbffff
    sd  x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0xffffffffbffff000)
    
    # Testcase 139:  imm:0x7ffff, result rd:x3(0x7ffff000)
    lui x3, 0x7ffff
    sd  x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0x7ffff000)
    
    # Testcase 140:  imm:0xffffe, result rd:x4(0xffffffffffffe000)
    lui x4, 0xffffe
    sd  x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xffffffffffffe000)
    


    

    RVTEST_SIGBASE(x1,signature_48_0)

    # Testcase 141:  imm:0xffffd, result rd:x5(0xffffffffffffd000)
    lui x5, 0xffffd
    sd  x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffffffd000)
    
    # Testcase 142:  imm:0xffffb, result rd:x6(0xffffffffffffb000)
    lui x6, 0xffffb
    sd  x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffffffb000)
    
    # Testcase 143:  imm:0xffff7, result rd:x7(0xffffffffffff7000)
    lui x7, 0xffff7
    sd  x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xffffffffffff7000)
    


    

    RVTEST_SIGBASE(x1,signature_49_0)

    # Testcase 144:  imm:0xfffef, result rd:x8(0xfffffffffffef000)
    lui x8, 0xfffef
    sd  x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffffffef000)
    
    # Testcase 145:  imm:0xfffdf, result rd:x9(0xfffffffffffdf000)
    lui x9, 0xfffdf
    sd  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfffffffffffdf000)
    
    # Testcase 146:  imm:0xfffbf, result rd:x10(0xfffffffffffbf000)
    lui x10, 0xfffbf
    sd  x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xfffffffffffbf000)
    


    

    RVTEST_SIGBASE(x1,signature_50_0)

    # Testcase 147:  imm:0xfff7f, result rd:x11(0xfffffffffff7f000)
    lui x11, 0xfff7f
    sd  x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffffff7f000)
    
    # Testcase 148:  imm:0xffeff, result rd:x12(0xffffffffffeff000)
    lui x12, 0xffeff
    sd  x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffffffeff000)
    
    # Testcase 149:  imm:0xffdff, result rd:x13(0xffffffffffdff000)
    lui x13, 0xffdff
    sd  x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffffdff000)
    


    

    RVTEST_SIGBASE(x1,signature_51_0)

    # Testcase 150:  imm:0xffbff, result rd:x14(0xffffffffffbff000)
    lui x14, 0xffbff
    sd  x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffffbff000)
    
    # Testcase 151:  imm:0xff7ff, result rd:x15(0xffffffffff7ff000)
    lui x15, 0xff7ff
    sd  x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffffff7ff000)
    
    # Testcase 152:  imm:0xfefff, result rd:x16(0xfffffffffefff000)
    lui x16, 0xfefff
    sd  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xfffffffffefff000)
    


    

    RVTEST_SIGBASE(x1,signature_52_0)

    # Testcase 153:  imm:0xfdfff, result rd:x17(0xfffffffffdfff000)
    lui x17, 0xfdfff
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xfffffffffdfff000)
    
    # Testcase 154:  imm:0xfbfff, result rd:x18(0xfffffffffbfff000)
    lui x18, 0xfbfff
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xfffffffffbfff000)
    
    # Testcase 155:  imm:0xf7fff, result rd:x19(0xfffffffff7fff000)
    lui x19, 0xf7fff
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xfffffffff7fff000)
    


    

    RVTEST_SIGBASE(x1,signature_53_0)

    # Testcase 156:  imm:0xeffff, result rd:x20(0xffffffffeffff000)
    lui x20, 0xeffff
    sd  x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffffffeffff000)
    
    # Testcase 157:  imm:0xdffff, result rd:x21(0xffffffffdffff000)
    lui x21, 0xdffff
    sd  x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffffffdffff000)
    
    # Testcase 158:  imm:0xbffff, result rd:x22(0xffffffffbffff000)
    lui x22, 0xbffff
    sd  x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xffffffffbffff000)
    


    

    RVTEST_SIGBASE(x1,signature_54_0)

    # Testcase 159:  imm:0x7ffff, result rd:x23(0x7ffff000)
    lui x23, 0x7ffff
    sd  x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x7ffff000)
    
    # Testcase 160:  imm:0xffffe, result rd:x24(0xffffffffffffe000)
    lui x24, 0xffffe
    sd  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffffffe000)
    
    # Testcase 161:  imm:0xffffd, result rd:x25(0xffffffffffffd000)
    lui x25, 0xffffd
    sd  x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffffffd000)
    


    

    RVTEST_SIGBASE(x1,signature_55_0)

    # Testcase 162:  imm:0xffffb, result rd:x26(0xffffffffffffb000)
    lui x26, 0xffffb
    sd  x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffffffb000)
    
    # Testcase 163:  imm:0xffff7, result rd:x27(0xffffffffffff7000)
    lui x27, 0xffff7
    sd  x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffffffff7000)
    
    # Testcase 164:  imm:0xfffef, result rd:x28(0xfffffffffffef000)
    lui x28, 0xfffef
    sd  x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xfffffffffffef000)
    


    

    RVTEST_SIGBASE(x1,signature_56_0)

    # Testcase 165:  imm:0xfffdf, result rd:x29(0xfffffffffffdf000)
    lui x29, 0xfffdf
    sd  x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xfffffffffffdf000)
    
    # Testcase 166:  imm:0xfffbf, result rd:x30(0xfffffffffffbf000)
    lui x30, 0xfffbf
    sd  x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xfffffffffffbf000)
    
    # Testcase 167:  imm:0xfff7f, result rd:x31(0xfffffffffff7f000)
    lui x31, 0xfff7f
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xfffffffffff7f000)
    


    

    RVTEST_SIGBASE(x3,signature_57_0)

    # Testcase 168:  imm:0x1, result rd:x1(0x1000)
    lui x1, 0x1
    sd  x1, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x1000)
    
    # Testcase 169:  imm:0x2, result rd:x1(0x2000)
    lui x1, 0x2
    sd  x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0x2000)
    
    # Testcase 170:  imm:0x4, result rd:x2(0x4000)
    lui x2, 0x4
    sd  x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0x4000)
    


    

    RVTEST_SIGBASE(x1,signature_58_0)

    # Testcase 171:  imm:0x8, result rd:x3(0x8000)
    lui x3, 0x8
    sd  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x8000)
    
    # Testcase 172:  imm:0x10, result rd:x4(0x10000)
    lui x4, 0x10
    sd  x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0x10000)
    
    # Testcase 173:  imm:0x20, result rd:x5(0x20000)
    lui x5, 0x20
    sd  x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0x20000)
    


    

    RVTEST_SIGBASE(x1,signature_59_0)

    # Testcase 174:  imm:0x40, result rd:x6(0x40000)
    lui x6, 0x40
    sd  x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0x40000)
    
    # Testcase 175:  imm:0x80, result rd:x7(0x80000)
    lui x7, 0x80
    sd  x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x80000)
    
    # Testcase 176:  imm:0x100, result rd:x8(0x100000)
    lui x8, 0x100
    sd  x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0x100000)
    


    

    RVTEST_SIGBASE(x1,signature_60_0)

    # Testcase 177:  imm:0x200, result rd:x9(0x200000)
    lui x9, 0x200
    sd  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0x200000)
    
    # Testcase 178:  imm:0x400, result rd:x10(0x400000)
    lui x10, 0x400
    sd  x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0x400000)
    
    # Testcase 179:  imm:0x800, result rd:x11(0x800000)
    lui x11, 0x800
    sd  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0x800000)
    


    

    RVTEST_SIGBASE(x1,signature_61_0)

    # Testcase 180:  imm:0x1000, result rd:x12(0x1000000)
    lui x12, 0x1000
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0x1000000)
    
    # Testcase 181:  imm:0x2000, result rd:x13(0x2000000)
    lui x13, 0x2000
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0x2000000)
    
    # Testcase 182:  imm:0x4000, result rd:x14(0x4000000)
    lui x14, 0x4000
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0x4000000)
    


    

    RVTEST_SIGBASE(x1,signature_62_0)

    # Testcase 183:  imm:0x8000, result rd:x15(0x8000000)
    lui x15, 0x8000
    sd  x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x8000000)
    
    # Testcase 184:  imm:0x10000, result rd:x16(0x10000000)
    lui x16, 0x10000
    sd  x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0x10000000)
    
    # Testcase 185:  imm:0x20000, result rd:x17(0x20000000)
    lui x17, 0x20000
    sd  x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0x20000000)
    


    

    RVTEST_SIGBASE(x1,signature_63_0)

    # Testcase 186:  imm:0x40000, result rd:x18(0x40000000)
    lui x18, 0x40000
    sd  x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0x40000000)
    
    # Testcase 187:  imm:0x80000, result rd:x19(0xffffffff80000000)
    lui x19, 0x80000
    sd  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffff80000000)
    
    # Testcase 188:  imm:0xffffe, result rd:x20(0xffffffffffffe000)
    lui x20, 0xffffe
    sd  x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffffffffffe000)
    


    

    RVTEST_SIGBASE(x1,signature_64_0)

    # Testcase 189:  imm:0xffffd, result rd:x21(0xffffffffffffd000)
    lui x21, 0xffffd
    sd  x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffffffffffd000)
    
    # Testcase 190:  imm:0xffffb, result rd:x22(0xffffffffffffb000)
    lui x22, 0xffffb
    sd  x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xffffffffffffb000)
    
    # Testcase 191:  imm:0xffff7, result rd:x23(0xffffffffffff7000)
    lui x23, 0xffff7
    sd  x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xffffffffffff7000)
    


    

    RVTEST_SIGBASE(x1,signature_65_0)

    # Testcase 192:  imm:0xfffef, result rd:x24(0xfffffffffffef000)
    lui x24, 0xfffef
    sd  x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xfffffffffffef000)
    
    # Testcase 193:  imm:0xfffdf, result rd:x25(0xfffffffffffdf000)
    lui x25, 0xfffdf
    sd  x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xfffffffffffdf000)
    
    # Testcase 194:  imm:0xfffbf, result rd:x26(0xfffffffffffbf000)
    lui x26, 0xfffbf
    sd  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xfffffffffffbf000)
    


    

    RVTEST_SIGBASE(x1,signature_66_0)

    # Testcase 195:  imm:0xfff7f, result rd:x27(0xfffffffffff7f000)
    lui x27, 0xfff7f
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xfffffffffff7f000)
    
    # Testcase 196:  imm:0xffeff, result rd:x28(0xffffffffffeff000)
    lui x28, 0xffeff
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffffffeff000)
    
    # Testcase 197:  imm:0xffdff, result rd:x29(0xffffffffffdff000)
    lui x29, 0xffdff
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffffffdff000)
    


    

    RVTEST_SIGBASE(x2,signature_67_0)

    # Testcase 198:  imm:0xffbff, result rd:x30(0xffffffffffbff000)
    lui x30, 0xffbff
    sd  x30, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x30, 0xffffffffffbff000)
    
    # Testcase 199:  imm:0xff7ff, result rd:x31(0xffffffffff7ff000)
    lui x31, 0xff7ff
    sd  x31, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xffffffffff7ff000)
    
    # Testcase 200:  imm:0xfefff, result rd:x1(0xfffffffffefff000)
    lui x1, 0xfefff
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xfffffffffefff000)
    


    

    RVTEST_SIGBASE(x4,signature_68_0)

    # Testcase 201:  imm:0xfdfff, result rd:x1(0xfffffffffdfff000)
    lui x1, 0xfdfff
    sd  x1, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x1, 0xfffffffffdfff000)
    
    # Testcase 202:  imm:0xfbfff, result rd:x2(0xfffffffffbfff000)
    lui x2, 0xfbfff
    sd  x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0xfffffffffbfff000)
    
    # Testcase 203:  imm:0xf7fff, result rd:x3(0xfffffffff7fff000)
    lui x3, 0xf7fff
    sd  x3, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xfffffffff7fff000)
    


    

    RVTEST_SIGBASE(x1,signature_69_0)

    # Testcase 204:  imm:0xeffff, result rd:x4(0xffffffffeffff000)
    lui x4, 0xeffff
    sd  x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xffffffffeffff000)
    
    # Testcase 205:  imm:0xdffff, result rd:x5(0xffffffffdffff000)
    lui x5, 0xdffff
    sd  x5, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffdffff000)
    
    # Testcase 206:  imm:0xbffff, result rd:x6(0xffffffffbffff000)
    lui x6, 0xbffff
    sd  x6, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffbffff000)
    


    

    RVTEST_SIGBASE(x1,signature_70_0)

    # Testcase 207:  imm:0x7ffff, result rd:x7(0x7ffff000)
    lui x7, 0x7ffff
    sd  x7, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0x7ffff000)
    
    # Testcase 208:  imm:0xffffe, result rd:x8(0xffffffffffffe000)
    lui x8, 0xffffe
    sd  x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xffffffffffffe000)
    
    # Testcase 209:  imm:0xffffd, result rd:x9(0xffffffffffffd000)
    lui x9, 0xffffd
    sd  x9, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xffffffffffffd000)
    


    

    RVTEST_SIGBASE(x1,signature_71_0)

    # Testcase 210:  imm:0xffffb, result rd:x10(0xffffffffffffb000)
    lui x10, 0xffffb
    sd  x10, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xffffffffffffb000)
    
    # Testcase 211:  imm:0xffff7, result rd:x11(0xffffffffffff7000)
    lui x11, 0xffff7
    sd  x11, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xffffffffffff7000)
    
    # Testcase 212:  imm:0xfffef, result rd:x12(0xfffffffffffef000)
    lui x12, 0xfffef
    sd  x12, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xfffffffffffef000)
    


    

    RVTEST_SIGBASE(x1,signature_72_0)

    # Testcase 213:  imm:0xfffdf, result rd:x13(0xfffffffffffdf000)
    lui x13, 0xfffdf
    sd  x13, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xfffffffffffdf000)
    
    # Testcase 214:  imm:0xfffbf, result rd:x14(0xfffffffffffbf000)
    lui x14, 0xfffbf
    sd  x14, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xfffffffffffbf000)
    
    # Testcase 215:  imm:0xfff7f, result rd:x15(0xfffffffffff7f000)
    lui x15, 0xfff7f
    sd  x15, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xfffffffffff7f000)
    


    

    RVTEST_SIGBASE(x1,signature_73_0)

    # Testcase 216:  imm:0xffeff, result rd:x16(0xffffffffffeff000)
    lui x16, 0xffeff
    sd  x16, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xffffffffffeff000)
    
    # Testcase 217:  imm:0xffdff, result rd:x17(0xffffffffffdff000)
    lui x17, 0xffdff
    sd  x17, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffffdff000)
    
    # Testcase 218:  imm:0xffbff, result rd:x18(0xffffffffffbff000)
    lui x18, 0xffbff
    sd  x18, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffffffffffbff000)
    


    

    RVTEST_SIGBASE(x1,signature_74_0)

    # Testcase 219:  imm:0xff7ff, result rd:x19(0xffffffffff7ff000)
    lui x19, 0xff7ff
    sd  x19, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffff7ff000)
    
    # Testcase 220:  imm:0xfefff, result rd:x20(0xfffffffffefff000)
    lui x20, 0xfefff
    sd  x20, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xfffffffffefff000)
    
    # Testcase 221:  imm:0xfdfff, result rd:x21(0xfffffffffdfff000)
    lui x21, 0xfdfff
    sd  x21, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xfffffffffdfff000)
    


    

    RVTEST_SIGBASE(x1,signature_75_0)

    # Testcase 222:  imm:0xfbfff, result rd:x22(0xfffffffffbfff000)
    lui x22, 0xfbfff
    sd  x22, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffffffffbfff000)
    
    # Testcase 223:  imm:0xf7fff, result rd:x23(0xfffffffff7fff000)
    lui x23, 0xf7fff
    sd  x23, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffffff7fff000)
    
    # Testcase 224:  imm:0xeffff, result rd:x24(0xffffffffeffff000)
    lui x24, 0xeffff
    sd  x24, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffeffff000)
    


    

    RVTEST_SIGBASE(x1,signature_76_0)

    # Testcase 225:  imm:0xdffff, result rd:x25(0xffffffffdffff000)
    lui x25, 0xdffff
    sd  x25, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffdffff000)
    
    # Testcase 226:  imm:0xbffff, result rd:x26(0xffffffffbffff000)
    lui x26, 0xbffff
    sd  x26, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffbffff000)
    
    # Testcase 227:  imm:0x7ffff, result rd:x27(0x7ffff000)
    lui x27, 0x7ffff
    sd  x27, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0x7ffff000)
    


    

    RVTEST_SIGBASE(x1,signature_77_0)

    # Testcase 228:  imm:0xffffe, result rd:x28(0xffffffffffffe000)
    lui x28, 0xffffe
    sd  x28, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xffffffffffffe000)
    
    # Testcase 229:  imm:0xffffd, result rd:x29(0xffffffffffffd000)
    lui x29, 0xffffd
    sd  x29, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xffffffffffffd000)
    
    # Testcase 230:  imm:0xffffb, result rd:x30(0xffffffffffffb000)
    lui x30, 0xffffb
    sd  x30, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xffffffffffffb000)
    


    

    RVTEST_SIGBASE(x2,signature_78_0)

    # Testcase 231:  imm:0xffff7, result rd:x31(0xffffffffffff7000)
    lui x31, 0xffff7
    sd  x31, 0(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x31, 0xffffffffffff7000)
    
    # Testcase 232:  imm:0xfffef, result rd:x1(0xfffffffffffef000)
    lui x1, 0xfffef
    sd  x1, 8(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xfffffffffffef000)
    
    # Testcase 233:  imm:0xfffdf, result rd:x1(0xfffffffffffdf000)
    lui x1, 0xfffdf
    sd  x1, 16(x2)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x1, 0xfffffffffffdf000)
    


    

    RVTEST_SIGBASE(x1,signature_79_0)

    # Testcase 234:  imm:0xfffbf, result rd:x2(0xfffffffffffbf000)
    lui x2, 0xfffbf
    sd  x2, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x2, 0xfffffffffffbf000)
    
    # Testcase 235:  imm:0xfff7f, result rd:x3(0xfffffffffff7f000)
    lui x3, 0xfff7f
    sd  x3, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x3, 0xfffffffffff7f000)
    
    # Testcase 236:  imm:0xffeff, result rd:x4(0xffffffffffeff000)
    lui x4, 0xffeff
    sd  x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x5, x4, 0xffffffffffeff000)
    


    

    RVTEST_SIGBASE(x1,signature_80_0)

    # Testcase 237:  imm:0xffdff, result rd:x5(0xffffffffffdff000)
    lui x5, 0xffdff
    sd  x5, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffffdff000)
    
    # Testcase 238:  imm:0xffbff, result rd:x6(0xffffffffffbff000)
    lui x6, 0xffbff
    sd  x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffffbff000)
    
    # Testcase 239:  imm:0xff7ff, result rd:x7(0xffffffffff7ff000)
    lui x7, 0xff7ff
    sd  x7, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xffffffffff7ff000)
    


    

    RVTEST_SIGBASE(x1,signature_81_0)

    # Testcase 240:  imm:0xfefff, result rd:x8(0xfffffffffefff000)
    lui x8, 0xfefff
    sd  x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffffefff000)
    
    # Testcase 241:  imm:0xfdfff, result rd:x9(0xfffffffffdfff000)
    lui x9, 0xfdfff
    sd  x9, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfffffffffdfff000)
    
    # Testcase 242:  imm:0xfbfff, result rd:x10(0xfffffffffbfff000)
    lui x10, 0xfbfff
    sd  x10, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xfffffffffbfff000)
    


    

    RVTEST_SIGBASE(x1,signature_82_0)

    # Testcase 243:  imm:0xf7fff, result rd:x11(0xfffffffff7fff000)
    lui x11, 0xf7fff
    sd  x11, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffff7fff000)
    
    # Testcase 244:  imm:0xeffff, result rd:x12(0xffffffffeffff000)
    lui x12, 0xeffff
    sd  x12, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffffeffff000)
    
    # Testcase 245:  imm:0xdffff, result rd:x13(0xffffffffdffff000)
    lui x13, 0xdffff
    sd  x13, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffdffff000)
    


    

    RVTEST_SIGBASE(x1,signature_83_0)

    # Testcase 246:  imm:0xbffff, result rd:x14(0xffffffffbffff000)
    lui x14, 0xbffff
    sd  x14, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffbffff000)
    
    # Testcase 247:  imm:0x7ffff, result rd:x15(0x7ffff000)
    lui x15, 0x7ffff
    sd  x15, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0x7ffff000)
    
    # Testcase 248:  imm:0xffffe, result rd:x16(0xffffffffffffe000)
    lui x16, 0xffffe
    sd  x16, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xffffffffffffe000)
    


    

    RVTEST_SIGBASE(x1,signature_84_0)

    # Testcase 249:  imm:0xffffd, result rd:x17(0xffffffffffffd000)
    lui x17, 0xffffd
    sd  x17, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xffffffffffffd000)
    
    # Testcase 250:  imm:0xffffb, result rd:x18(0xffffffffffffb000)
    lui x18, 0xffffb
    sd  x18, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xffffffffffffb000)
    
    # Testcase 251:  imm:0xffff7, result rd:x19(0xffffffffffff7000)
    lui x19, 0xffff7
    sd  x19, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xffffffffffff7000)
    


    

    RVTEST_SIGBASE(x1,signature_85_0)

    # Testcase 252:  imm:0xfffef, result rd:x20(0xfffffffffffef000)
    lui x20, 0xfffef
    sd  x20, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xfffffffffffef000)
    
    # Testcase 253:  imm:0xfffdf, result rd:x21(0xfffffffffffdf000)
    lui x21, 0xfffdf
    sd  x21, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xfffffffffffdf000)
    
    # Testcase 254:  imm:0xfffbf, result rd:x22(0xfffffffffffbf000)
    lui x22, 0xfffbf
    sd  x22, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xfffffffffffbf000)
    


    

    RVTEST_SIGBASE(x1,signature_86_0)

    # Testcase 255:  imm:0xfff7f, result rd:x23(0xfffffffffff7f000)
    lui x23, 0xfff7f
    sd  x23, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0xfffffffffff7f000)
    
    # Testcase 256:  imm:0xffeff, result rd:x24(0xffffffffffeff000)
    lui x24, 0xffeff
    sd  x24, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffffeff000)
    
    # Testcase 257:  imm:0xffdff, result rd:x25(0xffffffffffdff000)
    lui x25, 0xffdff
    sd  x25, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffffdff000)
    


    

    RVTEST_SIGBASE(x1,signature_87_0)

    # Testcase 258:  imm:0xffbff, result rd:x26(0xffffffffffbff000)
    lui x26, 0xffbff
    sd  x26, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffffbff000)
    
    # Testcase 259:  imm:0xff7ff, result rd:x27(0xffffffffff7ff000)
    lui x27, 0xff7ff
    sd  x27, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffffff7ff000)
    
    # Testcase 260:  imm:0xfefff, result rd:x28(0xfffffffffefff000)
    lui x28, 0xfefff
    sd  x28, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xfffffffffefff000)
    


    

    RVTEST_SIGBASE(x1,signature_88_0)

    # Testcase 261:  imm:0xfdfff, result rd:x29(0xfffffffffdfff000)
    lui x29, 0xfdfff
    sd  x29, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xfffffffffdfff000)
    
    # Testcase 262:  imm:0xfbfff, result rd:x30(0xfffffffffbfff000)
    lui x30, 0xfbfff
    sd  x30, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xfffffffffbfff000)
    
    # Testcase 263:  imm:0xf7fff, result rd:x31(0xfffffffff7fff000)
    lui x31, 0xf7fff
    sd  x31, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xfffffffff7fff000)
    


    

    RVTEST_SIGBASE(x3,signature_89_0)

    # Testcase 264:  imm:0xeffff, result rd:x1(0xffffffffeffff000)
    lui x1, 0xeffff
    sd  x1, 0(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xffffffffeffff000)
    
    # Testcase 265:  imm:0xdffff, result rd:x1(0xffffffffdffff000)
    lui x1, 0xdffff
    sd  x1, 8(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x1, 0xffffffffdffff000)
    
    # Testcase 266:  imm:0xbffff, result rd:x2(0xffffffffbffff000)
    lui x2, 0xbffff
    sd  x2, 16(x3)
    RVMODEL_IO_ASSERT_GPR_EQ(x4, x2, 0xffffffffbffff000)
    


    

    RVTEST_SIGBASE(x1,signature_90_0)

    # Testcase 267:  imm:0x7ffff, result rd:x3(0x7ffff000)
    lui x3, 0x7ffff
    sd  x3, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x3, 0x7ffff000)
    
    # Testcase 268:  imm:0xffffe, result rd:x4(0xffffffffffffe000)
    lui x4, 0xffffe
    sd  x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x4, 0xffffffffffffe000)
    
    # Testcase 269:  imm:0xffffd, result rd:x5(0xffffffffffffd000)
    lui x5, 0xffffd
    sd  x5, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x5, 0xffffffffffffd000)
    


    

    RVTEST_SIGBASE(x1,signature_91_0)

    # Testcase 270:  imm:0xffffb, result rd:x6(0xffffffffffffb000)
    lui x6, 0xffffb
    sd  x6, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x6, 0xffffffffffffb000)
    
    # Testcase 271:  imm:0xffff7, result rd:x7(0xffffffffffff7000)
    lui x7, 0xffff7
    sd  x7, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x7, 0xffffffffffff7000)
    
    # Testcase 272:  imm:0xfffef, result rd:x8(0xfffffffffffef000)
    lui x8, 0xfffef
    sd  x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x8, 0xfffffffffffef000)
    


    

    RVTEST_SIGBASE(x1,signature_92_0)

    # Testcase 273:  imm:0xfffdf, result rd:x9(0xfffffffffffdf000)
    lui x9, 0xfffdf
    sd  x9, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x9, 0xfffffffffffdf000)
    
    # Testcase 274:  imm:0xfffbf, result rd:x10(0xfffffffffffbf000)
    lui x10, 0xfffbf
    sd  x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x10, 0xfffffffffffbf000)
    
    # Testcase 275:  imm:0xfff7f, result rd:x11(0xfffffffffff7f000)
    lui x11, 0xfff7f
    sd  x11, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x11, 0xfffffffffff7f000)
    


    

    RVTEST_SIGBASE(x1,signature_93_0)

    # Testcase 276:  imm:0xffeff, result rd:x12(0xffffffffffeff000)
    lui x12, 0xffeff
    sd  x12, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x12, 0xffffffffffeff000)
    
    # Testcase 277:  imm:0xffdff, result rd:x13(0xffffffffffdff000)
    lui x13, 0xffdff
    sd  x13, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x13, 0xffffffffffdff000)
    
    # Testcase 278:  imm:0xffbff, result rd:x14(0xffffffffffbff000)
    lui x14, 0xffbff
    sd  x14, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x14, 0xffffffffffbff000)
    


    

    RVTEST_SIGBASE(x1,signature_94_0)

    # Testcase 279:  imm:0xff7ff, result rd:x15(0xffffffffff7ff000)
    lui x15, 0xff7ff
    sd  x15, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x15, 0xffffffffff7ff000)
    
    # Testcase 280:  imm:0xfefff, result rd:x16(0xfffffffffefff000)
    lui x16, 0xfefff
    sd  x16, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x16, 0xfffffffffefff000)
    
    # Testcase 281:  imm:0xfdfff, result rd:x17(0xfffffffffdfff000)
    lui x17, 0xfdfff
    sd  x17, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x17, 0xfffffffffdfff000)
    


    

    RVTEST_SIGBASE(x1,signature_95_0)

    # Testcase 282:  imm:0xfbfff, result rd:x18(0xfffffffffbfff000)
    lui x18, 0xfbfff
    sd  x18, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x18, 0xfffffffffbfff000)
    
    # Testcase 283:  imm:0xf7fff, result rd:x19(0xfffffffff7fff000)
    lui x19, 0xf7fff
    sd  x19, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x19, 0xfffffffff7fff000)
    
    # Testcase 284:  imm:0xeffff, result rd:x20(0xffffffffeffff000)
    lui x20, 0xeffff
    sd  x20, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x20, 0xffffffffeffff000)
    


    

    RVTEST_SIGBASE(x1,signature_96_0)

    # Testcase 285:  imm:0xdffff, result rd:x21(0xffffffffdffff000)
    lui x21, 0xdffff
    sd  x21, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x21, 0xffffffffdffff000)
    
    # Testcase 286:  imm:0xbffff, result rd:x22(0xffffffffbffff000)
    lui x22, 0xbffff
    sd  x22, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x22, 0xffffffffbffff000)
    
    # Testcase 287:  imm:0x7ffff, result rd:x23(0x7ffff000)
    lui x23, 0x7ffff
    sd  x23, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x23, 0x7ffff000)
    


    

    RVTEST_SIGBASE(x1,signature_97_0)

    # Testcase 288:  imm:0xffffe, result rd:x24(0xffffffffffffe000)
    lui x24, 0xffffe
    sd  x24, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x24, 0xffffffffffffe000)
    
    # Testcase 289:  imm:0xffffd, result rd:x25(0xffffffffffffd000)
    lui x25, 0xffffd
    sd  x25, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x25, 0xffffffffffffd000)
    
    # Testcase 290:  imm:0xffffb, result rd:x26(0xffffffffffffb000)
    lui x26, 0xffffb
    sd  x26, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x26, 0xffffffffffffb000)
    


    

    RVTEST_SIGBASE(x1,signature_98_0)

    # Testcase 291:  imm:0xffff7, result rd:x27(0xffffffffffff7000)
    lui x27, 0xffff7
    sd  x27, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x27, 0xffffffffffff7000)
    
    # Testcase 292:  imm:0xfffef, result rd:x28(0xfffffffffffef000)
    lui x28, 0xfffef
    sd  x28, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x28, 0xfffffffffffef000)
    
    # Testcase 293:  imm:0xfffdf, result rd:x29(0xfffffffffffdf000)
    lui x29, 0xfffdf
    sd  x29, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x29, 0xfffffffffffdf000)
    


    

    RVTEST_SIGBASE(x1,signature_99_0)

    # Testcase 294:  imm:0xfffbf, result rd:x30(0xfffffffffffbf000)
    lui x30, 0xfffbf
    sd  x30, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x30, 0xfffffffffffbf000)
    
    # Testcase 295:  imm:0xfff7f, result rd:x31(0xfffffffffff7f000)
    lui x31, 0xfff7f
    sd  x31, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x31, 0xfffffffffff7f000)
    
    # Testcase 296:  imm:0xaa8dc, result rd:x0(0x0)
    lui x0, 0xaa8dc
    sd  x0, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x2, x0, 0x0)
    
	
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
	.fill 3, 8, 0xdeadbeef
signature_2_0:
	.fill 3, 8, 0xdeadbeef
signature_3_0:
	.fill 3, 8, 0xdeadbeef
signature_4_0:
	.fill 3, 8, 0xdeadbeef
signature_5_0:
	.fill 3, 8, 0xdeadbeef
signature_6_0:
	.fill 3, 8, 0xdeadbeef
signature_7_0:
	.fill 3, 8, 0xdeadbeef
signature_8_0:
	.fill 3, 8, 0xdeadbeef
signature_9_0:
	.fill 3, 8, 0xdeadbeef
signature_10_0:
	.fill 3, 8, 0xdeadbeef
signature_11_0:
	.fill 3, 8, 0xdeadbeef
signature_12_0:
	.fill 3, 8, 0xdeadbeef
signature_13_0:
	.fill 3, 8, 0xdeadbeef
signature_14_0:
	.fill 3, 8, 0xdeadbeef
signature_15_0:
	.fill 3, 8, 0xdeadbeef
signature_16_0:
	.fill 3, 8, 0xdeadbeef
signature_17_0:
	.fill 3, 8, 0xdeadbeef
signature_18_0:
	.fill 3, 8, 0xdeadbeef
signature_19_0:
	.fill 3, 8, 0xdeadbeef
signature_20_0:
	.fill 3, 8, 0xdeadbeef
signature_21_0:
	.fill 3, 8, 0xdeadbeef
signature_22_0:
	.fill 3, 8, 0xdeadbeef
signature_23_0:
	.fill 3, 8, 0xdeadbeef
signature_24_0:
	.fill 3, 8, 0xdeadbeef
signature_25_0:
	.fill 3, 8, 0xdeadbeef
signature_26_0:
	.fill 3, 8, 0xdeadbeef
signature_27_0:
	.fill 3, 8, 0xdeadbeef
signature_28_0:
	.fill 3, 8, 0xdeadbeef
signature_29_0:
	.fill 3, 8, 0xdeadbeef
signature_30_0:
	.fill 3, 8, 0xdeadbeef
signature_31_0:
	.fill 3, 8, 0xdeadbeef
signature_32_0:
	.fill 3, 8, 0xdeadbeef
signature_33_0:
	.fill 3, 8, 0xdeadbeef
signature_34_0:
	.fill 3, 8, 0xdeadbeef
signature_35_0:
	.fill 3, 8, 0xdeadbeef
signature_36_0:
	.fill 3, 8, 0xdeadbeef
signature_37_0:
	.fill 3, 8, 0xdeadbeef
signature_38_0:
	.fill 3, 8, 0xdeadbeef
signature_39_0:
	.fill 3, 8, 0xdeadbeef
signature_40_0:
	.fill 3, 8, 0xdeadbeef
signature_41_0:
	.fill 3, 8, 0xdeadbeef
signature_42_0:
	.fill 3, 8, 0xdeadbeef
signature_43_0:
	.fill 3, 8, 0xdeadbeef
signature_44_0:
	.fill 3, 8, 0xdeadbeef
signature_45_0:
	.fill 3, 8, 0xdeadbeef
signature_46_0:
	.fill 3, 8, 0xdeadbeef
signature_47_0:
	.fill 3, 8, 0xdeadbeef
signature_48_0:
	.fill 3, 8, 0xdeadbeef
signature_49_0:
	.fill 3, 8, 0xdeadbeef
signature_50_0:
	.fill 3, 8, 0xdeadbeef
signature_51_0:
	.fill 3, 8, 0xdeadbeef
signature_52_0:
	.fill 3, 8, 0xdeadbeef
signature_53_0:
	.fill 3, 8, 0xdeadbeef
signature_54_0:
	.fill 3, 8, 0xdeadbeef
signature_55_0:
	.fill 3, 8, 0xdeadbeef
signature_56_0:
	.fill 3, 8, 0xdeadbeef
signature_57_0:
	.fill 3, 8, 0xdeadbeef
signature_58_0:
	.fill 3, 8, 0xdeadbeef
signature_59_0:
	.fill 3, 8, 0xdeadbeef
signature_60_0:
	.fill 3, 8, 0xdeadbeef
signature_61_0:
	.fill 3, 8, 0xdeadbeef
signature_62_0:
	.fill 3, 8, 0xdeadbeef
signature_63_0:
	.fill 3, 8, 0xdeadbeef
signature_64_0:
	.fill 3, 8, 0xdeadbeef
signature_65_0:
	.fill 3, 8, 0xdeadbeef
signature_66_0:
	.fill 3, 8, 0xdeadbeef
signature_67_0:
	.fill 3, 8, 0xdeadbeef
signature_68_0:
	.fill 3, 8, 0xdeadbeef
signature_69_0:
	.fill 3, 8, 0xdeadbeef
signature_70_0:
	.fill 3, 8, 0xdeadbeef
signature_71_0:
	.fill 3, 8, 0xdeadbeef
signature_72_0:
	.fill 3, 8, 0xdeadbeef
signature_73_0:
	.fill 3, 8, 0xdeadbeef
signature_74_0:
	.fill 3, 8, 0xdeadbeef
signature_75_0:
	.fill 3, 8, 0xdeadbeef
signature_76_0:
	.fill 3, 8, 0xdeadbeef
signature_77_0:
	.fill 3, 8, 0xdeadbeef
signature_78_0:
	.fill 3, 8, 0xdeadbeef
signature_79_0:
	.fill 3, 8, 0xdeadbeef
signature_80_0:
	.fill 3, 8, 0xdeadbeef
signature_81_0:
	.fill 3, 8, 0xdeadbeef
signature_82_0:
	.fill 3, 8, 0xdeadbeef
signature_83_0:
	.fill 3, 8, 0xdeadbeef
signature_84_0:
	.fill 3, 8, 0xdeadbeef
signature_85_0:
	.fill 3, 8, 0xdeadbeef
signature_86_0:
	.fill 3, 8, 0xdeadbeef
signature_87_0:
	.fill 3, 8, 0xdeadbeef
signature_88_0:
	.fill 3, 8, 0xdeadbeef
signature_89_0:
	.fill 3, 8, 0xdeadbeef
signature_90_0:
	.fill 3, 8, 0xdeadbeef
signature_91_0:
	.fill 3, 8, 0xdeadbeef
signature_92_0:
	.fill 3, 8, 0xdeadbeef
signature_93_0:
	.fill 3, 8, 0xdeadbeef
signature_94_0:
	.fill 3, 8, 0xdeadbeef
signature_95_0:
	.fill 3, 8, 0xdeadbeef
signature_96_0:
	.fill 3, 8, 0xdeadbeef
signature_97_0:
	.fill 3, 8, 0xdeadbeef
signature_98_0:
	.fill 3, 8, 0xdeadbeef
signature_99_0:
	.fill 3, 8, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

