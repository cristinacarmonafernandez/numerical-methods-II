%EJERCICIO 1 INTEGRACION
clear all;
clc;
more off;
disp ("EJERCICIO 1");
function y=f(x)
  y=exp(-x.^2/3);
endfunction
%
a=0;b=4;
exacto=quad(@f,a,b);


%APARTADO A
disp("");
disp("APARTADO A: Formula abierta con cuatro nodos\n");
[nodos pesos]=integralNC(a,b,5,false,false);%como es abierta de 4 nodos n=4+1
%ahora veamos si es precisa
aprox=pesos*f(nodos)';
error=exacto-aprox;
printf('Aproximacion: %10.14f\t y el error es: %10.2e\n',aprox,error);


%APARTADO B
disp("");
disp("APARTADO B: Formula cerrada con cuatro nodos\n");
[nodos pesos]=integralNC(a,b,3,true,true);%como es abierta de 4 nodos n=4+1
%ahora veamos si es precisa
aprox=pesos*f(nodos)';
error=exacto-aprox;
printf('Aproximacion: %10.14f\t y el error es: %10.2e\n',aprox,error);


%APARTADO C
disp("");
disp("APARTADO C: Formula abierta por la izquierda, cerrada por la derecha y con cuatro nodos\n");
[nodos pesos]=integralNC(a,b,4,false,true);%como es abierta de 4 nodos n=4+1
%ahora veamos si es precisa
aprox=pesos*f(nodos)';
error=exacto-aprox;
printf('Aproximacion: %10.14f\t y el error es: %10.2e\n',aprox,error);


%APARTADO D
disp("");
disp("APARTADO D: Formula cerrada por la izquierda, abierta por la derecha y con cuatro nodos\n");
[nodos pesos]=integralNC(a,b,4,true,false);%como es abierta de 4 nodos n=4+1
%ahora veamos si es precisa
aprox=pesos*f(nodos)';
error=exacto-aprox;
printf('Aproximacion: %10.14f\t y el error es: %10.2e\n',aprox,error);


disp("LA QUE TIENE MENOR ERROR ES LA ABIERTA CON 4 NODOS");




