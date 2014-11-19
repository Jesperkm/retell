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


$result= mysqli_query($conn, "SELECT * FROM product ORDER BY date DESC");

 while($row = mysqli_fetch_array($result)) {
 echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['beskrivelse'] . "</p>" . "<p class='date'>" . $row['date'] . "</p>" . "</div>";
}

$conn->close();