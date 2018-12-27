<?php
  $conn = mysqli_connect("localhost", "root", "", "project_it") or die("Error");

  $which_movie=$_GET['movie_id'];

  $table_header = $conn->query("SELECT * FROM header");
  $table_about = $conn->query("SELECT * FROM about");
  $table_reviews = $conn->query("SELECT * FROM reviews");
  $table_actors = $conn->query("SELECT * FROM actors");
  $table_gallery = $conn->query("SELECT * FROM gallery");

  if($table_header->num_rows > 0)
  {
      for($i=1; $i<=$which_movie; $i++)
      {
       $row_header = $table_header->fetch_assoc();
       $row_about = $table_about->fetch_assoc();
       $row_reviews = $table_reviews->fetch_assoc();
       $row_actors = $table_actors->fetch_assoc();
       $row_gallery = $table_gallery->fetch_assoc();
      //fetch_assoc() zwraca jeden wiersz z tabeli po kolei
      }
  }

  mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title><?php echo $row_header["title"] ?> - The Best Movie</title>

  <link href="https://fonts.googleapis.com/css?family=Baloo+Tamma|Lato:400,700,700i,900|Playball&amp;subset=latin-ext" rel="stylesheet">

  <link rel="icon" href="img/icon.png">
  <link href="lib/lightbox/css/lightbox.css" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="wrapper">
  <header>  
    <nav>
      <div class="hamburger">
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="logo">
        <a href="index.php"> <h1>The <span>Best</span> Movies</h1> </a>
      </div>
      <div class="menu">
        <ul>        
          <?php
          $iterator=1;
          do {
            mysqli_data_seek($table_header,0); //przywraca wskaznik na poczatek tablicy
            for($i=1; $i<=$iterator; $i++)
            $row = $table_header->fetch_assoc();

            echo '<li><a href="main.php?movie_id=' . $iterator . '">
            <i class="fas fa-circle"></i> ' . $row["title"] . ' <i class="fas fa-circle"></i> </a></li>';            
           $iterator++;
          } while ($iterator <= mysqli_num_rows($table_header))
           ?>
           <!-- <li class="addMovie">Add Movie</li> -->
        </ul>
      </div>
      <ul id="mainUl">
        <li>Home</li>
        <li>About</li>
        <li>Reviews</li>
        <li>Actors</li>
        <li>Gallery</li>
      </ul>
    </nav>
    <div class="clearfix">
      <div class="title">
        <h1><?php echo $row_header["title"] ?></h1>
        <h2>The <span>best</span> <br> <?php echo $row_header["description"] ?> <br> of <span>all</span> time!</h2>
      </div>
      <div class="img-container">
        <!-- <div class="img" style=<php echo $row_header["image"]?> > </div> -->
        <video src=<?php echo $row_header["video"]?> muted autoplay loop playinline></video>
        <i class="fas fa-volume-mute active"></i>
        <i class="fas fa-volume-up"></i>
      </div>
      <img class="scroll" src="img/scroll.png" alt="mouse scroll image">
    </div>
  </header>
  
  <section class="about">
    <div class="transformation"></div>
    <h1>About movie</h1>
    <div class="container clearfix">
      <img class="film-reel" src="img/film_reel.png" alt="film reel image">
      <div class="left">
        <img class="poster" src=<?php echo $row_about["poster"]?> alt="poster of the movie">
        <p class="rating">
          Rate: <span class="bigger"><?php echo $row_about["rate"]?></span>/10 <i class="fas fa-star"></i> 
          <br> Based on: <span class="bigger"><?php echo $row_about["based_on"]?></span> votes</p>
      </div>
      <div class="right">
        <p class="description"><?php echo $row_about["description"]?></p>
        <div class="frame">
          <p><span class="category">Directors:  </span><?php echo $row_about["directors"]?></p>
          <p><span class="category">Writers:  </span><?php echo $row_about["writers"]?></p>
          <p><span class="category">Film genre:  </span><?php echo $row_about["genre"]?></p>
          <p><span class="category">Country:  </span><?php echo $row_about["country"]?></p>
          <p><span class="category">Premiere (world):  </span><?php echo $row_about["premiere"]?></p>
          <p><span class="category">Box office:  </span>$<?php echo $row_about["box_office"]?></p>
        </div>
      </div>
    </div>
  </section>

    <section class="reviews">
      <h1>Reviews</h1>
      <div class="review">
        <p>
        <?php echo $row_reviews["review1"] ?>
      </p>
        <div class="arrow"><i class="fas fa-arrow-down"></i></div>
      </div>

      <div class="review">
      <p>
      <?php echo $row_reviews["review2"] ?>
      </p>
      <div class="arrow"><i class="fas fa-arrow-down"></i></div>
      </div>

      <div class="review">
      <p>
      <?php echo $row_reviews["review3"] ?>
      </p>
      <div class="arrow"><i class="fas fa-arrow-down"></i></div>
      </div>
    </section>

    <section class="actors">
     <div class="diamond">
       <div data-actor-number="0" class="photo-container"
       style=<?php echo $row_actors["actor_img1"]?> ></div>
       <div data-actor-number="1" class="photo-container main-actor"
       style=<?php echo $row_actors["actor_img2"]?> ></div>
       <div data-actor-number="2" class="photo-container"
       style=<?php echo $row_actors["actor_img3"]?> ></div>

       <div class="photo-container">
        <h1>Actors</h1>
        <i class="fas fa-angle-left"></i>
        <i class="fas fa-angle-right"></i>
        <p>
          <span data-actor-number="0"><span class='lighter'>
          <?php echo $row_actors["actor_p1"]?></span> as 
          <?php echo $row_actors["actor_p1_as"]?></span>

          <span data-actor-number="1"><span class='lighter'>
          <?php echo $row_actors["actor_p2"]?></span> as 
          <?php echo $row_actors["actor_p2_as"]?></span>

          <span data-actor-number="2"><span class='lighter'>
          <?php echo $row_actors["actor_p3"]?></span> as 
          <?php echo $row_actors["actor_p3_as"]?></span>
        </p>
       </div>
      </div>
    </section>

    <section class="gallery">
      <h1>Gallery</h1>
      <div class="images">
        <?php
          $howMuchImg=$row_gallery["nr_image"];

            for($i=1; $i<=$howMuchImg; $i++){
            $which_img = $which_movie*10 + $i; //id_movie*10 to ID do nazwy zdjec
            echo '<a href="img/gallery/' . $which_img . '.jpg" data-lightbox="roadtrip"><img src="img/gallery/' . $which_img . '.jpg" alt="miniature"></a>';     
            }       
           ?>
      </div>
    </section>

    <footer>
      <p>Internet Technologies Project AEI POLSL 2018 &reg <span>Filip Lipiński</span></p>
    </footer>

  </div>

<!-- popup code: -->
<section class="modal-wrap">
  <div class="modal">
  <form class="clearfix">
    <p>Enter the access key: </p> 
    <input type="password" name="key">
    <button>OK</button>
  </form>
  <span class="hide">X</span>
  </div>
 </section>

  <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

  <script src="lib/lightbox/js/lightbox.min.js"></script>
  <script src="js/script.js"></script>  
</body>
</html>
