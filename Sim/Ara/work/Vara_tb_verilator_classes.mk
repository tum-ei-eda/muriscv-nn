# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Make include file with class lists
#
# This file lists generated Verilated files, for including in higher level makefiles.
# See Vara_tb_verilator.mk for the caller.

### Switches...
# C11 constructs required?  0/1 (always on now)
VM_C11 = 1
# Coverage output mode?  0/1 (from --coverage)
VM_COVERAGE = 0
# Parallel builds?  0/1 (from --output-split)
VM_PARALLEL_BUILDS = 1
# Threaded output mode?  0/1/N threads (from --threads)
VM_THREADS = 0
# Tracing output mode?  0/1 (from --trace/--trace-fst)
VM_TRACE = 0
# Tracing output mode in FST format?  0/1 (from --trace-fst)
VM_TRACE_FST = 0
# Tracing threaded output mode?  0/1/N threads (from --trace-thread)
VM_TRACE_THREADS = 0
# Separate FST writer thread? 0/1 (from --trace-fst with --trace-thread > 0)
VM_TRACE_FST_WRITER_THREAD = 0

### Object file lists...
# Generated module classes, fast-path, compile with highest optimization
VM_CLASSES_FAST += \
	Vara_tb_verilator \
	Vara_tb_verilator__Dpi_Export_0 \
	Vara_tb_verilator___024root \
	Vara_tb_verilator___024root__1 \
	Vara_tb_verilator___024root__2 \
	Vara_tb_verilator___024root__3 \
	Vara_tb_verilator___024root__4 \
	Vara_tb_verilator___024root__5 \
	Vara_tb_verilator___024root__6 \
	Vara_tb_verilator___024root__7 \
	Vara_tb_verilator___024root__8 \
	Vara_tb_verilator___024root__9 \
	Vara_tb_verilator___024root__10 \
	Vara_tb_verilator___024root__11 \
	Vara_tb_verilator___024root__12 \
	Vara_tb_verilator___024root__13 \
	Vara_tb_verilator___024root__14 \
	Vara_tb_verilator___024root__15 \
	Vara_tb_verilator___024root__16 \
	Vara_tb_verilator___024root__17 \
	Vara_tb_verilator___024root__18 \
	Vara_tb_verilator___024root__19 \
	Vara_tb_verilator___024root__20 \
	Vara_tb_verilator___024root__21 \
	Vara_tb_verilator___024unit \
	Vara_tb_verilator_ara_pkg \

# Generated module classes, non-fast-path, compile with low/medium optimization
VM_CLASSES_SLOW += \
	Vara_tb_verilator__ConstPool_0 \
	Vara_tb_verilator___024root__Slow \
	Vara_tb_verilator___024root__1__Slow \
	Vara_tb_verilator___024root__2__Slow \
	Vara_tb_verilator___024root__3__Slow \
	Vara_tb_verilator___024root__4__Slow \
	Vara_tb_verilator___024root__5__Slow \
	Vara_tb_verilator___024root__6__Slow \
	Vara_tb_verilator___024root__7__Slow \
	Vara_tb_verilator___024root__8__Slow \
	Vara_tb_verilator___024root__9__Slow \
	Vara_tb_verilator___024root__10__Slow \
	Vara_tb_verilator___024root__11__Slow \
	Vara_tb_verilator___024root__12__Slow \
	Vara_tb_verilator___024root__13__Slow \
	Vara_tb_verilator___024root__14__Slow \
	Vara_tb_verilator___024root__15__Slow \
	Vara_tb_verilator___024root__16__Slow \
	Vara_tb_verilator___024root__17__Slow \
	Vara_tb_verilator___024root__18__Slow \
	Vara_tb_verilator___024unit__Slow \
	Vara_tb_verilator_ara_pkg__Slow \

# Generated support classes, fast-path, compile with highest optimization
VM_SUPPORT_FAST += \
	Vara_tb_verilator__Dpi \

# Generated support classes, non-fast-path, compile with low/medium optimization
VM_SUPPORT_SLOW += \
	Vara_tb_verilator__Syms \

# Global classes, need linked once per executable, fast-path, compile with highest optimization
VM_GLOBAL_FAST += \
	verilated \
	verilated_dpi \

# Global classes, need linked once per executable, non-fast-path, compile with low/medium optimization
VM_GLOBAL_SLOW += \


# Verilated -*- Makefile -*-
