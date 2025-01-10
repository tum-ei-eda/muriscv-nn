// DESCRIPTION: Verilator generated Verilog
// Wrapper module for DPI protected library
// This module requires liblane_e.a or liblane_e.so to work
// See instructions in your simulator for how to use DPI libraries

module lane_e (
        input logic clk_i
        , input logic rst_ni
        , input logic scan_enable_i
        , input logic scan_data_i
        , output logic scan_data_o
        , input logic [1:0]  lane_id_i
        , output logic vxsat_flag_o
        , input logic [1:0]  alu_vxrm_i
        , output logic [4:0]  fflags_ex_o
        , output logic fflags_ex_valid_o
        , input logic [260:0]  pe_req_i
        , input logic pe_req_valid_i
        , input logic [7:0]  pe_vinsn_running_i
        , output logic pe_req_ready_o
        , output logic [7:0]  pe_resp_o
        , output logic alu_vinsn_done_o
        , output logic mfpu_vinsn_done_o
        , input logic [7:0] [7:0] global_hazard_table_i
        , output logic [63:0]  stu_operand_o
        , output logic stu_operand_valid_o
        , input logic stu_operand_ready_i
        , output logic [63:0]  sldu_addrgen_operand_o
        , output logic sldu_addrgen_operand_target_fu_o
        , output logic sldu_addrgen_operand_valid_o
        , input logic sldu_operand_ready_i
        , input logic [1:0]  sldu_mux_sel_i
        , input logic addrgen_operand_ready_i
        , input logic sldu_result_req_i
        , input logic [2:0]  sldu_result_id_i
        , input logic [11:0]  sldu_result_addr_i
        , input logic [63:0]  sldu_result_wdata_i
        , input logic [7:0]  sldu_result_be_i
        , output logic sldu_result_gnt_o
        , input logic sldu_red_valid_i
        , output logic sldu_result_final_gnt_o
        , input logic ldu_result_req_i
        , input logic [2:0]  ldu_result_id_i
        , input logic [11:0]  ldu_result_addr_i
        , input logic [63:0]  ldu_result_wdata_i
        , input logic [7:0]  ldu_result_be_i
        , output logic ldu_result_gnt_o
        , output logic ldu_result_final_gnt_o
        , output logic [63:0] [3:0] mask_operand_o
        , output logic [3:0]  mask_operand_valid_o
        , input logic [3:0]  mask_operand_ready_i
        , input logic masku_result_req_i
        , input logic [2:0]  masku_result_id_i
        , input logic [11:0]  masku_result_addr_i
        , input logic [63:0]  masku_result_wdata_i
        , input logic [7:0]  masku_result_be_i
        , output logic masku_result_gnt_o
        , output logic masku_result_final_gnt_o
        , input logic [7:0]  mask_i
        , input logic mask_valid_i
        , output logic mask_ready_o
    );
    
    // Precision of submodule (commented out to avoid requiring timescale on all modules)
    // timeunit 1ps;
    // timeprecision 1ps;
    
    // Checks to make sure the .sv wrapper and library agree
    import "DPI-C" function void lane_e_protectlib_check_hash(int protectlib_hash__V);
    
    // Creates an instance of the secret module at initial-time
    // (one for each instance in the user's design) also evaluates
    // the secret module's initial process
    import "DPI-C" function chandle lane_e_protectlib_create(string scope__V);
    
    // Updates all non-clock inputs and retrieves the results
    import "DPI-C" function longint lane_e_protectlib_combo_update (
        chandle handle__V
        , input logic scan_enable_i
        , input logic scan_data_i
        , output logic scan_data_o
        , input logic [1:0]  lane_id_i
        , output logic vxsat_flag_o
        , input logic [1:0]  alu_vxrm_i
        , output logic [4:0]  fflags_ex_o
        , output logic fflags_ex_valid_o
        , input logic [260:0]  pe_req_i
        , input logic pe_req_valid_i
        , input logic [7:0]  pe_vinsn_running_i
        , output logic pe_req_ready_o
        , output logic [7:0]  pe_resp_o
        , output logic alu_vinsn_done_o
        , output logic mfpu_vinsn_done_o
        , input logic [7:0] [7:0] global_hazard_table_i
        , output logic [63:0]  stu_operand_o
        , output logic stu_operand_valid_o
        , input logic stu_operand_ready_i
        , output logic [63:0]  sldu_addrgen_operand_o
        , output logic sldu_addrgen_operand_target_fu_o
        , output logic sldu_addrgen_operand_valid_o
        , input logic sldu_operand_ready_i
        , input logic [1:0]  sldu_mux_sel_i
        , input logic addrgen_operand_ready_i
        , input logic sldu_result_req_i
        , input logic [2:0]  sldu_result_id_i
        , input logic [11:0]  sldu_result_addr_i
        , input logic [63:0]  sldu_result_wdata_i
        , input logic [7:0]  sldu_result_be_i
        , output logic sldu_result_gnt_o
        , input logic sldu_red_valid_i
        , output logic sldu_result_final_gnt_o
        , input logic ldu_result_req_i
        , input logic [2:0]  ldu_result_id_i
        , input logic [11:0]  ldu_result_addr_i
        , input logic [63:0]  ldu_result_wdata_i
        , input logic [7:0]  ldu_result_be_i
        , output logic ldu_result_gnt_o
        , output logic ldu_result_final_gnt_o
        , output logic [63:0] [3:0] mask_operand_o
        , output logic [3:0]  mask_operand_valid_o
        , input logic [3:0]  mask_operand_ready_i
        , input logic masku_result_req_i
        , input logic [2:0]  masku_result_id_i
        , input logic [11:0]  masku_result_addr_i
        , input logic [63:0]  masku_result_wdata_i
        , input logic [7:0]  masku_result_be_i
        , output logic masku_result_gnt_o
        , output logic masku_result_final_gnt_o
        , input logic [7:0]  mask_i
        , input logic mask_valid_i
        , output logic mask_ready_o
    );
    
    // Updates all clocks and retrieves the results
    import "DPI-C" function longint lane_e_protectlib_seq_update(
        chandle handle__V
        , input logic clk_i
        , input logic rst_ni
        , output logic scan_data_o
        , output logic vxsat_flag_o
        , output logic [4:0]  fflags_ex_o
        , output logic fflags_ex_valid_o
        , output logic pe_req_ready_o
        , output logic [7:0]  pe_resp_o
        , output logic alu_vinsn_done_o
        , output logic mfpu_vinsn_done_o
        , output logic [63:0]  stu_operand_o
        , output logic stu_operand_valid_o
        , output logic [63:0]  sldu_addrgen_operand_o
        , output logic sldu_addrgen_operand_target_fu_o
        , output logic sldu_addrgen_operand_valid_o
        , output logic sldu_result_gnt_o
        , output logic sldu_result_final_gnt_o
        , output logic ldu_result_gnt_o
        , output logic ldu_result_final_gnt_o
        , output logic [63:0] [3:0] mask_operand_o
        , output logic [3:0]  mask_operand_valid_o
        , output logic masku_result_gnt_o
        , output logic masku_result_final_gnt_o
        , output logic mask_ready_o
    );
    
    // Need to convince some simulators that the input to the module
    // must be evaluated before evaluating the clock edge
    import "DPI-C" function void lane_e_protectlib_combo_ignore(
        chandle handle__V
        , input logic scan_enable_i
        , input logic scan_data_i
        , input logic [1:0]  lane_id_i
        , input logic [1:0]  alu_vxrm_i
        , input logic [260:0]  pe_req_i
        , input logic pe_req_valid_i
        , input logic [7:0]  pe_vinsn_running_i
        , input logic [7:0] [7:0] global_hazard_table_i
        , input logic stu_operand_ready_i
        , input logic sldu_operand_ready_i
        , input logic [1:0]  sldu_mux_sel_i
        , input logic addrgen_operand_ready_i
        , input logic sldu_result_req_i
        , input logic [2:0]  sldu_result_id_i
        , input logic [11:0]  sldu_result_addr_i
        , input logic [63:0]  sldu_result_wdata_i
        , input logic [7:0]  sldu_result_be_i
        , input logic sldu_red_valid_i
        , input logic ldu_result_req_i
        , input logic [2:0]  ldu_result_id_i
        , input logic [11:0]  ldu_result_addr_i
        , input logic [63:0]  ldu_result_wdata_i
        , input logic [7:0]  ldu_result_be_i
        , input logic [3:0]  mask_operand_ready_i
        , input logic masku_result_req_i
        , input logic [2:0]  masku_result_id_i
        , input logic [11:0]  masku_result_addr_i
        , input logic [63:0]  masku_result_wdata_i
        , input logic [7:0]  masku_result_be_i
        , input logic [7:0]  mask_i
        , input logic mask_valid_i
    );
    
    // Evaluates the secret module's final process
    import "DPI-C" function void lane_e_protectlib_final(chandle handle__V);
    
    chandle handle__V;
    
    logic scan_data_o_combo__V;
    logic vxsat_flag_o_combo__V;
    logic [4:0]  fflags_ex_o_combo__V;
    logic fflags_ex_valid_o_combo__V;
    logic pe_req_ready_o_combo__V;
    logic [7:0]  pe_resp_o_combo__V;
    logic alu_vinsn_done_o_combo__V;
    logic mfpu_vinsn_done_o_combo__V;
    logic [63:0]  stu_operand_o_combo__V;
    logic stu_operand_valid_o_combo__V;
    logic [63:0]  sldu_addrgen_operand_o_combo__V;
    logic sldu_addrgen_operand_target_fu_o_combo__V;
    logic sldu_addrgen_operand_valid_o_combo__V;
    logic sldu_result_gnt_o_combo__V;
    logic sldu_result_final_gnt_o_combo__V;
    logic ldu_result_gnt_o_combo__V;
    logic ldu_result_final_gnt_o_combo__V;
    logic [63:0] [3:0] mask_operand_o_combo__V;
    logic [3:0]  mask_operand_valid_o_combo__V;
    logic masku_result_gnt_o_combo__V;
    logic masku_result_final_gnt_o_combo__V;
    logic mask_ready_o_combo__V;
    logic scan_data_o_seq__V;
    logic vxsat_flag_o_seq__V;
    logic [4:0]  fflags_ex_o_seq__V;
    logic fflags_ex_valid_o_seq__V;
    logic pe_req_ready_o_seq__V;
    logic [7:0]  pe_resp_o_seq__V;
    logic alu_vinsn_done_o_seq__V;
    logic mfpu_vinsn_done_o_seq__V;
    logic [63:0]  stu_operand_o_seq__V;
    logic stu_operand_valid_o_seq__V;
    logic [63:0]  sldu_addrgen_operand_o_seq__V;
    logic sldu_addrgen_operand_target_fu_o_seq__V;
    logic sldu_addrgen_operand_valid_o_seq__V;
    logic sldu_result_gnt_o_seq__V;
    logic sldu_result_final_gnt_o_seq__V;
    logic ldu_result_gnt_o_seq__V;
    logic ldu_result_final_gnt_o_seq__V;
    logic [63:0] [3:0] mask_operand_o_seq__V;
    logic [3:0]  mask_operand_valid_o_seq__V;
    logic masku_result_gnt_o_seq__V;
    logic masku_result_final_gnt_o_seq__V;
    logic mask_ready_o_seq__V;
    logic scan_data_o_tmp__V;
    logic vxsat_flag_o_tmp__V;
    logic [4:0]  fflags_ex_o_tmp__V;
    logic fflags_ex_valid_o_tmp__V;
    logic pe_req_ready_o_tmp__V;
    logic [7:0]  pe_resp_o_tmp__V;
    logic alu_vinsn_done_o_tmp__V;
    logic mfpu_vinsn_done_o_tmp__V;
    logic [63:0]  stu_operand_o_tmp__V;
    logic stu_operand_valid_o_tmp__V;
    logic [63:0]  sldu_addrgen_operand_o_tmp__V;
    logic sldu_addrgen_operand_target_fu_o_tmp__V;
    logic sldu_addrgen_operand_valid_o_tmp__V;
    logic sldu_result_gnt_o_tmp__V;
    logic sldu_result_final_gnt_o_tmp__V;
    logic ldu_result_gnt_o_tmp__V;
    logic ldu_result_final_gnt_o_tmp__V;
    logic [63:0] [3:0] mask_operand_o_tmp__V;
    logic [3:0]  mask_operand_valid_o_tmp__V;
    logic masku_result_gnt_o_tmp__V;
    logic masku_result_final_gnt_o_tmp__V;
    logic mask_ready_o_tmp__V;

    time last_combo_seqnum__V;
    time last_seq_seqnum__V;
    
    // Hash value to make sure this file and the corresponding
    // library agree
    localparam int protectlib_hash__V = 32'd1910922565;

    initial begin
        lane_e_protectlib_check_hash(protectlib_hash__V);
        handle__V = lane_e_protectlib_create($sformatf("%m"));
    end
    
    // Combinatorialy evaluate changes to inputs
    always @(*) begin
        last_combo_seqnum__V = lane_e_protectlib_combo_update(
            handle__V
            , scan_enable_i
            , scan_data_i
            , scan_data_o_combo__V
            , lane_id_i
            , vxsat_flag_o_combo__V
            , alu_vxrm_i
            , fflags_ex_o_combo__V
            , fflags_ex_valid_o_combo__V
            , pe_req_i
            , pe_req_valid_i
            , pe_vinsn_running_i
            , pe_req_ready_o_combo__V
            , pe_resp_o_combo__V
            , alu_vinsn_done_o_combo__V
            , mfpu_vinsn_done_o_combo__V
            , global_hazard_table_i
            , stu_operand_o_combo__V
            , stu_operand_valid_o_combo__V
            , stu_operand_ready_i
            , sldu_addrgen_operand_o_combo__V
            , sldu_addrgen_operand_target_fu_o_combo__V
            , sldu_addrgen_operand_valid_o_combo__V
            , sldu_operand_ready_i
            , sldu_mux_sel_i
            , addrgen_operand_ready_i
            , sldu_result_req_i
            , sldu_result_id_i
            , sldu_result_addr_i
            , sldu_result_wdata_i
            , sldu_result_be_i
            , sldu_result_gnt_o_combo__V
            , sldu_red_valid_i
            , sldu_result_final_gnt_o_combo__V
            , ldu_result_req_i
            , ldu_result_id_i
            , ldu_result_addr_i
            , ldu_result_wdata_i
            , ldu_result_be_i
            , ldu_result_gnt_o_combo__V
            , ldu_result_final_gnt_o_combo__V
            , mask_operand_o_combo__V
            , mask_operand_valid_o_combo__V
            , mask_operand_ready_i
            , masku_result_req_i
            , masku_result_id_i
            , masku_result_addr_i
            , masku_result_wdata_i
            , masku_result_be_i
            , masku_result_gnt_o_combo__V
            , masku_result_final_gnt_o_combo__V
            , mask_i
            , mask_valid_i
            , mask_ready_o_combo__V
        );
    end
    
    // Evaluate clock edges
    always @(posedge clk_i or negedge clk_i, posedge rst_ni or negedge rst_ni) begin
        lane_e_protectlib_combo_ignore(
            handle__V
            , scan_enable_i
            , scan_data_i
            , lane_id_i
            , alu_vxrm_i
            , pe_req_i
            , pe_req_valid_i
            , pe_vinsn_running_i
            , global_hazard_table_i
            , stu_operand_ready_i
            , sldu_operand_ready_i
            , sldu_mux_sel_i
            , addrgen_operand_ready_i
            , sldu_result_req_i
            , sldu_result_id_i
            , sldu_result_addr_i
            , sldu_result_wdata_i
            , sldu_result_be_i
            , sldu_red_valid_i
            , ldu_result_req_i
            , ldu_result_id_i
            , ldu_result_addr_i
            , ldu_result_wdata_i
            , ldu_result_be_i
            , mask_operand_ready_i
            , masku_result_req_i
            , masku_result_id_i
            , masku_result_addr_i
            , masku_result_wdata_i
            , masku_result_be_i
            , mask_i
            , mask_valid_i
        );
        last_seq_seqnum__V <= lane_e_protectlib_seq_update(
            handle__V
            , clk_i
            , rst_ni
            , scan_data_o_tmp__V
            , vxsat_flag_o_tmp__V
            , fflags_ex_o_tmp__V
            , fflags_ex_valid_o_tmp__V
            , pe_req_ready_o_tmp__V
            , pe_resp_o_tmp__V
            , alu_vinsn_done_o_tmp__V
            , mfpu_vinsn_done_o_tmp__V
            , stu_operand_o_tmp__V
            , stu_operand_valid_o_tmp__V
            , sldu_addrgen_operand_o_tmp__V
            , sldu_addrgen_operand_target_fu_o_tmp__V
            , sldu_addrgen_operand_valid_o_tmp__V
            , sldu_result_gnt_o_tmp__V
            , sldu_result_final_gnt_o_tmp__V
            , ldu_result_gnt_o_tmp__V
            , ldu_result_final_gnt_o_tmp__V
            , mask_operand_o_tmp__V
            , mask_operand_valid_o_tmp__V
            , masku_result_gnt_o_tmp__V
            , masku_result_final_gnt_o_tmp__V
            , mask_ready_o_tmp__V
        );
        scan_data_o_seq__V <= scan_data_o_tmp__V;
        vxsat_flag_o_seq__V <= vxsat_flag_o_tmp__V;
        fflags_ex_o_seq__V <= fflags_ex_o_tmp__V;
        fflags_ex_valid_o_seq__V <= fflags_ex_valid_o_tmp__V;
        pe_req_ready_o_seq__V <= pe_req_ready_o_tmp__V;
        pe_resp_o_seq__V <= pe_resp_o_tmp__V;
        alu_vinsn_done_o_seq__V <= alu_vinsn_done_o_tmp__V;
        mfpu_vinsn_done_o_seq__V <= mfpu_vinsn_done_o_tmp__V;
        stu_operand_o_seq__V <= stu_operand_o_tmp__V;
        stu_operand_valid_o_seq__V <= stu_operand_valid_o_tmp__V;
        sldu_addrgen_operand_o_seq__V <= sldu_addrgen_operand_o_tmp__V;
        sldu_addrgen_operand_target_fu_o_seq__V <= sldu_addrgen_operand_target_fu_o_tmp__V;
        sldu_addrgen_operand_valid_o_seq__V <= sldu_addrgen_operand_valid_o_tmp__V;
        sldu_result_gnt_o_seq__V <= sldu_result_gnt_o_tmp__V;
        sldu_result_final_gnt_o_seq__V <= sldu_result_final_gnt_o_tmp__V;
        ldu_result_gnt_o_seq__V <= ldu_result_gnt_o_tmp__V;
        ldu_result_final_gnt_o_seq__V <= ldu_result_final_gnt_o_tmp__V;
        mask_operand_o_seq__V <= mask_operand_o_tmp__V;
        mask_operand_valid_o_seq__V <= mask_operand_valid_o_tmp__V;
        masku_result_gnt_o_seq__V <= masku_result_gnt_o_tmp__V;
        masku_result_final_gnt_o_seq__V <= masku_result_final_gnt_o_tmp__V;
        mask_ready_o_seq__V <= mask_ready_o_tmp__V;
    end
    
    // Select between combinatorial and sequential results
    always @(*) begin
        if (last_seq_seqnum__V > last_combo_seqnum__V) begin
            scan_data_o = scan_data_o_seq__V;
            vxsat_flag_o = vxsat_flag_o_seq__V;
            fflags_ex_o = fflags_ex_o_seq__V;
            fflags_ex_valid_o = fflags_ex_valid_o_seq__V;
            pe_req_ready_o = pe_req_ready_o_seq__V;
            pe_resp_o = pe_resp_o_seq__V;
            alu_vinsn_done_o = alu_vinsn_done_o_seq__V;
            mfpu_vinsn_done_o = mfpu_vinsn_done_o_seq__V;
            stu_operand_o = stu_operand_o_seq__V;
            stu_operand_valid_o = stu_operand_valid_o_seq__V;
            sldu_addrgen_operand_o = sldu_addrgen_operand_o_seq__V;
            sldu_addrgen_operand_target_fu_o = sldu_addrgen_operand_target_fu_o_seq__V;
            sldu_addrgen_operand_valid_o = sldu_addrgen_operand_valid_o_seq__V;
            sldu_result_gnt_o = sldu_result_gnt_o_seq__V;
            sldu_result_final_gnt_o = sldu_result_final_gnt_o_seq__V;
            ldu_result_gnt_o = ldu_result_gnt_o_seq__V;
            ldu_result_final_gnt_o = ldu_result_final_gnt_o_seq__V;
            mask_operand_o = mask_operand_o_seq__V;
            mask_operand_valid_o = mask_operand_valid_o_seq__V;
            masku_result_gnt_o = masku_result_gnt_o_seq__V;
            masku_result_final_gnt_o = masku_result_final_gnt_o_seq__V;
            mask_ready_o = mask_ready_o_seq__V;
        end
        else begin
            scan_data_o = scan_data_o_combo__V;
            vxsat_flag_o = vxsat_flag_o_combo__V;
            fflags_ex_o = fflags_ex_o_combo__V;
            fflags_ex_valid_o = fflags_ex_valid_o_combo__V;
            pe_req_ready_o = pe_req_ready_o_combo__V;
            pe_resp_o = pe_resp_o_combo__V;
            alu_vinsn_done_o = alu_vinsn_done_o_combo__V;
            mfpu_vinsn_done_o = mfpu_vinsn_done_o_combo__V;
            stu_operand_o = stu_operand_o_combo__V;
            stu_operand_valid_o = stu_operand_valid_o_combo__V;
            sldu_addrgen_operand_o = sldu_addrgen_operand_o_combo__V;
            sldu_addrgen_operand_target_fu_o = sldu_addrgen_operand_target_fu_o_combo__V;
            sldu_addrgen_operand_valid_o = sldu_addrgen_operand_valid_o_combo__V;
            sldu_result_gnt_o = sldu_result_gnt_o_combo__V;
            sldu_result_final_gnt_o = sldu_result_final_gnt_o_combo__V;
            ldu_result_gnt_o = ldu_result_gnt_o_combo__V;
            ldu_result_final_gnt_o = ldu_result_final_gnt_o_combo__V;
            mask_operand_o = mask_operand_o_combo__V;
            mask_operand_valid_o = mask_operand_valid_o_combo__V;
            masku_result_gnt_o = masku_result_gnt_o_combo__V;
            masku_result_final_gnt_o = masku_result_final_gnt_o_combo__V;
            mask_ready_o = mask_ready_o_combo__V;
        end
    end
    
    final lane_e_protectlib_final(handle__V);
    
endmodule
