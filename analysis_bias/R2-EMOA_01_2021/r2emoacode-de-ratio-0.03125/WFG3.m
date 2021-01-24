function [obj, x] = WFG3(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',10,nobj);
%obj2
