// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vara_tb_verilator.h for the primary calling header

#include "Vara_tb_verilator_ara_pkg.h"
#include "Vara_tb_verilator__Syms.h"

#include "verilated_dpi.h"

//==========


void Vara_tb_verilator_ara_pkg___ctor_var_reset(Vara_tb_verilator_ara_pkg* vlSelf);

Vara_tb_verilator_ara_pkg::Vara_tb_verilator_ara_pkg(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vara_tb_verilator_ara_pkg___ctor_var_reset(this);
}

void Vara_tb_verilator_ara_pkg::__Vconfigure(Vara_tb_verilator__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vara_tb_verilator_ara_pkg::~Vara_tb_verilator_ara_pkg() {
}

void Vara_tb_verilator_ara_pkg___ctor_var_reset(Vara_tb_verilator_ara_pkg* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vara_tb_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+                        Vara_tb_verilator_ara_pkg___ctor_var_reset\n"); );
    // Body
    vlSelf->__Vlvbound1 = VL_RAND_RESET_I(13);
    vlSelf->__Vlvbound2 = VL_RAND_RESET_I(13);
    vlSelf->__Vlvbound3 = VL_RAND_RESET_I(13);
    vlSelf->__Vlvbound4 = VL_RAND_RESET_I(13);
    vlSelf->__Vlvbound5 = VL_RAND_RESET_I(13);
}
