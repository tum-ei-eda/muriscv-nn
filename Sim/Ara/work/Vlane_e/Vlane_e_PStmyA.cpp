// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlane_e.h for the primary calling header

#include "Vlane_e_PStmyA.h"
#include "Vlane_e_PSplPG.h"

#include "verilated_dpi.h"

//==========

extern "C" int debug_tick(svBit* debug_req_valid, svBit debug_req_ready, int* debug_req_bits_addr, int* debug_req_bits_op, int* debug_req_bits_data, svBit debug_resp_valid, svBit* debug_resp_ready, int debug_resp_bits_resp, int debug_resp_bits_data);

VL_INLINE_OPT void Vlane_e_PStmyA__PSPSZ3(CData &debug_req_valid, CData debug_req_ready, IData &debug_req_bits_addr, IData &debug_req_bits_op, IData &debug_req_bits_data, CData debug_resp_valid, CData &debug_resp_ready, IData debug_resp_bits_resp, IData debug_resp_bits_data, IData &debug_tick__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vlane_e_PStmyA__PSPSZ3\n"); );
    // Body
    svBit debug_req_valid__Vcvt;
    svBit debug_req_ready__Vcvt;
    for (size_t debug_req_ready__Vidx = 0; debug_req_ready__Vidx < 1; ++debug_req_ready__Vidx) debug_req_ready__Vcvt = debug_req_ready;
    int debug_req_bits_addr__Vcvt;
    int debug_req_bits_op__Vcvt;
    int debug_req_bits_data__Vcvt;
    svBit debug_resp_valid__Vcvt;
    for (size_t debug_resp_valid__Vidx = 0; debug_resp_valid__Vidx < 1; ++debug_resp_valid__Vidx) debug_resp_valid__Vcvt = debug_resp_valid;
    svBit debug_resp_ready__Vcvt;
    int debug_resp_bits_resp__Vcvt;
    for (size_t debug_resp_bits_resp__Vidx = 0; debug_resp_bits_resp__Vidx < 1; ++debug_resp_bits_resp__Vidx) debug_resp_bits_resp__Vcvt = debug_resp_bits_resp;
    int debug_resp_bits_data__Vcvt;
    for (size_t debug_resp_bits_data__Vidx = 0; debug_resp_bits_data__Vidx < 1; ++debug_resp_bits_data__Vidx) debug_resp_bits_data__Vcvt = debug_resp_bits_data;
    int debug_tick__Vfuncrtn__Vcvt;
    debug_tick__Vfuncrtn__Vcvt = debug_tick(&debug_req_valid__Vcvt, debug_req_ready__Vcvt, &debug_req_bits_addr__Vcvt, &debug_req_bits_op__Vcvt, &debug_req_bits_data__Vcvt, debug_resp_valid__Vcvt, &debug_resp_ready__Vcvt, debug_resp_bits_resp__Vcvt, debug_resp_bits_data__Vcvt);
    debug_req_valid = (1U & debug_req_valid__Vcvt);
    debug_req_bits_addr = debug_req_bits_addr__Vcvt;
    debug_req_bits_op = debug_req_bits_op__Vcvt;
    debug_req_bits_data = debug_req_bits_data__Vcvt;
    debug_resp_ready = (1U & debug_resp_ready__Vcvt);
    debug_tick__Vfuncrtn = debug_tick__Vfuncrtn__Vcvt;
}

extern "C" int jtag_tick(svBit* jtag_TCK, svBit* jtag_TMS, svBit* jtag_TDI, svBit* jtag_TRSTn, svBit jtag_TDO);

VL_INLINE_OPT void Vlane_e_PStmyA__PSsiIj(CData &jtag_TCK, CData &jtag_TMS, CData &jtag_TDI, CData &jtag_TRSTn, CData jtag_TDO, IData &jtag_tick__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vlane_e_PStmyA__PSsiIj\n"); );
    // Body
    svBit jtag_TCK__Vcvt;
    svBit jtag_TMS__Vcvt;
    svBit jtag_TDI__Vcvt;
    svBit jtag_TRSTn__Vcvt;
    svBit jtag_TDO__Vcvt;
    for (size_t jtag_TDO__Vidx = 0; jtag_TDO__Vidx < 1; ++jtag_TDO__Vidx) jtag_TDO__Vcvt = jtag_TDO;
    int jtag_tick__Vfuncrtn__Vcvt;
    jtag_tick__Vfuncrtn__Vcvt = jtag_tick(&jtag_TCK__Vcvt, &jtag_TMS__Vcvt, &jtag_TDI__Vcvt, &jtag_TRSTn__Vcvt, jtag_TDO__Vcvt);
    jtag_TCK = (1U & jtag_TCK__Vcvt);
    jtag_TMS = (1U & jtag_TMS__Vcvt);
    jtag_TDI = (1U & jtag_TDI__Vcvt);
    jtag_TRSTn = (1U & jtag_TRSTn__Vcvt);
    jtag_tick__Vfuncrtn = jtag_tick__Vfuncrtn__Vcvt;
}

extern "C" void read_elf(const char* filename);

VL_INLINE_OPT void Vlane_e_PStmyA__PSLrOr(std::string filename) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vlane_e_PStmyA__PSLrOr\n"); );
    // Body
    const char* filename__Vcvt;
    for (size_t filename__Vidx = 0; filename__Vidx < 1; ++filename__Vidx) filename__Vcvt = filename.c_str();
    read_elf(filename__Vcvt);
}

extern "C" char get_section(long long* address, long long* len);

VL_INLINE_OPT void Vlane_e_PStmyA__PSimQe(QData &address, QData &len, CData &get_section__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vlane_e_PStmyA__PSimQe\n"); );
    // Body
    long long address__Vcvt;
    long long len__Vcvt;
    char get_section__Vfuncrtn__Vcvt;
    get_section__Vfuncrtn__Vcvt = get_section(&address__Vcvt, &len__Vcvt);
    address = address__Vcvt;
    len = len__Vcvt;
    get_section__Vfuncrtn = (0xffU & get_section__Vfuncrtn__Vcvt);
}
