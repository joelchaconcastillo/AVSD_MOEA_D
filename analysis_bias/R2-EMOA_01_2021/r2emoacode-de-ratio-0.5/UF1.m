function [obj, x] = UF1(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',17,nobj);
%obj2
