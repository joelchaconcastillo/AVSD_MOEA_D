function [obj, x] = UF3(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',19,nobj);
%obj2
