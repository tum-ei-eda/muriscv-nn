// RISC-V Architectural Validation Test VSRL-VV-SEW16_LMUL1
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
//    SEW=16, LMUL=1
// Description: Testing instruction 'vsrl.vv'.

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
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    vsetvli x0, x7, e16,m1
    vle16.v v1, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v31, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v1)        = [e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27 151a 01ef]

    # VS2 (v16)       = [c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27]
    # MASK (v0)       = [   0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # VD (v31) BEFORE = [e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d]
    # VD (v31) AFTER  = [e54c 8c1e c737 ad3a e31f fa64 0466 0003 48d4 6afe 0000 d5fd 010a 01bc 0021 0001]


    
    
    vsrl.vv v31, v16, v1, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v31, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00210001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x010a01bc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0000d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48d46afe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04660003)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffa64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c1e)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e16,m1
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v17, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v30, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v0)        = [7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51]

    # VS2 (v17)       = [0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v30) BEFORE = [2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65]
    # VD (v30) AFTER  = [2c63 c847 0692 dadf 7ca6 60db 0001 0ad3 038c 0001 0000 0128 00bd 0003 48d4 6afe]


    
    
    vsrl.vv v30, v17, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x48d46afe)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00bd0003)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000128)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x038c0001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00010ad3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca660db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63c847)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e16,m1
    vle16.v v2, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v29, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v2)        = [fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f]

    # VS2 (v18)       = [195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64]
    # MASK (v0)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # VD (v29) BEFORE = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a]
    # VD (v29) AFTER  = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0007 0001 7ca6 0023 e54c 0ad3 c737 ad3a]


    
    
    vsrl.vv v29, v18, v2, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v29, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c0ad3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca60023)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00070001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf600a3d1)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e16,m1
    vle16.v v3, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v19, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v3)        = [34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e]

    # VS2 (v19)       = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v28) BEFORE = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf]
    # VD (v28) AFTER  = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf 0b18 0001 001a 001b 0007 0001]


    
    
    vsrl.vv v28, v19, v3
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00070001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x001a001b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0b180001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf600a3d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b80fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34267ad9)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e16,m1
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v27, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 1, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v4)        = [6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847]

    # VS2 (v20)       = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # MASK (v0)       = [   0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff]
    # VD (v27) BEFORE = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf]
    # VD (v27) AFTER  = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 00c5 1f77 00f5]


    
    
    vsrl.vv v27, v20, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v27, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1f7700f5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf60000c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3aef5ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02d663e)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    vsetvli x0, x8, e16,m1
    vle16.v v5, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v21, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v26, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 1, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v5)        = [b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1]

    # VS2 (v21)       = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v26) BEFORE = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # VD (v26) AFTER  = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 34b8 07ea]


    
    
    vsrl.vv v26, v21, v5
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b807ea)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02d663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e16,m1
    vle16.v v6, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v25, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 1, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v6)        = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]

    # VS2 (v22)       = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # MASK (v0)       = [   1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v25) BEFORE = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # VD (v25) AFTER  = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]


    
    
    vsrl.vv v25, v22, v6, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v25, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02d663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x824d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    vsetvli x0, x8, e16,m1
    vle16.v v7, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v23, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 1, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v7)        = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]

    # VS2 (v23)       = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # VD (v24) AFTER  = [001a 7dd8 0001 1e18 0003 0203 0018 88d5 1a93 0001 0002 0002 1049 01cd 0005 0003]


    
    
    vsrl.vv v24, v23, v7
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00050003)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x104901cd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00020002)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1a930001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x001888d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00030203)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00011e18)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x001a7dd8)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e16,m1
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v23, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 1, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v8)        = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]

    # VS2 (v24)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (v0)       = [   1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # VD (v23) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (v23) AFTER  = [3874 f8a5 5b08 6787 62f6 cb6d a968 7dd8 d1bc 7dd8 c83b 0203 37bf 88d5 18fc 0001]


    
    
    vsrl.vv v23, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v23, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc0001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b0203)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa9687dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    vsetvli x0, x4, e16,m1
    vle16.v v9, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v25, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v22, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 1, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v9)        = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]

    # VS2 (v25)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v22) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (v22) AFTER  = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 0062 0001 000a 00a9 001a 7dd8 0001 1e18]


    
    
    vsrl.vv v22, v25, v9
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00011e18)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x001a7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000a00a9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00620001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075c1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff09378)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    vsetvli x0, x4, e16,m1
    vle16.v v10, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v21, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 1, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v10)       = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]

    # VS2 (v26)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm mmmm mmmm mmmm ffff]
    # VD (v21) BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (v21) AFTER  = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 0038 c1a2 3874 f8a5 5b08 0001]


    
    
    vsrl.vv v21, v26, v10, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v21, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b080001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0038c1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff09378)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b327ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4c52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5081b)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+132
    vsetvli x0, x4, e16,m1
    vle16.v v11, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v27, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 1, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v11)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]

    # VS2 (v27)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v20) BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (v20) AFTER  = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 04a8 2188 0607 060d]


    
    
    vsrl.vv v20, v27, v11
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0607060d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04a82188)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b327ba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb32a4c52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x03d5081b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2fb1a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b56ed8c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x484605f6)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e16,m1
    vle16.v v12, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v28, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v19, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 1, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v12)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # VS2 (v28)       = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (v0)       = [   0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (v19) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (v19) AFTER  = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b 9b32 4c52]


    
    
    vsrl.vv v19, v28, v12, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m1
    vse16.v v19, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b324c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x17a2fb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeeeb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e16,m1
    vle16.v v13, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v29, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v18, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 1, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v13)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # VS2 (v29)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v18) BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (v18) AFTER  = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]


    
    
    vsrl.vv v18, v29, v13
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m1
    vse16.v v18, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeeeb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c9686)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e16,m1
    vle16.v v14, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v30, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v17, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v14)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # VS2 (v30)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (v0)       = [   1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm ffff mmmm ffff mmmm mmmm mmmm ffff mmmm mmmm ffff mmmm ffff mmmm]
    # VD (v17) BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (v17) AFTER  = [007b e156 f632 0001 e0e9 0237 426b 8dfb da4c 0804 9b1a 8042 0003 cd04 02d6 848f]


    
    
    vsrl.vv v17, v30, v14, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m1
    vse16.v v17, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x02d6848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0003cd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c0804)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e90237)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6320001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007be156)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    vsetvli x0, x8, e16,m1
    vle16.v v15, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v31, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m1
    vle16.v v16, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v15)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # VS2 (v31)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (v16) AFTER  = [f22b 6484 86b0 81d4 4bfb 003d 007b 0003 001c 0001 0004 0237 0036 25a1 04d8 0804]


    
    
    vsrl.vv v16, v31, v15
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m1
    vse16.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x04d80804)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x003625a1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00040237)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x001c0001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007b0003)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    vsetvli x0, x4, e16,m1
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v1, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v15, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v16)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # VS2 (v1)        = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (v0)       = [   0    0    0    0    0    1    0    0    1    1    1    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm ffff mmmm ffff]
    # VD (v15) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (v15) AFTER  = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 097f 0000 1cec 003d 73b3 0003 f632 0001]


    
    
    vsrl.vv v15, v1, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v15, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6320001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b30003)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1cec003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x097f0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    vsetvli x0, x4, e16,m1
    vle16.v v17, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v14, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v17)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # VS2 (v0)        = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v14) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (v14) AFTER  = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 f22b 0648 0010 0004 097f 0000]


    
    
    vsrl.vv v14, v0, v17
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x097f0000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00100004)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b0648)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    vsetvli x0, x4, e16,m1
    vle16.v v18, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v13, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 16, LMUL = 1, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v18)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # VS2 (v2)        = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (v0)       = [   0    0    1    0    0    0    1    0    1    0    1    1    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm ffff]
    # VD (v13) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (v13) AFTER  = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 0cc9 00d6 0cc9 0667]


    
    
    vsrl.vv v13, v2, v18, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v13, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc90667)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc900d6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x05252532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    vsetvli x0, x4, e16,m1
    vle16.v v19, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v3, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 16, LMUL = 1, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v19)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # VS2 (v3)        = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v12) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (v12) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0002 000b]


    
    
    vsrl.vv v12, v3, v19
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0002000b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa2167b52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9fcbe57f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    vsetvli x0, x4, e16,m1
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v11, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 16, LMUL = 1, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v20)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # VS2 (v4)        = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (v0)       = [   1    1    0    0    1    1    0    0    1    0    1    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v11) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (v11) AFTER  = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]


    
    
    vsrl.vv v11, v4, v20, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v11, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f674b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x445da8cc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    vsetvli x0, x4, e16,m1
    vle16.v v21, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v5, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v10, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 16, LMUL = 1, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v21)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # VS2 (v5)        = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v10) BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (v10) AFTER  = [0188 0bae 0005 0004 0001 021b 0293 0040 0007 000f 222e 0054 0004 040f 045f 2b45]


    
    
    vsrl.vv v10, v5, v21
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x045f2b45)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0004040f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x222e0054)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0007000f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x02930040)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001021b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00050004)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x01880bae)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    vsetvli x0, x4, e16,m1
    vle16.v v22, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v9, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 16, LMUL = 1, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v22)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # VS2 (v6)        = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (v0)       = [   1    0    1    0    1    1    1    0    1    0    1    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff mmmm ffff mmmm ffff mmmm ffff ffff ffff mmmm]
    # VD (v9)  BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (v9)  AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 0188 658c 0005 5d71 0001 93b3 0293 0040 0007 81e3]


    
    
    vsrl.vv v9, v6, v22, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v9, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000781e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x02930040)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000193b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00055d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0188658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    vsetvli x0, x4, e16,m1
    vle16.v v23, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v7, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m1
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 16, LMUL = 1, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v23)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # VS2 (v7)        = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (v8)  AFTER  = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 47c6 000f 0002 32c6 0188 0bae 0005 0004]


    
    
    vsrl.vv v8, v7, v23
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m1
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00050004)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x01880bae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000232c6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6000f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    vsetvli x0, x8, e16,m1
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v7, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 16, LMUL = 1, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v24)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # VS2 (v8)        = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # MASK (v0)       = [   0    1    0    0    1    1    1    1    0    0    1    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm ffff mmmm mmmm]
    # VD (v7)  BEFORE = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # VD (v7)  AFTER  = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 13b6 0001 4ed8 002e c3a2 2eae]


    
    
    vsrl.vv v7, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v7, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed8002e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x13b60001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7a568f0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66652ebf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    vsetvli x0, x8, e16,m1
    vle16.v v25, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v9, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v6, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 16, LMUL = 1, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v25)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # VS2 (v9)        = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v6)  BEFORE = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # VD (v6)  AFTER  = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf 0136 0009 00e6 0284]


    
    
    vsrl.vv v6, v9, v25
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v6, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00e60284)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x01360009)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66652ebf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    vsetvli x0, x8, e16,m1
    vle16.v v26, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v10, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v5, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 16, LMUL = 1, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v26)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # VS2 (v10)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # MASK (v0)       = [   1    1    1    1    0    0    1    1    0    0    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff mmmm]
    # VD (v5)  BEFORE = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # VD (v5)  AFTER  = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f 0333 dfe1]


    
    
    vsrl.vv v5, v10, v26, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v5, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0333dfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0154f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45120b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+324
    vsetvli x0, x8, e16,m1
    vle16.v v27, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v11, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m1
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 16, LMUL = 1, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v27)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # VS2 (v11)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v4)  BEFORE = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # VD (v4)  AFTER  = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]


    
    
    vsrl.vv v4, v11, v27
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m1
    vse16.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45120b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    vsetvli x0, x7, e16,m1
    vle16.v v28, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v3, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 16, LMUL = 1, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v28)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # VS2 (v12)       = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # MASK (v0)       = [   0    1    1    1    1    1    0    1    0    1    0    0    1    0    1    1]
    # ELEMENTS          [mmmm ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm ffff mmmm ffff ffff]
    # VD (v3)  BEFORE = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # VD (v3)  AFTER  = [700a 0122 16c9 0007 000c 031c 65e3 0c33 982b 005e dbee 5e94 0988 23d8 0006 0000]


    
    
    vsrl.vv v3, v12, v28, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v3, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00060000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x098823d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982b005e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e30c33)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000c031c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x16c90007)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a0122)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    vsetvli x0, x7, e16,m1
    vle16.v v29, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v13, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 16, LMUL = 1, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v29)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]

    # VS2 (v13)       = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v2)  BEFORE = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # VD (v2)  AFTER  = [355e 64a2 04b1 1e73 63b9 1dcd 0010 0122 16c9 0007 000c 031c 0002 0c33 36fb 005e]


    
    
    vsrl.vv v2, v13, v29
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x36fb005e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00020c33)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000c031c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x16c90007)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00100122)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    vsetvli x0, x7, e16,m1
    vle16.v v30, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v1, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 16, LMUL = 1, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v30)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]

    # VS2 (v14)       = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # MASK (v0)       = [   0    0    0    1    1    1    1    0    1    1    0    0    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff mmmm mmmm ffff ffff ffff ffff]
    # VD (v1)  BEFORE = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # VD (v1)  AFTER  = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 0018 0000 63b9 1dcd 0010 0122 16c9 0007]


    
    
    vsrl.vv v1, v14, v30, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v1, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x16c90007)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00100122)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00180000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4ecba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd1b37e5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+372
    vsetvli x0, x7, e16,m1
    vle16.v v31, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v15, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m1
    vle16.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e16,m1 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 16, LMUL = 1, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v31)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]

    # VS2 (v15)       = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # VD (v0)  AFTER  = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 1aaf 0c94 0002 0000 0018 0000]


    
    
    vsrl.vv v0, v15, v31
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m1
    vse16.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00180000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00020000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1aaf0c94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8b4ecba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd1b37e5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f031546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e804)
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
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51
	.word 0x91a8d5fd
	.word 0xbd8f6c65
	.word 0x466250f
	.word 0xe31ffa64
	.word 0xc737ad3a
	.word 0xe54c8c1e
	.word 0x7ca660db
	.word 0x692dadf
	.word 0x2c63c847
	.word 0xfbba7ae7
	.word 0x195b62bf
	.word 0xf600a3d1
	.word 0x34b80fd4
	.word 0x3aef5ff4
	.word 0x34267ad9
	.word 0x681454c0
	.word 0x67dd3492
	.word 0xb02d663e
	.word 0xb2d3f1c5
	.word 0x824d39ae
	.word 0x5233a4dd
	.word 0xd4983650
	.word 0x18fc88d5
	.word 0x37bf4071
	.word 0xc83b3c30
	.word 0xd1bc7dd8
	.word 0xa968a97f
	.word 0x62f6cb6d
	.word 0x5b086787
	.word 0x3874f8a5
	.word 0x6075c1a2
	.word 0x951e8621
	.word 0x4ff09378
	.word 0x9b327ba8
	.word 0xb32a4c52
	.word 0x3d5081b
	.word 0x17a2fb1a
	.word 0xb56ed8c
	.word 0x484605f6
	.word 0xb5aeeeb5
	.word 0xfc9d848f
	.word 0x8dd5cd04
	.word 0x9b1a8042
	.word 0xda4c9686
	.word 0x426b8dfb
	.word 0xe0e9092c
	.word 0xf6323d52
	.word 0x73b3e156
	.word 0x4bfb003d
	.word 0x86b081d4
	.word 0xf22b6484
	.word 0x93b06678
	.word 0xcc9d6c8
	.word 0x3b9b3ddc
	.word 0x169dbce8
	.word 0x5252532
	.word 0xa2167b52
	.word 0x9fcbe57f
	.word 0xe92f674b
	.word 0x97056592
	.word 0x8bfcad15
	.word 0x4e1181e9
	.word 0x445da8cc
	.word 0xea35fe19
	.word 0x527e81e3
	.word 0x79e910dd
	.word 0xbe793b3
	.word 0xc47c5d71
	.word 0x24e0658c
	.word 0x47c6f638
	.word 0xc3a22eae
	.word 0x4ed86866
	.word 0xe6b6a11c
	.word 0x4daa96d5
	.word 0xd7a568f0
	.word 0x66652ebf
	.word 0xdfcadfe1
	.word 0x3be0154f
	.word 0x69150191
	.word 0xf1bcd84d
	.word 0x734b985d
	.word 0x353308fb
	.word 0x4c45120b
	.word 0xfde223d8
	.word 0xdbee5e94
	.word 0x982bc336
	.word 0x65e3c70c
	.word 0xb64b71f6
	.word 0x86604880
	.word 0x700a8d4e
	.word 0x63b91dcd
	.word 0x4b11e73
	.word 0x355e64a2
	.word 0x95a74545
	.word 0x8b4ecba8
	.word 0xcd1b37e5
	.word 0x4f031546
	.word 0x918f472f
	.word 0xac98e804
	.word 0x311c98a1
	.word 0x1151057d
	.word 0x995ccbf8
	.word 0x31a201a7
	.word 0xdc447722
	.word 0x7cbaceb7
	.word 0xd2e0a7a
	.word 0x22f6618
	.word 0x8dc09ff
	.word 0xc180944a
	.word 0xa77d21f4
	.word 0x24941503
	.word 0xa6f67a71
	.word 0xf0eda4d8
	.word 0xa918c6bb
	.word 0x9f120f74
	.word 0xc86b2e3b
	.word 0x3909add5
	.word 0xf1fab3f6
	.word 0xe33c2fbf
	.word 0x4736f5f4
	.word 0x603b2dde
	.word 0xbacc4de5
	.word 0x44aae55f
	.word 0x12e38ca6
	.word 0x6b3c04e5
	.word 0xc84ed4c6
	.word 0xc67b650a
	.word 0x411718af
	.word 0x5f294993
	.word 0x62ee6a54
	.word 0x4cdd2e22
	.word 0x786cc1ea
	.word 0x7a6d4845
	.word 0x86249714
	.word 0x906418c8
	.word 0x44dccb49
	.word 0xb197d063
	.word 0x2f09b7ed
	.word 0xda7ea5f6
	.word 0x70ed6ebc
	.word 0x987f22bd
	.word 0x74512906
	.word 0x4bb05389
	.word 0x44d184f7
	.word 0x3b9cb04f
	.word 0xb81a0d11
	.word 0x548542a8
	.word 0xf4bfda8f
	.word 0xb2b93289
	.word 0x42d5763
	.word 0x8fe03374
	.word 0x4b384f2b
	.word 0xc1a7e90b
	.word 0x79452d72
	.word 0xfd34f676
	.word 0x7e27d89a
	.word 0x9dceccb1
	.word 0xe19d838b
	.word 0x266cfb3f
	.word 0x8d1c81a4
	.word 0x18bad9d8
	.word 0xcb271ead
	.word 0x3f400082
	.word 0xfbdcdf34
	.word 0xa7cdb976
	.word 0x75ba9522
	.word 0xc0713693
	.word 0xe8d4430c
	.word 0x773d7f5f
	.word 0x3037aa50
	.word 0x819f731b
	.word 0xebb56d4c
	.word 0xceb5aeae
	.word 0x8cf6a1c1
	.word 0x67e86592
	.word 0xf97058cd
	.word 0xea6648be
	.word 0x9f008c39
	.word 0x6d5ea0d2
	.word 0x6697dc2f
	.word 0x51dac950
	.word 0x2e621f75
	.word 0xdad9549b
	.word 0xf37fa864
	.word 0x89dff0d
	.word 0xe1be6916
	.word 0xc2a7edcf
	.word 0x37a7880f
	.word 0xf1444f34
	.word 0x99a4f8e
	.word 0x68ce0f63
	.word 0x3277cf6a
	.word 0x7a8b59c1
	.word 0xdce388e8
	.word 0x27eb62aa
	.word 0x2c7809b8
	.word 0x143a9e71
	.word 0x851f6e45
	.word 0x579e0a27
	.word 0x77f41975
	.word 0x925ae826
	.word 0x4e7a36bc
	.word 0xb4fc0c9c
	.word 0xf02fa737
	.word 0x2acf336
	.word 0x831b5583
	.word 0xb5fec054
	.word 0xa31e0b3f
	.word 0xd46f3d2c
	.word 0x465bb10f
	.word 0x724fb174
	.word 0x351ea5f0
	.word 0x1e980dee
	.word 0xca495a59
	.word 0xd80b68d2
	.word 0xa3926a57
	.word 0x1d141c8d
	.word 0xa7740fdf
	.word 0x6ea35470
	.word 0xf562a3f1
	.word 0x7917d4b
	.word 0x66da64aa
	.word 0xf682191a
	.word 0xfd2ce83f
	.word 0x67f9ab29
	.word 0x112e3ffd
	.word 0xc4d9b1e2
	.word 0x9ed4e137
	.word 0xb49ae54e
	.word 0xd075dd45
	.word 0x74daa72e
	.word 0x48324db4
	.word 0x167d97b5
	.word 0x8b536536
	.word 0xe85755eb
	.word 0x1cd86c0a
	.word 0x4c811ecf
	.word 0x8085dbf1
	.word 0x547cdce3
	.word 0x65d27882
	.word 0xb72d2ec4
	.word 0x954ee841
	.word 0xb36fd636
	.word 0xbc4988da
	.word 0xaea05c04
	.word 0xce7483a6
	.word 0xea0309d7
	.word 0x62498466
	.word 0x1cd29ac4
	.word 0x97f38b62
	.word 0x690bcf85
	.word 0x9bd83b8b
	.word 0xd0a8c006
	.word 0x2386a257
	.word 0xb489eed8
	.word 0x977e98a0
	.word 0x4731bff5
	.word 0x93e2501e
	.word 0x48de17c3
	.word 0xc0e5cf
	.word 0xa6855c2a
	.word 0xc01a7dc
	.word 0x384fc096
	.word 0x36bf789c
	.word 0xfd869a16
	.word 0xbb19605c
	.word 0x2d273bbd
	.word 0xe16b397b
	.word 0x9d00a14e
	.word 0x50fe4b98
	.word 0x253cc992
	.word 0x7e594151
	.word 0x10e77bca
	.word 0x5d094308
	.word 0xb12c751a
	.word 0xfaef84f7
	.word 0xd181172a
	.word 0xbccc8616
	.word 0xd2fa1cd2
	.word 0x551cfd95
	.word 0x59c52e89
	.word 0xef0924cb
	.word 0xd04ea4e7
	.word 0xd06ec7c2
	.word 0x2639116a
	.word 0xe54e87ef
	.word 0x2ee675ba
	.word 0x6f7002f6
	.word 0x1d84fa23
	.word 0x7767bb23
	.word 0x57ac7256
	.word 0x2f491908
	.word 0x44ed621c
	.word 0x7bcaa8dc
	.word 0x6c3c431a
	.word 0x2a06cf57
	.word 0x3f659017
	.word 0xf1e3fea4
	.word 0xb3e0c121
	.word 0x45d2e222
	.word 0x77d79d1e
	.word 0x2032656c
	.word 0xd7031990
	.word 0x800d4262
	.word 0x4e9df44
	.word 0xec8c6d4f
	.word 0x74a9a596
	.word 0xb569387f
	.word 0xbd833577
	.word 0x1b83e07f
	.word 0xf547817
	.word 0xdfaa34b0
	.word 0xcd14403e
	.word 0x295c6f94
	.word 0x94993e91
	.word 0x1c213ce2
	.word 0x183b02e5
	.word 0x2175b282
	.word 0xf1166f54
	.word 0xd5f6ba2b
	.word 0x32601354
	.word 0xbfe6a880
	.word 0x381b0749
	.word 0x7d7f6861
	.word 0xd95f31c3
	.word 0x7eb3d1d3
	.word 0x43be6c5e
	.word 0x3dbab0c2
	.word 0xb5d75b8f
	.word 0xc68700a2
	.word 0xc624af26
	.word 0x70113c8b
	.word 0x68eb7af6
	.word 0xbe6ea32d
	.word 0x218e671
	.word 0xa7e37497
	.word 0x264c4749
	.word 0x885776a1
	.word 0x69cbb1f5
	.word 0x58c9d5a0
	.word 0x4ba6fddf
	.word 0x98008424
	.word 0x752de7e8
	.word 0xc571a969
	.word 0x63ef1ae1
	.word 0x9018240c
	.word 0x61980374
	.word 0x2126f7a5
	.word 0xdfa5eda5
	.word 0xc418deff
	.word 0x136223e5
	.word 0xfcded42a
	.word 0xb93f57cd
	.word 0x8176e42f
	.word 0xf8e51a1d
	.word 0x4bf71a1
	.word 0x5f9faa48
	.word 0xe26eb508
	.word 0x3a9bb8c
	.word 0x275b43d1
	.word 0x77940364
	.word 0x43e58e91
	.word 0xf69d8ca2
	.word 0x3b8e954e
	.word 0xebb66d85
	.word 0xca167a8e
	.word 0xfda35788
	.word 0x4c5dfab6
	.word 0xb5b4e4b0
	.word 0x7deb0091
	.word 0x1cfbba47
	.word 0x83ef19cf
	.word 0xaa12e574
	.word 0xf8d97f2d
	.word 0xca0d967b
	.word 0x9d3208d8

	.align 4
test_1_maskdata:
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51
	.word 0x91a8d5fd
	.word 0xbd8f6c65
	.word 0x466250f
	.word 0xe31ffa64
	.word 0xc737ad3a
	.word 0xe54c8c1e
	.word 0x7ca660db
	.word 0x692dadf
	.word 0x2c63c847
	.word 0xfbba7ae7
	.word 0x195b62bf
	.word 0xf600a3d1
	.word 0x34b80fd4
	.word 0x3aef5ff4
	.word 0x34267ad9
	.word 0x681454c0
	.word 0x67dd3492
	.word 0xb02d663e
	.word 0xb2d3f1c5
	.word 0x824d39ae
	.word 0x5233a4dd
	.word 0xd4983650
	.word 0x18fc88d5
	.word 0x37bf4071
	.word 0xc83b3c30
	.word 0xd1bc7dd8
	.word 0xa968a97f
	.word 0x62f6cb6d
	.word 0x5b086787
	.word 0x3874f8a5
	.word 0x6075c1a2
	.word 0x951e8621
	.word 0x4ff09378
	.word 0x9b327ba8
	.word 0xb32a4c52
	.word 0x3d5081b
	.word 0x17a2fb1a
	.word 0xb56ed8c
	.word 0x484605f6
	.word 0xb5aeeeb5
	.word 0xfc9d848f
	.word 0x8dd5cd04
	.word 0x9b1a8042
	.word 0xda4c9686
	.word 0x426b8dfb
	.word 0xe0e9092c
	.word 0xf6323d52
	.word 0x73b3e156
	.word 0x4bfb003d
	.word 0x86b081d4
	.word 0xf22b6484
	.word 0x93b06678
	.word 0xcc9d6c8
	.word 0x3b9b3ddc
	.word 0x169dbce8
	.word 0x5252532
	.word 0xa2167b52
	.word 0x9fcbe57f
	.word 0xe92f674b
	.word 0x97056592
	.word 0x8bfcad15
	.word 0x4e1181e9
	.word 0x445da8cc
	.word 0xea35fe19
	.word 0x527e81e3
	.word 0x79e910dd
	.word 0xbe793b3
	.word 0xc47c5d71
	.word 0x24e0658c
	.word 0x47c6f638
	.word 0xc3a22eae
	.word 0x4ed86866
	.word 0xe6b6a11c
	.word 0x4daa96d5
	.word 0xd7a568f0
	.word 0x66652ebf
	.word 0xdfcadfe1
	.word 0x3be0154f
	.word 0x69150191
	.word 0xf1bcd84d
	.word 0x734b985d
	.word 0x353308fb
	.word 0x4c45120b
	.word 0xfde223d8
	.word 0xdbee5e94
	.word 0x982bc336
	.word 0x65e3c70c
	.word 0xb64b71f6
	.word 0x86604880
	.word 0x700a8d4e
	.word 0x63b91dcd
	.word 0x4b11e73
	.word 0x355e64a2
	.word 0x95a74545
	.word 0x8b4ecba8
	.word 0xcd1b37e5
	.word 0x4f031546
	.word 0x918f472f
	.word 0xac98e804
	.word 0x311c98a1
	.word 0x1151057d
	.word 0x995ccbf8
	.word 0x31a201a7
	.word 0xdc447722
	.word 0x7cbaceb7
	.word 0xd2e0a7a
	.word 0x22f6618
	.word 0x8dc09ff
	.word 0xc180944a
	.word 0xa77d21f4
	.word 0x24941503
	.word 0xa6f67a71
	.word 0xf0eda4d8
	.word 0xa918c6bb
	.word 0x9f120f74
	.word 0xc86b2e3b
	.word 0x3909add5
	.word 0xf1fab3f6
	.word 0xe33c2fbf
	.word 0x4736f5f4
	.word 0x603b2dde
	.word 0xbacc4de5
	.word 0x44aae55f
	.word 0x12e38ca6
	.word 0x6b3c04e5
	.word 0xc84ed4c6
	.word 0xc67b650a
	.word 0x411718af
	.word 0x5f294993
	.word 0x62ee6a54
	.word 0x4cdd2e22
	.word 0x786cc1ea
	.word 0x7a6d4845
	.word 0x86249714
	.word 0x906418c8
	.word 0x44dccb49
	.word 0xb197d063
	.word 0x2f09b7ed
	.word 0xda7ea5f6
	.word 0x70ed6ebc
	.word 0x987f22bd
	.word 0x74512906
	.word 0x4bb05389
	.word 0x44d184f7
	.word 0x3b9cb04f
	.word 0xb81a0d11
	.word 0x548542a8
	.word 0xf4bfda8f
	.word 0xb2b93289
	.word 0x42d5763
	.word 0x8fe03374
	.word 0x4b384f2b
	.word 0xc1a7e90b
	.word 0x79452d72
	.word 0xfd34f676
	.word 0x7e27d89a
	.word 0x9dceccb1
	.word 0xe19d838b
	.word 0x266cfb3f
	.word 0x8d1c81a4
	.word 0x18bad9d8
	.word 0xcb271ead
	.word 0x3f400082
	.word 0xfbdcdf34
	.word 0xa7cdb976
	.word 0x75ba9522
	.word 0xc0713693
	.word 0xe8d4430c
	.word 0x773d7f5f
	.word 0x3037aa50
	.word 0x819f731b
	.word 0xebb56d4c
	.word 0xceb5aeae
	.word 0x8cf6a1c1
	.word 0x67e86592
	.word 0xf97058cd
	.word 0xea6648be
	.word 0x9f008c39
	.word 0x6d5ea0d2
	.word 0x6697dc2f
	.word 0x51dac950
	.word 0x2e621f75
	.word 0xdad9549b
	.word 0xf37fa864
	.word 0x89dff0d
	.word 0xe1be6916
	.word 0xc2a7edcf
	.word 0x37a7880f
	.word 0xf1444f34
	.word 0x99a4f8e
	.word 0x68ce0f63
	.word 0x3277cf6a
	.word 0x7a8b59c1
	.word 0xdce388e8
	.word 0x27eb62aa
	.word 0x2c7809b8
	.word 0x143a9e71
	.word 0x851f6e45
	.word 0x579e0a27
	.word 0x77f41975
	.word 0x925ae826
	.word 0x4e7a36bc
	.word 0xb4fc0c9c
	.word 0xf02fa737
	.word 0x2acf336
	.word 0x831b5583
	.word 0xb5fec054
	.word 0xa31e0b3f
	.word 0xd46f3d2c
	.word 0x465bb10f
	.word 0x724fb174
	.word 0x351ea5f0
	.word 0x1e980dee
	.word 0xca495a59
	.word 0xd80b68d2
	.word 0xa3926a57
	.word 0x1d141c8d
	.word 0xa7740fdf
	.word 0x6ea35470
	.word 0xf562a3f1
	.word 0x7917d4b
	.word 0x66da64aa
	.word 0xf682191a
	.word 0xfd2ce83f
	.word 0x67f9ab29
	.word 0x112e3ffd
	.word 0xc4d9b1e2
	.word 0x9ed4e137
	.word 0xb49ae54e
	.word 0xd075dd45
	.word 0x74daa72e
	.word 0x48324db4
	.word 0x167d97b5
	.word 0x8b536536
	.word 0xe85755eb
	.word 0x1cd86c0a
	.word 0x4c811ecf
	.word 0x8085dbf1
	.word 0x547cdce3
	.word 0x65d27882
	.word 0xb72d2ec4
	.word 0x954ee841
	.word 0xb36fd636
	.word 0xbc4988da
	.word 0xaea05c04
	.word 0xce7483a6
	.word 0xea0309d7
	.word 0x62498466
	.word 0x1cd29ac4
	.word 0x97f38b62
	.word 0x690bcf85
	.word 0x9bd83b8b
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

