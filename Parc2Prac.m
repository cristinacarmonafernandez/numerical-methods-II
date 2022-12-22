%PRUEBA 2
clear all;
clc;
more off;
function y=f(t,x)
  y=x-t^2+1;
endfunction
%
function y=exacta(t)
  y=(t+1).^2-0.5*exp(t);
endfunction
%
a=1;b=3;mu=4-e/2;

%APARTADO 1
h1=0.1; a1=1; b1=2; N1=(b1-a1)/h1; %defino los valores para el primer intervalo
h2=0.05; a2=2; b2=3; N2=(b2-a2)/h2; %defino los valores para el segundo intervalo

t1=a1*ones(1,N1+1); %defino un vector que va a tener N1+N2+1 elementos 
for i=1:N1+1 %relleno los primeros N1 elementos con los datos de [1,2]
  t1(i+1)=t1(i)+h1;
endfor
%
t2=a2*ones(1,N2+1);
for i=N1+1:N2+1 %relleno el resto de elementos con los datos de [2,3]
  t2(i+1)=t2(i)+h2;
endfor
%
tt=[t1 t2];

figure(1); clf; hold on;
plot(tt,exacta(tt),'b;=exacta;');


%APARTADO 2
%Hacemos Euler implícito
%h1=0.1; a1=1; b1=2; N1=(b1-a1)/h1;

x1=mu*ones(1,N1+1);
t=a1*ones(1,N1);

for i=1:N1
  x1(i+1)=fsolve(@(u) x1(i)+h1*f(t(i)+h1,u)-u,x1(i));
  t(i+1)=t(i)+h1;
endfor
%
plot(t,x1,'r');


%Hacemos RK4 en [2,3] con h=0.05
%h2=0.05; a2=2; b2=3; N2=(b2-a2)/h2;

x=x1(end)*ones(1,N2+1);
t=a2*ones(1,N2+1);

for n=1:N2+1
  fn=f(t(n),x(n));
  K1=fn;
  K2=f(t(n)+h2/2,x(n)+h2/2*K1);
  K3=f(t(n)+h2/2,x(n)+h2/2*K2);
  K4=f(t(n)+h2,x(n)+h2*K3);
  x(n+1)=x(n) + h2/6*(K1+2*K2+2*K3+K4);
  t(n+1)=t(n)+h2;
endfor
%
x2=x;
plot(t,x,'r;=aproximada;');
hold off;

x_aprox=[x1 x2];

%APARTADO 3

%Hallamos el valor de la derivada exacta en los tiempos del apartado (1) gracias a la funcion diferencial f
function y=f1(t)
  y=(t+1).^2-0.5*exp(t)-t.^2+1;
endfunction
%
figure(2); clf; hold on;
plot(tt,f1(tt),'b;=derivada exacta;');





%APARTADO 4
%Exacta
int_exacta=quad(@exacta,1,3);

% Trapecio
n=0; a=1; b=3; tol=10^-6;
do
  n++;
  h=(b-a)/n;
  s2=sum(exacta(linspace(a+h,b-h,n-1)));
  t_exacta=h/2*(exacta(a)+exacta(b)+2*s2);
  error=t_exacta-int_exacta;
until abs(error)<tol;
%

%Trapceio aproximada
n=0; a=1; b=2;
do
  n++;
  h=(b-a)/N1;
  s2=sum(x_aprox(linspace(a+h,b-h,n-1)));
  s=h/2*(x_aprox(a)+x_aprox(b)+2*s2);
  error=s-x_aprox;
until n>=N1;
%
s1=s;
n=0; a=2;b=3;
do
  n++;
  h=(b-a)/N2;
  s2=sum(x_aprox(linspace(a+h,b-h,n-1)));
  s=h/2*(x_aprox(a)+x_aprox(b)+2*s2);
  error=s-x_aprox;
until n>=N2;
%
s2=s;
trap_aprox=s1+s2
disp("Valor exacto      Trapecio sobre aprox     Trapecio sobre exacta    T sobre aprox-exacta    T sobre exacta - error");
printf('%6.4f %6.4f %6.4f %6.4f %6.4f',int_exacta, trap_aprox ,t_exacta, abs(trap_aprox-int_exacta) , abs(int_exacta -t_exacta));






