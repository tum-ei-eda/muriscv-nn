// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vara_tb_verilator.h for the primary calling header

#include "Vara_tb_verilator___024unit.h"
#include "Vara_tb_verilator__Syms.h"

#include "verilated_dpi.h"

//==========
VlUnpacked<CData/*2:0*/, 8> Vara_tb_verilator___024unit::__Venumtab_enum_next0;
VlUnpacked<CData/*2:0*/, 8> Vara_tb_verilator___024unit::__Venumtab_enum_next1;
VlUnpacked<CData/*2:0*/, 8> Vara_tb_verilator___024unit::__Venumtab_enum_prev2;


void Vara_tb_verilator___024unit___ctor_var_reset(Vara_tb_verilator___024unit* vlSelf);

Vara_tb_verilator___024unit::Vara_tb_verilator___024unit(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vara_tb_verilator___024unit___ctor_var_reset(this);
}

void Vara_tb_verilator___024unit::__Vconfigure(Vara_tb_verilator__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vara_tb_verilator___024unit::~Vara_tb_verilator___024unit() {
}

void Vara_tb_verilator___024unit___ctor_var_reset(Vara_tb_verilator___024unit* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vara_tb_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vara_tb_verilator___024unit___ctor_var_reset\n"); );
    // Body
    for (int __Vi=0; __Vi<8; ++__Vi) {
        vlSelf->__Venumtab_enum_next0[__Vi] = 0U;
    }
    vlSelf->__Venumtab_enum_next0[0] = 1U;
    vlSelf->__Venumtab_enum_next0[1] = 2U;
    vlSelf->__Venumtab_enum_next0[2] = 3U;
    vlSelf->__Venumtab_enum_next0[3] = 4U;
    vlSelf->__Venumtab_enum_next0[4] = 5U;
    vlSelf->__Venumtab_enum_next0[5] = 6U;
    vlSelf->__Venumtab_enum_next0[6] = 7U;
    vlSelf->__Venumtab_enum_next0[7] = 0U;
    for (int __Vi=0; __Vi<8; ++__Vi) {
        vlSelf->__Venumtab_enum_next1[__Vi] = 0U;
    }
    vlSelf->__Venumtab_enum_next1[0] = 1U;
    vlSelf->__Venumtab_enum_next1[1] = 2U;
    vlSelf->__Venumtab_enum_next1[2] = 3U;
    vlSelf->__Venumtab_enum_next1[3] = 4U;
    vlSelf->__Venumtab_enum_next1[4] = 5U;
    vlSelf->__Venumtab_enum_next1[5] = 6U;
    vlSelf->__Venumtab_enum_next1[6] = 7U;
    vlSelf->__Venumtab_enum_next1[7] = 0U;
    for (int __Vi=0; __Vi<8; ++__Vi) {
        vlSelf->__Venumtab_enum_prev2[__Vi] = 0U;
    }
    vlSelf->__Venumtab_enum_prev2[0] = 7U;
    vlSelf->__Venumtab_enum_prev2[1] = 0U;
    vlSelf->__Venumtab_enum_prev2[2] = 1U;
    vlSelf->__Venumtab_enum_prev2[3] = 2U;
    vlSelf->__Venumtab_enum_prev2[4] = 3U;
    vlSelf->__Venumtab_enum_prev2[5] = 4U;
    vlSelf->__Venumtab_enum_prev2[6] = 5U;
    vlSelf->__Venumtab_enum_prev2[7] = 6U;
}
