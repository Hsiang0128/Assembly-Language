;=====================================================================================================
; Worker  : 111310313  Li Hsiang Huang
; Program : Homework 3 
;
; ESI => ARRAY ADDRESS
; EDI => EVEN ADDRESS or ODD ADDRESS
; ECX => ARRAY LENGTH
;=====================================================================================================
.386
.model flat,stdcall
.data
	ODD_SUM		DW 0
	EVEN_SUM    DW 0
	ARRAY	DB 0F7H,23H,45H,65H,12H,8FH,9AH,5CH 
.code
main proc
	LEA ESI,ARRAY		; Get Array Address
	MOV ECX,8			; Set Counter = 8
	MOV BH, 0			; Set BX High 8 bits are 0 because ARRAY are unsigned data
	;============< Mode Select >======================================================================
	AGAIN:
	MOV BL,[ESI]		; Get Array data with Counter and put it in BL
	TEST BL,01H			; Look now Odd Flag is what
	JNZ Odd_Mode		; Go to Mode Function
	;============< Even Mode >========================================================================
	LEA EDI,EVEN_SUM	; Put EVEN_SUM address in EDI
	JMP CACULATE		; Go to Caculate Function
	;============< Odd Mode >=========================================================================
	Odd_Mode:
	LEA EDI,ODD_SUM		; Put ODD_SUM address in EDI
	;============< Caculate >=========================================================================
	CACULATE:
	MOV AX,[EDI]		; Put (ODD_SUM / EVEN_SUM) data in AX
	ADD AX,BX			; Put (AX + BL) in AX
	MOV [EDI],AX		; Put AX data to (ODD_SUM / EVEN_SUM)
	INC ESI
	;============< Stop Program >=====================================================================
	LOOP AGAIN			; If the Counter is not 0 then do it again
	RET
main endp
end main