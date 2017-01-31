<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Lieux</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="includes/JS/jquery-2.1.4.min.js"></script>
  <script src="includes/bootstrap/js/bootstrap.min.js"></script>
  <script src='includes/JS/onStart.js'></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <LINK rel="stylesheet" type="text/css" href="includes/bootstrap/css/bootstrap.min.css" >
  <LINK rel="stylesheet" type="text/css" href="CSS/style.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/menu.css">
  <LINK rel="stylesheet" type="text/css" href="CSS/formulaires.css">

  <script type="text/javascript">
    //AFFICHAGE DE LA CARTE
    function carte(){
        
        coord=$("#idL option:selected").val();
        var coordtab = coord.split("+");

        var config = {
            latitude  : coordtab[0],     
            longitude : coordtab[1],
            location : coordtab[2]
            
        };
 
        // Création d'un objet pLatLng pour stocker les coordonnées
        var latlng = new google.maps.LatLng(config.latitude, config.longitude);
 
        // Options de la carte
        var myOptions = {
            zoom: 8,
            center: latlng,
            // mapTypeId: google.maps.MapTypeId.SATELLITE
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
 
        // Création et affichage de la carte dans le div CARTE
        var map = new google.maps.Map(document.getElementById("carte"), myOptions);
 
        // Ajout d'un marqueur sur la carte
        var mark = new google.maps.Marker({
            position: latlng,
            map:      map,
            title:    config.location
        });
        $("#carte").css('display','block');
    }
  </script>

</head>

<body>
  <?php 
    include('includes/php/menu.php') ; //INCLUSION DU MENU  
    include('BD/connexion.php'); //OUVERTURE DE LA BD  
  ?>

  <div class=" container corpsListe">

  <!-- CHOIX DU LIEU A INSERER -->
  <form action="nouveauLieu.php">
    <button type="submit" class="btn btn-warning btn-lg centered" id='boutonCreate'>Créer un nouveau lieu!</button>
  </form>

  <div class="form-group">
    <label class="control-label col-sm-4" for="idL">Afficher la carte pour:</label>
    <div class="col-sm-4 ">

      <select  name="idL" id="idL" onChange="carte();">  
       <option value=-1>Choix du lieu</option>
       <?php
       $res = $BD->query("SELECT IdL,lieuJ,lattitudeJ,longitudeJ FROM lieuj order by lieuJ"); // REQUETE QUI RECUPERE TOUS LES JEUX
       while($row = $res->fetch_assoc())
         echo "<option value=".$row['lattitudeJ']."+".$row['longitudeJ']."+".$row['lieuJ']." >".$row['lieuJ']."</option>";
       ?>
      </select>
    </div>
  </div>
    <br><br>
    

    <div  id="carte" style="display:none";></div> 

  
    <div class="stats">
      <?php
      include('includes/php/stats.php')
      ?>
    </div>

  <?php  include('includes/php/footer.php') ?>

</body>
</html>
</body>
</html>