;c[i] = max(a[i], b[i])

.model small
.stack 128

.data
a db 'q', '1', '3', '+', 'H'
b db 's', '2', '#', '8', ','
c db 5 dup(?)
.code

start:  mov ax, @data
        mov ds, ax

        ;si is the index of array
        mov si, 0
        ;cx is loop counter
        mov cx, 5

circle: mov al, a[si]
	mov bl, b[si]
	cmp al, bl
	jb al_less
	mov c[si], al
	jmp next
al_less:mov c[si], bl
next:   inc si
        loop circle


	mov ah, 2  ;for printing
	mov si, 0  ;index of array
	mov cx, 5  ;loop couter


output: mov dl, c[si]
        int 21h
	inc si
	loop output

        mov ax, 4c00h
        int 21h

end start