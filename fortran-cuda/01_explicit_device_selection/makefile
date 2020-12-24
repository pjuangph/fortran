## Makefile for compiling fortran using the nvidia hpc fortran compiler 
# ---------------------------------------------------------------------

# Define Variables
hpc_install_path=/opt/nvidia/hpc_sdk/Linux_x86_64/2020/compilers/bin # This will depend on your version
nvfortran=$(hpc_install_path)/nvfortran # Compiler Options https://docs.nvidia.com/hpc-sdk/compilers/hpc-compilers-user-guide/index.html#cmdln-options-use
FFLAGS= -g
cuda_gdb=$(hpc_install_path)/cuda-gdb # This should be set in visual studio code 
LINKER=$(nvfortran) -o

# Source files to compile
SOURCES := $(shell find $(SOURCE_DIR) -name '*.cuf')
SOURCES += $(shell find $(SOURCE_DIR) -name '*.f95') # also add f95 to the list
OBJECTS := $(SOURCES:.cuf=.o)
OBJECTS += $(SOURCES:.cuf=.o)
PROG = main.exe

## Auto Generation of Dependancies 
MAKEDEPEND=~/anaconda3/envs/dev/bin/fortdepend
DEP_FILE = my_project.dep
depend:=$(shell $(MAKEDEPEND) -f $(SOURCES) -o $(DEP_FILE))
include $(DEP_FILE)

all: $(PROG)

%.o : %.f95
	@echo "-----------------------------"
	@echo "Compiling F95 files into objects"
	@echo "-----------------------------"
	$(FC) $(FFLAGS) -c $<

%.o : %.cuf
	@echo "-----------------------------"
	@echo "Compiling cuf files into objects"
	@echo "-----------------------------"
	$(FC) $(FFLAGS) -c $<

$(PROG) : $(OBJECTS)
	@echo "-----------------------------"
	@echo "Creating the executable"
	@echo "-----------------------------"
	$(LINKER) $(PROG) $(OBJECTS) $(FCLINKS)

clean:
	rm -r *.mod *.o *.exe *.dep