// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vara_tb_verilator.h"
#include "Vara_tb_verilator__Syms.h"
#include "verilated_dpi.h"

//============================================================
// Constructors

Vara_tb_verilator::Vara_tb_verilator(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vara_tb_verilator__Syms(_vcontextp__, _vcname__, this)}
    , clk_i{vlSymsp->TOP.clk_i}
    , rst_ni{vlSymsp->TOP.rst_ni}
    , exit_o{vlSymsp->TOP.exit_o}
    , __PVT____024unit{vlSymsp->TOP.__PVT____024unit}
    , __PVT__ara_pkg{vlSymsp->TOP.__PVT__ara_pkg}
    , rootp{&(vlSymsp->TOP)}
{
}

Vara_tb_verilator::Vara_tb_verilator(const char* _vcname__)
    : Vara_tb_verilator(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vara_tb_verilator::~Vara_tb_verilator() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vara_tb_verilator___024root___eval_initial(Vara_tb_verilator___024root* vlSelf);
void Vara_tb_verilator___024root___eval_settle(Vara_tb_verilator___024root* vlSelf);
void Vara_tb_verilator___024root___eval(Vara_tb_verilator___024root* vlSelf);
QData Vara_tb_verilator___024root___change_request(Vara_tb_verilator___024root* vlSelf);
#ifdef VL_DEBUG
void Vara_tb_verilator___024root___eval_debug_assertions(Vara_tb_verilator___024root* vlSelf);
#endif  // VL_DEBUG
void Vara_tb_verilator___024root___final(Vara_tb_verilator___024root* vlSelf);

static void _eval_initial_loop(Vara_tb_verilator__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vara_tb_verilator___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vara_tb_verilator___024root___eval_settle(&(vlSymsp->TOP));
        Vara_tb_verilator___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vara_tb_verilator___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/ara_tb_verilator.sv", 9, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vara_tb_verilator___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vara_tb_verilator::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vara_tb_verilator::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vara_tb_verilator___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vara_tb_verilator___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vara_tb_verilator___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/ara_tb_verilator.sv", 9, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vara_tb_verilator___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void Vara_tb_verilator::final() {
    Vara_tb_verilator___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vara_tb_verilator::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vara_tb_verilator::name() const {
    return vlSymsp->name();
}
