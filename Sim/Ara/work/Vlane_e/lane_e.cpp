// DESCRIPTION: Verilator generated C++
#include "Vlane_e.h"
#include "verilated_dpi.h"

#include <cstdio>
#include <cstdlib>

class Vlane_e_container: public Vlane_e {
  public:
    long long m_seqnum;
    Vlane_e_container(const char* scopep__V):
    Vlane_e(scopep__V) {}
};

extern "C" {
    
    void lane_e_protectlib_check_hash(int protectlib_hash__V) {
        int expected_hash__V = 1910922565U;
        if (protectlib_hash__V != expected_hash__V) {
            fprintf(stderr, "%%Error: cannot use lane_e library, Verliog (%u) and library (%u) hash values do not agree\n", protectlib_hash__V, expected_hash__V);
            std::exit(EXIT_FAILURE);
        }
    }
    
    void* lane_e_protectlib_create(const char* scopep__V) {
        Vlane_e_container* handlep__V = new Vlane_e_container(scopep__V);
        return handlep__V;
    }
    
    long long lane_e_protectlib_combo_update(
        void* vhandlep__V
        , svLogic scan_enable_i
        , svLogic scan_data_i
        , svLogic* scan_data_o
        , const svLogicVecVal* lane_id_i
        , svLogic* vxsat_flag_o
        , const svLogicVecVal* alu_vxrm_i
        , svLogicVecVal* fflags_ex_o
        , svLogic* fflags_ex_valid_o
        , const svLogicVecVal* pe_req_i
        , svLogic pe_req_valid_i
        , const svLogicVecVal* pe_vinsn_running_i
        , svLogic* pe_req_ready_o
        , svLogicVecVal* pe_resp_o
        , svLogic* alu_vinsn_done_o
        , svLogic* mfpu_vinsn_done_o
        , const svLogicVecVal* global_hazard_table_i
        , svLogicVecVal* stu_operand_o
        , svLogic* stu_operand_valid_o
        , svLogic stu_operand_ready_i
        , svLogicVecVal* sldu_addrgen_operand_o
        , svLogic* sldu_addrgen_operand_target_fu_o
        , svLogic* sldu_addrgen_operand_valid_o
        , svLogic sldu_operand_ready_i
        , const svLogicVecVal* sldu_mux_sel_i
        , svLogic addrgen_operand_ready_i
        , svLogic sldu_result_req_i
        , const svLogicVecVal* sldu_result_id_i
        , const svLogicVecVal* sldu_result_addr_i
        , const svLogicVecVal* sldu_result_wdata_i
        , const svLogicVecVal* sldu_result_be_i
        , svLogic* sldu_result_gnt_o
        , svLogic sldu_red_valid_i
        , svLogic* sldu_result_final_gnt_o
        , svLogic ldu_result_req_i
        , const svLogicVecVal* ldu_result_id_i
        , const svLogicVecVal* ldu_result_addr_i
        , const svLogicVecVal* ldu_result_wdata_i
        , const svLogicVecVal* ldu_result_be_i
        , svLogic* ldu_result_gnt_o
        , svLogic* ldu_result_final_gnt_o
        , svLogicVecVal* mask_operand_o
        , svLogicVecVal* mask_operand_valid_o
        , const svLogicVecVal* mask_operand_ready_i
        , svLogic masku_result_req_i
        , const svLogicVecVal* masku_result_id_i
        , const svLogicVecVal* masku_result_addr_i
        , const svLogicVecVal* masku_result_wdata_i
        , const svLogicVecVal* masku_result_be_i
        , svLogic* masku_result_gnt_o
        , svLogic* masku_result_final_gnt_o
        , const svLogicVecVal* mask_i
        , svLogic mask_valid_i
        , svLogic* mask_ready_o
    )
    {
        Vlane_e_container* handlep__V = static_cast<Vlane_e_container*>(vhandlep__V);
        handlep__V->scan_enable_i = scan_enable_i;
        handlep__V->scan_data_i = scan_data_i;
        handlep__V->lane_id_i = VL_SET_I_SVLV(lane_id_i);
        handlep__V->alu_vxrm_i = VL_SET_I_SVLV(alu_vxrm_i);
        VL_SET_W_SVLV(261, handlep__V->pe_req_i, pe_req_i + 0);
        handlep__V->pe_req_valid_i = pe_req_valid_i;
        handlep__V->pe_vinsn_running_i = VL_SET_I_SVLV(pe_vinsn_running_i);
        handlep__V->global_hazard_table_i = VL_SET_Q_SVLV(global_hazard_table_i);
        handlep__V->stu_operand_ready_i = stu_operand_ready_i;
        handlep__V->sldu_operand_ready_i = sldu_operand_ready_i;
        handlep__V->sldu_mux_sel_i = VL_SET_I_SVLV(sldu_mux_sel_i);
        handlep__V->addrgen_operand_ready_i = addrgen_operand_ready_i;
        handlep__V->sldu_result_req_i = sldu_result_req_i;
        handlep__V->sldu_result_id_i = VL_SET_I_SVLV(sldu_result_id_i);
        handlep__V->sldu_result_addr_i = VL_SET_I_SVLV(sldu_result_addr_i);
        handlep__V->sldu_result_wdata_i = VL_SET_Q_SVLV(sldu_result_wdata_i);
        handlep__V->sldu_result_be_i = VL_SET_I_SVLV(sldu_result_be_i);
        handlep__V->sldu_red_valid_i = sldu_red_valid_i;
        handlep__V->ldu_result_req_i = ldu_result_req_i;
        handlep__V->ldu_result_id_i = VL_SET_I_SVLV(ldu_result_id_i);
        handlep__V->ldu_result_addr_i = VL_SET_I_SVLV(ldu_result_addr_i);
        handlep__V->ldu_result_wdata_i = VL_SET_Q_SVLV(ldu_result_wdata_i);
        handlep__V->ldu_result_be_i = VL_SET_I_SVLV(ldu_result_be_i);
        handlep__V->mask_operand_ready_i = VL_SET_I_SVLV(mask_operand_ready_i);
        handlep__V->masku_result_req_i = masku_result_req_i;
        handlep__V->masku_result_id_i = VL_SET_I_SVLV(masku_result_id_i);
        handlep__V->masku_result_addr_i = VL_SET_I_SVLV(masku_result_addr_i);
        handlep__V->masku_result_wdata_i = VL_SET_Q_SVLV(masku_result_wdata_i);
        handlep__V->masku_result_be_i = VL_SET_I_SVLV(masku_result_be_i);
        handlep__V->mask_i = VL_SET_I_SVLV(mask_i);
        handlep__V->mask_valid_i = mask_valid_i;
        handlep__V->eval();
        for (size_t scan_data_o__Vidx = 0; scan_data_o__Vidx < 1; ++scan_data_o__Vidx) *scan_data_o = handlep__V->scan_data_o;
        for (size_t vxsat_flag_o__Vidx = 0; vxsat_flag_o__Vidx < 1; ++vxsat_flag_o__Vidx) *vxsat_flag_o = handlep__V->vxsat_flag_o;
        for (size_t fflags_ex_o__Vidx = 0; fflags_ex_o__Vidx < 1; ++fflags_ex_o__Vidx) VL_SET_SVLV_I(5, fflags_ex_o + 1 * fflags_ex_o__Vidx, handlep__V->fflags_ex_o);
        for (size_t fflags_ex_valid_o__Vidx = 0; fflags_ex_valid_o__Vidx < 1; ++fflags_ex_valid_o__Vidx) *fflags_ex_valid_o = handlep__V->fflags_ex_valid_o;
        for (size_t pe_req_ready_o__Vidx = 0; pe_req_ready_o__Vidx < 1; ++pe_req_ready_o__Vidx) *pe_req_ready_o = handlep__V->pe_req_ready_o;
        for (size_t pe_resp_o__Vidx = 0; pe_resp_o__Vidx < 1; ++pe_resp_o__Vidx) VL_SET_SVLV_I(8, pe_resp_o + 1 * pe_resp_o__Vidx, handlep__V->pe_resp_o);
        for (size_t alu_vinsn_done_o__Vidx = 0; alu_vinsn_done_o__Vidx < 1; ++alu_vinsn_done_o__Vidx) *alu_vinsn_done_o = handlep__V->alu_vinsn_done_o;
        for (size_t mfpu_vinsn_done_o__Vidx = 0; mfpu_vinsn_done_o__Vidx < 1; ++mfpu_vinsn_done_o__Vidx) *mfpu_vinsn_done_o = handlep__V->mfpu_vinsn_done_o;
        for (size_t stu_operand_o__Vidx = 0; stu_operand_o__Vidx < 1; ++stu_operand_o__Vidx) VL_SET_SVLV_Q(64, stu_operand_o + 2 * stu_operand_o__Vidx, handlep__V->stu_operand_o);
        for (size_t stu_operand_valid_o__Vidx = 0; stu_operand_valid_o__Vidx < 1; ++stu_operand_valid_o__Vidx) *stu_operand_valid_o = handlep__V->stu_operand_valid_o;
        for (size_t sldu_addrgen_operand_o__Vidx = 0; sldu_addrgen_operand_o__Vidx < 1; ++sldu_addrgen_operand_o__Vidx) VL_SET_SVLV_Q(64, sldu_addrgen_operand_o + 2 * sldu_addrgen_operand_o__Vidx, handlep__V->sldu_addrgen_operand_o);
        for (size_t sldu_addrgen_operand_target_fu_o__Vidx = 0; sldu_addrgen_operand_target_fu_o__Vidx < 1; ++sldu_addrgen_operand_target_fu_o__Vidx) *sldu_addrgen_operand_target_fu_o = handlep__V->sldu_addrgen_operand_target_fu_o;
        for (size_t sldu_addrgen_operand_valid_o__Vidx = 0; sldu_addrgen_operand_valid_o__Vidx < 1; ++sldu_addrgen_operand_valid_o__Vidx) *sldu_addrgen_operand_valid_o = handlep__V->sldu_addrgen_operand_valid_o;
        for (size_t sldu_result_gnt_o__Vidx = 0; sldu_result_gnt_o__Vidx < 1; ++sldu_result_gnt_o__Vidx) *sldu_result_gnt_o = handlep__V->sldu_result_gnt_o;
        for (size_t sldu_result_final_gnt_o__Vidx = 0; sldu_result_final_gnt_o__Vidx < 1; ++sldu_result_final_gnt_o__Vidx) *sldu_result_final_gnt_o = handlep__V->sldu_result_final_gnt_o;
        for (size_t ldu_result_gnt_o__Vidx = 0; ldu_result_gnt_o__Vidx < 1; ++ldu_result_gnt_o__Vidx) *ldu_result_gnt_o = handlep__V->ldu_result_gnt_o;
        for (size_t ldu_result_final_gnt_o__Vidx = 0; ldu_result_final_gnt_o__Vidx < 1; ++ldu_result_final_gnt_o__Vidx) *ldu_result_final_gnt_o = handlep__V->ldu_result_final_gnt_o;
        for (size_t mask_operand_o__Vidx = 0; mask_operand_o__Vidx < 1; ++mask_operand_o__Vidx) VL_SET_SVLV_W(256, mask_operand_o + 8 * mask_operand_o__Vidx, handlep__V->mask_operand_o);
        for (size_t mask_operand_valid_o__Vidx = 0; mask_operand_valid_o__Vidx < 1; ++mask_operand_valid_o__Vidx) VL_SET_SVLV_I(4, mask_operand_valid_o + 1 * mask_operand_valid_o__Vidx, handlep__V->mask_operand_valid_o);
        for (size_t masku_result_gnt_o__Vidx = 0; masku_result_gnt_o__Vidx < 1; ++masku_result_gnt_o__Vidx) *masku_result_gnt_o = handlep__V->masku_result_gnt_o;
        for (size_t masku_result_final_gnt_o__Vidx = 0; masku_result_final_gnt_o__Vidx < 1; ++masku_result_final_gnt_o__Vidx) *masku_result_final_gnt_o = handlep__V->masku_result_final_gnt_o;
        for (size_t mask_ready_o__Vidx = 0; mask_ready_o__Vidx < 1; ++mask_ready_o__Vidx) *mask_ready_o = handlep__V->mask_ready_o;
        return handlep__V->m_seqnum++;
    }
    
    long long lane_e_protectlib_seq_update(
        void* vhandlep__V
        , svLogic clk_i
        , svLogic rst_ni
        , svLogic* scan_data_o
        , svLogic* vxsat_flag_o
        , svLogicVecVal* fflags_ex_o
        , svLogic* fflags_ex_valid_o
        , svLogic* pe_req_ready_o
        , svLogicVecVal* pe_resp_o
        , svLogic* alu_vinsn_done_o
        , svLogic* mfpu_vinsn_done_o
        , svLogicVecVal* stu_operand_o
        , svLogic* stu_operand_valid_o
        , svLogicVecVal* sldu_addrgen_operand_o
        , svLogic* sldu_addrgen_operand_target_fu_o
        , svLogic* sldu_addrgen_operand_valid_o
        , svLogic* sldu_result_gnt_o
        , svLogic* sldu_result_final_gnt_o
        , svLogic* ldu_result_gnt_o
        , svLogic* ldu_result_final_gnt_o
        , svLogicVecVal* mask_operand_o
        , svLogicVecVal* mask_operand_valid_o
        , svLogic* masku_result_gnt_o
        , svLogic* masku_result_final_gnt_o
        , svLogic* mask_ready_o
    )
    {
        Vlane_e_container* handlep__V = static_cast<Vlane_e_container*>(vhandlep__V);
        handlep__V->clk_i = clk_i;
        handlep__V->rst_ni = rst_ni;
        handlep__V->eval();
        for (size_t scan_data_o__Vidx = 0; scan_data_o__Vidx < 1; ++scan_data_o__Vidx) *scan_data_o = handlep__V->scan_data_o;
        for (size_t vxsat_flag_o__Vidx = 0; vxsat_flag_o__Vidx < 1; ++vxsat_flag_o__Vidx) *vxsat_flag_o = handlep__V->vxsat_flag_o;
        for (size_t fflags_ex_o__Vidx = 0; fflags_ex_o__Vidx < 1; ++fflags_ex_o__Vidx) VL_SET_SVLV_I(5, fflags_ex_o + 1 * fflags_ex_o__Vidx, handlep__V->fflags_ex_o);
        for (size_t fflags_ex_valid_o__Vidx = 0; fflags_ex_valid_o__Vidx < 1; ++fflags_ex_valid_o__Vidx) *fflags_ex_valid_o = handlep__V->fflags_ex_valid_o;
        for (size_t pe_req_ready_o__Vidx = 0; pe_req_ready_o__Vidx < 1; ++pe_req_ready_o__Vidx) *pe_req_ready_o = handlep__V->pe_req_ready_o;
        for (size_t pe_resp_o__Vidx = 0; pe_resp_o__Vidx < 1; ++pe_resp_o__Vidx) VL_SET_SVLV_I(8, pe_resp_o + 1 * pe_resp_o__Vidx, handlep__V->pe_resp_o);
        for (size_t alu_vinsn_done_o__Vidx = 0; alu_vinsn_done_o__Vidx < 1; ++alu_vinsn_done_o__Vidx) *alu_vinsn_done_o = handlep__V->alu_vinsn_done_o;
        for (size_t mfpu_vinsn_done_o__Vidx = 0; mfpu_vinsn_done_o__Vidx < 1; ++mfpu_vinsn_done_o__Vidx) *mfpu_vinsn_done_o = handlep__V->mfpu_vinsn_done_o;
        for (size_t stu_operand_o__Vidx = 0; stu_operand_o__Vidx < 1; ++stu_operand_o__Vidx) VL_SET_SVLV_Q(64, stu_operand_o + 2 * stu_operand_o__Vidx, handlep__V->stu_operand_o);
        for (size_t stu_operand_valid_o__Vidx = 0; stu_operand_valid_o__Vidx < 1; ++stu_operand_valid_o__Vidx) *stu_operand_valid_o = handlep__V->stu_operand_valid_o;
        for (size_t sldu_addrgen_operand_o__Vidx = 0; sldu_addrgen_operand_o__Vidx < 1; ++sldu_addrgen_operand_o__Vidx) VL_SET_SVLV_Q(64, sldu_addrgen_operand_o + 2 * sldu_addrgen_operand_o__Vidx, handlep__V->sldu_addrgen_operand_o);
        for (size_t sldu_addrgen_operand_target_fu_o__Vidx = 0; sldu_addrgen_operand_target_fu_o__Vidx < 1; ++sldu_addrgen_operand_target_fu_o__Vidx) *sldu_addrgen_operand_target_fu_o = handlep__V->sldu_addrgen_operand_target_fu_o;
        for (size_t sldu_addrgen_operand_valid_o__Vidx = 0; sldu_addrgen_operand_valid_o__Vidx < 1; ++sldu_addrgen_operand_valid_o__Vidx) *sldu_addrgen_operand_valid_o = handlep__V->sldu_addrgen_operand_valid_o;
        for (size_t sldu_result_gnt_o__Vidx = 0; sldu_result_gnt_o__Vidx < 1; ++sldu_result_gnt_o__Vidx) *sldu_result_gnt_o = handlep__V->sldu_result_gnt_o;
        for (size_t sldu_result_final_gnt_o__Vidx = 0; sldu_result_final_gnt_o__Vidx < 1; ++sldu_result_final_gnt_o__Vidx) *sldu_result_final_gnt_o = handlep__V->sldu_result_final_gnt_o;
        for (size_t ldu_result_gnt_o__Vidx = 0; ldu_result_gnt_o__Vidx < 1; ++ldu_result_gnt_o__Vidx) *ldu_result_gnt_o = handlep__V->ldu_result_gnt_o;
        for (size_t ldu_result_final_gnt_o__Vidx = 0; ldu_result_final_gnt_o__Vidx < 1; ++ldu_result_final_gnt_o__Vidx) *ldu_result_final_gnt_o = handlep__V->ldu_result_final_gnt_o;
        for (size_t mask_operand_o__Vidx = 0; mask_operand_o__Vidx < 1; ++mask_operand_o__Vidx) VL_SET_SVLV_W(256, mask_operand_o + 8 * mask_operand_o__Vidx, handlep__V->mask_operand_o);
        for (size_t mask_operand_valid_o__Vidx = 0; mask_operand_valid_o__Vidx < 1; ++mask_operand_valid_o__Vidx) VL_SET_SVLV_I(4, mask_operand_valid_o + 1 * mask_operand_valid_o__Vidx, handlep__V->mask_operand_valid_o);
        for (size_t masku_result_gnt_o__Vidx = 0; masku_result_gnt_o__Vidx < 1; ++masku_result_gnt_o__Vidx) *masku_result_gnt_o = handlep__V->masku_result_gnt_o;
        for (size_t masku_result_final_gnt_o__Vidx = 0; masku_result_final_gnt_o__Vidx < 1; ++masku_result_final_gnt_o__Vidx) *masku_result_final_gnt_o = handlep__V->masku_result_final_gnt_o;
        for (size_t mask_ready_o__Vidx = 0; mask_ready_o__Vidx < 1; ++mask_ready_o__Vidx) *mask_ready_o = handlep__V->mask_ready_o;
        return handlep__V->m_seqnum++;
    }
    
    void lane_e_protectlib_combo_ignore(
        void* vhandlep__V
        , svLogic scan_enable_i
        , svLogic scan_data_i
        , const svLogicVecVal* lane_id_i
        , const svLogicVecVal* alu_vxrm_i
        , const svLogicVecVal* pe_req_i
        , svLogic pe_req_valid_i
        , const svLogicVecVal* pe_vinsn_running_i
        , const svLogicVecVal* global_hazard_table_i
        , svLogic stu_operand_ready_i
        , svLogic sldu_operand_ready_i
        , const svLogicVecVal* sldu_mux_sel_i
        , svLogic addrgen_operand_ready_i
        , svLogic sldu_result_req_i
        , const svLogicVecVal* sldu_result_id_i
        , const svLogicVecVal* sldu_result_addr_i
        , const svLogicVecVal* sldu_result_wdata_i
        , const svLogicVecVal* sldu_result_be_i
        , svLogic sldu_red_valid_i
        , svLogic ldu_result_req_i
        , const svLogicVecVal* ldu_result_id_i
        , const svLogicVecVal* ldu_result_addr_i
        , const svLogicVecVal* ldu_result_wdata_i
        , const svLogicVecVal* ldu_result_be_i
        , const svLogicVecVal* mask_operand_ready_i
        , svLogic masku_result_req_i
        , const svLogicVecVal* masku_result_id_i
        , const svLogicVecVal* masku_result_addr_i
        , const svLogicVecVal* masku_result_wdata_i
        , const svLogicVecVal* masku_result_be_i
        , const svLogicVecVal* mask_i
        , svLogic mask_valid_i
    )
    { }
    
    void lane_e_protectlib_final(void* vhandlep__V) {
        Vlane_e_container* handlep__V = static_cast<Vlane_e_container*>(vhandlep__V);
        handlep__V->final();
        delete handlep__V;
    }
    
}
