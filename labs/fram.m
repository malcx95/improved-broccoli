function y=fram(L,b)
% fram                        ; fram�tsubstitution Ly=b
% 
% Anrop: fram(L,b) eller y=fram(L,b)
%
% Observera att om permutering skett, s� m�ste b ers�ttas med P*b
% y �r l�sning till  ekvationssystemet Ly=b med fram�tsubstitution
% L �r en  undertriangul�r n*n-matris
% L erh�lles ur matlabfunktionen [L,R,P]=lu(A)
% b �r en n-dimensionell kolumnvektor


mL=size(L);
mb=size(b);

if mL(2) ~= mL(1),'kvadratisk matris kr�vs',return,end
n=mL(1);
if mb(2) ~= 1, 'kolumnvektor kr�vs',return,end
if mb(1) ~= n, 'fel vektordimension',return,end


y=b;
m=1;

for j=2:n
  y(j:n)=y(j:n)-L(j:n,m)*y(m);
  m=j;
end











