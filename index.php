<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>database</title>
    <link rel="stylesheet" href="style.css">
    <script src="pace.js"></script>
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

    <a href="http://localhost/databasetesting/"><h1>Retell A/S</h1></a>
<form action="#get" method="post" enctype="multipart/form-data" class="right">
    upload billede:
    <input type="file" name="fileToUpload" id="fileToUpload" class="fileToUpload" value="true">
   Navn <input type="text" name="product_name">

<?php
      include 'init.php';

        $result= mysqli_query($conn, "SELECT * FROM season");
        echo " <select name='season_name'>";
        while($row = mysqli_fetch_array($result)) {
         echo "<option value='".$row['seasonID']."'>" . $row['season_name'] . "</option>";
        }
        echo "</select>";

        $conn->close();
?>
   <input class="aim" type="submit" value="Tilføj produkt" name="submit">
    <input type="hidden" name="submitted" value="true" />
</form>
<br><br>
</nav>

<div class="sort">
<form action="" method="get" id="sortit" value="none">

               <p>Sort by:</p>
               <input id="asc" style="display:none;" name="dato" type="radio" value="asc" onclick="document.getElementById('sortit').submit();" />
               <label for="asc"> <p>Old</p></label>
               
               <input id="desc" style="display:none;" name="dato" type="radio" value="desc" onclick="document.getElementById('sortit').submit();"/>
               <label for="desc"> <p>New</p></label>

               <input id="summer" style="display:none;" name="season" type="radio" value="summer" onclick="document.getElementById('sortit').submit();"/>
               <label for="summer"> <p>Summer</p></label>

               <input id="spring" style="display:none;" name="season" type="radio" value="spring" onclick="document.getElementById('sortit').submit();"/>
               <label for="spring"> <p>spring</p></label>

               <input id="fall" style="display:none;" name="season" type="radio" value="fall" onclick="document.getElementById('sortit').submit();"/>
               <label for="fall"> <p>fall</p></label>

               <input id="winter" style="display:none;" name="season" type="radio" value="winter" onclick="document.getElementById('sortit').submit();"/>
               <label for="winter"> <p>winter</p></label>

               <input type="hidden" name="submitted" value="true" />
<!-- 


                <select name="season_sort">
                  <option value="winter" onclick="document.getElementById('sortit').submit();">Winter</option>
                  <option value="fall">Fall</option>
                  <option value="spring">Spring</option>
                  <option value="summer">Summer</option>
                </select> -->

            </form>
</div>
<div class="wrap">

<?php include "get.php"; ?>
</div>


</body>
</html>