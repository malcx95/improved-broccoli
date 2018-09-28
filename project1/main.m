
test(@(x) exp(x), exp(1) - 1, 'exp', 0, 1);
test(@(x) x + 1, 3/2, '1-degree', 0, 1);
test(@(x) x.^2 + 2.*x + 1, 7/3, '2-degree', 0, 1);
test(@(x) x.^100, 1/101, '3-degree', 0, 1);
test(@(x) 4./(1+x.^2), pi, 'atan shit', 0, 1);
test(@(x) sin(x).^2, pi/2, 'periodic', 0, pi);

fprintf('\n\n\n');

arithmetic_complexity(@(x) exp(x), 'exp', 0, 1);
arithmetic_complexity(@(x) x.^2 + 2.*x + 1, '2-degree', 0, 1);
arithmetic_complexity(@(x) 4./(1+x.^2), 'atan shit', 0, 1);

function difference = test(fun, expected, msg, start_x, end_x)
    errors = [];
    for step_amount = [1:5]
        step_size = 1/(10 ^ step_amount) * (end_x - start_x);
        x = [0: step_size: end_x];
        vals = fun(x);
        integrated = trapezoid(vals, step_size);
        difference = integrated - expected;
        errors = [errors difference];
    end



    fprintf('%s: ', msg);
    fprintf('%.10f, ', errors);
    fprintf("\n");
end


function din_mamma = arithmetic_complexity(fun, msg, start_x, end_x)
    result = [];
    for step_amount = [1:3]
        tic;
        for runs = [1: 1000]
            step_size = 1/(10 ^ step_amount) * (end_x - start_x);
            x = [0: step_size: end_x];
            vals = fun(x);
            integrated = trapezoid(vals, step_size);
        end
        result = [result toc];
    end

    fprintf('%s: ', msg);
    fprintf('%.10f, ', result);
    fprintf("\n");
end
