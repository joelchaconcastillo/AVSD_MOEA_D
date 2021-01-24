function [rngMin, rngMax, isInt, algoCall] = initializeBT8(nVar)
rngMin = zeros(1,nVar);
rngMax = ones(1,nVar).* 1;
isInt = zeros(1,nVar);
algoCall = 'BT8';
