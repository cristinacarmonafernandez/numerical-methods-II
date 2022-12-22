%EJERCICIO 4 RELACION INTEGRACION
clc;
more off;
clear all;

function y = f(x)
  y = x.*exp(-x./3);
endfunction
a = 0; b = 3;
exacto = quad(@f,a,b);

%
function N = tablaRomberg(a,b,M,tol)
  printf("N  Inter  Aprox     Criterio\n");
  printf("-- ---- ---------- ---------\n");
  N = 1; n = 1; h = b-a;
  R(1,1) = h/2*(f(a)+f(b));
  printf("%d %3d %12.8f\n",0,1,R(1,1));
  do
    x = linspace(a+h/2,b-h/2,n);
    R(N+1,1) = 1/2*(R(N,1)+h*sum(f(x)));
    N++; n = 2*n; h = h/2;
    for k=2:N
      coef = 4^(k-1);%no deberia estar elevado a k?
      R(N,k) = (coef*R(N,k-1)-R(N-1,k-1))/(coef-1);
    endfor
    printf("%d %3d %12.8f %9.2e\n",N,2^N,R(N,N),abs(R(N-1,N-1)-R(N,N)));
  until abs(R(N-1,N-1)-R(N,N)) < tol || N >= M;
  printf("-- ---- ---------- ---------\n");
endfunction

tablaRomberg(a,b,100,1e-5);