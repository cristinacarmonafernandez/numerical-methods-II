%EJERCICIO 1 RELACIÓN 1 (ESTUDIO)
clear all;
clc;
more off;
disp("EJERCICIO 1.-");
disp("");

function y=f(x)
  y=x.*exp(-x/3)-0.5;
endfunction
%
function y=f1(x)
  y=exp(-x/3) - (x.*exp(-x/3))*(1/3);
endfunction
%
disp("a) Para deducir graficamente que tiene dos raics reales positivas veamos la siguiente grafica: ");
figure(1);
x=0:0.1:20;
plot(x,f(x),[0 20],[0 0]);
disp("");
% 
disp("");
disp("b) Nos piden un intervalo que contenga la mayor de las soluciones, segun la grafica podemos ver que es [6,9] ");
disp("");
% 
disp("");
disp("c) Procedemos a usar el metodo de biseccion con una toleracia de 0.05");
%Método de bisección
a=6;b=9;n=0;

disp("          a           b                m            fm");
disp("======================================================================");

do  %ciclo do para hacer el criterio de biseccion
  n++;
  m=(a+b)/2;
  fa=f(a);
  fb=f(b);
  fm=f(m);
  e1=0.05;
  
  printf('%14.8f %14.8f %14.8f\t %14.8e\n',a,b,m,fm); %muestra en pantalla la tabla
  
  if (fm*fa<0)
    b=m;
  endif
  if (fm*fa>0)
    a=m;
  endif
  
until abs((b-a)/2^(n+1))<e1;
%
disp("");
disp("");
disp("d) Hacemos ahora una aproximacion con el metodo de Newton Rapchson");
disp("");
%
n=0;
a=m;
e2=10^-6;
do
  m=a;
  fm=f(m);
  f1m=f1(m);
  a=m-fm/f1m;
until abs(m-a)/abs(a) <e2
%
printf('Las dos ultimas iteraciones calculadas son %14.8f\t y %14.8f\t respectivamente\n', m,a);
%
disp("============FIN DEL EJERCICIO================");