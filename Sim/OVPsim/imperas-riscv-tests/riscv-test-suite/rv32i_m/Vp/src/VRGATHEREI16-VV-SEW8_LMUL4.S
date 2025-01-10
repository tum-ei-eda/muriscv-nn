// RISC-V Architectural Validation Test VRGATHEREI16-VV-SEW8_LMUL4
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
//    SEW=8, LMUL=4
// Description: Testing instruction 'vrgatherei16.vv'.

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
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+0
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+0
    li x7, 4
    add x6, x6, x7
    vle8.v v16, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v28, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x16, 0x0
    vid.v v8
    vadd.vx v8, v8, x16

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 0: SEW = 8, LMUL = 4, Use Mask = 1, VL = 128\n")
   
    





    # VS1 (v8)        = [f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27 151a 01ef]

    # VS2 (v16)       = [  c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d   86   56   9d   27]
    # MASK (v0)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0    0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (v28) BEFORE = [  e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d]
    # VD (v28) AFTER  = [  e5   4c   8c   3a   c7   1f   ad   64   e3   1f   fa   0f   bd   66   6c   0f   bd   8f   6c   65   91   a8   d5   51   42   9e   de   51   86   56   9d   27]

    # VS1 (+1)       = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]

    # VS2 (+1)       = [  34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e]
    # MASK (+1)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db]
    # VD (+1) AFTER  = [  34   ef   5f   f4   34   00   a3   d4   f6   5b   a3   bf   19   ba   7a   bf   2c   ba   7a   47   06   92   c8   df   06   92   60   df   7c   4c   8c   1e]

    # VS1 (+2)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]

    # VS2 (+2)       = [  52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4]
    # MASK (+2)       = [   0    1    0    0    0    0    1    0    1    0    0    1    1    1    1    0    1    1    0    1    1    1    1    0    0    0    1    1    1    1    0    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]
    # VD (+2) AFTER  = [  d4   33   36   50   52   33   39   dd   b2   4d   39   c5   b0   2d   66   c5   67   dd   66   92   68   14   54   92   68   14   7a   d9   3a   ef   7a   f4]

    # VS1 (+3)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]

    # VS2 (+3)       = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]
    # MASK (+3)       = [   0    0    1    0    0    0    0    0    0    0    1    0    0    0    0    1    1    0    0    1    1    0    1    0    0    1    0    1    0    0    0    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]
    # VD (+3) AFTER  = [  38   74   67   a5   5b   08   67   87   62   f6   a9   6d   a9   68   a9   d8   c8   bc   7d   30   37   3b   40   30   37   fc   40   d5   18   fc   88   50]


    
    vrgatherei16.vv v28, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v28, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x86569d27)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x429ede51)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x91a8d551)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbd8f6c65)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xbd666c0f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe31ffa0f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc71fad64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe54c8c3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c4c8c1e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x069260df)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692c8df)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2cba7a47)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x19ba7abf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf65ba3bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3400a3d4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34ef5ff4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3aef7af4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x68147ad9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x68145492)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x67dd6692)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb02d66c5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb24d39c5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x523339dd)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd4333650)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x18fc8850)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x37fc40d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x373b4030)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc8bc7d30)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa968a9d8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x62f6a96d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b086787)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x387467a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+12
    li x7, 4
    add x6, x6, x7
    vle8.v v20, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v24, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x15, 0x0
    vid.v v0
    vadd.vx v0, v0, x15

    li  x8, 105 # VL = 105
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 1: SEW = 8, LMUL = 4, Use Mask = 0, VL = 105\n")
   
    





    # VS1 (v0)        = [3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51]

    # VS2 (v20)       = [  06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [  2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65]
    # VD (v24) AFTER  = [  06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd]

    # VS1 (+1)       = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]

    # VS2 (+1)       = [  68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7]
    # VD (+1) AFTER  = [  68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47]

    # VS1 (+2)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]

    # VS2 (+2)       = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]
    # VD (+2) AFTER  = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]

    # VS1 (+3)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]

    # VS2 (+3)       = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]
    # VD (+3) AFTER  = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   7f   d1   bc   7d   d8   c8   3b   3c   30]


    
    vrgatherei16.vv v24, v20, v0
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v24, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x37bf4071)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc83b3c30)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1bc7dd8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x62f6cb7f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b086787)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3874f8a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6075c1a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x951e8621)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ff09378)
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+64
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+24
    li x7, 4
    add x6, x6, x7
    vle8.v v4, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v20, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x14, 0x1
    vid.v v24
    vadd.vx v24, v24, x14

    li  x8, 78 # VL = 78
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 2: SEW = 8, LMUL = 4, Use Mask = 1, VL = 78\n")
   
    





    # VS1 (v24)       = [b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f]

    # VS2 (v4)        = [  19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64]
    # MASK (v0)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0    0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (v20) BEFORE = [  f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a]
    # VD (v20) AFTER  = [  f6   00   5b   62   19   fb   62   bf   e7   ba   63   c8   47   63   c8   47   06   92   da   df   db   e5   4c   8c   1e   c7   8c   ad   c7   e3   ad   3a]

    # VS1 (+1)       = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]

    # VS2 (+1)       = [  b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1]
    # MASK (+1)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1    0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+1) BEFORE = [  82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4]
    # VD (+1) AFTER  = [  82   4d   d3   f1   c5   d3   2d   c5   3e   67   dd   3e   92   68   14   54   68   34   54   7a   d9   3a   ef   5f   f4   34   b8   0f   34   f6   0f   d4]

    # VS1 (+2)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]

    # VS2 (+2)       = [  a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae]
    # MASK (+2)       = [   0    0    1    1    0    1    0    0    0    0    1    0    0    1    1    0    0    1    1    1    1    0    1    0    1    1    0    1    1    0    0    1]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+2) BEFORE = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]
    # VD (+2) AFTER  = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   fc   88   d5   fc   98   d5   50   52   36   a4   dd   33   a4   39]

    # VS1 (+3)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]

    # VS2 (+3)       = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]
    # MASK (+3)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0    0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+3) BEFORE = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]
    # VD (+3) AFTER  = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]


    
    vrgatherei16.vv v20, v4, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v20, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc7e3ad3a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1ec78cad)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdbe54c8c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0692dadf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4763c847)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe7ba63c8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x19fb62bf)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf6005b62)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x34f60fd4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xf434b80f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd93aef5f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6834547a)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x92681454)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3e67dd3e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc5d32dc5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x824dd3f1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdd33a439)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x505236a4)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5fc98d5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x37bffc88)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc83b3c30)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1bc7dd8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa968a97f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x62f6cb6d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b086787)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3874f8a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6075c1a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x951e8621)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ff09378)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b327ba8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03d5081b)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+36
    li x7, 4
    add x6, x6, x7
    vle8.v v24, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v16, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x13, 0x4
    vid.v v0
    vadd.vx v0, v0, x13

    li  x8, 64 # VL = 64
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 3: SEW = 8, LMUL = 4, Use Mask = 0, VL = 64\n")
   
    





    # VS1 (v0)        = [5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e]

    # VS2 (v24)       = [  3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [  34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df]
    # VD (v16) AFTER  = [  34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df]

    # VS1 (+1)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]

    # VS2 (+1)       = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]
    # VD (+1) AFTER  = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]

    # VS1 (+2)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]

    # VS2 (+2)       = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]
    # VD (+2) AFTER  = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]

    # VS1 (+3)       = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]

    # VS2 (+3)       = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]
    # VD (+3) AFTER  = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]


    
    vrgatherei16.vv v16, v24, v0
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
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
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x37bf4071)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc83b3c30)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1bc7dd8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa968a97f)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x62f6cb6d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5b086787)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3874f8a5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x6075c1a2)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x951e8621)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4ff09378)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x9b327ba8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a4c52)
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vle8.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v12, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x12, 0x8
    vid.v v16
    vadd.vx v16, v16, x12

    li  x4, 57 # VL = 57
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 4, Use Mask = 1, VL = 57\n")
   
    





    # VS1 (v16)       = [37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847]

    # VS2 (v28)       = [  67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7]
    # MASK (v0)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0    0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (v12) BEFORE = [  b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf]
    # VD (v12) AFTER  = [  b0   d3   66   c5   b0   dd   66   3e   68   14   54   c0   68   26   7a   d9   3a   26   7a   f4   34   ef   5f   f4   34   00   a3   d1   19   00   a3   d1]

    # VS1 (+1)       = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]

    # VS2 (+1)       = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]
    # MASK (+1)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0    1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+1) BEFORE = [  d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5]
    # VD (+1) AFTER  = [  d1   bc   7d   d8   c8   3b   3c   30   37   3b   3c   30   18   bf   88   d5   18   fc   88   d5   d4   33   a4   dd   52   4d   a4   ae   b2   4d   f1   ae]

    # VS1 (+2)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]

    # VS2 (+2)       = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]
    # MASK (+2)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1    1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+2) BEFORE = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]
    # VD (+2) AFTER  = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]

    # VS1 (+3)       = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]

    # VS2 (+3)       = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]
    # MASK (+3)       = [   1    0    0    1    0    1    0    1    0    0    0    1    1    1    1    0    1    0    0    0    0    1    1    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+3) BEFORE = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]
    # VD (+3) AFTER  = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]


    
    vrgatherei16.vv v12, v28, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x1900a3d1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3400a3d1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x34ef5ff4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3a267af4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x68267ad9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x681454c0)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb0dd663e)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb0d366c5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb24df1ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x524da4ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd433a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18bf88d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x373b3c30)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vle8.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v8, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x11, 0x1f
    vid.v v16
    vadd.vx v16, v16, x11

    li  x4, 41 # VL = 41
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 4, Use Mask = 0, VL = 41\n")
   
    





    # VS1 (v16)       = [a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1]

    # VS2 (v0)        = [  82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [  52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4]
    # VD (v8)  AFTER  = [  f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82]

    # VS1 (+1)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]

    # VS2 (+1)       = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]
    # VD (+1) AFTER  = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   38   74   f8   a5   5b   08   67   87   62]

    # VS1 (+2)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]

    # VS2 (+2)       = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]
    # VD (+2) AFTER  = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]

    # VS1 (+3)       = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]

    # VS2 (+3)       = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]
    # VD (+3) AFTER  = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]


    
    vrgatherei16.vv v8, v0, v16
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x33a4dd82)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x98365052)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc88d5d4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbf407118)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3b3c3037)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xbc7dd8c8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x68a97fd1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xf6cb6da9)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x08678762)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x74f8a55b)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf4038)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vle8.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v4, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x10, 0x10
    vid.v v8
    vadd.vx v8, v8, x10

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 4, Use Mask = 1, VL = 32\n")
   
    





    # VS1 (v8)        = [3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9]

    # VS2 (v16)       = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]
    # MASK (v0)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1    1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (v4)  BEFORE = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]
    # VD (v4)  AFTER  = [  37   68   40   71   18   fc   7d   d5   d4   3b   3c   50   37   33   40   71   18   4d   39   ae   d4   98   f1   50   52   33   a4   dd   82   dd   39   ae]

    # VS1 (+1)       = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]

    # VS2 (+1)       = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]
    # MASK (+1)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1    0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+1) BEFORE = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]
    # VD (+1) AFTER  = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]

    # VS1 (+2)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]

    # VS2 (+2)       = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]
    # MASK (+2)       = [   1    1    1    1    0    1    1    0    0    0    1    1    0    0    1    0    0    0    1    1    1    1    0    1    0    1    0    1    0    0    1    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+2) BEFORE = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]
    # VD (+2) AFTER  = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]

    # VS1 (+3)       = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]

    # VS2 (+3)       = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]
    # MASK (+3)       = [   0    1    1    1    0    0    1    1    1    0    1    1    0    0    1    1    1    1    1    0    0    0    0    1    0    1    0    1    0    1    1    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+3) BEFORE = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]
    # VD (+3) AFTER  = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]


    
    vrgatherei16.vv v4, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x82dd39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5233a4dd)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd498f150)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x184d39ae)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37334071)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd43b3c50)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18fc7dd5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37684071)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vle8.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v0, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x9, 0x1
    vid.v v24
    vadd.vx v24, v24, x9

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 4, Use Mask = 0, VL = 23\n")
   
    





    # VS1 (v24)       = [4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e]

    # VS2 (v8)        = [  d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [  a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae]
    # VD (v0)  AFTER  = [  a9   68   a9   7f   d1   bc   7d   d8   c8   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1]

    # VS1 (+1)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]

    # VS2 (+1)       = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]
    # VD (+1) AFTER  = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]

    # VS1 (+2)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]

    # VS2 (+2)       = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]
    # VD (+2) AFTER  = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]

    # VS1 (+3)       = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]

    # VS2 (+3)       = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]
    # VD (+3) AFTER  = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]


    
    vrgatherei16.vv v0, v8, v24
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xaeb2d3f1)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xdd824d39)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x505233a4)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd5d49836)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7118fc88)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc837bf40)
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
#endif
    





    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e8,m1
    # address for mask data. 
    la x13, test_1_maskdata+256
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vle8.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v28, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x8, 0x0
    vid.v v8
    vadd.vx v8, v8, x8

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 4, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v8)        = [03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd]

    # VS2 (v20)       = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]
    # MASK (v0)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (v28) BEFORE = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]
    # VD (v28) AFTER  = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   c8   bc   3c   d8   37   bf   3c   71   37   bf   40   d5   18   98   88   50]

    # VS1 (+1)       = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]

    # VS2 (+1)       = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]
    # MASK (+1)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1    1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+1) BEFORE = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]
    # VD (+1) AFTER  = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]

    # VS1 (+2)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]

    # VS2 (+2)       = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]
    # MASK (+2)       = [   0    1    0    0    0    1    0    0    0    1    0    1    1    1    0    1    1    0    1    0    1    0    0    0    1    1    0    0    1    1    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+2) BEFORE = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]
    # VD (+2) AFTER  = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]

    # VS1 (+3)       = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]

    # VS2 (+3)       = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]
    # MASK (+3)       = [   1    1    1    0    1    0    1    0    0    0    1    1    0    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1    1    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+3) BEFORE = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]
    # VD (+3) AFTER  = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]


    
    vrgatherei16.vv v28, v20, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v28, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18988850)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf40d5)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf3c71)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc8bc3cd8)
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
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vle8.v v12, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v24, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x7, 0x0
    vid.v v0
    vadd.vx v0, v0, x7

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 4, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v0)        = [4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071]

    # VS2 (v12)       = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]
    # VD (v24) AFTER  = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]

    # VS1 (+1)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]

    # VS2 (+1)       = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]
    # VD (+1) AFTER  = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]

    # VS1 (+2)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]

    # VS2 (+2)       = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]
    # VD (+2) AFTER  = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]

    # VS1 (+3)       = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]

    # VS2 (+3)       = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]
    # VD (+3) AFTER  = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]


    
    vrgatherei16.vv v24, v12, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc83b3c30)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1bc7dd8)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f6a97f)
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
    la x13, test_1_maskdata+320
    vle8.v v0, (x13)  
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vle8.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v20, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x6, 0x1
    vid.v v24
    vadd.vx v24, v24, x6

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 4, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v24)       = [8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f]

    # VS2 (v4)        = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (v20) BEFORE = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]
    # VD (v20) AFTER  = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   a5   5b   08   a5   5b   08   67   cb]

    # VS1 (+1)       = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]

    # VS2 (+1)       = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]
    # MASK (+1)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0    0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+1) BEFORE = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]
    # VD (+1) AFTER  = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]

    # VS1 (+2)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]

    # VS2 (+2)       = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]
    # MASK (+2)       = [   0    1    1    0    1    0    0    1    0    0    0    1    0    1    0    1    0    0    0    0    0    0    0    1    1    0    0    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+2) BEFORE = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]
    # VD (+2) AFTER  = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]

    # VS1 (+3)       = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]

    # VS2 (+3)       = [  e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78]
    # MASK (+3)       = [   1    1    1    1    0    0    0    1    1    0    1    1    1    1    0    0    1    1    0    1    1    0    0    0    0    1    0    0    1    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+3) BEFORE = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]
    # VD (+3) AFTER  = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]


    
    vrgatherei16.vv v20, v4, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 128
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b0867cb)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa55b08a5)
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
    vsetvli x3, x4, e8,m4
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vle8.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    vle8.v v16, (x2)       # Load value into vd
    add x2, x2, x3

    vsetvli x3, x4, e16,m8
    li x5, 0x4
    vid.v v0
    vadd.vx v0, v0, x5

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 4, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v0)        = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]

    # VS2 (v24)       = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]
    # VD (v16) AFTER  = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]

    # VS1 (+1)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]

    # VS2 (+1)       = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]
    # VD (+1) AFTER  = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]

    # VS1 (+2)       = [dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9]

    # VS2 (+2)       = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]
    # VD (+2) AFTER  = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]

    # VS1 (+3)       = [355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f]

    # VS2 (+3)       = [  4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]
    # VD (+3) AFTER  = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]


    
    vrgatherei16.vv v16, v24, v0
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m4
    vse8.v v16, (x1)  
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
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vle8.v v28, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v12, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x4, 0x8
    vid.v v16
    vadd.vx v16, v16, x4

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 4, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v16)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]

    # VS2 (v28)       = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]
    # MASK (v0)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0    0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (v12) BEFORE = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]
    # VD (v12) AFTER  = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   08   52]

    # VS1 (+1)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]

    # VS2 (+1)       = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]
    # MASK (+1)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+1) BEFORE = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]
    # VD (+1) AFTER  = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]

    # VS1 (+2)       = [f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3]

    # VS2 (+2)       = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]
    # MASK (+2)       = [   1    0    0    0    1    0    1    1    0    1    0    0    1    1    1    0    1    1    0    0    1    0    1    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+2) BEFORE = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]
    # VD (+2) AFTER  = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]

    # VS1 (+3)       = [cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d]

    # VS2 (+3)       = [  52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f]
    # MASK (+3)       = [   1    1    0    0    1    1    0    1    0    0    0    1    1    0    1    1    0    0    1    1    0    1    1    1    1    1    1    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+3) BEFORE = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]
    # VD (+3) AFTER  = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]


    
    vrgatherei16.vv v12, v28, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v12, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32a0852)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vle8.v v0, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v8, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x3, 0x1f
    vid.v v16
    vadd.vx v16, v16, x3

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 4, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v16)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]

    # VS2 (v0)        = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (v8)  BEFORE = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]
    # VD (v8)  AFTER  = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   fb   da]

    # VS1 (+1)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]

    # VS2 (+1)       = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+1) BEFORE = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]
    # VD (+1) AFTER  = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]

    # VS1 (+2)       = [4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71]

    # VS2 (+2)       = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+2) BEFORE = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]
    # VD (+2) AFTER  = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]

    # VS1 (+3)       = [ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8]

    # VS2 (+3)       = [  c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+3) BEFORE = [  24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9]
    # VD (+3) AFTER  = [  24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9]


    
    vrgatherei16.vv v8, v0, v16
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v8, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56fbda)
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
#endif
    



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e8,m1
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle8.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vle8.v v16, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v4, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x2, 0x10
    vid.v v8
    vadd.vx v8, v8, x2

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 4, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v8)        = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]

    # VS2 (v16)       = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]
    # MASK (v0)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0    1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (v4)  BEFORE = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]
    # VD (v4)  AFTER  = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]

    # VS1 (+1)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]

    # VS2 (+1)       = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]
    # MASK (+1)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1    0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+1) BEFORE = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]
    # VD (+1) AFTER  = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]

    # VS1 (+2)       = [982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae]

    # VS2 (+2)       = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]
    # MASK (+2)       = [   0    0    1    0    0    1    0    0    1    0    0    1    0    1    0    0    0    0    0    1    0    1    0    1    0    0    0    0    0    0    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+2) BEFORE = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]
    # VD (+2) AFTER  = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]

    # VS1 (+3)       = [995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c]

    # VS2 (+3)       = [  c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19]
    # MASK (+3)       = [   1    0    1    0    0    1    1    0    1    1    1    1    0    1    1    0    0    1    1    1    1    0    1    0    0    1    1    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+3) BEFORE = [  4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3]
    # VD (+3) AFTER  = [  4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3]


    
    vrgatherei16.vv v4, v16, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v4, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e8,m4
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vle8.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    vle8.v v0, (x6)       # Load value into vd
    add x6, x6, x7

    vsetvli x7, x8, e16,m8
    li x1, 0x1
    vid.v v24
    vadd.vx v24, v24, x1

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 4, Use Mask = 0, VL = 128\n")
   
    





    # VS1 (v24)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]

    # VS2 (v8)        = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]
    # VD (v0)  AFTER  = [  84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80]

    # VS1 (+1)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]

    # VS2 (+1)       = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78]
    # VD (+1) AFTER  = [  4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64]

    # VS1 (+2)       = [8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5]

    # VS2 (+2)       = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92]
    # VD (+2) AFTER  = [  b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67]

    # VS1 (+3)       = [7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e]

    # VS2 (+3)       = [  4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71]
    # VD (+3) AFTER  = [  00   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93]


    
    vrgatherei16.vv v0, v8, v24
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m4
    vse8.v v0, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x869b1a80)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfbda4c96)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2c426b8d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x52e0e909)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x56f6323d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3d73b3e1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd44bfb00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8486b081)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x78f22b64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc893b066)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdc0cc9d6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe83b9b3d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x32169dbc)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x52052525)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7fa2167b)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x4b9fcbe5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x92e92f67)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x15970565)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe98bfcad)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xcc4e1181)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x19445da8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xe3ea35fe)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xdd527e81)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb379e910)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x710be793)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x8cc47c5d)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3824e065)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xae47c6f6)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x66c3a22e)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1c4ed868)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd5e6b6a1)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x004daa96)
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

