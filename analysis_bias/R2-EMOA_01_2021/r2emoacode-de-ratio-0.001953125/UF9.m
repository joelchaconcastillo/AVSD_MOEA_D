function [obj, x] = UF9(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',25,nobj);
%obj2
