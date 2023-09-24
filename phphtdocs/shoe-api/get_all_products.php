<?php

include 'connection.php';
global $con;

sleep(3);

if ($_SERVER["REQUEST_METHOD"]!="GET"){
    http_response_code(400);
    die('Invalid Method');
}
$result = $con->query("SELECT * FROM products")->fetch_all(MYSQLI_ASSOC);

if ($result){
    echo json_encode($result);
}

else{
    http_response_code(400);
    die('There is an error');
}
