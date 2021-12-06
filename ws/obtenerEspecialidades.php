<?php
    $db = new mysqli("localhost","root","1234","CL_CARMELO");
    if(!$db) {
        echo "Database connection failed";
    }
    $person = $db->query("SELECT * FROM especialidades");
    $list = array();

    while ($rowdata = $person-> fetch_assoc()){

        $list[] = $rowdata;

    }
    echo json_encode($list);
?>

