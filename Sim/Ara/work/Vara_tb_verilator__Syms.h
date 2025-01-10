// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VARA_TB_VERILATOR__SYMS_H_
#define VERILATED_VARA_TB_VERILATOR__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "Vara_tb_verilator.h"

// INCLUDE MODULE CLASSES
#include "Vara_tb_verilator___024root.h"
#include "Vara_tb_verilator___024unit.h"
#include "Vara_tb_verilator_ara_pkg.h"

// DPI TYPES for DPI Export callbacks (Internal use)
using Vara_tb_verilator__Vcb_simutil_get_mem_t = void (*) (Vara_tb_verilator__Syms* __restrict vlSymsp, IData/*31:0*/ index, VlWide<16>/*511:0*/ &val, IData/*31:0*/ &simutil_get_mem__Vfuncrtn);
using Vara_tb_verilator__Vcb_simutil_memload_t = void (*) (Vara_tb_verilator__Syms* __restrict vlSymsp, std::string file);
using Vara_tb_verilator__Vcb_simutil_set_mem_t = void (*) (Vara_tb_verilator__Syms* __restrict vlSymsp, IData/*31:0*/ index, VlWide<16>/*511:0*/ val, IData/*31:0*/ &simutil_set_mem__Vfuncrtn);

// SYMS CLASS (contains all model state)
class Vara_tb_verilator__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vara_tb_verilator* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vara_tb_verilator___024root    TOP;
    Vara_tb_verilator___024unit    TOP____024unit;
    Vara_tb_verilator_ara_pkg      TOP__ara_pkg;

    // SCOPE NAMES
    VerilatedScope __Vscope_ara_tb_verilator;
    VerilatedScope __Vscope_ara_tb_verilator__dut__i_ara_soc__i_dram;
    VerilatedScope __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__0__KET____i_lane;
    VerilatedScope __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__1__KET____i_lane;
    VerilatedScope __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__2__KET____i_lane;
    VerilatedScope __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__3__KET____i_lane;

    // CONSTRUCTORS
    Vara_tb_verilator__Syms(VerilatedContext* contextp, const char* namep, Vara_tb_verilator* modelp);
    ~Vara_tb_verilator__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
