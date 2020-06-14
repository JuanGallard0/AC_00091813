;P.S. Guardé el mensaje en [250h] porque [200h] se me llenó de basura de la section data

org	100h

section	.text
	
	mov	dx, msg
	call	eco_str
	call	r_crnt
	call 	pmd
	call 	switch
	call 	save

	int 	20h

;-------SUBRUTINAS
;leer caracter del teclado con echo
kb: 	mov	ah, 1h
	int 	21h
	ret

;escribir cadena de caracteres en salida estándar
eco_str:mov	ah, 09h
	int 	21h
	ret

;leer , tranformar en int y guardar carnet entero en [300h] 
r_crnt:	xor 	si, si 
	mov	cx, 8d
L_rCrnt:call 	kb
	sub 	al, 30h
	mov	[300h+si], al 
	inc 	si
	loop 	L_rCrnt
	ret

;calcular promedio de los últimos 5 dígitos del carnet
pmd:	xor	ax, ax
	mov	cx, 5d
	mov	bx, 0d
L_pmd:	add	al, [303h+bx]
	inc	bl
	loop	L_pmd
	div	bl
	ret

;escojer mensaje que se guardará en [250h] (intento de switch-case)
switch:	cmp	al, 1d
	jne	case2
	mov	bx, nota1
	mov	cx, len1
case2:	cmp	al, 2d
	jne 	case3
	mov	bx, nota2
	mov	cx, len2
case3:	cmp	al, 3d
	jne	case4
	mov	bx, nota3
	mov	cx, len3
case4:	cmp	al, 4d
	jne	case5
	mov	bx, nota4
	mov	cx, len4
case5:	cmp	al, 5d
	jne	case6
	mov	bx, nota5
	mov	cx, len5
case6:	cmp	al, 6d
	jne	case7
	mov	bx, nota6
	mov	cx, len6
case7:	cmp	al, 7d
	jne	case8
	mov	bx, nota7
	mov	cx, len7
case8:	cmp	al, 8d
	jne	case9
	mov	bx, nota8
	mov	cx, len8
case9:	cmp	al, 9d
	jne	case10
	mov	bx, nota9
	mov	cx, len9
case10:	cmp	al, 10d
	jne	E_swt
	mov	bx, nota10
	mov	cx, len10
E_swt:	ret

;guardar mensaje en [250h]
save:	xor	si, si
	sub 	cx, 1d
L_save:	mov     ax, [bx]
	mov	[250h+si], ax
	inc	bx
	inc	si
	loop	L_save
	ret

section	.data

msg	db	"Carnet: ","$"
nl	db 	0xA, 0xD, "$"

nota1	db	"Solo necesito el 0"
len1	equ	$-nota1
nota2	db	"Aun se pasa"
len2	equ	$-nota2
nota3	db	"Hay salud"
len3	equ	$-nota3
nota4	db	"Me recupero"
len4	equ	$-nota4
nota5	db	"En el segundo"
len5	equ	$-nota5
nota6	db	"Peor es nada"
len6	equ	$-nota6
nota7	db	"Muy bien"
len7	equ	$-nota7
nota8	db	"Colocho"
len8	equ	$-nota8
nota9	db	"Siempre me esfuerzo"
len9	equ	$-nota9
nota10	db	"Perfecto solo Dios"
len10	equ	$-nota10
