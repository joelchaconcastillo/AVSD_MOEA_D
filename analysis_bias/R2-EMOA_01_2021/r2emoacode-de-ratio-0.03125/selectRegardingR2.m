function bestSet = selectRegardingR2(points, utilityPoints, ...
    nPointsToBeDeleted, oneshot, hypeFitness)
    %% returns the size(points,2) - nPointsToBeDeleted solutions
    %% in points that result
    %%   in the best R2 indicator value for
    %%   1) a oneshot scenario (if onshot=1)
    %%   2) a greedy scenario (if oneshot=0)
    %%
    %%   with or without 
    %%   a) the new fitness assignment I_R2^k (if hypeFitness=1) or
    %%   b) the standard fitness assignment I_R2^1 (if hypeFitness=0)

    [nPoints nObj] = size(points);
    
    if oneshot
        rankedInds = getPointRankingRegardingR2Loss(points, ...
                    utilityPoints, ...
                    1:nPoints, 1:nPointsToBeDeleted, ...
                    nPointsToBeDeleted, hypeFitness);
        bestSet = setdiff(1:nPoints, rankedInds);
    else
        nDeleted = 0;
        elementsInCurrentFront = 1:nPoints;
        elementsToBeRemoved = [];
        while nDeleted < nPointsToBeDeleted
            worstInd = getPointRankingRegardingR2Loss(points, ...
                            utilityPoints, ...
                            elementsInCurrentFront, 1, ...
                            nPointsToBeDeleted-nDeleted, hypeFitness);
            elementsToBeRemoved = [elementsToBeRemoved, elementsInCurrentFront(worstInd)];
            elementsInCurrentFront(worstInd) = [];
            nDeleted = nDeleted + 1;
        end;
        bestSet = setdiff(1:nPoints, elementsToBeRemoved);
    end;
end




%-------------------------------------------------------------------------
function ranking = getPointRankingRegardingR2Loss(points, utilityPoints, elementsToBeEvaluated, besti, nLevels, hypeFitness)
    % returns the ranking of solutions in points(elementsToBeEvaluated, :)
    % wrt the R2 indicator loss if nLevels solutions are to be deleted
    % simultaneously;
    % ideal and weights give the corresponding parameters of the R2
    % indicator while besti contains indices such that only the besti-th
    % worst solutions are returned;
    
    [n d] = size(points(elementsToBeEvaluated, :));
    
    if (n == 2)
        TchebA = sum(utilityPoints(elementsToBeEvaluated(1), :));
        TchebB = sum(utilityPoints(elementsToBeEvaluated(2), :));
        if (TchebA > TchebB)
            ranking = [1; 2];      
            ranking = ranking(besti);
        else
            ranking = [2; 1];
            ranking = ranking(besti);
        end
    else
        R2losses = zeros(n,1); % stores the expected losses of all points
        S = sort(utilityPoints(elementsToBeEvaluated,:));
        
        if hypeFitness && (nLevels > 1)
            for i=1:nLevels
                P = S(i+1,:);
                % compute loss for each point
                P = P(ones(n,1),:) - utilityPoints(elementsToBeEvaluated,:);
                % replace all negative values by 0 (negative loss = no loss)
                P = (P + abs(P))/2;
                
                Q = S(i,:);
                % compute loss for each point
                Q = Q(ones(n,1),:) - utilityPoints(elementsToBeEvaluated,:);
                % replace all negative values by 0 (negative loss = no loss)
                Q = (Q + abs(Q))/2;
                
                % multiply the loss with the probability to really loose it:
                %prob = getCorrectProba(n,i,nLevels);
                prob = getHypEProba(n,i,nLevels);
                P = (P-Q).*prob./i;
                % compute overall loss by summing over all weights:
                R2losses = R2losses + sum(P, 2);
                %if prob < 1e-15
                %    %disp('no exact calculcation anymore of fitness...')
                %    break; % for numerical reasons
                %end
            end
        else
            P = S(2,:);
            % compute loss for each point
            P = P(ones(n,1),:) - utilityPoints(elementsToBeEvaluated,:);
            % replace all negative values by 0 (negative loss = no loss,
            % we do not care about the actual but only the relative values)
            P = P + abs(P);
            % compute overall loss by summing over all weights:
            R2losses = R2losses + sum(P, 2);
        end

        % find points with worst losses
        [sorted,IX] = sort(R2losses);
        ranking = IX(besti);
        
    end
    
end

%-------------------------------------------------------------------------
function prob = getHypEProba(n,i,nLevels)
	% computes the probability alpha_i from Johannes' and Ecki's HypE paper
    
    prob_z = 1;
    prob_n = 1;
    for j=1:i-1
        prob_z = prob_z*(nLevels-j);
        prob_n = prob_n*(n-j);
    end
    prob = prob_z/prob_n;
end


%-------------------------------------------------------------------------
function prob = getCorrectProba(n,i,nLevels)
	% computes the probability
    %    nchoosek(n-i-1, nLevels-i)/nchoosek(n-1, nLevels-1);
    % more directly in order to prevent numerical errors
    
    if n<55
        prob = nchoosek(n-i-1, nLevels-i)/nchoosek(n-1, nLevels-1);
    else
        prob2_z = (n-nLevels);
        for j=1:i-1
            prob2_z = prob2_z*(nLevels-j);
        end
        prob2_n = 1;
        for j=1:i
             prob2_n = prob2_n*(n-j);
        end
        prob = prob2_z/prob2_n;
    end;
end