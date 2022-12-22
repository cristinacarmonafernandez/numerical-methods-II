%EJERCICIO 2 RELACION 1 (ESTUDIO)
clear all;
clc;
more off;
disp("EJERCICIO 2 RELACION 1");
%Escribimos las funciones del enunciado

function y=f(x)
  y=x.^3 + 9*x.+9;
endfunction
%

function y=g1(x)
  y=-(x.^3)/9 -1;
endfunction
%
function y=g2(x)
  y=-9./(9+x.^2);
endfunction
%
function y=g3(x)
  y=x.^3 +10*x+9;
endfunction
%
function y=g4(x)
  y=(2*x.^3 - 9)./(3*(x.^2+3));
endfunction
%

disp("");
disp("a) Veamos la grafica que nos pide este apartado ");
disp("");

figure(1);
x=-3:0.2:0;
plot([-3 0],[-3 0],x,g1(x),'k',x,g2(x),'r',x,g3(x),'g',x,g4(x),'m',x,x-f(x), 'y');%ponemos x-f(x) porque al ser un punto fijo la x pasa restando y nos queda la grafica f(x)=0, es su solucion
axis([-3 0 -3 0]);

% 
disp("");
disp("b) Veamos las 10 primeras ietraciones funcionales y su convergencia ");
disp("");

disp(" n       g1          g2            g3           g4");
disp("==============================================================");

n=0;
X0=x1=x2=x3=x4=1.5;
do
  n++;
  y1=g1(x1);
  y2=g2(x2);
  y3=g3(x3);
  y4=g4(x4);
  
  %salen ahora en pantalla los resultados
  printf("%2d %12.6f %12.6f %10.e %12.6f\n",n,y1,y2,y3,y4);
  %cambiamos el valor de xi para la siguiente iteracion
  
  x1=y1; 
  x2=y2;
  x3=y3;
  x4=y4;
until n>=10;
%
e=10^-4;
if abs(x1-y1)<=e;
  printf("La funcion g1(x) tiene convergencia\n");
else 
  printf("La funcion g1(x) no tiene convergencia\n");
endif
%
if abs(x2-y2)<=e;
  printf("La funcion g2(x) tiene convergencia\n");
else 
  printf("La funcion g2(x) no tiene convergencia\n");
endif
%
if abs(x3-y3)<=e;
  printf("La funcion g3(x) tiene convergencia\n");
else 
  printf("La funcion g3(x) no tiene convergencia\n");
endif
%
if abs(x4-y4)<=e;
  printf("La funcion g4(x) tiene convergencia\n");
else 
  printf("La funcion g4(x) no tiene convergencia\n");
endif
%

disp("");
disp("c) Veamos en los casos en los que hay convergencia cual es mas rapido");
disp("");

n1=0; x1=1.5;
n2=0; x2=1.5;
n4=0; x4=1.5;
e=10^(-7);
do
  n1++;
  y1=g1(x1);
  if abs(x1-y1)<=g1(x1)
    a=g1(x1);
  else
    a=abs(x1-y1);  
  endif
  x1=y1;
until a<e;
%
do
  n2++;
  y2=g2(x2);
  if abs(x2-y2)<=g2(x2)
    a=g2(x2);
  else
    a=abs(x2-y2);  
  endif
  x2=y2;
until a<e;
%
do
  n4++;
  y4=g4(x4);
  if abs(x4-y4)<=g4(x4)
    a=g4(x4);
  else
    a=abs(x4-y4);  
  endif
  x4=y4;
until a<e;
%
disp("El número de iteraciones necesarias para g1,g2,g4 son:");
printf("g1: %2d,  g2: %2d,  g4:%2d.\n",n1,n2,n4);
disp("========== FIN DEL EJERCICIO ==============");



