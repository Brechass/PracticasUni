	.text
	.globl start 

start:
	# Inicialización de registros.
	la $t0, array			# $t0: array
	li $t1, 0			# $t1: cont = 0
    	
for: 
	# if (<cond>)
	lb   $a0, 0($t0)		# Carga el elemento actual del array.  
    beqz $a0, done			# Comprueba si el recorrido del array ha terminado.
 
	li $v0, 11	   		# "Print" del caracter actual (que está cargado en $a0).
	syscall
	
	li $v0, 4       		# "Print" del Salto de línea 
	la $a0, newline       
	syscall

	addi $t0, $t0, 1		# Mover puntero del array. Como el array se encontraba en $t0, cada vez que el bucle pasara por esta instrccion, $t0 será incrementado en 1, para que se avance al siguiente caracter de la frase, y el dato que introduzcase introduzca en $a0 cada vez sea el caracter siguiente al anterior.
        addi $t1, $t1, 1		# $t1: cont += 1
    
	j     for

done:
	li $v0, 4       		# "Print" del texto. 
	la $a0, txt       
	syscall

	li $v0,1			# "Print" de "cont".
    add $a0, $0, $t1			
    syscall

exit:	
	li $v0, 10				# Carga el número de llamada al sistema para salir
  	syscall             	# Llamada al sistema


# Inicialización de los datos
.data
	array: 	.asciiz "Hola don Pepito, hola don José"
	newline: .asciiz "\n"
	txt: .asciiz "El número de caracteres de la frase es: "
