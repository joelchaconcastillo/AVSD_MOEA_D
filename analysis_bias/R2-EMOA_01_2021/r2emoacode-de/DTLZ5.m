function [obj, x] = DTZL5(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',5,nobj);
%obj2
