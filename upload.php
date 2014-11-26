<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File Valid (" . $check["mime"] . ").<br>";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 1;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 5000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "Server: ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded. "; 

        /*insert image name to db*/
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
        $image_name = $_FILES["fileToUpload"]["name"];
        $product_name = $_POST["product_name"];
        $season_name = $_POST["season_name"];

        //insert product name and image to product table
        mysqli_query($conn, "SET AUTOCOMMIT=0");
        mysqli_query($conn, "START TRANSACTION");

        $a1 = mysqli_query($conn, "INSERT INTO product (beskrivelse, img) VALUES ('$product_name', '$image_name')") or die ('Unable to execute query. '. mysqli_error($conn));
        $a2 = mysqli_query($conn, "INSERT INTO season (season_name) VALUES ('$season_name')") or die ('Unable to execute query. '. mysqli_error($conn));

        if ($a1 and $a2) {
            mysqli_query($conn, "COMMIT");
            echo "<br>Record have been saved in the database.";
        } else {        
            mysqli_query($conn, "ROLLBACK");
            echo "<br>rollback<br>";
        }

   // $sql = "INSERT INTO product (beskrivelse, img)
   //      VALUES ('$product_name', '$image_name')";

   //      if (mysqli_query($conn, $sql)){
   //          echo "seasons did it good<br>";
   //      } else {
   //          echo "Error: " . $sql . "<br>" . mysqli_error($conn);
   //      }
        $conn->close();
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

?>