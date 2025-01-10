// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Implementation of DPI export functions.
//
#include "Vlane_e.h"
#include "Vlane_e_PSplPG.h"
#include "verilated_dpi.h"


void Vlane_e::simutil_memload(const char* file) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia::simutil_memload\n"); );
    // Variables
    static VL_THREAD_LOCAL std::string file__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_memload");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    PSia1A __Vcb = (PSia1A)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    file__Vcvt = file;
    (*__Vcb)((Vlane_e_PSplPG*)(__Vscopep->symsp()), file__Vcvt);
}

int Vlane_e::simutil_set_mem(int index, const svBitVecVal* val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia::simutil_set_mem\n"); );
    // Variables
    IData index__Vcvt;
    VlWide<16> val__Vcvt;
    IData simutil_set_mem__Vfuncrtn__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_set_mem");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    PSqwTc __Vcb = (PSqwTc)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    index__Vcvt = index;
    VL_SET_W_SVBV(512,val__Vcvt,val + 0);
(*__Vcb)((Vlane_e_PSplPG*)(__Vscopep->symsp()), index__Vcvt, val__Vcvt, simutil_set_mem__Vfuncrtn__Vcvt);
    int simutil_set_mem__Vfuncrtn;
    for (size_t simutil_set_mem__Vfuncrtn__Vidx = 0; simutil_set_mem__Vfuncrtn__Vidx < 1; ++simutil_set_mem__Vfuncrtn__Vidx) simutil_set_mem__Vfuncrtn = simutil_set_mem__Vfuncrtn__Vcvt;
    return simutil_set_mem__Vfuncrtn;
}

int Vlane_e::simutil_get_mem(int index, svBitVecVal* val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia::simutil_get_mem\n"); );
    // Variables
    IData index__Vcvt;
    VlWide<16> val__Vcvt;
    IData simutil_get_mem__Vfuncrtn__Vcvt;
    // Body
    static int __Vfuncnum = -1;
    if (VL_UNLIKELY(__Vfuncnum == -1)) __Vfuncnum = Verilated::exportFuncNum("simutil_get_mem");
    const VerilatedScope* __Vscopep = Verilated::dpiScope();
    PSMpCp __Vcb = (PSMpCp)(VerilatedScope::exportFind(__Vscopep, __Vfuncnum));
    index__Vcvt = index;
    (*__Vcb)((Vlane_e_PSplPG*)(__Vscopep->symsp()), index__Vcvt, val__Vcvt, simutil_get_mem__Vfuncrtn__Vcvt);
    for (size_t val__Vidx = 0; val__Vidx < 1; ++val__Vidx) VL_SET_SVBV_W(512, val + 16 * val__Vidx, val__Vcvt);
    int simutil_get_mem__Vfuncrtn;
    for (size_t simutil_get_mem__Vfuncrtn__Vidx = 0; simutil_get_mem__Vfuncrtn__Vidx < 1; ++simutil_get_mem__Vfuncrtn__Vidx) simutil_get_mem__Vfuncrtn = simutil_get_mem__Vfuncrtn__Vcvt;
    return simutil_get_mem__Vfuncrtn;
}
