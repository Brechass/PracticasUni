<?php


if(isset($_POST['usuario']) && isset($_POST['password']) && !empty($_POST['usuario']) && !empty($_POST['password'])){

	$user=($_POST['usuario']);  
	$pass=($_POST['password']);
	
	$conn = new mysqli('localhost','app','password-usuario','accesos')

	if ($conn->connect_error){
		die("FALLÓ LA CONEXIÓN A BBDD: ".$conn->connect_error);
	}

	$resultado = $conn->query("SELECT * FROM accesos.user_pass WHERE usuario='$user' AND password='$pass';");

	if ($resultado->num_rows !=0){
		echo 'Usuario encontrado: Puedes acceder a la zona privada';
	} else {
		echo 'Usuario no encotrado: Vuelve a intearlo';
	}

	$conn->close();
} else {
	echo 'Introduce un usuario y una contraseña.';
}

?> 
