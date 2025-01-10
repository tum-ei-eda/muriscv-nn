// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VARA_TB_VERILATOR_H_
#define VERILATED_VARA_TB_VERILATOR_H_  // guard

#include "verilated_heavy.h"
#include "svdpi.h"

class Vara_tb_verilator__Syms;
class Vara_tb_verilator___024root;
class Vara_tb_verilator___024unit;
class Vara_tb_verilator_ara_pkg;


// This class is the main interface to the Verilated model
class Vara_tb_verilator VL_NOT_FINAL {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vara_tb_verilator__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&clk_i,0,0);
    VL_IN8(&rst_ni,0,0);
    VL_OUT64(&exit_o,63,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.
    Vara_tb_verilator___024unit* const __PVT____024unit;
    Vara_tb_verilator_ara_pkg* const __PVT__ara_pkg;

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vara_tb_verilator___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vara_tb_verilator(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vara_tb_verilator(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vara_tb_verilator();
  private:
    VL_UNCOPYABLE(Vara_tb_verilator);  ///< Copying not allowed

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
