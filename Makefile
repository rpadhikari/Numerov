FC=gfortran -c
LD=gfortran
SRC=params.f90 io.f90 aarrays.f90 darrays.f90 morse.f90
OBJ=params.o io.o aarrays.o darrays.o morse.o
morse:
	$(FC) $(SRC)
	$(LD) $(OBJ) -o morse.x -llapack -lblas
	rm -rf *.o
clean:
	rm -rf *.o *.mod morse.x

