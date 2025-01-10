// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VLANE_E_PSPLPG_H_
#define VERILATED_VLANE_E_PSPLPG_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "Vlane_e.h"

// INCLUDE MODULE CLASSES
#include "Vlane_e_PSBYia.h"
#include "Vlane_e_PStmyA.h"
#include "Vlane_e_PSsPXJ.h"

// DPI TYPES for DPI Export callbacks (Internal use)
using PSMpCp = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, IData PS24gS, VlWide<16> &PSt2BE, IData &simutil_get_mem__Vfuncrtn);
using PSMpCp = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, IData index, VlWide<16> &val, IData &simutil_get_mem__Vfuncrtn);
using PSia1A = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, std::string PSaFFN);
using PSia1A = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, std::string file);
using PSqwTc = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, IData PS24gS, VlWide<16> PSt2BE, IData &simutil_set_mem__Vfuncrtn);
using PSqwTc = void (*) (Vlane_e_PSplPG* __restrict vlSymsp, IData index, VlWide<16> val, IData &simutil_set_mem__Vfuncrtn);

// SYMS CLASS (contains all model state)
class Vlane_e_PSplPG final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vlane_e* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vlane_e_PSBYia                 TOP;
    Vlane_e_PStmyA                 PSFhf4;
    Vlane_e_PSsPXJ                 PSqT9B;

    // SCOPE NAMES
    VerilatedScope PSlXOL;
    VerilatedScope PSmlB3;
    VerilatedScope PSxrBP;
    VerilatedScope PSxqRr;
    VerilatedScope PS2k1W;
    VerilatedScope PS0Jue;
    VerilatedScope PSzz7M;
    VerilatedScope PSHgCl;

    // CONSTRUCTORS
    Vlane_e_PSplPG(VerilatedContext* contextp, const char* namep, Vlane_e* modelp);
    ~Vlane_e_PSplPG();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
