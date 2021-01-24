function [obj, x] = UF10(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',26,nobj);
%obj2
