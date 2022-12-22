%EJERCICIO 2 RELACIÓN INTEGRALES
clear all;
clc;
more off;
function y=f(x)
  y=1./(1+x.^2);
endfunction
%
a=-5;b=5;
exacto=quad(@f,a,b);
disp(" n      aproximacion       error");
for n=[1,2,3,4,5,6,10,15,20];
  [nodos pesos]=integralNC(a,b,n,true,true);
  aprox=pesos*f(nodos)';
  error=exacto-aprox;
  printf('%2d\t %10.14f %10.3e\n',n,aprox,error);
endfor
%