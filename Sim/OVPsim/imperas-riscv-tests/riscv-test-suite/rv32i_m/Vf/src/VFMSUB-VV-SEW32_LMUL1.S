// RISC-V Architectural Validation Test VFMSUB-VV-SEW32_LMUL1
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
//    SEW=32, LMUL=1
// Description: Testing instruction 'vfmsub.vv'.

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
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    vsetvli x0, x7, e32,m1
    vle32.v v1, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v31, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v1)        = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v31) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v31) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    
    
    vfmsub.vv v31, v1, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v31, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e32,m1
    vle32.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v17, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v0)        = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v17)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v30) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v30) AFTER  = [333995e6 4996b43e bf800000 43a0fe6b d3d06523 db87e42c e57ffdfa 49712060]


    
    
    vfmsub.vv v30, v0, v17
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdb87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd3d06523)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e32,m1
    vle32.v v2, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v29, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 4 # VL = 4
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 1, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v2)        = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v18)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v29) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v29) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 43a0fe6b b7c44b1e]


    
    
    vfmsub.vv v29, v2, v18, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v29, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6b)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e32,m1
    vle32.v v3, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v19, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 2 # VL = 2
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 1, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v3)        = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v19)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v28) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v28) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 c996b43e 4996b43e]


    
    
    vfmsub.vv v28, v3, v19
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc996b43e)
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
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e32,m1
    vle32.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v27, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 1, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v4)        = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v20)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v27) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v27) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    
    
    vfmsub.vv v27, v4, v20, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v27, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    vsetvli x0, x8, e32,m1
    vle32.v v5, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v21, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 1, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v5)        = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v21)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v26) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v26) AFTER  = [e57ffdfa 49712060 d38df2bd c996b43e 4996b43e bf800000 43a0fe6b d3d06523]


    
    
    vfmsub.vv v26, v5, v21
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3d06523)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbf800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd38df2bd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x49712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe57ffdfa)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e32,m1
    vle32.v v6, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v25, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 1, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v6)        = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v22)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       1        1        1        0        0        1        1        0]
    # ELEMENTS          [-------- -------- ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff mmmmmmmm]
    # VD (v25) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v25) AFTER  = [3f800000 b7c44b1e db87e42c 5b87e42c c22cd70a d38df2bd c996b43e 4996b43e]


    
    
    vfmsub.vv v25, v6, v22, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v25, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd38df2bd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc22cd70a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdb87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb7c44b1e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3f800000)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e32,m1
    vle32.v v7, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v23, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 1, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v7)        = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v23)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v24) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v24) AFTER  = [333995e6 4996b43e 00000000 3f800000 d3d06523 db87e42c e57ffdfa 49712060]


    
    
    vfmsub.vv v24, v7, v23
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x49712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe57ffdfa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdb87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3d06523)
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
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e32,m1
    vle32.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v23, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 1, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v8)        = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v24)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v23) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v23) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    
    
    vfmsub.vv v23, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v23, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    vsetvli x0, x4, e32,m1
    vle32.v v9, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v25, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 1, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v9)        = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v25)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v22) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v22) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    
    
    vfmsub.vv v22, v9, v25
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    vsetvli x0, x4, e32,m1
    vle32.v v10, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v21, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v10)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v26)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v21) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v21) AFTER  = [333995e6 4996b43e 00000000 43a0fe6b d3d06523 db87e42c e57ffdfa c22cd70a]


    
    
    vfmsub.vv v21, v10, v26, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v21, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe57ffdfa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdb87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    vsetvli x0, x4, e32,m1
    vle32.v v11, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v27, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v11)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v27)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v20) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v20) AFTER  = [5b87e42c c22cd70a d38df2bd c996b43e 4996b43e bf800000 43a0fe6b d3d06523]


    
    
    vfmsub.vv v20, v11, v27
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbf800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd38df2bd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
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
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e32,m1
    vle32.v v12, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v28, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v19, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 1, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v12)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v28)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (v19) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v19) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c 49712060 d38df2bd 333995e6 4996b43e]


    
    
    vfmsub.vv v19, v12, v28, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m1
    vse32.v v19, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd38df2bd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49712060)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e32,m1
    vle32.v v13, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v29, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v18, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 1, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v13)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v29)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v18) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v18) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a e57ffdfa 49712060]


    
    
    vfmsub.vv v18, v13, v29
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m1
    vse32.v v18, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe57ffdfa)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e32,m1
    vle32.v v14, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v30, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v17, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 1, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v14)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v30)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v17) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v17) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    
    
    vfmsub.vv v17, v14, v30, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m1
    vse32.v v17, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc22cd70a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b87e42c)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    vsetvli x0, x8, e32,m1
    vle32.v v15, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v31, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m1
    vle32.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 1, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v15)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v31)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v16) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v16) AFTER  = [43a0fe6b d3d06523 db87e42c e57ffdfa 49712060 d38df2bd c996b43e 4996b43e]


    
    
    vfmsub.vv v16, v15, v31
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m1
    vse32.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc996b43e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd38df2bd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x49712060)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe57ffdfa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdb87e42c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd3d06523)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6b)
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
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    vsetvli x0, x4, e32,m1
    vle32.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v1, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v15, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 1, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v16)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v1)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        1        1        1        1        1        0]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff mmmmmmmm]
    # VD (v15) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v15) AFTER  = [333995e6 4996b43e bf800000 43a0fe6b d3d06523 db87e42c e57ffdfa c22cd70a]


    
    
    vfmsub.vv v15, v16, v1, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v15, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe57ffdfa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdb87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbf800000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x333995e6)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    vsetvli x0, x4, e32,m1
    vle32.v v17, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 1, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v17)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v0)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v14) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v14) AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e bf800000 43a0fe6b d3d06523]


    
    
    vfmsub.vv v14, v17, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbf800000)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    vsetvli x0, x4, e32,m1
    vle32.v v18, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v13, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 1, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v18)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v2)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- mmmmmmmm mmmmmmmm]
    # VD (v13) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v13) AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    
    
    vfmsub.vv v13, v18, v2, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v13, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    vsetvli x0, x4, e32,m1
    vle32.v v19, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v3, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 1, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v19)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v3)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v12) BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v12) AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]


    
    
    vfmsub.vv v12, v19, v3
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
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
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    vsetvli x0, x4, e32,m1
    vle32.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v11, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v20)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v4)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        1        1        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v11) BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v11) AFTER  = [5b87e42c 49712060 d38df2bd 333995e6 4996b43e 00000000 43a0fe6b b7c44b1e]


    
    
    vfmsub.vv v11, v20, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v11, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd38df2bd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x49712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b87e42c)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    vsetvli x0, x4, e32,m1
    vle32.v v21, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v5, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v21)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v5)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v10) BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v10) AFTER  = [3f800000 b7c44b1e db87e42c e57ffdfa 49712060 d38df2bd c996b43e 4996b43e]


    
    
    vfmsub.vv v10, v21, v5
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc996b43e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd38df2bd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x49712060)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe57ffdfa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdb87e42c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb7c44b1e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3f800000)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    vsetvli x0, x4, e32,m1
    vle32.v v22, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v9, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 1, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v22)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v6)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        0        1        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff mmmmmmmm ffffffff mmmmmmmm]
    # VD (v9)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v9)  AFTER  = [333995e6 4996b43e 00000000 3f800000 d3d06523 43a0fe6a e57ffdfa c22cd70a]


    
    
    vfmsub.vv v9, v22, v6, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v9, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc22cd70a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe57ffdfa)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    vsetvli x0, x4, e32,m1
    vle32.v v23, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v7, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m1
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 1, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v23)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v7)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]
    # VD (v8)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v8)  AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 43a0fe6b d3d06523]


    
    
    vfmsub.vv v8, v23, v7
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m1
    vse32.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd3d06523)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6b)
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
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    vsetvli x0, x8, e32,m1
    vle32.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v7, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 1, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v24)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       1        1        1        0        0        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v7)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v7)  AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]


    
    
    vfmsub.vv v7, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v7, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    vsetvli x0, x8, e32,m1
    vle32.v v25, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v9, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v6, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 1, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v25)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v9)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v6)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v6)  AFTER  = [c996b43e 4996b43e bf800000 43a0fe6b d3d06523 db87e42c e57ffdfa 49712060]


    
    
    vfmsub.vv v6, v25, v9
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v6, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x49712060)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe57ffdfa)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdb87e42c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3d06523)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xbf800000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc996b43e)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    vsetvli x0, x8, e32,m1
    vle32.v v26, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v10, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v5, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 1, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v26)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v10)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # MASK (v0)       = [       0        0        0        0        0        0        0        0]
    # ELEMENTS          [-------- -------- mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm]
    # VD (v5)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v5)  AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    
    
    vfmsub.vv v5, v26, v10, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v5, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+324
    vsetvli x0, x8, e32,m1
    vle32.v v27, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v11, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m1
    vle32.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 1, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v27)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v11)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]
    # VD (v4)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v4)  AFTER  = [3f800000 b7c44b1e 43a0fe6a 5b87e42c 49712060 d38df2bd c996b43e 4996b43e]


    
    
    vfmsub.vv v4, v27, v11
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m1
    vse32.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc996b43e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd38df2bd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x49712060)
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
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    vsetvli x0, x7, e32,m1
    vle32.v v28, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v3, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 2 # VL = 2
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 1, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v28)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v12)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # MASK (v0)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]
    # VD (v3)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v3)  AFTER  = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a e57ffdfa c22cd70a]


    
    
    vfmsub.vv v3, v28, v12, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v3, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc22cd70a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    vsetvli x0, x7, e32,m1
    vle32.v v29, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v13, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 0 # VL = 0
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 1, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v29)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]

    # VS2 (v13)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]
    # VD (v2)  BEFORE = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # VD (v2)  AFTER  = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]


    
    
    vfmsub.vv v2, v29, v13
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    vsetvli x0, x7, e32,m1
    vle32.v v30, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v1, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v30)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]

    # VS2 (v14)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # MASK (v0)       = [       0        0        1        0        1        1        0        0]
    # ELEMENTS          [mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff mmmmmmmm mmmmmmmm]
    # VD (v1)  BEFORE = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # VD (v1)  AFTER  = [3f800000 b7c44b1e db87e42c 5b87e42c 49712060 d38df2bd 333995e6 4996b43e]


    
    
    vfmsub.vv v1, v30, v14, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v1, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd38df2bd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdb87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb7c44b1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3f800000)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+372
    vsetvli x0, x7, e32,m1
    vle32.v v31, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v15, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m1
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v31)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]

    # VS2 (v15)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]
    # VD (v0)  BEFORE = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # VD (v0)  AFTER  = [333995e6 4996b43e bf800000 43a0fe6b d3d06523 db87e42c e57ffdfa 49712060]


    
    
    vfmsub.vv v0, v31, v15
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m1
    vse32.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49712060)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe57ffdfa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdb87e42c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd3d06523)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbf800000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4996b43e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x333995e6)
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
	.fill 32, 4, 0xdeadbeef
signature_2_0:
	.fill 32, 4, 0xdeadbeef
signature_3_0:
	.fill 32, 4, 0xdeadbeef
signature_4_0:
	.fill 32, 4, 0xdeadbeef
signature_5_0:
	.fill 32, 4, 0xdeadbeef
signature_6_0:
	.fill 32, 4, 0xdeadbeef
signature_7_0:
	.fill 32, 4, 0xdeadbeef
signature_8_0:
	.fill 32, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

