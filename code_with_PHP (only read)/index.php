<?php
  $conn = mysqli_connect("localhost", "root", "", "project_it") or die("Error");

  $table_header = $conn->query("SELECT * FROM header");

  mysqli_close($conn);
?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>The Best Movies!</title>
  <link rel="icon" href="img/icon.png">
  
  <link href="https://fonts.googleapis.com/css?family=Lato:400,900|Playball&amp;subset=latin-ext" rel="stylesheet">
  
  <link rel="stylesheet" href="css/style_index.css">
</head>
<body>
  <main>
    <div class="logo">
      <a href="index.php"> <h1>The <span>Best</span> Movies</h1> </a>
    </div>
    <nav>
      <ul>
        <?php
          $iterator=1;
          do {
            mysqli_data_seek($table_header,0); 
            for($i=1; $i<=$iterator; $i++)
            $row = $table_header->fetch_assoc();

            echo '<li><a href="main.php?movie_id=' . $iterator . '">' . $row["title"] . '</a></li>';            
           $iterator++;
          } while ($iterator <= mysqli_num_rows($table_header))
           ?>
      </ul>
    </nav>
  </main>
</body>
</html>