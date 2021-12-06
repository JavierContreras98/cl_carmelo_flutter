<?php
//Define your host here.
$HostName = "localhost";
	 
//Define your MySQL Database Name here.
$DatabaseName = "cl_carmelo";
 
//Define your Database UserName here.
$HostUser = "root";
 
//Define your Database Password here.
$HostPass = "1234";
 
// Creating connection
$conn = new mysqli($HostName, $HostUser, $HostPass, $DatabaseName);

if ($conn->connect_error) {

die("Connection failed: " . $conn->connect_error);
} 

// Creating SQL command to fetch all records from Student_Data Table.
$sql = "SELECT C.EXPEDIENTE,HORA_CITA,FECHA_CITA, E.NOMBRE AS ESPECIALIDAD, M.NOMBRE AS MEDICO
FROM CITA AS C
INNER JOIN ESPECIALIDADES AS E
ON E.ID = C.ID_ESPECIALIDAD
INNER JOIN MEDICO AS M
ON M.ID = C.ID_MEDICO
WHERE C.FECHA_CITA < NOW();";
 
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