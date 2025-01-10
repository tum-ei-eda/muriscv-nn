// RISC-V Architectural Validation Test VNCLIPU-WV-SEW8_LMUL4
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
// Description: Testing instruction 'vnclipu.wv'.

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
    vsetvli x0, x7, e16,m4
    vle16.v v4, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v16, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v28, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 128 # VL = 128
    vsetvli x6, x7, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 8, LMUL = 4, Use Mask = 1, VL = 128\n")
   
    





    # VS1 (v4)        = [  e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d   86   56   9d   27   15   1a   01   ef]

    # VS2 (v16)       = [34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd 2021 9a51 429e de3d 8656 9d27]
    # MASK (v0)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0    0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (v28) BEFORE = [  e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51   42   9e   de   3d]
    # VD (v28) AFTER  = [  e5   4c   8c   ff   c7   ff   ad   01   e3   1f   fa   ff   ff   66   ff   0f   bd   8f   6c   65   91   a8   d5   03   ff   ff   01   51   ff   38   ff   01]

    # VS1 (+1)       = [  f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a]

    # VS2 (+1)       = [5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4]
    # MASK (+1)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db]
    # VD (+1) AFTER  = [  ff   ef   5f   f4   34   15   ff   d4   f6   0f   a3   81   19   ff   d5   bf   ff   ba   7a   00   0b   ff   c8   0d   06   92   07   df   7c   f6   02   18]

    # VS1 (+2)       = [  82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4]

    # VS2 (+2)       = [426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5]
    # MASK (+2)       = [   0    1    0    0    0    0    1    0    1    0    0    1    1    1    1    0    1    1    0    1    1    1    1    0    0    0    1    1    1    1    0    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]
    # VD (+2) AFTER  = [  d4   04   36   50   52   33   ff   dd   ff   4d   39   04   91   00   b5   c5   18   ff   66   ff   ff   ff   27   92   68   14   01   ff   ff   c2   7a   ff]

    # VS1 (+3)       = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]

    # VS2 (+3)       = [8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c]
    # MASK (+3)       = [   0    0    1    0    0    0    0    0    0    0    1    0    0    0    0    1    1    0    0    1    1    0    1    0    0    1    0    1    0    0    0    1]
    # ELEMENTS          [  mm   mm   mm   ff   mm   ff   mm   ff   mm   mm   mm   ff   ff   mm   ff   mm   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   mm   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]
    # VD (+3) AFTER  = [  38   74   13   a5   5b   08   67   87   62   f6   00   6d   a9   68   a9   ff   1a   bc   7d   ff   f2   3b   87   30   37   00   40   ff   18   fc   88   00]


    
    
    vnclipu.wv v28, v16, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m4
    vse8.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff38ff01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff0151)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x91a8d503)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xbd8f6c65)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff66ff0f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe31ffaff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc7ffad01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xe54c8cff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7cf60218)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x069207df)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0bffc80d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffba7a00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x19ffd5bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf60fa381)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3415ffd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffef5ff4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffc27aff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x681401ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff2792)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18ff66ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9100b5c5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff4d3904)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5233ffdd)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd4043650)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x18fc8800)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x370040ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf23b8730)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1abc7dff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa968a9ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6006d)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5b086787)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x387413a5)
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+12
    vsetvli x0, x7, e16,m4
    vle16.v v0, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v8, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v24, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 105 # VL = 105
    vsetvli x6, x7, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 8, LMUL = 4, Use Mask = 0, VL = 105\n")
   
    





    # VS1 (v0)        = [  7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65   91   a8   d5   fd   20   21   9a   51]

    # VS2 (v8)        = [6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64 0466 250f bd8f 6c65 91a8 d5fd]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [  2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f   bd   8f   6c   65]
    # VD (v24) AFTER  = [  07   ff   ff   0f   ff   06   03   00   ff   ff   01   19   ff   01   0b   ff   69   ff   ff   01   07   01   0c   ff   ff   fa   23   01   ff   ff   24   ff]

    # VS1 (+1)       = [  34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df]

    # VS2 (+1)       = [951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7]
    # VD (+1) AFTER  = [  ff   ff   18   61   0e   02   01   ff   ff   cb   01   ff   ff   ff   ff   ff   1c   08   ff   01   1b   0e   15   ff   08   ff   b3   ff   ff   ff   1a   00]

    # VS1 (+2)       = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]

    # VS2 (+2)       = [73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]
    # VD (+2) AFTER  = [  74   0e   f6   ff   ff   09   ff   ff   ff   ff   ff   04   ff   06   7e   02   ff   ff   ff   30   ff   07   5f   04   08   00   ff   ff   9b   ff   ff   ff]

    # VS1 (+3)       = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]

    # VS2 (+3)       = [ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]
    # VD (+3) AFTER  = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   d7   94   0d   0f   ff   ff   01   ff   1f]


    
    
    vnclipu.wv v24, v8, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m4
    vse8.v v24, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff24ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffa2301)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x07010cff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x69ffff01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff010bff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff0119)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff060300)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x07ffff0f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff1a00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x08ffb3ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1b0e15ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x1c08ff01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffcb01ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e0201ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff1861)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x9bffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0800ffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff075f04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffff30)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff067e02)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffff04)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff09ffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x740ef6ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff01ff1f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x940d0fff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x62f6cbd7)
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
    vsetvli x0, x7, e16,m4
    vle16.v v8, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v24, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v20, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 78 # VL = 78
    vsetvli x6, x7, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 8, LMUL = 4, Use Mask = 1, VL = 78\n")
   
    





    # VS1 (v8)        = [  fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a   e3   1f   fa   64   04   66   25   0f]

    # VS2 (v24)       = [b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db e54c 8c1e c737 ad3a e31f fa64]
    # MASK (v0)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0    0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (v20) BEFORE = [  f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e   c7   37   ad   3a]
    # VD (v20) AFTER  = [  f6   00   2c   cc   19   ff   62   bf   d1   ba   0f   01   03   63   c8   47   06   92   da   df   59   ff   00   37   ff   01   8c   ff   c7   ff   ad   3a]

    # VS1 (+1)       = [  b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf]

    # VS2 (+1)       = [b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae]
    # MASK (+1)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1    0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+1) BEFORE = [  82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4]
    # VD (+1) AFTER  = [  82   4d   ff   02   a0   d3   ff   c5   60   ff   ff   3e   ff   ff   19   66   68   01   54   ff   ff   3c   00   ff   64   ff   ff   ff   34   15   0f   d4]

    # VS1 (+2)       = [  d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5]

    # VS2 (+2)       = [f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b]
    # MASK (+2)       = [   0    0    1    1    0    1    0    0    0    0    1    0    0    1    1    0    0    1    1    1    1    0    1    0    1    1    0    1    1    0    0    1]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+2) BEFORE = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]
    # VD (+2) AFTER  = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   ff   ff   ff   fc   ff   d5   ff   00   36   04   ff   33   a4   41]

    # VS1 (+3)       = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]

    # VS2 (+3)       = [0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678]
    # MASK (+3)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0    0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # ELEMENTS          [  mm   mm   ff   ff   mm   ff   mm   mm   ff   mm   ff   ff   ff   mm   mm   mm   mm   mm   mm   mm   ff   ff   ff   ff   ff   ff   mm   ff   mm   ff   mm   mm]
    # VD (+3) BEFORE = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]
    # VD (+3) AFTER  = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]


    
    
    vnclipu.wv v20, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m4
    vse8.v v20, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc7ffad3a)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff018cff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x59ff0037)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0692dadf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0363c847)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1ba0f01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x19ff62bf)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf6002ccc)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x34150fd4)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x64ffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff3c00ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x680154ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff1966)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x60ffff3e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xa0d3ffc5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x824dff02)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff33a441)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff003604)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfffcffd5)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x37bfffff)
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
#endif
    



    # Set VL to VLMAX and load values into registers
    li x7, -1
    la x5, test_1_data+36
    vsetvli x0, x7, e16,m4
    vle16.v v12, (x5)      # Load value into vs1
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m8
    vle16.v v0, (x5)      # Load value into vs2
    li x6, 4
    add x5, x5, x6
    vsetvli x0, x7, e16,m4
    vle16.v v16, (x5)       # Load value into vd
    li x6, 4
    add x5, x5, x6

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 8, LMUL = 4, Use Mask = 0, VL = 64\n")
   
    





    # VS1 (v12)       = [  34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df   7c   a6   60   db   e5   4c   8c   1e]

    # VS2 (v0)        = [d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7 2c63 c847 0692 dadf 7ca6 60db]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [  34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47   06   92   da   df]
    # VD (v16) AFTER  = [  ff   36   01   ff   ff   ff   ff   ff   58   0d   ff   00   0d   15   0d   f6   04   ff   35   20   ff   ff   06   01   10   ff   ff   19   35   0e   08   02]

    # VS1 (+1)       = [  52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4]

    # VS2 (+1)       = [0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0]
    # VD (+1) AFTER  = [  ff   ff   ff   08   f5   00   5a   01   ff   ff   ff   ff   ff   04   ff   03   71   08   ff   ff   63   ff   ff   ff   ff   ff   32   1e   0e   01   00   ff]

    # VS1 (+2)       = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]

    # VS2 (+2)       = [3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]
    # VD (+2) AFTER  = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]

    # VS1 (+3)       = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]

    # VS2 (+3)       = [47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]
    # VD (+3) AFTER  = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]


    
    
    vnclipu.wv v16, v0, v12
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m4
    vse8.v v16, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 128
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x350e0802)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x10ffff19)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff0601)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x04ff3520)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0d150df6)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x580dff00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff3601ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0e0100ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffff321e)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x63ffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7108ffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xff04ff03)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffffff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xf5005a01)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xffffff08)
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
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 8, LMUL = 4, Use Mask = 1, VL = 57\n")
   
    





    # VS1 (v16)       = [  68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf   fb   ba   7a   e7   2c   63   c8   47]

    # VS2 (v24)       = [c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4 f600 a3d1 195b 62bf fbba 7ae7]
    # MASK (v0)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0    0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (v12) BEFORE = [  b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1   19   5b   62   bf]
    # VD (v12) AFTER  = [  b0   ff   66   ff   ff   dd   35   1b   68   14   54   c0   ff   26   7a   d9   3a   ff   ff   f4   34   0f   ff   01   07   00   a3   d1   19   ff   fc   f6]

    # VS1 (+1)       = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]

    # VS2 (+1)       = [fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8]
    # MASK (+1)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0    1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+1) BEFORE = [  d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5]
    # VD (+1) AFTER  = [  d1   bc   7d   d8   c8   3b   3c   30   37   fb   0f   ff   18   ff   88   d5   ff   05   4b   02   ff   33   a4   dd   ff   4d   ff   ae   b2   05   f1   ff]

    # VS1 (+2)       = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]

    # VS2 (+2)       = [a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04]
    # MASK (+2)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1    1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+2) BEFORE = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]
    # VD (+2) AFTER  = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]

    # VS1 (+3)       = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]

    # VS2 (+3)       = [e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f]
    # MASK (+3)       = [   1    0    0    1    0    1    0    1    0    0    0    1    1    1    1    0    1    0    0    0    0    1    1    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [  mm   ff   mm   ff   ff   mm   ff   ff   mm   mm   mm   mm   ff   mm   mm   mm   mm   ff   ff   mm   mm   ff   ff   ff   ff   mm   mm   mm   mm   ff   ff   ff]
    # VD (+3) BEFORE = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]
    # VD (+3) AFTER  = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]


    
    
    vnclipu.wv v12, v24, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m4
    vse8.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x19fffcf6)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0700a3d1)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x340fff01)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3afffff4)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff267ad9)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x681454c0)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffdd351b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb0ff66ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb205f1ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff4dffae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff33a4dd)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff054b02)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18ff88d5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37fb0fff)
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
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 8, LMUL = 4, Use Mask = 0, VL = 41\n")
   
    





    # VS1 (v20)       = [  b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4   34   b8   0f   d4   f6   00   a3   d1]

    # VS2 (v0)        = [62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0 3426 7ad9 3aef 5ff4 34b8 0fd4]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v8)  BEFORE = [  52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9   3a   ef   5f   f4]
    # VD (v8)  AFTER  = [  ff   ff   ff   ff   ff   04   ff   01   6f   02   ff   ff   d5   ff   ff   ff   ff   e7   2d   79   2c   01   01   ff   ff   55   00   ff   ec   ff   ff   ff]

    # VS1 (+1)       = [  a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae]

    # VS2 (+1)       = [da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50]
    # VD (+1) AFTER  = [  5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   ff   ff   ff   ff   06   ff   08   2e   02]

    # VS1 (+2)       = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]

    # VS2 (+2)       = [9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]
    # VD (+2) AFTER  = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]

    # VS1 (+3)       = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]

    # VS2 (+3)       = [6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]
    # VD (+3) AFTER  = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]


    
    
    vnclipu.wv v8, v0, v20
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m4
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xecffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff5500ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x2c0101ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffe72d79)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd5ffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x6f02ffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff04ff01)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff082e02)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffff06)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37bf40ff)
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
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 8, LMUL = 4, Use Mask = 1, VL = 32\n")
   
    





    # VS1 (v24)       = [  d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92   68   14   54   c0   34   26   7a   d9]

    # VS2 (v16)       = [6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5 b02d 663e 67dd 3492 6814 54c0]
    # MASK (v0)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1    1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (v4)  BEFORE = [  37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e   67   dd   34   92]
    # VD (v4)  AFTER  = [  37   c2   40   71   18   fc   ff   d5   d4   05   69   50   ff   33   ff   ff   ff   4d   39   ae   a4   05   f1   ff   b3   ff   ff   ff   ff   dd   1a   2a]

    # VS1 (+1)       = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]

    # VS2 (+1)       = [f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621]
    # MASK (+1)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1    0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+1) BEFORE = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]
    # VD (+1) AFTER  = [  95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30]

    # VS1 (+2)       = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]

    # VS2 (+2)       = [445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156]
    # MASK (+2)       = [   1    1    1    1    0    1    1    0    0    0    1    1    0    0    1    0    0    0    1    1    1    1    0    1    0    1    0    1    0    0    1    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+2) BEFORE = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]
    # VD (+2) AFTER  = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]

    # VS1 (+3)       = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]

    # VS2 (+3)       = [6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19]
    # MASK (+3)       = [   0    1    1    1    0    0    1    1    1    0    1    1    0    0    1    1    1    1    1    0    0    0    0    1    0    1    0    1    0    1    1    0]
    # ELEMENTS          [  mm   ff   mm   mm   mm   mm   ff   mm   mm   ff   ff   mm   ff   mm   ff   ff   ff   mm   mm   mm   ff   ff   mm   ff   ff   ff   ff   ff   ff   mm   ff   ff]
    # VD (+3) BEFORE = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]
    # VD (+3) AFTER  = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]


    
    
    vnclipu.wv v4, v16, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m4
    vse8.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffdd1a2a)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xb3ffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xa405f1ff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff4d39ae)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff33ffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd4056950)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x18fcffd5)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x37c24071)
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
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 8, LMUL = 4, Use Mask = 0, VL = 23\n")
   
    





    # VS1 (v28)       = [  c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae   b2   d3   f1   c5   b0   2d   66   3e]

    # VS2 (v8)        = [9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650 5233 a4dd 824d 39ae b2d3 f1c5]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [  a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd   82   4d   39   ae]
    # VD (v0)  AFTER  = [  a9   68   a9   7f   d1   bc   7d   d8   c8   10   5b   ff   ff   cb   ff   ff   ff   ff   ff   02   ff   02   0c   02   ff   ff   ff   ff   ff   02   ff   04]

    # VS1 (+1)       = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]

    # VS2 (+1)       = [86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]
    # VD (+1) AFTER  = [  b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d]

    # VS1 (+2)       = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]

    # VS2 (+2)       = [79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]
    # VD (+2) AFTER  = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]

    # VS1 (+3)       = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]

    # VS2 (+3)       = [3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]
    # VD (+3) AFTER  = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]


    
    
    vnclipu.wv v0, v8, v28
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m4
    vse8.v v0, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 128
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff02ff04)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xff020c02)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffffff02)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xffcbffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc8105bff)
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
    vsetvli x0, x4, e16,m4
    vle16.v v4, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v16, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v28, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 8, LMUL = 4, Use Mask = 1, VL = 16\n")
   
    





    # VS1 (v4)        = [  62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5   d4   98   36   50   52   33   a4   dd]

    # VS2 (v16)       = [17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30 37bf 4071 18fc 88d5 d498 3650]
    # MASK (v0)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (v28) BEFORE = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71   18   fc   88   d5]
    # VD (v28) AFTER  = [  38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   b6   bc   ff   d8   a9   0b   3c   ff   37   bf   40   ff   18   ff   88   02]

    # VS1 (+1)       = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]

    # VS2 (+1)       = [0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c]
    # MASK (+1)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1    1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+1) BEFORE = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]
    # VD (+1) AFTER  = [  0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2]

    # VS1 (+2)       = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]

    # VS2 (+2)       = [24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc]
    # MASK (+2)       = [   0    1    0    0    0    1    0    0    0    1    0    1    1    1    0    1    1    0    1    0    1    0    0    0    1    1    0    0    1    1    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+2) BEFORE = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]
    # VD (+2) AFTER  = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]

    # VS1 (+3)       = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]

    # VS2 (+3)       = [dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638]
    # MASK (+3)       = [   1    1    1    0    1    0    1    0    0    0    1    1    0    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1    1    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   mm   ff   mm   ff   ff   mm   ff   mm   mm   mm   ff   mm   ff   mm   ff]
    # VD (+3) BEFORE = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]
    # VD (+3) AFTER  = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]


    
    
    vnclipu.wv v28, v16, v4, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x18ff8802)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x37bf40ff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xa90b3cff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xb6bcffd8)
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
    vsetvli x0, x4, e16,m4
    vle16.v v0, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v8, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v24, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 8, LMUL = 4, Use Mask = 0, VL = 10\n")
   
    





    # VS1 (v0)        = [  60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8   c8   3b   3c   30   37   bf   40   71]

    # VS2 (v8)        = [b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d a968 a97f d1bc 7dd8 c83b 3c30]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v24) BEFORE = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f   d1   bc   7d   d8]
    # VD (v24) AFTER  = [  4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   03   68   63   19   0b   ff   ff   01   ff   ff]

    # VS1 (+1)       = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]

    # VS2 (+1)       = [0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]
    # VD (+1) AFTER  = [  fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8]

    # VS1 (+2)       = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]

    # VS2 (+2)       = [4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]
    # VD (+2) AFTER  = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]

    # VS1 (+3)       = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]

    # VS2 (+3)       = [b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]
    # VD (+3) AFTER  = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]


    
    
    vnclipu.wv v24, v8, v0
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xff01ffff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x63190bff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x62f60368)
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
    vsetvli x0, x4, e16,m4
    vle16.v v8, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v24, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v20, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 8, LMUL = 4, Use Mask = 1, VL = 8\n")
   
    





    # VS1 (v8)        = [  9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87   62   f6   cb   6d   a9   68   a9   7f]

    # VS2 (v24)       = [9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2 3874 f8a5 5b08 6787 62f6 cb6d]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0    1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (v20) BEFORE = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5   5b   08   67   87]
    # VD (v20) AFTER  = [  03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   ff   ff   07   a5   5b   08   67   02]

    # VS1 (+1)       = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]

    # VS2 (+1)       = [e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686]
    # MASK (+1)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0    0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+1) BEFORE = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]
    # VD (+1) AFTER  = [  da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a]

    # VS1 (+2)       = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]

    # VS2 (+2)       = [d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592]
    # MASK (+2)       = [   0    1    1    0    1    0    0    1    0    0    0    1    0    1    0    1    0    0    0    0    0    0    0    1    1    0    0    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+2) BEFORE = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]
    # VD (+2) AFTER  = [  93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb]

    # VS1 (+3)       = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]

    # VS2 (+3)       = [63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf]
    # MASK (+3)       = [   1    1    1    1    0    0    0    1    1    0    1    1    1    1    0    0    1    1    0    1    1    0    0    0    0    1    0    0    1    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   mm   mm   mm   mm   ff]
    # VD (+3) BEFORE = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]
    # VD (+3) AFTER  = [  97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8]


    
    
    vnclipu.wv v20, v24, v8, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5b086702)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xffff07a5)
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
    vsetvli x0, x4, e16,m4
    vle16.v v12, (x2)      # Load value into vs1
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m8
    vle16.v v0, (x2)      # Load value into vs2
    li x3, 4
    add x2, x2, x3
    vsetvli x0, x4, e16,m4
    vle16.v v16, (x2)       # Load value into vd
    li x3, 4
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 8, LMUL = 4, Use Mask = 0, VL = 6\n")
   
    





    # VS1 (v12)       = [  17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21   60   75   c1   a2   38   74   f8   a5]

    # VS2 (v0)        = [e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8 4ff0 9378 951e 8621 6075 c1a2]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (v16) BEFORE = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78   95   1e   86   21]
    # VD (v16) AFTER  = [  48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   ff   ff   95   ff   60   ff]

    # VS1 (+1)       = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]

    # VS2 (+1)       = [4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]
    # VD (+1) AFTER  = [  f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5]

    # VS1 (+2)       = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]

    # VS2 (+2)       = [3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]
    # VD (+2) AFTER  = [  16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56]

    # VS1 (+3)       = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]

    # VS2 (+3)       = [95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]
    # VD (+3) AFTER  = [  44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32]


    
    
    vnclipu.wv v16, v0, v12
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x95ff60ff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x4ff0ffff)
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
    vsetvli x0, x8, e16,m4
    vle16.v v16, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v24, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v12, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 8, LMUL = 4, Use Mask = 1, VL = 4\n")
   
    





    # VS1 (v16)       = [  b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52   9b   32   7b   a8   4f   f0   93   78]

    # VS2 (v24)       = [4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a 03d5 081b b32a 4c52 9b32 7ba8]
    # MASK (v0)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0    0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (v12) BEFORE = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   4c   52]
    # VD (v12) AFTER  = [  8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b   b3   2a   ff   52]

    # VS1 (+1)       = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]

    # VS2 (+1)       = [527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4]
    # MASK (+1)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+1) BEFORE = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]
    # VD (+1) AFTER  = [  86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42]

    # VS1 (+2)       = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]

    # VS2 (+2)       = [734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd]
    # MASK (+2)       = [   1    0    0    0    1    0    1    1    0    1    0    0    1    1    1    0    1    1    0    0    1    0    1    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+2) BEFORE = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]
    # VD (+2) AFTER  = [  9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84]

    # VS1 (+3)       = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]

    # VS2 (+3)       = [4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb]
    # MASK (+3)       = [   1    1    0    0    1    1    0    1    0    0    0    1    1    0    1    1    0    0    1    1    0    1    1    1    1    1    1    0    0    1    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   mm   mm   ff   mm]
    # VD (+3) BEFORE = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]
    # VD (+3) AFTER  = [  79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b]


    
    
    vnclipu.wv v12, v24, v16, v0.t
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xb32aff52)
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
    la x6, test_1_data+156
    vsetvli x0, x8, e16,m4
    vle16.v v20, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v0, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v8, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 8, LMUL = 4, Use Mask = 0, VL = 2\n")
   
    





    # VS1 (v20)       = [  9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c   17   a2   fb   1a   03   d5   08   1b]

    # VS2 (v0)        = [93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5 4846 05f6 0b56 ed8c 17a2 fb1a]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (v8)  BEFORE = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   ed   8c]
    # VD (v8)  AFTER  = [  42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6   0b   56   18   1f]

    # VS1 (+1)       = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]

    # VS2 (+1)       = [c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+1) BEFORE = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]
    # VD (+1) AFTER  = [  0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c]

    # VS1 (+2)       = [  e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78]

    # VS2 (+2)       = [fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+2) BEFORE = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]
    # VD (+2) AFTER  = [  8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc]

    # VS1 (+3)       = [  0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92]

    # VS2 (+3)       = [311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   ff   ff]
    # VD (+3) BEFORE = [  24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9]
    # VD (+3) AFTER  = [  24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9]


    
    
    vnclipu.wv v8, v0, v20
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0b56181f)
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
    vle16.v v0, (x9)  
    # Set VL to VLMAX and load values into registers
    li x8, -1
    la x6, test_1_data+168
    vsetvli x0, x8, e16,m4
    vle16.v v24, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v16, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v4, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 8, LMUL = 4, Use Mask = 1, VL = 0\n")
   
    





    # VS1 (v24)       = [  e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f   b5   ae   ee   b5   48   46   05   f6]

    # VS2 (v16)       = [169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042 8dd5 cd04 fc9d 848f b5ae eeb5]
    # MASK (v0)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0    1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (v4)  BEFORE = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]
    # VD (v4)  AFTER  = [  73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04   fc   9d   84   8f]

    # VS1 (+1)       = [  3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52]

    # VS2 (+1)       = [c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b 9fcb e57f a216 7b52 0525 2532]
    # MASK (+1)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1    0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+1) BEFORE = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]
    # VD (+1) AFTER  = [  05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d]

    # VS1 (+2)       = [  4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8]

    # VS2 (+2)       = [65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0 4daa 96d5 e6b6 a11c 4ed8 6866]
    # MASK (+2)       = [   0    0    1    0    0    1    0    0    1    0    0    1    0    1    0    0    0    0    0    1    0    1    0    1    0    0    0    0    0    0    1    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+2) BEFORE = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]
    # VD (+2) AFTER  = [  ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52]

    # VS1 (+3)       = [  47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc]

    # VS2 (+3)       = [31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd 700a 8d4e 8660 4880 b64b 71f6]
    # MASK (+3)       = [   1    0    1    0    0    1    1    0    1    1    1    1    0    1    1    0    0    1    1    1    1    0    1    0    0    1    1    1    0    0    0    1]
    # ELEMENTS          [  --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --]
    # VD (+3) BEFORE = [  4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3]
    # VD (+3) AFTER  = [  4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3]


    
    
    vnclipu.wv v4, v16, v24, v0.t
    


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
    la x6, test_1_data+180
    vsetvli x0, x8, e16,m4
    vle16.v v28, (x6)      # Load value into vs1
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m8
    vle16.v v8, (x6)      # Load value into vs2
    li x7, 4
    add x6, x6, x7
    vsetvli x0, x8, e16,m4
    vle16.v v0, (x6)       # Load value into vd
    li x7, 4
    add x6, x6, x7

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e8,m4 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 8, LMUL = 4, Use Mask = 0, VL = 128\n")
   
    





    # VS1 (v28)       = [  4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86   9b   1a   80   42   8d   d5   cd   04]

    # VS2 (v8)        = [9fcb e57f a216 7b52 0525 2532 169d bce8 3b9b 3ddc 0cc9 d6c8 93b0 6678 f22b 6484 86b0 81d4 4bfb 003d 73b3 e156 f632 3d52 e0e9 092c 426b 8dfb da4c 9686 9b1a 8042]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (v0)  BEFORE = [  f2   2b   64   84   86   b0   81   d4   4b   fb   00   3d   73   b3   e1   56   f6   32   3d   52   e0   e9   09   2c   42   6b   8d   fb   da   4c   96   86]
    # VD (v0)  AFTER  = [  14   1d   ff   04   a5   ff   ff   ff   ee   ff   00   ff   ff   33   79   06   ff   10   02   00   1d   0e   ff   f5   1c   02   ff   ff   07   ff   05   ff]

    # VS1 (+1)       = [  a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78   f2   2b   64   84   86   b0   81   d4]

    # VS2 (+1)       = [4daa 96d5 e6b6 a11c 4ed8 6866 c3a2 2eae 47c6 f638 24e0 658c c47c 5d71 0be7 93b3 79e9 10dd 527e 81e3 ea35 fe19 445d a8cc 4e11 81e9 8bfc ad15 9705 6592 e92f 674b]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+1) BEFORE = [  e9   2f   67   4b   9f   cb   e5   7f   a2   16   7b   52   05   25   25   32   16   9d   bc   e8   3b   9b   3d   dc   0c   c9   d6   c8   93   b0   66   78]
    # VD (+1) AFTER  = [  ff   ff   1d   ff   ff   ff   ff   ff   ff   08   02   66   19   0c   00   09   08   08   ff   82   ff   ff   ff   a9   ff   10   ff   ff   ff   ff   ff   ff]

    # VS1 (+2)       = [  52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92   e9   2f   67   4b   9f   cb   e5   7f]

    # VS2 (+2)       = [700a 8d4e 8660 4880 b64b 71f6 65e3 c70c 982b c336 dbee 5e94 fde2 23d8 4c45 120b 3533 08fb 734b 985d f1bc d84d 6915 0191 3be0 154f dfca dfe1 6665 2ebf d7a5 68f0]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+2) BEFORE = [  0b   e7   93   b3   79   e9   10   dd   52   7e   81   e3   ea   35   fe   19   44   5d   a8   cc   4e   11   81   e9   8b   fc   ad   15   97   05   65   92]
    # VD (+2) AFTER  = [  ff   02   ff   ff   2e   ff   02   64   ff   06   dc   06   04   ff   ff   09   07   01   04   ff   ff   ff   ff   64   1e   00   ff   1c   01   06   ff   01]

    # VS1 (+3)       = [  e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71   0b   e7   93   b3   79   e9   10   dd]

    # VS2 (+3)       = [0d2e 0a7a 7cba ceb7 dc44 7722 31a2 01a7 995c cbf8 1151 057d 311c 98a1 ac98 e804 918f 472f 4f03 1546 cd1b 37e5 8b4e cba8 95a7 4545 355e 64a2 04b1 1e73 63b9 1dcd]
    # ELEMENTS          [  ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff   ff]
    # VD (+3) BEFORE = [  d7   a5   68   f0   4d   aa   96   d5   e6   b6   a1   1c   4e   d8   68   66   c3   a2   2e   ae   47   c6   f6   38   24   e0   65   8c   c4   7c   5d   71]
    # VD (+3) AFTER  = [  35   2a   ff   0d   03   77   32   07   ff   ff   00   00   62   ff   ff   e8   ff   ff   ff   01   ff   03   04   ff   13   8b   ff   ff   02   0f   ff   01]


    
    
    vnclipu.wv v0, v8, v28
    


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
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x07ff05ff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1c02ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1d0efff5)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff100200)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff337906)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xeeff00ff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xa5ffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x141dff04)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff10ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffa9)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0808ff82)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x190c0009)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff080266)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff1dff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0106ff01)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x1e00ff1c)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffff64)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x070104ff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x04ffff09)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff06dc06)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x2eff0264)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff02ffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x020fff01)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x138bffff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xff0304ff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffffff01)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x62ffffe8)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xffff0000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x03773207)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x352aff0d)
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

