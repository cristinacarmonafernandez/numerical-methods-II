%EJERCICIO 6 PVI
clear all;
clc;
more off;
function y=f(t,x,x1)
  y=fsolve(@(u) u^2+t*x-exp(-u)-t,x1);
endfunction
%
a=0; b=10; mu=0; h=0.1;

%EULER
x1 = f(a,mu,0);
N = round((b-a)/h);
t = a*ones(1,N+1);
x = mu*ones(1,N+1);
for n=1:N
  x(n+1) = x(n) + h*f(t(n),x(n),x1);
  t(n+1) = t(n) + h;
  x1 = (x(n+1)-x(n))/h; % proxima semilla
endfor
figure(1); clf; hold on;
plot(t,x,";xn Euler;");

%TRAPECIO
x1=f(a,mu,0);
N=round((b-a)/h);
t=a*ones(1,N+1);
x=mu*ones(1,N+1);
for n=1:N
  fn=f(t(n),x(n),x1);
  x(n+1) = fsolve(@(w)x(n)+h/2*(fn+f(t(n)+h,w,x1))-w,x(n));
  t(n+1)=t(n)+h;
  x1=(x(n+1)-x(n))/h;
endfor
%
plot(t,x,";xn Trapecio;");
hold off;
