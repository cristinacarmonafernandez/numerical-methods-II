%EJERCICIO 3 PVI
clc;
clear all;
more off;
function y = F(t,x)
  y=[ x(1) - t*x(2) + sin(3*t);2*x(1) + x(2) - t];
endfunction
%

x0 = [5;-1]; a=0; b=3;
h = 0.25; N = (b-a)/h;

%EULER
t=a*ones(1,N+1);
x=[x0(1,1)*ones(1,N+1);x0(2,1)*ones(1,N+1)];
for n=1:N
  x(:,n+1) = x(:,n) + h*F(t(n),x(:,n));
  t(n+1)=t(n)+h;
endfor

figure(1); clf; hold on;
plot(x(1,:),x(2,:),'b;Euler;');

% Runge-Kutta 4

t=a*ones(1,N+1);
x=[x0(1,1)*ones(1,N+1);x0(2,1)*ones(1,N+1)];
for n=1:N
  K1 = F(t(n),x(:,n));
  K2 = F(t(n)+h/2,x(:,n)+h/2*K1);
  K3 = F(t(n)+h/2,x(:,n)+h/2*K2);
  K4 = F(t(n)+h,x(:,n)+h*K3);
  x(:,n+1) = x(:,n) + h/6*(K1+2*K2+2*K3+K4);
  t(n+1)=t(n)+h;
endfor
%

plot(x(1,:),x(2,:),'r;RK4;');
hold off;
disp("Los métodos divergen, sospechamos que Euler divergen");