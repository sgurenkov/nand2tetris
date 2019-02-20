// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// 8192 bytes starting at @SCREEN address

// set counter to zero
@i
M=0

(LOOP)
// calculate the current screen word address in memory
@SCREEN
D=A
@i
D=D+M

// set all bits of current screen address word to 1
A=D
M=-1

// increment counter
@i
M=M+1
D=M
@8192
D=A-D

@LOOP
D;JGT
