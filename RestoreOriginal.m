% restores original array from array of difference between two original
% array elements (i, i+1)
function [originalVec] = RestoreOriginal(inputVec)
    originalVec(1) = inputVec(1);
    for i = 2:1:(length(inputVec))
        original = originalVec(i-1) + inputVec(i);
        originalVec(i) = original;
    end
end
