function [obj, x] = WFG9(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',16,nobj);
%obj2
