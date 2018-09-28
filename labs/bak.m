function x=bak(U,y)
% bak                         ; bak�tsubstitution    Ux=y
%
% Anrop: bak(U,y) eller x=bak(U,y)
%
% x l�sning till ekvationssystemet Ux=y med bak�tsubstitution
% U �r en h�gertriangul�r n*n-matris
% U erh�lles ur matlabfunktionen [L,U,P]=lu(A)
% y �r en n-dimensionell kolumnvektor
% D� y erh�llits genom fram(L,b) blir x l�sningen till
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

