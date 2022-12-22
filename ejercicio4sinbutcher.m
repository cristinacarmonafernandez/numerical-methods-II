%PRACTICAS EJERICIO 4
clear all;
clc;
more off;
function y=f(t,x)
  y=-x+sin(2*t);
endfunction
%
a=0; b=10; mu=5; ah=[2 1 0.5 0.25];

figure(1); clf; hold on;
for i=1:length(ah)
  h=ah(i);
  N=round((b-a)/h);
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    xn=x(n);
    K1=f(t(n),xn);
    K2=f(t(n)+h,x(n));
    K2=fsolve(@(u)f(t(n)+h,xn+h*u)-u,K2);
    x(n+1)=xn+h/2*(K2+K1);
    t(n+1)=t(n)+h;
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
%
hold off;












