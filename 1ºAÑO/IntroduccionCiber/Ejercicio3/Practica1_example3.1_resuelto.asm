	.text
	.globl start 

start:
	# Inicialización de registros.
	la $s0, size 			# $s0 = size = 15 indica el tamaño del array	
	lw $s1, 0($s0)  		# se carga el valor de $s0 en $s1 por lo que $s1 almacena el valor de size, siendo este 15	
	ori $t0, $0, 0 			# $t0 = cont
	ori $s2, $0, 0 			# $s2 = sum
	ori $s3, $0, 0 			# $s3 = pos
	ori $s4, $0, 0 			# $s4 = neg

	# <init>
	ori $s5, $0, 0 			# $s5 = i
	la $s6, array 			# $s6 = &array (7, 3, 1, -25, 99, 54, 7, 9, -25, -123, 98, 56, 0, 34, -39)
	
for: 
	# if (<cond>)
	bge $s5, $s1, done		#si $s5 >= $s1 entonces "done" pero $s1 = size = 15 y $s5 = 0 (no cumple la condición)

	# <for-body>
	lw $s7, 0($s6) 			#cargamos la palabra situada en la dirección $s6 en $s7, siendo esta "0"
	addu $s2, $s2, $s7 		#sumamos los valores de $s2 y $s7 (por orden en el array)y los registramos en $s2
	addu $t0, $t0, 1		#cargamos en el registro temporal $t0 un uno cada vez que ejecutamos el for (el número que de como resultado será entonces la cantidad de veces que se ejecuta el for menos una que es la comparación en el bge)
	blez $s7, negativos		#si el registro de destino (rd) es <= 0 entonces los datos se remifican a la etiqueta, en este caso "negativos", por lo que los elementos del arry situados en ese registro que cumplan la condición de ser <= 0, se etiquetaarán como negativos
	addu $s3, $s3, $s7 		#suma los valores positivos del array y deja registrados los resultados en $s3
	j update			#nos movemos hasta update (línea 33) y la ejecuta

negativos: 
	bgez $s7, update 		# aqui llegan los valores negativos del array, una vez aqui, bajo la instruccion bgez, si son  >= 0 iran a update
	addu $s4, $s4, $s7 		# el valor negativo se almacena en el registro $s4, puesto que este se encontraba vacío la primera vez, posteriormente los valores negativos se sumarán

update: 
	# <update>
	addi $s5, $s5, 1 		#Cada vez que el array avanza una posición, suma 1 en el registro $s5
	addi $s6, $s6, 4 		# Mover puntero del array
	j for 					

done:
	move   $a0, $t0   		
   	li   $v0, 1      	    
   	syscall					
	
	li $v0, 4       	
	la $a0, newline       
	syscall
	
	move   $a0, $s2   		
   	li   $v0, 1      	    
   	syscall					

	li $v0, 4       	
	la $a0, newline       
	syscall

	move   $a0, $s3   	
   	li   $v0, 1      	
   	syscall				
	
	li $v0, 4       	
	la $a0, newline       
	syscall
	
	move   $a0, $s4   	
   	li   $v0, 1      	
   	syscall				

exit:	
	li   $v0, 10		
  	syscall             

# Inicialización de los datos
.data
	size: 	.word 15
	array: 	.word 7, 3, 1, -25, 99, 54, 7, 9, -25, -123, 98, 56, 0, 34, -39
	newline: .asciiz "\n"
