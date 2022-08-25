<?php
	require_once "../config/conexion.php";
        
        $fl_rol = $_POST['fl_rol'];
	
	$queryM = "SELECT fl_usuario, nb_usuario FROM c_usuario WHERE fl_rol = '$fl_rol' ";
	$resultadoM = $conection->query($queryM);
	
	$html= "<option value='0'>Seleccionar Usuario</option>";
	
	while($rowM = $resultadoM->fetch_assoc())
	{
		$html.= "<option value='".$rowM['fl_usuario']."'>".$rowM['nb_usuario']."</option>";
	}
	
	echo $html;
?>
