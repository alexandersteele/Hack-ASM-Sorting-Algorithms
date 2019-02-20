// 0 is size of array66
// Reserve 1 to 10 for calculations
// 1 is place in pass
// 2 is current pass iteration  (decrements)
// 3 is reserved for swaps
// 4 is current iteration within pass (decrements)
// 11 to 15 is array

//Initialize current place value (starting at 11)
@11
D=A
@1
M=D


// Load arraysize into both current pass and iteration with pass
@0
D=M
@2
M=D
@4
M=D


(compare)

// Check pass iteration
@2
D=M
(finish)
@finish
D; JEQ

//Check current iteration within pass
@4
M=M-1
D=M
@reset
D; JEQ

@1
A=M //Load array[i]
D=M //D = array[i]

@1
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
//Store array[i]
@1
A=M //load array[i]
D=M //D = array[i]
@3
M=D // Place array[i] at A3 for swap

//Store array[i+1]
@1
A=M+1 //load array[i+1]
D=M //store array[i+1] in D register

//Move i+1 into i
@1
A=M //load array[i]
M=D //Place i+1 into i

//Move i into i+1
@3
D=M //Load i into D
@1
A=M+1 //Load array[i+1]
M=D //Place i into i+1

// Increment current pass iteration and jump to next comparison
@1
M=M+1 //Increment current pass iteration
@compare
0; JMP // Jump to compare again on next iteration

(reset)
// Reset current iteration within pass
@0
D=M
@4
M=D

// Decrement current iteration
@2
M=M-1

// Reset A-register place
@11
D=A
@1
M=D
@compare
0; JMP
