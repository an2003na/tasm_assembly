;  B6
;a[5],char, db, ->'A'->'a', 'a'-'A','0'-'9'->'*'

model small
.stack 128
.data
a db 'A','1','%','C','b'

.code

start:	mov ax,@data
	mov ds,ax

	mov si,0

	mov cx,5
	
circle:	mov al,a[si]
	cmp al,'0'
	jb next
	cmp al,'9'
	ja a1
	mov al,'*'
	jmp a2
a1:	cmp al,'A'
	jb next
	cmp al,'Z'
	ja a3
	add al,32
	jmp a2
a3:	cmp al,'a'
	jb next
	cmp al,'z'
	ja next
	sub al,32
a2:	mov a[si],al	
next:	inc si
	loop circle

	mov cx,5
	mov si,0
	mov ah,2
circle1:	mov dl,a[si]		
	int 21h
	inc si
	loop circle2

	mov ax,4c00h
	int 21h
end start
