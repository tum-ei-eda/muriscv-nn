// RISC-V Architectural Validation Test CSRRWI-01
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
// Description: Testing instruction 'CSRRWI'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32I")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN







#ifdef TEST_CASE_1


    
    RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zicsr.*);def TEST_CASE_1=True;",csrrwi)

    RVTEST_SIGBASE(x4,signature_1_0)

    TEST_CSR_IMM_OP(csrrwi, x19, 7, mscratch, 0x54f4aeeb, 0x7, 0x0, 0x54f4aeeb, x29, x4, 0, x5)   # Testcase 0
    TEST_CSR_IMM_OP(csrrwi, x30, 17, mscratch, 0xe1b1199b, 0x11, 0x0, 0xe1b1199b, x21, x4, 8, x5)   # Testcase 1
    TEST_CSR_IMM_OP(csrrwi, x10, 5, mscratch, 0xb26566a0, 0x5, 0x0, 0xb26566a0, x2, x4, 16, x5)   # Testcase 2
    TEST_CSR_IMM_OP(csrrwi, x3, 4, mscratch, 0xf27008e6, 0x4, 0x0, 0xf27008e6, x1, x4, 24, x5)   # Testcase 3
    TEST_CSR_IMM_OP(csrrwi, x29, 30, mscratch, 0xc8484a3, 0x1e, 0x0, 0xc8484a3, x6, x4, 32, x5)   # Testcase 4



    

    RVTEST_SIGBASE(x1,signature_2_0)

    TEST_CSR_IMM_OP(csrrwi, x0, 31, mscratch, 0x0, 0x1f, 0x0, 0xa783d03f, x14, x1, 0, x2)   # Testcase 5
    TEST_CSR_IMM_OP(csrrwi, x4, 7, mscratch, 0xfd7b9df8, 0x7, 0x0, 0xfd7b9df8, x12, x1, 8, x2)   # Testcase 6
    TEST_CSR_IMM_OP(csrrwi, x25, 17, mscratch, 0xafaa29d, 0x11, 0x0, 0xafaa29d, x3, x1, 16, x2)   # Testcase 7
    TEST_CSR_IMM_OP(csrrwi, x18, 20, mscratch, 0x413f2c62, 0x14, 0x0, 0x413f2c62, x19, x1, 24, x2)   # Testcase 8
    TEST_CSR_IMM_OP(csrrwi, x7, 0, mscratch, 0x2c370a9a, 0x0, 0x0, 0x2c370a9a, x10, x1, 32, x2)   # Testcase 9



    

    RVTEST_SIGBASE(x3,signature_3_0)

    TEST_CSR_IMM_OP(csrrwi, x31, 30, mscratch, 0x2882a0b3, 0x1e, 0x0, 0x2882a0b3, x18, x3, 0, x4)   # Testcase 10
    TEST_CSR_IMM_OP(csrrwi, x23, 14, mscratch, 0x91dd5ad6, 0xe, 0x0, 0x91dd5ad6, x1, x3, 8, x4)   # Testcase 11
    TEST_CSR_IMM_OP(csrrwi, x21, 16, mscratch, 0x42f1d629, 0x10, 0x0, 0x42f1d629, x2, x3, 16, x4)   # Testcase 12
    TEST_CSR_IMM_OP(csrrwi, x30, 17, mscratch, 0xcddbdf6f, 0x11, 0x0, 0xcddbdf6f, x1, x3, 24, x4)   # Testcase 13
    TEST_CSR_IMM_OP(csrrwi, x17, 24, mscratch, 0x4d236af8, 0x18, 0x0, 0x4d236af8, x1, x3, 32, x4)   # Testcase 14



    

    RVTEST_SIGBASE(x1,signature_4_0)

    TEST_CSR_IMM_OP(csrrwi, x6, 13, mscratch, 0x983b9f63, 0xd, 0x0, 0x983b9f63, x12, x1, 0, x4)   # Testcase 15
    TEST_CSR_IMM_OP(csrrwi, x22, 5, mscratch, 0x1fbe3ca6, 0x5, 0x0, 0x1fbe3ca6, x10, x1, 8, x4)   # Testcase 16
    TEST_CSR_IMM_OP(csrrwi, x2, 1, mscratch, 0x353a8593, 0x1, 0x0, 0x353a8593, x8, x1, 16, x4)   # Testcase 17
    TEST_CSR_IMM_OP(csrrwi, x13, 8, mscratch, 0x66268a1a, 0x8, 0x0, 0x66268a1a, x8, x1, 24, x4)   # Testcase 18
    TEST_CSR_IMM_OP(csrrwi, x3, 27, mscratch, 0x28ac54a3, 0x1b, 0x0, 0x28ac54a3, x14, x1, 32, x4)   # Testcase 19



    

    RVTEST_SIGBASE(x2,signature_5_0)

    TEST_CSR_IMM_OP(csrrwi, x24, 12, mscratch, 0xdc3713a2, 0xc, 0x0, 0xdc3713a2, x13, x2, 0, x5)   # Testcase 20
    TEST_CSR_IMM_OP(csrrwi, x3, 21, mscratch, 0x74674399, 0x15, 0x0, 0x74674399, x18, x2, 8, x5)   # Testcase 21
    TEST_CSR_IMM_OP(csrrwi, x14, 4, mscratch, 0x6bdd9821, 0x4, 0x0, 0x6bdd9821, x1, x2, 16, x5)   # Testcase 22
    TEST_CSR_IMM_OP(csrrwi, x20, 6, mscratch, 0x825648e4, 0x6, 0x0, 0x825648e4, x19, x2, 24, x5)   # Testcase 23
    TEST_CSR_IMM_OP(csrrwi, x4, 12, mscratch, 0x7bf4ef1c, 0xc, 0x0, 0x7bf4ef1c, x30, x2, 32, x5)   # Testcase 24



    

    RVTEST_SIGBASE(x1,signature_6_0)

    TEST_CSR_IMM_OP(csrrwi, x29, 22, mscratch, 0xf49a4b2, 0x16, 0x0, 0xf49a4b2, x31, x1, 0, x5)   # Testcase 25
    TEST_CSR_IMM_OP(csrrwi, x17, 20, mscratch, 0xfe9b8abf, 0x14, 0x0, 0xfe9b8abf, x2, x1, 8, x5)   # Testcase 26
    TEST_CSR_IMM_OP(csrrwi, x22, 24, mscratch, 0x347ebc89, 0x18, 0x0, 0x347ebc89, x4, x1, 16, x5)   # Testcase 27
    TEST_CSR_IMM_OP(csrrwi, x3, 28, mscratch, 0xf52a52bf, 0x1c, 0x0, 0xf52a52bf, x20, x1, 24, x5)   # Testcase 28
    TEST_CSR_IMM_OP(csrrwi, x15, 18, mscratch, 0xcaa4b80e, 0x12, 0x0, 0xcaa4b80e, x14, x1, 32, x5)   # Testcase 29



    

    RVTEST_SIGBASE(x1,signature_7_0)

    TEST_CSR_IMM_OP(csrrwi, x28, 0, mscratch, 0xffffffff, 0x0, 0x0, 0xffffffff, x7, x1, 0, x2)   # Testcase 30
    TEST_CSR_IMM_OP(csrrwi, x14, 31, mscratch, 0x80000000, 0x1f, 0x0, 0x80000000, x7, x1, 8, x2)   # Testcase 31
    TEST_CSR_IMM_OP(csrrwi, x9, 31, mscratch, 0xffffffff, 0x1f, 0x0, 0xffffffff, x18, x1, 16, x2)   # Testcase 32
    TEST_CSR_IMM_OP(csrrwi, x10, 31, mscratch, 0x0, 0x1f, 0x0, 0x0, x15, x1, 24, x2)   # Testcase 33
    TEST_CSR_IMM_OP(csrrwi, x6, 0, mscratch, 0xffffffff, 0x0, 0x0, 0xffffffff, x23, x1, 32, x2)   # Testcase 34



    

    RVTEST_SIGBASE(x3,signature_8_0)

    TEST_CSR_IMM_OP(csrrwi, x0, 31, mscratch, 0x0, 0x1f, 0x0, 0x80000000, x2, x3, 0, x4)   # Testcase 35
    TEST_CSR_IMM_OP(csrrwi, x19, 31, mscratch, 0xffffffff, 0x1f, 0x0, 0xffffffff, x29, x3, 8, x4)   # Testcase 36
    TEST_CSR_IMM_OP(csrrwi, x19, 31, mscratch, 0x0, 0x1f, 0x0, 0x0, x1, x3, 16, x4)   # Testcase 37
    TEST_CSR_IMM_OP(csrrwi, x30, 0, mscratch, 0xffffffff, 0x0, 0x0, 0xffffffff, x28, x3, 24, x4)   # Testcase 38
    TEST_CSR_IMM_OP(csrrwi, x21, 31, mscratch, 0x80000000, 0x1f, 0x0, 0x80000000, x24, x3, 32, x4)   # Testcase 39



    

    RVTEST_SIGBASE(x6,signature_9_0)

    TEST_CSR_IMM_OP(csrrwi, x1, 1, mscratch, 0xfffffffe, 0x1, 0x0, 0xfffffffe, x2, x6, 0, x7)   # Testcase 40
    TEST_CSR_IMM_OP(csrrwi, x1, 2, mscratch, 0x7fffffff, 0x2, 0x0, 0x7fffffff, x2, x6, 8, x7)   # Testcase 41
    TEST_CSR_IMM_OP(csrrwi, x2, 4, mscratch, 0xbfffffff, 0x4, 0x0, 0xbfffffff, x3, x6, 16, x7)   # Testcase 42
    TEST_CSR_IMM_OP(csrrwi, x3, 8, mscratch, 0xdfffffff, 0x8, 0x0, 0xdfffffff, x4, x6, 24, x7)   # Testcase 43
    TEST_CSR_IMM_OP(csrrwi, x4, 16, mscratch, 0xefffffff, 0x10, 0x0, 0xefffffff, x5, x6, 32, x7)   # Testcase 44



    

    RVTEST_SIGBASE(x1,signature_10_0)

    TEST_CSR_IMM_OP(csrrwi, x5, 30, mscratch, 0xf7ffffff, 0x1e, 0x0, 0xf7ffffff, x6, x1, 0, x2)   # Testcase 45
    TEST_CSR_IMM_OP(csrrwi, x6, 29, mscratch, 0xfbffffff, 0x1d, 0x0, 0xfbffffff, x7, x1, 8, x2)   # Testcase 46
    TEST_CSR_IMM_OP(csrrwi, x7, 27, mscratch, 0xfdffffff, 0x1b, 0x0, 0xfdffffff, x8, x1, 16, x2)   # Testcase 47
    TEST_CSR_IMM_OP(csrrwi, x8, 23, mscratch, 0xfeffffff, 0x17, 0x0, 0xfeffffff, x9, x1, 24, x2)   # Testcase 48
    TEST_CSR_IMM_OP(csrrwi, x9, 15, mscratch, 0xff7fffff, 0xf, 0x0, 0xff7fffff, x10, x1, 32, x2)   # Testcase 49



    

    RVTEST_SIGBASE(x1,signature_11_0)

    TEST_CSR_IMM_OP(csrrwi, x10, 30, mscratch, 0xffbfffff, 0x1e, 0x0, 0xffbfffff, x11, x1, 0, x2)   # Testcase 50
    TEST_CSR_IMM_OP(csrrwi, x11, 29, mscratch, 0xffdfffff, 0x1d, 0x0, 0xffdfffff, x12, x1, 8, x2)   # Testcase 51
    TEST_CSR_IMM_OP(csrrwi, x12, 27, mscratch, 0xffefffff, 0x1b, 0x0, 0xffefffff, x13, x1, 16, x2)   # Testcase 52
    TEST_CSR_IMM_OP(csrrwi, x13, 23, mscratch, 0xfff7ffff, 0x17, 0x0, 0xfff7ffff, x14, x1, 24, x2)   # Testcase 53
    TEST_CSR_IMM_OP(csrrwi, x14, 15, mscratch, 0xfffbffff, 0xf, 0x0, 0xfffbffff, x15, x1, 32, x2)   # Testcase 54



    

    RVTEST_SIGBASE(x1,signature_12_0)

    TEST_CSR_IMM_OP(csrrwi, x15, 30, mscratch, 0xfffdffff, 0x1e, 0x0, 0xfffdffff, x16, x1, 0, x2)   # Testcase 55
    TEST_CSR_IMM_OP(csrrwi, x16, 29, mscratch, 0xfffeffff, 0x1d, 0x0, 0xfffeffff, x17, x1, 8, x2)   # Testcase 56
    TEST_CSR_IMM_OP(csrrwi, x17, 27, mscratch, 0xffff7fff, 0x1b, 0x0, 0xffff7fff, x18, x1, 16, x2)   # Testcase 57
    TEST_CSR_IMM_OP(csrrwi, x18, 23, mscratch, 0xffffbfff, 0x17, 0x0, 0xffffbfff, x19, x1, 24, x2)   # Testcase 58
    TEST_CSR_IMM_OP(csrrwi, x19, 15, mscratch, 0xffffdfff, 0xf, 0x0, 0xffffdfff, x20, x1, 32, x2)   # Testcase 59



    

    RVTEST_SIGBASE(x1,signature_13_0)

    TEST_CSR_IMM_OP(csrrwi, x20, 30, mscratch, 0xffffefff, 0x1e, 0x0, 0xffffefff, x21, x1, 0, x2)   # Testcase 60
    TEST_CSR_IMM_OP(csrrwi, x21, 29, mscratch, 0xfffff7ff, 0x1d, 0x0, 0xfffff7ff, x22, x1, 8, x2)   # Testcase 61
    TEST_CSR_IMM_OP(csrrwi, x22, 27, mscratch, 0xfffffbff, 0x1b, 0x0, 0xfffffbff, x23, x1, 16, x2)   # Testcase 62
    TEST_CSR_IMM_OP(csrrwi, x23, 23, mscratch, 0xfffffdff, 0x17, 0x0, 0xfffffdff, x24, x1, 24, x2)   # Testcase 63
    TEST_CSR_IMM_OP(csrrwi, x24, 15, mscratch, 0xfffffeff, 0xf, 0x0, 0xfffffeff, x25, x1, 32, x2)   # Testcase 64



    

    RVTEST_SIGBASE(x1,signature_14_0)

    TEST_CSR_IMM_OP(csrrwi, x25, 30, mscratch, 0xffffff7f, 0x1e, 0x0, 0xffffff7f, x26, x1, 0, x2)   # Testcase 65
    TEST_CSR_IMM_OP(csrrwi, x26, 29, mscratch, 0xffffffbf, 0x1d, 0x0, 0xffffffbf, x27, x1, 8, x2)   # Testcase 66
    TEST_CSR_IMM_OP(csrrwi, x27, 27, mscratch, 0xffffffdf, 0x1b, 0x0, 0xffffffdf, x28, x1, 16, x2)   # Testcase 67
    TEST_CSR_IMM_OP(csrrwi, x28, 23, mscratch, 0xffffffef, 0x17, 0x0, 0xffffffef, x29, x1, 24, x2)   # Testcase 68
    TEST_CSR_IMM_OP(csrrwi, x29, 15, mscratch, 0xfffffff7, 0xf, 0x0, 0xfffffff7, x30, x1, 32, x2)   # Testcase 69



    

    RVTEST_SIGBASE(x4,signature_15_0)

    TEST_CSR_IMM_OP(csrrwi, x30, 30, mscratch, 0xfffffffb, 0x1e, 0x0, 0xfffffffb, x31, x4, 0, x5)   # Testcase 70
    TEST_CSR_IMM_OP(csrrwi, x31, 29, mscratch, 0xfffffffd, 0x1d, 0x0, 0xfffffffd, x1, x4, 8, x5)   # Testcase 71
    TEST_CSR_IMM_OP(csrrwi, x1, 27, mscratch, 0xfffffffe, 0x1b, 0x0, 0xfffffffe, x2, x4, 16, x5)   # Testcase 72
    TEST_CSR_IMM_OP(csrrwi, x1, 23, mscratch, 0x80000000, 0x17, 0x0, 0x80000000, x2, x4, 24, x5)   # Testcase 73
    TEST_CSR_IMM_OP(csrrwi, x2, 15, mscratch, 0x40000000, 0xf, 0x0, 0x40000000, x3, x4, 32, x5)   # Testcase 74



    

    RVTEST_SIGBASE(x1,signature_16_0)

    TEST_CSR_IMM_OP(csrrwi, x3, 30, mscratch, 0x20000000, 0x1e, 0x0, 0x20000000, x4, x1, 0, x2)   # Testcase 75
    TEST_CSR_IMM_OP(csrrwi, x4, 29, mscratch, 0x10000000, 0x1d, 0x0, 0x10000000, x5, x1, 8, x2)   # Testcase 76
    TEST_CSR_IMM_OP(csrrwi, x5, 27, mscratch, 0x8000000, 0x1b, 0x0, 0x8000000, x6, x1, 16, x2)   # Testcase 77
    TEST_CSR_IMM_OP(csrrwi, x6, 23, mscratch, 0x4000000, 0x17, 0x0, 0x4000000, x7, x1, 24, x2)   # Testcase 78
    TEST_CSR_IMM_OP(csrrwi, x7, 15, mscratch, 0x2000000, 0xf, 0x0, 0x2000000, x8, x1, 32, x2)   # Testcase 79



    

    RVTEST_SIGBASE(x1,signature_17_0)

    TEST_CSR_IMM_OP(csrrwi, x8, 30, mscratch, 0x1000000, 0x1e, 0x0, 0x1000000, x9, x1, 0, x2)   # Testcase 80
    TEST_CSR_IMM_OP(csrrwi, x9, 29, mscratch, 0x800000, 0x1d, 0x0, 0x800000, x10, x1, 8, x2)   # Testcase 81
    TEST_CSR_IMM_OP(csrrwi, x10, 27, mscratch, 0x400000, 0x1b, 0x0, 0x400000, x11, x1, 16, x2)   # Testcase 82
    TEST_CSR_IMM_OP(csrrwi, x11, 23, mscratch, 0x200000, 0x17, 0x0, 0x200000, x12, x1, 24, x2)   # Testcase 83
    TEST_CSR_IMM_OP(csrrwi, x12, 15, mscratch, 0x100000, 0xf, 0x0, 0x100000, x13, x1, 32, x2)   # Testcase 84



    

    RVTEST_SIGBASE(x1,signature_18_0)

    TEST_CSR_IMM_OP(csrrwi, x13, 30, mscratch, 0x80000, 0x1e, 0x0, 0x80000, x14, x1, 0, x2)   # Testcase 85
    TEST_CSR_IMM_OP(csrrwi, x14, 29, mscratch, 0x40000, 0x1d, 0x0, 0x40000, x15, x1, 8, x2)   # Testcase 86
    TEST_CSR_IMM_OP(csrrwi, x15, 27, mscratch, 0x20000, 0x1b, 0x0, 0x20000, x16, x1, 16, x2)   # Testcase 87
    TEST_CSR_IMM_OP(csrrwi, x16, 23, mscratch, 0x10000, 0x17, 0x0, 0x10000, x17, x1, 24, x2)   # Testcase 88
    TEST_CSR_IMM_OP(csrrwi, x17, 15, mscratch, 0x8000, 0xf, 0x0, 0x8000, x18, x1, 32, x2)   # Testcase 89



    

    RVTEST_SIGBASE(x1,signature_19_0)

    TEST_CSR_IMM_OP(csrrwi, x18, 30, mscratch, 0x4000, 0x1e, 0x0, 0x4000, x19, x1, 0, x2)   # Testcase 90
    TEST_CSR_IMM_OP(csrrwi, x19, 29, mscratch, 0x2000, 0x1d, 0x0, 0x2000, x20, x1, 8, x2)   # Testcase 91
    TEST_CSR_IMM_OP(csrrwi, x20, 27, mscratch, 0x1000, 0x1b, 0x0, 0x1000, x21, x1, 16, x2)   # Testcase 92
    TEST_CSR_IMM_OP(csrrwi, x21, 23, mscratch, 0x800, 0x17, 0x0, 0x800, x22, x1, 24, x2)   # Testcase 93
    TEST_CSR_IMM_OP(csrrwi, x22, 15, mscratch, 0x400, 0xf, 0x0, 0x400, x23, x1, 32, x2)   # Testcase 94



    

    RVTEST_SIGBASE(x1,signature_20_0)

    TEST_CSR_IMM_OP(csrrwi, x23, 30, mscratch, 0x200, 0x1e, 0x0, 0x200, x24, x1, 0, x2)   # Testcase 95
    TEST_CSR_IMM_OP(csrrwi, x24, 29, mscratch, 0x100, 0x1d, 0x0, 0x100, x25, x1, 8, x2)   # Testcase 96
    TEST_CSR_IMM_OP(csrrwi, x25, 27, mscratch, 0x80, 0x1b, 0x0, 0x80, x26, x1, 16, x2)   # Testcase 97
    TEST_CSR_IMM_OP(csrrwi, x26, 23, mscratch, 0x40, 0x17, 0x0, 0x40, x27, x1, 24, x2)   # Testcase 98
    TEST_CSR_IMM_OP(csrrwi, x27, 15, mscratch, 0x20, 0xf, 0x0, 0x20, x28, x1, 32, x2)   # Testcase 99



    

    RVTEST_SIGBASE(x3,signature_21_0)

    TEST_CSR_IMM_OP(csrrwi, x28, 30, mscratch, 0x10, 0x1e, 0x0, 0x10, x29, x3, 0, x4)   # Testcase 100
    TEST_CSR_IMM_OP(csrrwi, x29, 29, mscratch, 0x8, 0x1d, 0x0, 0x8, x30, x3, 8, x4)   # Testcase 101
    TEST_CSR_IMM_OP(csrrwi, x30, 27, mscratch, 0x4, 0x1b, 0x0, 0x4, x31, x3, 16, x4)   # Testcase 102
    TEST_CSR_IMM_OP(csrrwi, x31, 23, mscratch, 0x2, 0x17, 0x0, 0x2, x1, x3, 24, x4)   # Testcase 103
    TEST_CSR_IMM_OP(csrrwi, x1, 1, mscratch, 0x0, 0x1, 0x0, 0x0, x2, x3, 32, x4)   # Testcase 104



    

    RVTEST_SIGBASE(x7,signature_22_0)

    TEST_CSR_IMM_OP(csrrwi, x1, 2, mscratch, 0x0, 0x2, 0x0, 0x0, x2, x7, 0, x8)   # Testcase 105
    TEST_CSR_IMM_OP(csrrwi, x2, 4, mscratch, 0x0, 0x4, 0x0, 0x0, x3, x7, 8, x8)   # Testcase 106
    TEST_CSR_IMM_OP(csrrwi, x3, 8, mscratch, 0x0, 0x8, 0x0, 0x0, x4, x7, 16, x8)   # Testcase 107
    TEST_CSR_IMM_OP(csrrwi, x4, 16, mscratch, 0x0, 0x10, 0x0, 0x0, x5, x7, 24, x8)   # Testcase 108
    TEST_CSR_IMM_OP(csrrwi, x5, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x6, x7, 32, x8)   # Testcase 109



    

    RVTEST_SIGBASE(x1,signature_23_0)

    TEST_CSR_IMM_OP(csrrwi, x6, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x7, x1, 0, x2)   # Testcase 110
    TEST_CSR_IMM_OP(csrrwi, x7, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x8, x1, 8, x2)   # Testcase 111
    TEST_CSR_IMM_OP(csrrwi, x8, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x9, x1, 16, x2)   # Testcase 112
    TEST_CSR_IMM_OP(csrrwi, x9, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x10, x1, 24, x2)   # Testcase 113
    TEST_CSR_IMM_OP(csrrwi, x10, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x11, x1, 32, x2)   # Testcase 114



    

    RVTEST_SIGBASE(x1,signature_24_0)

    TEST_CSR_IMM_OP(csrrwi, x11, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x12, x1, 0, x2)   # Testcase 115
    TEST_CSR_IMM_OP(csrrwi, x12, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x13, x1, 8, x2)   # Testcase 116
    TEST_CSR_IMM_OP(csrrwi, x13, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x14, x1, 16, x2)   # Testcase 117
    TEST_CSR_IMM_OP(csrrwi, x14, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x15, x1, 24, x2)   # Testcase 118
    TEST_CSR_IMM_OP(csrrwi, x15, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x16, x1, 32, x2)   # Testcase 119



    

    RVTEST_SIGBASE(x1,signature_25_0)

    TEST_CSR_IMM_OP(csrrwi, x16, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x17, x1, 0, x2)   # Testcase 120
    TEST_CSR_IMM_OP(csrrwi, x17, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x18, x1, 8, x2)   # Testcase 121
    TEST_CSR_IMM_OP(csrrwi, x18, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x19, x1, 16, x2)   # Testcase 122
    TEST_CSR_IMM_OP(csrrwi, x19, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x20, x1, 24, x2)   # Testcase 123
    TEST_CSR_IMM_OP(csrrwi, x20, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x21, x1, 32, x2)   # Testcase 124



    

    RVTEST_SIGBASE(x1,signature_26_0)

    TEST_CSR_IMM_OP(csrrwi, x21, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x22, x1, 0, x2)   # Testcase 125
    TEST_CSR_IMM_OP(csrrwi, x22, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x23, x1, 8, x2)   # Testcase 126
    TEST_CSR_IMM_OP(csrrwi, x23, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x24, x1, 16, x2)   # Testcase 127
    TEST_CSR_IMM_OP(csrrwi, x24, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x25, x1, 24, x2)   # Testcase 128
    TEST_CSR_IMM_OP(csrrwi, x25, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x26, x1, 32, x2)   # Testcase 129



    

    RVTEST_SIGBASE(x1,signature_27_0)

    TEST_CSR_IMM_OP(csrrwi, x26, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x27, x1, 0, x2)   # Testcase 130
    TEST_CSR_IMM_OP(csrrwi, x27, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x28, x1, 8, x2)   # Testcase 131
    TEST_CSR_IMM_OP(csrrwi, x28, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x29, x1, 16, x2)   # Testcase 132
    TEST_CSR_IMM_OP(csrrwi, x29, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x30, x1, 24, x2)   # Testcase 133
    TEST_CSR_IMM_OP(csrrwi, x30, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x31, x1, 32, x2)   # Testcase 134



    

    RVTEST_SIGBASE(x5,signature_28_0)

    TEST_CSR_IMM_OP(csrrwi, x31, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x1, x5, 0, x6)   # Testcase 135
    TEST_CSR_IMM_OP(csrrwi, x1, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x2, x5, 8, x6)   # Testcase 136
    TEST_CSR_IMM_OP(csrrwi, x1, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x2, x5, 16, x6)   # Testcase 137
    TEST_CSR_IMM_OP(csrrwi, x2, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x3, x5, 24, x6)   # Testcase 138
    TEST_CSR_IMM_OP(csrrwi, x3, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x4, x5, 32, x6)   # Testcase 139



    

    RVTEST_SIGBASE(x1,signature_29_0)

    TEST_CSR_IMM_OP(csrrwi, x4, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x5, x1, 0, x2)   # Testcase 140
    TEST_CSR_IMM_OP(csrrwi, x5, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x6, x1, 8, x2)   # Testcase 141
    TEST_CSR_IMM_OP(csrrwi, x6, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x7, x1, 16, x2)   # Testcase 142
    TEST_CSR_IMM_OP(csrrwi, x7, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x8, x1, 24, x2)   # Testcase 143
    TEST_CSR_IMM_OP(csrrwi, x8, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x9, x1, 32, x2)   # Testcase 144



    

    RVTEST_SIGBASE(x1,signature_30_0)

    TEST_CSR_IMM_OP(csrrwi, x9, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x10, x1, 0, x2)   # Testcase 145
    TEST_CSR_IMM_OP(csrrwi, x10, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x11, x1, 8, x2)   # Testcase 146
    TEST_CSR_IMM_OP(csrrwi, x11, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x12, x1, 16, x2)   # Testcase 147
    TEST_CSR_IMM_OP(csrrwi, x12, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x13, x1, 24, x2)   # Testcase 148
    TEST_CSR_IMM_OP(csrrwi, x13, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x14, x1, 32, x2)   # Testcase 149



    

    RVTEST_SIGBASE(x1,signature_31_0)

    TEST_CSR_IMM_OP(csrrwi, x14, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x15, x1, 0, x2)   # Testcase 150
    TEST_CSR_IMM_OP(csrrwi, x15, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x16, x1, 8, x2)   # Testcase 151
    TEST_CSR_IMM_OP(csrrwi, x16, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x17, x1, 16, x2)   # Testcase 152
    TEST_CSR_IMM_OP(csrrwi, x17, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x18, x1, 24, x2)   # Testcase 153
    TEST_CSR_IMM_OP(csrrwi, x18, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x19, x1, 32, x2)   # Testcase 154



    

    RVTEST_SIGBASE(x1,signature_32_0)

    TEST_CSR_IMM_OP(csrrwi, x19, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x20, x1, 0, x2)   # Testcase 155
    TEST_CSR_IMM_OP(csrrwi, x20, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x21, x1, 8, x2)   # Testcase 156
    TEST_CSR_IMM_OP(csrrwi, x21, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x22, x1, 16, x2)   # Testcase 157
    TEST_CSR_IMM_OP(csrrwi, x22, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x23, x1, 24, x2)   # Testcase 158
    TEST_CSR_IMM_OP(csrrwi, x23, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x24, x1, 32, x2)   # Testcase 159



    

    RVTEST_SIGBASE(x1,signature_33_0)

    TEST_CSR_IMM_OP(csrrwi, x24, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x25, x1, 0, x2)   # Testcase 160
    TEST_CSR_IMM_OP(csrrwi, x25, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x26, x1, 8, x2)   # Testcase 161
    TEST_CSR_IMM_OP(csrrwi, x26, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x27, x1, 16, x2)   # Testcase 162
    TEST_CSR_IMM_OP(csrrwi, x27, 15, mscratch, 0x0, 0xf, 0x0, 0x0, x28, x1, 24, x2)   # Testcase 163
    TEST_CSR_IMM_OP(csrrwi, x28, 30, mscratch, 0x0, 0x1e, 0x0, 0x0, x29, x1, 32, x2)   # Testcase 164



    

    RVTEST_SIGBASE(x2,signature_34_0)

    TEST_CSR_IMM_OP(csrrwi, x29, 29, mscratch, 0x0, 0x1d, 0x0, 0x0, x30, x2, 0, x4)   # Testcase 165
    TEST_CSR_IMM_OP(csrrwi, x30, 27, mscratch, 0x0, 0x1b, 0x0, 0x0, x31, x2, 8, x4)   # Testcase 166
    TEST_CSR_IMM_OP(csrrwi, x31, 23, mscratch, 0x0, 0x17, 0x0, 0x0, x1, x2, 16, x4)   # Testcase 167
    TEST_CSR_IMM_OP(csrrwi, x0, 23, mscratch, 0x0, 0x17, 0x0, 0x1ce2b96b, x3, x2, 24, x4)   # Testcase 168

	
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

