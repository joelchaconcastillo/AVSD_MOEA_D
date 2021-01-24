function [obj, x] = DTZL2(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',2,nobj);
%obj2
