%EJERCICIO 2 RELACIÓN 2 PRACTICAS
clear all;
clc;
more off;

%APARTADO A
disp("");
disp("APARTADO A");
disp("");

a=-1;
k=2; %orden de la derivada
nodos=[-2 -1 0 1];
n=length(nodos);
M=ones(n,n); %Creamos la matriz de unos
for i=1:n-1
  M(i+1,:)=nodos.^i;
endfor
%
b=zeros(n,1);
b(k+1,1)=factorial(k);
for i=k+1:n-1
  b(i+1,1)=factorial(i)*(a)^(i-k)/factorial(i-k);
endfor
%
disp("La matriz de Vandermonde y la de terminos independientes son de la forma:\n");
disp(M);disp("           ");
disp(b);
alpha=M\b;
printf("Pesos:\n");
disp(alpha);


%APARTADO B
disp("");
disp("APARTADO B");
disp("");

a=1;
k=1; %orden de la derivada
nodos=[-1 -0.5 0 1];
n=length(nodos);
M=ones(n,n); %Creamos la matriz de unos
for i=1:n-1
  M(i+1,:)=nodos.^i;
endfor
%
b=zeros(n,1);
b(k+1,1)=factorial(k);
for i=k+1:n-1
  b(i+1,1)=factorial(i)*(a)^(i-k)/factorial(i-k);
endfor
%
disp("La matriz de Vandermonde y la de terminos independientes son de la forma:\n");
disp(M);disp("           ");
disp(b);
alpha=M\b;
printf("Pesos:\n");
disp(alpha);