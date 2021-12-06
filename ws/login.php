<?php
    require("conexion.php");

    $num_exp = $_POST['num_exp'];
    $pass = $_POST['pass'];

    //$num_exp = "EXP-01";
    //$pass = "javi123";

    $sql = "SELECT * FROM PACIENTE WHERE NUM_EXP='$num_exp' AND PASS='$pass'";
    $query = $mysqli->query($sql);
    
    if($query->num_rows > 0) {
        echo "CORRECTO";
    } else {
        echo "ERROR";
    }
?>