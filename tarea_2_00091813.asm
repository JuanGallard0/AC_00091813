	org	100h


section	.text

	;EJERCICIO 1

;Ultimos 5 dígitos de mi carnet: 91813
;Promedio = (9+1+8+1+3) / 5 = 4.4 ~= 4
;Mensaje a utilizar: "Me recupero"
	
	mov	bx, 0d	
	mov	cx, len
	mov	di, 0d	

loop1:	mov	bl, [comnt+di]	
	mov	[200h+di], bl 	
	inc 	di 	
	loop 	loop1	
	

	;EJERCICIO 2

	mov 	ax, 2d 	;numero inicial de enfermos
	mov	cx, 11d	;numero de estimaciones a calcular
	mov	di, 0d	;índice de memoria
	mov	si, 2d 	;múltiplo para calcular estimaciones

	;estimacion
loop2:	mul 	si
	
	;verificación del tamaño de la estimación
	cmp	ax, 255d
	ja	jump1

	;guardado de estimación inferior o igual a  255d
	mov	[210h+di], ax	
	inc 	di
	loop 	loop2

	;guardado de estimación superior a 255d
jump1:	mov	[210h+di], al
	inc 	di
	mov	[210h+di], ah	
	inc 	di
	loop 	loop2


	;EJERCICIO 3
	
	mov	bx, 0d	;F[n-2]
	mov	dx, 1d 	;F[n-1]
	mov	cx, 14 	;numero de terminos a calcular
	mov	di, 2d 	;indice de memoria

	;inicialización de terminos base
	mov	[220h], bl
	mov	[221h], dl

	;calculo de término de fibonacci
loop3:	mov	ax, bx
	add	ax, dx
	mov	bx, dx
	mov	dx, ax

	;verificación del tamaño de término
	cmp	ax, 255d
	ja	jump2

	;guardado de término inferior o igual a  255d
	mov	[220h+di], ax
	inc	di
	loop 	loop3

	;guardado de término superior a 255d
jump2:	mov	[220h+di], al
	inc 	di
	mov	[220h+di], ah
	inc 	di
	loop 	loop3


	int 20h


section	.data

comnt	db	"Me recupero"
len	equ	$-comnt 