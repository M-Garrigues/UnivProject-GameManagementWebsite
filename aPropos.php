<!DOCTYPE html>
<html lang="en">
<head>
  <title>A propos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">
    
</head>
<body>

<?php include('includes/php/menu.php'); ?>

<div class="container corps" >

  <div class="titre centered">
    <h2 class='h2Titre'>A PROPOS</h2>
  </div>

<div class="formPerso">
  <br>
	<p class="text-center">Ce site a été créé par Mathieu GARRIGUES, dans le but d'offrir un outil de gestion de parties.</p>
	<br>
  <p class="text-center">Son logo a été conçu pour s'intégrer facilement au site, offrant un aspect simple mais attirant suffisamment l'oeil. Son nom n'a pas de signification particulière sinon qu'il est un jeu de mot pour "Statistic", rappelant ainsi la vocation du site.</p>
  <br>
  <p class="text-center">Organisation de la base de données du site:</p>
  <img src="images/MeriseMG.png" alt="Merise" style="width:100%;height:500px;">
  <br>
	<p class="text-center">Il a été créé grace à W3schools.com, OpenClassroom.com, stackoverflow.com et l'université Lyon 1.</p>
</div>
</div>
<div class="stats">
  <?php
  include('includes/php/stats.php')
  ?>
</div>


<?php include('includes/php/footer.php') ?>
</body>
</html>