; B3a
; a[7], b[7], db, char,->c[7], c[i]=min(a[i], b[i])
.model small
.stack 128
.data
a db 'A', 'c', '2', '$', '7',  '(', 'F'
b db 'N', '4','0', 'A', 'v',  ')', '&'
c db 7 dup(?)

.code
start:	mov ax,@data
	mov ds,ax

	mov si,0
	mov cx,7
	
circle:	mov al,a[si]
	mov bl,b[si]
	cmp al,bl
	ja a1
	mov c[si],al
	jmp next
a1:	mov c[si],bl
next:	inc si
	loop circle

	mov ah,2
	mov cx,7
	mov si,0

circle1:	mov dl,c[si]
	int 21h
	inc si
	loop circle1

	mov ax,4c00h
	int 21h
end start	