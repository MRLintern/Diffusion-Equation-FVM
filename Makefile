FC = gfortran
FCFLAGS = -O3

.PHONY: all clean

all: Diffusion-Solver-FVM

Diffusion-Solver-FVM: diffusion.f90
	$(FC) $(FCFLAGS) $< -o $@

clean:
	$(RM) Diffusion-Solver-FVM