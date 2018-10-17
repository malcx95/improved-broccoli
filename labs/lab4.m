% 2.2

% f = @(x, y) -5 * y + 2.5;
% 
% solution = @(x) (exp(-5 * x) + 1) / 2;
% 
% for h = [0.1, 0.45, 0.6]
%     x0 = 0;
%     y0 = 1;
%     xn = 5;
%     figure(round(h * 200));
%     hold on;
%     subplot(2,1,1);
%     plot([x0:0.01:xn], solution([x0:0.01:xn]));
%     myeuler(f, x0, xn, y0, h);
%     title(sprintf('eulers h = %f', h));
% 
%     subplot(2,1,2);
%     plot([x0:0.01:xn], solution([x0:0.01:xn]));
%     myrungekutta(f, x0, xn, y0, h);
%     title(sprintf('runges h = %f', h));
% end




% 3.2

% t0 = 0;
% tn = 500;
% v0 = [-1, 0.001, 0]';

    % for h = [1.5, 2.1, 2.24, 2.26]
    %     x0 = 0;
    %     y0 = 1;
    %     xn = 5;
    %     figure(round(h * 200));
    %     myeuler(@odefun, t0, tn, v0, h);
    %     title(sprintf('runges h = %f', h));
    % end


format short e
disp('\n');
disp('\n');
disp('\n');
disp('\n');
disp('\n');
disp('\n');
disp('\n');

t0 = 0;
v0 = [-1, 0.001, 0]';
tn = 100;
h = 0.2;
full = myeuler(@odefun, t0, tn, v0, h);
isGood = 'nono'
while 1
     h = h/2;
     y0 = 1;

     half = myeuler(@odefun, t0, tn, v0, h);

     if isGood == 'yees'
         %disp(h);
         %disp(half);
         %disp(full - half);
         break
     end
     if (abs(full(1) - half(1)) < 10^-5)
         disp(h);
         disp(half);
         disp(full - half);
         isGood = 'yees'
     end

     full = half;
     disp('din mamma')
end
% 
% 
% disp('end of din mamma')
% 
% 
% [t, y] = ode23(@(t,v) odefun(t, v), [t0, tn], v0);
% 
% y(end, :)
% 
% disp('is only gem')

% 3.5

% for Ki = [0.01, 0.05, 0.125]
%     figure(Ki * 10000)
%     [t, y] = ode23(@(t,v) odefun_ki(Ki, t, v), [t0, tn], v0);
%     title(sprintf('Ki = %f', Ki))
% 
%     disp(size(t))
% 
%     disp(size(y))
% end


% 4.1

% disp('Moscow')

% euler = []
% runge = []
% for h = [0.5, 0.25]
%     euler = [myeuler(@odefun,0,h,[-1, 0.001, 0]',h) euler]
%     disp('Soviet')
%     runge = [myrungekutta(@odefun,0,h,[-1, 0.001, 0]',h), runge]
% end
% 
% euler_error = log2(abs(euler(:, 2) - runge(:,2)) ./ abs(euler(:, 1) - runge(:,1)))



% 4.2

% euler = []
% runge = []
% for h = [0.5, 0.25]
%     euler = [myeuler(@odefun,0,h,[-1, 0.001, 0]',h) euler]
%     runge = [myrungekutta(@odefun,0,h,[-1, 0.001, 0]',h), runge]
% end
% 
% euler_error = log2(abs(euler(:, 2) - runge(:,2)) ./ abs(euler(:, 1) - runge(:,1)))
% 
% 
% format short e;
% 
% h = 2
% alpha = myeuler(@odefun,0,100,v0,h)
% h = 1
% beta = myeuler(@odefun,0,100,v0,h)
% h = 0.5
% gamma = myeuler(@odefun,0,100,v0,h)
% 
% log2((alpha(1) - beta(1)) / (beta(1) - gamma(1)))

