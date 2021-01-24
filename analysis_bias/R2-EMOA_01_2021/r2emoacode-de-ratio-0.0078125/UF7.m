function [obj, x] = UF7(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',23,nobj);
%obj2
