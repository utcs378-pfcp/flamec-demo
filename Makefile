HOME       := /Users/dnp
#BLAS_LIB   := $(HOME)/lib/libopenblas_sandybridgep-r0.2.20.a
#FLAME_LIB  := $(HOME)/lib/libflame-x86_64-5.1.0-36.a
#FLAME_INC  := $(HOME)/include
BLAS_LIB   := $(HOME)/blis/lib/libblis.a
FLAME_LIB  := $(HOME)/libflame/lib/libflame.a
FLAME_INC  := $(HOME)/libflame/include

# indicate where the object files are to be created
CC         := gcc-9
LINKER     := $(CC)
CFLAGS     := -O3 -Wall -I$(FLAME_INC) -I$(CBLAS_INC) -m64 -msse3 
FFLAGS     := $(CFLAGS) 

# set the range of experiments to be performed
NREPEATS   := 3#       number of times each experiment is repeated.
NFIRST     := 100#     smallest size to be timed.
NLAST      := 1500#    largest size to be timed.
NINC       := 100#     increment between sizes.

LDFLAGS    := -m64 -lm -fopenmp

# indicate where the FLAME include files reside

# add files in which your implementations are coded
TEST_OBJS  := driver.o trmm_llnn_unb_var1.o 

# $%.o: %.c
#	$(CC) $(CFLAGS) -c $< -o $@
# $%.o: %.f
#	$(FC) $(FFLAGS) -c $< -o $@

driver.x: $(TEST_OBJS) 
	$(LINKER) $(TEST_OBJS) $(FLAME_LIB) $(BLAS_LIB) $(LDFLAGS) -o driver.x

test:   driver.x
	echo "$(NREPEATS) $(NFIRST) $(NLAST) $(NINC)" | ./driver.x > output.m

clean:
	rm -f *.o *~ core *.x output.m
