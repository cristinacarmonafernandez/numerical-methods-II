%DRIVE PRUEBAS
%NC= (b-a)/3*(2f(x1)-f(x2)+2f(x3))
n = 0;
do
  n++; h = (b-a)/n; s = 0;
  for i = 1:n
    [nodos pesos] = integralNC(a+(i-1)*h,a+i*h,4,false,false);
    s = s + pesos*f(nodos)';
  endfor
until abs(s-exacto) < 1e-4;
printf(formato,"NewtonCotes",n,n*3,s,abs(s-exacto));