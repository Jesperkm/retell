<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>database</title>
</head>
<body>
<br>

    <div id="get">
        <?php 
            if(isset($_POST['submitted'])){
                include "upload.php";

            }
        ?>
    </div>
<form action="#get" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload" class="fileToUpload">
   <br>BESKRIVELSE <input type="text" name="beskrivelse">
   <br> <input type="submit" value="Submit" name="submit">
    <input type="hidden" name="submitted" value="true" />
</form>
<br><br>
<?php include "get.php"; ?>
</body>
</html>