<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Google Maps</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">

  <script>
    function trt (){
      ll=$("#lieu").val();
    }

    //FONCTION QUI AFFICHE LA CARTE AVEC LES PARAMETRES RECUPERES EN POST
    function carte(lieu,lat,lng){
      var config = {
      latitude  : lat,     
      longitude : lng,
      location : lieu
    };
 
    // Création d'un objet LatLng pour stocker les coordonnées
    var latlng = new google.maps.LatLng(config.latitude, config.longitude);
 
    // OPTIONS DE LA CARTE
    var myOptions = {
      zoom: 14,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
 
    // CREATION ET AFFICHAGE DE LA CARTE DANS LE DIV CARTE
    var map = new google.maps.Map(document.getElementById("carte"), myOptions);
 
    // AJOUT D'UN MARQUEUR SUR LA CARTE
    var mark = new google.maps.Marker({
      position: latlng,
      map:      map,
      title:    config.location
    });
      $("#carte").css('display','block');
    }
  </script>

  <?php 
  include ("includes/php/menu.php"); //INCLUSION DU MENU
  include('BD/connexion.php'); //OUVERTURE BASE DE DONNEES

  //APPEL DE L'API GOOGLE POUR RECUPERER DES INFOS SUR UN LIEU EN FORMAT JSON
  $geocoder = "http://maps.googleapis.com/maps/api/geocode/json?address=%s&sensor=false";
  ?>
         
  <?php 

  function test_input($data) //TRAITEMENT DES ZONES DE SAISIE
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

  $formValide = true;

  $alertLieu = $alertAdresse = "";     //ON DEFINIT MES MESSAGES D'ERREUR
  $lieu =  $adresse = "";               //ON DEFINIT LES VARIABLES RECUPEREES

  if ($_SERVER["REQUEST_METHOD"] == "POST") //TRAITEMENT DU FORMULAIRE DEJA COMPLETE
  { 
    if (empty($_POST["lieu"])) {     
      $alertLieu = "Lieu requis";
      $formValide = false;
    } 
    else 
    {
      $lieu = test_input($_POST["lieu"]);
      $req = $BD->query("SELECT * FROM lieuJ WHERE lieuJ = 'lieu'");

      if($req->num_rows>0)
      {
        $alertLieu = "Ce lieu existe déjà"; //SI LA REQUETE RENVOIE UNE OU PLUSIEURS LIGNES C'EST QUE LE LIEU EST DEJA PRIS
        $formValide = false;
      }
      else $alertLieu = "";
    }

    if (empty($_POST["adresse"])) {     
      $alertAdresse = "Adresse requise";
      $formValide = false;
    }
    else{
      $adresse = test_input($_POST["adresse"]);
      $alertAdresse = "";
    } 
  }
  
  if ($_SERVER["REQUEST_METHOD"] == "POST" && $formValide == true) { //LE FORMULAIRE EST REMPLI ET VALIDE
     
    // Requête envoyée à l'API Geocoding
    $query = sprintf($geocoder, urlencode(utf8_encode($adresse)));
    $result = json_decode(file_get_contents($query)); // ON RECUPERE UN FICHIER JSON CONTENANT LES COORDONNEES DE L'ADRESSE ENREGISTREE

    if ($result->status !="ZERO_RESULTS" ){// ON VERIFIE QUE L'ADRESSE A ETE TROUVEE
      $json = $result->results[0];

      $Lat = (string) $json->geometry->location->lat; // ON RECUPERE LA LATTITUDE ET LA LONGITUDE DU LIEU DANS LE JSON
      $Lng = (string) $json->geometry->location->lng;

      $BD->query("INSERT INTO lieuJ (lieuJ, lattitudeJ, longitudeJ) VALUES('$lieu', $Lat, $Lng)"); // ON ENREGISTRE LE LIEU DANS LA BD
    }

    ?>

    <div class=" container corpsListe">
    
    <?php if ($result->status !="ZERO_RESULTS"): ?>

      <p class="text-center">Le Lieu <?php echo $lieu ?> a &eacute;t&eacute; enregistr&eacute; avec les coordonn&eacute;s 
        <?php echo $Lat?> et <?php echo $Lng?></p>
      <div  id="carte" ;></div>
      <script>
        //AFFICHAGE DE LA CARTE
        var lieu = '<?php echo $lieu ?>'; 
        var lat = '<?php echo $Lat; ?>'; 
        var lng = '<?php echo $Lng; ?>'; 
        carte(lieu,lat,lng);
      </script>
    <?php else: ?>
      <p class="text-center">Le lieu <?php echo $lieu ?> n'a pas pu être enregistr&eacute;. Réessayez en changeant d'adresse.</p>
      </div>
    <?php endif; ?>
       
  <?php }
  else{  ?>

    <div class="container corps">
    <div class="titre centered">
      <h2 class='h2Titre'>NOUVEAU LIEU</h2>
    </div>
    <form role="form" method="post" class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" id="formL" >

      <div class="container-fluid formPerso" id='form1'>
        <h3>Lieu</h3>

        <div class="form-group" >
          <label class="control-label col-sm-4" for="lieu">Nom du lieu:</label> 
            <div class="col-sm-4 ">
            <input type="text" id="lieu" name="lieu"></input>
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
          <?php echo $alertLieu; ?>
          </div>     
        </div>

        <div class="form-group" >
          <label class="control-label col-sm-4" for="adresse">Adresse/Localisation:</label>
          <div class="col-sm-4 ">
            <input type="text" id="adresse" name="adresse"></input>
          </div>
          <div class="col-sm-4 " style="height: 10px;line-height: 35px;">
            <?php echo $alertAdresse; ?>
          </div>     
        </div>

      </div>
      <button type="submit" class="btn btn-warning btn-lg" id='boutonSub'>Enregistrer</button>

    </form>


  <?php } ?>

    <div class="stats">
    <?php
      include('includes/php/stats.php')
      ?>
    </div>

  <?php  include('includes/php/footer.php') ?>

</body>
</html>