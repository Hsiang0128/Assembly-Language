; HW2_111310313 
.386
.model flat,stdcall
.stack 4096
	ExitProcess proto,dwExitCode:dword
.data
	MAXMIMUM	DB 0
	ARRAY	DB 0F7H,23H,45H,65H,12H,8FH,9AH,5CH 
.code
main proc
	mov edx, OFFSET ARRAY
	mov	al, [edx + 7]
	mov ecx,8

	again:
	dec ecx
	mov bl,[edx + ecx]
	cmp al,bl
	jg next
	mov al,bl

	next:
	cmp ecx,0
	jne again

	mov byte ptr [MAXMIMUM], al
	invoke ExitProcess,0
main endp
end main