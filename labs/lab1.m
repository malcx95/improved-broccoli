format long e

x = logspace(0, -16, 17);
x = x(:);
f = (1 - cos(x))./x.^2;
[x f f-1/2]
format

%%

x = linspace(3e-5, 1e-3, 2000);
y = (1 - cos(x))./x.^2;

figure(1)
subplot(2, 1, 1)
plot(x, y)
title('f(x)')
subplot(2, 1, 2)
plot(x, abs(y - 1/2))
title('|f(x) - 1/2|')

%%
x = linspace(3e-5, 1e-3, 2000);
y = x.^2/4;
