function [rngMin, rngMax, isInt, algoCall] = initializeWFG1(nVar)
%nVar = 6;
rngMin = zeros(1,nVar);

rngMax = ones(1,nVar).* 1;

for d = 1:nVar
        rngMax(d) = 2*d;
end

isInt = zeros(1,nVar);
algoCall = 'WFG8';
