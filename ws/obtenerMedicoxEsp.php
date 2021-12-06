<?php
    $db = new mysqli("localhost","root","1234","CL_CARMELO");
    if(!$db) {
        echo "Database connection failed";
    }
    //$id_especialidad = $_POST['id_especilidad'];
    //$id_especialidad = 3;
    $query = $db->query("SELECT * FROM MEDICO");
    $list = array();

    while ($rowdata = $query-> fetch_assoc()){

        $list[] = $rowdata;

    }
    echo json_encode($list);
?>