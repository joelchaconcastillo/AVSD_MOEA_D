function [obj, x] = BT3(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',29,nobj);
%obj2
