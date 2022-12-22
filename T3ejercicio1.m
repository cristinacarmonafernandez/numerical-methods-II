%EJERCICIO 1 RELACION PVI
clear all;
clc;
more off;

function y=f(t,x)
  y=-9.8-0.002*x.*abs(x)/0.11;
endfunction
%
h=0.2;
function z=Euler(t,x,h)
  z=x+h*f(t,x);
endfunction
%
function z=EulerImpl(t,x,h,tol)
  x0=x+h*f(t,x);
  x1=x0;
  do
    x0=x1;
    x1=x+h*f(t+h,x0);
  until abs(x0-x1)<=tol
  z=x1;
 endfunction
% 
function z=Heun(t,x,h,s)
  v=f(t,x);
  z=x+h/2*(v+f(t+h,x+h*v));
endfunction
%
function z=RK2(t,x,h)
   K1=f(t,x);
   K2=f(t+2/5*h,x+h*2/5*K1);
   z=x+h*(-1/4*K1 +5/4*K2);
 endfunction
 %
 t0 = 0; mu=30; tol=10^-6; x0 = [mu mu mu mu]; s0 = [0 0 0 0];
disp(" n   t    v-Euler--s    v-EuImpl-s    v-Heun---s    v-RK2----s");
disp("-- ----  ------------  ------------  ------------  ------------");
printf('%2d %4.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',0,t0,[x0;s0]);
t1=t0; x1=x0;s1=s0;n=0;
do
  n++; t0=t1; x0=x1; s0=s1;
  x1(1)=Euler(t0,x0(1),h); 
  x1(2) = EulerImpl(t0,x0(2),h,tol);
  x1(3) = Heun(t0,x0(3),h);
  x1(4) = RK2(t0,x0(4),h);
  s1 = s0 + h/2*(x0+x1);
  t1 = t0 + h;
  printf('%2d %4.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',n,t1,[x1;s1]); 
until max(s1)<=0  
 %
disp("-- ----  ------------  ------------  ------------  ------------");
disp("Altura máxima estimada: 25.2m, 28.7m, 27.1m, 27.2m)");
disp("Tiempo estimado de impacto: 4.5s, 4.9s, 4.7s, 4.7s");
disp("Velocidad estimada de impacto: 18m/s (los 4 coinciden)");
disp("El método que predice más tarde el impacto es Euler Implícito."); 
  
  
  
  