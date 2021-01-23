function [obj, x] = WFG7(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',14,nobj);
%obj2
