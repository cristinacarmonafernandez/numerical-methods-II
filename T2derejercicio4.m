%EJERCICIO 4 RELACION 2 DERIVACION
clear all;
clc;
more off;
disp("EJERCICI0 4");
%Usamos la función que teníamos definida en el ejrcicio 3 para hallar los pesos de las funciones
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

%APARTADO A
disp("APARTADO A");
%Escribimos la funcion 
function y=f(x)
  y=sqrt(1./(1+x.^2));
endfunction
%
%Escribimos la derivada
function y=f2(x)
  y=(2*x.^2-1)./((x^2+1)^(5/2));
endfunction
%

h=[0.1 0.01 0.001];
k=2;a=1.5;

disp(" h      aproximacion        error");
disp("=======================================");

for i=1:3
  hi=h(i);
  nodos=[a-hi,a+hi,a+2*hi,a+4*hi];
  pesos=pesosderiv(k,a,nodos);
  aprox=pesos.'*f(nodos)';
  error=f2(a)-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor
%



%APARTADO B
disp("");
disp("");
disp("APARTADO B");
disp("");
disp("");
%Usamos la función que teníamos definida en el ejercicio 3 pero modificada para hallar los pesos de las funciones
function pesos=pesosint(a,c,nodos) %a,c limites de integracion a=inferior,c=superior
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
  %matriz de vandermonde
  b=zeros(n,1);
  for i=1:n
    b(i,1)=(c.^i-a.^i)/i;
  endfor
  %matriz de terminos independientes
  pesos=M\b;
endfunction
%
function y=g(x)
  y=x.*exp(-x./2) - cos(x.*pi);
endfunction
%

h=[2 4/3 1 0.5];
a=0;c=4;
exacto=quad(@g,a,c);

disp(" h      aproximacion        error");
disp("=======================================");

for i=1:4
  hi=h(i);
  nodos=[0,hi,2*hi];
  pesos=pesosint(a,c,nodos);
  aprox=pesos'*g(nodos)';
  error=exacto-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor
%
  
  
