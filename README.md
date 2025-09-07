## 2D Diffusion Equation Solver
---
* This code solves the 2D Diffusion Equation.
* The 2D diffusion equation is discretized using the finite volume method.
* The solutions are found using the Gauss–Seidel (iterative) method. 

## Requirements
---
* __OS__: `Linux (Ubuntu 20.04)`.
* __Compiler__: `gfortran-9`.
* __Make__ for building the project. If you don't have __Make__ get it [here](https://www.gnu.org/software/make/).

## Instructions
---
1. Clone the repository: `$ git clone https://github.com/MRLintern/Diffusion-Equation-FVM.git`
2. `$ make`
3. `$./Diffusion-Solver-FVM`

## Results
---
* Once the program has been run, a file called results.csv will be generated with the solution.
* For visualization, [ParaView](https://www.paraview.org/) is a good choice.
* If you need help, go to [ParaView Tutorial](https://www.paraview.org/Wiki/images/b/bc/ParaViewTutorial56.pdf).
* If you don't want to run the program, a results.csv file is already included.
