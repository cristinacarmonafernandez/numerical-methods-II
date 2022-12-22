%EJERCICIO 7 PVI
clear all;
clc;
more off;

function y=f(t,x)
  y=0.05*x*(1-log(x));
endfunction
% 
a=0;b=100;ah=[20,0.25];mu=1;

figure(1); clf; hold on;
for j=1:length(ah);
  h=ah(j);
  N=round((b-a)/h);
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for i=1:N
   v=f(t(i),x(i));
   x(i+1)=x(i)+h/4*(v+3*f(t(i)+2/3*h,x(i)+2/3*h*v));
   t(i+1)=t(i)+h;
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
%







