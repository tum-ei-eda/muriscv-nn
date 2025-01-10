// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Prototypes for DPI import and export functions.
//
// Verilator includes this file in all generated .cpp files that use DPI functions.
// Manually include this file where DPI .c import functions are declared to ensure
// the C functions match the expectations of the DPI imports.

#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif


    // DPI EXPORTS
    // DPI export
    extern int simutil_get_mem(int index, svBitVecVal* val);
    // DPI export
    extern void simutil_memload(const char* file);
    // DPI export
    extern int simutil_set_mem(int index, const svBitVecVal* val);

    // DPI IMPORTS
    // DPI import
    extern int debug_tick(svBit* debug_req_valid, svBit debug_req_ready, int* debug_req_bits_addr, int* debug_req_bits_op, int* debug_req_bits_data, svBit debug_resp_valid, svBit* debug_resp_ready, int debug_resp_bits_resp, int debug_resp_bits_data);
    // DPI import
    extern char get_section(long long* address, long long* len);
    // DPI import
    extern int jtag_tick(svBit* jtag_TCK, svBit* jtag_TMS, svBit* jtag_TDI, svBit* jtag_TRSTn, svBit jtag_TDO);
    // DPI import
    extern void read_elf(const char* filename);
    // DPI import
    extern char read_section(long long address, const svOpenArrayHandle buffer);

#ifdef __cplusplus
}
#endif
