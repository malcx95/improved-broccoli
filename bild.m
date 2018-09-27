% Detta program genererar en bild ''a'', samt en 
% matris A som beskriver hur bilden försämras
% för en åskådare på långt håll.
%
% Anrop: bild
%
clf
a = [0 * [0 : 34], 6 + 0.4 * [0 : 5], ...
    8 - 0.4 * [1 : 5] , 4 + 0 * [1 : 20] ...
    4 - 0.4 * [1 : 5] , 0 * [1 : 30]]';
alpha = 0.3;
v = ones(101, 1);
A = spdiags([alpha*v (1-2*alpha)*v alpha*v], [-1 0 1], ...
    101, 101);
A = A^10;
figure(1)
plot(a, 'r')
axis([0 101 0 10])
hold on
