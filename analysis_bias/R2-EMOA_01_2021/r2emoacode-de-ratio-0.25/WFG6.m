function [obj, x] = WFG6(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

%
obj = benchmark(x',13,nobj);
%obj2
