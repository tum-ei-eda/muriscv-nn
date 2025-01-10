// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vara_tb_verilator.h for the primary calling header

#ifndef VERILATED_VARA_TB_VERILATOR___024UNIT_H_
#define VERILATED_VARA_TB_VERILATOR___024UNIT_H_  // guard

#include "verilated_heavy.h"

//==========

class Vara_tb_verilator__Syms;

//----------

VL_MODULE(Vara_tb_verilator___024unit) {
  public:

    // LOCAL VARIABLES
    static VlUnpacked<CData/*2:0*/, 8> __Venumtab_enum_next0;
    static VlUnpacked<CData/*2:0*/, 8> __Venumtab_enum_next1;
    static VlUnpacked<CData/*2:0*/, 8> __Venumtab_enum_prev2;

    // INTERNAL VARIABLES
    Vara_tb_verilator__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vara_tb_verilator___024unit);  ///< Copying not allowed
  public:
    Vara_tb_verilator___024unit(const char* name);
    ~Vara_tb_verilator___024unit();

    // INTERNAL METHODS
    void __Vconfigure(Vara_tb_verilator__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
