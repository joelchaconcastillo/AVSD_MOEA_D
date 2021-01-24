function [obj, x] = BT6(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',32,nobj);
%obj2
