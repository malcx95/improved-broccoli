function y=myeuler(f,x0,xn,y0,h)
y=y0;
x=x0;
plot(x0,y0,'.');
hold on
while x < xn-h/2  % avbryter vid rätt xn, (avrundat x kan ligga strax under xn)
    y=y+h*f(x,y);
    x=x+h;
    % plot(x,y,'*');
    % disp([x y']);
end
hold off
