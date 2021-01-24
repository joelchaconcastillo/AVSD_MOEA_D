function [obj, x] = BT7(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',33,nobj);
%obj2
