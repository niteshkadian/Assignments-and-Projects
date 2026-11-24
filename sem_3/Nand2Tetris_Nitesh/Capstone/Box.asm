
// =================================
// CAPSTONE PROJECT
// Roll Number: 2501410001
// Personal Number: K = 01
// Box: 32 pixels wide, 20 rows tall
// =================================

(MAIN)

// Check if any key is pressed
@KBD
D=M
@DRAW
D;JGT

// No key pressed: clear the box
@CLEAR
0;JMP


// =================================
// DRAW BLACK BOX
// =================================

(DRAW)

@16384
D=A
@32
D=D+A
@R13
M=D

@20
D=A
@R14
M=D

(DRAW_LOOP)

// First word of this row
@R13
A=M
M=-1

// Move to second word
@R13
M=M+1

// Second word of this row
@R13
A=M
M=-1

// Move to next row
@R13
M=M+1

@30
D=A
@R13
M=D+M

// Decrease remaining rows
@R14
MD=M-1

@DRAW_LOOP
D;JGT

@MAIN
0;JMP


// =================================
// CLEAR THE BOX
// =================================

(CLEAR)

@16384
D=A
@32
D=D+A
@R13
M=D

@20
D=A
@R14
M=D

(CLEAR_LOOP)

// Clear first word
@R13
A=M
M=0

@R13
M=M+1

// Clear second word
@R13
A=M
M=0

// Move to next row
@R13
M=M+1

@30
D=A
@R13
M=D+M

// Decrease remaining rows
@R14
MD=M-1

@CLEAR_LOOP
D;JGT

@MAIN
0;JMP
