function [obj, x] = UF4(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

%
obj = benchmark(x',20,nobj);
%obj2
