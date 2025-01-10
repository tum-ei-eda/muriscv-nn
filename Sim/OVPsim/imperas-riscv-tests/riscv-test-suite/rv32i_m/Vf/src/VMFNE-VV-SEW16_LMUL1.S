// RISC-V Architectural Validation Test VMFNE-VV-SEW16_LMUL1
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
// Description: Testing instruction 'vmfne.vv'.

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
   
    





    # VS1 (v1)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v16)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [mmmm mmmm ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v31) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v31) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v31, v16, v1, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v31, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
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
   
    





    # VS1 (v0)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v17)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v30) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v30) AFTER  = [   1    1    0    1    0    0    1    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v30, v17, v0
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v30, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d3ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
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
   
    





    # VS1 (v2)        = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v18)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm ffff mmmm mmmm mmmm]
    # VD (v29) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v29) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]


    
    
    vmfne.vv v29, v18, v2, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v29, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
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
   
    





    # VS1 (v3)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v19)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v28) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v28) AFTER  = [   0    1    1    1    1    1    0    0    0    0    1    1    1    1    1    1]


    
    
    vmfne.vv v28, v19, v3
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v28, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c3f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
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
   
    





    # VS1 (v4)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v20)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm ffff ffff ffff]
    # VD (v27) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v27) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]


    
    
    vmfne.vv v27, v20, v4, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v27, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
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
   
    





    # VS1 (v5)        = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v21)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v26) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v26) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    1    1]


    
    
    vmfne.vv v26, v21, v5
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v26, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c00818b)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
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
   
    





    # VS1 (v6)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v22)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v25) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v25) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v25, v22, v6, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v25, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
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
   
    





    # VS1 (v7)        = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v23)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v24) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v24) AFTER  = [   1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v24, v23, v7
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v24, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001ffff)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
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
   
    





    # VS1 (v8)        = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v24)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v23) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v23) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]


    
    
    vmfne.vv v23, v24, v8, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v23, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
   
    





    # VS1 (v9)        = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v25)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v22) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v22) AFTER  = [   0    1    1    1    1    1    0    0    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v22, v25, v9
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v22, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007cff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
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
   
    





    # VS1 (v10)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v26)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm ffff mmmm mmmm ffff]
    # VD (v21) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v21) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    1    1    1    1]


    
    
    vmfne.vv v21, v26, v10, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v21, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d16f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
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
   
    





    # VS1 (v11)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v27)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v20) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v20) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    1    1    1]


    
    
    vmfne.vv v20, v27, v11
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v20, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c00818f)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
   
    





    # VS1 (v12)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v28)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm]
    # VD (v19) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v19) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v19, v28, v12, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v19, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
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
   
    





    # VS1 (v13)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v29)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v18) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v18) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]


    
    
    vmfne.vv v18, v29, v13
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v18, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
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
   
    





    # VS1 (v14)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v30)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   1    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v17) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v17) AFTER  = [   1    1    1    1    1    1    0    1    1    0    0    0    1    0    0    1]


    
    
    vmfne.vv v17, v30, v14, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v17, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c00fd89)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x5d080000)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
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
   
    





    # VS1 (v15)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v31)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v16) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v16) AFTER  = [   0    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v16, v31, v15
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x7, x8, e8,m1
    vse8.v v16, (x5)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x5, x5, x8
#else
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007fff)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xd1670001)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0xfc00fc00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x0001d167)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x7c007c00)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x00005d08)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x3c008189)
    lw x8, 0(x5)
    addi x5, x5, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x7, x8, 0x81893c00)
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
   
    





    # VS1 (v16)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v1)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v15) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v15) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]


    
    
    vmfne.vv v15, v1, v16, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v15, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
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
   
    





    # VS1 (v17)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v0)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v14) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v14) AFTER  = [   1    0    0    0    0    0    0    1    1    0    1    1    1    1    1    1]


    
    
    vmfne.vv v14, v0, v17
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v14, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c0081bf)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
   
    





    # VS1 (v18)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v2)        = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm]
    # VD (v13) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v13) AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v13, v2, v18, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v13, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
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
   
    





    # VS1 (v19)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v3)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff]
    # VD (v12) BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v12) AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]


    
    
    vmfne.vv v12, v3, v19
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v12, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
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
   
    





    # VS1 (v20)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v4)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    1    0    1    1    1    0    1    0    0    0    0    1    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v11) BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v11) AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]


    
    
    vmfne.vv v11, v4, v20, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v11, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
   
    





    # VS1 (v21)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v5)        = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v10) BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v10) AFTER  = [   1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v10, v5, v21
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v10, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c00ffff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
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
   
    





    # VS1 (v22)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v6)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- mmmm ffff mmmm ffff ffff mmmm mmmm ffff ffff ffff]
    # VD (v9)  BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v9)  AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]


    
    
    vmfne.vv v9, v6, v22, v0.t
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v9, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x00005d08)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c008189)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
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
   
    





    # VS1 (v23)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v7)        = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v8)  BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v8)  AFTER  = [   1    0    0    0    0    0    0    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v8, v7, v23
    


     # Set VL to VLMAX to store results
    li x4, -1
    vsetvli x3, x4, e8,m1
    vse8.v v8, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x4, 32
    add x1, x1, x4
#else
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x3c0081ff)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x81893c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x5d080000)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xd1670001)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0xfc00fc00)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x0001d167)
    lw x4, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x4, 0x7c007c00)
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
   
    





    # VS1 (v24)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v8)        = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    1]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm mmmm ffff]
    # VD (v7)  BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v7)  AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    1]


    
    
    vmfne.vv v7, v8, v24, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v7, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c01)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
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
   
    





    # VS1 (v25)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v9)        = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff]
    # VD (v6)  BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v6)  AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    0    1    1    1    1]


    
    
    vmfne.vv v6, v9, v25
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v6, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d16f)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
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
   
    





    # VS1 (v26)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v10)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # MASK (v0)       = [   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm]
    # VD (v5)  BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v5)  AFTER  = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]


    
    
    vmfne.vv v5, v10, v26, v0.t
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v5, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x5d080000)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
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
   
    





    # VS1 (v27)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v11)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----]
    # VD (v4)  BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v4)  AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v4, v11, v27
    


     # Set VL to VLMAX to store results
    li x8, -1
    vsetvli x3, x8, e8,m1
    vse8.v v4, (x1)  
#ifdef RVMODEL_IO_QUIET
    li x8, 32
    add x1, x1, x8
#else
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xd1670001)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0xfc00fc00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x0001d167)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x7c007c00)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x00005d08)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x3c008189)
    lw x8, 0(x1)
    addi x1, x1, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x3, x8, 0x81893c00)
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
   
    





    # VS1 (v28)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v12)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # MASK (v0)       = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # ELEMENTS          [ffff mmmm mmmm mmmm mmmm mmmm mmmm ffff ffff mmmm mmmm mmmm ffff mmmm mmmm ffff]
    # VD (v3)  BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v3)  AFTER  = [   1    1    0    1    0    0    0    1    1    1    1    0    1    1    1    1]


    
    
    vmfne.vv v3, v12, v28, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v3, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d1ef)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
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
   
    





    # VS1 (v29)       = [fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00]

    # VS2 (v13)       = [0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff]
    # VD (v2)  BEFORE = [   1    0    0    0    0    0    0    1    1    0    0    0    1    0    0    1]
    # VD (v2)  AFTER  = [   1    0    0    0    0    0    1    1    1    1    1    1    1    1    1    1]


    
    
    vmfne.vv v2, v13, v29
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v2, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c0083ff)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
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
   
    





    # VS1 (v30)       = [0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000 8189 3c00]

    # VS2 (v14)       = [3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001 7c00 7c00 5d08 0000]
    # MASK (v0)       = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- mmmm mmmm mmmm mmmm mmmm mmmm mmmm mmmm]
    # VD (v1)  BEFORE = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]
    # VD (v1)  AFTER  = [   0    1    1    1    1    1    0    0    0    0    0    0    0    0    0    0]


    
    
    vmfne.vv v1, v14, v30, v0.t
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v1, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xfc00fc00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d167)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
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
   
    





    # VS1 (v31)       = [5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00 d167 0001]

    # VS2 (v15)       = [7c00 7c00 5d08 0000 8189 3c00 3c00 8189 0000 5d08 7c00 7c00 0001 d167 fc00 fc00]
    # ELEMENTS          [---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ffff ffff ffff ffff ffff ffff]
    # VD (v0)  BEFORE = [   1    1    0    1    0    0    0    1    0    1    1    0    0    1    1    1]
    # VD (v0)  AFTER  = [   1    1    0    1    0    0    0    1    0    1    1    1    1    1    1    1]


    
    
    vmfne.vv v0, v15, v31
    


     # Set VL to VLMAX to store results
    li x7, -1
    vsetvli x6, x7, e8,m1
    vse8.v v0, (x4)  
#ifdef RVMODEL_IO_QUIET
    li x7, 32
    add x4, x4, x7
#else
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x0001d17f)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x00005d08)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x3c008189)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x81893c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x5d080000)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0x7c007c00)
    lw x7, 0(x4)
    addi x4, x4, 4
    RVMODEL_IO_ASSERT_GPR_EQ(x6, x7, 0xd1670001)
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
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000

	.align 4
test_1_maskdata:
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
	.word 0xfc00fc00
	.word 0x1d167
	.word 0x7c007c00
	.word 0x5d08
	.word 0x3c008189
	.word 0x81893c00
	.word 0x5d080000
	.word 0x7c007c00
	.word 0xd1670001
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

