# TimestampCompression

<h1>How to test it</h1>

MATLAB2019a version was used to create all files. Download all files and run TestScript.m file.

By changing some parameters in TestScript.m you can have different arrays of 64-bit timestamps. Two main functions are Compress(originalVec) and Decompress(compressedVec), and all other functions are there just to keep code easier for reading. After setting desired parameters for creating timestamp array, run the TestScript.m file and take a look at output (Command Window).


<h1>Task description</h1>

Implement two functions for compressing and decompressing arrays of 64-bit timestamps. Timestamps have the property that they are monotonically increasing, so the compression function does two things:

<strong>Diffing</strong>

Converts the array into the array of differences, so for instance [100, 104, 106, 110, 210] becomes [100, 4, 2, 4, 110].

<strong>Varint Compression</strong>

Then it takes the array of differences and applies the varint encoding, meaning a single 64-bit number is converted to a variable number of 7-bit numbers so that smaller numbers take less space. A bit is added to differentiate the last 7-bit number in the series. 

So for example the number:
0b_1110_1110_1110_1110 is broken into 3 seven-bit numbers:

0b 110_1110

0b 10_1110_1

0b 11

and then encoded as three bytes: 
0b1110_1110, 
0b1101_1101, 
0b0000_0011. Note that all but the last byte has the highest bit set to indicate there is more coming.

The decompression should restore the array back into its original form.

vector<uint8_t> compress(vector<uint64_t> original);

vector<uint64_t> decompress(vector<uint8_t> compressed);

You are free to use whatever programming language you like but don’t use any libraries. You should have a proof in the form of tests that the program works as expected. The result should be a git repository with meaningful commits and a README file explaining how to build and test it.
