## 2D Diffusion Equation Solver
This code solves the 2D Diffusion Equation using the Finite Volume Method
in a 2D Cartesian System.
https://en.wikipedia.org/wiki/Diffusion_equation
[Finite Volume Method]: (https://en.wikipedia.org/wiki/Finite_volume_method)

## Make
This project uses Make to generate the executable: https://www.gnu.org/software/make/
You may need to install this: 
1. Updates: `sudo apt-get update`
2. Install: `sudo apt-get install make`
3. `sudo apt-get install make`


## Compiler
The compiler used for this software is gfortran: (https://gcc.gnu.org/fortran/).
To install it: 
1. Updates: `sudo apt-get update`
2. Install: `sudo apt install gfortran-9`

## Instructions
1. Clone the repository: `https://github.com/MRLintern/Diffusion-Equation-FVM.git`
2. `make`
3. `./Diffusion-Solver-FVM`

## Results
Once the program has been run, a file called results.csv will be generated
with the solution. For visualization, ParaView is a good choice. 
ParaView: https://www.paraview.org/
ParaView Tutorial: https://www.paraview.org/Wiki/images/b/bc/ParaViewTutorial56.pdf
If you don't want to run the program, a results.csv file is already included.