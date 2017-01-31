<!DOCTYPE html>
<html lang="en">
<head>
  <title>Equipes</title>
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
  include('includes/php/menu.php') ; //INSERTION MENU
  include('BD/connexion.php'); //OUVERTURE DE LA BD
  ?>

  <div class=" container corpsListe">


  <form action="nouvelleEquipe.php">
    <button type="submit" class="btn btn-warning btn-lg centered" id='boutonCreate'>Créer une nouvelle équipe!</button>
  </form>

  <table class="table table-hover" >
    <thead>
      <tr>
        <th>Nom</th>
        <th>Devise</th>
        <th>Date de création</th>
        <th>Privée</th>
        <th>Nombre de joueuses</th>
      </tr>
    </thead>
    <tbody>
  
    <?php

    $i = 0;
    $res = $BD->query("SELECT * FROM equipes ORDER BY IdE DESC ");//ON RECUPERE TOUTE LA TABLE DES EQUIPES
    //LA PLUS RECEMMENT CREE EN PREMIER

    while(($row = $res->fetch_assoc()) && ( $i<40)) //on les affiche dans un tableau tant qu'il y en a.
 	  {
      $tabannee = explode('-', $row["dateCreatE"]); // on récupère le type date dans un tableau de forme [AAAA][MM][JJ]
      $annee=$tabannee[0];
      $mois=$tabannee[1];
      $jour=$tabannee[2];

 		  echo"<tr>";
        
      echo "<td>" . $row["nomE"]. "</td>";
      echo "<td>" . $row["deviseE"]. "</td>";
      echo "<td>".$jour."/".$mois."/".$annee;
      if($row["publiqueE"]==1)
        echo "<td> oui</td>";
      else            
        echo "<td> non</td>";
      $compteur = $BD->query("SELECT IdE, COUNT(*) AS countJ FROM equipes NATURAL JOIN rejoint WHERE IdE = ". $row["IdE"]); // on compte le nombre de joueurs par équipe!
      $nbJ = $compteur->fetch_assoc();
      echo "<td>". $nbJ["countJ"]."</td>";
      echo"</tr>";

      $i++;
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