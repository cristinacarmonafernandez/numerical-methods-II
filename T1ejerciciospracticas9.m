%EJERCICIO 9 RELACION 1 (ESTUDIO)
clear all;
clc;
more off;

function y=f(x)
  y=1-x+0.3*cos(x);
endfunction
%
function y=f1(x)
  y=-1-0.3*sin(x);
endfunction
%
function y=f2(x)
  y=-0.3*cos(x);
endfunction
%

function y=NR2(x0)
  a=0.5*f2(x0);
  b=f1(x0);
  c=f(x0);
  d=sqrt(b^2 - 4*a*c);
  y1=(-b-d)/(2*a);
  y2=(-b+d)/(2*a);
  if abs(y1)<abs(y2)
    y=x0+y1;
  else
    y=x0+y2;
  endif
endfunction
%

disp("");
disp("b) Veamos las iteraciones");
disp("");
disp("iteraciones          NR2");

x0=1.5;
n=0;
printf('%2d\t\t %18.14f\n',n,x0);
do
  n++;
  x1=NR2(x0);
  printf('%2d\t\t %18.14f\n',n,x1);
  x0=x1;
until n>=6
%