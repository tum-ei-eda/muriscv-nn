// RISC-V Architectural Validation Test VFMV-F-S-SEW32_LMUL4
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
//    SEW=32, LMUL=4
// Description: Testing instruction 'vfmv.f.s'.

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
 



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vle32.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 32 # VL = 32
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    






    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f31, v16   
    fmv.x.w  x7, f31
    sw x7, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vle32.v v20, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    






    # VS2 (v20)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f30, v20   
    fmv.x.w  x7, f30
    sw x7, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vle32.v v24, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    






    # VS2 (v24)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f29, v24   
    fmv.x.w  x7, f29
    sw x7, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vle32.v v28, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    






    # VS2 (v28)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f28, v28   
    fmv.x.w  x7, f28
    sw x7, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    


    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 8 # VL = 8
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    






    # VS2 (v0)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f27, v0   
    fmv.x.w  x8, f27
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 6 # VL = 6
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 32, LMUL = 4, Use Mask = 0, VL = 6\n")

    






    # VS2 (v4)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f26, v4   
    fmv.x.w  x8, f26
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 32, LMUL = 4, Use Mask = 0, VL = 4\n")

    






    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f25, v8   
    fmv.x.w  x8, f25
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vle32.v v12, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 32, LMUL = 4, Use Mask = 0, VL = 2\n")

    






    # VS2 (v12)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]



    vfmv.f.s f24, v12   
    fmv.x.w  x8, f24
    sw x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    


    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 32, LMUL = 4, Use Mask = 0, VL = 0\n")

    






    # VS2 (v16)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]



    vfmv.f.s f23, v16   
    fmv.x.w  x4, f23
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    






    # VS2 (v20)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f22, v20   
    fmv.x.w  x4, f22
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    






    # VS2 (v24)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f21, v24   
    fmv.x.w  x4, f21
    sw x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    






    # VS2 (v28)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f20, v28   
    fmv.x.w  x4, f20
    sw x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    


    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vle32.v v0, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    li  x8, 10 # VL = 10
    vsetvli x7, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    






    # VS2 (v0)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f19, v0   
    fmv.x.w  x8, f19
    sw x8, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vle32.v v4, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    li  x8, 8 # VL = 8
    vsetvli x7, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    






    # VS2 (v4)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f18, v4   
    fmv.x.w  x8, f18
    sw x8, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vle32.v v8, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    li  x8, 6 # VL = 6
    vsetvli x7, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 32, LMUL = 4, Use Mask = 0, VL = 6\n")

    






    # VS2 (v8)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f17, v8   
    fmv.x.w  x8, f17
    sw x8, 16(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x7, x8, e32,m4
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vle32.v v12, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 32, LMUL = 4, Use Mask = 0, VL = 4\n")

    






    # VS2 (v12)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f16, v12   
    fmv.x.w  x8, f16
    sw x8, 24(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00000000)
    


    # address for test results
    RVTEST_SIGBASE(x1,signature_5_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+192
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 2 # VL = 2
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 16: SEW = 32, LMUL = 4, Use Mask = 0, VL = 2\n")

    






    # VS2 (v16)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]



    vfmv.f.s f15, v16   
    fmv.x.w  x4, f15
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+204
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 0 # VL = 0
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 17: SEW = 32, LMUL = 4, Use Mask = 0, VL = 0\n")

    






    # VS2 (v20)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]



    vfmv.f.s f14, v20   
    fmv.x.w  x4, f14
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+216
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 32 # VL = 32
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 18: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    






    # VS2 (v24)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f13, v24   
    fmv.x.w  x4, f13
    sw x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+228
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 23 # VL = 23
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 19: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    






    # VS2 (v28)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f12, v28   
    fmv.x.w  x4, f12
    sw x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    


    # address for test results
    RVTEST_SIGBASE(x1,signature_6_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+240
    li x3, 4
    add x2, x2, x3
    vle32.v v0, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 20: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    






    # VS2 (v0)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f11, v0   
    fmv.x.w  x4, f11
    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+252
    li x3, 4
    add x2, x2, x3
    vle32.v v4, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 21: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    






    # VS2 (v4)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f10, v4   
    fmv.x.w  x4, f10
    sw x4, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+264
    li x3, 4
    add x2, x2, x3
    vle32.v v8, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 22: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    






    # VS2 (v8)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f9, v8   
    fmv.x.w  x4, f9
    sw x4, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x4, -1
    vsetvli x3, x4, e32,m4
    la x2, test_1_data+276
    li x3, 4
    add x2, x2, x3
    vle32.v v12, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 23: SEW = 32, LMUL = 4, Use Mask = 0, VL = 6\n")

    






    # VS2 (v12)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f8, v12   
    fmv.x.w  x4, f8
    sw x4, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x43a0fe6a)
    


    # address for test results
    RVTEST_SIGBASE(x1,signature_7_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+288
    li x3, 4
    add x2, x2, x3
    vle32.v v16, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 4 # VL = 4
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 24: SEW = 32, LMUL = 4, Use Mask = 0, VL = 4\n")

    






    # VS2 (v16)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f7, v16   
    fmv.x.w  x8, f7
    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+300
    li x3, 4
    add x2, x2, x3
    vle32.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 2 # VL = 2
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 25: SEW = 32, LMUL = 4, Use Mask = 0, VL = 2\n")

    






    # VS2 (v20)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- ffffffff ffffffff]



    vfmv.f.s f6, v20   
    fmv.x.w  x8, f6
    sw x8, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+312
    li x3, 4
    add x2, x2, x3
    vle32.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 0 # VL = 0
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 26: SEW = 32, LMUL = 4, Use Mask = 0, VL = 0\n")

    






    # VS2 (v24)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [-------- -------- -------- -------- -------- -------- -------- --------]



    vfmv.f.s f5, v24   
    fmv.x.w  x8, f5
    sw x8, 16(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x8, -1
    vsetvli x3, x8, e32,m4
    la x2, test_1_data+324
    li x3, 4
    add x2, x2, x3
    vle32.v v28, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e32,m4 

    RVMODEL_IO_WRITE_STR(x3, "# Testcase 27: SEW = 32, LMUL = 4, Use Mask = 0, VL = 32\n")

    






    # VS2 (v28)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f4, v28   
    fmv.x.w  x8, f4
    sw x8, 24(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000000)
    


    # address for test results
    RVTEST_SIGBASE(x4,signature_8_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+336
    li x6, 4
    add x5, x5, x6
    vle32.v v0, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 23 # VL = 23
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 28: SEW = 32, LMUL = 4, Use Mask = 0, VL = 23\n")

    






    # VS2 (v0)        = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f3, v0   
    fmv.x.w  x7, f3
    sw x7, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+348
    li x6, 4
    add x5, x5, x6
    vle32.v v4, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 16 # VL = 16
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 29: SEW = 32, LMUL = 4, Use Mask = 0, VL = 16\n")

    






    # VS2 (v4)        = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f2, v4   
    fmv.x.w  x7, f2
    sw x7, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x43a0fe6a)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+360
    li x6, 4
    add x5, x5, x6
    vle32.v v8, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 10 # VL = 10
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 30: SEW = 32, LMUL = 4, Use Mask = 0, VL = 10\n")

    






    # VS2 (v8)        = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [c22cd70a c9712060 333995e6 4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f1, v8   
    fmv.x.w  x7, f1
    sw x7, 16(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00000000)
    
    # Set VL to VLMAX and load values into registers
    li x7, -1
    vsetvli x6, x7, e32,m4
    la x5, test_1_data+372
    li x6, 4
    add x5, x5, x6
    vle32.v v12, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    li  x7, 8 # VL = 8
    vsetvli x6, x7, e32,m4 

    RVMODEL_IO_WRITE_STR(x6, "# Testcase 31: SEW = 32, LMUL = 4, Use Mask = 0, VL = 8\n")

    






    # VS2 (v12)       = [4996b43e 00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+1)       = [00000000 3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+2)       = [3f800000 b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]


    # VS2 (+3)       = [b7c44b1e 43a0fe6a 5b87e42c c22cd70a c9712060 333995e6 4996b43e 00000000]
    # ELEMENTS          [ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff]



    vfmv.f.s f0, v12   
    fmv.x.w  x7, f0
    sw x7, 24(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xc9712060)
    	
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

