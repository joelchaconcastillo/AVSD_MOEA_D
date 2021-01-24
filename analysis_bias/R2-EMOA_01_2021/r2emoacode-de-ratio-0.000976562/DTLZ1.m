function [obj, x] = DTZL1(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%obj = zeros(N, 2);
%x_M_inSum = (x - 0.5).^2 - cos(20*pi*(x - 0.5));
%g = 100 * ( (n-1) + sum( x_M_inSum(:, 2:end)' )');
%obj(:,1) = (1+g) .* x(:,1) ./ 2;
%obj(:,2) = (1+g) .* (1 - x(:,1)) ./ 2;
%
obj = benchmark(x',1,nobj);
%obj2