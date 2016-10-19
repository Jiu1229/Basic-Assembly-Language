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
	
	
