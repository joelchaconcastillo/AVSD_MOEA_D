function [obj, x] = WFG8(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);
%
obj = benchmark(x',15,nobj);
%obj2
