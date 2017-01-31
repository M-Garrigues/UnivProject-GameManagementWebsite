<!DOCTYPE html>
<html lang="en">
<head>
  <title>StaticStick</title>
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

  <?php 
  include('includes/php/menu.php'); //INCLUSION DU MENU
  include('BD/connexion.php'); //OUVERURE DE LA BD
  ?>
  



<div class="container-fluid corpsListe">
  <div class="jumbotron" style="margin-top: 92px;">
    <h1>Bienvenue sur StaticStick</h1>
    <p>Un site fait pour gérer vos parties de jeux de société, créer des équipes, rencontrer d'autres joueurs sur la france, et bien plus encore!</p> 
  </div>
  <div class="row">
    <div class="col-sm-6 text-center" >

      <h3>Statistiques</h3>
      
      <p><?php //Nombre de joueuses 
      $query="SELECT COUNT(*) AS nbjoueuse from joueuses"; 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Nombre total de joueuses: <b>".$row['nbjoueuse']."</b>";
        }
      }
      else
        echo "Erreur: " . $query . "<br>" . $BD->error;
      ?></p>


      <p><?php //Nombre d'equipes
      $query="SELECT COUNT(*) AS nbequipe from equipes"; 
 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Nombre total d'equipe: <b>".$row['nbequipe']."</b>";
        }
      }
      else
        echo "Erreur: " . $query . "<br>" . $BD->error;
      ?></p>

      <p><?php //Nombre de jeux
      $query="SELECT COUNT(*) AS nbjeu from jeux"; 
 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Nombre total de jeux: <b>".$row['nbjeu']."</b>";
        }
      }
      else
        echo "Erreur: " . $query . "<br>" . $BD->error;
      ?></p>

      <p><?php  //Nombre de parties
      $query="SELECT COUNT(*) AS nbpartie from parties"; 
 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Nombre total de parties: <b>".$row['nbpartie']."</b>";
        }
      }
      else
      echo "Erreur: " . $query . "<br>" . $BD->error;
      ?>
      </p>
    </div>




    <div class="col-sm-6 text-center">
      <h3>Récemment</h3>
      <p><?php //derniere joueuse enregistée 
      $query="SELECT pseudoJ FROM joueuses ORDER BY IdJ DESC LIMIT 1 "; 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
        echo "Dernière joueuse créé: <b>".$row['pseudoJ']."</b>";
        }
      }
      else
      echo"Erreur: " . $query . "<br>" . $BD->error;
      ?></p>

      <p><?php //dernier equipe crée
      $query="SELECT nomE from equipes ORDER BY IdE DESC LIMIT 1";
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Dernière équipe créée: <b>".$row['nomE']."</b>";
        }
      }
      else
        echo "Erreur: " . $query . "<br>" . $BD->error;
      ?></p>

      <p><?php //dernier jeu enregisté 
      $query="SELECT nomJx FROM jeux ORDER BY IdJX DESC LIMIT 1"; 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Dernier jeu créé: <b>".$row['nomJx']."</b>";
        }
      }
      else
        echo "Erreur: " . $query . "<br>" . $BD->error;
      ?></p>

      <p><?php //Dernier jeu joué
      $query="SELECT nomJx FROM jeux NATURAL JOIN parties ORDER BY IdP DESC LIMIT 1 "; 
 
      if($res=($BD->query($query)))
      {
        while($row = $res->fetch_assoc())
        {
          echo "Dernier jeu joué: <b>".$row['nomJx']."</b>";
          break;
        }
      }
      else 
      {
        echo "Erreur: " . $query . "<br>" . $BD->error;
      }
      ?></p>
    </div>
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
