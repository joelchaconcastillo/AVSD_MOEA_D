function [obj, x] = WFG1(x)
[N n] = size(x);
nobj = x(end);
x=x(1:end-1);

%
obj = benchmark(x',8,nobj);
%obj2
