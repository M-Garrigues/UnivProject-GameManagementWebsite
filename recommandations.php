<!DOCTYPE html>
<html lang="en">
<head>
  <title>Générateur de parties</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <LINK rel="stylesheet" type="text/css" href="includes/JS/jquery-ui-1.11.4.custom/jquery-ui.css">
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">
  




</head>

<body>

<?php include("includes/php/menu.php");
      include("BD/connexion.php");?>
  


<?php

function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

$formValide = true;

$alertJoueuse = "";
$IdJ = 0;


if ($_SERVER["REQUEST_METHOD"] == "POST")                                     // LE FORMULAIRE A ETE ENVOYE, TRAITEMENT
{
  if ($_POST["joueuse"] == -1) {     //TEST DU SELECT JOUEUSE
      $alertJoueuse = "Pseudo requis!";
      $formValide = false;
    } else {
       $IdJ = test_input($_POST["joueuse"]);
  }






  if ($formValide) //LE FORMULAIRE A ETE VALIDE PRECEDEMMENT, ON TRAITE LES RESULTATS
  {

    //ON RECUPERE DES VARIABLES CONCERNANT LA JOUEUSE

    $reqJoueuse = $BD->query("SELECT * FROM joueuses WHERE IdJ = $IdJ");
    
    $rowJoueuse = $reqJoueuse->fetch_assoc();
        $pseudo = $rowJoueuse["pseudoJ"];
        $codeP = $rowJoueuse["codePJ"];
        $dateAge = $rowJoueuse["dateNJ"];

        $tabannee = explode('-', $dateAge);// on récupère le type date dans un tableau de forme [AAAA][MM][JJ]
        $age=2016-$tabannee[0];
        $dpt=substr($codeP, 0,2); //ON RECUPERE LES DEUX PREMIERS CHIFFRES DU CODE POSTAL POUR AVOIR LE DEPARTEMENT



    $requeteCategoMaxParJoueuse = $BD->query("SELECT IdC, nomC, COUNT(IdC) AS nb_parties FROM joueuses NATURAL JOIN jouesolo NATURAL JOIN parties NATURAL JOIN jeux NATURAL JOIN appartient NATURAL JOIN categories WHERE IdJ = $IdJ GROUP BY IdC ORDER BY nb_parties DESC  ");

    $rowCategoMaxParJoueuse = $requeteCategoMaxParJoueuse->fetch_assoc();
      $IdCMax = $rowCategoMaxParJoueuse["IdC"];
      $nomCMAX = $rowCategoMaxParJoueuse["nomC"]; // ID ET NOM DE LA CATEGORIE LA PLUS JOUEE PAR LA JOUEUSE

    

    $requeteJeuMaxParJoueuse = $BD->query("SELECT IdJx, nomJx, COUNT(IdJx) AS nb_parties FROM joueuses NATURAL JOIN jouesolo NATURAL JOIN parties NATURAL JOIN jeux WHERE IdJ = $IdJ GROUP BY IdJx ORDER BY nb_parties DESC ");

    $rowJeuMaxParJoueuse = $requeteJeuMaxParJoueuse->fetch_assoc();
      $IdJxMax = $rowJeuMaxParJoueuse["IdJx"];
      $nomJxMAX = $rowJeuMaxParJoueuse["nomJx"];  // ID ET NOM DU JEU LE PLUS JOUE PAR LA JOUEUSE


    $requeteNbPartiesParJoueuse = $BD->query("SELECT IdJ, COUNT(*) AS nb_parties FROM `joueuses` NATURAL JOIN jouesolo WHERE IdJ = $IdJ ");

    $rowNbPartiesParJoueuse = $requeteNbPartiesParJoueuse->fetch_assoc();
      $nbParties = $rowNbPartiesParJoueuse["nb_parties"]; // NOMBRE DE PARTIES TOTAL FAITES PAR LA JOUEUSE



    //ON CHERCHE DES RECOMMANDATIONS A PARTIR DE CES DONNEES


    // RECOMMANDATION DE JOUEUSE

    $rqtTouteJoueuse = $BD->query("SELECT * FROM joueuses WHERE IdJ != $IdJ"); // ON RECUPERE TOUTES LES JOUEUSES SAUF CELLE SELECTIONNEE


    $IdJSugg = 0;//ID DE LA JOUEUSE SUGGEREE
    $pseudoJSugg = '';
    $SCOREMAX = 0;//SCORE DE LA JOUEUSE SUGGEREE


    while ($rowJoueuse = $rqtTouteJoueuse->fetch_assoc()) //TANT QU'IL Y A DES JOUEUSES ON BOUCLE
    {

      $SCOREJ = 0;//SCORE  DE CHAQUE JOUEUSE POUR LA SUGGESTION

      $IdJoueuse = $rowJoueuse["IdJ"];
      $pseudoJ = $rowJoueuse["pseudoJ"];
      $codePJ = $rowJoueuse["codePJ"];
      $dateAgeJ = $rowJoueuse["dateNJ"];

      $tabannee = explode('-', $dateAgeJ);// on récupère le type date dans un tableau de forme [AAAA][MM][JJ]
      $ageJ=2016-$tabannee[0];
      $dptJ=substr($codeP, 0,2); //ON RECUPERE LES DEUX PREMIERS CHIFFRES DU CODE POSTAL POUR AVOIR LE DEPARTEMENT


      $requeteCategoMaxParJoueuse = $BD->query("SELECT IdC, nomC, COUNT(IdC) AS nb_parties FROM joueuses NATURAL JOIN jouesolo NATURAL JOIN parties NATURAL JOIN jeux NATURAL JOIN appartient NATURAL JOIN categories WHERE IdJ = $IdJoueuse GROUP BY IdC ORDER BY nb_parties DESC  ");

      $rowCategoMaxParJoueuse = $requeteCategoMaxParJoueuse->fetch_assoc();
        $IdCMaxJ = $rowCategoMaxParJoueuse["IdC"];//CATEGORIE LA PLUS JOUEE PAR LA JOUEUSE
    

      $requeteJeuMaxParJoueuse = $BD->query("SELECT IdJx, nomJx, COUNT(IdJx) AS nb_parties FROM joueuses NATURAL JOIN jouesolo NATURAL JOIN parties NATURAL JOIN jeux WHERE IdJ = $IdJoueuse GROUP BY IdJx ORDER BY nb_parties DESC ");

      $rowJeuMaxParJoueuse = $requeteJeuMaxParJoueuse->fetch_assoc();
        $IdJxMaxJ = $rowJeuMaxParJoueuse["IdJx"];//JEU LE PLUS JOUE PAR LA JOUEUSE
        


      //CALCUL DU SCORE DE LA JOUEUSE

      if ($codePJ == $codeP) $SCOREJ = $SCOREJ + 80; //MEME VILLE
      else if ($dptJ == $dpt) $SCOREJ = $SCOREJ + 30;// MEME DEPARTEMENT

      if (($ageJ > $age + 5)&&($ageJ < $age -5)) $SCOREJ = $SCOREJ + 20; // SCORE EN FONCTION DE LA DIFFERENCE D'AGE
      else if (($ageJ > $age + 15)&&($ageJ < $age -15)) $SCOREJ = $SCOREJ + 10;

      if ($IdJxMaxJ == $IdJxMax) $SCOREJ = $SCOREJ + 40; // MEME JEU LE PLUS JOUE

      if ($IdCMaxJ == $IdCMax) $SCOREJ = $SCOREJ + 25; // MEME CATEGORIE DE JEU LA PLUS JOUEE
      

      //COMPARAISON SCORE JOUEUSE AVEC SCORE MAX

      if ($SCOREJ > $SCOREMAX) {
        $IdJSugg = $IdJoueuse;
        $pseudoJSugg = $pseudoJ;
        $SCOREMAX = $SCOREJ;
      }


    }




    //RECOMMANDATION DE JEU



    $nbPartiesMin = 9999;
    $IdJxSugg = 0;
    $nomJxSugg = "";

    $rqtTousJeux = $BD->query("SELECT * FROM jeux NATURAL JOIN appartient NATURAL JOIN categories WHERE IdJx != $IdJxMax AND IdC = $IdCMax"); //REQUETE DE JEUX DIFFERENTS DU JEU LE PLUS JOUE APPARTENANT A LA CATEGORIE LA PLUS JOUEE

    if($rqtTousJeux != false)//ON A TROUVE AU MOINS UN JEU DANS LA CATEGORIE MAX.
    {
      while ($rowJeuxParCatego = $rqtTousJeux->fetch_assoc()) 
      {
        $rqtPartiesJouees = $BD->query("SELECT COUNT(*) AS nb_parties FROM jouesolo NATURAL JOIN parties WHERE IdJ = $IdJ AND IdJx =".$rowJeuxParCatego["IdJx"]); //NOMBRE DE PARTIES JOUEES PAR UNE JOUEUSE POUR UN JEU

        $nbPartiesJouees = $rqtPartiesJouees->fetch_assoc();

        if ($nbPartiesJouees["nb_parties"] < $nbPartiesMin) 
        {
          $IdJxSugg = $rowJeuxParCatego["IdJx"];
          $nomJxSugg = $rowJeuxParCatego["nomJx"];
          $nbPartiesMin = $nbPartiesJouees["nb_parties"];
        }

      }
    }

    if ($IdJxSugg == 0) $nomJxSugg = "Il n'existe pas encore assez jeux (ou de parties) pour une bonne recommandation.";
   
  }
}
?>








<?php if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"): // PAGE D'AFFICHAGE DU RESULTAT?> 


<div class="container corps">
  
  <div class="formPerso" id="form1">
      <h3>Profil: <?php echo $pseudo; ?> </h3>

      <p class="text-center">Nombre de parties disputées : <b><?php echo $nbParties ?></b></p> 
      <br>
      <br>
      <p class="text-center">Jeu le plus joué : <b><?php echo $nomJxMAX ?></b></p>
      <br>
      <br>
      <p class="text-center">Catégorie la plus jouée : <b><?php echo $nomCMAX ?></b></p>
  </div>


  <div class="formPerso" id="form2">
      <h3>Recommandations :</h3>

      <p class="text-center">Joueuse que vous aimeriez peut-être rencontrer : <b><?php echo $pseudoJSugg ?></b></p> 
      <br>
      <br>
      <p class="text-center">Jeu auquel vous aimeriez surement jouer : <b><?php echo $nomJxSugg ?></b></p> 
  </div>





</div>


<?php else : // PAGE DE FORMULAIRE ?>





<div class="container corps">
  
  <div class="titre centered">
    <h2 class="h2Titre"> Profil et recommandations </h2>
  </div>

  <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formJ" >
    <div class="formPerso">
      <h3>Variez les plaisirs!</h3>

      <p>Ce site vous propose de voir votre profil de joueuse, et ce faisant vous propose des recommandations, que ce soit d'autres joueuses à rencontrer ou 
       de nouveaux jeux auxquels jouer! Laissez vous tenter!</p>
      
      
      <div class="form-group">
        <label class="col-sm-4 control-label" for="joueuse">Vous êtes:</label>
        <div class="col-sm-4">
          <select class='sel' name="joueuse" id="joueuse" style='display:block;'>;
            <?php
            $res = $BD->query("SELECT IdJ,pseudoJ FROM joueuses");
            
            echo "<option value='-1'>Joueuses</option>"; //VALEUR PAR DEFAUIT DE VALUE POUR EVITER DES ERREURS DE SAISIE
            while($row = $res->fetch_assoc())
                  echo "<option value=".$row['IdJ']." >".$row['pseudoJ']."</option>";         
            ?>
          </select>
        </div>
        <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <?php echo $alertJoueuse;?>
        </div>  
      </div>
    </div>
    <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Accéder</button>  
  </form>











</div>







<?php endif; ?>




<div class="stats">
  <?php include("includes/php/stats.php"); ?>
</div>

<?php include("includes/php/footer.php"); ?>
</body>
</html>