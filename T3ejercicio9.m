%EJERCICIO 9 PVI
clear all;
clc;
more off;
function y=f(t,x)
  y=-t*x-5*cos(t);
endfunction
%
butcher_c=[0.5;0.5];
butcher_b=[0 1];
butcher_a=[0.5 0;0.5 0];

mu=5; a=1;b=11;ah=[2 1 0.5 0.25];

figure(1); clf; hold on;
for i=1:length(ah)
  h=ah(i);
  N=round((b-a)/h);
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    [t(n+1) x(n+1)]=ButcherSemi(butcher_a,butcher_b,butcher_c,t(n),x(n),h);
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
%
hold off;