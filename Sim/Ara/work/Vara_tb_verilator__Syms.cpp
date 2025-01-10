// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vara_tb_verilator__Syms.h"
#include "Vara_tb_verilator.h"
#include "Vara_tb_verilator___024root.h"
#include "Vara_tb_verilator___024unit.h"
#include "Vara_tb_verilator_ara_pkg.h"

void Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_get_mem_TOP(Vara_tb_verilator__Syms* __restrict vlSymsp, IData/*31:0*/ index, VlWide<16>/*511:0*/ &val, IData/*31:0*/ &simutil_get_mem__Vfuncrtn);
void Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_memload_TOP(Vara_tb_verilator__Syms* __restrict vlSymsp, std::string file);
void Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_set_mem_TOP(Vara_tb_verilator__Syms* __restrict vlSymsp, IData/*31:0*/ index, VlWide<16>/*511:0*/ val, IData/*31:0*/ &simutil_set_mem__Vfuncrtn);

// FUNCTIONS
Vara_tb_verilator__Syms::~Vara_tb_verilator__Syms()
{
}

Vara_tb_verilator__Syms::Vara_tb_verilator__Syms(VerilatedContext* contextp, const char* namep,Vara_tb_verilator* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp(modelp)
    // Setup module instances
    , TOP(namep)
    , TOP____024unit(Verilated::catName(namep, "$unit"))
    , TOP__ara_pkg(Verilated::catName(namep, "ara_pkg"))
{
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    TOP.__PVT____024unit = &TOP____024unit;
    TOP.__PVT__ara_pkg = &TOP__ara_pkg;
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(this, true);
    TOP____024unit.__Vconfigure(this, true);
    TOP__ara_pkg.__Vconfigure(this, true);
    // Setup scopes
    __Vscope_ara_tb_verilator.configure(this, name(), "ara_tb_verilator", "ara_tb_verilator", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_ara_tb_verilator__dut__i_ara_soc__i_dram.configure(this, name(), "ara_tb_verilator.dut.i_ara_soc.i_dram", "i_dram", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__0__KET____i_lane.configure(this, name(), "ara_tb_verilator.dut.i_ara_soc.i_system.i_ara.gen_lanes[0].i_lane", "i_lane", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__1__KET____i_lane.configure(this, name(), "ara_tb_verilator.dut.i_ara_soc.i_system.i_ara.gen_lanes[1].i_lane", "i_lane", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__2__KET____i_lane.configure(this, name(), "ara_tb_verilator.dut.i_ara_soc.i_system.i_ara.gen_lanes[2].i_lane", "i_lane", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_ara_tb_verilator__dut__i_ara_soc__i_system__i_ara__gen_lanes__BRA__3__KET____i_lane.configure(this, name(), "ara_tb_verilator.dut.i_ara_soc.i_system.i_ara.gen_lanes[3].i_lane", "i_lane", -12, VerilatedScope::SCOPE_OTHER);
    // Setup export functions
    for (int __Vfinal=0; __Vfinal<2; __Vfinal++) {
        __Vscope_ara_tb_verilator__dut__i_ara_soc__i_dram.exportInsert(__Vfinal, "simutil_get_mem", (void*)(&Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_get_mem_TOP));
        __Vscope_ara_tb_verilator__dut__i_ara_soc__i_dram.exportInsert(__Vfinal, "simutil_memload", (void*)(&Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_memload_TOP));
        __Vscope_ara_tb_verilator__dut__i_ara_soc__i_dram.exportInsert(__Vfinal, "simutil_set_mem", (void*)(&Vara_tb_verilator___024root____Vdpiexp_ara_tb_verilator__DOT__dut__DOT__i_ara_soc__DOT__i_dram__DOT__simutil_set_mem_TOP));
    }
}
