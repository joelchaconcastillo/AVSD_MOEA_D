function [obj, x] = BT2(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x', 28, nobj);
%obj2
