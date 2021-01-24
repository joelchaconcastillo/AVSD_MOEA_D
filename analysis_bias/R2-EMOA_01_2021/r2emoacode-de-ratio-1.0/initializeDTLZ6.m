function [rngMin, rngMax, isInt, algoCall] = initializeDTLZ1(nVar)
%nVar = 6;
rngMin = zeros(1,nVar);
rngMax = ones(1,nVar).* 1;
isInt = zeros(1,nVar);
algoCall = 'DTLZ6';
