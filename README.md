## 2D Diffusion Equation Solver
This code solves the 2D Diffusion Equation.
The 2D diffusion equation is discretized using
the finite volume method.
The solutions are found using the Gauss–Seidel (iterative) method. 

## Operating System
Operating system used is Ubuntu 20.04.

## Make
This project uses Make to generate the executable: [Get Make from the GNU Project](https://www.gnu.org/software/make/).
You may need to install this: 
1. Updates: `$ sudo apt-get update`
2. Install: `$ sudo apt-get install make`


## Compiler
The compiler used for this software is gfortran: [Get the gcc compiler from GNU](https://gcc.gnu.org/fortran/).
To install it: 
1. Updates: `$ sudo apt-get update`
2. Install: `$ sudo apt-get install gfortran-9`

## Instructions
1. Clone the repository: `$ git clone https://github.com/MRLintern/Diffusion-Equation-FVM.git`
2. `$ make`
3. `$./Diffusion-Solver-FVM`

## Results
Once the program has been run, a file called results.csv will be generated
with the solution. For visualization, [ParaView](https://www.paraview.org/) is a good choice.
If you need help, go to [ParaView Tutorial](https://www.paraview.org/Wiki/images/b/bc/ParaViewTutorial56.pdf).
If you don't want to run the program, a results.csv file is already included.
