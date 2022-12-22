%EJERCICIO 10 PVI
clear all;
clc;
more off;
function y=f(t,x)
  y=[-4*x(1)+3*x(2)+6;-2.4*x(1)+1.6*x(2)+3.6];
endfunction
%
function y = sol(t)
  y=[-3.375*exp(-2*t)+1.875*exp(-0.4*t)+1.5; -2.25*exp(-2*t)+2.25*exp(-0.4*t)];
endfunction
mu=[0;0]; h=0.1; a=0; b=0.5;
N=round((b-a)/h);
t=a*ones(1,N+1);
x=[mu(1,1)*ones(1,N+1);mu(2,1)*ones(1,N+1)];
exacta = x;

for i=1:N;
  xi=x(:,i);
  K1=f(t(i),xi);
  K2=f(t(i)+h/2,xi+h/2*K1);
  K3=f(t(i)+h/2,xi+h/2*K2);
  K4=f(t(i)+h,xi+h*K3);
  x(:,i+1)=xi+h/6*(K1+2*K2+2*K3+K4);
  t(i+1)=t(i)+h;
  exacta(:,i+1)=sol(t(i+1));
endfor
%

figure(1); clf; % casi se superponen
plot(x(1,:),x(2,:),';aprox;',exacta(1,:),exacta(2,:),';exacta;');

figure(2); clf; % diferencia
plot(x(1,:)-exacta(1,:),x(2,:)-exacta(2,:),';diferencia;');







