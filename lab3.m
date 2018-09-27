x = [1.0 1.5 2.0 2.5];
y = [2.6 3.4 0.7 0.8];

P3 = polyfit(x, y, 3);
X = [0:0.1:3];
Y3 = polyval(P3, X)

figure(1)
hold on;
plot(X, Y3, 'r-')
plot(x, y, 'bx')

P2 = polyfit(x, y, 2);
Y2 = polyval(P2, X)

plot(X, Y2, 'g-')
hold off;

%%
fun = @(x) 4/3*x.^4 - 4/3*x.^3 + x.^2/2;
x = 0:0.1:1;
y = fun(x);
xx = 0:0.01:1;

pn = csape(x, y, 'variational');
pr = csape(x, y, 'complete', [0, 16/3 + 4 + 1]);

subplot(2, 1, 1)
plot(xx, fnval(pn, xx), 'r-', xx, fnval(pr, xx), 'b-', x, y, 'o');
subplot(2, 1, 2)
plot(xx, abs(fnval(pn, xx)-fun(xx)), 'r-', xx, abs(fnval(pr, xx)-fun(xx)), 'b-');

%%



