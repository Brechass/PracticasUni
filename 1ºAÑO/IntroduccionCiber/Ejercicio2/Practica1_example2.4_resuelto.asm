    .text               	# Comienza sección de código
    .globl start        	# Símbolo exportado para que sea conocido globalmente

start:
	li	$s0, 0 				# i = 0
	li	$s1, 93			# max = 51
	lw	$t0, sumatorio1		# suma = 0
	lw	$t2, sumatorio2
loop:
	addi $s0, $s0, 1		# i = i + 1
	beq $s0, $s1, end		# cuando i > max, termina
	
	div $s3, $s0, 2			# i / 2 (para ver si es par).
	mfhi $t1			# Se guarda el resto de la división.
	bgtz $t1, sumaI			# Si el resto es !=0 (impar), lo lleva a sumaI.
	beq $t1, $zero, sumaP		# Si el resto es =0 (par), lo lleva a sumaP.
	
	j	loop				# Vuelta al bucle.
	
sumaI:
	addi	$t0, $t0, 1		# sum = sum + i
	sw $t0, sumatorio1		# Se carga el nuevo valor del sumatorio.
	j	loop				# Vuelta al bucle.
	
sumaP:
	addi	$t2, $t0, 1		# sum = sum + i
	sw $t2, sumatorio2		# Se carga el nuevo valor del sumatorio.
	j	loop				# Vuelta al bucle.

end:	
	li $v0, 4
	la $a0, parapares		#imprime frase
	syscall
   	
	lw $a0, sumatorio1		# Se carga el sumatorio para mostrarlo
   	li $v0, 1			# Se carga el número de llamada al sistema "print integer"
   	syscall					# Llamada al sistema
   	
   	li $v0, 4
   	la $a0, newline			#imprime un cambio de línea
   	syscall
   	
   	li $v0, 4
   	la $a0, impares			#imprime frase 
   	syscall
   	
   	lw $a0, sumatorio2		# Se carga el sumatorio para mostrarlo
   	li $v0, 1      			# Se carga el número de llamada al sistema "print integer"
   	syscall					# Llamada al sistema

exit:	
	li   $v0, 10			# Se carga el número de llamada al sistema para salir
  	syscall             	# Llamada al sistema
  	
  	
.data
	impares: .ascii "La cantidad de impares es de: "
	sumatorio1: .word 0
	sumatorio2: .word 0
	newline: .asciiz "\n"
	parapares: .ascii "La cantidad de pares es de: "
