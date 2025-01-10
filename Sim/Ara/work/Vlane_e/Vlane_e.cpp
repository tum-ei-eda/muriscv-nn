// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vlane_e.h"
#include "Vlane_e_PSplPG.h"
#include "verilated_dpi.h"

//============================================================
// Constructors

Vlane_e::Vlane_e(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vlane_e_PSplPG(_vcontextp__, _vcname__, this)}
    , clk_i{vlSymsp->TOP.clk_i}
    , rst_ni{vlSymsp->TOP.rst_ni}
    , scan_enable_i{vlSymsp->TOP.scan_enable_i}
    , scan_data_i{vlSymsp->TOP.scan_data_i}
    , scan_data_o{vlSymsp->TOP.scan_data_o}
    , lane_id_i{vlSymsp->TOP.lane_id_i}
    , vxsat_flag_o{vlSymsp->TOP.vxsat_flag_o}
    , alu_vxrm_i{vlSymsp->TOP.alu_vxrm_i}
    , fflags_ex_o{vlSymsp->TOP.fflags_ex_o}
    , fflags_ex_valid_o{vlSymsp->TOP.fflags_ex_valid_o}
    , pe_req_i{vlSymsp->TOP.pe_req_i}
    , pe_req_valid_i{vlSymsp->TOP.pe_req_valid_i}
    , pe_vinsn_running_i{vlSymsp->TOP.pe_vinsn_running_i}
    , pe_req_ready_o{vlSymsp->TOP.pe_req_ready_o}
    , pe_resp_o{vlSymsp->TOP.pe_resp_o}
    , alu_vinsn_done_o{vlSymsp->TOP.alu_vinsn_done_o}
    , mfpu_vinsn_done_o{vlSymsp->TOP.mfpu_vinsn_done_o}
    , global_hazard_table_i{vlSymsp->TOP.global_hazard_table_i}
    , stu_operand_o{vlSymsp->TOP.stu_operand_o}
    , stu_operand_valid_o{vlSymsp->TOP.stu_operand_valid_o}
    , stu_operand_ready_i{vlSymsp->TOP.stu_operand_ready_i}
    , sldu_addrgen_operand_o{vlSymsp->TOP.sldu_addrgen_operand_o}
    , sldu_addrgen_operand_target_fu_o{vlSymsp->TOP.sldu_addrgen_operand_target_fu_o}
    , sldu_addrgen_operand_valid_o{vlSymsp->TOP.sldu_addrgen_operand_valid_o}
    , sldu_operand_ready_i{vlSymsp->TOP.sldu_operand_ready_i}
    , sldu_mux_sel_i{vlSymsp->TOP.sldu_mux_sel_i}
    , addrgen_operand_ready_i{vlSymsp->TOP.addrgen_operand_ready_i}
    , sldu_result_req_i{vlSymsp->TOP.sldu_result_req_i}
    , sldu_result_id_i{vlSymsp->TOP.sldu_result_id_i}
    , sldu_result_addr_i{vlSymsp->TOP.sldu_result_addr_i}
    , sldu_result_wdata_i{vlSymsp->TOP.sldu_result_wdata_i}
    , sldu_result_be_i{vlSymsp->TOP.sldu_result_be_i}
    , sldu_result_gnt_o{vlSymsp->TOP.sldu_result_gnt_o}
    , sldu_red_valid_i{vlSymsp->TOP.sldu_red_valid_i}
    , sldu_result_final_gnt_o{vlSymsp->TOP.sldu_result_final_gnt_o}
    , ldu_result_req_i{vlSymsp->TOP.ldu_result_req_i}
    , ldu_result_id_i{vlSymsp->TOP.ldu_result_id_i}
    , ldu_result_addr_i{vlSymsp->TOP.ldu_result_addr_i}
    , ldu_result_wdata_i{vlSymsp->TOP.ldu_result_wdata_i}
    , ldu_result_be_i{vlSymsp->TOP.ldu_result_be_i}
    , ldu_result_gnt_o{vlSymsp->TOP.ldu_result_gnt_o}
    , ldu_result_final_gnt_o{vlSymsp->TOP.ldu_result_final_gnt_o}
    , mask_operand_o{vlSymsp->TOP.mask_operand_o}
    , mask_operand_valid_o{vlSymsp->TOP.mask_operand_valid_o}
    , mask_operand_ready_i{vlSymsp->TOP.mask_operand_ready_i}
    , masku_result_req_i{vlSymsp->TOP.masku_result_req_i}
    , masku_result_id_i{vlSymsp->TOP.masku_result_id_i}
    , masku_result_addr_i{vlSymsp->TOP.masku_result_addr_i}
    , masku_result_wdata_i{vlSymsp->TOP.masku_result_wdata_i}
    , masku_result_be_i{vlSymsp->TOP.masku_result_be_i}
    , masku_result_gnt_o{vlSymsp->TOP.masku_result_gnt_o}
    , masku_result_final_gnt_o{vlSymsp->TOP.masku_result_final_gnt_o}
    , mask_i{vlSymsp->TOP.mask_i}
    , mask_valid_i{vlSymsp->TOP.mask_valid_i}
    , mask_ready_o{vlSymsp->TOP.mask_ready_o}
    , PS5hh5{vlSymsp->TOP.PS5hh5}
    , PSSJPk{vlSymsp->TOP.PSSJPk}
    , rootp{&(vlSymsp->TOP)}
{
}

Vlane_e::Vlane_e(const char* _vcname__)
    : Vlane_e(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vlane_e::~Vlane_e() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vlane_e_PSBYia__PSXbzF(Vlane_e_PSBYia* vlSelf);
void Vlane_e_PSBYia__PSPdm0(Vlane_e_PSBYia* vlSelf);
void Vlane_e_PSBYia__PS6Ufe(Vlane_e_PSBYia* vlSelf);
QData Vlane_e_PSBYia__PSNSkj(Vlane_e_PSBYia* vlSelf);
#ifdef VL_DEBUG
void Vlane_e_PSBYia__PSkcqx(Vlane_e_PSBYia* vlSelf);
#endif  // VL_DEBUG
void Vlane_e_PSBYia__PSKhnH(Vlane_e_PSBYia* vlSelf);

static void PSIcVH(Vlane_e_PSplPG* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vlane_e_PSBYia__PSXbzF(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vlane_e_PSBYia__PSPdm0(&(vlSymsp->TOP));
        Vlane_e_PSBYia__PS6Ufe(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vlane_e_PSBYia__PSNSkj(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("PSP9Mw", 12, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vlane_e_PSBYia__PSNSkj(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vlane_e::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vlane_e::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vlane_e_PSBYia__PSkcqx(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) PSIcVH(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vlane_e_PSBYia__PS6Ufe(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vlane_e_PSBYia__PSNSkj(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("PSP9Mw", 12, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vlane_e_PSBYia__PSNSkj(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void Vlane_e::final() {
    Vlane_e_PSBYia__PSKhnH(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vlane_e::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vlane_e::name() const {
    return vlSymsp->name();
}
