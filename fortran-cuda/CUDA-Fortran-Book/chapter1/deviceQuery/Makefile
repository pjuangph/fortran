
#
#     Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.
# 

# This will depend on your version
hpc_install_path=/opt/nvidia/hpc_sdk/Linux_x86_64/2020/compilers/bin
FC=$(hpc_install_path)/nvfortran # Compiler Options https://docs.nvidia.com/hpc-sdk/compilers/hpc-compilers-user-guide/index.

OPT=-O2
# FC=nvfortran
F90FLAGS = $(OPT)
OBJ=o
EXE=out
RUN=
UNAME := $(shell uname -a)
ifeq ($(findstring CYGWIN_NT, $(UNAME)), CYGWIN_NT)
   OBJ=obj
   EXE=exe
endif

# Uncomment the CUDAFLAGS line if you have hardware requirements that require
# a specific compute capability
#CUDAFLAGS = -Mcuda=cc12

all: build run verify

build: deviceQuery.cuf
	$(FC) $(CUDAFLAGS) $(F90FLAGS) -o deviceQuery.$(EXE) $<

run: deviceQuery.$(EXE)
	$(RUN) ./deviceQuery.$(EXE)

verify:

clean:
	@echo 'Cleaning up...'
	@rm -rf deviceQuery.$(EXE) *.$(OBJ) *.dwf *.pdb prof

