// RISC-V Architectural Validation Test VFIRST-M-SEW16_LMUL8
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
//    SEW=16, LMUL=8
// Description: Testing instruction 'vfirst.m'.

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
    la x5, test_1_data+0
    li x6, 4
    add x5, x5, x6
    vle16.v v16, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6
    # address for mask data. 
    la x8, test_1_maskdata+0
    vle16.v v0, (x8)  

    # Set Dummy value for rd
    li x0, 0x4321

    li  x7, 128 # VL = 128
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 0: SEW = 16, LMUL = 8, Use Mask = 1, VL = 128\n")

    






    # VS2 (v16)       = [   1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # MASK (v0)       = [   0    0    0    0    0    0    0    1    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+1)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0]
    # MASK (+1)       = [   0    0    0    1    0    1    0    1    0    0    0    1    1    0    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+2)       = [   1    1    0    1    1    1    1    0    0    0    1    1    1    1    0    1]
    # MASK (+2)       = [   1    0    0    1    1    1    0    1    0    0    1    0    0    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+3)       = [   0    1    0    0    0    0    1    0    1    0    0    1    1    1    1    0]
    # MASK (+3)       = [   1    0    0    0    0    1    1    0    0    1    0    1    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+4)       = [   1    0    0    1    1    0    1    0    0    1    0    1    0    0    0    1]
    # MASK (+4)       = [   1    1    0    1    1    1    1    0    0    0    1    1    1    1    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+5)       = [   0    0    1    0    0    0    0    0    0    0    1    0    0    0    0    1]
    # MASK (+5)       = [   0    1    0    0    0    0    1    0    1    0    0    1    1    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+6)       = [   1    1    0    1    0    1    0    1    1    1    1    1    1    1    0    1]
    # MASK (+6)       = [   1    0    0    1    1    0    1    0    0    1    0    1    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000


    # VS2 (+7)       = [   1    0    0    1    0    0    0    1    1    0    1    0    1    0    0    0]
    # MASK (+7)       = [   0    0    1    0    0    0    0    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff ffff ffff mmmm ffff ffff ffff ffff]
    # RD (x0)     = 0x0000000000000000



    vfirst.m x0, v16, v0.t   

    sw x0, 0(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x0, 0x00000000)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    la x5, test_1_data+12
    li x6, 4
    add x5, x5, x6
    vle16.v v17, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    # Set Dummy value for rd
    li x1, 0x4321

    li  x7, 105 # VL = 105
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 1: SEW = 16, LMUL = 8, Use Mask = 0, VL = 105\n")

    






    # VS2 (v17)       = [   1    1    0    1    0    1    0    1    1    1    1    1    1    1    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+1)       = [   1    0    0    1    0    0    0    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+2)       = [   0    1    1    0    1    1    0    0    0    1    1    0    0    1    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+3)       = [   1    0    1    1    1    1    0    1    1    0    0    0    1    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+4)       = [   0    0    1    0    0    1    0    1    0    0    0    0    1    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+5)       = [   0    0    0    0    0    1    0    0    0    1    1    0    0    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+6)       = [   1    1    1    1    1    0    1    0    0    1    1    0    0    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000


    # VS2 (+7)       = [   1    1    1    0    0    0    1    1    0    0    0    1    1    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x1)     = 0x0000000000000000



    vfirst.m x1, v17   

    sw x1, 4(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x1, 0x00000000)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    la x5, test_1_data+24
    li x6, 4
    add x5, x5, x6
    vle16.v v18, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6
    # address for mask data. 
    la x8, test_1_maskdata+64
    vle16.v v0, (x8)  

    # Set Dummy value for rd
    li x2, 0x4321

    li  x7, 78 # VL = 78
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 2: SEW = 16, LMUL = 8, Use Mask = 1, VL = 78\n")

    






    # VS2 (v18)       = [   1    1    1    1    1    0    1    0    0    1    1    0    0    1    0    0]
    # MASK (v0)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+1)       = [   1    1    1    0    0    0    1    1    0    0    0    1    1    1    1    1]
    # MASK (+1)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+2)       = [   1    0    1    0    1    1    0    1    0    0    1    1    1    0    1    0]
    # MASK (+2)       = [   0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+3)       = [   1    1    0    0    0    1    1    1    0    0    1    1    0    1    1    1]
    # MASK (+3)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+4)       = [   1    0    0    0    1    1    0    0    0    0    0    1    1    1    1    0]
    # MASK (+4)       = [   0    1    1    1    1    0    1    0    1    1    0    1    1    0    0    1]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+5)       = [   1    1    1    0    0    1    0    1    0    1    0    0    1    1    0    0]
    # MASK (+5)       = [   0    0    1    1    0    1    0    0    0    0    1    0    0    1    1    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+6)       = [   0    1    1    0    0    0    0    0    1    1    0    1    1    0    1    1]
    # MASK (+6)       = [   0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002


    # VS2 (+7)       = [   0    1    1    1    1    1    0    0    1    0    1    0    0    1    1    0]
    # MASK (+7)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0]
    # ELEMENTS          [mmmm mmmm mmmm mmmm ffff ffff ffff ffff ffff ffff mmmm ffff mmmm ffff mmmm mmmm]
    # RD (x2)     = 0x0000000000000002



    vfirst.m x2, v18, v0.t   

    sw x2, 8(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x2, 0x00000002)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x7, -1
    vsetvli x6, x7, e16,m1
    la x5, test_1_data+36
    li x6, 4
    add x5, x5, x6
    vle16.v v19, (x5)      # Load value into vs2
    add x5, x5, x6
    add x5, x5, x6

    # Set Dummy value for rd
    li x3, 0x4321

    li  x7, 64 # VL = 64
    vsetvli x6, x7, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x6, "# Testcase 3: SEW = 16, LMUL = 8, Use Mask = 0, VL = 64\n")

    






    # VS2 (v19)       = [   0    1    1    0    0    0    0    0    1    1    0    1    1    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+1)       = [   0    1    1    1    1    1    0    0    1    0    1    0    0    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+2)       = [   1    1    0    1    1    0    1    0    1    1    0    1    1    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+3)       = [   0    0    0    0    0    1    1    0    1    0    0    1    0    0    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+4)       = [   1    1    0    0    1    0    0    0    0    1    0    0    0    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+5)       = [   0    0    1    0    1    1    0    0    0    1    1    0    0    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+6)       = [   0    1    1    1    1    0    1    0    1    1    1    0    0    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000


    # VS2 (+7)       = [   1    1    1    1    1    0    1    1    1    0    1    1    1    0    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x3)     = 0x0000000000000000



    vfirst.m x3, v19   

    sw x3, 12(x4)
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x3, 0x00000000)



    # address for test results
    RVTEST_SIGBASE(x1,signature_2_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    la x2, test_1_data+48
    li x3, 4
    add x2, x2, x3
    vle16.v v20, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3
    # address for mask data. 
    la x13, test_1_maskdata+128
    vle16.v v0, (x13)  

    # Set Dummy value for rd
    li x4, 0x4321

    li  x8, 57 # VL = 57
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 4: SEW = 16, LMUL = 8, Use Mask = 1, VL = 57\n")

    






    # VS2 (v20)       = [   0    1    1    1    1    0    1    0    1    1    1    0    0    1    1    1]
    # MASK (v0)       = [   0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+1)       = [   1    1    1    1    1    0    1    1    1    0    1    1    1    0    1    0]
    # MASK (+1)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+2)       = [   0    1    1    0    0    0    1    0    1    0    1    1    1    1    1    1]
    # MASK (+2)       = [   1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+3)       = [   0    0    0    1    1    0    0    1    0    1    0    1    1    0    1    1]
    # MASK (+3)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+4)       = [   1    0    1    0    0    0    1    1    1    1    0    1    0    0    0    1]
    # MASK (+4)       = [   1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+5)       = [   1    1    1    1    0    1    1    0    0    0    0    0    0    0    0    0]
    # MASK (+5)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+6)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # MASK (+6)       = [   1    0    0    0    0    1    1    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000


    # VS2 (+7)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0]
    # MASK (+7)       = [   1    0    0    1    0    1    0    1    0    0    0    1    1    1    1    0]
    # ELEMENTS          [mmmm ffff ffff mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm ffff ffff ffff]
    # RD (x4)     = 0x0000000000000000



    vfirst.m x4, v20, v0.t   

    sw x4, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00000000)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    la x2, test_1_data+60
    li x3, 4
    add x2, x2, x3
    vle16.v v21, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    # Set Dummy value for rd
    li x5, 0x4321

    li  x8, 41 # VL = 41
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 5: SEW = 16, LMUL = 8, Use Mask = 0, VL = 41\n")

    






    # VS2 (v21)       = [   0    0    0    0    1    1    1    1    1    1    0    1    0    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+1)       = [   0    0    1    1    0    1    0    0    1    0    1    1    1    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+2)       = [   0    1    0    1    1    1    1    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+3)       = [   0    0    1    1    1    0    1    0    1    1    1    0    1    1    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+4)       = [   0    1    1    1    1    0    1    0    1    1    0    1    1    0    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+5)       = [   0    0    1    1    0    1    0    0    0    0    1    0    0    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+6)       = [   0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002


    # VS2 (+7)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x5)     = 0x0000000000000002



    vfirst.m x5, v21   

    sw x5, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x5, 0x00000002)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    la x2, test_1_data+72
    li x3, 4
    add x2, x2, x3
    vle16.v v22, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3
    # address for mask data. 
    la x13, test_1_maskdata+192
    vle16.v v0, (x13)  

    # Set Dummy value for rd
    li x6, 0x4321

    li  x8, 32 # VL = 32
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 6: SEW = 16, LMUL = 8, Use Mask = 1, VL = 32\n")

    






    # VS2 (v22)       = [   0    1    0    1    0    1    0    0    1    1    0    0    0    0    0    0]
    # MASK (v0)       = [   1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+1)       = [   0    1    1    0    1    0    0    0    0    0    0    1    0    1    0    0]
    # MASK (+1)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+2)       = [   0    0    1    1    0    1    0    0    1    0    0    1    0    0    1    0]
    # MASK (+2)       = [   0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+3)       = [   0    1    1    0    0    1    1    1    1    1    0    1    1    1    0    1]
    # MASK (+3)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+4)       = [   0    1    1    0    0    1    1    0    0    0    1    1    1    1    1    0]
    # MASK (+4)       = [   0    0    1    1    1    1    0    1    0    1    0    1    0    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+5)       = [   1    0    1    1    0    0    0    0    0    0    1    0    1    1    0    1]
    # MASK (+5)       = [   1    1    1    1    0    1    1    0    0    0    1    1    0    0    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+6)       = [   1    1    1    1    0    0    0    1    1    1    0    0    0    1    0    1]
    # MASK (+6)       = [   1    1    1    0    0    0    0    1    0    1    0    1    0    1    1    0]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006


    # VS2 (+7)       = [   1    0    1    1    0    0    1    0    1    1    0    1    0    0    1    1]
    # MASK (+7)       = [   0    1    1    1    0    0    1    1    1    0    1    1    0    0    1    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm ffff ffff mmmm ffff ffff ffff ffff ffff ffff mmmm ffff ffff]
    # RD (x6)     = 0x0000000000000006



    vfirst.m x6, v22, v0.t   

    sw x6, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x6, 0x00000006)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x3, x8, e16,m1
    la x2, test_1_data+84
    li x3, 4
    add x2, x2, x3
    vle16.v v23, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    # Set Dummy value for rd
    li x7, 0x4321

    li  x8, 23 # VL = 23
    vsetvli x3, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 7: SEW = 16, LMUL = 8, Use Mask = 0, VL = 23\n")

    






    # VS2 (v23)       = [   1    1    1    1    0    0    0    1    1    1    0    0    0    1    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+1)       = [   1    0    1    1    0    0    1    0    1    1    0    1    0    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+2)       = [   0    0    1    1    1    0    0    1    1    0    1    0    1    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+3)       = [   1    0    0    0    0    0    1    0    0    1    0    0    1    1    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+4)       = [   1    0    1    0    0    1    0    0    1    1    0    1    1    1    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+5)       = [   0    1    0    1    0    0    1    0    0    0    1    1    0    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+6)       = [   0    0    1    1    0    1    1    0    0    1    0    1    0    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000


    # VS2 (+7)       = [   1    1    0    1    0    1    0    0    1    0    0    1    1    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x7)     = 0x0000000000000000



    vfirst.m x7, v23   

    sw x7, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x7, 0x00000000)



    # address for test results
    RVTEST_SIGBASE(x1,signature_3_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    la x2, test_1_data+96
    li x3, 4
    add x2, x2, x3
    vle16.v v24, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3
    # address for mask data. 
    la x12, test_1_maskdata+256
    vle16.v v0, (x12)  

    # Set Dummy value for rd
    li x8, 0x4321

    li  x4, 16 # VL = 16
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 8: SEW = 16, LMUL = 8, Use Mask = 1, VL = 16\n")

    






    # VS2 (v24)       = [   0    0    1    1    0    1    1    0    0    1    0    1    0    0    0    0]
    # MASK (v0)       = [   1    0    1    0    1    1    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+1)       = [   1    1    0    1    0    1    0    0    1    0    0    1    1    0    0    0]
    # MASK (+1)       = [   1    0    0    0    1    0    1    1    1    1    1    1    1    1    0    0]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+2)       = [   1    0    0    0    1    0    0    0    1    1    0    1    0    1    0    1]
    # MASK (+2)       = [   1    0    0    0    0    0    0    1    1    1    1    0    1    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+3)       = [   0    0    0    1    1    0    0    0    1    1    1    1    1    1    0    0]
    # MASK (+3)       = [   0    1    0    0    1    1    1    0    0    0    0    1    0    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+4)       = [   0    1    0    0    0    0    0    0    0    1    1    1    0    0    0    1]
    # MASK (+4)       = [   1    0    1    0    1    0    0    0    1    1    0    0    1    1    0    0]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+5)       = [   0    0    1    1    0    1    1    1    1    0    1    1    1    1    1    1]
    # MASK (+5)       = [   0    1    0    0    0    1    0    0    0    1    0    1    1    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+6)       = [   0    0    1    1    1    1    0    0    0    0    1    1    0    0    0    0]
    # MASK (+6)       = [   1    1    1    1    1    1    1    0    0    0    0    1    1    0    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004


    # VS2 (+7)       = [   1    1    0    0    1    0    0    0    0    0    1    1    1    0    1    1]
    # MASK (+7)       = [   1    1    1    0    1    0    1    0    0    0    1    1    0    1    0    1]
    # ELEMENTS          [ffff mmmm ffff mmmm ffff ffff mmmm ffff mmmm mmmm mmmm ffff mmmm ffff mmmm ffff]
    # RD (x8)     = 0x0000000000000004



    vfirst.m x8, v24, v0.t   

    sw x8, 0(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00000004)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    la x2, test_1_data+108
    li x3, 4
    add x2, x2, x3
    vle16.v v25, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    # Set Dummy value for rd
    li x9, 0x4321

    li  x4, 10 # VL = 10
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 9: SEW = 16, LMUL = 8, Use Mask = 0, VL = 10\n")

    






    # VS2 (v25)       = [   0    0    1    1    1    1    0    0    0    0    1    1    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+1)       = [   1    1    0    0    1    0    0    0    0    0    1    1    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+2)       = [   0    1    1    1    1    1    0    1    1    1    0    1    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+3)       = [   1    1    0    1    0    0    0    1    1    0    1    1    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+4)       = [   1    0    1    0    1    0    0    1    0    1    1    1    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+5)       = [   1    0    1    0    1    0    0    1    0    1    1    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+6)       = [   1    1    0    0    1    0    1    1    0    1    1    0    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004


    # VS2 (+7)       = [   0    1    1    0    0    0    1    0    1    1    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x9)     = 0x0000000000000004



    vfirst.m x9, v25   

    sw x9, 4(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x9, 0x00000004)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    la x2, test_1_data+120
    li x3, 4
    add x2, x2, x3
    vle16.v v26, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3
    # address for mask data. 
    la x12, test_1_maskdata+320
    vle16.v v0, (x12)  

    # Set Dummy value for rd
    li x10, 0x4321

    li  x4, 8 # VL = 8
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 10: SEW = 16, LMUL = 8, Use Mask = 1, VL = 8\n")

    






    # VS2 (v26)       = [   1    1    0    0    1    0    1    1    0    1    1    0    1    1    0    1]
    # MASK (v0)       = [   1    1    0    1    1    1    1    1    1    1    1    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+1)       = [   0    1    1    0    0    0    1    0    1    1    1    1    0    1    1    0]
    # MASK (+1)       = [   1    1    0    1    1    1    1    1    1    1    0    0    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+2)       = [   0    1    1    0    0    1    1    1    1    0    0    0    0    1    1    1]
    # MASK (+2)       = [   0    0    0    1    0    1    0    1    0    1    0    0    1    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+3)       = [   0    1    0    1    1    0    1    1    0    0    0    0    1    0    0    0]
    # MASK (+3)       = [   0    0    1    1    1    0    1    1    1    1    1    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+4)       = [   1    1    1    1    1    0    0    0    1    0    1    0    0    1    0    1]
    # MASK (+4)       = [   0    0    0    0    0    0    0    1    1    0    0    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+5)       = [   0    0    1    1    1    0    0    0    0    1    1    1    0    1    0    0]
    # MASK (+5)       = [   0    1    1    0    1    0    0    1    0    0    0    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+6)       = [   1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # MASK (+6)       = [   1    1    0    1    1    0    0    0    0    1    0    0    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000


    # VS2 (+7)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1]
    # MASK (+7)       = [   1    1    1    1    0    0    0    1    1    0    1    1    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff mmmm mmmm mmmm mmmm ffff]
    # RD (x10)    = 0x0000000000000000



    vfirst.m x10, v26, v0.t   

    sw x10, 8(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x10, 0x00000000)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x4, -1
    vsetvli x3, x4, e16,m1
    la x2, test_1_data+132
    li x3, 4
    add x2, x2, x3
    vle16.v v27, (x2)      # Load value into vs2
    add x2, x2, x3
    add x2, x2, x3

    # Set Dummy value for rd
    li x11, 0x4321

    li  x4, 6 # VL = 6
    vsetvli x3, x4, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x3, "# Testcase 11: SEW = 16, LMUL = 8, Use Mask = 0, VL = 6\n")

    






    # VS2 (v27)       = [   1    1    0    0    0    0    0    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+1)       = [   0    1    1    0    0    0    0    0    0    1    1    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+2)       = [   1    0    0    0    0    1    1    0    0    0    1    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+3)       = [   1    0    0    1    0    1    0    1    0    0    0    1    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+4)       = [   1    0    0    1    0    0    1    1    0    1    1    1    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+5)       = [   0    1    0    0    1    1    1    1    1    1    1    1    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+6)       = [   0    1    1    1    1    0    1    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001


    # VS2 (+7)       = [   1    0    0    1    1    0    1    1    0    0    1    1    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # RD (x11)    = 0x0000000000000001



    vfirst.m x11, v27   

    sw x11, 12(x1)
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x11, 0x00000001)



    # address for test results
    RVTEST_SIGBASE(x5,signature_4_0)
    # address for test data.  Using same data array for all tests, but adding offset to use different values for each group of tests
 



    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    la x6, test_1_data+144
    li x7, 4
    add x6, x6, x7
    vle16.v v28, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7
    # address for mask data. 
    la x9, test_1_maskdata+384
    vle16.v v0, (x9)  

    # Set Dummy value for rd
    li x12, 0x4321

    li  x8, 4 # VL = 4
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 12: SEW = 16, LMUL = 8, Use Mask = 1, VL = 4\n")

    






    # VS2 (v28)       = [   0    1    1    1    1    0    1    1    1    0    1    0    1    0    0    0]
    # MASK (v0)       = [   0    1    1    0    0    1    0    0    1    0    1    0    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+1)       = [   1    0    0    1    1    0    1    1    0    0    1    1    0    0    1    0]
    # MASK (+1)       = [   0    0    1    1    0    1    0    1    0    1    0    1    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+2)       = [   0    1    0    0    1    1    0    0    0    1    0    1    0    0    1    0]
    # MASK (+2)       = [   0    1    0    0    0    1    0    1    0    1    0    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+3)       = [   1    0    1    1    0    0    1    1    0    0    1    0    1    0    1    0]
    # MASK (+3)       = [   1    0    0    1    0    1    0    1    1    0    1    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+4)       = [   0    0    0    0    1    0    0    0    0    0    0    1    1    0    1    1]
    # MASK (+4)       = [   1    1    0    0    1    0    1    1    1    0    1    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+5)       = [   0    0    0    0    0    0    1    1    1    1    0    1    0    1    0    1]
    # MASK (+5)       = [   1    0    0    0    1    0    1    1    0    1    0    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+6)       = [   1    1    1    1    1    0    1    1    0    0    0    1    1    0    1    0]
    # MASK (+6)       = [   0    0    1    1    0    1    1    1    1    1    1    0    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff


    # VS2 (+7)       = [   0    0    0    1    0    1    1    1    1    0    1    0    0    0    1    0]
    # MASK (+7)       = [   1    1    0    0    1    1    0    1    0    0    0    1    1    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm]
    # RD (x12)    = 0x00000000ffffffff



    vfirst.m x12, v28, v0.t   

    sw x12, 0(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x12, 0xffffffff)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    la x6, test_1_data+156
    li x7, 4
    add x6, x6, x7
    vle16.v v29, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    # Set Dummy value for rd
    li x13, 0x4321

    li  x8, 2 # VL = 2
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 13: SEW = 16, LMUL = 8, Use Mask = 0, VL = 2\n")

    






    # VS2 (v29)       = [   1    1    1    1    1    0    1    1    0    0    0    1    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+1)       = [   0    0    0    1    0    1    1    1    1    0    1    0    0    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+2)       = [   1    1    1    0    1    1    0    1    1    0    0    0    1    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+3)       = [   0    0    0    0    1    0    1    1    0    1    0    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+4)       = [   0    0    0    0    0    1    0    1    1    1    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+5)       = [   0    1    0    0    1    0    0    0    0    1    0    0    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+6)       = [   1    1    1    0    1    1    1    0    1    0    1    1    0    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001


    # VS2 (+7)       = [   1    0    1    1    0    1    0    1    1    0    1    0    1    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # RD (x13)    = 0x0000000000000001



    vfirst.m x13, v29   

    sw x13, 4(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x13, 0x00000001)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    la x6, test_1_data+168
    li x7, 4
    add x6, x6, x7
    vle16.v v30, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7
    # address for mask data. 
    la x9, test_1_maskdata+448
    vle16.v v0, (x9)  

    # Set Dummy value for rd
    li x14, 0x4321

    li  x8, 0 # VL = 0
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 14: SEW = 16, LMUL = 8, Use Mask = 1, VL = 0\n")

    






    # VS2 (v30)       = [   1    1    1    0    1    1    1    0    1    0    1    1    0    1    0    1]
    # MASK (v0)       = [   1    0    0    1    0    1    0    0    0    1    0    0    1    0    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+1)       = [   1    0    1    1    0    1    0    1    1    0    1    0    1    1    1    0]
    # MASK (+1)       = [   1    1    0    0    0    0    0    1    1    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+2)       = [   1    0    0    0    0    1    0    0    1    0    0    0    1    1    1    1]
    # MASK (+2)       = [   0    0    1    0    0    0    0    1    1    1    1    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+3)       = [   1    1    1    1    1    1    0    0    1    0    0    1    1    1    0    1]
    # MASK (+3)       = [   1    0    1    0    0    1    1    1    0    1    1    1    1    1    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+4)       = [   1    1    0    0    1    1    0    1    0    0    0    0    0    1    0    0]
    # MASK (+4)       = [   0    0    0    1    0    1    0    1    0    0    0    0    0    0    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+5)       = [   1    0    0    0    1    1    0    1    1    1    0    1    0    1    0    1]
    # MASK (+5)       = [   0    0    1    0    0    1    0    0    1    0    0    1    0    1    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+6)       = [   1    0    0    0    0    0    0    0    0    1    0    0    0    0    1    0]
    # MASK (+6)       = [   0    1    1    1    1    0    1    0    0    1    1    1    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff


    # VS2 (+7)       = [   1    0    0    1    1    0    1    1    0    0    0    1    1    0    1    0]
    # MASK (+7)       = [   1    0    1    0    0    1    1    0    1    1    1    1    0    1    1    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # RD (x14)    = 0x00000000ffffffff



    vfirst.m x14, v30, v0.t   

    sw x14, 8(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x14, 0xffffffff)

    # Set VL to VLMAX, LMUL to 1 and load mask value in v0
    li x8, -1
    vsetvli x7, x8, e16,m1
    la x6, test_1_data+180
    li x7, 4
    add x6, x6, x7
    vle16.v v31, (x6)      # Load value into vs2
    add x6, x6, x7
    add x6, x6, x7

    # Set Dummy value for rd
    li x15, 0x4321

    li  x8, 128 # VL = 128
    vsetvli x7, x8, e16,m8 
    
    RVMODEL_IO_WRITE_STR(x7, "# Testcase 15: SEW = 16, LMUL = 8, Use Mask = 0, VL = 128\n")

    






    # VS2 (v31)       = [   1    0    0    0    0    0    0    0    0    1    0    0    0    0    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+1)       = [   1    0    0    1    1    0    1    1    0    0    0    1    1    0    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+2)       = [   1    0    0    1    0    1    1    0    1    0    0    0    0    1    1    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+3)       = [   1    1    0    1    1    0    1    0    0    1    0    0    1    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+4)       = [   1    0    0    0    1    1    0    1    1    1    1    1    1    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+5)       = [   0    1    0    0    0    0    1    0    0    1    1    0    1    0    1    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+6)       = [   0    0    0    0    1    0    0    1    0    0    1    0    1    1    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001


    # VS2 (+7)       = [   1    1    1    0    0    0    0    0    1    1    1    0    1    0    0    1]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # RD (x15)    = 0x0000000000000001



    vfirst.m x15, v31   

    sw x15, 12(x5)
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x15, 0x00000001)
	
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

