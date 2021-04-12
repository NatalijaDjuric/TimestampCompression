clear all
clc

disp('creating array of 64-bit timestamps')
time = datetime('2016-07-29 10:05:24') + calmonths(1:3);
timestampsArray = posixtime(time);
timestampsArray = uint64(timestampsArray);
disp('original array:')
timestampsArray

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