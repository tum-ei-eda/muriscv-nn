// RISC-V Architectural Validation Test VFMUL-VF-SEW32_LMUL2
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
//    SEW=32, LMUL=2
// Description: Testing instruction 'vfmul.vf'.

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
    li x31, 0xc22cd70a
    fmv.s.x f31, x31

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    






    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v30) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v30) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v30, v16, f31, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
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
#endif
    


    li x30, 0xc9712060
    fmv.s.x f30, x30

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    






    # VS2 (v18)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v28) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v28) AFTER  = [d38df2bd 80000000 c9712060 41b8e38a cd97a3de e57ffdfa 4c22cc4c 53631df9]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c 53631df9 bd2ecd96]


    
    vfmul.vf v28, v18, f30



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x53631df9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c22cc4c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd97a3de)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x41b8e38a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x80000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd38df2bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd2ecd96)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x53631df9)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    li x29, 0x333995e6
    fmv.s.x f29, x29

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v26, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    






    # VS2 (v20)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v26) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v26) AFTER  = [5b87e42c bd2ecd96 270689fe 333995e6 00000000 00000000 ab8e4d39 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       1        1        1        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v26, v20, f29, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v26, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xab8e4d39)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x270689fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd2ecd96)
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
#endif
    


    li x28, 0x4996b43e
    fmv.s.x f28, x28

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v22, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    






    # VS2 (v22)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v24) AFTER  = [3f800000 b7c44b1e 659ffebe cc4b7f62 d38df2bd 3d5a80fe 53b16f6f 00000000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v24, v22, f28



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x53b16f6f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3d5a80fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd38df2bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcc4b7f62)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x659ffebe)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    li x27, 0x0
    fmv.s.x f27, x27

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")

    






    # VS2 (v24)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v22) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v22) AFTER  = [333995e6 4996b43e 00000000 3f800000 00000000 43a0fe6a 80000000 c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       1        1        0        1        0        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v22, v24, f27, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x80000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
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
    


    li x26, 0x3f800000
    fmv.s.x f26, x26

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")

    






    # VS2 (v26)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v20) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v20) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 b7c44b1e 43a0fe6a]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v20, v26, f26



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    li x25, 0xb7c44b1e
    fmv.s.x f25, x25

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")

    






    # VS2 (v28)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       1        1        1        0        0        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v18) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v18) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        0        0        1        0        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v18, v28, f25, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    


    li x24, 0x43a0fe6a
    fmv.s.x f24, x24

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")

    






    # VS2 (v30)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v16) AFTER  = [4dbd8cd8 00000000 43a0fe6a bbf6e40d 47ca7e03 5faaeb50 c6596456 cd97a3de]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [00000000 43a0fe6a bbf6e40d 47ca7e03 5faaeb50 c6596456 cd97a3de 37696c3f]


    
    vfmul.vf v16, v30, f24



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd97a3de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc6596456)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5faaeb50)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47ca7e03)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbbf6e40d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4dbd8cd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37696c3f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd97a3de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc6596456)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5faaeb50)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47ca7e03)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbbf6e40d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
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
    li x23, 0x5b87e42c
    fmv.s.x f23, x23

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")

    






    # VS2 (v2)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v14) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v14) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v14, v2, f23, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    li x22, 0xc22cd70a
    fmv.s.x f22, x22

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")

    






    # VS2 (v0)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v12) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v12) AFTER  = [3a84875b c6596456 de377ee7 44e96354 4c22cc4c b5fa9935 cc4b7f62 80000000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v12, v0, f22



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x80000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcc4b7f62)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5fa9935)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c22cc4c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x44e96354)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xde377ee7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc6596456)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3a84875b)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    li x21, 0xc9712060
    fmv.s.x f21, x21

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")

    






    # VS2 (v4)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [-------- -------- mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v10) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v10) AFTER  = [333995e6 4996b43e 00000000 41b8e38a cd97a3de e57ffdfa 4c22cc4c c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [-------- -------- mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v10, v4, f21, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c22cc4c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe57ffdfa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd97a3de)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x41b8e38a)
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
    


    li x20, 0x333995e6
    fmv.s.x f20, x20

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")

    






    # VS2 (v6)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v8)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v8)  AFTER  = [5b87e42c c22cd70a c9712060 333995e6 00000000 333995e6 ab8e4d39 37696c3f]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v8, v6, f20



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37696c3f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xab8e4d39)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
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
    




    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    li x19, 0x4996b43e
    fmv.s.x f19, x19

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")

    






    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v6)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v6)  AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        1        1        0        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v6, v8, f19, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v6, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
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
    


    li x18, 0x0
    fmv.s.x f18, x18

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")

    






    # VS2 (v10)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v4)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v4)  AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v4, v10, f18



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    li x17, 0x3f800000
    fmv.s.x f17, x17

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    






    # VS2 (v12)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v2)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v2)  AFTER  = [5b87e42c c9712060 333995e6 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       0        0        1        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 4996b43e 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v2, v12, f17, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v2, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333995e6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
#endif
    


    li x16, 0xb7c44b1e
    fmv.s.x f16, x16

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    






    # VS2 (v14)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v0)  AFTER  = [3016831c bbf6e40d d3d06523 3a84875b 41b8e38a ab8e4d39 c1e71c70 80000000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 80000000 b7c44b1e]


    
    vfmul.vf v0, v14, f16



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
    vse32.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc1e71c70)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xab8e4d39)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x41b8e38a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3a84875b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd3d06523)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbbf6e40d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3016831c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb7c44b1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x80000000)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle32.v v0, (x5)  
    li x15, 0x43a0fe6a
    fmv.s.x f15, x15

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+192
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    






    # VS2 (v16)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        1        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v30) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v30) AFTER  = [333995e6 4996b43e 43a0fe6a bbf6e40d 47ca7e03 5faaeb50 c6596456 c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       1        0        1        1        0        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v30, v16, f15, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v30, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc6596456)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5faaeb50)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47ca7e03)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbbf6e40d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
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
    


    li x14, 0x5b87e42c
    fmv.s.x f14, x14

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+204
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    






    # VS2 (v18)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v28) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v28) AFTER  = [5b87e42c c22cd70a 4f4506eb 659ffebe 00000000 5b87e42c d3d06523 5faaeb50]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v28, v18, f14



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5faaeb50)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x659ffebe)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4f4506eb)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    li x13, 0xc22cd70a
    fmv.s.x f13, x13

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+216
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")

    






    # VS2 (v20)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v26) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v26) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v26, v20, f13, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
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
    


    li x12, 0xc9712060
    fmv.s.x f12, x12

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+228
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")

    






    # VS2 (v22)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v24) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v24) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 4c22cc4c 53631df9]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v24, v22, f12



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x53631df9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c22cc4c)
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle32.v v0, (x5)  
    li x11, 0x333995e6
    fmv.s.x f11, x11

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+240
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")

    






    # VS2 (v24)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v22) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v22) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       1        1        1        1        1        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v22, v24, f11, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
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
#endif
    


    li x10, 0x4996b43e
    fmv.s.x f10, x10

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+252
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")

    






    # VS2 (v26)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v20) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v20) AFTER  = [c1e71c70 4dbd8cd8 659ffebe cc4b7f62 d38df2bd 3d5a80fe 53b16f6f 00000000]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [4dbd8cd8 659ffebe cc4b7f62 d38df2bd 3d5a80fe 53b16f6f 00000000 4996b43e]


    
    vfmul.vf v20, v26, f10



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x53b16f6f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3d5a80fe)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd38df2bd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcc4b7f62)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x659ffebe)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4dbd8cd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc1e71c70)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x53b16f6f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3d5a80fe)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd38df2bd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcc4b7f62)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x659ffebe)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4dbd8cd8)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    li x9, 0x0
    fmv.s.x f9, x9

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+264
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v18, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")

    






    # VS2 (v28)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v18) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v18) AFTER  = [333995e6 4996b43e 00000000 3f800000 00000000 43a0fe6a 80000000 c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       1        1        0        1        0        1        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c 80000000 00000000]


    
    vfmul.vf v18, v28, f9, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v18, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x80000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x80000000)
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
    


    li x8, 0x3f800000
    fmv.s.x f8, x8

    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+276
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m2
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")

    






    # VS2 (v30)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v16) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v16, v30, f8



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
    vse32.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 64
    add x1, x1, x4
#else
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
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle32.v v0, (x9)  
    li x7, 0xb7c44b1e
    fmv.s.x f7, x7

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+288
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")

    






    # VS2 (v2)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       1        1        1        0        0        1        1        0]
    # ELEMENTS          [-------- -------- ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (v14) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v14) AFTER  = [3f800000 b7c44b1e d3d06523 5b87e42c c22cd70a ab8e4d39 c1e71c70 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        0        0        1        0        1        0        1]
    # ELEMENTS          [-------- -------- ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v14, v2, f7, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc1e71c70)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xab8e4d39)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3d06523)
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
    


    li x6, 0x43a0fe6a
    fmv.s.x f6, x6

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+300
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")

    






    # VS2 (v0)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v12) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v12) AFTER  = [333995e6 4996b43e 00000000 3f800000 47ca7e03 5faaeb50 c6596456 cd97a3de]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v12, v0, f6



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd97a3de)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc6596456)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5faaeb50)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x47ca7e03)
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
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    li x5, 0x5b87e42c
    fmv.s.x f5, x5

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+312
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")

    






    # VS2 (v4)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v10) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v10) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # MASK (+1)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]


    
    vfmul.vf v10, v4, f5, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    


    li x4, 0xc22cd70a
    fmv.s.x f4, x4

    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+324
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m2
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")

    






    # VS2 (v6)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v8)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v8)  AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v8, v6, f4



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 64
    add x1, x1, x8
#else
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
    




    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle32.v v0, (x8)  
    li x3, 0xc9712060
    fmv.s.x f3, x3

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+336
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v6, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")

    






    # VS2 (v8)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v6)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v6)  AFTER  = [333995e6 4996b43e 00000000 41b8e38a cd97a3de e57ffdfa 4c22cc4c c22cd70a]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # MASK (+1)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e c9712060 3f800000 b7c44b1e e57ffdfa 5b87e42c 53631df9 bd2ecd96]


    
    vfmul.vf v6, v8, f3, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v6, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c22cc4c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd97a3de)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x41b8e38a)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd2ecd96)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x53631df9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
#endif
    


    li x2, 0x333995e6
    fmv.s.x f2, x2

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+348
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v10, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")

    






    # VS2 (v10)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v4)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v4)  AFTER  = [b5fa9935 bd2ecd96 270689fe 3d5a80fe 00000000 333995e6 ab8e4d39 37696c3f]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # VD (+1) AFTER  = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 37696c3f 4f4506eb]


    
    vfmul.vf v4, v10, f2



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37696c3f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xab8e4d39)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3d5a80fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x270689fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd2ecd96)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb5fa9935)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f4506eb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37696c3f)
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
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    li x1, 0x4996b43e
    fmv.s.x f1, x1

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+360
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")

    






    # VS2 (v12)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (v2)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v2)  AFTER  = [3f800000 b7c44b1e 659ffebe 5b87e42c d38df2bd 3d5a80fe 333995e6 4996b43e]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # MASK (+1)       = [       1        1        1        0        0        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (+1) BEFORE = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # VD (+1) AFTER  = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]


    
    vfmul.vf v2, v12, f1, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3d5a80fe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd38df2bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x659ffebe)
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
    


    li x1, 0x0
    fmv.s.x f0, x1

    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+372
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m2
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")

    






    # VS2 (v14)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v0)  AFTER  = [333995e6 4996b43e 00000000 80000000 00000000 00000000 80000000 80000000]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (+1) BEFORE = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # VD (+1) AFTER  = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]


    
    vfmul.vf v0, v14, f0



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 64
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x80000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x80000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x80000000)
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
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 64, 4, 0xdeadbeef
signature_2_0:
	.fill 64, 4, 0xdeadbeef
signature_3_0:
	.fill 64, 4, 0xdeadbeef
signature_4_0:
	.fill 64, 4, 0xdeadbeef
signature_5_0:
	.fill 64, 4, 0xdeadbeef
signature_6_0:
	.fill 64, 4, 0xdeadbeef
signature_7_0:
	.fill 64, 4, 0xdeadbeef
signature_8_0:
	.fill 64, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

