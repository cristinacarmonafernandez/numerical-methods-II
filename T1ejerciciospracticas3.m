%EJERCICIO 3 RELACIÓN 1 (ESTUDIO)
clear all;
clc;
more off;

function y=g(x);
  y=-x.^3/9 - 1;
endfunction
%
function y=g3(x);
   y=x^3 + 10*x + 9;
 endfunction
 %

disp("");
disp("a) ");
disp("");

x0=-1.5; x1=g(x0); x2=g(x1);
a0=(x2*x0 - x1^2)./(x2+x0-2*x1);
s0=a0;
disp("     g1                   Aitken        Steffensen    ");
disp("=================================================================");
printf('%18.14f\n',x0);
printf('%18.14f\n',x1);
printf('%18.14f %18.14f %18.14f\n',x2,a0,s0);

for i=1:3
  for j=1:2
    x0=x1; x1=x2; x2=g(x1);
    a0=(x2*x0 -x1^2)./(x2+x0-2*x1);
    printf('%18.14f %18.14f\n',x2,a0);
  endfor
  x0=x1; x1=x2; x2=g(x1);
  a0=(x2*x0 -x1^2)./(x2+x0-2*x1);
  m1=g(s0); m2=g(m1); %valores intermedios para hacer steffenson
  s0=(m2*s0 - m1^2)./(m2+s0 -2*m1);
  printf('%18.14f %18.14f %18.14f\n',x2,a0,s0);
 endfor
 %
disp("");
disp("Parece que Aitken va mas rapido, pero Steffenson es incluso mas rapida");
disp("");
%

disp("");
disp("b) Veamos ahora las iteraciones de Steffensen");
disp("");

disp(" n      Steffensen");
disp("---------------------------------");

x0=-1.5; n=0;
x1=x0;

do
  n++;
  x0=x1;
  m1=g3(x0); m2=g3(m1); %valores intermedios para hacer steffenson
  x1=(m2*x0 - m1^2)./(m2+x0 -2*m1);
  printf('%2d %18.14f\n',n,x1);
until abs(x1-x0)<10^-8;
% 
disp("Steffensen consigue recuperar la convergencia");