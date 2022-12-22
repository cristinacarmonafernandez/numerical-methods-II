%EJERCICIO 7 RELACION 1 (ESTUDIO)
clear all;
clc;
more off;

disp("EJERCICIO 7");
%definimos el jacobiano y la funcion f
function F=f(x)
  F=[4*x(1)^2+x(2)^2-4; x(1)+x(2)-sin(x(1)-x(2))];
endfunction
%
function M=J(x)
  M=[8*x(1),2*x(2);1-cos(x(1)-x(2)),1+cos(x(1)-x(2))];
endfunction
%
%ya tenemos jacobiano y matriz f
x0=[0.5;0.5];
x1=x0;
tol=10^-8;
n=0;
do
  n++;
  x0=x1;
  x1=x0-J(x0)\f(x0);
until norm(x1-x0,1)<=tol;
%
printf('La solucion aproximada es x=%18.14f y=%18.14f  y hemos necesitado %3d iteraciones\n',x1,n);