; A7
; a[7], dw, signed, s=count(a[i], a[i] in [-30,20) && a[i]%6==4)
.model small
.stack 128
.data
a dw 10,-28,16,25,-26,18,34

.code
start:	mov ax,@data
	mov ds,ax

	mov si,0
	mov cx,7
	mov bl,6
	mov bh,0		; count=0

circle:	mov ax,a[si]
	cmp ax,-30
	jl next		; if (ax<-30) goto next
	cmp ax,20
	jge next		; if(ax>=20) goto next

	idiv bl		; ax:bl->al=/, ah=%
	cmp ah,4
	jne next

	inc bh		; count++

next:	inc si
	inc si
	loop circle

	mov ah,2
	mov dl,bh	; dl=count=2
	add dl,'0'		; dl=2+'0'='2'
	int 21h

	mov ax,4c00h
	int 21h
end start	