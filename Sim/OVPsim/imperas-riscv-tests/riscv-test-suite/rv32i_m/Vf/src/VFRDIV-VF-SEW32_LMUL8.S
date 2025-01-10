// RISC-V Architectural Validation Test VFRDIV-VF-SEW32_LMUL8
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
// Specification: V Vector Extension, Version 1.0
// Vector Constant Parameters:
//    VLEN=256, SLEN=256, ELEN=32 FP16=IEEE754
// Test Parameters:
//    SEW=32, LMUL=8
// Description: Testing instruction 'vfrdiv.vf'.

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32GCV")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN





    # enable vector unit
    #   0.9 >= use  9
    # < 0.9    use 23
    # TODO : enable floating point only if required
    li  x1, 1 << 9 | 1 << 13
    csrs mstatus, x1

    # set rounding mode
    li x1,  0
    csrw fcsr, x1



#ifdef TEST_CASE_1



    # address for test results
    RVTEST_SIGBASE(x4,signature_1_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle32.v v0, (x8)  
    li x31, 0x43a0fe6a
    fmv.s.x f31, x31

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m8
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 8, Use Mask = 1, VL = 64\n")

    






    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v24) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # MASK (+2)       = [       1        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [2797a511 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (+3)       = [       0        0        1        1        1        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [5b87e42c c22cd70a 4fde13e6 3988bd53 7f800000 43a0fe6a cb51f69a 3f800000]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+6)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+7)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfrdiv.vf v24, v16, f31, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2797a511)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcb51f69a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3988bd53)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4fde13e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
#endif
    


    li x30, 0x5b87e42c
    fmv.s.x f30, x30

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m8
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    






    # VS2 (v24)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v16) AFTER  = [5166d66f 7f800000 5b87e42c e33139b1 5758157c 3f800000 d8c9461b d1904608]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [7f800000 5b87e42c e33139b1 5758157c 3f800000 d8c9461b d1904608 67bb736c]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+2) AFTER  = [5b87e42c e33139b1 5758157c 3f800000 d8c9461b d1904608 67bb736c 5166d66f]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+3) AFTER  = [e33139b1 5758157c 3f800000 d8c9461b d1904608 67bb736c 5166d66f 7f800000]


    # VS2 (+4)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+4) AFTER  = [5758157c 3f800000 d8c9461b d1904608 67bb736c 5166d66f 7f800000 5b87e42c]


    # VS2 (+5)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+5) AFTER  = [3f800000 d8c9461b d1904608 67bb736c 5166d66f 7f800000 5b87e42c e33139b1]


    # VS2 (+6)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+6) AFTER  = [d8c9461b d1904608 67bb736c 5166d66f 7f800000 5b87e42c e33139b1 5758157c]


    # VS2 (+7)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+7) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 3f800000]


    
    vfrdiv.vf v16, v24, f30



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5758157c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33139b1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5166d66f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67bb736c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1904608)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd8c9461b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    li x29, 0xc22cd70a
    fmv.s.x f29, x29

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m8
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 8, Use Mask = 1, VL = 41\n")

    






    # VS2 (v16)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v8)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v8)  AFTER  = [5b87e42c 3837805a ce6e6b27 333995e6 ff800000 00000000 49e169a9 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       1        1        1        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [3837805a ce6e6b27 b812cd13 ff800000 c22cd70a 49e169a9 be096b20 43a0fe6a]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+2)       = [       1        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+2) AFTER  = [ce6e6b27 333995e6 ff800000 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+3)       = [       0        1        0        0        0        0        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+3) AFTER  = [333995e6 ff800000 00000000 3f800000 b7c44b1e 43a0fe6a 3f800000 3837805a]


    # VS2 (+4)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+4)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+4) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+4) AFTER  = [4996b43e 00000000 3f800000 be096b20 a622cd96 3f800000 3837805a c9712060]


    # VS2 (+5)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # MASK (+5)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+5) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 b812cd13]


    # VS2 (+6)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (+6)       = [       1        1        0        0        0        1        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+6) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+7)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+7)       = [       1        0        1        1        0        1        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+7) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+7) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfrdiv.vf v8, v16, f29, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49e169a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xce6e6b27)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3837805a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbe096b20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49e169a9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb812cd13)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xce6e6b27)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3837805a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xce6e6b27)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3837805a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3837805a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa622cd96)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbe096b20)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb812cd13)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
#endif
    


    li x28, 0xc9712060
    fmv.s.x f28, x28

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m8
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    






    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v0)  AFTER  = [511d3c26 c53fb5dd ad631fc5 46b29224 3f800000 d5a64e9c bf4cccca ff800000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [c53fb5dd ad631fc5 46b29224 3f800000 d5a64e9c bf4cccca ff800000 c9712060]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [ad631fc5 46b29224 3f800000 d5a64e9c bf4cccca ff800000 c9712060 511d3c26]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [46b29224 3f800000 d5a64e9c bf4cccca ff800000 c9712060 511d3c26 c53fb5dd]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfrdiv.vf v0, v8, f28



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m8
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 256
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf4cccca)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5a64e9c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46b29224)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad631fc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc53fb5dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x511d3c26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf4cccca)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5a64e9c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46b29224)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad631fc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc53fb5dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x511d3c26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf4cccca)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5a64e9c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46b29224)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad631fc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc53fb5dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x511d3c26)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf4cccca)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5a64e9c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x46b29224)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    li x27, 0x333995e6
    fmv.s.x f27, x27

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m8
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 8, Use Mask = 1, VL = 23\n")

    






    # VS2 (v8)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v24) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v24) AFTER  = [333995e6 4996b43e 00000000 3f800000 2f138d4c 43a0fe6a b0897060 c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       1        1        0        1        0        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [7f800000 333995e6 3f800000 2f138d4c 43a0fe6a b0897060 a945087a 3f800000]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # MASK (+2)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+2) AFTER  = [00000000 3f800000 2f138d4c 43a0fe6a b0897060 a945087a c9712060 333995e6]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (+3)       = [       1        1        0        0        0        0        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+3) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+4)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+4)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+4) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+4) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+5)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # MASK (+5)       = [       1        1        1        0        0        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+5) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+5) AFTER  = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+6)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (+6)       = [       1        0        0        0        0        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+6) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+6) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+7)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+7)       = [       0        1        0        1        1        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+7) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+7) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfrdiv.vf v24, v8, f27, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb0897060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f138d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa945087a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb0897060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f138d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa945087a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb0897060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2f138d4c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
#endif
    


    li x26, 0x4996b43e
    fmv.s.x f26, x26

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m8
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 8, Use Mask = 0, VL = 16\n")

    






    # VS2 (v0)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v16) AFTER  = [c6df36b0 bfa00002 55cfe246 3f800000 7f800000 4996b43e d1448b32 456fa358]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [bfa00002 55cfe246 3f800000 7f800000 4996b43e d1448b32 456fa358 2d8df3dd]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+2) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+3) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+4)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+4) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    # VS2 (+5)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+5) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]


    # VS2 (+6)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+6) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+7)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+7) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfrdiv.vf v16, v0, f26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x456fa358)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1448b32)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x55cfe246)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbfa00002)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc6df36b0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2d8df3dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x456fa358)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1448b32)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x55cfe246)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbfa00002)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    li x25, 0x0
    fmv.s.x f25, x25

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m8
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 8, Use Mask = 1, VL = 10\n")

    






    # VS2 (v24)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       1        1        1        0        0        1        1        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (v8)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v8)  AFTER  = [80000000 00000000 00000000 5b87e42c c22cd70a 00000000 00000000 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        0        0        1        0        1        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # MASK (+2)       = [       0        0        1        1        1        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (+3)       = [       0        0        1        1        0        0        1        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+4)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+5)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+6)       = [       0        1        1        1        0        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+7)       = [       1        1        0        0        1        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfrdiv.vf v8, v24, f25, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x80000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
#endif
    


    li x24, 0x3f800000
    fmv.s.x f24, x24

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m8
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 8, Use Mask = 0, VL = 8\n")

    






    # VS2 (v16)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v0)  AFTER  = [35596ec8 7f800000 3f800000 c726ef0b 3b4b8929 23712248 bcbd95f4 b587e53f]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+2) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+3) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+4)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+4) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+5)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+5) AFTER  = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+6)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+6) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+7)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+7) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfrdiv.vf v0, v16, f24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m8
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb587e53f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbcbd95f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x23712248)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3b4b8929)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc726ef0b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x35596ec8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x333995e6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    li x23, 0xb7c44b1e
    fmv.s.x f23, x23

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m8
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 8, Use Mask = 1, VL = 6\n")

    






    # VS2 (v8)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v24) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+2)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+2) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+3)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+3) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+4)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+4)       = [       0        0        1        1        1        1        1        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+4) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    # VS2 (+5)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # MASK (+5)       = [       1        0        1        1        0        1        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+5) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]


    # VS2 (+6)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (+6)       = [       1        0        0        1        0        1        1        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+6) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+7)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+7)       = [       0        1        0        0        1        0        0        1]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+7) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfrdiv.vf v24, v8, f23, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
#endif
    


    li x22, 0x43a0fe6a
    fmv.s.x f22, x22

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m8
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 8, Use Mask = 0, VL = 4\n")

    






    # VS2 (v0)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v16) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c b9aaecaa 4fde13e6 3988bd53 7f800000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfrdiv.vf v16, v0, f22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3988bd53)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4fde13e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb9aaecaa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    li x21, 0x5b87e42c
    fmv.s.x f21, x21

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m8
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 8, Use Mask = 1, VL = 2\n")

    






    # VS2 (v24)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (v8)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v8)  AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a d8c9461b c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # MASK (+2)       = [       1        1        0        0        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+2) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+2) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (+3)       = [       1        0        1        1        0        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+3) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+3) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+4)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+4)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+4) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+4) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    # VS2 (+5)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # MASK (+5)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+5) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+5) AFTER  = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]


    # VS2 (+6)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (+6)       = [       1        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+6) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+6) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+7)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+7)       = [       0        0        1        1        1        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (+7) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+7) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfrdiv.vf v8, v24, f21, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd8c9461b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
#endif
    


    li x20, 0xc22cd70a
    fmv.s.x f20, x20

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m8
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 8, Use Mask = 0, VL = 0\n")

    






    # VS2 (v16)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v0)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v0)  AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+2) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+2) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+3) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+3) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+4)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+4) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+4) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    # VS2 (+5)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+5) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+5) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]


    # VS2 (+6)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+6) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+6) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+7)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+7) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+7) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfrdiv.vf v0, v16, f20



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m8
    vse32.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 256
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    li x19, 0xc9712060
    fmv.s.x f19, x19

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m8
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 8, Use Mask = 1, VL = 64\n")

    






    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (v24) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v24) AFTER  = [3f800000 b7c44b1e ad631fc5 5b87e42c 3f800000 d5a64e9c 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        1        1        0        0        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [c53fb5dd ad631fc5 46b29224 c22cd70a c9712060 bf4cccca 4996b43e 00000000]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # MASK (+2)       = [       1        0        0        0        0        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [ad631fc5 5b87e42c c22cd70a c9712060 333995e6 ff800000 c9712060 511d3c26]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (+3)       = [       0        1        0        1        1        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [5b87e42c 3f800000 c9712060 bf4cccca ff800000 00000000 511d3c26 c53fb5dd]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+4)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a d5a64e9c bf4cccca 4996b43e c9712060 3f800000 c53fb5dd 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+5)       = [       1        1        1        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [d5a64e9c bf4cccca ff800000 c9712060 511d3c26 c53fb5dd ad631fc5 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+6)       = [       1        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [bf4cccca 4996b43e c9712060 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+7)       = [       0        1        0        0        0        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e c9712060 3f800000 b7c44b1e 43a0fe6a 5b87e42c 3f800000 d5a64e9c]


    
    vfrdiv.vf v24, v8, f19, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v24, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5a64e9c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xad631fc5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbf4cccca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x46b29224)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xad631fc5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc53fb5dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x511d3c26)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xad631fc5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc53fb5dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x511d3c26)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbf4cccca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc53fb5dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbf4cccca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5a64e9c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xad631fc5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc53fb5dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x511d3c26)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbf4cccca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5a64e9c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbf4cccca)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5a64e9c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
#endif
    


    li x18, 0x333995e6
    fmv.s.x f18, x18

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m8
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 8, Use Mask = 0, VL = 57\n")

    






    # VS2 (v0)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v16) AFTER  = [291da060 7f800000 333995e6 baf208fc 2f138d4c 172ecef8 b0897060 a945087a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [7f800000 333995e6 baf208fc 2f138d4c 172ecef8 b0897060 a945087a 3f800000]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+2) AFTER  = [333995e6 baf208fc 2f138d4c 172ecef8 b0897060 a945087a 3f800000 291da060]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+3) AFTER  = [baf208fc 2f138d4c 172ecef8 b0897060 a945087a 3f800000 291da060 7f800000]


    # VS2 (+4)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+4) AFTER  = [2f138d4c 172ecef8 b0897060 a945087a 3f800000 291da060 7f800000 333995e6]


    # VS2 (+5)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+5) AFTER  = [172ecef8 b0897060 a945087a 3f800000 291da060 7f800000 333995e6 baf208fc]


    # VS2 (+6)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+6) AFTER  = [b0897060 a945087a 3f800000 291da060 7f800000 333995e6 baf208fc 2f138d4c]


    # VS2 (+7)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+7) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 172ecef8]


    
    vfrdiv.vf v16, v0, f18



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2f138d4c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbaf208fc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x291da060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa945087a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb0897060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x172ecef8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    li x17, 0x4996b43e
    fmv.s.x f17, x17

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m8
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 8, Use Mask = 1, VL = 41\n")

    






    # VS2 (v24)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v8)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v8)  AFTER  = [5b87e42c bfa00002 55cfe246 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 3f800000 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # MASK (+2)       = [       0        1        1        1        0        0        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+2) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+2) AFTER  = [c9712060 3f800000 7f800000 4996b43e 3f800000 b7c44b1e 43a0fe6a c6df36b0]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (+3)       = [       1        1        0        0        1        0        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+3) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+3) AFTER  = [3f800000 7f800000 00000000 3f800000 456fa358 43a0fe6a 5b87e42c bfa00002]


    # VS2 (+4)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+4)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+4) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+4) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 2d8df3dd 5b87e42c bfa00002 c9712060]


    # VS2 (+5)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # MASK (+5)       = [       1        1        0        1        0        1        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+5) BEFORE = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # VD (+5) AFTER  = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 3f800000]


    # VS2 (+6)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (+6)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+6) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (+6) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+7)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+7)       = [       1        1        0        0        0        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+7) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+7) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfrdiv.vf v8, v24, f17, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x55cfe246)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbfa00002)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc6df36b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbfa00002)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x456fa358)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbfa00002)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2d8df3dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
#endif
    


    li x16, 0x0
    fmv.s.x f16, x16

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m8
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e32,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 8, Use Mask = 0, VL = 32\n")

    






    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v0)  AFTER  = [80000000 00000000 00000000 80000000 80000000 00000000 00000000 7fc00000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [00000000 00000000 80000000 80000000 00000000 00000000 7fc00000 00000000]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+2) BEFORE = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # VD (+2) AFTER  = [00000000 80000000 80000000 00000000 00000000 7fc00000 00000000 80000000]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+3) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (+3) AFTER  = [80000000 80000000 00000000 00000000 7fc00000 00000000 80000000 00000000]


    # VS2 (+4)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+4) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+4) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+5)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+5) BEFORE = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # VD (+5) AFTER  = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]


    # VS2 (+6)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+6) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (+6) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+7)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+7) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+7) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfrdiv.vf v0, v16, f16



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m8
    vse32.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 256
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fc00000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fc00000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fc00000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fc00000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3f800000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
#endif
    

	
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe

# Input data section.
	.data

	.align 4
test_1_data:
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000

	.align 4
test_1_maskdata:
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
	.word 0x4996b43e
	.word 0x333995e6
	.word 0xc9712060
	.word 0xc22cd70a
	.word 0x5b87e42c
	.word 0x43a0fe6a
	.word 0xb7c44b1e
	.word 0x3f800000
	.word 0x0
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 256, 4, 0xdeadbeef
signature_2_0:
	.fill 256, 4, 0xdeadbeef
signature_3_0:
	.fill 256, 4, 0xdeadbeef
signature_4_0:
	.fill 256, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

