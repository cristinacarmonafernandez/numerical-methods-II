%Ejercicio 5 relacion 1
%importante: la primera palabra conmputable de este archivo debe ser function

%Este archivo contiene la definicion de la funion fnewtonraphson
%Requiere como entrada la funcion f y su derivada f1, la semillla x0 y una tolerancioa relativa e.
%devuelve la raiz aprx y un mensaje con el numero de iteracion o de error
function [x1,n,msg] = fNewtonRaphson(f,f1,x0,e,nmax) %ponemos la funcion, su derivada, el valor inicial, e es la tolerancia, nmax es el numero maximo de iteraciones
  
 %resultado por defecto
 x1=0;msg='Error desconocido';
 %comprobacion-1: la tolerancia es correcta
 if e<=0
   msg='ERROR: la tolerancia no es positiva';
   return;
 endif
 %comprobacion-2:el loimite de iteracion es correcto
 if nmax<2 || nmax>1000
   msg='error: el limite de iteraciones no es correcto';
   return;
 endif

 %metodo de NR
 n=0;
 x1=x0;
 do
   n++;
   x0=x1;
   x1=x0 - f(x0)/f1(x0);
   a=abs(x0-x1)/abs(x1);
 until a<=e || n>=nmax;
 
 %mensaje de salida
  if n<=nmax;
   msg=['correcto'];
 endif
 
 if n>=nmax;
   msg=['se ha excedido el límite'];
 endif
 
 endfunction