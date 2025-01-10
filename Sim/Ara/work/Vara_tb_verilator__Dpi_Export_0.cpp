// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Implementation of DPI export functions.
//
#include "Vara_tb_verilator.h"
#include "Vara_tb_verilator__Syms.h"
#include "verilated_dpi.h"


void Vara_tb_verilator::simutil_memload(const char* file) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vara_tb_verilator___024root::simutil_memload\n"); );
    // Variables
    static VL_THREAD_LOCAL std::string file__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_memload");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    Vara_tb_verilator__Vcb_simutil_memload_t __Vcb = (Vara_tb_verilator__Vcb_simutil_memload_t)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    file__Vcvt = file;
    (*__Vcb)((Vara_tb_verilator__Syms*)(__Vscopep->symsp()), file__Vcvt);
}

int Vara_tb_verilator::simutil_set_mem(int index, const svBitVecVal* val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vara_tb_verilator___024root::simutil_set_mem\n"); );
    // Variables
    IData/*31:0*/ index__Vcvt;
    VlWide<16>/*511:0*/ val__Vcvt;
    IData/*31:0*/ simutil_set_mem__Vfuncrtn__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_set_mem");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    Vara_tb_verilator__Vcb_simutil_set_mem_t __Vcb = (Vara_tb_verilator__Vcb_simutil_set_mem_t)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    index__Vcvt = index;
    VL_SET_W_SVBV(512,val__Vcvt,val + 0);
(*__Vcb)((Vara_tb_verilator__Syms*)(__Vscopep->symsp()), index__Vcvt, val__Vcvt, simutil_set_mem__Vfuncrtn__Vcvt);
    int simutil_set_mem__Vfuncrtn;
    for (size_t simutil_set_mem__Vfuncrtn__Vidx = 0; simutil_set_mem__Vfuncrtn__Vidx < 1; ++simutil_set_mem__Vfuncrtn__Vidx) simutil_set_mem__Vfuncrtn = simutil_set_mem__Vfuncrtn__Vcvt;
    return simutil_set_mem__Vfuncrtn;
}

int Vara_tb_verilator::simutil_get_mem(int index, svBitVecVal* val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vara_tb_verilator___024root::simutil_get_mem\n"); );
    // Variables
    IData/*31:0*/ index__Vcvt;
    VlWide<16>/*511:0*/ val__Vcvt;
    IData/*31:0*/ simutil_get_mem__Vfuncrtn__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_get_mem");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    Vara_tb_verilator__Vcb_simutil_get_mem_t __Vcb = (Vara_tb_verilator__Vcb_simutil_get_mem_t)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    index__Vcvt = index;
    (*__Vcb)((Vara_tb_verilator__Syms*)(__Vscopep->symsp()), index__Vcvt, val__Vcvt, simutil_get_mem__Vfuncrtn__Vcvt);
    for (size_t val__Vidx = 0; val__Vidx < 1; ++val__Vidx) VL_SET_SVBV_W(512, val + 16 * val__Vidx, val__Vcvt);
    int simutil_get_mem__Vfuncrtn;
    for (size_t simutil_get_mem__Vfuncrtn__Vidx = 0; simutil_get_mem__Vfuncrtn__Vidx < 1; ++simutil_get_mem__Vfuncrtn__Vidx) simutil_get_mem__Vfuncrtn = simutil_get_mem__Vfuncrtn__Vcvt;
    return simutil_get_mem__Vfuncrtn;
}
