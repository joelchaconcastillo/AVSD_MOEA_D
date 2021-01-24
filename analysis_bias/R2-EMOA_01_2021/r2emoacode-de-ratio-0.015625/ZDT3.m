function [obj, x] = ZDT3(x)
[N n] = size(x);
obj = zeros(N, 2);

sumOfx_M = sum( x(:,2:end), 2 );
g = 1.0 + 9 ./ (n-1) .* sumOfx_M;
obj(:,1) = x(:,1);
obj(:,2) = g .* ( 1.0 - sqrt( x(:,1) ./ g ) - (x(:,1)./g).*sin(10*pi*x(:,1)) );