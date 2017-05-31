
BLAS_BYTECODE=$(wildcard BLAS/SRC/*.bc)
F2C_BYTECODE=$(wildcard F2CLIB/libf2c/*.bc)
LAPACK_BYTECODE=$(wildcard SRC/*.bc)

f2clib:
	( cd F2CLIBS/libf2c; $(MAKE) -f Makefile.em all )

blas:
	( cd BLAS/SRC; $(MAKE) -f Makefile.em all )

lapack:
	( cd SRC; $(MAKE) -f Makefile.em all )

lapackjs: f2clib blas lapack
	emcc $(F2C_BYTECODE) $(BLAS_BYTECODE) $(LAPACK_BYTECODE) \
		-o lapack.js -s EXPORTED_FUNCTIONS='["_f2c_saxpy"]'

all: lapackjs



