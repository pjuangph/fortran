# Getting Started with debugging
The examples of building fortran code without knowing exactly what the dependancies are, requires the installation `fortdepends` library. 
https://pypi.org/project/fortdepend/

Fortdepends scans the files to determines the order of compilation.

Once `fortdepends` is installed, you have to change the path inside the makefile MAKEDEPEND=`path to fortdepends installation`

```makefile
## Auto Generation of Dependancies 
MAKEDEPEND=~/anaconda3/envs/dev/bin/fortdepend
.PHONY: check
check:
ifeq (,$(wildcard $(DEP_FILE)))
	@echo "Creating dependancy file"
	$(shell $(MAKEDEPEND) -f $(SOURCES) -o $(DEP_FILE))	
else
	@echo "$(DEP_FILE) exists, skipping"
endif
-include $(DEP_FILE)

```
After that you'll be able to run make build and it should create all the modules and binaries correctly. 
