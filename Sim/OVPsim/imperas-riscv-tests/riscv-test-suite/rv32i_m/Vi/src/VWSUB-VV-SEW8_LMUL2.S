// RISC-V Architectural Validation Test VWSUB-VV-SEW8_LMUL2
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
//    SEW=8, LMUL=2
// Description: Testing instruction 'vwsub.vv'.

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
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+0
    vsetvli x0, x7, e16,m2
    vle16.v v2, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v2)        = [  e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d   86   56   9d   27   15   1a   01   ef]

    # VS2 (v16)       = [  c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d   86   56   9d   27]
    # MASK (v0)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0    0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (v28) BEFORE = [3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d]
    # VD (v28) AFTER  = [3aef 5ff4 34b8 ffd6 f600 ffb9 195b 0055 fbba 7ae7 2c63 ffaa 002c dadf 0097 60db e54c 8c1e c737 ad3a e31f fa64 0466 0014 00bc ff48 0041 d5fd ff71 003c ff9c 0038]

    # VS1 (+1)       = [  f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a]

    # VS2 (+1)       = [  34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e]
    # MASK (+1)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+1) BEFORE = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]
    # VD (+1) AFTER  = [003e f8a5 5b08 6787 62f6 ffa5 ff41 a97f d1bc 00a1 c83b ffd8 37bf ff57 00b2 88d5 0026 3650 5233 0068 ff8a ffec b2d3 0004 b02d 663e 00d4 3492 6814 0015 ffdf ffe4]


    
    
    vwsub.vv v28, v16, v2, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff9c0038)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff71003c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0041d5fd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00bcff48)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04660014)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x009760db)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x002cdadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x2c63ffaa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfbba7ae7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x195b0055)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf600ffb9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34b8ffd6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3aef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffdfffe4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x68140015)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00d43492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02d663e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb2d30004)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff8affec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x52330068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00263650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00b288d5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bfff57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83bffd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1bc00a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff41a97f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6ffa5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003ef8a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e16,m2
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v18, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 57 # VL = 57
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v0)        = [  7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51]

    # VS2 (v18)       = [  06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65]
    # VD (v24) AFTER  = [ff8a ffec ff7a 0004 0097 ff5a 00d4 ffbd 001e 0015 ffdf ffe4 ffe4 0018 ffb3 ffd6 ffdf ffb9 ffd5 0055 0047 00d7 ffb9 ffaa 002c ffe7 0097 0068 ff71 ff87 003b ffac]

    # VS1 (+1)       = [  34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df]

    # VS2 (+1)       = [  68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]
    # VD (+1) AFTER  = [4ff0 9378 951e 8621 6075 c1a2 3874 ffe5 0006 0037 0050 0020 003e ffb8 006c 0003 ffdd ffa5 ff41 0012 001e 00a1 ffe8 ffd8 ffcf ff57 00b2 ffa0 0026 00d1 ffee 0068]


    
    
    vwsub.vv v24, v18, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003bffac)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff71ff87)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00970068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x002cffe7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffb9ffaa)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x004700d7)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffd50055)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffdfffb9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffb3ffd6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffe40018)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffdfffe4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x001e0015)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00d4ffbd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0097ff5a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff7a0004)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff8affec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffee0068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x002600d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00b2ffa0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffcfff57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffe8ffd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x001e00a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff410012)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffddffa5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x006c0003)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003effb8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00500020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00060037)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3874ffe5)
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
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+24
    vsetvli x0, x7, e16,m2
    vle16.v v4, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v20, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 41 # VL = 41
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v4)        = [  fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f]

    # VS2 (v24)       = [  19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64]
    # MASK (v0)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0    0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (v20) BEFORE = [824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a]
    # VD (v20) AFTER  = [824d 39ae ffe8 ffd8 b02d ff57 67dd 3492 0026 54c0 ffee 0068 ff8a 5ff4 34b8 0fd4 f600 a3d1 195b 62bf 001e 0015 ffdf ffe4 ffe4 0018 7ca6 ffd6 e54c ffb9 c737 ad3a]

    # VS1 (+1)       = [  b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf]

    # VS2 (+1)       = [  b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1]
    # MASK (+1)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1    0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+1) BEFORE = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]
    # VD (+1) AFTER  = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 0020 003e ffb8 006c 0003 d498 ffa5 5233 a4dd]


    
    
    vwsub.vv v20, v24, v4, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54cffb9)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7ca6ffd6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffe40018)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffdfffe4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x001e0015)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff8a5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffee0068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x002654c0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x67dd3492)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xb02dff57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffe8ffd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824d39ae)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233a4dd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd498ffa5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x006c0003)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003effb8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc83b0020)
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
    vsetvli x0, x7, e16,m2
    vle16.v v6, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v20, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v6)        = [  34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e]

    # VS2 (v20)       = [  3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf]
    # VD (v16) AFTER  = [0006 0037 0050 0020 003e ffb8 006c 0003 ffdd ffa5 ff41 0012 001e 00a1 ffe8 ffd8 ffcf ff57 00b2 ffa0 0026 00d1 ffee 0068 ff8a ffec ff7a 0004 0097 ff5a 00d4 ffbd]

    # VS1 (+1)       = [  52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4]

    # VS2 (+1)       = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]
    # VD (+1) AFTER  = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]


    
    
    vwsub.vv v16, v20, v6
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00d4ffbd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0097ff5a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff7a0004)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff8affec)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffee0068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x002600d1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00b2ffa0)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffcfff57)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffe8ffd8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x001e00a1)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff410012)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffddffa5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x006c0003)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003effb8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00500020)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00060037)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+48
    vsetvli x0, x8, e16,m2
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v8)        = [  68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47]

    # VS2 (v22)       = [  67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7]
    # MASK (v0)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0    0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (v12) BEFORE = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf]
    # VD (v12) AFTER  = [d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 0006 39ae b2d3 f1c5 b02d ffb8 006c 3492 6814 ffa5 ff41 0012 001e 5ff4 34b8 0fd4 f600 ff57 00b2 ffa0]

    # VS1 (+1)       = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]

    # VS2 (+1)       = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]
    # MASK (+1)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0    1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+1) BEFORE = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]
    # VD (+1) AFTER  = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]


    
    
    vwsub.vv v12, v22, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00b2ffa0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf600ff57)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x34b80fd4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x001e5ff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff410012)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6814ffa5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x006c3492)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb02dffb8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb2d3f1c5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000639ae)
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
    vsetvli x0, x8, e16,m2
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 16 # VL = 16
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v12)       = [  b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1]

    # VS2 (v26)       = [  82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # VD (v8)  AFTER  = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 0034 ffee ffda ffe7 fffa 0037 001b ffe5 0006 0037 0050 0020 003e ffb8 006c 0003]

    # VS1 (+1)       = [  a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae]

    # VS2 (+1)       = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # VD (+1) AFTER  = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]


    
    
    vwsub.vv v8, v26, v12
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x006c0003)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x003effb8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00500020)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00060037)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x001bffe5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfffa0037)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffdaffe7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0034ffee)
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
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle16.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+72
    vsetvli x0, x8, e16,m2
    vle16.v v10, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 10 # VL = 10
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v10)       = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]

    # VS2 (v28)       = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]
    # MASK (v0)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1    1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (v4)  BEFORE = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # VD (v4)  AFTER  = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 00ac ffff ffc9 ffe0 ffd2 0034 663e ffda ffe7]

    # VS1 (+1)       = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]

    # VS2 (+1)       = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]
    # MASK (+1)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1    0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+1) BEFORE = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # VD (+1) AFTER  = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]


    
    
    vwsub.vv v4, v28, v10, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffdaffe7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0034663e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffe0ffd2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffc9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x523300ac)
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
    vsetvli x0, x8, e16,m2
    vle16.v v14, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v14)       = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]

    # VS2 (v30)       = [  d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # VD (v0)  AFTER  = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 ffd0 007a 0048 ffe9 0002 ffa6 ff8b ff87]

    # VS1 (+1)       = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]

    # VS2 (+1)       = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # VD (+1) AFTER  = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]


    
    
    vwsub.vv v0, v30, v14
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff8bff87)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0002ffa6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0048ffe9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffd0007a)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+96
    vsetvli x0, x4, e16,m2
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 2, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v16)       = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]

    # VS2 (v2)        = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]
    # MASK (v0)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff   mm   ff   mm   ff]
    # VD (v28) BEFORE = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # VD (v28) AFTER  = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b ff85 37bf ff65 18fc 0073]

    # VS1 (+1)       = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]

    # VS2 (+1)       = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]
    # MASK (+1)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1    1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff   mm   ff   mm   ff]
    # VD (+1) BEFORE = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # VD (+1) AFTER  = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]


    
    
    vwsub.vv v28, v2, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc0073)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bfff65)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83bff85)
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
    vsetvli x0, x4, e16,m2
    vle16.v v18, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 2, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v18)       = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]

    # VS2 (v0)        = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff]
    # VD (v24) BEFORE = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # VD (v24) AFTER  = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d ff91 007c fffc ffbf]

    # VS1 (+1)       = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]

    # VS2 (+1)       = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff]
    # VD (+1) BEFORE = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # VD (+1) AFTER  = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]


    
    
    vwsub.vv v24, v0, v18
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfffcffbf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff91007c)
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
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle16.v v0, (x12)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+120
    vsetvli x0, x4, e16,m2
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 2, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v24)       = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]

    # VS2 (v4)        = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff]
    # VD (v20) BEFORE = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # VD (v20) AFTER  = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 ffee]

    # VS1 (+1)       = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]

    # VS2 (+1)       = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]
    # MASK (+1)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0    0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   ff]
    # VD (+1) BEFORE = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # VD (+1) AFTER  = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]


    
    
    vwsub.vv v20, v4, v24, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b08ffee)
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
    vsetvli x0, x4, e16,m2
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 2, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v20)       = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]

    # VS2 (v6)        = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (v16) BEFORE = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # VD (v16) AFTER  = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]

    # VS1 (+1)       = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]

    # VS2 (+1)       = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+1) BEFORE = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # VD (+1) AFTER  = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]


    
    
    vwsub.vv v16, v6, v20
    


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
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+144
    vsetvli x0, x8, e16,m2
    vle16.v v22, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m2
    vle16.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v22)       = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]

    # VS2 (v8)        = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]
    # MASK (v0)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0    0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   ff   mm   ff   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   mm   ff   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm]
    # VD (v12) BEFORE = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # VD (v12) AFTER  = [86b0 81d4 ff96 ffda 73b3 ff68 f632 ffbf e0e9 fff0 426b 006a fff4 00b4 fff2 8042 8dd5 ffcd fff3 848f b5ae ffab 4846 05f6 0018 ed8c ffd1 fb1a 03d5 081b 00e8 4c52]

    # VS1 (+1)       = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]

    # VS2 (+1)       = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]
    # MASK (+1)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   ff   mm   ff   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   mm   ff   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm]
    # VD (+1) BEFORE = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # VD (+1) AFTER  = [ffd8 10dd 527e ffe7 ea35 ff81 445d 0004 0016 81e9 0034 ad15 9705 ff7e 007c 0031 9fcb 001f a216 7b52 0525 0032 169d ff44 3b9b 0045 0cc9 d6c8 93b0 0038 f22b 0075]


    
    
    vwsub.vv v12, v8, v22, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00e84c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffd1fb1a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0018ed8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x484605f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb5aeffab)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff3848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8dd5ffcd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff28042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff400b4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b006a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e9fff0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf632ffbf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x73b3ff68)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff96ffda)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86b081d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf22b0075)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x93b00038)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc9d6c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b0045)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dff44)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x05250032)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcb001f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007c0031)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9705ff7e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0034ad15)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x001681e9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x445d0004)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xea35ff81)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x527effe7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffd810dd)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+156
    vsetvli x0, x8, e16,m2
    vle16.v v26, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m2
    vle16.v v12, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 57 # VL = 57
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v26)       = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]

    # VS2 (v12)       = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # VD (v8)  AFTER  = [003f 0032 0016 ff44 000e 0045 ffb3 003e ff91 0038 0049 0075 0047 ffef ff96 ffda ff6d ff68 ffe9 ffbf 003d fff0 0018 006a fff4 00b4 fff2 ff72 0014 ffcd fff3 ffff]

    # VS1 (+1)       = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]

    # VS2 (+1)       = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # VD (+1) AFTER  = [24e0 658c c47c 5d71 0be7 93b3 79e9 ffb0 ff3b ffb5 ff81 ff97 ffd8 0048 001f ffe7 007d ff81 ffa4 0004 0016 0049 0034 0026 ff9e ff7e 007c 0031 0068 001f fff7 0075]


    
    
    vwsub.vv v8, v12, v26
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff3ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0014ffcd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff2ff72)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff400b4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0018006a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x003dfff0)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffe9ffbf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff6dff68)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff96ffda)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0047ffef)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00490075)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff910038)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffb3003e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x000e0045)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0016ff44)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x003f0032)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff70075)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0068001f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007c0031)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff9eff7e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00340026)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00160049)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffa40004)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007dff81)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x001fffe7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffd80048)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff81ff97)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff3bffb5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x79e9ffb0)
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
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e16,m2
    vle16.v v28, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m2
    vle16.v v10, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 41 # VL = 41
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v28)       = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]

    # VS2 (v10)       = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]
    # MASK (v0)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0    1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [  ff   ff   mm   mm   mm   mm   mm   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm   mm   ff   mm   ff   mm]
    # VD (v4)  BEFORE = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # VD (v4)  AFTER  = [0016 0049 169d bce8 3b9b 3ddc 0cc9 0031 0068 6678 f22b 6484 86b0 81d4 4bfb 003d 000e e156 f632 003e e0e9 0038 426b 8dfb da4c ffef 9b1a 8042 ff6d cd04 ffe9 848f]

    # VS1 (+1)       = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]

    # VS2 (+1)       = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]
    # MASK (+1)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1    0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  ff   ff   mm   mm   mm   mm   mm   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm   mm   ff   mm   ff   mm]
    # VD (+1) BEFORE = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # VD (+1) AFTER  = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ff97 ffd8 0048 001f ffe7 9fcb ff81 a216 7b52]


    
    
    vwsub.vv v4, v10, v28, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffe9848f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff6dcd04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b1a8042)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xda4cffef)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x426b8dfb)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe0e90038)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf632003e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x000ee156)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00686678)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0cc90031)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3b9b3ddc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x169dbce8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00160049)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa2167b52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9fcbff81)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x001fffe7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffd80048)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8bfcff97)
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
    vsetvli x0, x8, e16,m2
    vle16.v v30, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m2
    vle16.v v14, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 32 # VL = 32
    vsetvli x7, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v30)       = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]

    # VS2 (v14)       = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # VD (v0)  AFTER  = [ff3b ffb5 ff81 ff97 ffd8 0048 001f ffe7 007d ff81 ffa4 0004 0016 0049 0034 0026 ff9e ff7e 007c 0031 0068 001f fff7 0075 003f 0032 0016 ff44 000e 0045 ffb3 003e]

    # VS1 (+1)       = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]

    # VS2 (+1)       = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # VD (+1) AFTER  = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]


    
    
    vwsub.vv v0, v14, v30
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffb3003e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x000e0045)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0016ff44)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x003f0032)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfff70075)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0068001f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007c0031)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff9eff7e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00340026)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00160049)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffa40004)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x007dff81)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x001fffe7)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffd80048)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff81ff97)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff3bffb5)
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
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+512
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+192
    vsetvli x0, x4, e16,m2
    vle16.v v2, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v2)        = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]

    # VS2 (v16)       = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]
    # MASK (v0)       = [   0    1    1    0    1    0    1    1    0    0    1    1    1    1    0    0    0    0    0    0    0    1    0    0    1    1    1    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   ff   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   mm   mm   ff   ff   ff   mm   mm   ff   mm   ff]
    # VD (v28) BEFORE = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # VD (v28) AFTER  = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f 00e3 ffb0 ff3b ffb5 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 ff81 f22b 6484 0016 0049 0034 003d 73b3 ff7e f632 0031]

    # VS1 (+1)       = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]

    # VS2 (+1)       = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]
    # MASK (+1)       = [   1    1    0    0    1    0    0    0    0    1    0    0    1    1    1    0    1    1    0    1    0    1    0    0    1    1    0    0    0    1    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   ff   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   mm   mm   ff   ff   ff   mm   mm   ff   mm   ff]
    # VD (+1) BEFORE = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # VD (+1) AFTER  = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]


    
    
    vwsub.vv v28, v16, v2, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6320031)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x73b3ff7e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0034003d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00160049)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf22b6484)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x93b0ff81)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff3bffb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00e3ffb0)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x66652ebf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdfcadfe1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3be0154f)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+204
    vsetvli x0, x4, e16,m2
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v18, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v0)        = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]

    # VS2 (v18)       = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # VD (v24) AFTER  = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f ffa1 ff85 0002 00f4 006c 007b 00e3 ffb0 ff3b ffb5 ff81 ff97 ffd8 0048 001f ffe7]

    # VS1 (+1)       = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]

    # VS2 (+1)       = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # VD (+1) AFTER  = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]


    
    
    vwsub.vv v24, v18, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x001fffe7)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffd80048)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff81ff97)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff3bffb5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00e3ffb0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x006c007b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x000200f4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffa1ff85)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+576
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+216
    vsetvli x0, x4, e16,m2
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v4)        = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]

    # VS2 (v24)       = [  e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78]
    # MASK (v0)       = [   1    0    0    1    1    0    0    0    0    1    1    1    1    1    1    1    0    0    1    0    0    0    1    0    1    0    1    1    1    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   ff   ff   mm   ff]
    # VD (v20) BEFORE = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # VD (v20) AFTER  = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f 0067 7b52 0079 2532 ff70 ff50 ffa1 ff85 0cc9 00f4]

    # VS1 (+1)       = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]

    # VS2 (+1)       = [  0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92]
    # MASK (+1)       = [   0    1    1    1    0    1    0    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0    0    1    0    0    0    0    0    1    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   ff   ff   mm   ff]
    # VD (+1) BEFORE = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # VD (+1) AFTER  = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]


    
    
    vwsub.vv v20, v24, v4, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0cc900f4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffa1ff85)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff70ff50)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00792532)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00677b52)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+228
    vsetvli x0, x4, e16,m2
    vle16.v v6, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v20, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v6)        = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]

    # VS2 (v20)       = [  4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # VD (v16) AFTER  = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 ffef 0088 0069 004a ffdb 0002 ff7f 000c]

    # VS1 (+1)       = [  24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9]

    # VS2 (+1)       = [  47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # VD (+1) AFTER  = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]


    
    
    vwsub.vv v16, v20, v6
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff7f000c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffdb0002)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0069004a)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffef0088)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+640
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+240
    vsetvli x0, x4, e16,m2
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v22, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 8, LMUL = 2, Use Mask = 1, VL = 6\n")
   
    





    # VS1 (v8)        = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]

    # VS2 (v22)       = [  52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f]
    # MASK (v0)       = [   1    0    0    1    1    1    0    1    1    1    0    0    1    1    1    0    1    1    0    0    1    1    0    0    1    0    1    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   mm   mm   mm   ff]
    # VD (v12) BEFORE = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # VD (v12) AFTER  = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 0082 ffcc 9705 6592 e92f 002d]

    # VS1 (+1)       = [  4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3]

    # VS2 (+1)       = [  e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd]
    # MASK (+1)       = [   1    1    1    0    0    0    0    1    1    0    0    1    1    1    0    1    1    0    0    0    0    0    1    1    1    0    0    0    1    0    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   mm   mm   mm   ff]
    # VD (+1) BEFORE = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # VD (+1) AFTER  = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]


    
    
    vwsub.vv v12, v22, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xe92f002d)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x97056592)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0082ffcc)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+252
    vsetvli x0, x4, e16,m2
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v26, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 4 # VL = 4
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 8, LMUL = 2, Use Mask = 0, VL = 4\n")
   
    





    # VS1 (v12)       = [  0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92]

    # VS2 (v26)       = [  c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]
    # VD (v8)  AFTER  = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 fff4 fff7 ff48 0083]

    # VS1 (+1)       = [  d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71]

    # VS2 (+1)       = [  66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff]
    # VD (+1) BEFORE = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]
    # VD (+1) AFTER  = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]


    
    
    vwsub.vv v8, v26, v12
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff480083)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfff4fff7)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x5, test_1_maskdata+704
    vle16.v v0, (x5)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+264
    vsetvli x0, x4, e16,m2
    vle16.v v10, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v28, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 8, LMUL = 2, Use Mask = 1, VL = 2\n")
   
    





    # VS1 (v10)       = [  47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc]

    # VS2 (v28)       = [  c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19]
    # MASK (v0)       = [   1    1    0    0    1    1    1    0    1    0    1    1    0    1    0    1    1    0    1    0    1    1    1    0    1    0    1    0    1    1    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm]
    # VD (v4)  BEFORE = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]
    # VD (v4)  AFTER  = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 0056 81e3]

    # VS1 (+1)       = [  3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae]

    # VS2 (+1)       = [  69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66]
    # MASK (+1)       = [   1    0    0    0    1    1    0    0    1    1    1    1    0    1    1    0    1    0    1    0    0    0    0    1    1    1    0    0    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm]
    # VD (+1) BEFORE = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]
    # VD (+1) AFTER  = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]


    
    
    vwsub.vv v4, v28, v10, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x005681e3)
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95a74545)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8b4ecba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd1b37e5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    la x2, test_1_data+276
    vsetvli x0, x4, e16,m2
    vle16.v v14, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m2
    vle16.v v30, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 8, LMUL = 2, Use Mask = 0, VL = 0\n")
   
    





    # VS1 (v14)       = [  e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd]

    # VS2 (v30)       = [  4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (v0)  BEFORE = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]
    # VD (v0)  AFTER  = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]

    # VS1 (+1)       = [  73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5]

    # VS2 (+1)       = [  35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+1) BEFORE = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]
    # VD (+1) AFTER  = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]


    
    
    vwsub.vv v0, v30, v14
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e16,m4
    vse16.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
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
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfde223d8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdbee5e94)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x982bc336)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x65e3c70c)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb64b71f6)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x86604880)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x700a8d4e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63b91dcd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x04b11e73)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x355e64a2)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95a74545)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x8b4ecba8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xcd1b37e5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4f031546)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x918f472f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xac98e804)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+768
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+288
    vsetvli x0, x8, e16,m2
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v2, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 64 # VL = 64
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 8, LMUL = 2, Use Mask = 1, VL = 64\n")
   
    





    # VS1 (v16)       = [  66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c]

    # VS2 (v2)        = [  df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38]
    # MASK (v0)       = [   1    1    1    1    0    0    0    1    0    1    0    0    0    1    0    0    0    1    0    0    1    1    1    1    0    0    1    1    0    1    0    0]
    # ELEMENTS          [  ff   ff   ff   ff   mm   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm   mm   mm   ff   mm   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   ff   mm   mm]
    # VD (v28) BEFORE = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]
    # VD (v28) AFTER  = [ff79 ff65 ffb1 0022 fde2 23d8 4c45 ffcf 3533 fffb 734b 985d f1bc fff4 6915 0191 3be0 ffde dfca dfe1 008b 0036 003a 00b8 4daa 96d5 0038 ff76 4ed8 ffe6 c3a2 2eae]

    # VS1 (+1)       = [  fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1]

    # VS2 (+1)       = [  db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f]
    # MASK (+1)       = [   0    0    0    0    1    0    0    1    1    0    0    1    1    0    1    0    0    1    0    0    1    1    1    1    1    0    0    0    1    1    1    0]
    # ELEMENTS          [  ff   ff   ff   ff   mm   mm   mm   ff   mm   ff   mm   mm   mm   ff   mm   mm   mm   ff   mm   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   ff   mm   mm]
    # VD (+1) BEFORE = [995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]
    # VD (+1) AFTER  = [995c cbf8 1151 057d ffb1 98a1 ac98 ffcd 0017 472f 4f03 0010 ffc2 37e5 0070 cba8 95a7 008f 355e 64a2 ff88 ffa7 ffd7 00bc 002e 8d4e 8660 4880 005c 0016 0036 c70c]


    
    
    vwsub.vv v28, v2, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc3a22eae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4ed8ffe6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0038ff76)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4daa96d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x003a00b8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x008b0036)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdfcadfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be0ffde)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x69150191)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcfff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x734b985d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3533fffb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4c45ffcf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfde223d8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb10022)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff79ff65)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0036c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x005c0016)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x86604880)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x002e8d4e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffd700bc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff88ffa7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x355e64a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a7008f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0070cba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc237e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f030010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0017472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98ffcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb198a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+300
    vsetvli x0, x8, e16,m2
    vle16.v v18, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 8, LMUL = 2, Use Mask = 0, VL = 57\n")
   
    





    # VS1 (v18)       = [  69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66]

    # VS2 (v0)        = [  f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]
    # VD (v24) AFTER  = [ff88 ffa7 ffd7 00bc 002e 0035 ffec ff42 005c 0016 0036 006e ff79 ff65 ffb1 0022 008f 00c0 ffc6 ffcf ff8a fffb 00d2 001b 0067 fff4 fff5 ffb9 ff98 ffde ff39 ffb6]

    # VS1 (+1)       = [  65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d]

    # VS2 (+1)       = [  b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]
    # VD (+1) AFTER  = [7cba ceb7 dc44 7722 31a2 01a7 995c ffd6 ffbd 003d ff65 00a2 ffde 000c 003b ffbc ffb1 ff9d 0011 ffcd 0017 0012 000a 0010 ffc2 ffe8 0070 ff9e 0082 008f ffc0 0010]


    
    
    vwsub.vv v24, v0, v18
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff39ffb6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff98ffde)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfff5ffb9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0067fff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00d2001b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff8afffb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc6ffcf)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x008f00c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb10022)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff79ff65)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0036006e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x005c0016)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffecff42)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x002e0035)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffd700bc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff88ffa7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc00010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0082008f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0070ff9e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc2ffe8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000a0010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00170012)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0011ffcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb1ff9d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x003bffbc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffde000c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff6500a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffbd003d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995cffd6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a201a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc447722)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbaceb7)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+832
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+312
    vsetvli x0, x8, e16,m2
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v4, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 8, LMUL = 2, Use Mask = 1, VL = 41\n")
   
    





    # VS1 (v24)       = [  35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf   d7   a5   68   f0]

    # VS2 (v4)        = [  4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f   df   ca   df   e1   66   65   2e   bf]
    # MASK (v0)       = [   0    0    0    0    0    0    1    0    1    0    1    0    1    1    0    0    1    1    1    1    0    0    1    1    0    0    1    1    0    1    1    0]
    # ELEMENTS          [  mm   mm   mm   mm   mm   mm   ff   mm   ff   mm   ff   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   mm   ff   ff   mm   ff   ff   mm]
    # VD (v20) BEFORE = [04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1]
    # VD (v20) AFTER  = [04b1 1e73 63b9 1dcd 700a 8d4e 0070 4880 0082 71f6 ffc0 c70c ff88 ffa7 dbee 5e94 002e 0035 ffec ff42 3533 08fb 0036 006e f1bc d84d ffb1 0022 3be0 00c0 ffc6 dfe1]

    # VS1 (+1)       = [  70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b]

    # VS2 (+1)       = [  63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8]
    # MASK (+1)       = [   1    0    0    0    0    0    1    1    0    0    0    1    1    0    1    1    0    1    0    1    0    1    0    1    1    0    0    0    0    0    1    1]
    # ELEMENTS          [  mm   mm   mm   mm   mm   mm   ff   mm   ff   mm   ff   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   ff   ff   mm   mm   ff   ff   mm   ff   ff   mm]
    # VD (+1) BEFORE = [08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2]
    # VD (+1) AFTER  = [08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 00a2 ffde 37e5 8b4e cba8 95a7 4545 0011 ffcd]


    
    
    vwsub.vv v20, v4, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc6dfe1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3be000c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb10022)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xf1bcd84d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0036006e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x353308fb)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffecff42)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x002e0035)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdbee5e94)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff88ffa7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc0c70c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x008271f6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00704880)
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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0011ffcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x95a74545)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x8b4ecba8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffde37e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f0300a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c98a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a201a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc447722)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbaceb7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0d2e0a7a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x022f6618)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x08dc09ff)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x2, test_1_data+324
    vsetvli x0, x8, e16,m2
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m2
    vle16.v v6, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 8, LMUL = 2, Use Mask = 0, VL = 32\n")
   
    





    # VS1 (v20)       = [  db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91   3b   e0   15   4f]

    # VS2 (v6)        = [  98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d   f1   bc   d8   4d   69   15   01   91]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d]
    # VD (v16) AFTER  = [ffbd 003d ff65 00a2 ffde 000c 003b ffbc ffb1 ff9d 0011 ffcd 0017 0012 000a 0010 ffc2 ffe8 0070 ff9e 0082 008f ffc0 0010 ff88 ffa7 ffd7 00bc 002e 0035 ffec ff42]

    # VS1 (+1)       = [  35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36]

    # VS2 (+1)       = [  95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]
    # VD (+1) AFTER  = [2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5]


    
    
    vwsub.vv v16, v6, v20
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e16,m4
    vse16.v v16, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffecff42)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x002e0035)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffd700bc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff88ffa7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc00010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0082008f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0070ff9e)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffc2ffe8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x000a0010)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00170012)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0011ffcd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffb1ff9d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x003bffbc)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffde000c)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff6500a2)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffbd003d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xcd1b37e5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x4f031546)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x918f472f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xac98e804)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x311c98a1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x1151057d)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x995ccbf8)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x31a201a7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xdc447722)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7cbaceb7)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0d2e0a7a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x022f6618)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x08dc09ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc180944a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa77d21f4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x24941503)
#endif
    





    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
    
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+896
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+336
    vsetvli x0, x7, e16,m2
    vle16.v v22, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v12, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 8, LMUL = 2, Use Mask = 1, VL = 23\n")
   
    





    # VS1 (v22)       = [  b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb   73   4b   98   5d]

    # VS2 (v8)        = [  86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8   4c   45   12   0b   35   33   08   fb]
    # MASK (v0)       = [   0    0    0    0    0    1    1    1    1    0    0    1    0    0    0    1    0    1    1    1    1    1    0    1    0    1    0    0    1    0    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   mm   ff   mm   mm   mm   ff   mm   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm   ff   mm   ff   ff]
    # VD (v12) BEFORE = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b]
    # VD (v12) AFTER  = [918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e ffd6 04b1 1e73 63b9 00a2 700a 000c 003b ffbc ffb1 ff9d 65e3 ffcd 982b 0012 dbee 5e94 ffc2 23d8 0070 ff9e]

    # VS1 (+1)       = [  cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80]

    # VS2 (+1)       = [  4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e]
    # MASK (+1)       = [   0    1    1    0    0    1    1    0    1    1    0    1    1    0    1    0    0    1    1    0    0    1    0    0    1    0    1    0    1    0    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   mm   mm   ff   mm   mm   mm   ff   mm   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm   ff   mm   ff   ff]
    # VD (+1) BEFORE = [a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]
    # VD (+1) AFTER  = [a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804]


    
    
    vwsub.vv v12, v8, v22, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v12, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0070ff9e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc223d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xdbee5e94)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x982b0012)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x65e3ffcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffb1ff9d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003bffbc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x700a000c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b900a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04b11e73)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x355effd6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+348
    vsetvli x0, x7, e16,m2
    vle16.v v26, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v12, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v8, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 8, LMUL = 2, Use Mask = 0, VL = 16\n")
   
    





    # VS1 (v26)       = [  63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94   fd   e2   23   d8]

    # VS2 (v12)       = [  04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c   98   2b   c3   36   db   ee   5e   94]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336]
    # VD (v8)  AFTER  = [1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 ff51 0068 00aa ffea 00cd ffb8 0004 ffd6 ffbd 003d ff65 00a2 ffde 000c 003b ffbc]

    # VS1 (+1)       = [  ac   98   e8   04   91   8f   47   2f   4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73]

    # VS2 (+1)       = [  31   1c   98   a1   ac   98   e8   04   91   8f   47   2f   4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8]
    # VD (+1) AFTER  = [3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8]


    
    
    vwsub.vv v8, v12, v26
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v8, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x003bffbc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffde000c)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff6500a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffbd003d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0004ffd6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00cdffb8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00aaffea)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff510068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e8,m1
    # address for mask data. 
    la x8, test_1_maskdata+960
    vle16.v v0, (x8)  
    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+360
    vsetvli x0, x7, e16,m2
    vle16.v v28, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v10, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v4, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 8, LMUL = 2, Use Mask = 1, VL = 10\n")
   
    





    # VS1 (v28)       = [  95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6   65   e3   c7   0c]

    # VS2 (v10)       = [  8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e   86   60   48   80   b6   4b   71   f6]
    # MASK (v0)       = [   0    1    0    0    1    1    0    0    1    0    0    0    0    0    0    1    0    0    0    1    1    1    1    0    1    1    0    0    1    1    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   ff   mm   mm   ff   ff   ff   ff]
    # VD (v4)  BEFORE = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880]
    # VD (v4)  AFTER  = [dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 ff45 64a2 ffd0 0015 63b9 1dcd ff51 0068 00aa ffea]

    # VS1 (+1)       = [  99   5c   cb   f8   11   51   05   7d   31   1c   98   a1   ac   98   e8   04   91   8f   47   2f   4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8]

    # VS2 (+1)       = [  31   a2   01   a7   99   5c   cb   f8   11   51   05   7d   31   1c   98   a1   ac   98   e8   04   91   8f   47   2f   4f   03   15   46   cd   1b   37   e5]
    # MASK (+1)       = [   1    0    0    0    0    0    0    0    1    0    0    0    0    1    0    1    1    1    0    1    1    0    1    1    1    1    1    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   ff   mm   mm   ff   ff   ff   ff]
    # VD (+1) BEFORE = [4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7]
    # VD (+1) AFTER  = [4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff 022f 6618 0d2e 0a7a 7cba ceb7]


    
    
    vwsub.vv v4, v10, v28, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v4, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00aaffea)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff510068)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63b91dcd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffd00015)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff4564a2)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x95a74545)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf1fab3f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33c2fbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4736f5f4)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+372
    vsetvli x0, x7, e16,m2
    vle16.v v30, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m2
    vle16.v v14, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v0, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e8,m2 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 8, LMUL = 2, Use Mask = 0, VL = 8\n")
   
    





    # VS1 (v30)       = [  4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd   70   0a   8d   4e]

    # VS2 (v14)       = [  91   8f   47   2f   4f   03   15   46   cd   1b   37   e5   8b   4e   cb   a8   95   a7   45   45   35   5e   64   a2   04   b1   1e   73   63   b9   1d   cd]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73]
    # VD (v0)  AFTER  = [022f 6618 0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 ffa1 fff8 0001 00a6 fff3 ffaf 0090 ff7f]

    # VS1 (+1)       = [  7c   ba   ce   b7   dc   44   77   22   31   a2   01   a7   99   5c   cb   f8   11   51   05   7d   31   1c   98   a1   ac   98   e8   04   91   8f   47   2f]

    # VS2 (+1)       = [  0d   2e   0a   7a   7c   ba   ce   b7   dc   44   77   22   31   a2   01   a7   99   5c   cb   f8   11   51   05   7d   31   1c   98   a1   ac   98   e8   04]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [44aa e55f bacc 4de5 603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff]
    # VD (+1) AFTER  = [44aa e55f bacc 4de5 603b 2dde 4736 f5f4 e33c 2fbf f1fa b3f6 3909 add5 c86b 2e3b 9f12 0f74 a918 c6bb f0ed a4d8 a6f6 7a71 2494 1503 a77d 21f4 c180 944a 08dc 09ff]


    
    
    vwsub.vv v0, v14, v30
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e16,m4
    vse16.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0090ff7f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfff3ffaf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x000100a6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffa1fff8)
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
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08dc09ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc180944a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa77d21f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x24941503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa6f67a71)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf0eda4d8)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa918c6bb)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9f120f74)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc86b2e3b)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3909add5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf1fab3f6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe33c2fbf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x4736f5f4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x603b2dde)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbacc4de5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x44aae55f)
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
	.word 0xefd9fc64
	.word 0x40a4c67f
	.word 0xe0ef1db1
	.word 0x7b33bf3c
	.word 0xbec4020c
	.word 0xf30bae62
	.word 0xd7e22955
	.word 0x733fe2e7
	.word 0x101c6692
	.word 0x3af28e0c
	.word 0x2bd72a03
	.word 0x3e93d357
	.word 0x151a01ef
	.word 0x86569d27
	.word 0x429ede3d
	.word 0x20219a51

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
	.fill 128, 4, 0xdeadbeef
signature_2_0:
	.fill 128, 4, 0xdeadbeef
signature_3_0:
	.fill 128, 4, 0xdeadbeef
signature_4_0:
	.fill 128, 4, 0xdeadbeef
signature_5_0:
	.fill 128, 4, 0xdeadbeef
signature_6_0:
	.fill 128, 4, 0xdeadbeef
signature_7_0:
	.fill 128, 4, 0xdeadbeef
signature_8_0:
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

