function [nVar, rngMin, rngMax, isInt, nObj, algoCall] = initializeZDT3()
nVar = 30;
rngMin = zeros(1,nVar);
rngMax = ones(1,nVar);
isInt = zeros(1,nVar);
nObj = 2;
algoCall = 'ZDT3';