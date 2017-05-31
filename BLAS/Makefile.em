
BLAS_BYTECODE=$(wildcard SRC/*.bc)
F2C_BYTECODE=$(wildcard ../F2CLIB/libf2c/*.bc)

bytecode:
	( cd SRC; $(MAKE) -f Makefile.em all )

all: bytecode
	emcc $(F2C_BYTECODE) $(BLAS_BYTECODE) -o blas.js -s EXPORTED_FUNCTIONS='["_f2c_saxpy"]'
