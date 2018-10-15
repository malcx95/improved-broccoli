function root = sekant(f, x0, precision)

err = Inf;
x_prev = x0 - precision;
x = x0;

while err > precision

    derivative = (f(x) - f(x_prev))/(x - x_prev);
    next = x - f(x)/derivative;
    x_prev = x;
    err = abs(x - next);
    x = next;

end
root = x;

