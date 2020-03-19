; program to convert Celsius Temp into memory at Ctemp
; to Fahrenheit equivalent in memory at fTemp
; Programmer: Christopehr Leobvitz
; Date: 03/06/2020

.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
cTemp	DWORD ? ; Celsius temperature
fTemp	DWORD 11 DUP (?), 0 ; Fahrenheit temperature
prompt1 byte	"Enter the temperature in celsius you wish to convert", 0
result  byte	"the temp in Fahrenheit is: ", 0
string  byte    40 DUP (?)
.CODE
_MainProc Proc

	input	prompt1, string, 40 ;read in the input from the user
	atod	string				;convert to integer
	mov		cTemp, eax  ;move celsisus temp cTemp into the EAX register

	imul	eax,9		;multiply the value in the EAX register by 9
	add		eax,2		;round the number so it can be eaisly divided
	mov		ebx,5		;move the number to be divided by
	cdq					;prepar for division
	idiv	ebx			;C*9/5
	add		eax,32		;C*9/5+32

	dtoa	fTemp, eax	;save the results in the fTemp variable

	output result, fTemp

	mov		eax, 0		;exit with return code 0
	
	ret
_MainProc ENDP	
END