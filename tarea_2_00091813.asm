	org	100h

	;Ejercicio 1.

	;Ultimos 5 digitos de mi carnet: 91813
	;Promedio = (9+1+8+1+3)/5 = 4.4 ~= 4

	mov	WORD[200h], "M"
	mov	WORD[201h], "e"
	mov	WORD[203h], "r"
	mov	WORD[204h], "e"
	mov	WORD[205h], "c"
	mov	WORD[206h], "u"
	mov	WORD[207h], "p"
	mov	WORD[208h], "e"
	mov	WORD[209h], "r"
	mov	WORD[20Ah], "o"

	;Ejercicio 2

	mov	ax, 0000h
	mov	bx, 0000h
	mov	cx, 0000h
	mov	dx, 0000h

	mov 	al, 2d	;numero inicial de enfermos
	mov	bl, 0d	;indice
	mov	cl, 2d	;multiplo a utilizar en la estimacion

bucle:	mul 	cx	;estimacion
	mov	[210h+bx], ax	;guardar estimacion
	inc 	bl 	;incrementar indice

	cmp	bl, 16d	;condicion del bucle
	jne	bucle	;seguir el bucle si el indice no es 16
	
	;a partir de los 100h enfermos el output del dump ya no los muestra
	;la 16ava estimacion es 10000h por lo que AX desborda y se guarda 1 en DX


	;Ejercicio 3

	

	int 20h

