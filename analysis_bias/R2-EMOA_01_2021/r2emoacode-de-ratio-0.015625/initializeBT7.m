function [rngMin, rngMax, isInt, algoCall] = initializeBT7(nVar)

rngMin = ones(1,nVar).*-1;
rngMax = ones(1,nVar).* 1;
rngMin(1) = 0;

isInt = zeros(1,nVar);
algoCall = 'BT7';
