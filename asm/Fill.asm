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

@R0 // KBD state: -1 key is pressed, 0 otherwise
M = 0
@R1 // Screen color: -1 black, 0 white
M = 0

(KBD_LOOP)
  @KBD
  D=M
  // key is pressed, go to label
  @SET_PRESSED
  D;JGT 

  @R0
  M=0
  @COMPARE
  0;JMP

  (SET_PRESSED)
    @R0
    M=-1
  (COMPARE)
    @R0
    D=M
    @R1
    D=D-M
    @KBD_LOOP
    D;JEQ


// Fill the screen
// 8192 bytes starting at @SCREEN address
// set counter to zero
@i
M=0

(FILL_LOOP)
  // calculate the current screen word address in memory
  @SCREEN
  D=A
  @i
  D=D+M

  // set all bits of current screen address word to value of R0 
  @R3 // current address
  M=D
  @R0
  D=M
  @R3
  A=M
  M=D

  // increment counter
  @i
  MD=M+1
  @8192
  D=A-D

  @FILL_LOOP
  D;JGT

// update current screen state in R1
@R0
D=M
@R1
M=D

// return to keyboard loop
@KBD_LOOP
0;JMP
