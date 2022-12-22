%EJERCICIO 3 RELACION DERIVADAS
clear all;
clc;
more off;
function pesos=pesosderiv(k,a,nodos)
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
  %matriz de vandermonde
  b=zeros(n,1);
  b(k+1,1)=factorial(k);
  for i=k+1:n-1
    b(i+1,1)=factorial(i)*a^(i-k)/factorial(i-k);
  endfor
  %matriz de terminos independientes
  pesos=M\b;
endfunction
%
function y=f(x);
  y=x.*exp(-x./3);
endfunction
%
disp("EJRCICIO 3: \n");
a=0;
k=3;
nodos=[-0.5 0.5 1 1.5 2];
disp("solucion para f^(3)(0) con nodos "); disp(nodos);
%Aplicamos la funcion que hemos calculado de pesos
pesos=pesosderiv(k,a,nodos);
disp("La matriz de pesos que buscamos es: ");
disp(pesos);
%Hallamos la aproximacion multiplicando los pesos con la funcion evaluada en los nodos
aprox=pesos'*f(nodos)';
printf('La aproximacion que tenemos sera: %10.8f',aprox);