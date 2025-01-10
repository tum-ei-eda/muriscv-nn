# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Makefile for building Verilated archive or executable
#
# Execute this makefile from the object directory:
#    make -f Vara_tb_verilator.mk

default: Vara_tb_verilator

### Constants...
# Perl executable (from $PERL)
PERL = perl
# Path to Verilator kit (from $VERILATOR_ROOT)
VERILATOR_ROOT = /var/tmp/ga87puy/muriscv-nn/Sim/Vicuna/verilator/install/share/verilator
# SystemC include directory with systemc.h (from $SYSTEMC_INCLUDE)
SYSTEMC_INCLUDE ?= 
# SystemC library directory with libsystemc.a (from $SYSTEMC_LIBDIR)
SYSTEMC_LIBDIR ?= 

### Switches...
# C++ code coverage  0/1 (from --prof-c)
VM_PROFC = 0
# SystemC output mode?  0/1 (from --sc)
VM_SC = 0
# Legacy or SystemC output mode?  0/1 (from --sc)
VM_SP_OR_SC = $(VM_SC)
# Deprecated
VM_PCLI = 1
# Deprecated: SystemC architecture to find link library path (from $SYSTEMC_ARCH)
VM_SC_TARGET_ARCH = linux

### Vars...
# Design prefix (from --prefix)
VM_PREFIX = Vara_tb_verilator
# Module prefix (from --prefix)
VM_MODPREFIX = Vara_tb_verilator
# User CFLAGS (from -CFLAGS on Verilator command line)
VM_USER_CFLAGS = \
	-DTOPLEVEL_NAME=ara_tb_verilator \
	-DNR_LANES=4 \
	-I/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_dpi/cpp \
	-I/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_verilator/cpp \
	-I/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_simutil_verilator/cpp \

# User LDLIBS (from -LDFLAGS on Verilator command line)
VM_USER_LDLIBS = \
	-lelf \

# User .cpp files (from .cpp's on Verilator command line)
VM_USER_CLASSES = \
	ara_tb \
	dpi_memutil \
	sv_scoped \
	verilator_memutil \
	verilated_toplevel \
	verilator_sim_ctrl \

# User .cpp directories (from .cpp's on Verilator command line)
VM_USER_DIR = \
	/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator \
	/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_dpi/cpp \
	/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_verilator/cpp \
	/var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_simutil_verilator/cpp \


### Default rules...
# Include list of all generated classes
include Vara_tb_verilator_classes.mk
# Include rules for hierarchical blocks
include Vara_tb_verilator_hier.mk
# Include global rules
include $(VERILATOR_ROOT)/include/verilated.mk

### Executable rules... (from --exe)
VPATH += $(VM_USER_DIR)

ara_tb.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/ara_tb.cpp
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<
dpi_memutil.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_dpi/cpp/dpi_memutil.cc
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<
sv_scoped.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_dpi/cpp/sv_scoped.cc
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<
verilator_memutil.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_memutil_verilator/cpp/verilator_memutil.cc
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<
verilated_toplevel.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_simutil_verilator/cpp/verilated_toplevel.cc
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<
verilator_sim_ctrl.o: /var/tmp/ga87puy/muriscv-nn/Sim/Ara/ara/hardware/tb/verilator/lowrisc_dv_verilator_simutil_verilator/cpp/verilator_sim_ctrl.cc
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<

### Link rules... (from --exe)
Vara_tb_verilator: $(VK_USER_OBJS) $(VK_GLOBAL_OBJS) $(VM_PREFIX)__ALL.a $(VM_HIER_LIBS)
	$(LINK) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) $(LIBS) $(SC_LIBS) -o $@


# Verilated -*- Makefile -*-
