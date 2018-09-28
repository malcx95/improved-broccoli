
test(0.1, @(x) exp(x), exp(1), "exp")
test(0.01, @(x) exp(x), exp(1), "exp")
test(0.001, @(x) exp(x), exp(1), "exp")
test(0.0001, @(x) exp(x), exp(1), "exp")

function difference = test(steps, fun, expected, msg)
    x = [0: steps: 1];
    vals = fun(x);
    fprintf('%s, step: %f:  %f\n', msg, steps, trapezoid(vals, steps) - expected);
end
