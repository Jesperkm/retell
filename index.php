<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>database</title>
    <link rel="stylesheet" href="style.css">
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
<nav>

    <h1>Retell A/S</h1>
<form action="#get" method="post" enctype="multipart/form-data" class="right">
    upload billede:
    <input type="file" name="fileToUpload" id="fileToUpload" class="fileToUpload" value="true">
   BESKRIVELSE <input type="text" name="beskrivelse">
   <input class="aim" type="submit" value="Tilføj produkt" name="submit">
    <input type="hidden" name="submitted" value="true" />
</form>
<br><br>
</nav>

<div class="sort">
<form action="" method="get" id="sortit">

               <p>Sort by:</p>
               <input id="asc" style="display:none;" name="dato" type="radio" value="asc" onclick="document.getElementById('sortit').submit();" />
               <label for="asc"> <p>Old</p></label>
               
               <input id="desc" style="display:none;" name="dato" type="radio" value="desc" onclick="document.getElementById('sortit').submit();"/>
               <label for="desc"> <p>New</p></label>
              <input type="hidden" name="submitted" value="true" />

            </form>
</div>
<div class="wrap">

<?php include "get.php"; ?>
</div>


</body>
</html>