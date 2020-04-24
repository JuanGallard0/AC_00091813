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

	mov	ax, 0000h	;enfermos
	mov	bx, 0000h	;indice
	mov 	si, 0000h	;multiplo

	mov 	al, 2d	;numero inicial de enfermos
	mov	si, 2d	;multiplo a utilizar en cada estimacion

loop1:	mul 	si	;estimacion
	mov	[210h+bx], ax	;guardar estimacion
	inc 	bl 	;indice++

	cmp	bl, 6d	;seguir bucle mientras indice sea inferior a 6d
	jb	loop1	

;las estimaciones se pasan de 255 a partir de la septima
	
loop2:	mul 	si	
	mov	[210h+bx], ah
	inc 	bl
	mov	[210h+bx], al	
	inc 	bl

	cmp	bl, 16d	
	jb	loop2	


	;Ejercicio 3

	mov	ax, 0000h	;variable temporal
	mov	bx, 0000h	;indice
	mov	cx, 0000h	;F[n-2]
	mov	dx, 0000h	;F[n-1]

	mov	bl, 2d	;indice = 2
	mov 	dl, 1d 	;F[1] = 1
	mov	[220h], cl	;guardar F[0]
	mov	[221h], dl	;guardar F[1]

loop3:	mov	ax, dx	;AX = F[n-1]
	add	ax, cx	;AX += F[n-2]
	mov	[220h+bx], ax 	;guardar AX
	mov	cx, dx	;F[n-2] = F[n-1]
	mov	dx, ax 	;F[n-1] = AX
	inc 	bl 	;indice++

	cmp	bl, 14d	;seguir bucle mientras indice sea inferior a 14d
	jb	loop3	

;solo el 16avo termino se pasa de 255 

	mov	ax, dx	
	add	ax, cx	
	mov	[220h+bx], ah
	inc 	bl 	
	mov	[220h+bx], al
	mov	cx, dx	
	mov	dx, ax 	

	int 20h