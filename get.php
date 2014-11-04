<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "retell";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result= mysqli_query($conn, "SELECT * FROM product");

 while($row = mysqli_fetch_array($result)) {
 echo "<img src='uploads/",$row['img'],"' width='175' height='200' />" . "<br>" . $row['date'] . "<br>" . $row['beskrivelse'] . "<br>";
}

$conn->close();