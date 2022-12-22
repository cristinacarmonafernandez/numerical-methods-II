%EJERCICIO 6 RELACION 1 (ESTUDIO)
clc;
clear;
more off;

function y=f(x)
  y=x.^3+9*x.+9;
endfunction
%
semillas=linspace(-3,0,11);
disp("semilla x0              semilla x1        aproximacion    it mensaje");
disp("====================================================================== ");
for x0=semillas ;
  x1=x0+0.1;
  [x n msg]=Secantemala(@f,x0,x1,10^-8,100);
  printf('%18.14f %18.14f %18.14f %3d %s\n',x0,x1,x,n,msg);
endfor
%