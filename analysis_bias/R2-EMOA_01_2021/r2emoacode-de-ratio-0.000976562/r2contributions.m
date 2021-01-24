%
% Authors: Dimo Brockhoff, INRIA Lille - Nord Europe, France
% License: GPLv2
% Last Revision: 2012-10-31

function R2contributions = r2contributions(points, ideal, weights)
% check input
[n d] = size(points);
[m dm] = size(ideal);
if (d < 1 ) || (d ~= dm)
    error('dimensions of point matrix and ideal point must be equal and > 1');
end;

ideals = repmat(ideal', 1, n);
normalizedPoints = (points' - ideals);

N = size(weights, 1);
utilityPoints = zeros(n,N);
% for each weight, compute the minimal weighted Tchebycheff values of all
% points
currWeights = zeros(d,n);
for i = 1:N
    currWeights = repmat(weights(i,:)', 1, n);
    currWeights = (weights(i,:)')(:,ones(1,n));
    utilityPoints(:,i) = (max(currWeights .* normalizedPoints))';
end;

% delete each point one by one and compute R2 indicator
R2contributions = zeros(n,1);
maxUtilityPoints = max(utilityPoints);
for i=1:n
    temp = utilityPoints;
    temp(i,:) = maxUtilityPoints;
    R2contributions(i) = sum(min(temp));
end



