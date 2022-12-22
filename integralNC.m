function [nodos pesos]=integralNC(a,b,n,izq,dcha)
  nodos=linspace(a,b,n+1); %longitud del vector nodos
  if !dcha %=>derecha abto
    nodos(n+1)=[]; %si el comando dcha es falso=>el ultimo elemento de la lista es vacio
    n--; %se reajusta el largo 
  endif
%
  if !izq %el comando izq es falso
    nodos(1)=[];%el primer elemento de la lista es vacio
    n--; %se reajusta el largo
  endif
%
%preparacion de la matriz de Vandermonde
  M=ones(n+1,n+1);
  for i=1:n
    M(i+1,:)=nodos.^i;
  endfor
%terminos independientes
  c=zeros(n+1,1);
  for i=1:n+1
    c(i,1)=(b^i-a^i)/i;
  endfor
  pesos = (M\c)'; %en forma de fila
endfunction