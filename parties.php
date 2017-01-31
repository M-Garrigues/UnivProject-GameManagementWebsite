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
  include('includes/php/menu.php') ; //AFFICHAGE DU MENU
  include('BD/connexion.php'); //OUVERTURE DE LA BD
  ?>

  <div class=" container corpsListe">


  <form action="nouvellePartie.php">
    <button type="submit" class="btn btn-warning btn-lg centered" id='boutonCreate'>Nouvelle partie</button>
  </form>
  <form action="generateurParties.php">
    <button type="submit" class="btn btn-warning btn-lg centered" id='boutonCreate'>Générer des parties</button>
  </form>

  <table class="table table-hover" >
    <thead>
      <tr>
        <th>Date</th>
        <th>Jeu</th>
        <th>Lieu</th>
        <th>En</th>
        <th>Gagnante</th>
        <th>Participantes</th>
        <th>Durée</th>
      </tr>
    </thead>
    <tbody>
    

    <?php

    $res = $BD->query("SELECT * FROM parties NATURAL JOIN jeux NATURAL JOIN lieuJ ORDER BY dateP DESC ");//on récupère toute la table des parties, la plus récemment enregistrée en première.

    while($row = $res->fetch_assoc()) //on les affiche dans un tableau tant qu'il y en a.
 	  {
      $tabannee = explode('-', $row["dateP"]); // on récupère le type date dans un tableau de forme [AAAA][MM][JJ]
      $annee=$tabannee[0];
      $mois=$tabannee[1];
      $jour=$tabannee[2];

      $tabduree = explode(':', $row["dureeP"]); // on récupère le type time dans un tableau de forme [HH][MM][SS]
      $heures=$tabduree[0];
      $minutes=$tabduree[1];
      $secondes=$tabduree[2];


      if($row["equipeP"]== "j") // partie en solo
      {
        $reqGagnante = $BD->query("SELECT pseudoJ FROM jouesolo NATURAL JOIN joueuses WHERE IdP =  ". $row["IdP"]." AND IdJ = gagneJ");       //On récupère les données pour une partie: gagnante
        $reqNbParticipantes = $BD->query("SELECT IdP, COUNT(*) AS countPt FROM jouesolo WHERE IdP = ". $row["IdP"]);//On récupère les données pour une partie: nombre de participantes

      }
      if($row["equipeP"]== "e") // partie en équipe
      {
        $reqGagnante = $BD->query("SELECT nomE FROM joueequipe NATURAL JOIN equipes WHERE IdP =  ". $row["IdP"]." AND IdE = gagneE");       //On récupère les données pour une partie: gagnante
        $reqNbParticipantes = $BD->query("SELECT IdP, COUNT(*) AS countPt FROM joueequipe WHERE IdP = ". $row["IdP"]);//On récupère les données pour une partie: nombre de participantes
        
      }

      echo"<tr>";
  
      echo "<td>".$jour."/".$mois."/".$annee;
      echo "<td>". $row["nomJx"]."</td>";
      echo "<td>" . $row["lieuJ"]. "</td>";

      $gagnante = $reqGagnante->fetch_assoc();

      if($row["equipeP"]=="j")
      {
        echo "<td>solo</td>";
        echo "<td>". $gagnante["pseudoJ"]."</td>";
      }

      else
      {
        echo "<td>équipe</td>";
        echo "<td>". $gagnante["nomE"]."</td>";
      }
           
      $nbJ = $reqNbParticipantes->fetch_assoc();
      echo "<td>". $nbJ["countPt"]."</td>";
      echo "<td>".$heures.":".$minutes.":".$secondes;
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