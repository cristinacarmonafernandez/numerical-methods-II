%EJERCICIO 4 PVI
clc;
clear all;
more off;

function y=f(t,x)
  y=-x+sin(2*t);
endfunction
%
a = 0; b = 10; mu = 5; ah = [2 1 0.5 0.25];

Butcher_a=[0 0;0 1];
Butcher_b=[1/2 1/2];
Butcher_c=[0 1];

disp("Arreglo de Butcher");
disp([Butcher_c' Butcher_a; 0 Butcher_b]);

figure(1); clf; hold on;
for i=1:length(ah)
  h=ah(i);
  N=(b-a)/h; %número de intervalos
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    [t(n+1) x(n+1)] = ButcherSemi(Butcher_a,Butcher_b,Butcher_c,t(n),x(n),h);
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
hold off;


%{
clear all;
clc;
more off;

function y=f(t,x)
  y=-x+sin(2*t);
endfunction
%

figure(1); clf; hold on;
a=0;b=10; ah=[2 1 0.5 0.25];mu=5;
for i=1:length(ah)
  h=ah(i);
  N=(b-a)/h;
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    K1=f(t(n),x(n));
    K2=f(t(n)+h,x(n));
    x(n+1)=x(n)+h/2*(K1+K2);
    t(n+1)=t(n)+h;
  endfor
  plot(t,x,[';h=' num2str(h) ';']); 
endfor
%
hold off;

}%