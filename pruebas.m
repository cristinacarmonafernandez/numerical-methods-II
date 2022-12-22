%practicar
clc;
clear all;
more off;
function y=tabla de romberg(a,b,M,tol);
  N=1; n=1; h=b-a;
  R(1,1)=h/2*(f(a)+f(b));
  do
    x=linspace(a+h,b-h,n);
    R(N+1,1)=h/2*R(N,1)+h*f(x);
    N++; n=2*n; h=h/2;
    for i=2:k;
      coef=4^(k-1);
      R(N,k)=(coef*R(N-1,k)-)/(coef-1);
    endfor
  until









