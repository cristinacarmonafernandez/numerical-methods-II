%EJERCICIO 10 RELACION 1 (ESTUDIO)

clear all;
clc;
more off;

function y=f(x)
  y=exp(x/4) + cos(pi*x)-1.5;
endfunction
%
function [m n]=Triseccion(a,b,e)
  n=0;
  a0=a; b0=b;
  do
    n++;
    m1=(2*a+b)/3;
    m2=(a+2*b)/3;
    if f(a)*f(m1)<0
      b=m1;
      else 
        if(f(m1)*f(m2))<0
        a=m1;b=m2;
        else 
        a=m2;
        endif
      endif
    until b-a<=2*e;
  m=(a+b)/2;
endfunction
%
disp("APARTADO B");

figure(1);
x=linspace(0,6,100);
y=f(x);
plot(x,y,[0 6],[0 0],'k');
disp("Los intervalos son [0,1],[1,2],[2,3],[3,4]");

disp("APARTADO C");
disp("");

%intervalo [0,1]
[m n]=Triseccion(0,1,10^-8);
printf('La aproximacion de la raiz para el intervalo [0,1] es %18.14f y se han necesitado %2d iteraciones\n',m,n);
%intervalo [1,2]
[m n]=Triseccion(1,2,10^-8);
printf('La aproximacion de la raiz para el intervalo [1,2] es %18.14f y se han necesitado %2d iteraciones\n',m,n);
%intervalo [2,3]
[m n]=Triseccion(2,3,10^-8);
printf('La aproximacion de la raiz para el intervalo [2,3] es %18.14f y se han necesitado %2d iteraciones\n',m,n);
%intervalo [3,4]
[m n]=Triseccion(3,4,10^-8);
printf('La aproximacion de la raiz para el intervalo [3,4] es %18.14f y se han necesitado %2d iteraciones\n',m,n);

