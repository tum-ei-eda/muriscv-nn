# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Make include file with class lists
#
# This file lists generated Verilated files, for including in higher level makefiles.
# See Vlane_e.mk for the caller.

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
	Vlane_e \
	Vlane_e__Dpi_Export_0 \
	Vlane_e_PSBYia \
	Vlane_e_PSBYia__1 \
	Vlane_e_PSBYia__2 \
	Vlane_e_PSBYia__3 \
	Vlane_e_PSBYia__4 \
	Vlane_e_PSBYia__5 \
	Vlane_e_PSBYia__6 \
	Vlane_e_PSBYia__7 \
	Vlane_e_PSBYia__8 \
	Vlane_e_PSBYia__9 \
	Vlane_e_PSBYia__10 \
	Vlane_e_PSBYia__11 \
	Vlane_e_PSBYia__12 \
	Vlane_e_PSBYia__13 \
	Vlane_e_PSBYia__14 \
	Vlane_e_PSBYia__15 \
	Vlane_e_PSBYia__16 \
	Vlane_e_PSBYia__17 \
	Vlane_e_PSBYia__18 \
	Vlane_e_PSBYia__19 \
	Vlane_e_PSBYia__20 \
	Vlane_e_PSBYia__21 \
	Vlane_e_PSBYia__22 \
	Vlane_e_PSBYia__23 \
	Vlane_e_PSBYia__24 \
	Vlane_e_PSBYia__25 \
	Vlane_e_PSBYia__26 \
	Vlane_e_PStmyA \
	Vlane_e_PSsPXJ \

# Generated module classes, non-fast-path, compile with low/medium optimization
VM_CLASSES_SLOW += \
	Vlane_e__ConstPool_0 \
	Vlane_e_PSBYia__Slow \
	Vlane_e_PSBYia__1__Slow \
	Vlane_e_PSBYia__2__Slow \
	Vlane_e_PSBYia__3__Slow \
	Vlane_e_PSBYia__4__Slow \
	Vlane_e_PSBYia__5__Slow \
	Vlane_e_PSBYia__6__Slow \
	Vlane_e_PSBYia__7__Slow \
	Vlane_e_PSBYia__8__Slow \
	Vlane_e_PSBYia__9__Slow \
	Vlane_e_PSBYia__10__Slow \
	Vlane_e_PSBYia__11__Slow \
	Vlane_e_PSBYia__12__Slow \
	Vlane_e_PSBYia__13__Slow \
	Vlane_e_PSBYia__14__Slow \
	Vlane_e_PSBYia__15__Slow \
	Vlane_e_PSBYia__16__Slow \
	Vlane_e_PSBYia__17__Slow \
	Vlane_e_PSBYia__18__Slow \
	Vlane_e_PSBYia__19__Slow \
	Vlane_e_PSBYia__20__Slow \
	Vlane_e_PSBYia__21__Slow \
	Vlane_e_PSBYia__22__Slow \
	Vlane_e_PSBYia__23__Slow \
	Vlane_e_PStmyA__Slow \
	Vlane_e_PSsPXJ__Slow \

# Generated support classes, fast-path, compile with highest optimization
VM_SUPPORT_FAST += \
	Vlane_e__Dpi \

# Generated support classes, non-fast-path, compile with low/medium optimization
VM_SUPPORT_SLOW += \
	Vlane_e_PSplPG \

# Global classes, need linked once per executable, fast-path, compile with highest optimization
VM_GLOBAL_FAST += \

# Global classes, need linked once per executable, non-fast-path, compile with low/medium optimization
VM_GLOBAL_SLOW += \


# Verilated -*- Makefile -*-
