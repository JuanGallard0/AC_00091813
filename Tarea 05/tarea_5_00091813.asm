
org 	100h

section .text

	call	graphic

	xor 	si, si
	xor 	di, di

;líneas horizontales
	mov 	si, 75d	;Columna
	mov 	di, 25d ;Fila
	mov	bx, 35d	;Tamaño
	add	bx, si
	call 	h_line

	mov 	si, 75d	;Columna
	mov 	di, 175d;Fila
	mov	bx, 35d	;Tamaño
	add	bx, si
	call 	h_line

	mov 	si, 210d;Columna
	mov 	di, 25d ;Fila
	mov	bx, 35d	;Tamaño
	add	bx, si
	call 	h_line

	mov 	si, 210d;Columna
	mov 	di, 175d;Fila
	mov	bx, 35d	;Tamaño
	add	bx, si
	call 	h_line

	mov 	si, 110d;Columna
	mov 	di, 75d	;Fila
	mov	bx, 100d;Tamaño
	add	bx, si
	call 	h_line

	mov 	si, 110d;Columna
	mov 	di, 100d;Fila
	mov	bx, 100d;Tamaño
	add	bx, si
	call 	h_line

;líneas verticales
	mov 	si, 75d	;Columna
	mov 	di, 25d ;Fila
	mov	bx, 150d;Tamaño
	add	bx, di
	call 	v_line

	mov 	si, 245d;Columna
	mov 	di, 25d ;Fila
	mov	bx, 150d;Tamaño
	add	bx, di
	call 	v_line

	mov 	si, 110d;Columna
	mov 	di, 25d ;Fila
	mov	bx, 50d	;Tamaño
	add	bx, di
	call 	v_line

	mov 	si, 210d;Columna
	mov 	di, 25d ;Fila
	mov	bx, 50d	;Tamaño
	add	bx, di
	call 	v_line

	mov 	si, 110d;Columna
	mov 	di, 100d;Fila
	mov	bx, 75d	;Tamaño
	add	bx, di
	call 	v_line

	mov 	si, 210d;Columna
	mov 	di, 100d;Fila
	mov	bx, 75d	;Tamaño
	add	bx, di
	call 	v_line

	call	kb_wait

	int	20h

;-------SUBRUTINAS

;modo gráfico
graphic:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

;punto
pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

;linea horizontal
h_line:	
L_hLine:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	L_hLine
	ret

;linea vertical
v_line:
L_vLine:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	L_vLine
	ret

;esperar pulsación de tecla
kb_wait:mov	ah, 00h
	int 	16h
	ret

