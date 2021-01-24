function [obj, x] = DTZL3(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',3,nobj);
%obj2
