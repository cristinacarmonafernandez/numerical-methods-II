%Ejercicio 2 PVI
clear all;
clc;
more off;

function y=f(t,x)
  y=x-t.^2+1;
endfunction
%

function z=Euler(t,x,h)
  z=x+h*f(t,x);
endfunction
%
function z=PtoMedio(t,x,h)
  v=f(t,x);
  z=x+h*f(t+h/2,x+h/2*v);
endfunction
%
function x = s(t)
  x = (t+1).^2-0.5*exp(t);
endfunction
%
a=0;b=2;t=0; x=0.5; N=80; h=(b-a)/N ;
for i=1:N
  x=[x Euler(t(end),x(end),h)];
  t=[t t(end)+h];
endfor
%
tE=t;xE=x;sE=s(t);

t = a; x = 0.5; N = 40; h = (b-a)/N; 
for n=1:N
  x = [x PtoMedio(t(end),x(end),h)];
  t = [t t(end)+h];
endfor
tPm = t; xPm = x; sPm = s(t);

x=linspace(a,b,100);
figure(1);
plot(tE,xE,'b;Euler;',tPm,xPm,'r;PtoMedio;',x,s(x),'k;Exacta;');

figure(2);
plot(tE,xE-s(tE),'b;Euler;',tPm,xPm-s(tPm),'r;PtoMedio;');

disp("De la segunda grafica se deduce que Punto Medio es mucho mas preciso.");