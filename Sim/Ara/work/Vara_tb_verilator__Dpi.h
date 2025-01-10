// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Prototypes for DPI import and export functions.
//
// Verilator includes this file in all generated .cpp files that use DPI functions.
// Manually include this file where DPI .c import functions are declared to ensure
// the C functions match the expectations of the DPI imports.

#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif


    // DPI EXPORTS
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:270:16
    extern int simutil_get_mem(int index, svBitVecVal* val);
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:249:8
    extern void simutil_memload(const char* file);
    // DPI export at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/tech_cells_generic/src/rtl/tc_sram.sv:257:16
    extern int simutil_set_mem(int index, const svBitVecVal* val);

    // DPI IMPORTS
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/cva6/tb/common/SimDTM.sv:4:29
    extern int debug_tick(svBit* debug_req_valid, svBit debug_req_ready, int* debug_req_bits_addr, int* debug_req_bits_op, int* debug_req_bits_data, svBit debug_resp_valid, svBit* debug_resp_ready, int debug_resp_bits_resp, int debug_resp_bits_data);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/ara_tb.sv:10:30
    extern char get_section(long long* address, long long* len);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/deps/cva6/tb/common/SimJTAG.sv:3:29
    extern int jtag_tick(svBit* jtag_TCK, svBit* jtag_TMS, svBit* jtag_TDI, svBit* jtag_TRSTn, svBit jtag_TDO);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:69:34
    extern void lane_e_protectlib_check_hash(int protectlib_hash___05FV);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:165:34
    extern void lane_e_protectlib_combo_ignore(void* handle___05FV, svLogic scan_enable_i, svLogic scan_data_i, const svLogicVecVal* lane_id_i, const svLogicVecVal* alu_vxrm_i, const svLogicVecVal* pe_req_i, svLogic pe_req_valid_i, const svLogicVecVal* pe_vinsn_running_i, const svLogicVecVal* global_hazard_table_i, svLogic stu_operand_ready_i, svLogic sldu_operand_ready_i, const svLogicVecVal* sldu_mux_sel_i, svLogic addrgen_operand_ready_i, svLogic sldu_result_req_i, const svLogicVecVal* sldu_result_id_i, const svLogicVecVal* sldu_result_addr_i, const svLogicVecVal* sldu_result_wdata_i, const svLogicVecVal* sldu_result_be_i, svLogic sldu_red_valid_i, svLogic ldu_result_req_i, const svLogicVecVal* ldu_result_id_i, const svLogicVecVal* ldu_result_addr_i, const svLogicVecVal* ldu_result_wdata_i, const svLogicVecVal* ldu_result_be_i, const svLogicVecVal* mask_operand_ready_i, svLogic masku_result_req_i, const svLogicVecVal* masku_result_id_i, const svLogicVecVal* masku_result_addr_i, const svLogicVecVal* masku_result_wdata_i, const svLogicVecVal* masku_result_be_i, const svLogicVecVal* mask_i, svLogic mask_valid_i);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:77:37
    extern long long lane_e_protectlib_combo_update(void* handle___05FV, svLogic scan_enable_i, svLogic scan_data_i, svLogic* scan_data_o, const svLogicVecVal* lane_id_i, svLogic* vxsat_flag_o, const svLogicVecVal* alu_vxrm_i, svLogicVecVal* fflags_ex_o, svLogic* fflags_ex_valid_o, const svLogicVecVal* pe_req_i, svLogic pe_req_valid_i, const svLogicVecVal* pe_vinsn_running_i, svLogic* pe_req_ready_o, svLogicVecVal* pe_resp_o, svLogic* alu_vinsn_done_o, svLogic* mfpu_vinsn_done_o, const svLogicVecVal* global_hazard_table_i, svLogicVecVal* stu_operand_o, svLogic* stu_operand_valid_o, svLogic stu_operand_ready_i, svLogicVecVal* sldu_addrgen_operand_o, svLogic* sldu_addrgen_operand_target_fu_o, svLogic* sldu_addrgen_operand_valid_o, svLogic sldu_operand_ready_i, const svLogicVecVal* sldu_mux_sel_i, svLogic addrgen_operand_ready_i, svLogic sldu_result_req_i, const svLogicVecVal* sldu_result_id_i, const svLogicVecVal* sldu_result_addr_i, const svLogicVecVal* sldu_result_wdata_i, const svLogicVecVal* sldu_result_be_i, svLogic* sldu_result_gnt_o, svLogic sldu_red_valid_i, svLogic* sldu_result_final_gnt_o, svLogic ldu_result_req_i, const svLogicVecVal* ldu_result_id_i, const svLogicVecVal* ldu_result_addr_i, const svLogicVecVal* ldu_result_wdata_i, const svLogicVecVal* ldu_result_be_i, svLogic* ldu_result_gnt_o, svLogic* ldu_result_final_gnt_o, svLogicVecVal* mask_operand_o, svLogicVecVal* mask_operand_valid_o, const svLogicVecVal* mask_operand_ready_i, svLogic masku_result_req_i, const svLogicVecVal* masku_result_id_i, const svLogicVecVal* masku_result_addr_i, const svLogicVecVal* masku_result_wdata_i, const svLogicVecVal* masku_result_be_i, svLogic* masku_result_gnt_o, svLogic* masku_result_final_gnt_o, const svLogicVecVal* mask_i, svLogic mask_valid_i, svLogic* mask_ready_o);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:74:37
    extern void* lane_e_protectlib_create(const char* scope___05FV);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:201:34
    extern void lane_e_protectlib_final(void* handle___05FV);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/work/Vlane_e/lane_e.sv:135:37
    extern long long lane_e_protectlib_seq_update(void* handle___05FV, svLogic clk_i, svLogic rst_ni, svLogic* scan_data_o, svLogic* vxsat_flag_o, svLogicVecVal* fflags_ex_o, svLogic* fflags_ex_valid_o, svLogic* pe_req_ready_o, svLogicVecVal* pe_resp_o, svLogic* alu_vinsn_done_o, svLogic* mfpu_vinsn_done_o, svLogicVecVal* stu_operand_o, svLogic* stu_operand_valid_o, svLogicVecVal* sldu_addrgen_operand_o, svLogic* sldu_addrgen_operand_target_fu_o, svLogic* sldu_addrgen_operand_valid_o, svLogic* sldu_result_gnt_o, svLogic* sldu_result_final_gnt_o, svLogic* ldu_result_gnt_o, svLogic* ldu_result_final_gnt_o, svLogicVecVal* mask_operand_o, svLogicVecVal* mask_operand_valid_o, svLogic* masku_result_gnt_o, svLogic* masku_result_final_gnt_o, svLogic* mask_ready_o);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/ara_tb.sv:9:30
    extern void read_elf(const char* filename);
    // DPI import at /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/ara_tb.sv:11:38
    extern char read_section(long long address, const svOpenArrayHandle buffer);

#ifdef __cplusplus
}
#endif
