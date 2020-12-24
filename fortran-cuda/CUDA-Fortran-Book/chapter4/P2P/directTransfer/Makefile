
#
#     Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.
# 

FC=nvfortran
ifeq ($(OPT),)
OPT=-O2
endif
F90FLAGS = $(OPT)
OBJ=o
EXE=out
UNAME := $(shell uname -a)
ifeq ($(findstring CYGWIN_NT, $(UNAME)), CYGWIN_NT)
   OBJ=obj
   EXE=exe
endif

# Uncomment the CUDAFLAGS line if you have hardware requirements that require
# a specific compute capability
#CUDAFLAGS = -Mcuda=cc12

all: build run verify

build: directTransfer.cuf
	$(FC) $(CUDAFLAGS) $(F90FLAGS) -o directTransfer.$(EXE) $<

run: directTransfer.$(EXE)
	$(RUN) ./directTransfer.$(EXE)

verify:

clean:
	@echo 'Cleaning up...'
	@rm -rf directTransfer.$(EXE) *.$(OBJ) *.mod *.dwf *.pdb prof


