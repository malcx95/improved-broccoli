A = [
0.8 6.6 10.2;
2 	4 	8;
-1.2 -1.9 -3.1;
];

[L, U, P] = lu(A);

LU = L*U;

%% Uppgift 2.1

b = [5 0 0.5]';
y = fram(L, P*b);
x = bak(U, y);

%% Uppgift 3.1

last_inv = 1;
last_back = 1;
for i=[1, 2, 4, 8]
    n = 1000*i
    A = rand(n);
    b = rand(n, 1);

    tic;
    x = inv(A)*b;
    time = toc;
    yolo = time / last_inv;
    last_inv = time;
    fprintf('n = %d, last_inv = %d time = %d yolo = %d\n', n, last_inv, time, yolo);
    tic;
    x = A\b;
    time = toc;
    yolo = time / last_back;
    last_back = time;
    fprintf('n = %d, last_back = %d time = %d yolo = %d\n', n, last_back, time, yolo);
end



%%

A = [10^-13 1 0 0;
    1 2 1 0;
    0 1 0 1;
    0 0 1 2]


b = [1 4 2 3]';
[L, U] = gauss(A);

y = fram(L, b)
x = bak(U, y)

xgood = A\b

%% calc ceres
ceres
A = [y.^2 x.*y x y];
b = x.^2;
c = A\b;

figure
ezplot('-1.2*y^2 + 0.45*2*x*y + 5.7*x - 0.88*y - x^2')

