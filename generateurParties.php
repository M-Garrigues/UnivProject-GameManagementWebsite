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
  <script src='includes/JS/jquery-ui-1.11.4.custom/jquery-ui.min.js'></script>

  <script>
  /*INITIALISATION DES OPTIONS DE DATEPICKER*/
  $(document).ready(function()
  {      
    $.datepicker.setDefaults({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true});
    $("#datepicker").css('display','none');
  });

  /*LE CALENDRIER*/
  $(function() {
    $("#datepicker").datepicker( {        

      beforeShowDay: function(date) {
        var dateMin = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#dateMin").val());
        var dateMax = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#dateMax").val());              
        return [true, dateMin && ((date.getTime() == dateMin.getTime()) || (dateMax && date >= dateMin && date <= dateMax)) ? "dp-highlight" : ""];                  
      },
        
      onSelect: function(dateText, inst) {
        var dateMin = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#dateMin").val());
        var dateMax = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#dateMax").val());
        
        if (!dateMin || dateMax) {
          $("#dateMin").val(dateText);
          $("#dateMax").val("");            
          $(this).datepicker("option", "minDate", dateText);                        
          $("#datepicker").css('display','none');
        } else {
          $("#dateMax").val(dateText);
          $(this).datepicker("option", "minDate", null);
          $("#datepicker").css('display','none');
        }
      }
    });
   });


  function afficheJeu(){ //AFFICHE LES JEUX SI CHOISI

    if ($("#choixGP_Jx").prop("checked"))
      $("#divJeuGP").show();
    else
      $("#divJeuGP").hide();
  }

  function afficheLieu(){ //AFFICHE LES LIEUX SI CHOISI

    if ($("#choixGP_L").prop("checked"))
      $("#divLieuGP").show();
    else
      $("#divLieuGP").hide();
  }

  $(function() { //SLIDER SUR NOMBE DE PARTIES
    $( "#nbP" ).slider({
      min: 1,
      max: 100,
      value: 20,
            slide: function( event, ui ) {
        $( "#valeurNbP" ).val( ui.value );
      }
    });
    $( "#valeurNbP" ).val( $( "#nbP" ).slider( "value" ) );     
  });

  $(function() { //SLIDER SUR LE SCORE
    $( "#itScore" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#valeurItScore" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#valeurItScore" ).val( "" + $( "#itScore" ).slider( "values", 0 ) +
      " - " + $( "#itScore" ).slider( "values", 1 ) );
  });


  </script>

</head>


<body>

  <?php 
  include('BD/connexion.php');//OUVERTURE BASE DE DONNEES
  include('includes/php/menu.php');//INCLUSION DU MENU

  function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

  ?>

  <?php

  // VERIFICATION FORMULAIRE PHP

  $formValide=true;

  $alertNbP = $alertItScore = $alertDuree = $alertDate = $alertJeuGP = $alertLieuGP = "";     //ON DEFINIR LES MESSAGES D'ERREUR
  $dateMin = $dateMax = $choixGP_Jx  = $choixGP_L ="";          //ON DEFINIT LES VARIABLES RECUPEREES
  $nbP = $hmin = $hmax = $mmin = $mmax = $smin = $smax = 0;

  if ($_SERVER["REQUEST_METHOD"] == "POST")
  { 

    //TEST NOMBRE DE PARTIES DEMANDEES

    if (empty($_POST["valeurNbP"])) {     
      $alertNbP = "Nombre requis";
      $formValide = false;
    } 
    else 
    {
      $alertNbP = "";
      $nbP = test_input($_POST["valeurNbP"]);
    }
 
    //TEST DE L'INTERVALLE DE SCORE

    if (empty($_POST["valeurItScore"])) {   
     $alertItScore = "Scores requis";
      $formValide = false;
    } else {
      $alertItScore = "";
      $scores = explode(" - ", $_POST["valeurItScore"]);
      $scoreMax = $scores[1];
      $scoreMin = $scores[0];
    }

    //TEST DES DUREES

    $supOk = true;

    $dureeMin = $_POST["hmin"].":".$_POST["mmin"].":".$_POST["smin"];// DUREES MIN/MAX UTILES POUR LA GEN. ALEATOIRE
    $dureeMax = $_POST["hmax"].":".$_POST["mmax"].":".$_POST["smax"];

    if (($_POST["hmin"]==-1)||
      ($_POST["hmax"]==-1)||
      ($_POST["mmin"]==-1)||
      ($_POST["mmax"]==-1)||
      ($_POST["smin"]==-1)||
      ($_POST["smax"]==-1)) {     //TEST DE TOUS LES CHAMPS DES DUREES MIN/MAX
        $alertDuree = "Les deux durées requises";
        $formValide = false;
    } else if($_POST["hmin"] > $_POST["hmax"]) $supOk = false;
    else if($_POST["hmin"] == $_POST["hmax"]&&$_POST["mmin"]>$_POST["mmax"]) $supOk = false;
    else if($_POST["hmin"] == $_POST["hmax"]&&$_POST["mmin"]==$_POST["mmax"]&&$_POST["smin"]>$_POST["smax"]) $supOk = false;
    else
    {
      $alertDate = "";

      $hmin = test_input($_POST["hmin"]); // CHAMPS VALIDES
      $hmax = test_input($_POST["hmax"]);
      $mmin = test_input($_POST["mmin"]);
      $mmax = test_input($_POST["mmax"]);
      $smin = test_input($_POST["smin"]);
      $smax = test_input($_POST["smax"]);
    }   

    if (!$supOk) { // SI LA DATE MIN EST SUPERIEUR A LA DATE MAX
      $alertDuree = "Durée min < durée max";
      $formValide = false;
    }

    //TEST DES DATES

    $supOk = true;

    $dateMin = $_POST["dateMin"];
    $dateMax = $_POST["dateMax"];

    $dateExplodeMin = explode("-",$dateMin);
    $dateExplodeMax = explode("-",$dateMax);

    if (!(($_POST["dateMin"]=="")||($_POST["dateMax"]==""))) {
      $aMin = $dateExplodeMin[0];
      $mMin = $dateExplodeMin[1];
      $sMin = $dateExplodeMin[2];

      $aMax = $dateExplodeMax[0];
      $mMax = $dateExplodeMax[1];
      $sMax = $dateExplodeMax[2];}

    if (($_POST["dateMin"]=="")||
    ($_POST["dateMax"]=="")) {     //TEST DE TOUS LES CHAMPS DES DATES
      $alertDate = "Les deux dates requises";
      $formValide = false;
    } else if($aMin > $aMax) $supOk = false;
    else if($aMin == $aMax&&$mMin>$mMax) $supOk = false;
    else if($aMin == $aMax&&$mMin == $mMax && $sMin > $sMax) $supOk = false;
    else
    {
      $alertDate = "";
      $dateMin = test_input($_POST["dateMin"]); // CHAMPS VALIDES
      $dateMax = test_input($_POST["dateMax"]);
    }

    if (!$supOk) { // SI LA DATE MIN EST SUPERIEUR A LA DATE MAX
      $alertDate = "Date min < date max";
      $formValide = false;
    }

    //TEST DU JEU


    if (($_POST["jeuGP"] == -1)&& (!empty($_POST["choixGP_Jx"]))) { 
      $alertJeuGP = "Jeu requis si sélectionné";
      $formValide = false;
    } else {
      $alertMdp = "";
      $jeu = test_input($_POST["jeuGP"]);
    }

    // TEST DU LIEU

    if (($_POST["lieuGP"] == -1)&& (!empty($_POST["choixGP_L"]))) {     
      $alertLieuGP = "Lieu requis si sélectionné";
      $formValide = false;
    } else {
      $alertLieuGP = "";
      $lieu = test_input($_POST["lieuGP"]);
    }
  }

  if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST")                                              // SQL DE REMPLISSAGE ALEATOIRE EN FONCTION DES PARAMETRES
  {

  //RECUPERATION DONNEES NECESSAIRES A LA GENERATION

    $reqNbEquipes = $BD->query("SELECT  COUNT(*) AS countEquipe FROM equipes"); //REQUETE POUR LE NOMBRE D'EQUIPES EXISTANTES
    $rowNbEquipes = $reqNbEquipes->fetch_assoc();
    $nbEquipes = $rowNbEquipes["countEquipe"];    // Nombre d'équipes existantes

    $reqNbJoueuses = $BD->query("SELECT COUNT(*) AS countJoueuse FROM joueuses");//REQUETE POUR LE NOMBRE DE JOUEUSES EXISTANTES
    $rowNbJoueuses = $reqNbJoueuses->fetch_assoc();
    $nbJoueuses = $rowNbJoueuses["countJoueuse"]; // Nombre de joueuses existantes
    

    if($nbEquipes < 20 || $nbJoueuses < 20 ) // LE NOMBRE D'EQUIPES ET/OU DE JOUEUSES N'EST PSA SUFFISANT POUR POUVOIR GENERER
    {
      $messagePost= "Le nombre d'équipes ou de joueuses n'est pas suffisant: il en faut au moins 20 de chaque pour que la génération aléatoire puisse se faire.";
    }
    else
    {
      for ($i=0; $i < $nbP ; $i++) { // ON CREE LES PARTIES
      //REMPLISSAGE ALEATOIRE DES VARIABLES NECESSAIRES A LA CREATION D'UNE PARTIE
        $ranCEJ = rand(0,1); // CHOIX ALEATOIRE PARTIE EN EQUIPE OU EN SOLO

        if ($ranCEJ ==0)  
          $choixEJ = 'e';
        else    
          $choixEJ = 'j';

      if(empty($_POST["choixGP_Jx"])){
        $reqJeuGP = $BD->query("SELECT IdJx FROM jeux ORDER BY RAND() LIMIT 1");   // CHOIX ALEATOIRE DU JEU S'IL N'A PAS ETE INDIQUE
        $rowJeuGP = $reqJeuGP->fetch_assoc();
        $jeu = $rowJeuGP["IdJx"];    
      } 

      if(empty($_POST["choixGP_L"]))
      {
        $reqLieuGP = $BD->query("SELECT IdL FROM lieuJ ORDER BY RAND() LIMIT 1");   // CHOIX ALEATOIRE DU LIEU S'IL N'A PAS ETE INDIQUE
        $rowLieuGP = $reqLieuGP->fetch_assoc();
        $lieu = $rowLieuGP["IdL"];
       } 

      $dateRanMin = strtotime($dateMin); // ON CONVERTIT LES DATES MIN/MAX EN CHIFFRES POUR POUVOIR LES COMPARER FACILEMENT
      $dateRanMax = strtotime($dateMax);

      $dateRan = date("Y-m-d", rand($dateRanMin, $dateRanMax)); // DATE ALEATOIRE ENTRE LES DATES MIN/MAX

      $dureeRanMin = strtotime($dureeMin); // ON CONVERTIT LES DUREES MIN/MAX EN CHIFFRES POUR POUVOIR LES COMPARER FACILEMENT
      $dureeRanMax = strtotime($dureeMax);

      $dureeRan = date("H:i:s", rand($dureeRanMin, $dureeRanMax)); // DUREE ALEATOIRE ENTRE LES DUREES MIN/MAX
  
      $scoreRan = rand($scoreMin, $scoreMax); // SCORE ALEATOIRE ENTRE SCORES MIN/MAX

      $reqMinMaxJx = $BD->query("SELECT joueursMinJx, joueursMaxJx FROM jeux WHERE IdJx = ".$jeu); // ON RECUPERE LES JOUEURS MINIMAUX ET MAXIMAUX POUR UN JEU
      $rowMinMax = $reqMinMaxJx->fetch_assoc();
      $pMin = $rowMinMax["joueursMinJx"];
      $pMax = $rowMinMax["joueursMaxJx"];

      $nbParticipantes = rand($pMin, $pMax); //ON DETERMINE LE NOMBRE DE PARTICIPANTES

      $messagePost = "Parties aléatoires créées avec succès!";

      //SQL DE LA CREATION DE PARTIE (COMMUNE A EQUIPE OU SOLO)

       $rqtPartieRandom = ("INSERT INTO parties (dateP,equipeP,idJx,idL,dureeP)
        VALUES ( '$dateRan','$choixEJ','$jeu','$lieu','$dureeRan')"); //REQUETE D'INSERTION DE LA PARTIE ALEATOIRE

      if(!($BD->query($rqtPartieRandom)))
      {
        $messagePost ="Erreur: " . $rqtRempl . "<br>" . $BD->error;
      }
      else
      {
        $last_idP = mysqli_insert_id($BD);//ON RECUPERE L'ID DE LA DERNIERE PARTIE INSEREE

        if ($ranCEJ == 0) //PARTIE PAR EQUIPE
        {           
          $gagnante = -1;

          $reqEquipesParticipantes = $BD->query("SELECT IdE FROM equipes ORDER BY RAND() LIMIT ".$nbParticipantes); //ON VA CHERCHER LES EQUIPES QUI PARTICIPENT A CETTE PARTIE

          while($rowEquipes = $reqEquipesParticipantes->fetch_assoc())// ON PARCOURT TOUTES LES EQUIPES
          {
              if($gagnante == -1) $gagnante = $rowEquipes["IdE"]; // LA PREMIERE EQUIPE TROUVEE EST DESIGNEE GAGNANTE

              $rqtPartieRandomEquipe = "INSERT INTO joueequipe (ScoreEquipes,gagneE,IdE,IdP) 
              VALUES ('$scoreRan', '$gagnante' , ".$rowEquipes['IdE']." , '$last_idP')"; // REQUETE D'INSERTION DANS JOUEEQUIPE

              if(!($BD->query($rqtPartieRandomEquipe)))
              {
               $messagePost ="Erreur: " . $rqtPartieRandomEquipe . "<br>" . $BD->error;
              }
           }

        }
        else        // PARTIE SOLO
        {
          $gagnante = -1;

          $reqJoueusesParticipantes = $BD->query("SELECT IdJ FROM joueuses ORDER BY RAND() LIMIT ".$nbParticipantes); //ON VA CHERCHER LES JOUEUSES QUI PARTICIPENT A CETTE PARTIE

          while($rowJoueuses = $reqJoueusesParticipantes->fetch_assoc()) // ON PARCOURT TOUTES LES JOUEUSES
            {
              if($gagnante == -1) $gagnante = $rowJoueuses["IdJ"]; // LA PREMIERE JOUEUSE TROUVEE EST DESIGNEE GAGNANTE

              $rqtPartieRandomSolo = "INSERT INTO joueSolo (ScoreSolo,gagneJ,IdJ,IdP) 
              VALUES ('$scoreRan', '$gagnante' , ".$rowJoueuses['IdJ']." , '$last_idP')"; // REQUETE D'INSERTION DANS JOUESOLO

              if(!($BD->query($rqtPartieRandomSolo)))
                $messagePost ="Erreur: " . $rqtPartieRandomSolo . "<br>" . $BD->error;
             
            }
          }
        }
      }
    }
  }
  ?>

  <?php if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"): //AFFICHAGE REUSSITE CREATION OU NON ?>

  <div class="container corps">

    <div class="titre centered">
      <h2 class='h2Titre'>GENERATEUR DE PARTIES</h2>
    </div>
    <br>
    <p class="text-center"><?php echo $messagePost; ?></p>

  </div>

  <?php else: //AFFICHAGE FORMULAIRE?>

  <div class="container corps">
    <div class="titre centered">
      <h2 class='h2Titre'>GENERATEUR DE PARTIES</h2>
    </div>

    <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formGP" >
      <div class="container-fluid formPerso">
    
        <h3>Paramètres</h3>
      
        <div class="form-group">
          <label class="col-sm-4 control-label" for="nbP">Nombre de parties à générer:</label>
          <div class="col-sm-4">
            <input type="text" id="valeurNbP" name="valeurNbP" readonly style="border:0; color:#f6931f; font-weight:bold;">
            <div id="nbP" name="nbP" style="border: color:#f6931f ;width=200px;"></div>
          </div>
         <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php echo $alertNbP;?>
        </div>  
        </div>
    
        <div class="form-group" >
          <label class="col-sm-4 control-label" for="VD">Résultat:</label>
          <div class="col-sm-4" style="margin-top:5px;">
          <input type="radio" name="VD" id="B_V" value="v" checked > <label for="B_V">Victoire</label>
          &nbsp;
          <input type="radio" name="VD" id="B_D" value="d"         > <label for="B_D">Défaite</label>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-4 control-label" for="itScore">Intervalle score :</label>
          <div class="col-sm-4">
            <input type="text" id="valeurItScore" name="valeurItScore" readonly style="border:0; color:#f6931f; font-weight:bold;">
            <div id="itScore" name="itScore" style="border: color:#f6931f ;width=200px;"></div>
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php echo $alertItScore;?>
          </div>  
        </div>
     
        <div class="form-group" >
          <label for="hmin" class=" control-label col-sm-4"> Durée minimale:</label>
          <div class="col-sm-4 ">
            <select class='sel' name='hmin' id='hmin'>
              <option value='-1'>HH</option>
              <?php
              for($i=0; $i<24;$i++)   
                echo "<option value=$i>$i</option>";
              ?>
            </select>

            <select class='sel' name='mmin' id='mmin' >
              <option value='-1'>MM</option>
              <?php
              for($j=0; $j<60;$j++)   
                echo "<option value=$j>$j</option>";
              ?>
            </select>

            <select class='sel' name='smin' id='smin' >
              <option value='-1'>SS</option>
              <?php
              for($k=0; $k<60;$k++)   
                echo "<option value=$k>$k</option>";
              ?>
            </select>
          </div>

          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php echo $alertDuree;?>
          </div> 

        </div>

    
        <div class="form-group" >
          <label for="hmax" class=" control-label col-sm-4"> Durée maximale:</label>
        
          <div class="col-sm-4 ">
            <select class='sel' name='hmax' id='hmax'>
              <option value='-1'>HH</option>
              <?php
              for($i=0; $i<24;$i++)   
                echo "<option value=$i>$i</option>";
              ?>
            </select>

            <select class='sel' name='mmax' id='mmax' >
              <option value='-1'>MM</option>
              <?php
              for($j=0; $j<60;$j++)   
                echo "<option value=$j>$j</option>";
              ?>
            </select>

            <select class='sel' name='smax' id='smax' >
              <option value='-1'>SS</option>
              <?php
              for($k=0; $k<60;$k++)   
                echo "<option value=$k>$k</option>";
              ?>
            </select>
            
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php// echo $alertJeu;?>
          </div> 
        </div>


        <div class="form-group">
          <label class="col-sm-4 control-label" for="dateMin">Date minimale:</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="dateMin"  name="dateMin" onClick="$('#datepicker').css('display','block')">
          </div>
  
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php echo $alertDate;?>
          </div> 
        </div>
       
        <div class="form-group">
          <label class="col-sm-4 control-label" for="dateMax">Date maximale:</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="dateMax"  name="dateMax" onClick="$('#datepicker').css('display','block')">
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-4">
          </div>
          <div class="col-sm-4">
            <div id="datepicker" ></div>
          </div>
        </div>
      

        <div class="form-group">
          <label class="col-sm-4 control-label" for="choixGP">Pour:</label>
          <div class="col-sm-4" style="margin-top:6px;">
            <input type="checkbox" name="choixGP_Jx" id="choixGP_Jx" value="Jx" onclick="afficheJeu()"> <label for="choixGP_Jx">Un jeu</label>
            &nbsp;
            <input type="checkbox" name="choixGP_L" id="choixGP_L" value="L" onclick="afficheLieu()" > <label for="choixGP_L">Un lieu</label>
          </div>
        </div>

        <div class="form-group" id="divJeuGP" style="display:none;">
           <label class="control-label col-sm-4" for="jeuGP">Jeu:</label> 
           <div class="col-sm-4 ">
              
              <select class="sel" name="jeuGP" id="jeuGP">  
              <option value=-1>Choix du jeu</option> 
              <?php
              $res = $BD->query("SELECT idJx,nomJx FROM jeux"); // REQUETE QUI RECUPERE TOUS LES JEUX

              while($row = $res->fetch_assoc())
              {
                echo "<option value=".$row['idJx']." >".$row['nomJx']."</option>"; // SELECT POUR LE CHOIX DU JEU
              }?>
              
              </select> 
             
            </div>
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <?php echo $alertJeuGP;?>
            </div>     
        </div>

        <div class="form-group" id="divLieuGP" style="display:none;" >
           <label class="control-label col-sm-4" for="lieuGP">Lieu:</label> 
           <div class="col-sm-4 ">
              
              <select class="sel" name="lieuGP" id="lieuGP">  
              <option value=-1>Choix du lieu</option> 
              <?php
              $res = $BD->query("SELECT IdL,lieuJ FROM lieuj"); // REQUETE QUI RECUPERE TOUS LES LIEUX ET LEURS ID

              while($row = $res->fetch_assoc())
              {
                echo "<option value=".$row['IdL']." >".$row['lieuJ']."</option>"; // SELECT POUR LE CHOIX DU LIEU
              }?>
              
              </select> 
             
            </div>
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <?php echo $alertLieuGP;?>
            </div>     
        </div>

      </div>
      <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Générer</button>
    </form>
  </div>

  <?php endif ; ?>

  <div class="stats">
    <?php
    include('includes/php/stats.php') // PARTIE STATISTIQUES
    ?>
  </div>

  <?php  include('includes/php/footer.php') // PARTIE FOOTER
  ?> 

</body>
<html>