; Programmer: Christopher Lebovitz
; Date: 2/9/2020

.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
; define data items to be used in the .CODE portion of the program
number1 DWORD   ?
number2 DWORD   ?
prompt1 BYTE    "Enter first number", 0
prompt2 BYTE    "Enter second number", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The sum is", 0
sum     BYTE    11 DUP (?), 0


.CODE	
_MainProc Proc
	; wirte you assembly code here
	input	prompt1, string, 40		;read ASCII characters given by the user
	atod	string					;convert to integer
	mov		number1, eax			;store in memory

	input	prompt2, string, 40		;repeat for second number
	atod	string
	mov		number2, eax

	mov		eax, number1			;first number to EAX
	add		eax, number2			;add second number
	dtoa	sum, eax				;convert to ASCII characters
	output	resultLbl, sum			; output label and sum

	mov		eax, 0					;exit with return code 0
	ret

_MainProc ENDP
END 