%EJERCICIO 5 RELACION 2 DERIVACION
clear all;
more off;
clc;
disp("EJERCICIO 5");
%APARTADO A
disp("APARTADO A");
function pesos=pesosderiv(k,a,nodos)
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
    %
  b=zeros(n,1);
  b(k+1,1)=factorial(k);
  for i=k+1:n-1
    b(i+1,1)=factorial(i)*a^(i-k)/factorial(i-k);
  endfor
  %
  pesos=M\b;
endfunction
%
function y=f(x)
  y=x.*exp(-x.^2/2)+sin(x.*pi);  
endfunction
%
function y=f1(x)
  y=(1-x.^2)*exp(-x.^2/2)+cos(x.*pi)*pi;
endfunction
%
disp("Apartado a) Calculamos primero los pesos de la formula dada en i) para a = 0.5 con h =0.1, 0.01, 0.001\n");
a=0.5; k=1; h=[0.1 0.01 0.001];
for i=1:3
  hi=h(i);
  nodos=[a-2*hi,a,a+2*hi,a+3*hi];
  pesos=pesosderiv(k,a,nodos);
  printf('Los pesos para h=%2.3f \n' ,h(i));
  disp(pesos);
endfor
%


disp("Apartado a) Aproximamos a continuación el valor f'(0.5)\n");
a=0.5;k=1;
h=[0.1 0.01 0.001];
disp(" h      aproximacion        error");
disp("=======================================");
for i=1:3
  hi=h(i);
  nodos=[a-2*hi,a,a+2*hi,a+3*hi];
  pesos=pesosderiv(k,a,nodos);
  aprox=pesos'*f(nodos)';
  error=f1(a)-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor
disp("LA MEJOR SOLUCION ES CON H=0.001");
%
disp("");
disp("APARTADO B");
disp("");
function pesos=pesosint(a,c,nodos) %a,c limites de integracion a=inferior,c=superior
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
  %matriz de vandermonde
  b=zeros(n,1);
  for i=1:n-1
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
disp("Apartado b) Calculamos primero los pesos de la formula dada en ii)\n");
h=[2 1 0.5]; a=-1;c=3;
exacto=quad(@g,a,c);
for i=1:3
  hi=h(i);
  nodos=[3-2*hi,3-hi,3];
  pesos=pesosint(a,c,nodos);
  printf('Los pesos para h=%2.3f \n' ,h(i));
  disp(pesos);
endfor
%

disp(" h      aproximacion        error");
disp("=======================================");

for i=1:3
  hi=h(i);
  nodos=[3-2*hi,3-hi,3];
  pesos=pesosint(a,c,nodos);
  aprox=pesos'*g(nodos)';
  error=exacto-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor
%

disp("LA MEJOR SOLUCION ES CON H=1");







