	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	print1
	call	print2
	call 	print3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di 		;columna
	mov 	dh, [200h]	;fila
	mov 	bh, 0h
	int 	10h
	ret

print1:	mov 	di, 12d
	mov	byte[200h], 5d
loop1:	mov 	cl, [msg1+di-12d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	loop1
	ret

print2:	mov 	di, 27d
	mov	byte[200h], 12d
loop2:	mov 	cl, [msg2+di-27d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	loop2
	ret

print3:	mov 	di, 45d
	mov	byte[200h], 19d
loop3:	mov 	cl, [msg3+di-45d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	loop3
	ret

section .data
msg1	db 	"A veces me pregunto."
len1	equ	$-msg1+12d

msg2	db 	"Si al comer mucho salmon."
len2	equ	$-msg2+27d

msg3	db	"Me puede dar salmonella."
len3	equ	$-msg3+45d