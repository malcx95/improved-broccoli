second_deg = @(x) x^2 - 2;
second_deg_der = @(x) 2*x;

tan_f = @(x) tan(x);
tan_f_der = @(x) 1/(cos(x)^2);

sin_f = @(x) sin(x);
sin_f_der = @(x) cos(x);

third_deg = @(x) x^3 + 1;
third_deg_der = @(x) 3*x^2;

double_r = @(x) x^2;
double_r_der = @(x) 2*x;

funcs = {{second_deg, second_deg_der, 1, 2, 'x^2 - 2', sqrt(2)},...
        {tan_f, tan_f_der, -0.3, 0.5, 'tan(x)', 0},...
        {sin_f, sin_f_der, -0.4, 0.5, 'sin(x)', 0},...
        {third_deg, third_deg_der, -1.1, -0.9, 'x^3 + 1', -1},...
        {double_r, double_r_der, -0.1, 0.05, 'x^2', 0}};

for cell = funcs
    c = cell{1};
    f = c{1};
    fp = c{2};
    x0 = c{3};
    x1 = c{4};
    text = c{5};
    correct = c{6};

    [root, sols] = sekant(f, fp, x0, x1, 1e-15);

    errs = abs(sols - correct);
    range = 2:(length(errs)-1);

    ps = [];
    for i = range
        p = (log(errs(i + 1)/errs(i))/log(errs(i)/errs(i - 1)));
        ps = [ps p];
    end

    sols
    fprintf(text);
    fprintf(': Root: %d. p = ', root);
    fprintf('%d, ', ps);
    fprintf('\n\n\n\n');
end


