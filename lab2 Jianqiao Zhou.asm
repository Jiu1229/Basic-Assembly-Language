/*
III. Write a program called checkEven.asm. The program checks if an 8-bit unsigned number is an
even number. Here is the algorithm:
 R18 <- 0x09
 Make all other bits, except the lest significant bit of R18 to 0 (hint: use AND)
 Compare R18 with 0x00
 Set R19 to 0x00
 If (R18 == 0x00)
R19 <- 0x01
 Done
*/







.cseg	;select current segmant as code
.org 0	;begin assembling at address 0

		
	ldi		r18,0x09	;Initialize r18 0x09
	andi	r18,0x01	;Keep the least 
	ldi 	r19,0x00
	cp		r18,r19
	breq	even
	ldi 	r19,0x00
	jmp 	down

even:
	ldi	r19,0x01

done: jmp done
	
	
