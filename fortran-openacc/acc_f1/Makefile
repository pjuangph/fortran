################################################################################
#
# Copyright (c) 2017, NVIDIA Corporation.  All rights reserved.
#
# Please refer to the NVIDIA end user license agreement (EULA) associated
# with this source code for terms and conditions that govern your use of
# this software. Any use, reproduction, disclosure, or distribution of
# this software and related documentation outside the terms of the EULA
# is strictly prohibited.
#
################################################################################
hpc_install_path=/opt/nvidia/hpc_sdk/Linux_x86_64/2020/compilers/bin
FC=$(hpc_install_path)/nvfortran		#nvidia fortran compiler
OBJ=o
EXE=out
RUN=
UNAME := $(shell uname -a)
ifeq ($(findstring CYGWIN_NT, $(UNAME)), CYGWIN_NT)
   OBJ=obj
   EXE=exe
endif

FCFLAGS  = -fast
ACCFLAGS = -Minfo -acc $(OPT)

all: build run verify

build: acc_f1.f90
	$(FC) $(FCFLAGS) $(ACCFLAGS) -o acc_f1.$(EXE) $<

run: acc_f1.$(EXE)
	$(RUN) ./acc_f1.$(EXE)

verify:


clean:
	@echo 'Cleaning up...'
	@rm -rf *.$(EXE) *.$(OBJ) *.dwf *.pdb prof
