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

$sort = $_GET["dato"];  
if ($sort == "asc") {          
    echo '<p class="info">Showing the elder editions first</p>';
    $result= mysqli_query($conn, "SELECT * FROM product ORDER BY dato ASC");

 while($row = mysqli_fetch_array($result)) {
 echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['beskrivelse'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";}      
}
else if($sort == "desc") {           
    echo '<p class="info">Showing the newest editions first</p>';
    $result= mysqli_query($conn, "SELECT * FROM product ORDER BY dato DESC");

 while($row = mysqli_fetch_array($result)) {
 echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['beskrivelse'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";}
}          

$conn->close();