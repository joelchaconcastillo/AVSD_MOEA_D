function [obj, x] = WFG2(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',9,nobj);
%obj2
