clear all
clc

disp('creating array of 64-bit timestamps')
% by changing Ranges or datetime we can have different timestamp arrays
timeRangeHours = 5;
timeRangeMonths = 3;
time = datetime('2021-01-01 10:30:15') + hours(1:timeRangeHours); %calmonths(1:timeRangeMonths) can also be used
timestampsArray = posixtime(time);
timestampsArray = uint64(timestampsArray);
disp('original array:')
timestampsArray
numberOfTimestamps = length(timestampsArray);


disp('creating array of bytes')
%vector<uint8_t> compress(vector<uint64_t> original);
compressedArray = Compress(timestampsArray);
disp('array of bytes:')
compressedArray


disp('getting the original array from array of bytes')
%vector<uint64_t> decompress(vector<uint8_t> compressed);
decompressedArray = Decompress(compressedArray);
disp('array after decompression')
decompressedArray

%% comparing original array and array we got after compression and decompression
failFlag = false;
for i=1:1:numberOfTimestamps
    if (timestampsArray(i) ~= decompressedArray(i))
       disp('decompression failed! Array is not the same like the original')
       failFlag = true;
       break;
    end
end
if (failFlag == false)
   disp('job done! Decompressed array matches original!') 
end