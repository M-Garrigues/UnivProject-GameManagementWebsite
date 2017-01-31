<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nouvelle Joueuse</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <LINK rel="stylesheet" type="text/css" href="includes/JS/jquery-ui-1.11.4.custom/jquery-ui.css">
  <script src='includes/JS/jquery-ui-1.11.4.custom/jquery-ui.min.js'></script>

  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">

  <SCRIPT >

    $(document).ready(function()
    {
      $('#divE').hide(); //AFFICHAGE JOUEUSE OU EQUIPE
    });

    $(function() { //INITIALISATION DES OPTIONS DE DATEPICKER
      $( "#dateNJ" ).datepicker({changeMonth: true, changeYear: true,dateFormat: 'yy-mm-dd', yearRange: "1910:2016"});
    });

    function afficheCHoixEquipe()//AFFICHAGE JOUEUSE OU EQUIPE
    {
     if ( $('#choixE').prop('checked')) 
       $('#divE').show();
      else
       $('#divE').hide();
    }

    function checkFormJ() //JAVASCRIPT, VERIFIE QUE CHAQUE PARTIE DU FORMUALIRE EST REMPLE? SINON AFFICHE UNE *
    {
      var x = true;
      var regex_CP = /^[0-9]{5,5}$/; // EXPRESSION REGULIERE DE VERIFICATION DU CODE POSTAL

      if($('#pseudoJ').val()=='') //TEST PSEUDO
      {
        $('#alertPseudo').show();
        x = false;
      }
      else $('#alertPseudo').hide();

      if($('#prenomJ').val()=='') //TEST PRENOM
      {
        $('#alertPrenom').show();
        x = false;
      }
      else $('#alertPrenom').hide();

      if($('#nomJ').val()=='') //TEST NOM
      {
        $('#alertNom').show();
        x = false;
      }
      else $('#alertNom').hide();

      if($('#dateNJ').val()=='') //TEST DATE DE NAISSANCE
      {
        $('#alertDateN').show();
        x = false;
      }
      else $('#alertDateN').hide();

      if($('#rueJ').val()=='') //TEST ADRESSE
      {
        $('#alertRue').show();
       x = false;
      }
      else $('#alertRue').hide();

      if($('#codePJ').val()=='')
      {
        $('#alertCodeP').show();
       x = false;
      }
      else if (($('#codePJ').val().match(regex_CP))) 
       $('#alertCodeP').hide();
      else{
        $('#alertCodeP').show();
        x=false;
      }

      if($('#villeJ').val()=='')
      {
        $('#alertVille').show();
        x = false;
      }
      else $('#alertVille').hide();

      if($('#regionJ').val()=='')
      {
        $('#alertRegion').show();
        x = false;
      }
      else $('#alertRegion').hide();

      if($('#equipeJ').val()==-1& $("#choixE").prop('checked'))
      {
        $('#alertEquipe').show();
        x = false;
      }
      else $('#alertEquipe').hide();

      if(x) 
       return true;
      else
     { //AFFICHAGE DES ERREURS
        $('#alerteInfo1').show();
        $('#alerteInfo').show();
        return false;
      }
    }
  </SCRIPT>
</head>

<body>
  <?php 
  include('includes/php/menu.php') ; //INCLUSION DU MENU
  include("BD/connexion.php"); // ON SE CONNECTE A LA BD

  function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    $data = mysql_real_escape_string($data);
    return $data;
  }

  $formValide=true;
  $messagePost;

  $alertPseudo = $alertPrenom = $alertNom = $alertDateN = $alertRue = $alertVille = $alertCodeP = $alertRegion = $alertEquipe = "";//ON DEFINIT LES MESSAGES D'ERREUR
  $PseudoJ = $Prenom = $NomJ = $DateNJ = $RueJ = $VilleJ = $CodePJ = $RegionJ = $EquipeJ = ""; //ON DEFINIT LES VARIABLES RECUPEREES

  if ($_SERVER["REQUEST_METHOD"] == "POST") // VERIFICATION FORMULAIRE PHP
  {

    if (empty($_POST["pseudoJ"])) {     //TEST pseudoJ
      $alertPseudo = "Pseudo requis";
      $formValide = false;
    }
    else{
      $pseudoJ = test_input($_POST["pseudoJ"]);
       $req=$BD->query("SELECT * FROM joueuses where pseudoJ = '$pseudoJ'"); //REQUETE POUR VOIR SI LE PSEUDO CHOISI EXISTE DEJA DANS LA BD
        
      if($req->num_rows > 0){ //SI LA REQUETE RENVOIE UNE OU PLUSIEURS LIGNES C'EST QUE LE PSEUDO EST DEJA PRIS
        $alertPseudo = "Pseudo déjà utilisé!";
        $formValide = false;
      }
    }
  
    if (empty($_POST["prenomJ"])) {   //TEST prenomJ
      $alertPrenom = "Prenom requis";
      $formValide = false;
    } else {
      $alertPrenom = "";
      $prenomJ = test_input($_POST["prenomJ"]);
    }

    if (empty($_POST["nomJ"])) {    //TEST nomJ
      $alertNom = "Nom requis";
      $formValide = false;
    } else {
      $alertNom = "";
      $nomJ = test_input($_POST["nomJ"]);
    }

    if (empty($_POST["dateNJ"])) {    //TEST dateNJ
      $alertDateN = "Date de naissance requise";
      $formValide = false;
    } else {
      $alertDateN = "";
      $dateNJ = test_input($_POST["dateNJ"]);
    }
  

    if (empty($_POST["rueJ"])) {  //TEST rueJ
      $alertRue = "Rue requise";
      $formValide = false;
    } else {
      $alertRue = "";
      $rueJ = test_input($_POST["rueJ"]);
    }

    if (empty($_POST["villeJ"])) {    //TEST villeJ
      $alertVille = "Ville requise";
      $formValide = false;
    } else {
      $alertVille = "";
      $villeJ = test_input($_POST["villeJ"]);
    }

    if (empty($_POST["codePJ"])) {    //TEST codePJ
      $alertCodeP = "Code postal requis";
      $formValide = false;
    } else {
      $alertCodeP = "";
      $codePJ = test_input($_POST["codePJ"]);
    }

    if (empty($_POST["regionJ"])) {    //TEST regionJ
      $alertRegion = "Region requise";
      $formValide = false;
    } else {
      $alertRegion = "";
      $regionJ = test_input($_POST["regionJ"]);
    }

    if(!empty($_POST["choixE"])){      //TEST equipeJ,ON DOIT D'ABORD TESTER LA CHECKBOX
      if ($_POST["equipeJ"]==-1) {
        $alertEquipe = "Equipe requise";
        $formValide = false;
      }
      else
      {
        $alertEquipe = "";
       $equipeJ = test_input($_POST["equipeJ"]);
      }
    }
  }

  if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"){      //REUSSITE                                             

    $rqtRempl = "INSERT INTO joueuses (pseudoJ, prenomJ, nomJ, dateNJ, rueJ, villeJ, codePJ, regionJ)
    VALUES ( '$pseudoJ','$prenomJ','$nomJ','$dateNJ','$rueJ','$villeJ','$codePJ','$regionJ')"; // REQUETE DE REMPLISSAGE DE LA TABLE JOUEUSE

    if ($BD->query($rqtRempl) === TRUE) { // ON RENTRE LA NOUVELLE JOUEUSE DANS LA BD
      $messagePost= "Joueuse enregistrée avec succès!";
      $IdJ = mysqli_insert_id($BD);
    } else {
        $messagePost ="Erreur: " . $rqtRempl . "<br>" . $BD->error;
    }

    //DATE DU JOUR
    $datedj = date("Y-m-d");

    if(!empty($_POST["choixE"]))
    {
      $rqtEquipe = "INSERT INTO rejoint (dateRejoint, IdJ, IdE) 
      VALUES ('$datedj', '$IdJ', '$equipeJ')";// REQUETE DE REMPLISSAGE DE LA TABLE REJOINT

      if ($BD->query($rqtEquipe) === TRUE) {// ON RENTRE LA NOUVELLE JOUEUSE DANS L'EQUIPE SELECTIONNEE
      } else {
        $messagePost ="Erreur: " . $rqtEquipe . "<br>" . $BD->error;
      }
    }


  } ?>

  <?php if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"): ?>
  <!--  AFFICHAGE DU FORMULAIRE -->

    <div class="container corps">
      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE JOUEUSE</h2>
      </div>
      <p class="text-center"> <?php echo $messagePost;  ?></p>
    </div>

  <?php else: ?>

    <div class="container corps">

      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE JOUEUSE</h2>
      </div>
      <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formJ" onsubmit="return(checkFormJ())">

        <div class="container-fluid formPerso" id='form1'>

          <h3>Informations</h3>

          <div class="form-group">
            <label class="control-label col-sm-4" for="pseudoJ">Pseudo:</label>
            <div class="col-sm-4 ">
              <input type="text" class="form-control " id="pseudoJ" placeholder="Entrez pseudo" name="pseudoJ">
            </div> 
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <span class="alerteForm" id="alertPseudo" >*</span>
              <?php echo $alertPseudo;?>
            </div>   
          </div>

          <div class="form-group">
            <label class="control-label col-sm-4" for="prenomJ">Prenom:</label>
            <div class="col-sm-4 ">
              <input type="text" class="form-control" id="prenomJ" placeholder="Entrez prénom" name="prenomJ">
            </div>
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <span class="alerteForm" id="alertPrenom" >*</span>
              <?php echo $alertPrenom;?>
            </div> 
          </div>

          <div class="form-group">
            <label class="control-label col-sm-4" for="nomJ">Nom:</label>
            <div class="col-sm-4 ">
              <input type="text" class="form-control" id="nomJ" placeholder="Entrez nom" name="nomJ">
            </div>
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <span class="alerteForm" id="alertNom" >*</span>
              <?php echo $alertNom;?>
            </div> 
          </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="dateNJ">Date de naissance:</label>
          <div class="col-sm-4 ">
             <input type="text" class="form-control " id="dateNJ"  name="dateNJ">
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertDateN" >*</span>
            <?php echo $alertDateN;?>
            </div> 
          </div>

        </div>

        <div class="container-fluid formPerso" id='form2'>

        <h3>Adresse</h3>

        <div class="form-group">
          <label class="control-label col-sm-4" for="rueJ">Rue:</label>
          <div class="col-sm-4 ">
           <input type="text" class="form-control " id="rueJ" placeholder="Entrez rue" name="rueJ">
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertRue" >*</span>
            <?php echo $alertRue;?>
          </div>     
        </div>

        <div class="form-group">
        <label class="control-label col-sm-4" for="villeJ">Ville:</label>
          <div class="col-sm-4 ">
           <input type="text" class="form-control " id="villeJ" placeholder="Entrez ville" name="villeJ">
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertVille" >*</span>
            <?php echo $alertVille;?>
          </div>     
        </div>

        <div class="form-group">
        <label class="control-label col-sm-4" for="codePJ">Code postal:</label>
          <div class="col-sm-4 ">
            <input type="text" class="form-control " id="codePJ" placeholder="Entrez code postal" name="codePJ">
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertCodeP" >*</span>
            <?php echo $alertCodeP;?>
          </div>     
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="regionJ">Région:</label>
          <div class="col-sm-4 ">
           <input type="text" class="form-control " id="regionJ" placeholder="Entrez région" name="regionJ">
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertRegion" >*</span>
           <?php echo $alertRegion;?>
          </div>     
        </div>

      </div>

      <div class="checkbox" id="divChoixE">
        <label for="choixE"><input type="checkbox" id="choixE" name="choixE" value="oui" onclick="afficheCHoixEquipe()"> Rejoindre immédiatement une équipe</label>
      </div>

      <div id='divE' class="container-fluid formPerso">
        <h3>Choisir une équipe:</h3>

        <div class="form-group" >
          <label class="control-label col-sm-4" for="equipeJ">Nom équipe:</label>
          <div class="col-sm-4 ">
          <?php
          $res = $BD->query("SELECT idE,nomE FROM equipes"); // REQUETE DE SLECTION DE TOUTES LES EQUIPES POUR LE METTRE DANS UN SELECT
          echo"<select class='sel' name='equipeJ' id='equipeJ'>";
              
          echo "<option value=-1>Equipes</option>";
         while($row = $res->fetch_assoc())
          echo "<option value=".$row['idE']." >".$row['nomE']."</option>";         
          echo "</select>";
          ?>

          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertEquipe" >*</span>
              <?php echo $alertEquipe;?>
          </div>     
        </div>
      </div>

      <span id="alerteInfo1"  class='alerteForm'>  *</span>
      <span id="alerteInfo"  style="display:none;">  Champs vides ou erronés.</span>
      <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Enregistrer</button>

    </form>
  </div>

  <?php endif; ?>

  <div class="stats">
    <?php
      include('includes/php/stats.php');
    ?>
  </div>

  <?php  include('includes/php/footer.php') ?>

</body>
<html>
