# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Makefile for building Verilated archive or executable
#
# Execute this makefile from the object directory:
#    make -f Vlane_e.mk

default: liblane_e

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
VM_PREFIX = Vlane_e
# Module prefix (from --prefix)
VM_MODPREFIX = Vlane_e
# User CFLAGS (from -CFLAGS on Verilator command line)
VM_USER_CFLAGS = \
	-fPIC \
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

# User .cpp directories (from .cpp's on Verilator command line)
VM_USER_DIR = \


### Default rules...
# Include list of all generated classes
include Vlane_e_classes.mk
# Include global rules
include $(VERILATOR_ROOT)/include/verilated.mk

### Library rules from --protect-lib
liblane_e.a: $(VK_OBJS) $(VK_GLOBAL_OBJS) lane_e.o $(VM_HIER_LIBS)

liblane_e: liblane_e.a

# Verilated -*- Makefile -*-
