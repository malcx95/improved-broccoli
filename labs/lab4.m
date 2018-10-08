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

t0 = 0;
tn = 500;
v0 = [-1, 0.001, 0]';

% for h = [1.5, 2.1, 2.24, 2.26]
%     x0 = 0;
%     y0 = 1;
%     xn = 5;
%     figure(round(h * 200));
%     myeuler(@odefun, t0, tn, v0, h);
%     title(sprintf('runges h = %f', h));
% end


tn = 100;
h = 0.2;
% full = myeuler(@odefun, t0, tn, v0, h);
% while 1
%      h = h/2;
%      y0 = 1;
% 
%      half = myeuler(@odefun, t0, tn, v0, h);
% 
%      if (abs(full - half) < 10^-5)
%          disp(h);
%          disp(half);
%          disp(full - half);
%          break
%      end
% 
%      full = half;
%      disp('din mamma')
% end



for Ki = [0.01, 0.05, 0.125]
    %figure(Ki * 10000)
    [t,v] = ode23(@odefun, [t0, tn], v0);
    disp(t(end))

    disp(v(end))
end

