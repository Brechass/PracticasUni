    .data
mensajeapro: .asciiz "El alumno ha aprobado"
mensajesusp: .asciiz "El alumno ha suspendido"
    
    .text          		# Comienza secci�n de c�digo
    .globl start    	# S�mbolo exportado para que sea conocido globalmente
    
start:
        li $v0, 5
    	syscall		#Usuario introducciendo el 1�n�mero
    	move $t0, $v0	#Moviendo el n�mero a un registro
    	
    	li $v0, 5
    	syscall		#Usuario introducciendo el 2�n�mero
    	move $t1, $v0	#Moviendo el n�mero a un registro
    	
    	li $v0, 5
    	syscall		#Usuario introducciendo el 3�n�mero
    	move $t2, $v0	#Moviendo el n�mero a un registro
    	
    	add $t0,$t0,$t1 #Sumamos los dos primeros n�meros en el registro del primero
    	add $t0,$t0,$t2 #Al resultado de la anterior suma le sumamos el tercer n�mero
    			#Y ahora tenemos sumados los 3 n�meros
    	
    	li $t3,0x3	#Numero que vamos a utilizar para dividir la media
    	divu $t4,$t0,$t3 #Dividimos la suma de los tres n�meros entre 3 y lo guardamos en $t4
    	
    	li $t5,0x5 	#Numero que vamos a utilizar para ver si ha suspendido o aprobado
    	
    	bge $t4,$t5,aprobado #Comparamos el n�mero con 5 y si es m�s grande o igual lo mandamos a la label "aprobado" 	     
    	
    	li $v0, 4	    #De lo contrario aparecer� el mensaje de suspenso
	la $a0, mensajesusp
    	syscall

exit:    	
    	li   $v0, 10		# Se carga el n�mero de llamada al sistema para salir
  	syscall             	# Llamada al sistema
	
aprobado:
	li $v0, 4		#Si el n�mero es mayor que 5 ser� mandado aqu�
	la $a0, mensajeapro
	syscall
