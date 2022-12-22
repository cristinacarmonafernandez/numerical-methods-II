%PRUEBA 1 
clear all;
clc;
more off;

function y=f(x);
  y=8*x+2*x*(sin(x)+2)-exp(-x)-1;
endfunction
%
function y=g(x);
  y=(exp(-x)+1-8*x)./(2*(sin(x)+2));
endfunction
%

%APARTADO 1
disp("");
disp("a) Observamos en la grafica que al cortarse g(x) con la funcion x=y tendrá un punto fijo en ese punto, cercano a x=0.15");
disp("esto nos dice que, ademas, ese punto sera una solucion de la funcion inicial, sin embargo el metodo iterativo no sera ");
disp("convergente. Aunque se cumplen las hipotesis del teorema local de la convergencia, notamos que el punto x=0.25, no se encuentra ");
disp("lo suficientemente cerca de la solucion, es decir, no entra dentro de un intervalo de la forma (s-e,s+e),donde s es la solucion.");

figure(1);
x=linspace(-10,10,100);
y=x;
plot([0 1],[0 1],'k',x,g(x),'b');
axis([0 1 0 1]);

%convergencia
disp("Veamos tambien que este metodo diverge con la siguiente tabla:");
x0=0.25; x1=x0;
printf('%18.14f\n',x0);
n=0;
do
  x0=x1;
  n++;
  x1=g(x0);
  printf('%14.18fe\n',x0);
  
until abs(x0-x1)<10^-16 || n>=12;
%
disp("");
disp("Los valores cada vez son mayores, por tanto diverge.");
disp("");

%APARTADO 2

disp("");
disp("  aproximaciones      diferencia");
disp("==================================");
disp("");
x0=0.25;x1=g(x0);x2=g(x1);
s0=(x2*x0-x1^2)/(x2+x0-2*x1);
printf('%18.14f %18.14f\n',s0,s0);
do
  x0=s0;x1=g(x0);x2=g(x1);
  s0=(x2*x0-x1^2)/(x2+x0-2*x1);
  a=abs(s0-x0);
  printf('%18.14f %18.14f\n',s0,a);
until a<10^-4
%  

















