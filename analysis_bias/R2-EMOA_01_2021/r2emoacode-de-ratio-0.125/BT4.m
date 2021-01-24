function [obj, x] = BT4(x)
nobj = x(end);
x=x(1:end-1);
obj = benchmark(x',30,nobj);
%obj2
