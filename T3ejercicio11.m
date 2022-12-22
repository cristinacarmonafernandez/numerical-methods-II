%EJERCICIO 11 PVI
clear all;
clc;
more off;
%apartado a
function y=f(t,x)
  y=[x(2);-4*x(2)-5*x(1)];
endfunction
%
%apartado b y c
a=0;b=5;mu=[3;-5];h=0.1;
N=round((b-a)/h);
t=a*ones(1,N+1);
x=[mu(1,1)*ones(1,N+1);mu(2,1)*ones(1,N+1)];
exacta=x(1,:);

function y=sol(t)
  y=3*exp(-2*t).*cos(t)+exp(-2*t).*sin(t);
endfunction
%

for i=1:N
  xi=x(:,i);
  K1=f(t(i),xi);
  K2=f(t(i)+h/2,xi+h/2*K1);
  K3=f(t(i)+h/2,xi+h/2*K2);
  K4=f(t(i)+h,xi+h*K3);
  x(:,i+1)=xi+h/6*(K1+2*K2+2*K3+K4);
  t(i+1)=t(i)+h;
  exacta(i+1)=sol(t(i+1));
endfor
%
figure(1); clf; 
plot(t,x(1,:),';aprox;',t,exacta,';exacta;');
figure(2); clf; %diferencia
plot([a b],[0 0],'k',t,x(1,:)-exacta,';diferencias;');





