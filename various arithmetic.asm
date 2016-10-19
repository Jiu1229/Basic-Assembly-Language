;Assignment 2 Q7
;You are given two inputs A=10 and B=25. 
;Write a simple AVR assembly program to perform various arithmetic (subtract and add) and logic operations (AND, OR, shift left once A and shift right once B) as a sequence of operations. 
;Assume that the inputs can be directly loaded into registers using ldi instruction (define R16 to be A and R17 to be B). 
;Each of the results (e.g., A+B, A-B, A.B etc) needs to be temporarily stored and you can use other unused registers for this purpose. 
;Your goal is to minimize number of instructions. 
;The sequence of operations and the registers where the results are stored is given by: A+B (=R4), A-B (=R5), A.B(=R6), A|B(=R7), A<<1(=R8) and B>>1(=R9).

.include "m2560def.inc"

;initiliaze the stack pointer
.def A = r16
.def B = r17

;define register name accroding to function
.def r4 = resAdd
.def r5 = resSub
.def r6 = resAnd
.def r7 = resOr
.def r8 = resLsl
.def r9 = resLsr

.cseg
	;clear registers stroring result
	clr resAdd
	clr resSub
	clr resAnd
	clr resOr
	clr resLsl
	clr resLsr
	
	;initialize stack pointer which is 0x21FF
	ldi r18, 0xFF	
	sts SPL, r16
	ldi r18, 0x21
	sts SPH, r16

	ldi A,10
	ldi B,25
	push A			;reserve A's value
	
	add A,B			;addition
	mov resAdd,A
	lds A,0x21ff	;restore the value
	
	sub A,B			;subtrction
	mov resSub,A
	lds A,0x21ff
	
	and A,B			;AND operation
	mov resAnd,A
	lds A,0x21ff
	
	or A,B			;OR operation
	mov resOr,A
	lds A,0x21ff
	
	lsl A			;shift left and right
	mov resLsl,A
	lsr B
	mov resLsr,B
	pop A


	jmp done

done: jmp done
	
