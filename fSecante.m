%Ejercicio 6 relacion 1

function [x2,msg] = fSecante(f,x0,x1,e)
  %resultado por defecto
  f0=f(x0);
  f1=f(x1);
  x2=0;msg='Error desconocido';
  %comprobacion-1: la tolerancia es correcta
 if e<=0
   msg='ERROR: la tolerancia no es positiva';
   return;
 endif
 %metodo de la secante
n=0; %contador
x2=x1;
x1=x0; f1=f0;
do
  n++;
  x0=x1; f0=f1;
  x1=x2; f1=f(x1);
  x2=(x0*f1-x1*f0)/(f1-f0);
until abs(x2-x1)/abs(x2)<=e;
%salida con exito

msg=['en ' inst2str(n) ' iteraciones']; %para introducir el valor numerico de n en mitad de una frase inst2str(n) 

endfunction