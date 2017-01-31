<!DOCTYPE html>
<html lang="en">
<head>
  <title>Joueuses</title>
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
  include('includes/php/menu.php') ; //AFFICHAGE DU MENU
  include('BD/connexion.php'); //OUVERURE DE LA BD
  ?> 

  <div class=" container corpsListe">

  <form action="nouvelleJoueuse.php">
    <button type="submit" class="btn btn-warning btn-lg centered" id='boutonCreate'>Enregistrer une nouvelle joueuse!</button>
  </form>


  <table class="table table-hover" >
    <thead>
      <tr>
        <th>Pseudo</th>
        <th>Prénom</th>
        <th>Nom</th>
        <th>Age</th>
        <th>Ville</th>
        <th>Région</th>
      </tr>
    </thead>
    <tbody>
    
    <?php
 
    $res = $BD->query("SELECT * FROM joueuses ORDER BY IdJ DESC "); //on récupère toute la table des joueuses, la plus récemment créée en première.


    while($row = $res->fetch_assoc()) //on les affiche dans un tableau tant qu'il y en a.
    {
      $tabannee = explode('-', $row["dateNJ"]);// on récupère le type date dans un tableau de forme [AAAA][MM][JJ]
      $age=2016-$tabannee[0];
   		echo"<tr>";
      echo "<td>". $row["pseudoJ"]."</td>";
      echo "<td>" . $row["prenomJ"]. "</td>";
      echo "<td>". $row["nomJ"]."</td>";
      echo "<td>" . $age. "</td>";
      echo "<td>". $row["villeJ"]."</td>";
      echo "<td>" . $row["regionJ"]. "</td>";
      echo"</tr>";

    }

    ?>

  	</tbody>
    </table>
  </div>

  <div class="stats">
  <?php
    include('includes/php/stats.php')
  ?>
  </div>

  <?php  include('includes/php/footer.php') ?>

</body>
</html>