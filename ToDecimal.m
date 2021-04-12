% converting vector of bits into decimal number
function [dec] = ToDecimal(inputVec)
    dec = 0;
    binaryLength = length(inputVec);
    for i = 0:1:(binaryLength - 1)
        if(inputVec(i + 1) == 1)
            dec = dec + 2^(binaryLength - 1 - i);
        end
    end
end