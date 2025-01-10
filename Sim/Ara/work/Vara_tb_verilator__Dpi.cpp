// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Implementation of DPI export functions.
//
// Verilator compiles this file in when DPI functions are used.
// If you have multiple Verilated designs with the same DPI exported
// function names, you will get multiple definition link errors from here.
// This is an unfortunate result of the DPI specification.
// To solve this, either
//    1. Call Vara_tb_verilator::{export_function} instead,
//       and do not even bother to compile this file
// or 2. Compile all __Dpi.cpp files in the same compiler run,
//       and #ifdefs already inserted here will sort everything out.

#include "Vara_tb_verilator__Dpi.h"
#include "Vara_tb_verilator.h"

#ifndef VL_DPIDECL_simutil_get_mem_
#define VL_DPIDECL_simutil_get_mem_
int simutil_get_mem(int index, svBitVecVal* val) {
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:270:16
    return Vara_tb_verilator::simutil_get_mem(index, val);
}
#endif

#ifndef VL_DPIDECL_simutil_memload_
#define VL_DPIDECL_simutil_memload_
void simutil_memload(const char* file) {
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:249:8
    return Vara_tb_verilator::simutil_memload(file);
}
#endif

#ifndef VL_DPIDECL_simutil_set_mem_
#define VL_DPIDECL_simutil_set_mem_
int simutil_set_mem(int index, const svBitVecVal* val) {
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:257:16
    return Vara_tb_verilator::simutil_set_mem(index, val);
}
#endif

