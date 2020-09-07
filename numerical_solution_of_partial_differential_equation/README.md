# The homework of numerical solution of partial differential equation
## 1. Adams-Bashorth and Adams-Moulton
To solve the partial differential equation with **Adams-Bashorth method**, **Adams-Moulton method** and **Euler method**, and compare them: 
```
du/dt = -5u
u(0) = 1
```
Here is the comparison.
<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image1.PNG" width="33%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image2.PNG" width="33%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/table.PNG" width="33%"/>
</p>

## 2. Runge-Kutta
To solve the partial differential equation with **Runge-Kutta** in Four setp order method:
```
du/dt = 4t(u^0.5)
u(0) = 1
```
The solution is:
```
u(t) = (1 + t^2)^2
```
Here is the numerical solution and error.
<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image3.PNG" width="49%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image4.PNG" width="49%"/>
</p>
