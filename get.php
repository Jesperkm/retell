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

//SORTING DATE

if (isset($_GET['dato'])){
    $sort = $_GET['dato'];

    //SORT BY OLD
    if ($sort == "asc") {          
        echo '<p class="info">Showing the elder editions first</p>';
        $result= mysqli_query($conn, "SELECT * FROM product ORDER BY dato ASC");

        while($row = mysqli_fetch_array($result)) {
         echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
        }      
    }



    //SORT BY NEW
    if($sort == "desc") {           
        echo '<p class="info">Showing the newest editions first</p>';
        $result= mysqli_query($conn, "SELECT * FROM product ORDER BY dato DESC");

        while($row = mysqli_fetch_array($result)) {
         echo "<div class='sized'>" 
         . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
        }
    }

     //unsorted Random from beginning.
   if($sort != "desc" && $sort != "asc"){
        echo '<p class="info">Browse our files</p>';
        $result= mysqli_query($conn, "SELECT * FROM product ORDER BY dato DESC");

        while($row = mysqli_fetch_array($result)) {
            echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
        }                 
    }
}

    //SORTING SEASON
    if (isset($_GET['season'])){
        $season_sort = $_GET['season'];

        //SORT BY Season: summer
        if ($season_sort == "summer") {          
            echo '<p class="info">SUMMER</p>';
            $result= mysqli_query($conn, "SELECT * FROM product WHERE seasonID = '2' ORDER BY dato DESC");

            while($row = mysqli_fetch_array($result)) {
             echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
            }      
        }

        //SORT BY Season: Spring
        if ($season_sort == "spring") {          
            echo '<p class="info">Spring</p>';
            $result= mysqli_query($conn, "SELECT * FROM product WHERE seasonID = '3' ORDER BY dato DESC");

            while($row = mysqli_fetch_array($result)) {
             echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
            }
        }

        //SORT BY Season: Fall
        if ($season_sort == "fall") {          
            echo '<p class="info">Fall</p>';
            $result= mysqli_query($conn, "SELECT * FROM season_product_view WHERE seasonID = '4'");

            while($row = mysqli_fetch_array($result)) {
             echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['product_img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['season_name'] . "</p>";
            }      
        }

        //SORT BY Season: Winter
        if ($season_sort == "winter") {          
            echo '<p class="info">Winter</p>';
            $result= mysqli_query($conn, "SELECT * FROM product WHERE seasonID = '1' ORDER BY dato DESC");

            while($row = mysqli_fetch_array($result)) {
             echo "<div class='sized'>" . "<img class='image' src='uploads/",$row['img'],"' width='320px' height='' />" . "<br>" . "<p class='title'>" . $row['product_name'] . "</p>" . "<p class='date'>" . $row['dato'] . "</p>" . "</div>";
            }      
        }
    }

$conn->close();