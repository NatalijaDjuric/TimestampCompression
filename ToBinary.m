% converting decimal value into vector of bits
function [binaryVec] = ToBinary(inputValue, type)
    exitFlag = false;
    i = 1;

    if(type == 64)
        divider = uint64(2);
    else
        divider = uint8(2);
    end

    while (exitFlag == false)
        % using mod and idivide arithmetic functions
        % idivide function acts different depend on input types
        % this is the spot to pay attention on if something doesen't work as it
        % should
        reverseBinaryVec(i) = mod(inputValue, divider); % inputValue - (2 * idivide(inputValue, divider))
        inputValue = idivide(inputValue, divider);

        i = i + 1;

        if (inputValue == 0)
            exitFlag = true;
        end
    end

    binaryLength = length(reverseBinaryVec);
    % adding zeros to size of one byte (we need this because of dimensions match during decompression)
    if(type == 8 && binaryLength < 8)
        for m = 1:1:(8 - binaryLength)
            reverseBinaryVec(binaryLength + m) = 0;
        end
        binaryLength = 8;
    end


    for j = binaryLength:(-1):1
        binaryVec(binaryLength - j + 1) = reverseBinaryVec(j);
    end

end
