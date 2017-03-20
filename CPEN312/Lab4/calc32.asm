;----- Lab 4 of CPEN 312 taught by Jesus Calvino-Fraga at UBC 
;----- Authors: Jesus Calvino-Fraga and Shamsuddin Rehmani
;-----
;----- Description: Part of the code for calc32.asm and math32.asm lib was provided
;-----				and it was required to complete the implementation to create a 
;-----				calculator that does addition, subtraction, multiplication, and
;-----				division when two numbers x and y are inputed
;-----				Altera DE0-CV was used to test this. 
;-----
;----- Testing: After booting calc32.asm on Altera DE0-CV, enter a number using SW0-SW09. 
;-----			For example to enter 5780 toggle SW0 ON/OFF followed by SW8, SW7 and 
;-----			SW5. 
;-----
;-----			For addition press KEY3 which will store the value and clear
;-----			the display. Enter the second integer by toggling switch as decribed
;-----			earlier and press KEY1 for the result (i.e. addition in this case)
;-----
;-----			For subtraction press KEY2 instead of KEY3
;-----
;-----			For Multiplication, after inputing the first number, press KEY3 and
;-----			then KEY0 and realease KEY3 before releasing KEY0
;-----
;-----			For Division, press KEY2 and KEY0 realeasing KEY2 before KEY0
;-----			 
;-----
$modde0cv

	CSEG at 0
	ljmp mycode

	dseg at 30h
	x: ds 4 ; 32-bits for variable ‘x’
	y: ds 4 ; 32-bits for variable ‘y’
	bcd: ds 5 ; 10-digit packed BCD (each byte stores 2 digits)
	operation: ds 1 ;  8-bit (1 byte variable) for deciding b/w different operations
	bseg
	mf: dbit 1 ; Math functions flag
	$include(math32.asm)

	CSEG

; Look-up table for 7-seg displays
myLUT:
    DB 0C0H, 0F9H, 0A4H, 0B0H, 099H        ; 0 TO 4
    DB 092H, 082H, 0F8H, 080H, 090H        ; 4 TO 9

showBCD MAC
	; Display LSD
    mov A, %0 ; move value at 1st argument to acc
    anl A, #0fh ; forces bit 4 to 7 to zero
    movc A, @A+dptr ; look-up from the 7-seg table
    mov %1, A ; move value in acc to address of 2nd argument 
	; Display MSD
    mov A, %0
    swap A
    anl A, #0fh
    movc A, @A+dptr
    mov %2, A
ENDMAC

Display:
	mov dptr, #myLUT ; points to the start of the myLUT look-up table
	showBCD(bcd+0, HEX0, HEX1) ; display MSD and LSD value of variable bcd onto the HEX
	showBCD(bcd+1, HEX2, HEX3)
	showBCD(bcd+2, HEX4, HEX5)
    ret

MYRLC MAC
	mov a, %0
	rlc a
	mov %0, a
ENDMAC

Shift_Digits:
	mov R0, #4 ; shift left four bits
Shift_Digits_L0:
	clr c
	MYRLC(bcd+0)
	MYRLC(bcd+1)
	MYRLC(bcd+2)
	MYRLC(bcd+3)
	MYRLC(bcd+4)
	djnz R0, Shift_Digits_L0
	; R7 has the new bcd digit	
	mov a, R7
	orl a, bcd+0
	mov bcd+0, a
	; bcd+3 and bcd+4 don't fit in the 7-segment displays so make them zero
	clr a
	mov bcd+4, a
	ret

Wait50ms:
;33.33MHz, 1 clk per cycle: 0.03us
	mov R0, #30
L3: mov R1, #74
L2: mov R2, #250
L1: djnz R2, L1 ;3*250*0.03us=22.5us
    djnz R1, L2 ;74*22.5us=1.665ms
    djnz R0, L3 ;1.665ms*30=50ms
    ret

; Check if SW0 to SW9 are toggled up.  Returns the toggled switch in
; R7.  If the carry is not set, no toggling switches were detected.
ReadNumber:
	mov r4, SWA ; Read switches 0 to 7
	mov a, SWB ; Read switches 8 to 9
	anl a, #00000011B ; Only two bits of SWB available
	mov r5, a
	mov a, r4
	orl a, r5
	jz ReadNumber_no_number
	lcall Wait50ms ; debounce
	mov a, SWA
	clr c
	subb a, r4
	jnz ReadNumber_no_number ; it was a bounce
	mov a, SWB
	anl a, #00000011B
	clr c
	subb a, r5
	jnz ReadNumber_no_number ; it was a bounce
	mov r7, #16 ; Loop counter
ReadNumber_L0:
	clr c
	mov a, r4
	rlc a
	mov r4, a
	mov a, r5
	rlc a
	mov r5, a
	jc ReadNumber_decode
	djnz r7, ReadNumber_L0
	sjmp ReadNumber_no_number	
ReadNumber_decode:
	dec r7
	setb c
ReadNumber_L1:
	mov a, SWA
	jnz ReadNumber_L1
ReadNumber_L2:
	mov a, SWB
	jnz ReadNumber_L2
	ret
ReadNumber_no_number:
	clr c
	ret
	
mycode:
	mov SP, #7FH
	clr a
	; clear LEDs
	mov LEDRA, a
	mov LEDRB, a
	; Initialize BCD to 00-00-00-00-00
	mov bcd+0, a 
	mov bcd+1, a
	mov bcd+2, a
	mov bcd+3, a
	mov bcd+4, a
	; Display 00-00-00
	lcall Display
	
forever:
	jb KEY.3, no_add ; If '+' key not pressed, skip
	jnb KEY.3, $ ; Wait for user to release '+' key
	lcall bcd2hex ; Convert the BCD number to hex in x
	lcall copy_xy ; move x to y (this is a function)
 	Load_X(0) ; clear x (this is a macro)
	lcall hex2bcd ; Convert binary x to BCD
	lcall Display ; Display the new BCD number
	jnb KEY.0, is_mult ; If '*' is pressed, jump to is_mult
	mov operation, #0000_0001B ; set bit 0 to 1 for addition only
	ljmp forever
	
is_mult:
	mov operation, #0000_0100B ; set bit 2 to 1 for multiplication
	ljmp forever 	
	
no_add:
	jb KEY.2, no_sub_no_add ; If '-' key not pressed, skip
	jnb KEY.2, $; Wait at this address until '-' is released
	lcall bcd2hex; Convert the BCD number to hex in x
	lcall copy_xy; move x to y (function in math32)
	Load_X(0) ; clear x ( a macro in math32)
	lcall hex2bcd ; convert binary x to BCD
	lcall Display ; Display 0
	jnb KEY.0, is_div ; If '*' is pressed, jump to is_div
	mov operation, #0000_0010B ; set bit 1 to 1 for subtraction
	ljmp forever
	
is_div:
	mov operation, #0000_1000B ; set bit 3 to 1 for multiplication
	ljmp forever 

	
no_sub_no_add:
	jb KEY.1, no_equal ; If '=' key not pressed, skip
	jnb KEY.1, $ ; Wait for user to release '=' key
	lcall bcd2hex ; Convert the BCD number to hex in x
	; Select the function the user wants to perform:
	lcall xchg_xy
	mov a, operation ; The accumulator is bit addressable!
	jb acc.0, do_addition
	jb acc.1, do_subtraction
	jb acc.2, do_multiplication
	jb acc.3, do_division 
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display ; Display the new BCD number
	ljmp forever ; Go check for more input
	
do_addition:
	lcall add32 ; Add the numbers stored in x and y
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display ; Display BCD using 7-segment displays
	ljmp forever ; go check for more input	
	
do_subtraction:
	lcall sub32 ; subtract the numbers stored in x and y
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display ; Display BCD using 7-segment displays
	ljmp forever ; go check for more input	

do_multiplication:
	lcall mul32 ; multiply the numbers stored in x and y
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display ; Display BCD using 7-segment displays
	ljmp forever ; go check for more input
	
do_division:
	lcall div32 ; Add the numbers stored in x and y
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display ; Display BCD using 7-segment displays
	ljmp forever ; go check for more input		

no_equal:
	; get more numbers
	lcall ReadNumber
	jnc no_new_digit ; Indirect jump to 'forever'
	lcall Shift_Digits
	lcall Display
	
no_new_digit:
	ljmp forever ; 'forever' is to far away, need to use ljmp
		
end