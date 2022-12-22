%EJERCICIO 8 RELACION 1 (ESTUDIO)
clear;
clc;
more off;

disp("EJERCICIO 8");
disp("");

function y=f(x)
  y=1-x+0.3*cos(x);
endfunction
%
function y = Muller(x0,x1,x2)
  f0 = f(x0); f1 = f(x1); f2 = f(x2);
  d0 = (f1-f0)/(x1-x0); d1 = (f2-f1)/(x2-x1);
  a = (d1-d0)/(x2-x0);
  b = d0-a*(x0+x1);
  c = f0 - x0*d0 + x0*x1*a;
  d = sqrt(b^2-4*a*c);
  y1 = (-b+d)/(2*a);
  y2 = (-b-d)/(2*a);
  if abs(y1-x2)<abs(y2-x2)
    y = y1;
  else
    y = y2;
  endif
endfunction
%
disp("b) Partimos de unas semillas");
disp("");
disp("iteraciones           Muller");
x0=1.3; x1=1.4; x2=1.5;
n=0;
printf('%d\t\t %18.14f\n',n,x0);
n=1;
printf('%d\t\t %18.14f\n',n,x1);
n=2;
printf('%d\t\t %18.14f\n',n,x2);
x3=x2; x2=x1; x1=x0;
do
  x0=x1;
  x1=x2;
  x2=x3;
  x3=Muller(x0,x1,x2);
  n++;
  printf('%d\t\t %18.14f\n',n,x3);
until n>=8;
  %













