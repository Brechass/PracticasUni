    .text          		# Comienza sección de código
    .globl start    	# Símbolo exportado para que sea conocido globalmente

start:  
	li $s0, 0x8			# Carga el valor 8 - base
	li $s1, 0x5			# Carga el valor 5 - altura
	mul $s2, $s0, $s1	# Multiplica y almacena el resultado en $s2 - área rectángulo
	div  $s3, $s2, 0x2      # Divide el resultado de la multiplicación entre dos y lo almacena en $s3 - área triángulo
	move $a0, $s3   	# Se carga el area para mostrarlo
   	li $v0, 1      		# Se carga el número de llamada al sistema "print integer"
   	syscall				# Llamada al sistema
exit:
	
	li   $v0, 10		# Se carga el número de llamada al sistema para salir
  	syscall             # Llamada al sistema
