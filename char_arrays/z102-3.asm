; B8
; a[7], db, char,->b[], b[j]=(a[i], a[i] not in ['A','Z'])
.model small
.stack 128
.data
a db  7 dup(?)		; 'A', 'c', 'T', '$', '7',  '(', 'F'
b db 7 dup(?)
message1 db 'Enter the string: $'
message2 db 10,13,"Substring is: ", 13,10,'$'

.code
start:	mov ax,@data
	mov ds,ax

	mov ah,9
	lea dx,message1
	int 21h

	mov si,0
	mov cx,7
	mov ah,1

circle1:	int 21h
	mov a[si],al
	inc si
	loop circle1

	mov si,0
	mov cx,7
	mov di,0

circle2:	mov al,a[si]
	cmp al,'A'
	jb yes
	cmp al,'Z'
	ja yes
	jmp next

yes:	mov b[di],al
	inc di

next:	inc si
	loop circle2

	mov ah,9
	lea dx,message2
	int 21h


	mov ah,2
	mov cx,di
	mov si,0

circle3:	mov dl,b[si]
	int 21h
	inc si
	loop circle3

	mov ax,4c00h
	int 21h
end start	