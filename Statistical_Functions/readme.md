# Getting Started with debugging
The examples of building fortran code without knowing exactly what the dependancies are, requires the installation `fortdepends` library. 
https://pypi.org/project/fortdepend/

Fortdepends scans the files to determines the order of compilation.

Once `fortdepends` is installed, you have to change the path inside the makefile MAKEDEPEND=`path to fortdepends installation`
After that you'll be able to run make build and it should create all the modules and binaries correctly. 
