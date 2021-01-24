function [obj, x] = UF8(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',24,nobj);
%obj2
