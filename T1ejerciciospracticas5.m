%EJERCICIO 5 RELACION 1  (ESTUDIO)
clear all;
clc;
more off;
disp("EJERCICIO 5 RELACION 1");
function y=f(x)
  y=x.^3+9*x.+9;
endfunction
%
function y=f1(x)
  y=3*(x.^2)+9;
endfunction
%

x=linspace(-3,0,11);
disp("semilla          aproximacion       iteraciones    mensaje   ");
for x0=x 
  [xn n msg]=fNewtonRaphson(@f,@f1,x0,10^-8,100);
  printf('%18.14f %18.14f \t %d\t %s \n',x0,xn,n,msg);
endfor
%

