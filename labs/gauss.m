function [l,u]=gauss(a)
% gauss                       ; Gausselimination utan pivotering      
%
% Anrop: [L,U] = gauss(A)
%
% ( anrop gauss(A) ger enbart L-matrisen )
% Funktionen utför Gausselimination utan pivotering.
m=size(a);
if m(2)~=m(1),'ej kvadratisk matris ',return,end
n=m(1);
l=eye(n,n);
u=a;
for k=1:n-1
  for i=k+1:n
    l(i,k)=u(i,k)/u(k,k);
    for j=k+1:n 
      u(i,j)=u(i,j)-l(i,k)*u(k,j);
    end
  end
end
u=triu(u);