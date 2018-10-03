
calculate_errors(@(x) exp(x), exp(1) - 1, 'exp', 0, 1);
calculate_errors(@(x) x + 1, 3/2, '1-degree', 0, 1);
calculate_errors(@(x) x.^2 + 2.*x + 1, 7/3, '2-degree', 0, 1);
calculate_errors(@(x) x.^100, 1/101, '3-degree', 0, 1);
calculate_errors(@(x) 4./(1+x.^2), pi, 'atan shit', 0, 1);
calculate_errors(@(x) sin(x).^2, pi/2, 'periodic', 0, pi);

fprintf('\n\n\n');

arithmetic_complexity(@(x) exp(x), 'exp', 0, 1);
arithmetic_complexity(@(x) x.^2 + 2.*x + 1, '2-degree', 0, 1);
arithmetic_complexity(@(x) 4./(1+x.^2), 'atan shit', 0, 1);

function difference = calculate_errors(fun, expected, msg, start_x, end_x)
    errors = [];
    for step_amount = [1:5]
        step_size = 1/(10 ^ step_amount) * (end_x - start_x);
        x = [0: step_size: end_x];
        vals = fun(x);
        integrated = trapezoid(vals, step_size);
        difference = integrated - expected;
        errors = [errors difference];
    end

    h_values = [];
    for i = [2:length(errors)]
        h_values = [h_values, errors(i - 1) / errors(i)];
    end

    fprintf('%s: ', msg);
    fprintf('%.3d, ', errors);
    fprintf('potens: %.2f, ', log10(mean(h_values)));
    fprintf("\n");
end


function nothing = arithmetic_complexity(fun, msg, start_x, end_x)
    result = [];
    step_range = (1./(2.^[20:25])).*(end_x - start_x);
    for step_size = step_range
        tic;
        for runs = [1:10]
            x = [start_x: step_size: end_x];
            vals = fun(x);
            integrated = trapezoid(vals, step_size);
        end
        result = [result toc];
    end

    % figure
    % plot([20:25], log2(result));
    % xlabel('Step size 1/2^x')
    % ylabel('log2(time)')

    h_values = [];
    for i = [2:length(result)]
        h_values = [h_values, result(i) / result(i - 1)];
    end

    fprintf('%s: ', msg);
    fprintf('%.3d, ', result);
    fprintf('potens: %.2f, ', log2(mean(h_values)));
    fprintf("\n");
end
