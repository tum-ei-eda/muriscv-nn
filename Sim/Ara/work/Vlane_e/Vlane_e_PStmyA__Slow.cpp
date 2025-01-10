// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlane_e.h for the primary calling header

#include "Vlane_e_PStmyA.h"
#include "Vlane_e_PSplPG.h"

#include "verilated_dpi.h"

//==========


void Vlane_e_PStmyA__PScT1x(Vlane_e_PStmyA* vlSelf);

Vlane_e_PStmyA::Vlane_e_PStmyA(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vlane_e_PStmyA__PScT1x(this);
}

void Vlane_e_PStmyA::PSRUgz(Vlane_e_PSplPG* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vlane_e_PStmyA::~Vlane_e_PStmyA() {
}

void Vlane_e_PStmyA__PScT1x(Vlane_e_PStmyA* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vlane_e_PSplPG* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vlane_e_PStmyA__PScT1x\n"); );
}
