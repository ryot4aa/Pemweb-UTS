<?php
$dbHost = 'localhost'; // HOST DATABASE
$dbName = 'sistem_informasi_mahasiswa'; // NAMA DATABASE
$dbUser = 'root'; // USERNAME DATABASE
$dbPass = ''; // PASSWORD DATABASE

// Create Connection
$connect = new mysqli($dbHost, $dbUser, $dbPass, $dbName);

// Check Connection
if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
}
?>
