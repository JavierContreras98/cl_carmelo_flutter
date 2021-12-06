<?php 
    require("conexion.php");

    $hora_cita = $_POST['hora_cita'];
    $fecha_cita = $_POST['fecha_cita'];
    $id_especialidad = $_POST['id_especialidad'];
    $id_medico = $_POST['id_medico'];
    $expediente = $_POST['expediente'];

    $sql = "INSERT INTO CITA (HORA_CITA,FECHA_CITA,ID_ESPECIALIDAD,ID_MEDICO,EXPEDIENTE) VALUES('$hora_cita','$fecha_cita','$id_especialidad','$id_medico','$expediente')";
    $query = $mysqli->query($sql);
?>