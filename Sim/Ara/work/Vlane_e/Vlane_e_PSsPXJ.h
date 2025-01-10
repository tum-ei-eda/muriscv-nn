// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vlane_e.h for the primary calling header

#ifndef VERILATED_VLANE_E_PSSPXJ_H_
#define VERILATED_VLANE_E_PSSPXJ_H_  // guard

#include "verilated_heavy.h"

//==========

class Vlane_e_PSplPG;

//----------

VL_MODULE(Vlane_e_PSsPXJ) {
  public:

    // LOCAL VARIABLES
    SData PSjAYP;
    SData PShqm4;
    SData PSghZe;
    SData PSOwdt;
    SData PSnknT;

    // INTERNAL VARIABLES
    Vlane_e_PSplPG* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vlane_e_PSsPXJ);  ///< Copying not allowed
  public:
    Vlane_e_PSsPXJ(const char* name);
    ~Vlane_e_PSsPXJ();

    // INTERNAL METHODS
    void PSRUgz(Vlane_e_PSplPG* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
