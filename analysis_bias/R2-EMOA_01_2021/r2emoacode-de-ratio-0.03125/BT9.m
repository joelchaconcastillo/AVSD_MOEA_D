function [obj, x] = BT9(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',35,nobj);
%obj2
