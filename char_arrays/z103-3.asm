;  B8
;a[10],char, db, ->anjatel entazangvats 5-in patik ASCII kodov tarreric

model small
.stack 128
.data
a db 10 dup(?)
b db 10 dup(?)
message1 db 'Enter the string: $'
message2 db 10,13,"Substring is: ",13,10,'$'

.code

start:	mov ax,@data
	mov ds,ax

	mov ah,9
	mov dx,offset message1
	int 21h

	mov si,0
	mov cx,10
	mov ah,1
	
circle1:int 21h
	mov a[si],al
	inc si
	loop circle1

	mov cx,10
	mov si,0
	mov di,0
	mov bh,5

circle2:	mov al,a[si]
	mov ah,0	
	div bh		; ax:bh->al=/, ah=%
	cmp ah,0
	jne next
	mov  al,a[si]
	mov b[di],al
	inc di
	
next:	inc si
	loop circle2

	mov ah,9
	mov dx,offset message2
	int 21h

	mov cx,di
	mov di,0
	mov ah,2
	
circle3:	mov dl,b[di]
	int 21h
	inc di
	loop circle3

	mov ax,4c00h
	int 21h
end start
