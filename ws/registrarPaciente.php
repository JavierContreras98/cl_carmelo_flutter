<?php
    require("conexion.php");

    $num_exp = $_POST['num_exp'];
    $primer_nom = $_POST['primer_nom'];
    $segundo_nom = $_POST['segundo_nom'];
    $primer_ape = $_POST['primer_ape'];
    $segundo_ape = $_POST['segundo_ape'];
    $num_doc = $_POST['num_doc'];
    $telefono = $_POST['telefono'];
    $pass = $_POST['pass'];

    $sql = "INSERT INTO PACIENTE (NUM_EXP,PRIMER_NOM,SEGUNDO_NOM,PRIMER_APE,SEGUNDO_APE,NUM_DOC,TELEFONO,PASS) VALUES ('$num_exp','$primer_nom','$segundo_nom','$primer_ape','$segundo_ape','$num_doc','$telefono','$pass')";
    $query = $mysqli->query($sql);
?>