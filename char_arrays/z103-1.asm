;  A3b
;a[5],b[5], dw, signed ->c[5], c[i]=max(a[i],b[i])

model small
.stack 128
.data
a dw 10,   12, -25,30,-14
b dw 15,-120, 74, -2, 22
c dw 5 dup(?)


.code

start:	mov ax,@data
	mov ds,ax

	mov si,0

	mov cx,5
	
circle:	mov ax,a[si]
	mov bx,b[si]
	cmp ax,bx
	jl a1		; if ax<bx goto a1
	mov cx,ax
	jmp next
a1:	mov cx,bx
next:	inc si
	inc si
	loop circle		
	
	mov ax,4c00h
	int 21h
end start
