function [obj, x] = WFG4(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',11,nobj);
%obj2
