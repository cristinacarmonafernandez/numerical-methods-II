%EJERCICIO 4 RELACIN 1 (ESTUDIO)
clear all;
clc;
more off;

function y=f(x)
  y=(exp(-x^2)+0.75*x)^3;
endfunction
%
disp("");
disp("a) Veamos el metodo de la secante");
disp("");
%
x0=-0.75; 
x1=-0.76; 
e=10^(-6); 
n=1;
%Veamos ahora el codigo de las iteraciones
x2=x1;
x1=x0;
do
  n++;
  x0=x1;
  x1=x2;
  x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
until abs(x2-x1)<e;
%
printf("En %d iteraciones se obtuvo %18.14f\n",n,x2);
%
disp("");
disp("b) Veamos el metodo de la secante combinado con Aitken");
disp("");
disp("n   secante+aitken");
disp("====================");
disp("");

x0=-0.75; 
x1=-0.76; 
printf('%18.14f\n',x0);
printf('%18.14f\n',x1);
e=10^(-6); 
%Veamos ahora el codigo de las iteraciones
x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
printf('%18.14f\n',x2);
x3=x2;
xa=x1;
x2=x0;
do
  x0=x2;
  x1=xa;
  x2=x3;
  xa=(x2*x0-x1^2)/(x2+x0-2*x1);
  printf('%18.14f\t Aitken\n',xa);
  x2=(x2*f(xa)-xa*f(x2))/(f(xa)-f(x2));
  printf('%18.14f\t Secante\n',x2);
  x3=(xa*f(x2)-x2*f(xa))/(f(xa)-f(x2));
  printf('%18.14f\t Secante\n',x3);
until abs(xa-x3)<e || abs(xa-x2)<e || abs(x2-x3)<e;
%



















