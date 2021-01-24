function [obj, x] = BT5(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',31,nobj);
%obj2
