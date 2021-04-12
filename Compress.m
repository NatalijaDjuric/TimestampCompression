% vector<uint8_t> compress(vector<uint64_t> original);

function [compressedIntVec] = Compress(originalVec)
    % diffing
    diffVec = CalculateDifference(originalVec);
    disp('array of differences:')
    diffVec
    diffVecLength = length(diffVec);
    counter = 1;
    
    for i = 1:1:diffVecLength
        binary = ToBinary(diffVec(i), 64);
        binaryLength = length(binary);
        while (binaryLength > 0)
            byte = [0, 0, 0, 0, 0, 0, 0, 0];
            
            if (binaryLength > 7)
                byte(1) = 1;
                loopEndNum = 7;
            else
                loopEndNum = binaryLength;
            end
            
            %one byte
            for k = 1:1:loopEndNum
                byte(8 - k + 1) = binary(binaryLength - k + 1);
                binary(binaryLength - k + 1) = [];
            end
            
            compressedVec(:,counter) = byte;
            compressedIntVec(:,counter) = ToDecimal(byte);
            counter = counter + 1;
            binaryLength = binaryLength - 7;
        end       
    end    
    compressedIntVec = uint8(compressedIntVec);
end

