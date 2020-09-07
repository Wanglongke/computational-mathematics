# The homework of numerical solution of partial differential equation
## 1. Adams-Bashorth and Adams-Moulton
To solve the partial differential equation with **Adams-Bashorth method**, **Adams-Moulton method** and **Euler method**, and compare them: 
```
du/dt = -5u
u(0) = 1
```
Here is the comparison.
<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image1_1.PNG" width="33%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image1_2.PNG" width="33%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image1_3.PNG" width="33%"/>
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
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image2_1.PNG" width="49%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image2_2.PNG" width="49%"/>
</p>

## 3. Cnetral Difference
The partial differential equation is:
```
-u'' + xu = (x-1)exp(x)
u(0)=1, u(1)=exp(1)
```
The solution is:
```
u(x) = exp(x)
```
Here is the numerical solution and error.
<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image3_1.PNG" width="49%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image3_2.PNG" width="49%"/>
</p>

## 4. Five Point Difference method
The partial differential equation is:
```
delta u = 2(pi^2)exp(pi(x+y))(sin(pi*x)cos(pi*y)+cos(pi*x)sin(pi*y))
u = 0, when x=0 || x=1 || y=0 || y=1
0<=x<=1,
0<=y<=1
```
The solution is:
```
u(x,y) = exp(pi(x+y))sin(pi*x)sin(pi*y)
```
After converting the partial differential equation to system of equations, I compare the **conjugate gradient** method, **sor** iteration method, **Peaceman-Rachford** iteration method with **p** parameters or **one** parameters:
<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image4_1.png" width="49%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image4_2.png" width="49%"/>
</p>

<p float="center">
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image4_3.png" width="49%"/>
    <img src="https://github.com/Wanglongke/computational-mathematics/tree/master/numerical_solution_of_partial_differential_equation/doc/image4_4.png" width="49%"/>
</p>

In the process of each iteration method, I set the same stop threshold. So they have different iterations.
```
            conjugate gradient |    sor    |   pr_p   |   pr_one
iteration          190              192         46        154
max error        0.028613         0.028733    0.028513   0.028612
```
