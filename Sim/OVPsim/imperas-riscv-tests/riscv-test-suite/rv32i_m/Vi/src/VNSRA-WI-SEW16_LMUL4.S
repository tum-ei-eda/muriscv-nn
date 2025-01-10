// RISC-V Architectural Validation Test VNSRA-WI-SEW16_LMUL4
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
//    SEW=16, LMUL=4
// Description: Testing instruction 'vnsra.wi'.

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
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 4, Use Mask = 1, VL = 64\n")

    





    # IMM      = 0

    # VS2 (v16)       = [34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd 20219a51 429ede3d 86569d27]
    # MASK (v0)       = [       0        0        0        0        0        0        0        1        1        1        1        0        1        1        1        1]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (v28) BEFORE = [    e54c     8c1e     c737     ad3a     e31f     fa64     0466     250f     bd8f     6c65     91a8     d5fd     2021     9a51     429e     de3d]
    # VD (v28) AFTER  = [    e54c     8c1e     c737     ad3a     e31f     fa64     0466     8c1e     ad3a     fa64     250f     d5fd     d5fd     9a51     de3d     9d27]

    # IMM      = 0

    # VS2 (+1)       = [5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4]
    # MASK (+1)       = [       0        0        0        1        0        1        0        1        0        0        0        1        1        0        1        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    3aef     5ff4     34b8     0fd4     f600     a3d1     195b     62bf     fbba     7ae7     2c63     c847     0692     dadf     7ca6     60db]
    # VD (+1) AFTER  = [    3aef     5ff4     34b8     7dd8     f600     4071     195b     3650     fbba     7ae7     2c63     663e     3492     dadf     7ad9     60db]

    # IMM      = 0

    # VS2 (+2)       = [426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5]
    # MASK (+2)       = [       1        0        0        1        1        1        0        1        0        0        1        0        0        1        1        1]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    d498     3650     5233     a4dd     824d     39ae     b2d3     f1c5     b02d     663e     67dd     3492     6814     54c0     3426     7ad9]
    # VD (+2) AFTER  = [    8dfb     3650     5233     cd04     848f     eeb5     b2d3     ed8c     b02d     663e     4c52     3492     6814     8621     c1a2     f8a5]

    # IMM      = 0

    # VS2 (+3)       = [8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c]
    # MASK (+3)       = [       1        0        0        0        0        1        1        0        0        1        0        1        0        1        1        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5]
    # VD (+3) AFTER  = [    ad15     f8a5     5b08     6787     62f6     2532     bce8     a97f     d1bc     6678     c83b     81d4     37bf     e156     3d52     88d5]


    
    vnsra.wi v28, v16, 0, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xde3d9d27)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd5fd9a51)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x250fd5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad3afa64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04668c1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffa64)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8c1e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ad960db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3492dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b3650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6004071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b87dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc1a2f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68148621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4c523492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d3ed8c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x848feeb5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233cd04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8dfb3650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3d5288d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bfe156)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b81d4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc6678)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbce8a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f62532)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xad15f8a5)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v0, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 4, Use Mask = 0, VL = 57\n")

    





    # IMM      = 0

    # VS2 (v0)        = [681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64 0466250f bd8f6c65 91a8d5fd]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [    2c63     c847     0692     dadf     7ca6     60db     e54c     8c1e     c737     ad3a     e31f     fa64     0466     250f     bd8f     6c65]
    # VD (v24) AFTER  = [    54c0     7ad9     5ff4     0fd4     a3d1     62bf     7ae7     c847     dadf     60db     8c1e     ad3a     fa64     250f     6c65     d5fd]

    # IMM      = 0

    # VS2 (+1)       = [951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    67dd     3492     6814     54c0     3426     7ad9     3aef     5ff4     34b8     0fd4     f600     a3d1     195b     62bf     fbba     7ae7]
    # VD (+1) AFTER  = [    8621     c1a2     f8a5     6787     cb6d     a97f     7dd8     3c30     4071     88d5     3650     a4dd     39ae     f1c5     663e     3492]

    # IMM      = 0

    # VS2 (+2)       = [73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    c83b     3c30     37bf     4071     18fc     88d5     d498     3650     5233     a4dd     824d     39ae     b2d3     f1c5     b02d     663e]
    # VD (+2) AFTER  = [    e156     3d52     092c     8dfb     9686     8042     cd04     848f     eeb5     05f6     ed8c     fb1a     081b     4c52     7ba8     9378]

    # IMM      = 0

    # VS2 (+3)       = [ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8]
    # VD (+3) AFTER  = [    4ff0     9378     951e     8621     6075     c1a2     3874     7b52     2532     bce8     3ddc     d6c8     6678     6484     81d4     003d]


    
    vnsra.wi v24, v0, 0



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6c65d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfa64250f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8c1ead3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdadf60db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ae7c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa3d162bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5ff40fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x54c07ad9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x663e3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x39aef1c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3650a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x407188d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7dd83c30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcb6da97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf8a56787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x8621c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ba89378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x081b4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xed8cfb1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xeeb505f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xcd04848f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x96868042)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x092c8dfb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe1563d52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81d4003d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x66786484)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3ddcd6c8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2532bce8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x38747b52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle32.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v20, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 4, Use Mask = 1, VL = 41\n")

    





    # IMM      = 1

    # VS2 (v24)       = [b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db e54c8c1e c737ad3a e31ffa64]
    # MASK (v0)       = [       0        0        0        0        1        1        1        1        1        1        0        1        0        1        0        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (v20) BEFORE = [    f600     a3d1     195b     62bf     fbba     7ae7     2c63     c847     0692     dadf     7ca6     60db     e54c     8c1e     c737     ad3a]
    # VD (v20) AFTER  = [    f600     a3d1     195b     62bf     3d6c     affa     07ea     51e8     b15f     3d73     7ca6     6d6f     e54c     460f     c737     ad3a]

    # IMM      = 1

    # VS2 (+1)       = [b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae]
    # MASK (+1)       = [       0        0        1        1        0        1        0        0        1        0        1        1        1        0        0        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (+1) BEFORE = [    824d     39ae     b2d3     f1c5     b02d     663e     67dd     3492     6814     54c0     3426     7ad9     3aef     5ff4     34b8     0fd4]
    # VD (+1) AFTER  = [    824d     39ae     49bc     4310     b02d     7c52     67dd     3492     54bf     54c0     9e18     a038     446a     5ff4     34b8     0fd4]

    # IMM      = 1

    # VS2 (+2)       = [f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b]
    # MASK (+2)       = [       0        1        0        1        1        1        1        1        1        1        1        1        0        1        0        0]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (+2) BEFORE = [    62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650     5233     a4dd]
    # VD (+2) AFTER  = [    62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     4b43     4021     e682     c247     775a     d498     76c6     5233     a4dd]

    # IMM      = 1

    # VS2 (+3)       = [0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678]
    # MASK (+3)       = [       0        0        1        1        1        0        1        0        1        1        1        0        1        1        1        1]
    # ELEMENTS          [    mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     mmmm     ffff     mmmm     mmmm]
    # VD (+3) BEFORE = [    03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787]
    # VD (+3) AFTER  = [    03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787]


    
    vnsra.wi v20, v24, 1, v0.t



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v20, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc737ad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c460f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca66d6f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb15f3d73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x07ea51e8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3d6caffa)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x446a5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9e18a038)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x54bf54c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d7c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x49bc4310)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd49876c6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc247775a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4021e682)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b4b43)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb32a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d5081b)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m8
    vle32.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e32,m4
    vle32.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 4, Use Mask = 0, VL = 32\n")

    





    # IMM      = 4

    # VS2 (v8)        = [d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7 2c63c847 0692dadf 7ca660db]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v16) BEFORE = [    3426     7ad9     3aef     5ff4     34b8     0fd4     f600     a3d1     195b     62bf     fbba     7ae7     2c63     c847     0692     dadf]
    # VD (v16) AFTER  = [    8365     3a4d     d39a     3f1c     d663     d349     454c     67ad     f5ff     80fd     0a3d     b62b     a7ae     3c84     2dad     660d]

    # IMM      = 4

    # VS2 (+1)       = [0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    18fc     88d5     d498     3650     5233     a4dd     824d     39ae     b2d3     f1c5     b02d     663e     67dd     3492     6814     54c0]
    # VD (+1) AFTER  = [    6ed8     2fb1     5081     a4c5     27ba     0937     e862     5c1a     4f8a     8678     6cb6     8a97     c7dd     b3c3     f407     c88d]

    # IMM      = 4

    # VS2 (+2)       = [3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071]
    # VD (+2) AFTER  = [    6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071]

    # IMM      = 4

    # VS2 (+3)       = [47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621]
    # VD (+3) AFTER  = [    4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621]


    
    vnsra.wi v16, v8, 4



     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2dad660d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa7ae3c84)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0a3db62b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5ff80fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x454c67ad)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd663d349)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd39a3f1c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x83653a4d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf407c88d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc7ddb3c3)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6cb68a97)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4f8a8678)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe8625c1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x27ba0937)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5081a4c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6ed82fb1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bf4071)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b3c30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc7dd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cb6d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874f8a5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x6075c1a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x951e8621)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4ff09378)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9b327ba8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb32a4c52)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x03d5081b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x17a2fb1a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0b56ed8c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x484605f6)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 4, Use Mask = 1, VL = 23\n")

    





    # IMM      = 8

    # VS2 (v16)       = [c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4 f600a3d1 195b62bf fbba7ae7]
    # MASK (v0)       = [       0        1        1        0        0        1        1        1        1        0        0        0        0        1        1        1]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (v12) BEFORE = [    b02d     663e     67dd     3492     6814     54c0     3426     7ad9     3aef     5ff4     34b8     0fd4     f600     a3d1     195b     62bf]
    # VD (v12) AFTER  = [    b02d     bf40     fc88     3492     6814     4d39     d3f1     2d66     dd34     5ff4     34b8     0fd4     f600     00a3     5b62     ba7a]

    # IMM      = 8

    # VS2 (+1)       = [fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8]
    # MASK (+1)       = [       0        1        0        1        1        0        1        1        0        0        0        0        1        0        0        0]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650     5233     a4dd     824d     39ae     b2d3     f1c5]
    # VD (+1) AFTER  = [    d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650     5233     a4dd     0867     39ae     b2d3     f1c5]

    # IMM      = 8

    # VS2 (+2)       = [a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04]
    # MASK (+2)       = [       1        1        1        1        1        0        0        0        1        0        1        0        0        1        0        1]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f]
    # VD (+2) AFTER  = [    9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f]

    # IMM      = 8

    # VS2 (+3)       = [e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f]
    # MASK (+3)       = [       0        0        1        1        1        0        0        0        0        1        1        1        0        1        0        0]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     ffff     ffff     ffff     mmmm     mmmm     mmmm     mmmm     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52]
    # VD (+3) AFTER  = [    8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52]


    
    vnsra.wi v12, v16, 8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b62ba7a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf60000a3)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdd345ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd3f12d66)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x68144d39)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc883492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02dbf40)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x086739ae)
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
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 4, Use Mask = 0, VL = 16\n")

    





    # IMM      = 31

    # VS2 (v24)       = [62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0 34267ad9 3aef5ff4 34b80fd4]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [    5233     a4dd     824d     39ae     b2d3     f1c5     b02d     663e     67dd     3492     6814     54c0     3426     7ad9     3aef     5ff4]
    # VD (v8)  AFTER  = [    0000     ffff     ffff     ffff     0000     0000     ffff     0000     ffff     ffff     ffff     0000     0000     0000     0000     0000]

    # IMM      = 31

    # VS2 (+1)       = [da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650]
    # VD (+1) AFTER  = [    5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650]

    # IMM      = 31

    # VS2 (+2)       = [97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5]
    # VD (+2) AFTER  = [    17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5]

    # IMM      = 31

    # VS2 (+3)       = [66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c]
    # VD (+3) AFTER  = [    426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c]


    
    vnsra.wi v8, v24, 31



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffff0000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0000ffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle32.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 4, Use Mask = 1, VL = 10\n")

    





    # IMM      = 16

    # VS2 (v8)        = [6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5 b02d663e 67dd3492 681454c0]
    # MASK (v0)       = [       1        0        0        0        1        1        0        1        1        1        1        1        1        0        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     ffff]
    # VD (v4)  BEFORE = [    37bf     4071     18fc     88d5     d498     3650     5233     a4dd     824d     39ae     b2d3     f1c5     b02d     663e     67dd     3492]
    # VD (v4)  AFTER  = [    37bf     4071     18fc     88d5     d498     3650     5233     37bf     18fc     d498     5233     824d     b2d3     663e     67dd     6814]

    # IMM      = 16

    # VS2 (+1)       = [f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621]
    # MASK (+1)       = [       0        1        0        0        0        0        1        0        0        1        1        0        1        0        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     ffff]
    # VD (+1) BEFORE = [    951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30]
    # VD (+1) AFTER  = [    951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30]

    # IMM      = 16

    # VS2 (+2)       = [445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156]
    # MASK (+2)       = [       0        0        0        0        1        0        0        1        0        0        1        0        1        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     ffff]
    # VD (+2) BEFORE = [    b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378]
    # VD (+2) AFTER  = [    b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378]

    # IMM      = 16

    # VS2 (+3)       = [69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19]
    # MASK (+3)       = [       1        1        1        0        0        0        0        0        1        1        1        0        1        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     mmmm     ffff     ffff     ffff     ffff     ffff     ffff     mmmm     ffff     ffff]
    # VD (+3) BEFORE = [    73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f]
    # VD (+3) AFTER  = [    73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f]


    
    vnsra.wi v4, v8, 16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x67dd6814)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5233824d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fcd498)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x523337bf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4983650)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fc88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe0e9092c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf6323d52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x73b3e156)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 4, Use Mask = 0, VL = 8\n")

    





    # IMM      = 1

    # VS2 (v16)       = [9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650 5233a4dd 824d39ae b2d3f1c5]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [    a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5     d498     3650     5233     a4dd     824d     39ae]
    # VD (v0)  AFTER  = [    a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     3eec     9e18     a038     446a     1b28     d26e     9cd7     f8e2]

    # IMM      = 1

    # VS2 (+1)       = [86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d]
    # VD (+1) AFTER  = [    b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d]

    # IMM      = 1

    # VS2 (+2)       = [79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b]
    # VD (+2) AFTER  = [    9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b]

    # IMM      = 1

    # VS2 (+3)       = [353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686]
    # VD (+3) AFTER  = [    f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686]


    
    vnsra.wi v0, v16, 1



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9cd7f8e2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1b28d26e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa038446a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3eec9e18)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf4071)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc83b3c30)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1bc7dd8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa968a97f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x62f6cb6d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5b086787)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3874f8a5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6075c1a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x951e8621)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ff09378)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b327ba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb32a4c52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x03d5081b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x17a2fb1a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0b56ed8c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x484605f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb5aeeeb5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc9d848f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8dd5cd04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x9b1a8042)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xda4c9686)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x426b8dfb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xe0e9092c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf6323d52)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x73b3e156)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4bfb003d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86b081d4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf22b6484)
#endif
    




    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 4, Use Mask = 1, VL = 6\n")

    





    # IMM      = 0

    # VS2 (v8)        = [17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30 37bf4071 18fc88d5 d4983650]
    # MASK (v0)       = [       1        0        1        0        1        1        0        1        0        0        0        1        0        1        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     ffff     mmmm     ffff]
    # VD (v28) BEFORE = [    3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     3c30     37bf     4071     18fc     88d5]
    # VD (v28) AFTER  = [    3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8     c83b     7dd8     37bf     4071     18fc     3650]

    # IMM      = 0

    # VS2 (+1)       = [0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c]
    # MASK (+1)       = [       1        0        0        0        1        0        1        1        1        1        1        1        1        1        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     ffff     mmmm     ffff]
    # VD (+1) BEFORE = [    0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2]
    # VD (+1) AFTER  = [    0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2]

    # IMM      = 0

    # VS2 (+2)       = [24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc]
    # MASK (+2)       = [       1        0        0        0        0        0        0        1        1        1        1        0        1        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     ffff     mmmm     ffff]
    # VD (+2) BEFORE = [    e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6]
    # VD (+2) AFTER  = [    e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6]

    # IMM      = 0

    # VS2 (+3)       = [dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638]
    # MASK (+3)       = [       0        1        0        0        1        1        1        0        0        0        0        1        0        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff     mmmm     ffff     mmmm     ffff]
    # VD (+3) BEFORE = [    3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52]
    # VD (+3) AFTER  = [    3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52]


    
    vnsra.wi v28, v8, 0, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc3650)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b7dd8)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b9b3ddc)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 4, Use Mask = 0, VL = 4\n")

    





    # IMM      = 0

    # VS2 (v0)        = [b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d a968a97f d1bc7dd8 c83b3c30]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (v24) BEFORE = [    4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     a968     a97f     d1bc     7dd8]
    # VD (v24) AFTER  = [    4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787     62f6     cb6d     cb6d     a97f     7dd8     3c30]

    # IMM      = 0

    # VS2 (+1)       = [05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8]
    # VD (+1) AFTER  = [    fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8]

    # IMM      = 0

    # VS2 (+2)       = [4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04]
    # VD (+2) AFTER  = [    4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04]

    # IMM      = 0

    # VS2 (+3)       = [b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4]
    # VD (+3) AFTER  = [    a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4]


    
    vnsra.wi v24, v0, 0



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7dd83c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcb6da97f)
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
    la x12, test_1_maskdata+320
    vle32.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 4, Use Mask = 1, VL = 2\n")

    





    # IMM      = 1

    # VS2 (v24)       = [9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2 3874f8a5 5b086787 62f6cb6d]
    # MASK (v0)       = [       1        1        0        1        1        1        1        1        1        1        1        0        0        0        0        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (v20) BEFORE = [    03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     6787]
    # VD (v20) AFTER  = [    03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621     6075     c1a2     3874     f8a5     5b08     65b6]

    # IMM      = 1

    # VS2 (+1)       = [e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686]
    # MASK (+1)       = [       1        1        0        1        1        1        1        1        1        1        0        0        1        0        1        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (+1) BEFORE = [    da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a]
    # VD (+1) AFTER  = [    da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a]

    # IMM      = 1

    # VS2 (+2)       = [d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592]
    # MASK (+2)       = [       0        0        0        1        0        1        0        1        0        1        0        0        1        1        1        1]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (+2) BEFORE = [    93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb]
    # VD (+2) AFTER  = [    93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb]

    # IMM      = 1

    # VS2 (+3)       = [63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf]
    # MASK (+3)       = [       0        0        1        1        1        0        1        1        1        1        1        0        0        0        0        0]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     mmmm     ffff]
    # VD (+3) BEFORE = [    9705     6592     e92f     674b     9fcb     e57f     a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8]
    # VD (+3) AFTER  = [    9705     6592     e92f     674b     9fcb     e57f     a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8]


    
    vnsra.wi v20, v24, 1, v0.t



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b0865b6)
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
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m8
    vle32.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e32,m4
    vle32.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 4, Use Mask = 0, VL = 0\n")

    





    # IMM      = 4

    # VS2 (v0)        = [e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8 4ff09378 951e8621 6075c1a2]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (v16) BEFORE = [    4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621]
    # VD (v16) AFTER  = [    4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52     9b32     7ba8     4ff0     9378     951e     8621]

    # IMM      = 4

    # VS2 (+1)       = [4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+1) BEFORE = [    f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5]
    # VD (+1) AFTER  = [    f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5]

    # IMM      = 4

    # VS2 (+2)       = [3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+2) BEFORE = [    169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156]
    # VD (+2) AFTER  = [    169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156]

    # IMM      = 4

    # VS2 (+3)       = [95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191]
    # ELEMENTS          [    ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----     ----]
    # VD (+3) BEFORE = [    445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592     e92f     674b     9fcb     e57f     a216     7b52     0525     2532]
    # VD (+3) AFTER  = [    445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592     e92f     674b     9fcb     e57f     a216     7b52     0525     2532]


    
    vnsra.wi v16, v0, 4



     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
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
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v12, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 4, Use Mask = 1, VL = 64\n")

    





    # IMM      = 8

    # VS2 (v16)       = [4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a 03d5081b b32a4c52 9b327ba8]
    # MASK (v0)       = [       0        1        1        0        0        1        0        0        1        0        1        0        0        0        1        0]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (v12) BEFORE = [    8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c     17a2     fb1a     03d5     081b     b32a     4c52]
    # VD (v12) AFTER  = [    8dd5     b3e1     323d     848f     b5ae     4c96     4846     05f6     9d84     ed8c     4605     fb1a     03d5     081b     2a4c     4c52]

    # IMM      = 8

    # VS2 (+1)       = [527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4]
    # MASK (+1)       = [       0        0        1        1        0        1        0        1        0        1        0        1        1        1        1        0]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (+1) BEFORE = [    86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042]
    # VD (+1) AFTER  = [    86b0     81d4     5da8     1181     73b3     0565     f632     cbe5     e0e9     2525     426b     9b3d     c9d6     b066     2b64     8042]

    # IMM      = 8

    # VS2 (+2)       = [734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd]
    # MASK (+2)       = [       0        1        0        0        0        1        0        1        0        1        0        0        0        1        0        1]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (+2) BEFORE = [    9fcb     e57f     a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484]
    # VD (+2) AFTER  = [    9fcb     bcd8     a216     7b52     0525     652e     169d     aa96     3b9b     d868     0cc9     d6c8     93b0     7c5d     f22b     e910]

    # IMM      = 8

    # VS2 (+3)       = [4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb]
    # MASK (+3)       = [       1        0        0        1        0        1        0        1        1        0        1        0        0        1        1        1]
    # ELEMENTS          [    mmmm     ffff     ffff     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm]
    # VD (+3) BEFORE = [    79e9     10dd     527e     81e3     ea35     fe19     445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592     e92f     674b]
    # VD (+3) AFTER  = [    0315     10dd     527e     a745     ea35     b11e     445d     0a8d     6048     81e9     e3c7     ad15     9705     e223     4512     3308]


    
    vnsra.wi v12, v16, 8, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v12, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2a4c4c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4605fb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9d84ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5ae4c96)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x323d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5b3e1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2b648042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9d6b066)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b9b3d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e92525)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf632cbe5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b30565)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5da81181)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22be910)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b07c5d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9bd868)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169daa96)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0525652e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbbcd8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x45123308)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9705e223)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe3c7ad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x604881e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445d0a8d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35b11e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527ea745)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x031510dd)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 4, Use Mask = 0, VL = 57\n")

    





    # IMM      = 31

    # VS2 (v24)       = [93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5 484605f6 0b56ed8c 17a2fb1a]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v8)  BEFORE = [    426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f     b5ae     eeb5     4846     05f6     0b56     ed8c]
    # VD (v8)  AFTER  = [    ffff     ffff     ffff     0000     0000     ffff     ffff     0000     ffff     ffff     ffff     ffff     ffff     0000     0000     0000]

    # IMM      = 31

    # VS2 (+1)       = [c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c]
    # VD (+1) AFTER  = [    ffff     0000     0000     0000     ffff     0000     0000     ffff     ffff     ffff     ffff     ffff     0000     0000     0000     0000]

    # IMM      = 31

    # VS2 (+2)       = [fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    8bfc     ad15     9705     6592     e92f     674b     9fcb     e57f     a216     7b52     0525     2532     169d     bce8     3b9b     3ddc]
    # VD (+2) AFTER  = [    ffff     0000     0000     0000     ffff     0000     0000     ffff     0000     ffff     0000     ffff     0000     ffff     0000     0000]

    # IMM      = 31

    # VS2 (+3)       = [311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    24e0     658c     c47c     5d71     0be7     93b3     79e9     10dd     527e     81e3     ea35     fe19     445d     a8cc     4e11     81e9]
    # VD (+3) AFTER  = [    24e0     658c     c47c     5d71     0be7     93b3     79e9     0000     0000     0000     0000     ffff     ffff     0000     ffff     ffff]


    
    vnsra.wi v8, v24, 31



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0000ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e90000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
#endif
    


    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle32.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 4, Use Mask = 1, VL = 41\n")

    





    # IMM      = 16

    # VS2 (v8)        = [169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042 8dd5cd04 fc9d848f b5aeeeb5]
    # MASK (v0)       = [       1        0        0        1        0        1        0        0        0        1        0        0        1        0        1        0]
    # ELEMENTS          [    ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (v4)  BEFORE = [    73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686     9b1a     8042     8dd5     cd04     fc9d     848f]
    # VD (v4)  AFTER  = [    169d     e156     f632     93b0     e0e9     86b0     426b     8dfb     da4c     e0e9     9b1a     8042     9b1a     cd04     fc9d     848f]

    # IMM      = 16

    # VS2 (+1)       = [c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b 9fcbe57f a2167b52 05252532]
    # MASK (+1)       = [       1        1        0        0        0        0        0        1        1        0        0        0        0        0        0        0]
    # ELEMENTS          [    ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (+1) BEFORE = [    0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678     f22b     6484     86b0     81d4     4bfb     003d]
    # VD (+1) AFTER  = [    c3a2     47c6     169d     bce8     3b9b     3ddc     0cc9     ea35     445d     6678     f22b     6484     86b0     81d4     4bfb     003d]

    # IMM      = 16

    # VS2 (+2)       = [65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0 4daa96d5 e6b6a11c 4ed86866]
    # MASK (+2)       = [       0        0        1        0        0        0        0        1        1        1        1        1        0        1        0        0]
    # ELEMENTS          [    ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (+2) BEFORE = [    ea35     fe19     445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592     e92f     674b     9fcb     e57f     a216     7b52]
    # VD (+2) AFTER  = [    ea35     fe19     445d     a8cc     4e11     81e9     8bfc     f1bc     6915     3be0     dfca     6665     9fcb     4daa     a216     7b52]

    # IMM      = 16

    # VS2 (+3)       = [31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd 700a8d4e 86604880 b64b71f6]
    # MASK (+3)       = [       1        0        1        0        0        1        1        1        0        1        1        1        1        1        0        1]
    # ELEMENTS          [    ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm     mmmm     mmmm     ffff     mmmm     mmmm     ffff     mmmm     ffff     mmmm]
    # VD (+3) BEFORE = [    4ed8     6866     c3a2     2eae     47c6     f638     24e0     658c     c47c     5d71     0be7     93b3     79e9     10dd     527e     81e3]
    # VD (+3) AFTER  = [    4ed8     6866     c3a2     2eae     47c6     f638     24e0     658c     c47c     5d71     0be7     93b3     79e9     10dd     527e     81e3]


    
    vnsra.wi v4, v8, 16, v0.t



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc9d848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1acd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4ce0e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e986b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf63293b0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169de156)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445d6678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9ea35)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3a247c6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcb4daa)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdfca6665)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x69153be0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcf1bc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x47c6f638)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3a22eae)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ed86866)
#endif
    


    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m8
    vle32.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e32,m4
    vle32.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e16,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 4, Use Mask = 0, VL = 32\n")

    





    # IMM      = 1

    # VS2 (v16)       = [9fcbe57f a2167b52 05252532 169dbce8 3b9b3ddc 0cc9d6c8 93b06678 f22b6484 86b081d4 4bfb003d 73b3e156 f6323d52 e0e9092c 426b8dfb da4c9686 9b1a8042]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (v0)  BEFORE = [    f22b     6484     86b0     81d4     4bfb     003d     73b3     e156     f632     3d52     e0e9     092c     426b     8dfb     da4c     9686]
    # VD (v0)  AFTER  = [    f2bf     3da9     9299     de74     9eee     eb64     333c     b242     40ea     801e     f0ab     1ea9     8496     c6fd     4b43     4021]

    # IMM      = 1

    # VS2 (+1)       = [4daa96d5 e6b6a11c 4ed86866 c3a22eae 47c6f638 24e0658c c47c5d71 0be793b3 79e910dd 527e81e3 ea35fe19 445da8cc 4e1181e9 8bfcad15 97056592 e92f674b]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+1) BEFORE = [    e92f     674b     9fcb     e57f     a216     7b52     0525     2532     169d     bce8     3b9b     3ddc     0cc9     d6c8     93b0     6678]
    # VD (+1) AFTER  = [    4b6a     508e     3433     1757     7b1c     32c6     2eb8     c9d9     886e     40f1     ff0c     d466     c0f4     568a     b2c9     b3a5]

    # IMM      = 1

    # VS2 (+2)       = [700a8d4e 86604880 b64b71f6 65e3c70c 982bc336 dbee5e94 fde223d8 4c45120b 353308fb 734b985d f1bcd84d 69150191 3be0154f dfcadfe1 66652ebf d7a568f0]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+2) BEFORE = [    0be7     93b3     79e9     10dd     527e     81e3     ea35     fe19     445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592]
    # VD (+2) AFTER  = [    0be7     93b3     79e9     10dd     527e     81e3     ea35     fe19     445d     a8cc     4e11     81e9     8bfc     ad15     9705     6592]

    # IMM      = 1

    # VS2 (+3)       = [0d2e0a7a 7cbaceb7 dc447722 31a201a7 995ccbf8 1151057d 311c98a1 ac98e804 918f472f 4f031546 cd1b37e5 8b4ecba8 95a74545 355e64a2 04b11e73 63b91dcd]
    # ELEMENTS          [    ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff     ffff]
    # VD (+3) BEFORE = [    d7a5     68f0     4daa     96d5     e6b6     a11c     4ed8     6866     c3a2     2eae     47c6     f638     24e0     658c     c47c     5d71]
    # VD (+3) AFTER  = [    d7a5     68f0     4daa     96d5     e6b6     a11c     4ed8     6866     c3a2     2eae     47c6     f638     24e0     658c     c47c     5d71]


    
    vnsra.wi v0, v16, 1



     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e16,m4
    vse16.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4b434021)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8496c6fd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf0ab1ea9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x40ea801e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x333cb242)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9eeeeb64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9299de74)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf2bf3da9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb2c9b3a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc0f4568a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff0cd466)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x886e40f1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2eb8c9d9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7b1c32c6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34331757)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4b6a508e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x97056592)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4e1181e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445da8cc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35fe19)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527e81e3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e910dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0be793b3)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc47c5d71)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x24e0658c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x47c6f638)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc3a22eae)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ed86866)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe6b6a11c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4daa96d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd7a568f0)
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
RVTEST_DATA_END

RVMODEL_DATA_BEGIN




signature_1_0:
	.fill 128, 4, 0xdeadbeef
signature_2_0:
	.fill 128, 4, 0xdeadbeef
signature_3_0:
	.fill 128, 4, 0xdeadbeef
signature_4_0:
	.fill 128, 4, 0xdeadbeef


#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END

