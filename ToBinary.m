function [binaryVec] = ToBinary(inputValue, type)
% jednu decimalnu vrednost konvertujes u niz binarnih cifara

exitFlag = false;
i = 1;
if(type == 64)
    divider = uint64(2);
else
    divider = uint8(2);
end

while (exitFlag == false)
    
    reverseBinaryVec(i) = mod(inputValue, divider); % inputValue - (2 * idivide(inputValue, divider))
    inputValue = idivide(inputValue, divider);
    
    i = i + 1;
    
    if (inputValue == 0)
        %reverseBinaryVec(i) = 1;
        exitFlag = true;
    end
end

binaryLength = length(reverseBinaryVec);
% popuniti nulama do punog bajta (potrebno kod dekompresije zbog slaganja dimenzija)
if(type == 8 && binaryLength < 8)
    for m = 1:1:(8 - binaryLength)
        reverseBinaryVec(binaryLength + m) = 0;
    end
    binaryLength = 8;
end

for j = binaryLength:(-1):1
    binaryVec(binaryLength - j + 1) = reverseBinaryVec(j);
end

