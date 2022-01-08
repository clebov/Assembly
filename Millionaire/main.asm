;Programer: Christopher Leobivtz
;Date: 4/1/2020

;Assignment;
;Modify your program from Part I using the output dialog box skills you learned in Project 1 to output the three values to these questions:
	;(1) How many days are needed to earn $1 million?
	;(2) What was your wage on the last day?
	;(3) What were your total earnings for these days?

.586
.MODEL FLAT

INCLUDE io.h

.stack 4096
	

.data	
 days		BYTE	 11 DUP (?), 0
 total		BYTE	 11 DUP (?), 0
 lastDayWage BYTE    11 DUP (?), 0
 numOfDays byte		"days needed to earn $1 million: ", 0
 wage	   byte		"Wage on the last day: ", 0
 totalEarnings byte	"Total earnings: ", 0
.CODE	
_MainProc Proc
	
			mov		ebx, 1		; nextDaysWages :=1
			mov		eax, 0		; totalEarnings :=0
			mov		ecx, 0		; day :=0

whilePoor:	cmp		eax,	100000000 ; totalEarnings < 100,000,000 cents?
			jnl		endLoop		;exit if not
			dtoa	lastDayWage, eax
			add		eax, ebx
			add		ebx, ebx	;multiply nextDaysWage by 2
			inc		ecx
			jmp		whilePoor	;repeat
endLoop:
			dtoa	days, ecx ; move the counter into the days variable and convert it to ASCII characters
			
			dtoa	total, eax

			output numOfDays, days
			output totalEarnings, total
			output wage, lastDayWage

			mov		eax, 0		; exit with return code 0
			ret
_MainProc ENDP
END