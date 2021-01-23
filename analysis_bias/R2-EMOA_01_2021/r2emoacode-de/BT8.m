function [obj, x] = BT8(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',34,nobj);
%obj2
