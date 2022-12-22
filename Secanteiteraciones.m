%FUNCION SECANTE
function [x,n,msg]=fSecante(f,x0,x1,e,nmax)
  x=0; msg="ERROR DESCONOCIDO";
  
  if e<=0
    msg="ERROR: TOLERANCIA NO POSITIVA";
    return;
  endif
  %
  if nmax<2 || nmax>1000
    msg="ERROR: NUMERO DE ITERACIONES INVALIDO";
    return;
  endif
  %
  x2=x1;
  x1=x0;
  n=0;
  do
    x0=x1;
    x1=x2;
    n++;
    x2=(x1*f(x0)-x0*f(x1))/(f(x1)-f(x0));
  until abs(x2-x1)/abs(x2)<=e || n>=nmax
  %
  if n<nmax
    msg='correcto';
    return;
  endif
  %
  if n>=nmax
    msg='incorrecto';
    return;
  endif
  %
endfunction
%