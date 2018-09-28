function result = trapezoid(samples, step)
    result = samples(1);
    result = result + sum(samples(2:end-1) * 2)
    result = result + samples(end);

    result = step * result / 2;
end
