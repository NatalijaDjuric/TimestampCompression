function [originalVec] = RestoreOriginal(inputVec)
% na osnovu niza razlika racuna originalni niz
originalVec(1) = inputVec(1);
for i = 2:1:(length(inputVec))
    original = originalVec(i-1) + inputVec(i);
    originalVec(i) = original;
end

end
