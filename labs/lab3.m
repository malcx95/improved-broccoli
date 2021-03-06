%x = [1.0 1.5 2.0 2.5];
%y = [2.6 3.4 0.7 0.8];
%
%P3 = polyfit(x, y, 3);
%X = [0:0.1:3];
%Y3 = polyval(P3, X)
%
%figure(1)
%hold on;
%plot(X, Y3, 'r-')
%plot(x, y, 'bx')
%
%P2 = polyfit(x, y, 2);
%Y2 = polyval(P2, X)
%
%plot(X, Y2, 'g-')
%hold off;

%%
fun = @(x) 4/3*x.^4 - 4/3*x.^3 + x.^2/2;
x = 0:0.1:1;
y = fun(x);
xx = 0:0.01:1;

pn = csape(x, y, 'variational');
pr = csape(x, y, 'complete', [0, 7/3]);

subplot(2, 1, 1)
plot(xx, fnval(pn, xx), 'r-', xx, fnval(pr, xx), 'b-', x, y, 'o');
subplot(2, 1, 2)
plot(xx, abs(fnval(pr, xx)-fun(xx)), 'b-');
 
%%

format short e
fun = @(x) 4/3*x.^4 - 4/3*x.^3 + x.^2/2;

for h = [10 20 40 203]
    x = 0:1/h:1;
    y = fun(x);
    xx = 0:1/(2*h):1;

    pn = csape(x, y, 'variational');
    pr = csape(x, y, 'complete', [0, 16/3 + 4 + 1]);

    the_H = 1/h;
    the_Y = y;
    theerror = abs(fnval(pn,xx) - fun(xx))

    first_interval = theerror(2)
    last_interval = theerror(end - 1)

    plot(theerror, 'ro')

    fprintf('NEXT Lovely SECTION; GOD Bless\n');
end

%%

s_x_points = [
    21,
    9,
    4,
    14,
    21,
    15,
    4
];

s_y_points = [
    42,
    41,
    31,
    22,
    14,
    2,
    0
 ];

figure(5);
tt = [1:0.1:7]
pnx = csape(1:7, s_x_points, 'complete', [0 0]);
pny = csape(1:7, s_y_points, 'complete', [0 0]);
plot(fnval(pnx, tt), fnval(pny, tt));
hold on;
plot(s_x_points, s_y_points, 'r*'), axis equal, title('nej');
hold off;
