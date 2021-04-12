function [diffVec] = CalculateDifference(inputVec)

diffVec(1) = inputVec(1);
for i = 2:1:(length(inputVec))
    diff = inputVec(i) - inputVec(i-1);
    diffVec(i) = diff;
end

end