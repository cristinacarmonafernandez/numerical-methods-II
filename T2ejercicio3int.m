%EJERCICIO 3 RELACION INTEGRALES
clear all;
clc;
more off;
function y=f(x)
  y=x.*exp(-x./3);
endfunction
%
tol=10^-4;
a=0;b=3;
exacto=quad(@f,a,b);
disp("Formula       n     evaluaciones         aproximacion         error");
disp("=========================================================================");
%n=numero de subintervalos


%APARTADO A
n=0;  
do 
  n++; h=(b-a)/n; s=0;%La variable s va a actuar como sumatorio
  for i=1:n
    [nodos pesos]=integralNC(a+(i-1)*h,a+i*h,4,false,false);
    s=s+pesos*f(nodos)';
  endfor
  %
until abs(exacto-s)<=tol;
printf('Newton-Cotes %2d\t\t %2d\t\t %10.14f %10.3f\n',n,n*3,s,exacto-s);

%APARTADO B
n = 0;
do
  n+=2; h =(b-a)/n;
  s4 = sum(f(linspace(a+h,b-h,n/2)));
  s2 = sum(f(linspace(a+2*h,b-2*h,n/2-1)));
  s = h/3*(f(a) + 4*s4 + 2*s2 + f(b));
until abs(s-exacto) < 1e-4;
%
printf('Simpson      %2d\t\t %2d\t\t %10.14f %10.3f\n',n,n+1,s,exacto-s);

%APARTADO C
n = 0;
do
  n++; h = (b-a)/n;
  s = h/2*(f(a) + 2*sum(f(linspace(a+h,b-h,n-1))) + f(b));
until abs(s-exacto) < 1e-4;
%
printf('Trapecio     %2d\t\t %2d\t\t %10.14f %10.3f\n',n,n+1,s,exacto-s);


