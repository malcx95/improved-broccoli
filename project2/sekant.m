function [root, sols] = sekant(f, fp, x0, x1, precision)

err = Inf;
x_prev = x0;
x = x1;

sols = [];

while err > precision

    derivative = (f(x) - f(x_prev))/(x - x_prev);
    next = x - f(x)/derivative;
    x_prev = x;
    x = next;
    err = abs(f(x)/fp(x));

    sols = [sols x];

end
root = x;

