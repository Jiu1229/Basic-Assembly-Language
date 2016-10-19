;	Write an assembly language program that uses a loop to write hexadecimal numbers
;	from 0 through 4F into consecutive memory locations


.cseg
.org	0

.def count =r16			;Define Reg 16 as a counter


	ldi count,0x00
	ldi r26,0x00		;Pointer X pointe to address 0x200
	ldi r27,0x02

lp:
	cpi count,0x4f		;compare 0x00 with 0x4f,if 
	breq down			;equal,jmp down;if not,
    st X+,count			;store count to X(post inc),
	inc count			;increament count
	
	
	jmp lp
	
down: jmp down



