function x=bak(U,y)
% bak                         ; bakåtsubstitution    Ux=y
%
% Anrop: bak(U,y) eller x=bak(U,y)
%
% x lösning till ekvationssystemet Ux=y med bakåtsubstitution
% U är en högertriangulär n*n-matris
% U erhålles ur matlabfunktionen [L,U,P]=lu(A)
% y är en n-dimensionell kolumnvektor
% Då y erhållits genom fram(L,b) blir x lösningen till
% ekvationssystemet Ax=b.

mL=size(U);
mb=size(y);

if mL(2) ~= mL(1),'kvadratisk matris kravs',return,end
n=mL(1);
if mb(2) ~= 1, 'kolumnvektor kravs',return,end
if mb(1) ~= n, 'fel vektordimension',return,end

x=y;
x(n)=x(n)/U(n,n);
m=n;

for j=n-1:-1:1
  x(1:j)=x(1:j)-U(1:j,m)*x(m);
  x(j)=x(j)/U(j,j);
  m=j;
end

