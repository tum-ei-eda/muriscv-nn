// RISC-V Architectural Validation Test CSRRW-01
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
// Specification: Zicsr Control and Status Register (CSR) Instructions Version 2.0
// Description: Testing instruction 'CSRRW'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64I")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zicsr.*);def TEST_CASE_1=True;",csrrw)

    RVTEST_SIGBASE(x1,signature_1_0)

    TEST_CSR_OP(csrrw, x19, x28, mscratch, 0xf4bcf4a786569d27, 0x54f4aeeb151a01ef, 0x54f4aeeb151a01ef, 0xf4bcf4a786569d27, x31, x1, 0, x6)   # Testcase 0
    TEST_CSR_OP(csrrw, x20, x10, mscratch, 0xe3977ec120219a51, 0xe1b1199b429ede3d, 0xe1b1199b429ede3d, 0xe3977ec120219a51, x2, x1, 16, x6)   # Testcase 1
    TEST_CSR_OP(csrrw, x3, x31, mscratch, 0x80bd3ffebd8f6c65, 0xb26566a091a8d5fd, 0xb26566a091a8d5fd, 0x80bd3ffebd8f6c65, x30, x1, 32, x6)   # Testcase 2
    TEST_CSR_OP(csrrw, x5, x0, mscratch, 0xc3e260bde31ffa64, 0x0, 0xf27008e60466250f, 0xc3e260bde31ffa64, x14, x1, 48, x6)   # Testcase 3
    TEST_CSR_OP(csrrw, x4, x11, mscratch, 0x2f7b22b7e54c8c1e, 0xc8484a3c737ad3a, 0xc8484a3c737ad3a, 0x2f7b22b7e54c8c1e, x26, x1, 64, x6)   # Testcase 4


    

    RVTEST_SIGBASE(x3,signature_2_0)

    TEST_CSR_OP(csrrw, x2, x18, mscratch, 0xbf042c8c0692dadf, 0xa783d03f7ca660db, 0xa783d03f7ca660db, 0xbf042c8c0692dadf, x19, x3, 0, x4)   # Testcase 5
    TEST_CSR_OP(csrrw, x7, x9, mscratch, 0x807fe203fbba7ae7, 0xfd7b9df82c63c847, 0xfd7b9df82c63c847, 0x807fe203fbba7ae7, x1, x3, 16, x4)   # Testcase 6
    TEST_CSR_OP(csrrw, x17, x23, mscratch, 0xa14cf866f600a3d1, 0xafaa29d195b62bf, 0xafaa29d195b62bf, 0xa14cf866f600a3d1, x1, x3, 32, x4)   # Testcase 7
    TEST_CSR_OP(csrrw, x21, x0, mscratch, 0xe2fe64433aef5ff4, 0x0, 0x413f2c6234b80fd4, 0xe2fe64433aef5ff4, x31, x3, 48, x4)   # Testcase 8
    TEST_CSR_OP(csrrw, x0, x17, mscratch, 0x0, 0x2c370a9a34267ad9, 0x2c370a9a34267ad9, 0x701512f5681454c0, x1, x3, 64, x4)   # Testcase 9


    

    RVTEST_SIGBASE(x3,signature_3_0)

    TEST_CSR_OP(csrrw, x6, x11, mscratch, 0x2a81b798b02d663e, 0x2882a0b367dd3492, 0x2882a0b367dd3492, 0x2a81b798b02d663e, x23, x3, 0, x5)   # Testcase 10
    TEST_CSR_OP(csrrw, x9, x2, mscratch, 0xc68101ee824d39ae, 0x91dd5ad6b2d3f1c5, 0x91dd5ad6b2d3f1c5, 0xc68101ee824d39ae, x8, x3, 16, x5)   # Testcase 11
    TEST_CSR_OP(csrrw, x13, x7, mscratch, 0x589f2ccdd4983650, 0x42f1d6295233a4dd, 0x42f1d6295233a4dd, 0x589f2ccdd4983650, x4, x3, 32, x5)   # Testcase 12
    TEST_CSR_OP(csrrw, x13, x24, mscratch, 0x14cf50e37bf4071, 0xcddbdf6f18fc88d5, 0xcddbdf6f18fc88d5, 0x14cf50e37bf4071, x4, x3, 48, x5)   # Testcase 13
    TEST_CSR_OP(csrrw, x17, x14, mscratch, 0xc9e2ce4fd1bc7dd8, 0x4d236af8c83b3c30, 0x4d236af8c83b3c30, 0xc9e2ce4fd1bc7dd8, x1, x3, 64, x5)   # Testcase 14


    

    RVTEST_SIGBASE(x2,signature_4_0)

    TEST_CSR_OP(csrrw, x20, x18, mscratch, 0x242b987862f6cb6d, 0x983b9f63a968a97f, 0x983b9f63a968a97f, 0x242b987862f6cb6d, x5, x2, 0, x6)   # Testcase 15
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x28aadb5b3874f8a5, 0x1fbe3ca65b086787, 0x1fbe3ca65b086787, 0x28aadb5b3874f8a5, x18, x2, 16, x6)   # Testcase 16
    TEST_CSR_OP(csrrw, x1, x22, mscratch, 0xdf0fdcd2951e8621, 0x353a85936075c1a2, 0x353a85936075c1a2, 0xdf0fdcd2951e8621, x4, x2, 32, x6)   # Testcase 17
    TEST_CSR_OP(csrrw, x3, x19, mscratch, 0xc357b9259b327ba8, 0x66268a1a4ff09378, 0x66268a1a4ff09378, 0xc357b9259b327ba8, x16, x2, 48, x6)   # Testcase 18
    TEST_CSR_OP(csrrw, x13, x28, mscratch, 0xba4194f803d5081b, 0x28ac54a3b32a4c52, 0x28ac54a3b32a4c52, 0xba4194f803d5081b, x7, x2, 64, x6)   # Testcase 19


    

    RVTEST_SIGBASE(x2,signature_5_0)

    TEST_CSR_OP(csrrw, x14, x6, mscratch, 0xc2e008f50b56ed8c, 0xdc3713a217a2fb1a, 0xdc3713a217a2fb1a, 0xc2e008f50b56ed8c, x10, x2, 0, x3)   # Testcase 20
    TEST_CSR_OP(csrrw, x17, x10, mscratch, 0x2ed729e0b5aeeeb5, 0x74674399484605f6, 0x74674399484605f6, 0x2ed729e0b5aeeeb5, x15, x2, 16, x3)   # Testcase 21
    TEST_CSR_OP(csrrw, x6, x22, mscratch, 0x5b57716e8dd5cd04, 0x6bdd9821fc9d848f, 0x6bdd9821fc9d848f, 0x5b57716e8dd5cd04, x1, x2, 32, x3)   # Testcase 22
    TEST_CSR_OP(csrrw, x0, x19, mscratch, 0x0, 0x825648e49b1a8042, 0x825648e49b1a8042, 0x78636af4da4c9686, x29, x2, 48, x3)   # Testcase 23
    TEST_CSR_OP(csrrw, x19, x31, mscratch, 0xf4cc30bce0e9092c, 0x7bf4ef1c426b8dfb, 0x7bf4ef1c426b8dfb, 0xf4cc30bce0e9092c, x28, x2, 64, x3)   # Testcase 24


    

    RVTEST_SIGBASE(x1,signature_6_0)

    TEST_CSR_OP(csrrw, x21, x23, mscratch, 0x35a0ec8073b3e156, 0xf49a4b2f6323d52, 0xf49a4b2f6323d52, 0x35a0ec8073b3e156, x17, x1, 0, x2)   # Testcase 25
    TEST_CSR_OP(csrrw, x24, x28, mscratch, 0xcb0947ed86b081d4, 0xfe9b8abf4bfb003d, 0xfe9b8abf4bfb003d, 0xcb0947ed86b081d4, x8, x1, 16, x2)   # Testcase 26
    TEST_CSR_OP(csrrw, x26, x16, mscratch, 0x8cc7e79093b06678, 0x347ebc89f22b6484, 0x347ebc89f22b6484, 0x8cc7e79093b06678, x6, x1, 32, x2)   # Testcase 27
    TEST_CSR_OP(csrrw, x13, x5, mscratch, 0xa5c8d8603b9b3ddc, 0xf52a52bf0cc9d6c8, 0xf52a52bf0cc9d6c8, 0xa5c8d8603b9b3ddc, x4, x1, 48, x2)   # Testcase 28
    TEST_CSR_OP(csrrw, x5, x8, mscratch, 0xf4a6499905252532, 0xcaa4b80e169dbce8, 0xcaa4b80e169dbce8, 0xf4a6499905252532, x28, x1, 64, x2)   # Testcase 29


    

    RVTEST_SIGBASE(x1,signature_7_0)

    TEST_CSR_OP(csrrw, x0, x2, mscratch, 0x0, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x8, x1, 0, x4)   # Testcase 30
    TEST_CSR_OP(csrrw, x28, x3, mscratch, 0xffffffffffffffff, 0x8000000000000000, 0x8000000000000000, 0xffffffffffffffff, x31, x1, 16, x4)   # Testcase 31
    TEST_CSR_OP(csrrw, x24, x17, mscratch, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, x29, x1, 32, x4)   # Testcase 32
    TEST_CSR_OP(csrrw, x14, x21, mscratch, 0x7fffffffffffffff, 0x1, 0x1, 0x7fffffffffffffff, x23, x1, 48, x4)   # Testcase 33
    TEST_CSR_OP(csrrw, x0, x12, mscratch, 0x0, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x6, x1, 64, x4)   # Testcase 34


    

    RVTEST_SIGBASE(x1,signature_8_0)

    TEST_CSR_OP(csrrw, x29, x0, mscratch, 0xffffffffffffffff, 0x0, 0x8000000000000000, 0xffffffffffffffff, x31, x1, 0, x2)   # Testcase 35
    TEST_CSR_OP(csrrw, x0, x11, mscratch, 0x0, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, x18, x1, 16, x2)   # Testcase 36
    TEST_CSR_OP(csrrw, x23, x16, mscratch, 0x7fffffffffffffff, 0x1, 0x1, 0x7fffffffffffffff, x25, x1, 32, x2)   # Testcase 37
    TEST_CSR_OP(csrrw, x12, x29, mscratch, 0x0, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, x3, x1, 48, x2)   # Testcase 38
    TEST_CSR_OP(csrrw, x31, x12, mscratch, 0xffffffffffffffff, 0x8000000000000000, 0x8000000000000000, 0xffffffffffffffff, x8, x1, 64, x2)   # Testcase 39


    

    RVTEST_SIGBASE(x7,signature_9_0)

    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0xfffffffffffffffe, 0x1, 0x1, 0xfffffffffffffffe, x3, x7, 0, x8)   # Testcase 40
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x7fffffffffffffff, 0x2, 0x2, 0x7fffffffffffffff, x3, x7, 16, x8)   # Testcase 41
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0xbfffffffffffffff, 0x4, 0x4, 0xbfffffffffffffff, x4, x7, 32, x8)   # Testcase 42
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0xdfffffffffffffff, 0x8, 0x8, 0xdfffffffffffffff, x5, x7, 48, x8)   # Testcase 43
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0xefffffffffffffff, 0x10, 0x10, 0xefffffffffffffff, x6, x7, 64, x8)   # Testcase 44


    

    RVTEST_SIGBASE(x1,signature_10_0)

    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0xf7ffffffffffffff, 0x20, 0x20, 0xf7ffffffffffffff, x7, x1, 0, x2)   # Testcase 45
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0xfbffffffffffffff, 0x40, 0x40, 0xfbffffffffffffff, x8, x1, 16, x2)   # Testcase 46
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0xfdffffffffffffff, 0x80, 0x80, 0xfdffffffffffffff, x9, x1, 32, x2)   # Testcase 47
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0xfeffffffffffffff, 0x100, 0x100, 0xfeffffffffffffff, x10, x1, 48, x2)   # Testcase 48
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0xff7fffffffffffff, 0x200, 0x200, 0xff7fffffffffffff, x11, x1, 64, x2)   # Testcase 49


    

    RVTEST_SIGBASE(x1,signature_11_0)

    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0xffbfffffffffffff, 0x400, 0x400, 0xffbfffffffffffff, x12, x1, 0, x2)   # Testcase 50
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0xffdfffffffffffff, 0x800, 0x800, 0xffdfffffffffffff, x13, x1, 16, x2)   # Testcase 51
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0xffefffffffffffff, 0x1000, 0x1000, 0xffefffffffffffff, x14, x1, 32, x2)   # Testcase 52
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0xfff7ffffffffffff, 0x2000, 0x2000, 0xfff7ffffffffffff, x15, x1, 48, x2)   # Testcase 53
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0xfffbffffffffffff, 0x4000, 0x4000, 0xfffbffffffffffff, x16, x1, 64, x2)   # Testcase 54


    

    RVTEST_SIGBASE(x1,signature_12_0)

    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0xfffdffffffffffff, 0x8000, 0x8000, 0xfffdffffffffffff, x17, x1, 0, x2)   # Testcase 55
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0xfffeffffffffffff, 0x10000, 0x10000, 0xfffeffffffffffff, x18, x1, 16, x2)   # Testcase 56
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0xffff7fffffffffff, 0x20000, 0x20000, 0xffff7fffffffffff, x19, x1, 32, x2)   # Testcase 57
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0xffffbfffffffffff, 0x40000, 0x40000, 0xffffbfffffffffff, x20, x1, 48, x2)   # Testcase 58
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0xffffdfffffffffff, 0x80000, 0x80000, 0xffffdfffffffffff, x21, x1, 64, x2)   # Testcase 59


    

    RVTEST_SIGBASE(x1,signature_13_0)

    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0xffffefffffffffff, 0x100000, 0x100000, 0xffffefffffffffff, x22, x1, 0, x2)   # Testcase 60
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0xfffff7ffffffffff, 0x200000, 0x200000, 0xfffff7ffffffffff, x23, x1, 16, x2)   # Testcase 61
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0xfffffbffffffffff, 0x400000, 0x400000, 0xfffffbffffffffff, x24, x1, 32, x2)   # Testcase 62
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0xfffffdffffffffff, 0x800000, 0x800000, 0xfffffdffffffffff, x25, x1, 48, x2)   # Testcase 63
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0xfffffeffffffffff, 0x1000000, 0x1000000, 0xfffffeffffffffff, x26, x1, 64, x2)   # Testcase 64


    

    RVTEST_SIGBASE(x1,signature_14_0)

    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0xffffff7fffffffff, 0x2000000, 0x2000000, 0xffffff7fffffffff, x27, x1, 0, x2)   # Testcase 65
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0xffffffbfffffffff, 0x4000000, 0x4000000, 0xffffffbfffffffff, x28, x1, 16, x2)   # Testcase 66
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0xffffffdfffffffff, 0x8000000, 0x8000000, 0xffffffdfffffffff, x29, x1, 32, x2)   # Testcase 67
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0xffffffefffffffff, 0x10000000, 0x10000000, 0xffffffefffffffff, x30, x1, 48, x2)   # Testcase 68
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0xfffffff7ffffffff, 0x20000000, 0x20000000, 0xfffffff7ffffffff, x31, x1, 64, x2)   # Testcase 69


    

    RVTEST_SIGBASE(x5,signature_15_0)

    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0xfffffffbffffffff, 0x40000000, 0x40000000, 0xfffffffbffffffff, x1, x5, 0, x6)   # Testcase 70
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0xfffffffdffffffff, 0x80000000, 0x80000000, 0xfffffffdffffffff, x2, x5, 16, x6)   # Testcase 71
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0xfffffffeffffffff, 0x100000000, 0x100000000, 0xfffffffeffffffff, x3, x5, 32, x6)   # Testcase 72
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0xffffffff7fffffff, 0x200000000, 0x200000000, 0xffffffff7fffffff, x3, x5, 48, x6)   # Testcase 73
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0xffffffffbfffffff, 0x400000000, 0x400000000, 0xffffffffbfffffff, x4, x5, 64, x6)   # Testcase 74


    

    RVTEST_SIGBASE(x1,signature_16_0)

    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0xffffffffdfffffff, 0x800000000, 0x800000000, 0xffffffffdfffffff, x5, x1, 0, x2)   # Testcase 75
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0xffffffffefffffff, 0x1000000000, 0x1000000000, 0xffffffffefffffff, x6, x1, 16, x2)   # Testcase 76
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0xfffffffff7ffffff, 0x2000000000, 0x2000000000, 0xfffffffff7ffffff, x7, x1, 32, x2)   # Testcase 77
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0xfffffffffbffffff, 0x4000000000, 0x4000000000, 0xfffffffffbffffff, x8, x1, 48, x2)   # Testcase 78
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0xfffffffffdffffff, 0x8000000000, 0x8000000000, 0xfffffffffdffffff, x9, x1, 64, x2)   # Testcase 79


    

    RVTEST_SIGBASE(x1,signature_17_0)

    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0xfffffffffeffffff, 0x10000000000, 0x10000000000, 0xfffffffffeffffff, x10, x1, 0, x2)   # Testcase 80
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0xffffffffff7fffff, 0x20000000000, 0x20000000000, 0xffffffffff7fffff, x11, x1, 16, x2)   # Testcase 81
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0xffffffffffbfffff, 0x40000000000, 0x40000000000, 0xffffffffffbfffff, x12, x1, 32, x2)   # Testcase 82
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0xffffffffffdfffff, 0x80000000000, 0x80000000000, 0xffffffffffdfffff, x13, x1, 48, x2)   # Testcase 83
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0xffffffffffefffff, 0x100000000000, 0x100000000000, 0xffffffffffefffff, x14, x1, 64, x2)   # Testcase 84


    

    RVTEST_SIGBASE(x1,signature_18_0)

    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0xfffffffffff7ffff, 0x200000000000, 0x200000000000, 0xfffffffffff7ffff, x15, x1, 0, x2)   # Testcase 85
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0xfffffffffffbffff, 0x400000000000, 0x400000000000, 0xfffffffffffbffff, x16, x1, 16, x2)   # Testcase 86
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0xfffffffffffdffff, 0x800000000000, 0x800000000000, 0xfffffffffffdffff, x17, x1, 32, x2)   # Testcase 87
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0xfffffffffffeffff, 0x1000000000000, 0x1000000000000, 0xfffffffffffeffff, x18, x1, 48, x2)   # Testcase 88
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0xffffffffffff7fff, 0x2000000000000, 0x2000000000000, 0xffffffffffff7fff, x19, x1, 64, x2)   # Testcase 89


    

    RVTEST_SIGBASE(x1,signature_19_0)

    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0xffffffffffffbfff, 0x4000000000000, 0x4000000000000, 0xffffffffffffbfff, x20, x1, 0, x2)   # Testcase 90
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0xffffffffffffdfff, 0x8000000000000, 0x8000000000000, 0xffffffffffffdfff, x21, x1, 16, x2)   # Testcase 91
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0xffffffffffffefff, 0x10000000000000, 0x10000000000000, 0xffffffffffffefff, x22, x1, 32, x2)   # Testcase 92
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0xfffffffffffff7ff, 0x20000000000000, 0x20000000000000, 0xfffffffffffff7ff, x23, x1, 48, x2)   # Testcase 93
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0xfffffffffffffbff, 0x40000000000000, 0x40000000000000, 0xfffffffffffffbff, x24, x1, 64, x2)   # Testcase 94


    

    RVTEST_SIGBASE(x1,signature_20_0)

    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0xfffffffffffffdff, 0x80000000000000, 0x80000000000000, 0xfffffffffffffdff, x25, x1, 0, x2)   # Testcase 95
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0xfffffffffffffeff, 0x100000000000000, 0x100000000000000, 0xfffffffffffffeff, x26, x1, 16, x2)   # Testcase 96
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0xffffffffffffff7f, 0x200000000000000, 0x200000000000000, 0xffffffffffffff7f, x27, x1, 32, x2)   # Testcase 97
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0xffffffffffffffbf, 0x400000000000000, 0x400000000000000, 0xffffffffffffffbf, x28, x1, 48, x2)   # Testcase 98
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0xffffffffffffffdf, 0x800000000000000, 0x800000000000000, 0xffffffffffffffdf, x29, x1, 64, x2)   # Testcase 99


    

    RVTEST_SIGBASE(x4,signature_21_0)

    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0xffffffffffffffef, 0x1000000000000000, 0x1000000000000000, 0xffffffffffffffef, x30, x4, 0, x5)   # Testcase 100
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0xfffffffffffffff7, 0x2000000000000000, 0x2000000000000000, 0xfffffffffffffff7, x31, x4, 16, x5)   # Testcase 101
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0xfffffffffffffffb, 0x4000000000000000, 0x4000000000000000, 0xfffffffffffffffb, x1, x4, 32, x5)   # Testcase 102
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0xfffffffffffffffd, 0x8000000000000000, 0x8000000000000000, 0xfffffffffffffffd, x2, x4, 48, x5)   # Testcase 103
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0xfffffffffffffffe, 0xfffffffffffffffe, 0xfffffffffffffffe, 0xfffffffffffffffe, x3, x4, 64, x5)   # Testcase 104


    

    RVTEST_SIGBASE(x8,signature_22_0)

    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x8000000000000000, 0xfffffffffffffffd, 0xfffffffffffffffd, 0x8000000000000000, x3, x8, 0, x9)   # Testcase 105
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x4000000000000000, 0xfffffffffffffffb, 0xfffffffffffffffb, 0x4000000000000000, x4, x8, 16, x9)   # Testcase 106
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x2000000000000000, 0xfffffffffffffff7, 0xfffffffffffffff7, 0x2000000000000000, x5, x8, 32, x9)   # Testcase 107
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x1000000000000000, 0xffffffffffffffef, 0xffffffffffffffef, 0x1000000000000000, x6, x8, 48, x9)   # Testcase 108
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x800000000000000, 0xffffffffffffffdf, 0xffffffffffffffdf, 0x800000000000000, x7, x8, 64, x9)   # Testcase 109


    

    RVTEST_SIGBASE(x1,signature_23_0)

    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x400000000000000, 0xffffffffffffffbf, 0xffffffffffffffbf, 0x400000000000000, x8, x1, 0, x2)   # Testcase 110
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x200000000000000, 0xffffffffffffff7f, 0xffffffffffffff7f, 0x200000000000000, x9, x1, 16, x2)   # Testcase 111
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x100000000000000, 0xfffffffffffffeff, 0xfffffffffffffeff, 0x100000000000000, x10, x1, 32, x2)   # Testcase 112
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x80000000000000, 0xfffffffffffffdff, 0xfffffffffffffdff, 0x80000000000000, x11, x1, 48, x2)   # Testcase 113
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x40000000000000, 0xfffffffffffffbff, 0xfffffffffffffbff, 0x40000000000000, x12, x1, 64, x2)   # Testcase 114


    

    RVTEST_SIGBASE(x1,signature_24_0)

    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x20000000000000, 0xfffffffffffff7ff, 0xfffffffffffff7ff, 0x20000000000000, x13, x1, 0, x2)   # Testcase 115
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x10000000000000, 0xffffffffffffefff, 0xffffffffffffefff, 0x10000000000000, x14, x1, 16, x2)   # Testcase 116
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x8000000000000, 0xffffffffffffdfff, 0xffffffffffffdfff, 0x8000000000000, x15, x1, 32, x2)   # Testcase 117
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x4000000000000, 0xffffffffffffbfff, 0xffffffffffffbfff, 0x4000000000000, x16, x1, 48, x2)   # Testcase 118
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x2000000000000, 0xffffffffffff7fff, 0xffffffffffff7fff, 0x2000000000000, x17, x1, 64, x2)   # Testcase 119


    

    RVTEST_SIGBASE(x1,signature_25_0)

    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x1000000000000, 0xfffffffffffeffff, 0xfffffffffffeffff, 0x1000000000000, x18, x1, 0, x2)   # Testcase 120
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x800000000000, 0xfffffffffffdffff, 0xfffffffffffdffff, 0x800000000000, x19, x1, 16, x2)   # Testcase 121
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x400000000000, 0xfffffffffffbffff, 0xfffffffffffbffff, 0x400000000000, x20, x1, 32, x2)   # Testcase 122
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x200000000000, 0xfffffffffff7ffff, 0xfffffffffff7ffff, 0x200000000000, x21, x1, 48, x2)   # Testcase 123
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x100000000000, 0xffffffffffefffff, 0xffffffffffefffff, 0x100000000000, x22, x1, 64, x2)   # Testcase 124


    

    RVTEST_SIGBASE(x1,signature_26_0)

    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x80000000000, 0xffffffffffdfffff, 0xffffffffffdfffff, 0x80000000000, x23, x1, 0, x2)   # Testcase 125
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x40000000000, 0xffffffffffbfffff, 0xffffffffffbfffff, 0x40000000000, x24, x1, 16, x2)   # Testcase 126
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x20000000000, 0xffffffffff7fffff, 0xffffffffff7fffff, 0x20000000000, x25, x1, 32, x2)   # Testcase 127
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x10000000000, 0xfffffffffeffffff, 0xfffffffffeffffff, 0x10000000000, x26, x1, 48, x2)   # Testcase 128
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x8000000000, 0xfffffffffdffffff, 0xfffffffffdffffff, 0x8000000000, x27, x1, 64, x2)   # Testcase 129


    

    RVTEST_SIGBASE(x2,signature_27_0)

    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x4000000000, 0xfffffffffbffffff, 0xfffffffffbffffff, 0x4000000000, x28, x2, 0, x3)   # Testcase 130
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x2000000000, 0xfffffffff7ffffff, 0xfffffffff7ffffff, 0x2000000000, x29, x2, 16, x3)   # Testcase 131
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x1000000000, 0xffffffffefffffff, 0xffffffffefffffff, 0x1000000000, x30, x2, 32, x3)   # Testcase 132
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x800000000, 0xffffffffdfffffff, 0xffffffffdfffffff, 0x800000000, x31, x2, 48, x3)   # Testcase 133
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x400000000, 0xffffffffbfffffff, 0xffffffffbfffffff, 0x400000000, x1, x2, 64, x3)   # Testcase 134


    

    RVTEST_SIGBASE(x6,signature_28_0)

    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x200000000, 0xffffffff7fffffff, 0xffffffff7fffffff, 0x200000000, x2, x6, 0, x7)   # Testcase 135
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x100000000, 0xfffffffeffffffff, 0xfffffffeffffffff, 0x100000000, x3, x6, 16, x7)   # Testcase 136
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x80000000, 0xfffffffdffffffff, 0xfffffffdffffffff, 0x80000000, x3, x6, 32, x7)   # Testcase 137
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x40000000, 0xfffffffbffffffff, 0xfffffffbffffffff, 0x40000000, x4, x6, 48, x7)   # Testcase 138
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x20000000, 0xfffffff7ffffffff, 0xfffffff7ffffffff, 0x20000000, x5, x6, 64, x7)   # Testcase 139


    

    RVTEST_SIGBASE(x1,signature_29_0)

    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x10000000, 0xffffffefffffffff, 0xffffffefffffffff, 0x10000000, x6, x1, 0, x2)   # Testcase 140
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x8000000, 0xffffffdfffffffff, 0xffffffdfffffffff, 0x8000000, x7, x1, 16, x2)   # Testcase 141
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x4000000, 0xffffffbfffffffff, 0xffffffbfffffffff, 0x4000000, x8, x1, 32, x2)   # Testcase 142
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x2000000, 0xffffff7fffffffff, 0xffffff7fffffffff, 0x2000000, x9, x1, 48, x2)   # Testcase 143
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x1000000, 0xfffffeffffffffff, 0xfffffeffffffffff, 0x1000000, x10, x1, 64, x2)   # Testcase 144


    

    RVTEST_SIGBASE(x1,signature_30_0)

    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x800000, 0xfffffdffffffffff, 0xfffffdffffffffff, 0x800000, x11, x1, 0, x2)   # Testcase 145
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x400000, 0xfffffbffffffffff, 0xfffffbffffffffff, 0x400000, x12, x1, 16, x2)   # Testcase 146
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x200000, 0xfffff7ffffffffff, 0xfffff7ffffffffff, 0x200000, x13, x1, 32, x2)   # Testcase 147
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x100000, 0xffffefffffffffff, 0xffffefffffffffff, 0x100000, x14, x1, 48, x2)   # Testcase 148
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x80000, 0xffffdfffffffffff, 0xffffdfffffffffff, 0x80000, x15, x1, 64, x2)   # Testcase 149


    

    RVTEST_SIGBASE(x1,signature_31_0)

    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x40000, 0xffffbfffffffffff, 0xffffbfffffffffff, 0x40000, x16, x1, 0, x2)   # Testcase 150
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x20000, 0xffff7fffffffffff, 0xffff7fffffffffff, 0x20000, x17, x1, 16, x2)   # Testcase 151
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x10000, 0xfffeffffffffffff, 0xfffeffffffffffff, 0x10000, x18, x1, 32, x2)   # Testcase 152
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x8000, 0xfffdffffffffffff, 0xfffdffffffffffff, 0x8000, x19, x1, 48, x2)   # Testcase 153
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x4000, 0xfffbffffffffffff, 0xfffbffffffffffff, 0x4000, x20, x1, 64, x2)   # Testcase 154


    

    RVTEST_SIGBASE(x1,signature_32_0)

    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x2000, 0xfff7ffffffffffff, 0xfff7ffffffffffff, 0x2000, x21, x1, 0, x2)   # Testcase 155
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x1000, 0xffefffffffffffff, 0xffefffffffffffff, 0x1000, x22, x1, 16, x2)   # Testcase 156
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x800, 0xffdfffffffffffff, 0xffdfffffffffffff, 0x800, x23, x1, 32, x2)   # Testcase 157
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x400, 0xffbfffffffffffff, 0xffbfffffffffffff, 0x400, x24, x1, 48, x2)   # Testcase 158
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x200, 0xff7fffffffffffff, 0xff7fffffffffffff, 0x200, x25, x1, 64, x2)   # Testcase 159


    

    RVTEST_SIGBASE(x1,signature_33_0)

    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x100, 0xfeffffffffffffff, 0xfeffffffffffffff, 0x100, x26, x1, 0, x2)   # Testcase 160
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x80, 0xfdffffffffffffff, 0xfdffffffffffffff, 0x80, x27, x1, 16, x2)   # Testcase 161
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x40, 0xfbffffffffffffff, 0xfbffffffffffffff, 0x40, x28, x1, 32, x2)   # Testcase 162
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x20, 0xf7ffffffffffffff, 0xf7ffffffffffffff, 0x20, x29, x1, 48, x2)   # Testcase 163
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x10, 0xefffffffffffffff, 0xefffffffffffffff, 0x10, x30, x1, 64, x2)   # Testcase 164


    

    RVTEST_SIGBASE(x4,signature_34_0)

    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x8, 0xdfffffffffffffff, 0xdfffffffffffffff, 0x8, x31, x4, 0, x5)   # Testcase 165
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x4, 0xbfffffffffffffff, 0xbfffffffffffffff, 0x4, x1, x4, 16, x5)   # Testcase 166
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x2, 0x7fffffffffffffff, 0x7fffffffffffffff, 0x2, x2, x4, 32, x5)   # Testcase 167
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0x1, 0x1, 0x0, x3, x4, 48, x5)   # Testcase 168
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0x2, 0x2, 0x0, x3, x4, 64, x5)   # Testcase 169


    

    RVTEST_SIGBASE(x1,signature_35_0)

    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x0, 0x4, 0x4, 0x0, x4, x1, 0, x9)   # Testcase 170
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x0, 0x8, 0x8, 0x0, x5, x1, 16, x9)   # Testcase 171
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x0, 0x10, 0x10, 0x0, x6, x1, 32, x9)   # Testcase 172
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x0, 0x20, 0x20, 0x0, x7, x1, 48, x9)   # Testcase 173
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x0, 0x40, 0x40, 0x0, x8, x1, 64, x9)   # Testcase 174


    

    RVTEST_SIGBASE(x1,signature_36_0)

    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x0, 0x80, 0x80, 0x0, x9, x1, 0, x2)   # Testcase 175
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x0, 0x100, 0x100, 0x0, x10, x1, 16, x2)   # Testcase 176
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x0, 0x200, 0x200, 0x0, x11, x1, 32, x2)   # Testcase 177
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x0, 0x400, 0x400, 0x0, x12, x1, 48, x2)   # Testcase 178
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x0, 0x800, 0x800, 0x0, x13, x1, 64, x2)   # Testcase 179


    

    RVTEST_SIGBASE(x1,signature_37_0)

    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x0, 0x1000, 0x1000, 0x0, x14, x1, 0, x2)   # Testcase 180
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x0, 0x2000, 0x2000, 0x0, x15, x1, 16, x2)   # Testcase 181
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x0, 0x4000, 0x4000, 0x0, x16, x1, 32, x2)   # Testcase 182
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x0, 0x8000, 0x8000, 0x0, x17, x1, 48, x2)   # Testcase 183
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x0, 0x10000, 0x10000, 0x0, x18, x1, 64, x2)   # Testcase 184


    

    RVTEST_SIGBASE(x1,signature_38_0)

    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x0, 0x20000, 0x20000, 0x0, x19, x1, 0, x2)   # Testcase 185
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x0, 0x40000, 0x40000, 0x0, x20, x1, 16, x2)   # Testcase 186
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x0, 0x80000, 0x80000, 0x0, x21, x1, 32, x2)   # Testcase 187
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x0, 0x100000, 0x100000, 0x0, x22, x1, 48, x2)   # Testcase 188
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x0, 0x200000, 0x200000, 0x0, x23, x1, 64, x2)   # Testcase 189


    

    RVTEST_SIGBASE(x1,signature_39_0)

    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x0, 0x400000, 0x400000, 0x0, x24, x1, 0, x2)   # Testcase 190
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x0, 0x800000, 0x800000, 0x0, x25, x1, 16, x2)   # Testcase 191
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x0, 0x1000000, 0x1000000, 0x0, x26, x1, 32, x2)   # Testcase 192
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x0, 0x2000000, 0x2000000, 0x0, x27, x1, 48, x2)   # Testcase 193
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x0, 0x4000000, 0x4000000, 0x0, x28, x1, 64, x2)   # Testcase 194


    

    RVTEST_SIGBASE(x3,signature_40_0)

    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x0, 0x8000000, 0x8000000, 0x0, x29, x3, 0, x4)   # Testcase 195
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x0, 0x10000000, 0x10000000, 0x0, x30, x3, 16, x4)   # Testcase 196
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x0, 0x20000000, 0x20000000, 0x0, x31, x3, 32, x4)   # Testcase 197
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x0, 0x40000000, 0x40000000, 0x0, x1, x3, 48, x4)   # Testcase 198
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x0, 0x80000000, 0x80000000, 0x0, x2, x3, 64, x4)   # Testcase 199


    

    RVTEST_SIGBASE(x7,signature_41_0)

    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0x100000000, 0x100000000, 0x0, x3, x7, 0, x8)   # Testcase 200
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0x200000000, 0x200000000, 0x0, x3, x7, 16, x8)   # Testcase 201
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x0, 0x400000000, 0x400000000, 0x0, x4, x7, 32, x8)   # Testcase 202
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x0, 0x800000000, 0x800000000, 0x0, x5, x7, 48, x8)   # Testcase 203
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x0, 0x1000000000, 0x1000000000, 0x0, x6, x7, 64, x8)   # Testcase 204


    

    RVTEST_SIGBASE(x1,signature_42_0)

    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x0, 0x2000000000, 0x2000000000, 0x0, x7, x1, 0, x2)   # Testcase 205
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x0, 0x4000000000, 0x4000000000, 0x0, x8, x1, 16, x2)   # Testcase 206
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x0, 0x8000000000, 0x8000000000, 0x0, x9, x1, 32, x2)   # Testcase 207
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x0, 0x10000000000, 0x10000000000, 0x0, x10, x1, 48, x2)   # Testcase 208
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x0, 0x20000000000, 0x20000000000, 0x0, x11, x1, 64, x2)   # Testcase 209


    

    RVTEST_SIGBASE(x1,signature_43_0)

    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x0, 0x40000000000, 0x40000000000, 0x0, x12, x1, 0, x2)   # Testcase 210
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x0, 0x80000000000, 0x80000000000, 0x0, x13, x1, 16, x2)   # Testcase 211
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x0, 0x100000000000, 0x100000000000, 0x0, x14, x1, 32, x2)   # Testcase 212
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x0, 0x200000000000, 0x200000000000, 0x0, x15, x1, 48, x2)   # Testcase 213
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x0, 0x400000000000, 0x400000000000, 0x0, x16, x1, 64, x2)   # Testcase 214


    

    RVTEST_SIGBASE(x1,signature_44_0)

    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x0, 0x800000000000, 0x800000000000, 0x0, x17, x1, 0, x2)   # Testcase 215
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x0, 0x1000000000000, 0x1000000000000, 0x0, x18, x1, 16, x2)   # Testcase 216
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x0, 0x2000000000000, 0x2000000000000, 0x0, x19, x1, 32, x2)   # Testcase 217
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x0, 0x4000000000000, 0x4000000000000, 0x0, x20, x1, 48, x2)   # Testcase 218
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x0, 0x8000000000000, 0x8000000000000, 0x0, x21, x1, 64, x2)   # Testcase 219


    

    RVTEST_SIGBASE(x1,signature_45_0)

    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x0, 0x10000000000000, 0x10000000000000, 0x0, x22, x1, 0, x2)   # Testcase 220
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x0, 0x20000000000000, 0x20000000000000, 0x0, x23, x1, 16, x2)   # Testcase 221
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x0, 0x40000000000000, 0x40000000000000, 0x0, x24, x1, 32, x2)   # Testcase 222
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x0, 0x80000000000000, 0x80000000000000, 0x0, x25, x1, 48, x2)   # Testcase 223
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x0, 0x100000000000000, 0x100000000000000, 0x0, x26, x1, 64, x2)   # Testcase 224


    

    RVTEST_SIGBASE(x1,signature_46_0)

    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x0, 0x200000000000000, 0x200000000000000, 0x0, x27, x1, 0, x2)   # Testcase 225
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x0, 0x400000000000000, 0x400000000000000, 0x0, x28, x1, 16, x2)   # Testcase 226
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x0, 0x800000000000000, 0x800000000000000, 0x0, x29, x1, 32, x2)   # Testcase 227
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x0, 0x1000000000000000, 0x1000000000000000, 0x0, x30, x1, 48, x2)   # Testcase 228
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x0, 0x2000000000000000, 0x2000000000000000, 0x0, x31, x1, 64, x2)   # Testcase 229


    

    RVTEST_SIGBASE(x5,signature_47_0)

    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x0, 0x4000000000000000, 0x4000000000000000, 0x0, x1, x5, 0, x6)   # Testcase 230
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x0, 0x8000000000000000, 0x8000000000000000, 0x0, x2, x5, 16, x6)   # Testcase 231
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0xfffffffffffffffe, 0xfffffffffffffffe, 0x0, x3, x5, 32, x6)   # Testcase 232
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0xfffffffffffffffd, 0xfffffffffffffffd, 0x0, x3, x5, 48, x6)   # Testcase 233
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x0, 0xfffffffffffffffb, 0xfffffffffffffffb, 0x0, x4, x5, 64, x6)   # Testcase 234


    

    RVTEST_SIGBASE(x1,signature_48_0)

    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x0, 0xfffffffffffffff7, 0xfffffffffffffff7, 0x0, x5, x1, 0, x2)   # Testcase 235
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x0, 0xffffffffffffffef, 0xffffffffffffffef, 0x0, x6, x1, 16, x2)   # Testcase 236
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x0, 0xffffffffffffffdf, 0xffffffffffffffdf, 0x0, x7, x1, 32, x2)   # Testcase 237
    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x0, 0xffffffffffffffbf, 0xffffffffffffffbf, 0x0, x8, x1, 48, x2)   # Testcase 238
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x0, 0xffffffffffffff7f, 0xffffffffffffff7f, 0x0, x9, x1, 64, x2)   # Testcase 239


    

    RVTEST_SIGBASE(x1,signature_49_0)

    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x0, 0xfffffffffffffeff, 0xfffffffffffffeff, 0x0, x10, x1, 0, x2)   # Testcase 240
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x0, 0xfffffffffffffdff, 0xfffffffffffffdff, 0x0, x11, x1, 16, x2)   # Testcase 241
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x0, 0xfffffffffffffbff, 0xfffffffffffffbff, 0x0, x12, x1, 32, x2)   # Testcase 242
    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x0, 0xfffffffffffff7ff, 0xfffffffffffff7ff, 0x0, x13, x1, 48, x2)   # Testcase 243
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x0, 0xffffffffffffefff, 0xffffffffffffefff, 0x0, x14, x1, 64, x2)   # Testcase 244


    

    RVTEST_SIGBASE(x1,signature_50_0)

    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x0, 0xffffffffffffdfff, 0xffffffffffffdfff, 0x0, x15, x1, 0, x2)   # Testcase 245
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x0, 0xffffffffffffbfff, 0xffffffffffffbfff, 0x0, x16, x1, 16, x2)   # Testcase 246
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x0, 0xffffffffffff7fff, 0xffffffffffff7fff, 0x0, x17, x1, 32, x2)   # Testcase 247
    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x0, 0xfffffffffffeffff, 0xfffffffffffeffff, 0x0, x18, x1, 48, x2)   # Testcase 248
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x0, 0xfffffffffffdffff, 0xfffffffffffdffff, 0x0, x19, x1, 64, x2)   # Testcase 249


    

    RVTEST_SIGBASE(x1,signature_51_0)

    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x0, 0xfffffffffffbffff, 0xfffffffffffbffff, 0x0, x20, x1, 0, x2)   # Testcase 250
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x0, 0xfffffffffff7ffff, 0xfffffffffff7ffff, 0x0, x21, x1, 16, x2)   # Testcase 251
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x0, 0xffffffffffefffff, 0xffffffffffefffff, 0x0, x22, x1, 32, x2)   # Testcase 252
    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x0, 0xffffffffffdfffff, 0xffffffffffdfffff, 0x0, x23, x1, 48, x2)   # Testcase 253
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x0, 0xffffffffffbfffff, 0xffffffffffbfffff, 0x0, x24, x1, 64, x2)   # Testcase 254


    

    RVTEST_SIGBASE(x1,signature_52_0)

    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x0, 0xffffffffff7fffff, 0xffffffffff7fffff, 0x0, x25, x1, 0, x2)   # Testcase 255
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x0, 0xfffffffffeffffff, 0xfffffffffeffffff, 0x0, x26, x1, 16, x2)   # Testcase 256
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x0, 0xfffffffffdffffff, 0xfffffffffdffffff, 0x0, x27, x1, 32, x2)   # Testcase 257
    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x0, 0xfffffffffbffffff, 0xfffffffffbffffff, 0x0, x28, x1, 48, x2)   # Testcase 258
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x0, 0xfffffffff7ffffff, 0xfffffffff7ffffff, 0x0, x29, x1, 64, x2)   # Testcase 259


    

    RVTEST_SIGBASE(x4,signature_53_0)

    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x0, 0xffffffffefffffff, 0xffffffffefffffff, 0x0, x30, x4, 0, x5)   # Testcase 260
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x0, 0xffffffffdfffffff, 0xffffffffdfffffff, 0x0, x31, x4, 16, x5)   # Testcase 261
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x0, 0xffffffffbfffffff, 0xffffffffbfffffff, 0x0, x1, x4, 32, x5)   # Testcase 262
    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x0, 0xffffffff7fffffff, 0xffffffff7fffffff, 0x0, x2, x4, 48, x5)   # Testcase 263
    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0xfffffffeffffffff, 0xfffffffeffffffff, 0x0, x3, x4, 64, x5)   # Testcase 264


    

    RVTEST_SIGBASE(x8,signature_54_0)

    TEST_CSR_OP(csrrw, x1, x2, mscratch, 0x0, 0xfffffffdffffffff, 0xfffffffdffffffff, 0x0, x3, x8, 0, x9)   # Testcase 265
    TEST_CSR_OP(csrrw, x2, x3, mscratch, 0x0, 0xfffffffbffffffff, 0xfffffffbffffffff, 0x0, x4, x8, 16, x9)   # Testcase 266
    TEST_CSR_OP(csrrw, x3, x4, mscratch, 0x0, 0xfffffff7ffffffff, 0xfffffff7ffffffff, 0x0, x5, x8, 32, x9)   # Testcase 267
    TEST_CSR_OP(csrrw, x4, x5, mscratch, 0x0, 0xffffffefffffffff, 0xffffffefffffffff, 0x0, x6, x8, 48, x9)   # Testcase 268
    TEST_CSR_OP(csrrw, x5, x6, mscratch, 0x0, 0xffffffdfffffffff, 0xffffffdfffffffff, 0x0, x7, x8, 64, x9)   # Testcase 269


    

    RVTEST_SIGBASE(x1,signature_55_0)

    TEST_CSR_OP(csrrw, x6, x7, mscratch, 0x0, 0xffffffbfffffffff, 0xffffffbfffffffff, 0x0, x8, x1, 0, x2)   # Testcase 270
    TEST_CSR_OP(csrrw, x7, x8, mscratch, 0x0, 0xffffff7fffffffff, 0xffffff7fffffffff, 0x0, x9, x1, 16, x2)   # Testcase 271
    TEST_CSR_OP(csrrw, x8, x9, mscratch, 0x0, 0xfffffeffffffffff, 0xfffffeffffffffff, 0x0, x10, x1, 32, x2)   # Testcase 272
    TEST_CSR_OP(csrrw, x9, x10, mscratch, 0x0, 0xfffffdffffffffff, 0xfffffdffffffffff, 0x0, x11, x1, 48, x2)   # Testcase 273
    TEST_CSR_OP(csrrw, x10, x11, mscratch, 0x0, 0xfffffbffffffffff, 0xfffffbffffffffff, 0x0, x12, x1, 64, x2)   # Testcase 274


    

    RVTEST_SIGBASE(x1,signature_56_0)

    TEST_CSR_OP(csrrw, x11, x12, mscratch, 0x0, 0xfffff7ffffffffff, 0xfffff7ffffffffff, 0x0, x13, x1, 0, x2)   # Testcase 275
    TEST_CSR_OP(csrrw, x12, x13, mscratch, 0x0, 0xffffefffffffffff, 0xffffefffffffffff, 0x0, x14, x1, 16, x2)   # Testcase 276
    TEST_CSR_OP(csrrw, x13, x14, mscratch, 0x0, 0xffffdfffffffffff, 0xffffdfffffffffff, 0x0, x15, x1, 32, x2)   # Testcase 277
    TEST_CSR_OP(csrrw, x14, x15, mscratch, 0x0, 0xffffbfffffffffff, 0xffffbfffffffffff, 0x0, x16, x1, 48, x2)   # Testcase 278
    TEST_CSR_OP(csrrw, x15, x16, mscratch, 0x0, 0xffff7fffffffffff, 0xffff7fffffffffff, 0x0, x17, x1, 64, x2)   # Testcase 279


    

    RVTEST_SIGBASE(x1,signature_57_0)

    TEST_CSR_OP(csrrw, x16, x17, mscratch, 0x0, 0xfffeffffffffffff, 0xfffeffffffffffff, 0x0, x18, x1, 0, x2)   # Testcase 280
    TEST_CSR_OP(csrrw, x17, x18, mscratch, 0x0, 0xfffdffffffffffff, 0xfffdffffffffffff, 0x0, x19, x1, 16, x2)   # Testcase 281
    TEST_CSR_OP(csrrw, x18, x19, mscratch, 0x0, 0xfffbffffffffffff, 0xfffbffffffffffff, 0x0, x20, x1, 32, x2)   # Testcase 282
    TEST_CSR_OP(csrrw, x19, x20, mscratch, 0x0, 0xfff7ffffffffffff, 0xfff7ffffffffffff, 0x0, x21, x1, 48, x2)   # Testcase 283
    TEST_CSR_OP(csrrw, x20, x21, mscratch, 0x0, 0xffefffffffffffff, 0xffefffffffffffff, 0x0, x22, x1, 64, x2)   # Testcase 284


    

    RVTEST_SIGBASE(x1,signature_58_0)

    TEST_CSR_OP(csrrw, x21, x22, mscratch, 0x0, 0xffdfffffffffffff, 0xffdfffffffffffff, 0x0, x23, x1, 0, x2)   # Testcase 285
    TEST_CSR_OP(csrrw, x22, x23, mscratch, 0x0, 0xffbfffffffffffff, 0xffbfffffffffffff, 0x0, x24, x1, 16, x2)   # Testcase 286
    TEST_CSR_OP(csrrw, x23, x24, mscratch, 0x0, 0xff7fffffffffffff, 0xff7fffffffffffff, 0x0, x25, x1, 32, x2)   # Testcase 287
    TEST_CSR_OP(csrrw, x24, x25, mscratch, 0x0, 0xfeffffffffffffff, 0xfeffffffffffffff, 0x0, x26, x1, 48, x2)   # Testcase 288
    TEST_CSR_OP(csrrw, x25, x26, mscratch, 0x0, 0xfdffffffffffffff, 0xfdffffffffffffff, 0x0, x27, x1, 64, x2)   # Testcase 289


    

    RVTEST_SIGBASE(x2,signature_59_0)

    TEST_CSR_OP(csrrw, x26, x27, mscratch, 0x0, 0xfbffffffffffffff, 0xfbffffffffffffff, 0x0, x28, x2, 0, x3)   # Testcase 290
    TEST_CSR_OP(csrrw, x27, x28, mscratch, 0x0, 0xf7ffffffffffffff, 0xf7ffffffffffffff, 0x0, x29, x2, 16, x3)   # Testcase 291
    TEST_CSR_OP(csrrw, x28, x29, mscratch, 0x0, 0xefffffffffffffff, 0xefffffffffffffff, 0x0, x30, x2, 32, x3)   # Testcase 292
    TEST_CSR_OP(csrrw, x29, x30, mscratch, 0x0, 0xdfffffffffffffff, 0xdfffffffffffffff, 0x0, x31, x2, 48, x3)   # Testcase 293
    TEST_CSR_OP(csrrw, x30, x31, mscratch, 0x0, 0xbfffffffffffffff, 0xbfffffffffffffff, 0x0, x1, x2, 64, x3)   # Testcase 294


    

    RVTEST_SIGBASE(x3,signature_60_0)

    TEST_CSR_OP(csrrw, x31, x1, mscratch, 0x0, 0x7fffffffffffffff, 0x7fffffffffffffff, 0x0, x2, x3, 0, x4)   # Testcase 295
    TEST_CSR_OP(csrrw, x11, x10, mscratch, 0x32170fe5099a4f8e, 0x32170fe5099a4f8e, 0x7d534f96f1444f34, 0x32170fe5099a4f8e, x10, x3, 16, x4)   # Testcase 296
    TEST_CSR_OP(csrrw, x0, x7, mscratch, 0x0, 0x75dd10cf68ce0f63, 0x75dd10cf68ce0f63, 0xa24a46cb3277cf6a, x14, x3, 32, x4)   # Testcase 297
    TEST_CSR_OP(csrrw, x7, x0, mscratch, 0x793d8d85dce388e8, 0x0, 0x7bf168c97a8b59c1, 0x793d8d85dce388e8, x14, x3, 48, x4)   # Testcase 298
	
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

