%EJERCICIO 1 RELACION 2 DERIVACION PRACTICAR
clear all;
clc;
more off;
function y=f(x);
  y=x.^3;
endfunction
function y=f1(x);
  y=3*x.^2;
endfunction
%
%APARTADO A
disp(" k      h            numerador       aprox.        error");
disp("=============================================================");
n=0;
k=1;
error=0;
do
  h=10^-k;
  num=f(1+h)-f(1-h);
  aprox=num/(2*h);
  error=f1(1)-aprox;
  printf('%2d %10e %14.8f %14.8f %14.16f\n',k,h,num,aprox,error);
  k++;
  n++;
until n>=20;
%
%APARTADO B
disp("La precision del ordenador es de 16 digitos, esto hace que entre 7 y 11 los error de ");
disp("truncatura y redondeo sean de magnitud similar, a partir de k=12 el error de redondeo es ");
disp("muy superior y nulo para k>=17");
%APARTADO C
disp("el valor optimo se da en k=6");