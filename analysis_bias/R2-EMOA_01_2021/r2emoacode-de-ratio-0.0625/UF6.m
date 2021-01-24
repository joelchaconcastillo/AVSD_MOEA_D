function [obj, x] = UF6(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',22,nobj);
%obj2
