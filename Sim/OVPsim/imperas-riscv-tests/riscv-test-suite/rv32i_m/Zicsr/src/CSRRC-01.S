// RISC-V Architectural Validation Test CSRRC-01
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
// Description: Testing instruction 'CSRRC'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32I")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zicsr.*);def TEST_CASE_1=True;",csrrc)

    RVTEST_SIGBASE(x1,signature_1_0)

    TEST_CSR_OP(csrrc, x19, x28, mscratch, 0xf4bcf4a7, 0xa0085004, 0x54f4aeeb, 0xf4bcf4a7, x31, x1, 0, x6)   # Testcase 0
    TEST_CSR_OP(csrrc, x20, x10, mscratch, 0xe3977ec1, 0x2066640, 0xe1b1199b, 0xe3977ec1, x2, x1, 8, x6)   # Testcase 1
    TEST_CSR_OP(csrrc, x3, x31, mscratch, 0x80bd3ffe, 0x98195e, 0xb26566a0, 0x80bd3ffe, x30, x1, 16, x6)   # Testcase 2
    TEST_CSR_OP(csrrc, x5, x0, mscratch, 0xc3e260bd, 0xc3e260bd, 0xf27008e6, 0xc3e260bd, x14, x1, 24, x6)   # Testcase 3
    TEST_CSR_OP(csrrc, x4, x11, mscratch, 0x2f7b22b7, 0x237b2214, 0xc8484a3, 0x2f7b22b7, x26, x1, 32, x6)   # Testcase 4


    

    RVTEST_SIGBASE(x3,signature_2_0)

    TEST_CSR_OP(csrrc, x2, x18, mscratch, 0xbf042c8c, 0x18042c80, 0xa783d03f, 0xbf042c8c, x19, x3, 0, x4)   # Testcase 5
    TEST_CSR_OP(csrrc, x7, x9, mscratch, 0x807fe203, 0x46203, 0xfd7b9df8, 0x807fe203, x1, x3, 8, x4)   # Testcase 6
    TEST_CSR_OP(csrrc, x17, x23, mscratch, 0xa14cf866, 0xa1045862, 0xafaa29d, 0xa14cf866, x1, x3, 16, x4)   # Testcase 7
    TEST_CSR_OP(csrrc, x21, x0, mscratch, 0xe2fe6443, 0xe2fe6443, 0x413f2c62, 0xe2fe6443, x31, x3, 24, x4)   # Testcase 8
    TEST_CSR_OP(csrrc, x0, x17, mscratch, 0x0, 0x50001065, 0x2c370a9a, 0x701512f5, x1, x3, 32, x4)   # Testcase 9


    

    RVTEST_SIGBASE(x3,signature_3_0)

    TEST_CSR_OP(csrrc, x6, x11, mscratch, 0x2a81b798, 0x2011708, 0x2882a0b3, 0x2a81b798, x23, x3, 0, x5)   # Testcase 10
    TEST_CSR_OP(csrrc, x9, x2, mscratch, 0xc68101ee, 0x46000128, 0x91dd5ad6, 0xc68101ee, x8, x3, 8, x5)   # Testcase 11
    TEST_CSR_OP(csrrc, x13, x7, mscratch, 0x589f2ccd, 0x180e28c4, 0x42f1d629, 0x589f2ccd, x4, x3, 16, x5)   # Testcase 12
    TEST_CSR_OP(csrrc, x13, x24, mscratch, 0x14cf50e, 0x42000, 0xcddbdf6f, 0x14cf50e, x4, x3, 24, x5)   # Testcase 13
    TEST_CSR_OP(csrrc, x17, x14, mscratch, 0xc9e2ce4f, 0x80c08407, 0x4d236af8, 0xc9e2ce4f, x1, x3, 32, x5)   # Testcase 14


    

    RVTEST_SIGBASE(x2,signature_4_0)

    TEST_CSR_OP(csrrc, x20, x18, mscratch, 0x242b9878, 0x24000018, 0x983b9f63, 0x242b9878, x5, x2, 0, x6)   # Testcase 15
    TEST_CSR_OP(csrrc, x29, x30, mscratch, 0x28aadb5b, 0x2000c359, 0x1fbe3ca6, 0x28aadb5b, x18, x2, 8, x6)   # Testcase 16
    TEST_CSR_OP(csrrc, x1, x22, mscratch, 0xdf0fdcd2, 0xca055840, 0x353a8593, 0xdf0fdcd2, x4, x2, 16, x6)   # Testcase 17
    TEST_CSR_OP(csrrc, x3, x19, mscratch, 0xc357b925, 0x81513125, 0x66268a1a, 0xc357b925, x16, x2, 24, x6)   # Testcase 18
    TEST_CSR_OP(csrrc, x13, x28, mscratch, 0xba4194f8, 0x92418058, 0x28ac54a3, 0xba4194f8, x7, x2, 32, x6)   # Testcase 19


    

    RVTEST_SIGBASE(x2,signature_5_0)

    TEST_CSR_OP(csrrc, x14, x6, mscratch, 0xc2e008f5, 0x2c00855, 0xdc3713a2, 0xc2e008f5, x10, x2, 0, x3)   # Testcase 20
    TEST_CSR_OP(csrrc, x17, x10, mscratch, 0x2ed729e0, 0xa902860, 0x74674399, 0x2ed729e0, x15, x2, 8, x3)   # Testcase 21
    TEST_CSR_OP(csrrc, x6, x22, mscratch, 0x5b57716e, 0x1002614e, 0x6bdd9821, 0x5b57716e, x1, x2, 16, x3)   # Testcase 22
    TEST_CSR_OP(csrrc, x0, x19, mscratch, 0x0, 0x78212210, 0x825648e4, 0x78636af4, x29, x2, 24, x3)   # Testcase 23
    TEST_CSR_OP(csrrc, x19, x31, mscratch, 0xf4cc30bc, 0x840810a0, 0x7bf4ef1c, 0xf4cc30bc, x28, x2, 32, x3)   # Testcase 24


    

    RVTEST_SIGBASE(x1,signature_6_0)

    TEST_CSR_OP(csrrc, x21, x23, mscratch, 0x35a0ec80, 0x30a04800, 0xf49a4b2, 0x35a0ec80, x17, x1, 0, x2)   # Testcase 25
    TEST_CSR_OP(csrrc, x24, x28, mscratch, 0xcb0947ed, 0x1004540, 0xfe9b8abf, 0xcb0947ed, x8, x1, 8, x2)   # Testcase 26
    TEST_CSR_OP(csrrc, x26, x16, mscratch, 0x8cc7e790, 0x88814310, 0x347ebc89, 0x8cc7e790, x6, x1, 16, x2)   # Testcase 27
    TEST_CSR_OP(csrrc, x13, x5, mscratch, 0xa5c8d860, 0xc08840, 0xf52a52bf, 0xa5c8d860, x4, x1, 24, x2)   # Testcase 28
    TEST_CSR_OP(csrrc, x5, x8, mscratch, 0xf4a64999, 0x34024191, 0xcaa4b80e, 0xf4a64999, x28, x1, 32, x2)   # Testcase 29


    

    RVTEST_SIGBASE(x1,signature_7_0)

    TEST_CSR_OP(csrrc, x0, x2, mscratch, 0x0, 0x0, 0xffffffff, 0x0, x8, x1, 0, x4)   # Testcase 30
    TEST_CSR_OP(csrrc, x28, x3, mscratch, 0xffffffff, 0x7fffffff, 0x80000000, 0xffffffff, x31, x1, 8, x4)   # Testcase 31
    TEST_CSR_OP(csrrc, x24, x17, mscratch, 0xffffffff, 0x0, 0xffffffff, 0xffffffff, x29, x1, 16, x4)   # Testcase 32
    TEST_CSR_OP(csrrc, x14, x21, mscratch, 0x7fffffff, 0x7fffffff, 0x0, 0x7fffffff, x23, x1, 24, x4)   # Testcase 33
    TEST_CSR_OP(csrrc, x0, x12, mscratch, 0x0, 0x0, 0xffffffff, 0x0, x6, x1, 32, x4)   # Testcase 34


    

    RVTEST_SIGBASE(x1,signature_8_0)

    TEST_CSR_OP(csrrc, x29, x0, mscratch, 0xffffffff, 0xffffffff, 0x80000000, 0xffffffff, x31, x1, 0, x2)   # Testcase 35
    TEST_CSR_OP(csrrc, x0, x11, mscratch, 0x0, 0x0, 0xffffffff, 0xffffffff, x18, x1, 8, x2)   # Testcase 36
    TEST_CSR_OP(csrrc, x23, x16, mscratch, 0x7fffffff, 0x7fffffff, 0x0, 0x7fffffff, x25, x1, 16, x2)   # Testcase 37
    TEST_CSR_OP(csrrc, x12, x29, mscratch, 0x0, 0x0, 0xffffffff, 0x0, x3, x1, 24, x2)   # Testcase 38
    TEST_CSR_OP(csrrc, x31, x12, mscratch, 0xffffffff, 0x7fffffff, 0x80000000, 0xffffffff, x8, x1, 32, x2)   # Testcase 39


    

    RVTEST_SIGBASE(x7,signature_9_0)

    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0xfffffffe, 0xfffffffe, 0x1, 0xfffffffe, x3, x7, 0, x8)   # Testcase 40
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x7fffffff, 0x7ffffffd, 0x2, 0x7fffffff, x3, x7, 8, x8)   # Testcase 41
    TEST_CSR_OP(csrrc, x2, x3, mscratch, 0xbfffffff, 0xbffffffb, 0x4, 0xbfffffff, x4, x7, 16, x8)   # Testcase 42
    TEST_CSR_OP(csrrc, x3, x4, mscratch, 0xdfffffff, 0xdffffff7, 0x8, 0xdfffffff, x5, x7, 24, x8)   # Testcase 43
    TEST_CSR_OP(csrrc, x4, x5, mscratch, 0xefffffff, 0xefffffef, 0x10, 0xefffffff, x6, x7, 32, x8)   # Testcase 44


    

    RVTEST_SIGBASE(x1,signature_10_0)

    TEST_CSR_OP(csrrc, x5, x6, mscratch, 0xf7ffffff, 0xf7ffffdf, 0x20, 0xf7ffffff, x7, x1, 0, x2)   # Testcase 45
    TEST_CSR_OP(csrrc, x6, x7, mscratch, 0xfbffffff, 0xfbffffbf, 0x40, 0xfbffffff, x8, x1, 8, x2)   # Testcase 46
    TEST_CSR_OP(csrrc, x7, x8, mscratch, 0xfdffffff, 0xfdffff7f, 0x80, 0xfdffffff, x9, x1, 16, x2)   # Testcase 47
    TEST_CSR_OP(csrrc, x8, x9, mscratch, 0xfeffffff, 0xfefffeff, 0x100, 0xfeffffff, x10, x1, 24, x2)   # Testcase 48
    TEST_CSR_OP(csrrc, x9, x10, mscratch, 0xff7fffff, 0xff7ffdff, 0x200, 0xff7fffff, x11, x1, 32, x2)   # Testcase 49


    

    RVTEST_SIGBASE(x1,signature_11_0)

    TEST_CSR_OP(csrrc, x10, x11, mscratch, 0xffbfffff, 0xffbffbff, 0x400, 0xffbfffff, x12, x1, 0, x2)   # Testcase 50
    TEST_CSR_OP(csrrc, x11, x12, mscratch, 0xffdfffff, 0xffdff7ff, 0x800, 0xffdfffff, x13, x1, 8, x2)   # Testcase 51
    TEST_CSR_OP(csrrc, x12, x13, mscratch, 0xffefffff, 0xffefefff, 0x1000, 0xffefffff, x14, x1, 16, x2)   # Testcase 52
    TEST_CSR_OP(csrrc, x13, x14, mscratch, 0xfff7ffff, 0xfff7dfff, 0x2000, 0xfff7ffff, x15, x1, 24, x2)   # Testcase 53
    TEST_CSR_OP(csrrc, x14, x15, mscratch, 0xfffbffff, 0xfffbbfff, 0x4000, 0xfffbffff, x16, x1, 32, x2)   # Testcase 54


    

    RVTEST_SIGBASE(x1,signature_12_0)

    TEST_CSR_OP(csrrc, x15, x16, mscratch, 0xfffdffff, 0xfffd7fff, 0x8000, 0xfffdffff, x17, x1, 0, x2)   # Testcase 55
    TEST_CSR_OP(csrrc, x16, x17, mscratch, 0xfffeffff, 0xfffeffff, 0x10000, 0xfffeffff, x18, x1, 8, x2)   # Testcase 56
    TEST_CSR_OP(csrrc, x17, x18, mscratch, 0xffff7fff, 0xfffd7fff, 0x20000, 0xffff7fff, x19, x1, 16, x2)   # Testcase 57
    TEST_CSR_OP(csrrc, x18, x19, mscratch, 0xffffbfff, 0xfffbbfff, 0x40000, 0xffffbfff, x20, x1, 24, x2)   # Testcase 58
    TEST_CSR_OP(csrrc, x19, x20, mscratch, 0xffffdfff, 0xfff7dfff, 0x80000, 0xffffdfff, x21, x1, 32, x2)   # Testcase 59


    

    RVTEST_SIGBASE(x1,signature_13_0)

    TEST_CSR_OP(csrrc, x20, x21, mscratch, 0xffffefff, 0xffefefff, 0x100000, 0xffffefff, x22, x1, 0, x2)   # Testcase 60
    TEST_CSR_OP(csrrc, x21, x22, mscratch, 0xfffff7ff, 0xffdff7ff, 0x200000, 0xfffff7ff, x23, x1, 8, x2)   # Testcase 61
    TEST_CSR_OP(csrrc, x22, x23, mscratch, 0xfffffbff, 0xffbffbff, 0x400000, 0xfffffbff, x24, x1, 16, x2)   # Testcase 62
    TEST_CSR_OP(csrrc, x23, x24, mscratch, 0xfffffdff, 0xff7ffdff, 0x800000, 0xfffffdff, x25, x1, 24, x2)   # Testcase 63
    TEST_CSR_OP(csrrc, x24, x25, mscratch, 0xfffffeff, 0xfefffeff, 0x1000000, 0xfffffeff, x26, x1, 32, x2)   # Testcase 64


    

    RVTEST_SIGBASE(x1,signature_14_0)

    TEST_CSR_OP(csrrc, x25, x26, mscratch, 0xffffff7f, 0xfdffff7f, 0x2000000, 0xffffff7f, x27, x1, 0, x2)   # Testcase 65
    TEST_CSR_OP(csrrc, x26, x27, mscratch, 0xffffffbf, 0xfbffffbf, 0x4000000, 0xffffffbf, x28, x1, 8, x2)   # Testcase 66
    TEST_CSR_OP(csrrc, x27, x28, mscratch, 0xffffffdf, 0xf7ffffdf, 0x8000000, 0xffffffdf, x29, x1, 16, x2)   # Testcase 67
    TEST_CSR_OP(csrrc, x28, x29, mscratch, 0xffffffef, 0xefffffef, 0x10000000, 0xffffffef, x30, x1, 24, x2)   # Testcase 68
    TEST_CSR_OP(csrrc, x29, x30, mscratch, 0xfffffff7, 0xdffffff7, 0x20000000, 0xfffffff7, x31, x1, 32, x2)   # Testcase 69


    

    RVTEST_SIGBASE(x5,signature_15_0)

    TEST_CSR_OP(csrrc, x30, x31, mscratch, 0xfffffffb, 0xbffffffb, 0x40000000, 0xfffffffb, x1, x5, 0, x6)   # Testcase 70
    TEST_CSR_OP(csrrc, x31, x1, mscratch, 0xfffffffd, 0x7ffffffd, 0x80000000, 0xfffffffd, x2, x5, 8, x6)   # Testcase 71
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0xfffffffe, 0x0, 0xfffffffe, 0xfffffffe, x3, x5, 16, x6)   # Testcase 72
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x80000000, 0x0, 0xfffffffd, 0x80000000, x3, x5, 24, x6)   # Testcase 73
    TEST_CSR_OP(csrrc, x2, x3, mscratch, 0x40000000, 0x0, 0xfffffffb, 0x40000000, x4, x5, 32, x6)   # Testcase 74


    

    RVTEST_SIGBASE(x1,signature_16_0)

    TEST_CSR_OP(csrrc, x3, x4, mscratch, 0x20000000, 0x0, 0xfffffff7, 0x20000000, x5, x1, 0, x2)   # Testcase 75
    TEST_CSR_OP(csrrc, x4, x5, mscratch, 0x10000000, 0x0, 0xffffffef, 0x10000000, x6, x1, 8, x2)   # Testcase 76
    TEST_CSR_OP(csrrc, x5, x6, mscratch, 0x8000000, 0x0, 0xffffffdf, 0x8000000, x7, x1, 16, x2)   # Testcase 77
    TEST_CSR_OP(csrrc, x6, x7, mscratch, 0x4000000, 0x0, 0xffffffbf, 0x4000000, x8, x1, 24, x2)   # Testcase 78
    TEST_CSR_OP(csrrc, x7, x8, mscratch, 0x2000000, 0x0, 0xffffff7f, 0x2000000, x9, x1, 32, x2)   # Testcase 79


    

    RVTEST_SIGBASE(x1,signature_17_0)

    TEST_CSR_OP(csrrc, x8, x9, mscratch, 0x1000000, 0x0, 0xfffffeff, 0x1000000, x10, x1, 0, x2)   # Testcase 80
    TEST_CSR_OP(csrrc, x9, x10, mscratch, 0x800000, 0x0, 0xfffffdff, 0x800000, x11, x1, 8, x2)   # Testcase 81
    TEST_CSR_OP(csrrc, x10, x11, mscratch, 0x400000, 0x0, 0xfffffbff, 0x400000, x12, x1, 16, x2)   # Testcase 82
    TEST_CSR_OP(csrrc, x11, x12, mscratch, 0x200000, 0x0, 0xfffff7ff, 0x200000, x13, x1, 24, x2)   # Testcase 83
    TEST_CSR_OP(csrrc, x12, x13, mscratch, 0x100000, 0x0, 0xffffefff, 0x100000, x14, x1, 32, x2)   # Testcase 84


    

    RVTEST_SIGBASE(x1,signature_18_0)

    TEST_CSR_OP(csrrc, x13, x14, mscratch, 0x80000, 0x0, 0xffffdfff, 0x80000, x15, x1, 0, x2)   # Testcase 85
    TEST_CSR_OP(csrrc, x14, x15, mscratch, 0x40000, 0x0, 0xffffbfff, 0x40000, x16, x1, 8, x2)   # Testcase 86
    TEST_CSR_OP(csrrc, x15, x16, mscratch, 0x20000, 0x0, 0xffff7fff, 0x20000, x17, x1, 16, x2)   # Testcase 87
    TEST_CSR_OP(csrrc, x16, x17, mscratch, 0x10000, 0x10000, 0xfffeffff, 0x10000, x18, x1, 24, x2)   # Testcase 88
    TEST_CSR_OP(csrrc, x17, x18, mscratch, 0x8000, 0x0, 0xfffdffff, 0x8000, x19, x1, 32, x2)   # Testcase 89


    

    RVTEST_SIGBASE(x1,signature_19_0)

    TEST_CSR_OP(csrrc, x18, x19, mscratch, 0x4000, 0x0, 0xfffbffff, 0x4000, x20, x1, 0, x2)   # Testcase 90
    TEST_CSR_OP(csrrc, x19, x20, mscratch, 0x2000, 0x0, 0xfff7ffff, 0x2000, x21, x1, 8, x2)   # Testcase 91
    TEST_CSR_OP(csrrc, x20, x21, mscratch, 0x1000, 0x0, 0xffefffff, 0x1000, x22, x1, 16, x2)   # Testcase 92
    TEST_CSR_OP(csrrc, x21, x22, mscratch, 0x800, 0x0, 0xffdfffff, 0x800, x23, x1, 24, x2)   # Testcase 93
    TEST_CSR_OP(csrrc, x22, x23, mscratch, 0x400, 0x0, 0xffbfffff, 0x400, x24, x1, 32, x2)   # Testcase 94


    

    RVTEST_SIGBASE(x1,signature_20_0)

    TEST_CSR_OP(csrrc, x23, x24, mscratch, 0x200, 0x0, 0xff7fffff, 0x200, x25, x1, 0, x2)   # Testcase 95
    TEST_CSR_OP(csrrc, x24, x25, mscratch, 0x100, 0x0, 0xfeffffff, 0x100, x26, x1, 8, x2)   # Testcase 96
    TEST_CSR_OP(csrrc, x25, x26, mscratch, 0x80, 0x0, 0xfdffffff, 0x80, x27, x1, 16, x2)   # Testcase 97
    TEST_CSR_OP(csrrc, x26, x27, mscratch, 0x40, 0x0, 0xfbffffff, 0x40, x28, x1, 24, x2)   # Testcase 98
    TEST_CSR_OP(csrrc, x27, x28, mscratch, 0x20, 0x0, 0xf7ffffff, 0x20, x29, x1, 32, x2)   # Testcase 99


    

    RVTEST_SIGBASE(x4,signature_21_0)

    TEST_CSR_OP(csrrc, x28, x29, mscratch, 0x10, 0x0, 0xefffffff, 0x10, x30, x4, 0, x5)   # Testcase 100
    TEST_CSR_OP(csrrc, x29, x30, mscratch, 0x8, 0x0, 0xdfffffff, 0x8, x31, x4, 8, x5)   # Testcase 101
    TEST_CSR_OP(csrrc, x30, x31, mscratch, 0x4, 0x0, 0xbfffffff, 0x4, x1, x4, 16, x5)   # Testcase 102
    TEST_CSR_OP(csrrc, x31, x1, mscratch, 0x2, 0x0, 0x7fffffff, 0x2, x2, x4, 24, x5)   # Testcase 103
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x0, 0x0, 0x1, 0x0, x3, x4, 32, x5)   # Testcase 104


    

    RVTEST_SIGBASE(x8,signature_22_0)

    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x0, 0x0, 0x2, 0x0, x3, x8, 0, x9)   # Testcase 105
    TEST_CSR_OP(csrrc, x2, x3, mscratch, 0x0, 0x0, 0x4, 0x0, x4, x8, 8, x9)   # Testcase 106
    TEST_CSR_OP(csrrc, x3, x4, mscratch, 0x0, 0x0, 0x8, 0x0, x5, x8, 16, x9)   # Testcase 107
    TEST_CSR_OP(csrrc, x4, x5, mscratch, 0x0, 0x0, 0x10, 0x0, x6, x8, 24, x9)   # Testcase 108
    TEST_CSR_OP(csrrc, x5, x6, mscratch, 0x0, 0x0, 0x20, 0x0, x7, x8, 32, x9)   # Testcase 109


    

    RVTEST_SIGBASE(x1,signature_23_0)

    TEST_CSR_OP(csrrc, x6, x7, mscratch, 0x0, 0x0, 0x40, 0x0, x8, x1, 0, x2)   # Testcase 110
    TEST_CSR_OP(csrrc, x7, x8, mscratch, 0x0, 0x0, 0x80, 0x0, x9, x1, 8, x2)   # Testcase 111
    TEST_CSR_OP(csrrc, x8, x9, mscratch, 0x0, 0x0, 0x100, 0x0, x10, x1, 16, x2)   # Testcase 112
    TEST_CSR_OP(csrrc, x9, x10, mscratch, 0x0, 0x0, 0x200, 0x0, x11, x1, 24, x2)   # Testcase 113
    TEST_CSR_OP(csrrc, x10, x11, mscratch, 0x0, 0x0, 0x400, 0x0, x12, x1, 32, x2)   # Testcase 114


    

    RVTEST_SIGBASE(x1,signature_24_0)

    TEST_CSR_OP(csrrc, x11, x12, mscratch, 0x0, 0x0, 0x800, 0x0, x13, x1, 0, x2)   # Testcase 115
    TEST_CSR_OP(csrrc, x12, x13, mscratch, 0x0, 0x0, 0x1000, 0x0, x14, x1, 8, x2)   # Testcase 116
    TEST_CSR_OP(csrrc, x13, x14, mscratch, 0x0, 0x0, 0x2000, 0x0, x15, x1, 16, x2)   # Testcase 117
    TEST_CSR_OP(csrrc, x14, x15, mscratch, 0x0, 0x0, 0x4000, 0x0, x16, x1, 24, x2)   # Testcase 118
    TEST_CSR_OP(csrrc, x15, x16, mscratch, 0x0, 0x0, 0x8000, 0x0, x17, x1, 32, x2)   # Testcase 119


    

    RVTEST_SIGBASE(x1,signature_25_0)

    TEST_CSR_OP(csrrc, x16, x17, mscratch, 0x0, 0x0, 0x10000, 0x0, x18, x1, 0, x2)   # Testcase 120
    TEST_CSR_OP(csrrc, x17, x18, mscratch, 0x0, 0x0, 0x20000, 0x0, x19, x1, 8, x2)   # Testcase 121
    TEST_CSR_OP(csrrc, x18, x19, mscratch, 0x0, 0x0, 0x40000, 0x0, x20, x1, 16, x2)   # Testcase 122
    TEST_CSR_OP(csrrc, x19, x20, mscratch, 0x0, 0x0, 0x80000, 0x0, x21, x1, 24, x2)   # Testcase 123
    TEST_CSR_OP(csrrc, x20, x21, mscratch, 0x0, 0x0, 0x100000, 0x0, x22, x1, 32, x2)   # Testcase 124


    

    RVTEST_SIGBASE(x1,signature_26_0)

    TEST_CSR_OP(csrrc, x21, x22, mscratch, 0x0, 0x0, 0x200000, 0x0, x23, x1, 0, x2)   # Testcase 125
    TEST_CSR_OP(csrrc, x22, x23, mscratch, 0x0, 0x0, 0x400000, 0x0, x24, x1, 8, x2)   # Testcase 126
    TEST_CSR_OP(csrrc, x23, x24, mscratch, 0x0, 0x0, 0x800000, 0x0, x25, x1, 16, x2)   # Testcase 127
    TEST_CSR_OP(csrrc, x24, x25, mscratch, 0x0, 0x0, 0x1000000, 0x0, x26, x1, 24, x2)   # Testcase 128
    TEST_CSR_OP(csrrc, x25, x26, mscratch, 0x0, 0x0, 0x2000000, 0x0, x27, x1, 32, x2)   # Testcase 129


    

    RVTEST_SIGBASE(x2,signature_27_0)

    TEST_CSR_OP(csrrc, x26, x27, mscratch, 0x0, 0x0, 0x4000000, 0x0, x28, x2, 0, x3)   # Testcase 130
    TEST_CSR_OP(csrrc, x27, x28, mscratch, 0x0, 0x0, 0x8000000, 0x0, x29, x2, 8, x3)   # Testcase 131
    TEST_CSR_OP(csrrc, x28, x29, mscratch, 0x0, 0x0, 0x10000000, 0x0, x30, x2, 16, x3)   # Testcase 132
    TEST_CSR_OP(csrrc, x29, x30, mscratch, 0x0, 0x0, 0x20000000, 0x0, x31, x2, 24, x3)   # Testcase 133
    TEST_CSR_OP(csrrc, x30, x31, mscratch, 0x0, 0x0, 0x40000000, 0x0, x1, x2, 32, x3)   # Testcase 134


    

    RVTEST_SIGBASE(x6,signature_28_0)

    TEST_CSR_OP(csrrc, x31, x1, mscratch, 0x0, 0x0, 0x80000000, 0x0, x2, x6, 0, x7)   # Testcase 135
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x0, 0x0, 0xfffffffe, 0x0, x3, x6, 8, x7)   # Testcase 136
    TEST_CSR_OP(csrrc, x1, x2, mscratch, 0x0, 0x0, 0xfffffffd, 0x0, x3, x6, 16, x7)   # Testcase 137
    TEST_CSR_OP(csrrc, x2, x3, mscratch, 0x0, 0x0, 0xfffffffb, 0x0, x4, x6, 24, x7)   # Testcase 138
    TEST_CSR_OP(csrrc, x3, x4, mscratch, 0x0, 0x0, 0xfffffff7, 0x0, x5, x6, 32, x7)   # Testcase 139


    

    RVTEST_SIGBASE(x1,signature_29_0)

    TEST_CSR_OP(csrrc, x4, x5, mscratch, 0x0, 0x0, 0xffffffef, 0x0, x6, x1, 0, x2)   # Testcase 140
    TEST_CSR_OP(csrrc, x5, x6, mscratch, 0x0, 0x0, 0xffffffdf, 0x0, x7, x1, 8, x2)   # Testcase 141
    TEST_CSR_OP(csrrc, x6, x7, mscratch, 0x0, 0x0, 0xffffffbf, 0x0, x8, x1, 16, x2)   # Testcase 142
    TEST_CSR_OP(csrrc, x7, x8, mscratch, 0x0, 0x0, 0xffffff7f, 0x0, x9, x1, 24, x2)   # Testcase 143
    TEST_CSR_OP(csrrc, x8, x9, mscratch, 0x0, 0x0, 0xfffffeff, 0x0, x10, x1, 32, x2)   # Testcase 144


    

    RVTEST_SIGBASE(x1,signature_30_0)

    TEST_CSR_OP(csrrc, x9, x10, mscratch, 0x0, 0x0, 0xfffffdff, 0x0, x11, x1, 0, x2)   # Testcase 145
    TEST_CSR_OP(csrrc, x10, x11, mscratch, 0x0, 0x0, 0xfffffbff, 0x0, x12, x1, 8, x2)   # Testcase 146
    TEST_CSR_OP(csrrc, x11, x12, mscratch, 0x0, 0x0, 0xfffff7ff, 0x0, x13, x1, 16, x2)   # Testcase 147
    TEST_CSR_OP(csrrc, x12, x13, mscratch, 0x0, 0x0, 0xffffefff, 0x0, x14, x1, 24, x2)   # Testcase 148
    TEST_CSR_OP(csrrc, x13, x14, mscratch, 0x0, 0x0, 0xffffdfff, 0x0, x15, x1, 32, x2)   # Testcase 149


    

    RVTEST_SIGBASE(x1,signature_31_0)

    TEST_CSR_OP(csrrc, x14, x15, mscratch, 0x0, 0x0, 0xffffbfff, 0x0, x16, x1, 0, x2)   # Testcase 150
    TEST_CSR_OP(csrrc, x15, x16, mscratch, 0x0, 0x0, 0xffff7fff, 0x0, x17, x1, 8, x2)   # Testcase 151
    TEST_CSR_OP(csrrc, x16, x17, mscratch, 0x0, 0x0, 0xfffeffff, 0x0, x18, x1, 16, x2)   # Testcase 152
    TEST_CSR_OP(csrrc, x17, x18, mscratch, 0x0, 0x0, 0xfffdffff, 0x0, x19, x1, 24, x2)   # Testcase 153
    TEST_CSR_OP(csrrc, x18, x19, mscratch, 0x0, 0x0, 0xfffbffff, 0x0, x20, x1, 32, x2)   # Testcase 154


    

    RVTEST_SIGBASE(x1,signature_32_0)

    TEST_CSR_OP(csrrc, x19, x20, mscratch, 0x0, 0x0, 0xfff7ffff, 0x0, x21, x1, 0, x2)   # Testcase 155
    TEST_CSR_OP(csrrc, x20, x21, mscratch, 0x0, 0x0, 0xffefffff, 0x0, x22, x1, 8, x2)   # Testcase 156
    TEST_CSR_OP(csrrc, x21, x22, mscratch, 0x0, 0x0, 0xffdfffff, 0x0, x23, x1, 16, x2)   # Testcase 157
    TEST_CSR_OP(csrrc, x22, x23, mscratch, 0x0, 0x0, 0xffbfffff, 0x0, x24, x1, 24, x2)   # Testcase 158
    TEST_CSR_OP(csrrc, x23, x24, mscratch, 0x0, 0x0, 0xff7fffff, 0x0, x25, x1, 32, x2)   # Testcase 159


    

    RVTEST_SIGBASE(x1,signature_33_0)

    TEST_CSR_OP(csrrc, x24, x25, mscratch, 0x0, 0x0, 0xfeffffff, 0x0, x26, x1, 0, x2)   # Testcase 160
    TEST_CSR_OP(csrrc, x25, x26, mscratch, 0x0, 0x0, 0xfdffffff, 0x0, x27, x1, 8, x2)   # Testcase 161
    TEST_CSR_OP(csrrc, x26, x27, mscratch, 0x0, 0x0, 0xfbffffff, 0x0, x28, x1, 16, x2)   # Testcase 162
    TEST_CSR_OP(csrrc, x27, x28, mscratch, 0x0, 0x0, 0xf7ffffff, 0x0, x29, x1, 24, x2)   # Testcase 163
    TEST_CSR_OP(csrrc, x28, x29, mscratch, 0x0, 0x0, 0xefffffff, 0x0, x30, x1, 32, x2)   # Testcase 164


    

    RVTEST_SIGBASE(x3,signature_34_0)

    TEST_CSR_OP(csrrc, x29, x30, mscratch, 0x0, 0x0, 0xdfffffff, 0x0, x31, x3, 0, x4)   # Testcase 165
    TEST_CSR_OP(csrrc, x30, x31, mscratch, 0x0, 0x0, 0xbfffffff, 0x0, x1, x3, 8, x4)   # Testcase 166
    TEST_CSR_OP(csrrc, x31, x1, mscratch, 0x0, 0x0, 0x7fffffff, 0x0, x2, x3, 16, x4)   # Testcase 167
    TEST_CSR_OP(csrrc, x11, x10, mscratch, 0x382ad819, 0x0, 0x316bcec8, 0x382ad819, x10, x3, 24, x4)   # Testcase 168
    TEST_CSR_OP(csrrc, x0, x7, mscratch, 0x0, 0xe2054094, 0x1ce2b96b, 0xeec740dd, x14, x3, 32, x4)   # Testcase 169


    

    RVTEST_SIGBASE(x1,signature_35_0)

    TEST_CSR_OP(csrrc, x7, x0, mscratch, 0xc77cabda, 0xc77cabda, 0xcd125862, 0xc77cabda, x14, x1, 0, x2)   # Testcase 170
	
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
signature_35_0:
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

