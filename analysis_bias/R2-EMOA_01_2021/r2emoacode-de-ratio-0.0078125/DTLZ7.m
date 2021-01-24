function [obj, x] = DTZL7(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

obj = benchmark(x',7,nobj);
%obj2
