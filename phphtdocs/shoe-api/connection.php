<?php


 $servername = "localhost";
 $username = "root";
 $password = "";
 $database = "shop_db";


 $con = mysqli_connect($servername, $username, $password, $database);

 if(!$con){
     http_response_code(500);
     die("Connection Failed" . mysqli_connect_error());
 }