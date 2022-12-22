%EJERCICIO 8 PVI
clear all;
clc;
clear all;
clc;
more off;

function y=f(t,x)
  y=[x(1)*(2-0.05*x(1)-x(2)/3);x(2)*(-2+0.5*x(1))];
endfunction
% 
a=0;b=25;h=0.1;mu=[2;1];
N=round((b-a)/h);
t=a*ones(1,N+1);
x=[mu(1,1)*ones(1,N+1);mu(2,1)*ones(1,N+1)];

figure(1); clf; 
for i=1:N
  xi=x(:,i);
  v=f(t(i),xi);
  x(:,i+1)=xi+h/4*(v+3*f(t(i)+2/3*h,xi+2/3*h*v));
  t(i+1)=t(i)+h;
endfor
plot(t,x(1,:),'r;=Poblacion x;',t,x(2,:),'b;=Poblacion y;');
title("Dinamica de poblaciones en funcion del tiempo");
xlabel("Tiempo t"); ylabel("Poblaciones x,y");

figure(2);clf;
plot(x(1,:),x(2,:));
title("Curva de interaccion entre especies");
xlabel("Poblacion x"); ylabel("Poblacion y");













