<?php

//Define your host here.

$HostName = "localhost";


//Define your MySQL Database Name here.

$DatabaseName = "cl_carmelo";


//Define your Database UserName here.

$HostUser = "root";


//Define your Database Password here.

$HostPass = "";


// Creating connection

$conn = new mysqli($HostName, $HostUser, $HostPass, $DatabaseName);


if ($conn->connect_error) {


die("Connection failed: " . $conn->connect_error);

}


// Creating SQL command to fetch all records from Student_Data Table.

$sql = "SELECT M.NOMBRE, M.TELEFONO, M.CORREO, M.DIAS_LABORALES, E.NOMBRE AS 'ESPECIALIDAD' FROM MEDICO M
INNER JOIN ESPECIALIDADES E
ON M.ID_ESPECIALIDAD = E.ID";


$result = $conn->query($sql);


if ($result->num_rows >0) {


 while($row[] = $result->fetch_assoc()) {


 $item = $row;


 $json = json_encode($item, JSON_NUMERIC_CHECK);


}


} else {

echo "No Data Found.";

}

echo $json;

$conn->close();

?>