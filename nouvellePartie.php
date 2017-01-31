<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nouvelle Partie</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <script src='includes/JS/jquery-ui-1.11.4.custom/jquery-ui.min.js'></script>
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="includes/JS/jquery-ui-1.11.4.custom/jquery-ui.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">
  <script src='includes/JS/jquery-ui-1.11.4.custom/jquery-ui.min.js'></script>

  <SCRIPT >

  $(function() { /*INITIALISATION DES OPTIONS DE DATEPICKER*/
    $( "#datepicker" ).datepicker({changeMonth: true, changeYear: true,dateFormat: 'yy-mm-dd'});
  });

  function nbj() { //AFFICHER LES ZONES DE SAISIE DES JOUEUSES SI NECESSAIRE
    var nb1 = $("#nbJadd").val();
    for (var iter = 1; iter <= 10; iter++) {
      $("#fgjoueuse"+iter).css('display','none');
    }
    for (var iter = 1; iter <= nb1; iter++) {
      $("#fgjoueuse"+iter).css('display','block');
    }
  }

  function nbe() { //AFFICHER LES ZONES DE SAISIE DES JOUEUSES SI NECESSAIRE
   var nb2 = $("#nbEadd").val();
    for (var iter = 1; iter <= 10; iter++) {
      $("#fgequipe"+iter).css('display','none');
    }
    for (var iter = 1; iter <= nb2; iter++) {
      $("#fgequipe"+iter).css('display','block');
    }
  }

  function afficheChoix() //CHOIX ENTRE JOUEUSE OU EQUIPE
  {
    if ( $('#choixE').prop('checked')) 
    {
      $('#siequipe').show();
      $('#sijoueuse').hide();
    }
    else
    {
      $('#sijoueuse').show();
      $('#siequipe').hide();
    }
  }

  </script>
 
</head>

<body>
  <?php 
  include('BD/connexion.php');//OUVERTURE BASE DE DONNEES
  include('includes/php/menu.php') ; //INCLUSION DU MENU
 
  function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

  $formValide=true;

  $alertJeu = $alertEquipe = $alertJoueuse = $alertLieu= $alertDuree = $alertDate = "";     //DEFINITION DES MESSAGES D'ERREUR
  $idJx =  $DeviseE = $publiqueE = "";          //DEFINITION DES VARIABLES RECUPEREES

  if ($_SERVER["REQUEST_METHOD"] == "POST") //VERIFIE QUE CHAQUE PARTIE DU FORMULAIRE EST CORRECTEMENT REMPLIE
  
  { 
    if ($_POST["idJx"] == -1) {     //TEST JEU
      $alertJeu = "Jeu requis";
      $formValide = false; 
    } else {
      $alertJeu = "";
      $idJx = test_input($_POST["idJx"]);
    }
    
    if ($_POST["idL"] == -1) {     //TEST LIEU
      $alertLieu = "Lieu requis";
      $formValide = false;
    } else {
      $alertLieu = "";
      $idL = test_input($_POST["idL"]);
    }
   
    if (empty($_POST["dateP"])) {     //TEST PRESENCE DE LA DATE
      $alertDate = "Date requise";
      $formValide = false;
    } else {
      $alertDate = "";
      $dateP = test_input($_POST["dateP"]);
    }
    
    if($_POST["choix"] == "e") { //TEST DE LA PARTIE EQUIPE
      //VERIFIE QUE TOUTES LES EQUIPES SONT PRESENTES ET UNIQUES
      $nbE=$_POST["nbEadd"];
      for ($n=1; $n <= $nbE; $n++) {
        $var="equipe".$n;
        if ($_POST[$var] == -1) {
         $formValide = false;  
        $alertEquipe = "equipe ".$n." requise";
          break;
        }
        for ($s=1; $s <= $nbE; $s++) {
          $var2="equipe".$s;
          if(($n != $s) && ($_POST[$var] == $_POST[$var2])) {
          $alertEquipe = "Des equipes sont identiques";
            $formValide = false;
            break;
          }
        if ($formValide == false)
          break;
        }
        
      } 
    }

    if($_POST["choix"] == "j") { //TEST DE LA PARTIE JOUEUSE
      //ON VERIFIE QUE TOUTES LES JOUEUSES SONT PRESENTES ET UNIQUES
      $nbJ=$_POST["nbJadd"];
      for ($n=1; $n <= $nbJ; $n++) {
        $var="joueuse".$n;
        if ($_POST[$var] == -1) {
          $formValide = false;  
          $alertJoueuse = "joueuse ".$n." requise";
          break;
        }
        for ($s=1; $s <= $nbJ; $s++) {
          $var2="joueuse".$s;
          if(($n != $s) && ($_POST[$var] == $_POST[$var2])) {
            $alertJoueuse = "Des joueuses sont identiques";
            $formValide = false;
            break;
          }
          if ($formValide == false)
            break;
        }
      } 
    }
      
    if ($_POST["dureeh"] == -1) {     //TEST DES HEURES
      $alertDuree = "Heures requises";
      $formValide = false;
    } else {
       $dureeh = test_input($_POST["dureeh"]);
    }

    if ($_POST["dureem"] == -1) {     //TEST DES MINUTES
      $alertDuree = "Minutes requises";
      $formValide = false;
    } else {
      $dureem = test_input($_POST["dureem"]);
    }

    if ($_POST["durees"] == -1) {     //TEST DES SECONDES
      $alertDuree = "Secondes requise";
      $formValide = false;
    } else {
      $durees = test_input($_POST["durees"]);
    }
  }

  //TRAITEMENT DU FORMULAIRE DEJA COMPLETE
  if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"){ 
    $dureeP= $dureeh.":".$dureem.":".$durees;
    $rqtRempl = "INSERT INTO parties (dateP,equipeP,idJx,idL,dureeP)
    VALUES ( '$dateP','$_POST[choix]','$idJx','$idL','$dureeP')"; // REQUETE DE REMPLISSAGE DE LA TABLE EQUIPES
    if ($BD->query($rqtRempl) === TRUE) {
      $messagePost= "Partie enregistrée avec succès!";
    } else {
      $messagePost ="Erreur: " . $rqtRempl . "<br>" . $BD->error;
    }
          
    //AJOUT DANS LA TABLE JOUESOLO OU JOUEEQUIPE
    $last_idP = mysqli_insert_id($BD);//on récupère l'ID de la dernière partie insérée

    if($_POST["choix"] == "j") { // REQUETE DE REMPLISSAGE DE LA TABLE JOUESOLO
      $gagnante="joueuse1";
      for ($n=1; $n <= $nbJ; $n++) {
        $var="joueuse".$n;
        $rqtRempl2 = "INSERT INTO jouesolo (ScoreSolo,gagneJ,IdJ,IdP)
        VALUES ('$_POST[score]',$_POST[$gagnante],'$_POST[$var]',$last_idP)"; // REQUETE DE REMPLISSAGE DE LA TABLE REJOINT

        if ($BD->query($rqtRempl2) === TRUE) {
        } else {
          $messagePost ="Erreur: " . $rqtRempl2 . "<br>" . $BD->error;
        }
      }
    }
    else {// REQUETE DE REMPLISSAGE DE LA TABLE JOUEEQUIPE
      $gagnante="equipe1";
      for ($n=1; $n <= $nbE; $n++) {
        $var="equipe".$n;
        $rqtRempl2 = "INSERT INTO joueequipe (ScoreEquipes,gagneE,IdE,IdP)
        VALUES ('$_POST[score]',$_POST[$gagnante],'$_POST[$var]',$last_idP)"; // REQUETE DE REMPLISSAGE DE LA TABLE REJOINT
        if ($BD->query($rqtRempl2) === TRUE) {
        } else {
          $messagePost ="Erreur: " . $rqtRempl2 . "<br>" . $BD->error;
        }
      }
    }
  }
  ?>

  <?php if ($formValide&&$_SERVER["REQUEST_METHOD"] == "POST"): // PAGE DE REUSSITE ?>
    
    <div class="container corps">
      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE EQUIPE</h2>
      </div>
      <p class="text-center"> <?php echo $messagePost; ?> </p>
    </div>

  <?php else: ?>

  <!-- AFFICHAGE DU FORMULAIRE -->

    <div class="container corps">

      <div class="titre centered">
        <h2 class='h2Titre'>NOUVELLE PARTIE</h2>
      </div>
      <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formJ" >

      <div class="container-fluid formPerso" id='form1'>

        <h3>Partie</h3>

        <div class="form-group" >
          <label class="control-label col-sm-4" for="idJx">Jeu:</label> 
         
          <div class="col-sm-4 ">
            
            <select class="sel" name="idJx" id="idJx">  
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
            <span class="alerteForm" id="alertJeu" >*</span>
            <?php echo $alertJeu;?>
          </div>     
        </div>
        <br>
     
     
        <div class="form-group" >
          <div class="col-sm-4 "> 
          </div>
          <div class="col-sm-4 ">
    
            <?php if ((isset($_POST["choix"]) && $_POST["choix"] == "e") ||  !isset($_POST["choix"])): ?>
              <input type="radio" name="choix" id="choixE" value="e" checked  onclick="afficheChoix()"> <label for="choixE">Equipes</label>
      &nbsp;
              <input type="radio" name="choix" id="choixJ" value="j"  onclick="afficheChoix()"> <label for="choixJ">Joueuses</label>
          <?php else: ?>
              <input type="radio" name="choix" id="choixE" value="e"   onclick="afficheChoix()"> <label for="choixE">Equipes</label>
      &nbsp;
              <input type="radio" name="choix" id="choixJ" value="j" checked onclick="afficheChoix()"> <label for="choixJ">Joueuses</label>
             <?php endif; ?>

          </div>
        </div> 
      
        <div class="form-group" id='siequipe'>
      
          <div class="form-group">
            <label class="control-label col-sm-4" for="nbEadd">Nombre d'équipes participantes:</label>
            <div class="col-sm-4 ">
              <select class="sel" name="nbEadd" id="nbEadd" onChange="nbe()"> <?php //SELECT POUR CHOISIR LE NOMBRE D'EQUIPES A AJOUTER ?>
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
            </div>
            <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
              <span class="alerteForm" id="alertEquipe2" >*</span>
              <?php echo $alertEquipe;?>
            </div>
          </div>
      

          <?php

          for ($i = 1;$i <= 2; $i++) { //LES DEUX PREMIERS SELECT D'EQUIPE, TOUJOURS VISIBLES
            $id="equipe".$i;
            echo "<div class='form-group'>";
            if ($i == 1) 
              echo "<label class='control-label col-sm-4' for=".$id."> Equipe gagnante</label>";
            else
              echo "<label class='control-label col-sm-4' for=".$id."> Equipe participante</label>";

            echo "<div class='col-sm-4'>";
            echo"<select class='sel' name=$id id=$id style='display:block;'>\n";
            
            $res = $BD->query("SELECT idE,nomE FROM equipes");
      
            echo "<option value='-1'>Equipe ".$i."</option>"; //VALEUR PAR DEFAUIT DE VALUE POUR EVITER DES ERREURS DE SAISIE
            while($row = $res->fetch_assoc())
                  echo "<option value=".$row['idE']." >".$row['nomE']."</option>";         
            ?>   
            </select>
          </div>  
        </div>
        <?php
      }

      for ($i = 3;$i <= 10; $i++) { //LES 8 AUTRES POSSIBLES, INVISIBLES PAR DEFAUT
        $id="equipe".$i;
        $fg="fgequipe".$i;
        echo "<div class='form-group' id=$fg style='display:none;'>";
        if ($i == 1)
          echo "<label class='control-label col-sm-4' for=".$id."> Equipe gagnante</label>";
        else
          echo "<label class='control-label col-sm-4' for=".$id."> Equipe participante</label>";
        echo "<div class='col-sm-4'>";
        echo"<select class='sel'  name=$id id=$id >\n";
    
        $res = $BD->query("SELECT idE,nomE FROM equipes");
     
        echo "<option value='-1'>Equipe ".$i."</option>";

        while($row = $res->fetch_assoc())    
          echo "<option value=".$row['idE']." >".$row['nomE']."</option>";
                      
        ?>   
        </select>
      </div>
        
             
    </div>
        <?php
      }
      ?>

      
    </div>  


   <div class="form-group" id='sijoueuse' style="display:none">

      <div class="form-group">
      <label class="control-label col-sm-4" for="nbJadd">Nombre de joueuses participantes:</label>
      <div class="col-sm-4 ">
      
      <select class='sel' name="nbJadd" id="nbJadd" onChange="nbj()"> <?php //SELECT POUR CHOISIR LE NOMBRE DE JOUEUSES A AJOUTER?>
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
      </div>
      <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <span class="alerteForm" id="alertJoueuse" >*</span>
          <?php echo $alertJoueuse;?>
          </div>   
      </div>
     
      <?php

      for ($i = 1;$i <= 2; $i++) { //LES DEUX PREMIERS SELECT DE JOUEUSE, TOUJOURS VISIBLES
        $id="joueuse".$i;
        echo "<div class='form-group'>";
        if ($i == 1)
          echo "<label class='control-label col-sm-4' for=".$id."> Joueuse gagnante</label>";
        else
          echo "<label class='control-label col-sm-4' for=".$id."> Joueuse participante</label>";
        echo "<div class='col-sm-4'>";
        echo"<select class='sel' name=$id id=$id style='display:block;'>\n";
    
        $res = $BD->query("SELECT IdJ,pseudoJ FROM joueuses");
      
        echo "<option value='-1'>Joueuse ".$i."</option>"; //VALEUR PAR DEFAUIT DE VALUE POUR EVITER DES ERREURS DE SAISIE

        while($row = $res->fetch_assoc())
                  echo "<option value=".$row['IdJ']." >".$row['pseudoJ']."</option>";         
             
        ?>   
        </select>
        </div>                 
      </div>
      <?php
    
      }
      for ($i = 3;$i <= 10; $i++) { //LES 8 AUTRES JOUEUSES POSSIBLES, INVISIBLE PAR DEFAUT
        $id="joueuse".$i;
        $fg="fgjoueuse".$i;
        echo "<div class='form-group' id=$fg style='display:none;'>";
        echo "<label class='control-label col-sm-4' for=".$id."> Joueuse participante</label>";
        
        echo "<div class='col-sm-4'>";

        echo"<select class='sel' name=$id id=$id>\n";
        $res = $BD->query("SELECT IdJ,pseudoJ FROM joueuses");
    
        echo "<option value='-1'>Joueuse ".$i."</option>";
        while($row = $res->fetch_assoc())
                  echo "<option value=".$row['IdJ']." >".$row['pseudoJ']."</option>";
             
        ?>   
        </select>
        </div>
                    
        </div>
      <?php
      }
      ?>
      
    </div>


    <?php if ((isset($_POST["choix"]) && $_POST["choix"] == "e") ||  !isset($_POST["choix"])): ?>
    <script>
      $('#siequipe').show();
      $('#sijoueuse').hide();
    </script>
    <?php else: ?>
  
    <script>
      $('#siequipe').hide();
      $('#sijoueuse').show();
    </script>
    <?php endif; ?>

    <div class="form-group">
      <label class="control-label col-sm-4" for="score">Score (peut être vide):</label>
      <div class="col-sm-4 ">
        <input type="text" class="form-control " id="score" placeholder="Entrez le score" name="score">
      </div>   
    </div>
        
  </div>

  <div class="container-fluid formPerso" id='form2'>

    <h3>Contexte</h3>

    <!-- TRAITEMENT DU LIEU-->
    <div class="form-group" >
      <label for="lieuJ" class=" control-label col-sm-4">Lieu de la partie:</label>
      <div class="col-sm-4 ">
        <select class='sel' name='idL' id='idL'>

        <?php
        $res = $BD->query("SELECT idL,lieuJ FROM lieuj");
        echo "<option value='-1'>Choix du lieu</option>";

        while($row = $res->fetch_assoc())
          echo "<option value=".$row['idL']." >".$row['lieuJ']."</option>";
             
        ?>   
        </select>
      </div>
      <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
        <span class="alerteForm" id="alertLieu" >*</span>
        <?php echo $alertLieu;?>
      </div>     
    </div>

    <!-- TRAITEMENT DE LA DATE-->
    <div class="form-group" >
      <label for="lieuJ" class=" control-label col-sm-4">Date de la partie:</label>
      <div class="col-sm-4 ">
        <input type="text" name='dateP' id="datepicker">
      </div>
      <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
        <span class="alerteForm" id="alertDate" >*</span>
        <?php echo $alertDate;?>
      </div>   
    </div>

    <!-- TRAITEMENT DE LA DUREE-->
    <div class="form-group" >
      <label for="dureeh" class=" control-label col-sm-4"> Dur&eacute;e de la partie:</label>
    
      <div class="col-sm-4 ">
        <select class='sel' name='dureeh' id='dureeh'>
          <option value='-1'>HH</option>
          <?php
          for($i=0; $i<24;$i++)   
            echo "<option value=$i>$i</option>";
          ?>
        </select>

        <select class='sel' name='dureem' id='dureem' >
          <option value='-1'>MM</option>
          <?php
          for($j=0; $j<60;$j++)   
            echo "<option value=$j>$j</option>";
          ?>
        </select>

        <select class='sel' name='durees' id='durees' >
          <option value='-1'>SS</option>
          <?php
          for($k=0; $k<60;$k++)   
            echo "<option value=$k>$k</option>";
          ?>
        </select>
      
      </div>
      <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
        <span class="alerteForm" id="alertDuree" >*</span>
        <?php echo $alertDuree;?>
      </div>     
    </div>

  </div>

  <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Enregistrer</button>
  </form>
  </div>

  <?php endif; ?>

  <div class="stats">
    <?php
    include('includes/php/stats.php')
    ?>
  </div>


  <?php  include('includes/php/footer.php') ?>

</body>
<html>
