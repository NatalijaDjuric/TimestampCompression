% vector<uint64_t> decompress(vector<uint8_t> compressed);

function [originalVec] = Decompress(compressedVec)
    % uint8 to binary
    for i = 1:1:length(compressedVec)
       compressedBitVec(:, i) = ToBinary(compressedVec(i), 8); 
    end
    
    colNum = length(compressedVec);
    firstByteCol = 1;
    lastByteCol = 1;
    count = 1;
    while(lastByteCol <= colNum)
        while (compressedBitVec(1, lastByteCol) == 1) % || (compressedBitVec(1, lastByteCol) == 1 && compressedBitVec(1, lastByteCol + 1) == 0))
            lastByteCol = lastByteCol + 1;
        end
        
        if lastByteCol == firstByteCol
           compressedBitVec(1, lastByteCol) = 0; % da ne kvari racunanje
           diffVec(count) = ToDecimal(compressedBitVec(:, lastByteCol));
           %compressedBitVec(:, lastByteCol)
           count = count + 1;
        else
            x = 0;
            fullBitVec = [];
            for k = lastByteCol:(-1):firstByteCol
                for n = 1:1:7
                    fullBitVec(7*x + n) = compressedBitVec(n + 1, k);
                end
                x = x + 1;
            end
            diffVec(count) = ToDecimal(fullBitVec);
            %fullBitVec
            count = count + 1;
        end

        lastByteCol = lastByteCol + 1;
        firstByteCol = lastByteCol;
    end
    
    
    
    
    %originalVec = compressedBitVec;
    originalVec = RestoreOriginal(diffVec);
    originalVec = uint64(originalVec);
end

