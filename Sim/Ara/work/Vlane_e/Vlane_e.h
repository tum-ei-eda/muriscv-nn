// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VLANE_E_H_
#define VERILATED_VLANE_E_H_  // guard

#include "verilated_heavy.h"
#include "svdpi.h"

class Vlane_e_PSplPG;
class Vlane_e_PSBYia;
class Vlane_e_PStmyA;
class Vlane_e_PSsPXJ;


// This class is the main interface to the Verilated model
class Vlane_e VL_NOT_FINAL {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vlane_e_PSplPG* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&clk_i,0,0);
    VL_IN8(&rst_ni,0,0);
    VL_IN8(&scan_enable_i,0,0);
    VL_IN8(&scan_data_i,0,0);
    VL_OUT8(&scan_data_o,0,0);
    VL_IN8(&lane_id_i,1,0);
    VL_OUT8(&vxsat_flag_o,0,0);
    VL_IN8(&alu_vxrm_i,1,0);
    VL_OUT8(&fflags_ex_o,4,0);
    VL_OUT8(&fflags_ex_valid_o,0,0);
    VL_INW((&pe_req_i),260,0,9);
    VL_IN8(&pe_req_valid_i,0,0);
    VL_IN8(&pe_vinsn_running_i,7,0);
    VL_OUT8(&pe_req_ready_o,0,0);
    VL_OUT8(&pe_resp_o,7,0);
    VL_OUT8(&alu_vinsn_done_o,0,0);
    VL_OUT8(&mfpu_vinsn_done_o,0,0);
    VL_IN64(&global_hazard_table_i,63,0);
    VL_OUT64(&stu_operand_o,63,0);
    VL_OUT8(&stu_operand_valid_o,0,0);
    VL_IN8(&stu_operand_ready_i,0,0);
    VL_OUT64(&sldu_addrgen_operand_o,63,0);
    VL_OUT8(&sldu_addrgen_operand_target_fu_o,0,0);
    VL_OUT8(&sldu_addrgen_operand_valid_o,0,0);
    VL_IN8(&sldu_operand_ready_i,0,0);
    VL_IN8(&sldu_mux_sel_i,1,0);
    VL_IN8(&addrgen_operand_ready_i,0,0);
    VL_IN8(&sldu_result_req_i,0,0);
    VL_IN8(&sldu_result_id_i,2,0);
    VL_IN16(&sldu_result_addr_i,11,0);
    VL_IN64(&sldu_result_wdata_i,63,0);
    VL_IN8(&sldu_result_be_i,7,0);
    VL_OUT8(&sldu_result_gnt_o,0,0);
    VL_IN8(&sldu_red_valid_i,0,0);
    VL_OUT8(&sldu_result_final_gnt_o,0,0);
    VL_IN8(&ldu_result_req_i,0,0);
    VL_IN8(&ldu_result_id_i,2,0);
    VL_IN16(&ldu_result_addr_i,11,0);
    VL_IN64(&ldu_result_wdata_i,63,0);
    VL_IN8(&ldu_result_be_i,7,0);
    VL_OUT8(&ldu_result_gnt_o,0,0);
    VL_OUT8(&ldu_result_final_gnt_o,0,0);
    VL_OUTW((&mask_operand_o),255,0,8);
    VL_OUT8(&mask_operand_valid_o,3,0);
    VL_IN8(&mask_operand_ready_i,3,0);
    VL_IN8(&masku_result_req_i,0,0);
    VL_IN8(&masku_result_id_i,2,0);
    VL_IN16(&masku_result_addr_i,11,0);
    VL_IN64(&masku_result_wdata_i,63,0);
    VL_IN8(&masku_result_be_i,7,0);
    VL_OUT8(&masku_result_gnt_o,0,0);
    VL_OUT8(&masku_result_final_gnt_o,0,0);
    VL_IN8(&mask_i,7,0);
    VL_IN8(&mask_valid_i,0,0);
    VL_OUT8(&mask_ready_o,0,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.
    Vlane_e_PStmyA* const PS5hh5;
    Vlane_e_PSsPXJ* const PSSJPk;

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vlane_e_PSBYia* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vlane_e(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vlane_e(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vlane_e();
  private:
    VL_UNCOPYABLE(Vlane_e);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Return current simulation context for this model.
    /// Used to get to e.g. simulation time via contextp()->time()
    VerilatedContext* contextp() const;
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;

    /// DPI Export functions
    static int simutil_get_mem(int index, svBitVecVal* val);
    static void simutil_memload(const char* file);
    static int simutil_set_mem(int index, const svBitVecVal* val);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
