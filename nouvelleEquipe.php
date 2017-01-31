<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nouvelle Equipe</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">

  <SCRIPT >

  $(document).ready(function() //CACHER LA SAISIE DU MOT DE PASSE
  {
   $('#divMdp').hide();
  });

  function afficheMdp() //AFFICHER LE MOT DE PASSE SI NECESSAIRE
  {
    if ( $('#B_privee').prop('checked')) 
      $('#divMdp').show();
    else
      $('#divMdp').hide();
  }

  function nbj() { //AFFICHER LES ZONES DE SAISIE DES JOUEUSES 
    var nb = $("#nbJadd").val();
    for (var iter = 1; iter <= 10; iter++) {
      $("#joueuse"+iter).css('display','none');
    }
    for (var iter = 1; iter <= nb; iter++) {
      $("#joueuse"+iter).css('display','block');
    }
  }

  function checkFormE() //VERIFIE QUE CHAQUE PARTIE DU FORMUALIRE EST REMPLIE, SINON METS UN *
  {
    var x = true;

    if($('#nomE').val()=='')
    {
      $('#alertNom').show();
      x = false;
    }
    else $('#alertNom').hide();
  
    if($('#DeviseE').val()=='')
    {
      $('#alertDevise').show();
      x = false;
    }
    else $('#alertDevise').hide();

    if($('#publiqueE').val()=='')
    {
      $('#alertPublique').show();
      x = false;
    }
    else $('#alertPublique').hide();

    if($('publiqueE').val()=='privee'&&($('#mdpE').val()=''))
    {
      $('#alertMdp').show();
      x = false;
    }
    else $('#alertMdp').hide();
    if(x) 
      return true;
    else
    {
      $('#alerteInfo1').show();
      $('#alerteInfo').show();
      return false;
    }
  }
  </SCRIPT>
</head>

<body>

  <?php

  include('BD/connexion.php'); //OUVERTURE BASE DE DONNEES
  include("includes/php/menu.php"); //INCLUSION DU MENU

  function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    $data = mysql_real_escape_string($data);
    return $data;
  }

  $formValide=true;

  $alertNom = $alertDevise = $alertPublique = $alertMdp= $alertJoueuses= "";     //on définit les messages d'erreur.
  $nomE =  $deviseE  = $mdpE ="";               //on définit les variables récupérées.
  $publiqueE =0;

  if ($_SERVER["REQUEST_METHOD"] == "POST") //TRAITEMENT DU FORMULAIRE DEJA COMPLETE
  { 

    if (empty($_POST["nomE"])) {     
      $alertNom = "Nom requis";
      $formValide = false;
    } 
    else 
    {
      $nomE = test_input($_POST["nomE"]);
      $req = $BD->query("SELECT * FROM equipes WHERE nomE = '$nomE'");

      if($req->num_rows>0)
      {
          $alertNom = "Nom d'équipe déjà utilisé!"; //SI LA REQUETE RENVOIE UNE OU PLUSIEURS LIGNES C'EST QUE LE NOM EST DEJA PRIS
          $formValide = false;
      }    
    }

    if (empty($_POST["DeviseE"])) {    
      $alertDevise = "Devise requise";
      $formValide = false;
    } else {
      $alertDevise = "";
      $deviseE = test_input($_POST["DeviseE"]);
    }


    $publiqueE = $_POST["publiqueE"];

    if (empty($_POST["mdpE"])&& ($publiqueE == 1)) {     
      $alertMdp = "mdp requis";
      $formValide = false;
    } else {
      $alertMdp = "";
      $mdpE = test_input($_POST["mdpE"]);
    }
    
    //VERIFIE QUE TOUTES LES JOUEUSES SONT PRESENTES ET UNIQUES
    $nbJ=$_POST["nbJadd"];
    for ($n=1; $n <= $nbJ; $n++) {
      $var="joueuse".$n;
      if ($_POST[$var] == -1) {
        $formValide = false;
        $alertJoueuses = "joueuse ".$n." requise";
        break;
      }
      for ($s=1; $s <= $nbJ; $s++) {
        $var2="joueuse".$s;
        if(($n != $s) && ($_POST[$var] == $_POST[$var2])) {
          $alertJoueuses = "Des joueuses sont identiques";
          $formValide = false;
          break;
        }
        if ($formValide == false)
          break;
      }
    } 
  }


  if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"){  //ON RENTRE LES DONNES DANS LE FORMULAIRE
  //DATE DU JOUR
  $datedj = date("Y-m-d");

  $rqtRempl = "INSERT INTO equipes (nomE, dateCreatE, deviseE, publiqueE, mdpE)
  VALUES ( '$nomE','$datedj','".$deviseE."','$publiqueE','$mdpE')"; // REQUETE DE REMPLISSAGE DE LA TABLE EQUIPES

  if ($BD->query($rqtRempl) === TRUE) {
    $messagePost= "Equipe enregistrée avec succès!";
  } else {
    $messagePost ="Erreur: " . $rqtRempl . "<br>" . $BD->error;
  }

  //AJOUT DES JOUEUSES DANS LA TABLE REJOINT
  $last_idE = mysqli_insert_id($BD);//ON RECUPERE L'ID DE LA DERNIERE JOUEUSE AJOUTEE
  
  for ($n=1; $n <= $nbJ; $n++) {
    $var="joueuse".$n;
    $rqtRempl2 = "INSERT INTO rejoint (dateRejoint, IdJ, idE)
    VALUES ( '$datedj','$_POST[$var]','$last_idE')"; // REQUETE DE REMPLISSAGE DE LA TABLE REJOINT

    if ($BD->query($rqtRempl2) === TRUE) {
      } else {
    $messagePost ="Erreur: " . $rqtRempl2 . "<br>" . $BD->error;
    }
  }

  }?>

  <?php if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"): // PAGE DE REUSSITE/ECHEC DE L'INSERTION ?> 

    <div class="container corps">
      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE EQUIPE</h2>
      </div>
      <p> <?php echo $messagePost; ?></p>
    </div>

  <?php else: ?>

  <!-- AFFICHAGE DU FORMULAIRE -->

    <div class="container corps">

      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE EQUIPE</h2>
      </div>
      <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formJ" onsubmit="return(checkFormE())">

        <div class="container-fluid formPerso" id='form1'>

          <h3>Informations</h3>

          <div class="form-group">
            <label class="control-label col-sm-4" for="nomE">Nom:</label>
            <div class="col-sm-4 ">
              <input type="text" class="form-control " id="nomE" placeholder="Entrez nom équipe" name="nomE">
            </div> 
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <span class="alerteForm" id="alertNom" >*</span>
              <?php echo $alertNom;?>
            </div>   
          </div>

          <div class="form-group">
           <label class="control-label col-sm-4" for="DeviseE">Devise:</label>
           <div class="col-sm-4 ">
             <input type="text" class="form-control" id="DeviseE" placeholder="Entrez devise équipe" name="DeviseE">
           </div>
           <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertDevise" >*</span>
            <?php echo $alertDevise;?>
          </div> 
        </div>

        <div class="form-group">
         <div class="col-sm-4 ">
         </div>
         <div class="col-sm-4 ">
          <input type="radio" name="publiqueE" value=0 id="B_publique" checked="checked" onclick="afficheMdp()" /> <label for="B_publique">Publique</label>
          <input type="radio" name="publiqueE" value= 1 id="B_privee" onclick="afficheMdp()"/> <label for="B_privee">Privée</label>
        </div>
      </div>

      <div class="form-group" id="divMdp">
        <label class="control-label col-sm-4" for="mdpE">Mot de passe:</label>
        <div class="col-sm-4 ">
          <input type="text" class="form-control" id="mdpE" placeholder="Entrez mot de passe" name="mdpE">
        </div>
        <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
          <span class="alerteForm" id="alertMdp" >*</span>
          <?php echo $alertMdp;?>
        </div> 
      </div>

      <p>Les équipes publiques peuvent être rejointes par n'importe quelle joueuse. A l'inverse, les équipes privées demandent un mot de passe pour pouvoir les rejoindre.</p>

    </div>

    <div class="container-fluid formPerso" id='form2'>

      <h3>Joueuses</h3>

      <p>Vous devez mettre au moins deux joueuses dans votre équipe pour pouvoir la créer:</p>
      <br>

      <label for="nbJadd"> Nombre de joueuses à ajouter </label>   

      <select class="sel" name="nbJadd" id="nbJadd" onChange="nbj()"> <?php //on ajoute un select pour chooisir le nombre de joueuses à ajouter ?>
        <option value="2">2</option>
        <option value="3" >3</option>
        <option value="4" >4</option>
        <option value="5" >5</option>
        <option value="6" >6</option>
        <option value="7" >7</option>
        <option value="8" >8</option>
        <option value="9" >9</option>
        <option value="10" >10</option>
      </select>

      <?php echo "  ".$alertJoueuses; ?>
      
      <br>
      <br>

      <?php

      for ($i = 1;$i <= 2; $i++) { //LES DEUX PREMIERS SELECT D'EQUIPE, TOUJOURS VISIBLES

        echo"<select class='sel'  name='joueuse".$i."' id='joueuse".$i."'' style='display:block;'>\n";
        $res = $BD->query("SELECT IdJ, pseudoJ FROM joueuses");
        $j = 1;
        echo "<option value='-1'>Joueuse ".$i."</option>"; //case de base de chaque select, pour éviter une erreur à la saisie.
        while($row = $res->fetch_assoc())
        {
          echo "<option value=".$row['IdJ']." >".$row['pseudoJ']."</option>";
          $j++;
        }
        echo "</select>";
      }

      for ($i = 3;$i <= 10; $i++) { //LES 8 AUTRES SELECT POSSIBLES, INVISIBLES PAR DEFAUT
        echo"<select class='sel' name='joueuse".$i."' id='joueuse".$i."' style='display:none;'>\n";
        $res = $BD->query("SELECT IdJ,pseudoJ FROM joueuses");
        $j = 1;
        echo "<option value='-1'>Joueuse ".$i."</option>";
        while($row = $res->fetch_assoc())
        {
          echo "<option value=".$row['IdJ']." >".$row['pseudoJ']."</option>";
          $j++;
        }
        echo "</select>";
      }

    ?>    

    </div>

    <span id="alerteInfo1"  class='alerteForm'>  *</span>
    <span id="alerteInfo"  style="display:none;">  Champs vides ou erronés.</span>
    <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Enregistrer</button>
    </form>
  </div>

  <?php endif; ?>

  <div class="stats"> <!-- AFFICHAGE DU VOLET STATISTIQUES DE DROITE -->
    <?php
    include('includes/php/stats.php')
    ?>
  </div>

  <?php  include('includes/php/footer.php') ?>

</body>
<html>
