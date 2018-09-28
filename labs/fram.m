function y=fram(L,b)
% fram                        ; framåtsubstitution Ly=b
% 
% Anrop: fram(L,b) eller y=fram(L,b)
%
% Observera att om permutering skett, så måste b ersättas med P*b
% y är lösning till  ekvationssystemet Ly=b med framåtsubstitution
% L är en  undertriangulär n*n-matris
% L erhålles ur matlabfunktionen [L,R,P]=lu(A)
% b är en n-dimensionell kolumnvektor


mL=size(L);
mb=size(b);

if mL(2) ~= mL(1),'kvadratisk matris krävs',return,end
n=mL(1);
if mb(2) ~= 1, 'kolumnvektor krävs',return,end
if mb(1) ~= n, 'fel vektordimension',return,end


y=b;
m=1;

for j=2:n
  y(j:n)=y(j:n)-L(j:n,m)*y(m);
  m=j;
end











