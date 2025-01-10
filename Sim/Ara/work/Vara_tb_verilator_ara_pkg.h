// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vara_tb_verilator.h for the primary calling header

#ifndef VERILATED_VARA_TB_VERILATOR_ARA_PKG_H_
#define VERILATED_VARA_TB_VERILATOR_ARA_PKG_H_  // guard

#include "verilated_heavy.h"

//==========

class Vara_tb_verilator__Syms;

//----------

VL_MODULE(Vara_tb_verilator_ara_pkg) {
  public:

    // LOCAL VARIABLES
    SData/*12:0*/ __Vlvbound1;
    SData/*12:0*/ __Vlvbound2;
    SData/*12:0*/ __Vlvbound3;
    SData/*12:0*/ __Vlvbound4;
    SData/*12:0*/ __Vlvbound5;

    // INTERNAL VARIABLES
    Vara_tb_verilator__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vara_tb_verilator_ara_pkg);  ///< Copying not allowed
  public:
    Vara_tb_verilator_ara_pkg(const char* name);
    ~Vara_tb_verilator_ara_pkg();

    // INTERNAL METHODS
    void __Vconfigure(Vara_tb_verilator__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
