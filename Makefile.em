
f2clib:
	( cd F2CLIBS/libf2c; $(MAKE) -f Makefile.em all )

blas:
	( cd BLAS; $(MAKE) -f Makefile.em all )

all: f2clib blas



