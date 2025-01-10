// RISC-V Architectural Validation Test VSUXEI8-V-SEW32_LMUL2
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
// Description: Testing instruction 'vsuxei8.v'.

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
    RVTEST_SIGBASE(x5,signature_1_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 0: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+0
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+0
    addi x9, x6, 0
    
    vle32.v v30, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v2, (x5) 

    vsetvli x7, x8, e8,m1
    li x16, 0x4
    vid.v v16
    vmul.vx v16, v16, x16

     

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e32,m2 
    # Testcase 0: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16

    





    # RS1  (x31)       = 0

    # VS2 (v16)       = [      42       9e       de       3d       86       56       9d       27]
    # VS3 (v16)       = [e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27 151a01ef]
    # MASK (v0)       = [       1        1        1        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x31)       = 0

    # VS2 (+1)       = [      91       a8       d5       fd       20       21       9a       51]
    # VS3 (+1)       = [f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a]
    # MASK (+1)       = [       0        0        0        0        0        0        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm ffffffff ffffffff ffffffff ffffffff]


    
    addi x31, x5, 0
    vsuxei8.v v30, (x31), v16, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x151a01ef)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86569d27)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x429ede3d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x20219a51)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0466250f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbd8f6c65)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0466250f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe31ffa64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc737ad3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692dadf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2c63c847)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfbba7ae7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x195b62bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf600a3d1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34b80fd4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3aef5ff4)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 1: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+12
    addi x9, x6, 0
    
    vle32.v v28, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v0, (x5) 

    vsetvli x7, x8, e8,m1
    li x15, 0x4
    vid.v v17
    vmul.vx v17, v17, x15

     

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m2 
    # Testcase 1: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10

    





    # RS1  (x30)       = 0

    # VS2 (v17)       = [      bd       8f       6c       65       91       a8       d5       fd]
    # VS3 (v17)       = [7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x30)       = 0

    # VS2 (+1)       = [      e3       1f       fa       64       04       66       25       0f]
    # VS3 (+1)       = [34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x30, x5, 0
    vsuxei8.v v28, (x30), v17

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x20219a51)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91a8d5fd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbd8f6c65)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0466250f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe31ffa64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc737ad3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe54c8c1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7ca660db)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692dadf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2c63c847)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf600a3d1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34b80fd4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3aef5ff4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34267ad9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681454c0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x67dd3492)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 2: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+64
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+24
    addi x9, x6, 0
    
    vle32.v v26, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v2, (x5) 

    vsetvli x7, x8, e8,m1
    li x14, 0x4
    vid.v v18
    vmul.vx v18, v18, x14

     

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e32,m2 
    # Testcase 2: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8

    





    # RS1  (x29)       = -2047

    # VS2 (v18)       = [      c7       37       ad       3a       e3       1f       fa       64]
    # VS3 (v18)       = [fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f]
    # MASK (v0)       = [       1        1        0        1        0        1        0        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]

    # RS1  (x29)       = -2047

    # VS2 (+1)       = [      7c       a6       60       db       e5       4c       8c       1e]
    # VS3 (+1)       = [b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf]
    # MASK (+1)       = [       0        0        0        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]


    
    addi x29, x5, 0
    vsuxei8.v v26, (x29), v18, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc737ad3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe54c8c1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc737ad3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692dadf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7ca660db)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfbba7ae7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2c63c847)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfbba7ae7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34b80fd4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3aef5ff4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34267ad9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681454c0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x67dd3492)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb02d663e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb2d3f1c5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x824d39ae)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 3: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+36
    addi x9, x6, 0
    
    vle32.v v24, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v0, (x5) 

    vsetvli x7, x8, e8,m1
    li x13, 0x4
    vid.v v19
    vmul.vx v19, v19, x13

     

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e32,m2 
    # Testcase 3: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6

    





    # RS1  (x28)       = -1

    # VS2 (v19)       = [      06       92       da       df       7c       a6       60       db]
    # VS3 (v19)       = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x28)       = -1

    # VS2 (+1)       = [      fb       ba       7a       e7       2c       63       c8       47]
    # VS3 (+1)       = [5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x28, x5, 0
    vsuxei8.v v24, (x28), v19

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe54c8c1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7ca660db)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692dadf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2c63c847)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfbba7ae7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x195b62bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3aef5ff4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34267ad9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x681454c0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x67dd3492)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb02d663e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb2d3f1c5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x824d39ae)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5233a4dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd4983650)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x18fc88d5)
#else
    li x8, 64
    add x5, x5, x8
#endif



    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+48
    addi x13, x2, 0
    
    vle32.v v22, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x12, 0x4
    vid.v v20
    vmul.vx v20, v20, x12

     

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    # Testcase 4: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4

    





    # RS1  (x27)       = -4660

    # VS2 (v20)       = [      19       5b       62       bf       fb       ba       7a       e7]
    # VS3 (v20)       = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847]
    # MASK (v0)       = [       1        0        0        0        0        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff ffffffff ffffffff]

    # RS1  (x27)       = -4660

    # VS2 (+1)       = [      34       b8       0f       d4       f6       00       a3       d1]
    # VS3 (+1)       = [37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # MASK (+1)       = [       0        1        1        0        0        1        1        1]
    # ELEMENTS          [-------- -------- -------- -------- mmmmmmmm ffffffff ffffffff ffffffff]


    
    addi x27, x1, 0
    vsuxei8.v v22, (x27), v20, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x2c63c847)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfbba7ae7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x195b62bf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3aef5ff4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x34267ad9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x681454c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x67dd3492)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb02d663e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb2d3f1c5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x824d39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd4983650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+60
    addi x13, x2, 0
    
    vle32.v v18, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x11, 0x4
    vid.v v21
    vmul.vx v21, v21, x11

     

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m2 
    # Testcase 5: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2

    





    # RS1  (x26)       = 2147483648

    # VS2 (v21)       = [      3a       ef       5f       f4       34       b8       0f       d4]
    # VS3 (v21)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]

    # RS1  (x26)       = 2147483648

    # VS2 (+1)       = [      68       14       54       c0       34       26       7a       d9]
    # VS3 (+1)       = [a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    
    addi x26, x1, 0
    vsuxei8.v v18, (x26), v21

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf600a3d1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x34b80fd4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x681454c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x67dd3492)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb02d663e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb2d3f1c5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x824d39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd4983650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+72
    addi x13, x2, 0
    
    vle32.v v20, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x10, 0x4
    vid.v v22
    vmul.vx v22, v22, x10

     

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m2 
    # Testcase 6: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0

    





    # RS1  (x25)       = 4660

    # VS2 (v22)       = [      67       dd       34       92       68       14       54       c0]
    # VS3 (v22)       = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9]
    # MASK (v0)       = [       1        1        1        1        1        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]

    # RS1  (x25)       = 4660

    # VS2 (+1)       = [      b2       d3       f1       c5       b0       2d       66       3e]
    # VS3 (+1)       = [3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # MASK (+1)       = [       1        0        0        0        1        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    
    addi x25, x1, 0
    vsuxei8.v v20, (x25), v22, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x67dd3492)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb02d663e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb2d3f1c5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x824d39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd4983650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075c1a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+84
    addi x13, x2, 0
    
    vle32.v v16, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x9, 0x4
    vid.v v23
    vmul.vx v23, v23, x9

     

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m2 
    # Testcase 7: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16

    





    # RS1  (x24)       = 4294967295

    # VS2 (v23)       = [      82       4d       39       ae       b2       d3       f1       c5]
    # VS3 (v23)       = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x24)       = 4294967295

    # VS2 (+1)       = [      d4       98       36       50       52       33       a4       dd]
    # VS3 (+1)       = [4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x24, x1, 0
    vsuxei8.v v16, (x24), v23

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb02d663e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb2d3f1c5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x824d39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd4983650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
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
#else
    li x4, 64
    add x1, x1, x4
#endif



    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+256
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+96
    addi x13, x2, 0
    
    vle32.v v14, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x8, 0x4
    vid.v v24
    vmul.vx v24, v24, x8

     

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    # Testcase 8: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10

    





    # RS1  (x23)       = 1

    # VS2 (v24)       = [      18       fc       88       d5       d4       98       36       50]
    # VS3 (v24)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd]
    # MASK (v0)       = [       0        0        0        1        0        1        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff]

    # RS1  (x23)       = 1

    # VS2 (+1)       = [      c8       3b       3c       30       37       bf       40       71]
    # VS3 (+1)       = [03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # MASK (+1)       = [       1        0        1        0        1        1        0        1]
    # ELEMENTS          [mmmmmmmm mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff]


    
    addi x23, x1, 0
    vsuxei8.v v14, (x23), v24, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x17a2fb1a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0b56ed8c)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+108
    addi x13, x2, 0
    
    vle32.v v12, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x7, 0x4
    vid.v v25
    vmul.vx v25, v25, x7

     

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    # Testcase 9: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8

    





    # RS1  (x22)       = 2147483647

    # VS2 (v25)       = [      d1       bc       7d       d8       c8       3b       3c       30]
    # VS3 (v25)       = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x22)       = 2147483647

    # VS2 (+1)       = [      62       f6       cb       6d       a9       68       a9       7f]
    # VS3 (+1)       = [484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x22, x1, 0
    vsuxei8.v v12, (x22), v25

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6cb6d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086787)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3874f8a5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x6075c1a2)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aeeeb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9d848f)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x13, test_1_maskdata+320
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+120
    addi x13, x2, 0
    
    vle32.v v10, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x6, 0x4
    vid.v v26
    vmul.vx v26, v26, x6

     

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    # Testcase 10: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6

    





    # RS1  (x21)       = 124076833

    # VS2 (v26)       = [      5b       08       67       87       62       f6       cb       6d]
    # VS3 (v26)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f]
    # MASK (v0)       = [       1        1        1        0        0        0        0        1]
    # ELEMENTS          [-------- -------- ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]

    # RS1  (x21)       = 124076833

    # VS2 (+1)       = [      60       75       c1       a2       38       74       f8       a5]
    # VS3 (+1)       = [8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # MASK (+1)       = [       1        1        0        1        1        1        1        1]
    # ELEMENTS          [-------- -------- ffffffff mmmmmmmm mmmmmmmm mmmmmmmm mmmmmmmm ffffffff]


    
    addi x21, x1, 0
    vsuxei8.v v10, (x21), v26, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa968a97f)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x951e8621)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aeeeb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9d848f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5cd04)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b1a8042)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xda4c9686)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+132
    addi x13, x2, 0
    
    vle32.v v8, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x5, 0x4
    vid.v v27
    vmul.vx v27, v27, x5

     

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    # Testcase 11: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4

    





    # RS1  (x20)       = 2048

    # VS2 (v27)       = [      95       1e       86       21       60       75       c1       a2]
    # VS3 (v27)       = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x20)       = 2048

    # VS2 (+1)       = [      9b       32       7b       a8       4f       f0       93       78]
    # VS3 (+1)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    
    addi x20, x1, 0
    vsuxei8.v v8, (x20), v27

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb5aeeeb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc9d848f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8dd5cd04)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x9b1a8042)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xda4c9686)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b8dfb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe0e9092c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6323d52)
#else
    li x4, 64
    add x1, x1, x4
#endif



    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+144
    addi x9, x6, 0
    
    vle32.v v6, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v2, (x5) 

    vsetvli x7, x8, e8,m1
    li x4, 0x4
    vid.v v28
    vmul.vx v28, v28, x4

     

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e32,m2 
    # Testcase 12: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2

    





    # RS1  (x19)       = 0

    # VS2 (v28)       = [      b3       2a       4c       52       9b       32       7b       a8]
    # VS3 (v28)       = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # MASK (v0)       = [       1        0        1        0        0        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]

    # RS1  (x19)       = 0

    # VS2 (+1)       = [      17       a2       fb       1a       03       d5       08       1b]
    # VS3 (+1)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # MASK (+1)       = [       0        1        1        0        0        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]


    
    addi x19, x5, 0
    vsuxei8.v v6, (x19), v28, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b327ba8)
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4c9686)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+156
    addi x9, x6, 0
    
    vle32.v v4, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v0, (x5) 

    vsetvli x7, x8, e8,m1
    li x3, 0x4
    vid.v v29
    vmul.vx v29, v29, x3

     

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e32,m2 
    # Testcase 13: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0

    





    # RS1  (x18)       = 2047

    # VS2 (v29)       = [      0b       56       ed       8c       17       a2       fb       1a]
    # VS3 (v29)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]

    # RS1  (x18)       = 2047

    # VS2 (+1)       = [      b5       ae       ee       b5       48       46       05       f6]
    # VS3 (+1)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    
    addi x18, x5, 0
    vsuxei8.v v4, (x18), v29

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+168
    addi x9, x6, 0
    
    vle32.v v2, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v4, (x5) 

    vsetvli x7, x8, e8,m1
    li x2, 0x4
    vid.v v30
    vmul.vx v30, v30, x2

     

    li  x8, 16 # VL = 16
    vsetvli x7, x8, e32,m2 
    # Testcase 14: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16

    





    # RS1  (x17)       = -1

    # VS2 (v30)       = [      fc       9d       84       8f       b5       ae       ee       b5]
    # VS3 (v30)       = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # MASK (v0)       = [       0        1        0        0        1        0        1        0]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]

    # RS1  (x17)       = -1

    # VS2 (+1)       = [      9b       1a       80       42       8d       d5       cd       04]
    # VS3 (+1)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # MASK (+1)       = [       1        0        0        1        0        1        0        0]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff mmmmmmmm]


    
    addi x17, x5, 0
    vsuxei8.v v2, (x17), v30, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeeeb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5cd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b06678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
#else
    li x8, 64
    add x5, x5, x8
#endif

 RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m2
    la x6, test_1_data+180
    addi x9, x6, 0
    
    vle32.v v0, (x6)       # Load value into vs1
    li x7, 4
    add x6, x6, x7
    add x6, x6, x7
    vle32.v v2, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    vsetvli x7, x8, e32,m2 
    vse32.v v2, (x5) 

    vsetvli x7, x8, e8,m1
    li x1, 0x4
    vid.v v31
    vmul.vx v31, v31, x1

     

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m2 
    # Testcase 15: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10

    





    # RS1  (x16)       = 1

    # VS2 (v31)       = [      da       4c       96       86       9b       1a       80       42]
    # VS3 (v31)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x16)       = 1

    # VS2 (+1)       = [      e0       e9       09       2c       42       6b       8d       fb]
    # VS3 (+1)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x16, x5, 0
    vsuxei8.v v0, (x16), v31

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9092c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6323d52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3e156)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4bfb003d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b6484)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05252532)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbe57f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe92f674b)
#else
    li x8, 64
    add x5, x5, x8
#endif



    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+192
    addi x5, x2, 0
    
    vle32.v v30, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x31, 0x4
    vid.v v1
    vmul.vx v1, v1, x31

     

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    # Testcase 16: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8

    





    # RS1  (x15)       = 0

    # VS2 (v1)        = [      f6       32       3d       52       e0       e9       09       2c]
    # VS3 (v1)        = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # MASK (v0)       = [       1        1        1        0        0        1        0        1]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff]

    # RS1  (x15)       = 0

    # VS2 (+1)       = [      4b       fb       00       3d       73       b3       e1       56]
    # VS3 (+1)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # MASK (+1)       = [       0        0        0        0        0        1        0        0]
    # ELEMENTS          [ffffffff ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff]


    
    addi x15, x1, 0
    vsuxei8.v v30, (x15), v1, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x426b8dfb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3e156)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6323d52)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b06678)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8bfcad15)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4e1181e9)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+204
    addi x5, x2, 0
    
    vle32.v v28, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x30, 0x4
    vid.v v0
    vmul.vx v0, v0, x30

     

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m2 
    # Testcase 17: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6

    





    # RS1  (x14)       = 0

    # VS2 (v0)        = [      86       b0       81       d4       4b       fb       00       3d]
    # VS3 (v0)        = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x14)       = 0

    # VS2 (+1)       = [      93       b0       66       78       f2       2b       64       84]
    # VS3 (+1)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x14, x1, 0
    vsuxei8.v v28, (x14), v0

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3e156)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4bfb003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86b081d4)
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
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+216
    addi x5, x2, 0
    
    vle32.v v26, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v4, (x1) 

    vsetvli x3, x4, e8,m1
    li x29, 0x4
    vid.v v2
    vmul.vx v2, v2, x29

     

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e32,m2 
    # Testcase 18: SEW = 32, LMUL = 2, Use Mask = 1, VL = 4

    





    # RS1  (x13)       = -2047

    # VS2 (v2)        = [      0c       c9       d6       c8       93       b0       66       78]
    # VS3 (v2)        = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # MASK (v0)       = [       1        0        1        1        1        1        0        1]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff mmmmmmmm ffffffff]

    # RS1  (x13)       = -2047

    # VS2 (+1)       = [      16       9d       bc       e8       3b       9b       3d       dc]
    # VS3 (+1)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # MASK (+1)       = [       0        0        1        0        0        0        1        0]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff mmmmmmmm ffffffff]


    
    addi x13, x1, 0
    vsuxei8.v v26, (x13), v2, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc9d6c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+228
    addi x5, x2, 0
    
    vle32.v v24, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x28, 0x4
    vid.v v3
    vmul.vx v3, v3, x28

     

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m2 
    # Testcase 19: SEW = 32, LMUL = 2, Use Mask = 0, VL = 2

    





    # RS1  (x12)       = -1

    # VS2 (v3)        = [      05       25       25       32       16       9d       bc       e8]
    # VS3 (v3)        = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]

    # RS1  (x12)       = -1

    # VS2 (+1)       = [      9f       cb       e5       7f       a2       16       7b       52]
    # VS3 (+1)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    
    addi x12, x1, 0
    vsuxei8.v v24, (x12), v3

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x169dbce8)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
#else
    li x4, 64
    add x1, x1, x4
#endif



    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+240
    addi x5, x2, 0
    
    vle32.v v22, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x27, 0x4
    vid.v v4
    vmul.vx v4, v4, x27

     

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m2 
    # Testcase 20: SEW = 32, LMUL = 2, Use Mask = 1, VL = 0

    





    # RS1  (x11)       = -4660

    # VS2 (v4)        = [      e9       2f       67       4b       9f       cb       e5       7f]
    # VS3 (v4)        = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # MASK (v0)       = [       1        0        1        1        0        0        0        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]

    # RS1  (x11)       = -4660

    # VS2 (+1)       = [      8b       fc       ad       15       97       05       65       92]
    # VS3 (+1)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3]
    # MASK (+1)       = [       1        1        0        0        1        1        0        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    
    addi x11, x1, 0
    vsuxei8.v v22, (x11), v4, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4daa96d5)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+252
    addi x5, x2, 0
    
    vle32.v v20, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x26, 0x4
    vid.v v5
    vmul.vx v5, v5, x26

     

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m2 
    # Testcase 21: SEW = 32, LMUL = 2, Use Mask = 0, VL = 16

    





    # RS1  (x10)       = 2147483648

    # VS2 (v5)        = [      4e       11       81       e9       8b       fc       ad       15]
    # VS3 (v5)        = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x10)       = 2147483648

    # VS2 (+1)       = [      ea       35       fe       19       44       5d       a8       cc]
    # VS3 (+1)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x10, x1, 0
    vsuxei8.v v20, (x10), v5

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
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
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e32,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle32.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+264
    addi x5, x2, 0
    
    vle32.v v18, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x4, e8,m1
    li x25, 0x4
    vid.v v6
    vmul.vx v6, v6, x25

     

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m2 
    # Testcase 22: SEW = 32, LMUL = 2, Use Mask = 1, VL = 10

    





    # RS1  (x9)        = 4660

    # VS2 (v6)        = [      52       7e       81       e3       ea       35       fe       19]
    # VS3 (v6)        = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # MASK (v0)       = [       1        0        1        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]

    # RS1  (x9)        = 4660

    # VS2 (+1)       = [      0b       e7       93       b3       79       e9       10       dd]
    # VS3 (+1)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae]
    # MASK (+1)       = [       1        0        1        0        1        1        1        0]
    # ELEMENTS          [ffffffff mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff ffffffff mmmmmmmm]


    
    addi x9, x1, 0
    vsuxei8.v v18, (x9), v6, v0.t

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xea35fe19)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x527e81e3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd7a568f0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
#else
    li x4, 64
    add x1, x1, x4
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8\n")


    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m2
    la x2, test_1_data+276
    addi x5, x2, 0
    
    vle32.v v16, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x4, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x4, e8,m1
    li x24, 0x4
    vid.v v7
    vmul.vx v7, v7, x24

     

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m2 
    # Testcase 23: SEW = 32, LMUL = 2, Use Mask = 0, VL = 8

    





    # RS1  (x8)        = 4294967295

    # VS2 (v7)        = [      c4       7c       5d       71       0b       e7       93       b3]
    # VS3 (v7)        = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x8)        = 4294967295

    # VS2 (+1)       = [      47       c6       f6       38       24       e0       65       8c]
    # VS3 (+1)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x8, x1, 0
    vsuxei8.v v16, (x8), v7

    # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e32,m2
#ifndef SKIP_ASSERTS
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x79e910dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0be793b3)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc47c5d71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x24e0658c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x47c6f638)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc3a22eae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ed86866)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe6b6a11c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x69150191)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf1bcd84d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x734b985d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x353308fb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4c45120b)
#else
    li x4, 64
    add x1, x1, x4
#endif



    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+288
    addi x9, x2, 0
    
    vle32.v v14, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x8, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x8, e8,m1
    li x23, 0x4
    vid.v v8
    vmul.vx v8, v8, x23

     

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m2 
    # Testcase 24: SEW = 32, LMUL = 2, Use Mask = 1, VL = 6

    





    # RS1  (x7)        = 1

    # VS2 (v8)        = [      c3       a2       2e       ae       47       c6       f6       38]
    # VS3 (v8)        = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # MASK (v0)       = [       0        0        1        1        0        1        0        0]
    # ELEMENTS          [-------- -------- ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]

    # RS1  (x7)        = 1

    # VS2 (+1)       = [      e6       b6       a1       1c       4e       d8       68       66]
    # VS3 (+1)       = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1]
    # MASK (+1)       = [       0        1        0        0        1        1        1        1]
    # ELEMENTS          [-------- -------- ffffffff ffffffff mmmmmmmm ffffffff mmmmmmmm mmmmmmmm]


    
    addi x7, x1, 0
    vsuxei8.v v14, (x7), v8, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
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
#else
    li x8, 64
    add x1, x1, x8
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+300
    addi x9, x2, 0
    
    vle32.v v12, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x8, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x8, e8,m1
    li x22, 0x4
    vid.v v9
    vmul.vx v9, v9, x22

     

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m2 
    # Testcase 25: SEW = 32, LMUL = 2, Use Mask = 0, VL = 4

    





    # RS1  (x6)        = 2147483647

    # VS2 (v9)        = [      4d       aa       96       d5       e6       b6       a1       1c]
    # VS3 (v9)        = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x6)        = 2147483647

    # VS2 (+1)       = [      66       65       2e       bf       d7       a5       68       f0]
    # VS3 (+1)       = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    
    addi x6, x1, 0
    vsuxei8.v v12, (x6), v9

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed86866)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe6b6a11c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd7a568f0)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
#else
    li x8, 64
    add x1, x1, x8
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e32,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+312
    addi x9, x2, 0
    
    vle32.v v8, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v2, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x8, e32,m2 
    vse32.v v2, (x1) 

    vsetvli x3, x8, e8,m1
    li x21, 0x4
    vid.v v10
    vmul.vx v10, v10, x21

     

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m2 
    # Testcase 26: SEW = 32, LMUL = 2, Use Mask = 1, VL = 2

    





    # RS1  (x5)        = 124076833

    # VS2 (v10)       = [      df       ca       df       e1       66       65       2e       bf]
    # VS3 (v10)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # MASK (v0)       = [       0        0        1        1        0        1        1        0]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]

    # RS1  (x5)        = 124076833

    # VS2 (+1)       = [      69       15       01       91       3b       e0       15       4f]
    # VS3 (+1)       = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b]
    # MASK (+1)       = [       1        1        1        1        0        0        1        1]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff mmmmmmmm]


    
    addi x5, x1, 0
    vsuxei8.v v8, (x5), v10, v0.t

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
#ifndef SKIP_ASSERTS
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x66652ebf)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x982bc336)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x65e3c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b91dcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11e73)
#else
    li x8, 64
    add x1, x1, x8
#endif

 RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0\n")


    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m2
    la x2, test_1_data+324
    addi x9, x2, 0
    
    vle32.v v6, (x2)       # Load value into vs1
    li x3, 4
    add x2, x2, x3
    add x2, x2, x3
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    vsetvli x3, x8, e32,m2 
    vse32.v v0, (x1) 

    vsetvli x3, x8, e8,m1
    li x20, 0x4
    vid.v v11
    vmul.vx v11, v11, x20

     

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m2 
    # Testcase 27: SEW = 32, LMUL = 2, Use Mask = 0, VL = 0

    





    # RS1  (x4)        = 2048

    # VS2 (v11)       = [      f1       bc       d8       4d       69       15       01       91]
    # VS3 (v11)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]

    # RS1  (x4)        = 2048

    # VS2 (+1)       = [      35       33       08       fb       73       4b       98       5d]
    # VS3 (+1)       = [355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    
    addi x4, x1, 0
    vsuxei8.v v6, (x4), v11

    # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e32,m2
#ifndef SKIP_ASSERTS
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb64b71f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x700a8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x63b91dcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x04b11e73)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
#else
    li x8, 64
    add x1, x1, x8
#endif



    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 

 RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+336
    addi x8, x5, 0
    
    vle32.v v10, (x5)       # Load value into vs1
    li x6, 4
    add x5, x5, x6
    add x5, x5, x6
    vle32.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    vsetvli x6, x7, e32,m2 
    vse32.v v2, (x4) 

    vsetvli x6, x7, e8,m1
    li x19, 0x4
    vid.v v12
    vmul.vx v12, v12, x19

     

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m2 
    # Testcase 28: SEW = 32, LMUL = 2, Use Mask = 1, VL = 16

    





    # RS1  (x3)        = 0

    # VS2 (v12)       = [      4c       45       12       0b       35       33       08       fb]
    # VS3 (v12)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d]
    # MASK (v0)       = [       0        1        0        0        1        0        1        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]

    # RS1  (x3)        = 0

    # VS2 (+1)       = [      db       ee       5e       94       fd       e2       23       d8]
    # VS3 (+1)       = [cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880]
    # MASK (+1)       = [       0        1        1        1        1        1        0        1]
    # ELEMENTS          [mmmmmmmm ffffffff mmmmmmmm mmmmmmmm ffffffff mmmmmmmm ffffffff ffffffff]


    
    addi x3, x4, 0
    vsuxei8.v v10, (x3), v12, v0.t

    # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
#ifndef SKIP_ASSERTS
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x734b985d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x353308fb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfde223d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86604880)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
#else
    li x7, 64
    add x4, x4, x7
#endif

 RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10\n")


    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+348
    addi x8, x5, 0
    
    vle32.v v4, (x5)       # Load value into vs1
    li x6, 4
    add x5, x5, x6
    add x5, x5, x6
    vle32.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    vsetvli x6, x7, e32,m2 
    vse32.v v0, (x4) 

    vsetvli x6, x7, e8,m1
    li x18, 0x4
    vid.v v13
    vmul.vx v13, v13, x18

     

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m2 
    # Testcase 29: SEW = 32, LMUL = 2, Use Mask = 0, VL = 10

    





    # RS1  (x2)        = 2047

    # VS2 (v13)       = [      98       2b       c3       36       db       ee       5e       94]
    # VS3 (v13)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x2)        = 2047

    # VS2 (+1)       = [      b6       4b       71       f6       65       e3       c7       0c]
    # VS3 (+1)       = [ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x2, x4, 0
    vsuxei8.v v4, (x2), v13

    # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
#ifndef SKIP_ASSERTS
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfde223d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982bc336)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86604880)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
#else
    li x7, 64
    add x4, x4, x7
#endif

 RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8\n")


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e32,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+360
    addi x8, x5, 0
    
    vle32.v v2, (x5)       # Load value into vs1
    li x6, 4
    add x5, x5, x6
    add x5, x5, x6
    vle32.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    vsetvli x6, x7, e32,m2 
    vse32.v v4, (x4) 

    vsetvli x6, x7, e8,m1
    li x17, 0x4
    vid.v v14
    vmul.vx v14, v14, x17

     

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m2 
    # Testcase 30: SEW = 32, LMUL = 2, Use Mask = 1, VL = 8

    





    # RS1  (x1)        = -1

    # VS2 (v14)       = [      86       60       48       80       b6       4b       71       f6]
    # VS3 (v14)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c]
    # MASK (v0)       = [       1        1        0        0        1        1        1        1]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x1)        = -1

    # VS2 (+1)       = [      63       b9       1d       cd       70       0a       8d       4e]
    # VS3 (+1)       = [995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8]
    # MASK (+1)       = [       0        0        0        1        1        1        1        0]
    # ELEMENTS          [ffffffff ffffffff mmmmmmmm mmmmmmmm ffffffff ffffffff ffffffff ffffffff]


    
    addi x1, x4, 0
    vsuxei8.v v2, (x1), v14, v0.t

    # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
#ifndef SKIP_ASSERTS
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3c70c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb64b71f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x86604880)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355e64a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f031546)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e804)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31a201a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
#else
    li x7, 64
    add x4, x4, x7
#endif

 RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6\n")


    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m2
    la x5, test_1_data+372
    addi x8, x5, 0
    
    vle32.v v0, (x5)       # Load value into vs1
    li x6, 4
    add x5, x5, x6
    add x5, x5, x6
    vle32.v v2, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    vsetvli x6, x7, e32,m2 
    vse32.v v2, (x4) 

    vsetvli x6, x7, e8,m1
    li x16, 0x4
    vid.v v15
    vmul.vx v15, v15, x16

     

    li  x7, 6 # VL = 6
    vsetvli x6, x7, e32,m2 
    # Testcase 31: SEW = 32, LMUL = 2, Use Mask = 0, VL = 6

    





    # RS1  (x31)       = 1

    # VS2 (v15)       = [      04       b1       1e       73       63       b9       1d       cd]
    # VS3 (v15)       = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]

    # RS1  (x31)       = 1

    # VS2 (+1)       = [      95       a7       45       45       35       5e       64       a2]
    # VS3 (+1)       = [7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    
    addi x31, x4, 0
    vsuxei8.v v0, (x31), v15

    # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e32,m2
#ifndef SKIP_ASSERTS
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a8d4e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x918f472f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xac98e804)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x311c98a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1151057d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x995ccbf8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x31a201a7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdc447722)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cbaceb7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d2e0a7a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x022f6618)
#else
    li x7, 64
    add x4, x4, x7
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
	.word 0x8969d803
	.word 0xff230352
	.word 0x39036f9d
	.word 0xbf2c5c6f
	.word 0x6e503cb3
	.word 0xe096667b
	.word 0x1b9ce74b
	.word 0xbd89423c

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

