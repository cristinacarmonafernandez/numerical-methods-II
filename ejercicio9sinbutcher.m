%EJERCICIO 9 PVI
clear all;
clc;
more off;
function y=f(t,x)
  y=-t*x-5*cos(t);
endfunction
%

mu=5; a=1;b=11;ah=[2 1 0.5 0.25];

figure(1); clf; hold on;
for i=1:length(ah)
  h=ah(i);
  N=round((b-a)/h);
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    fn=f(t(n),x(n));
    K1=f(t(n)+h/2,x(n));
    K1=fsolve(@(u)f(t(n)+1/2*h,x(n)+1/2*h*u)-u,K1);
    K2=f(t(n)+1/2*h,x(n)+1/2*h*K1);
    x(n+1)=x(n)+h*K2;
    t(n+1)=t(n)+h;
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
%
hold off;