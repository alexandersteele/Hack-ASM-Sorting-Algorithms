// 0 is size of array66
// Reserve 1 to 10 for calculations
// 1 is current place in pass
// 11 to 15 is array

// Initalize and get first array element
@11
D=M
@1
M=D

(compare)
@1
A=M //Load array[i]
D=M //D = array[i]
A=M+1 //Load array[i+1]
D=D-M // D = array[i] - array[i+1]

// If array[i] > array[i+1] then swap
@swap
D; JGT // Jump to swap

// If array[i] <= array[i+1] then move to next place iteration
@1
M=M+1 //Increment current pass iteration
@compare
0; JMP // Jump to compare again on next iteration

(swap)
