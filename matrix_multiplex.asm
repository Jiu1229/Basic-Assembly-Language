;This question relates to matrix manipulations similar to the AVR assembly code discussed in Class 4. 
;The following is an AVR assembly code to add two 2x2 matrices. 
;The first one is initialized with values 1,2,3,4 and the second one with 10,11,12,13. 
;They both are added and then put into the third matrix of size 2x2.

.def value = r16
.def counter = r17

.cseg
;initialize first matrix1
	ldi R26, low(matrix1); get the low order byte of the address
	ldi R27, high(matrix1); get the higher order byte of the address
	ldi value, 45; starting value of matrix1
	ldi counter, 25; number of values to initialize is matrix size 5x5
	
	
	
loop:
	st X+, value;
	inc value; next value to initialize
	dec counter; decrement count R17
	breq nextinit; initialized first matrix. Go to next one if R17=0
	rjmp loop


;initialize second matrix2	
nextinit:
	ldi R26, low(matrix2); get the low order byte of the address
	ldi r27, high(matrix2); get the higher order byte of the address
	ldi value, 10; starting value of matrix2
	ldi counter, 25; number of values to initialize
	
	
	
	
loop1:
	st X+, value;
	inc value; next value to initialize
	dec counter;
	breq add_matrix; initialized second matrix. go to add them
	rjmp loop1
	
	
add_matrix:
	
	;get the address of matrix1 into X (R27:R26) register
	ldi R26, low(matrix1); get the low order byte of the address
	ldi R27, high(matrix1); get the higher order byte of the address
	
	;get the address of matrix2 into Y (R29:R28) register
	ldi R28, low(matrix2); get the low order byte of the address
	ldi R29, high(matrix2); get the higher order byte of the address
	
	;get the address of matrix3 into Z (R31:R30) register
	ldi R30, low(matrix3); get the low order byte of the address
	ldi R31, high(matrix3); get the higher order byte of the address
	
	
	;add matrices in a loop
	ldi counter, 25; number of values to initialize
loop2:
	ld R0,X+;get the element from matrix1 into R0
	ld R1,Y+;get the element from matrix2 into R1
	add R0, R1; R0=R0+R1 add the elements
	st Z+,R0; store the result in appropriate location
	dec counter
	breq done; we are done adding matrices
	rjmp loop2; if not continue
	
	clr R0
	clr R1


sub_matrix:


	;get the address of matrix1 into X (R27:R26) register
	ldi R26, low(matrix1)
	ldi R27, high(matrix1)
	
	;get the address of matrix2 into Y (R29:R28) register
	ldi R28, low(matrix2)
	ldi R29, high(matrix2)
	
	;get the address of matrix4 into Z (R31:R30) register
	ldi R30, low(matrix4)
	ldi R31, high(matrix4)


	ldi counter, 25
loop3:
	ld R0,X+;get the element from matrix1 into R0
	ld R1,Y+;get the element from matrix2 into R1
	sbc R0, R1; R0=R0+R1 add the elements
	st Z+,R0; store the result in appropriate location
	dec counter
	breq done
	rjmp loop
	
	
done:
	rjmp done; infinite loop


.dseg
.org 0x000200 ; ATmega2560 data memory starts at 0x000200
matrix1: .byte 25; defines 25 bytes of storage for matrix1
matrix2: .byte 25; defines 25 bytes of storage for matrix2
matrix3: .byte 25; defines 25 bytes of storage for matrix3
matrix4: .byte 25; defines 25 bytes of storage for matrix4
