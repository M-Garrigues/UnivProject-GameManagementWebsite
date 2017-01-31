<SCRIPT>
	$(document).ready(function()
	{
		fullpath =document.location.href
		url=fullpath.substring(fullpath.lastIndexOf( "/" )+1 ); //récupère le nom de la page actuelle

		if (url=='index.php'||url==''||url=='aPropos.php')       $("#Accueil").addClass('actuelle');    
    else if (url=='nouvellePartie.php'||url=="parties.php"||url=="generateurParties.php")      $("#Parties").addClass('actuelle');
    else if (url=='nouvelleJoueuse.php'||url=="joueuses.php")    $("#Joueuses").addClass('actuelle');
    else if (url=='nouvelleEquipe.php'||url=="equipes.php")      $("#Equipes").addClass('actuelle');
    else if (url=='nouveauLieu.php'||url=="lieux.php")           $("#Lieux").addClass('actuelle');
    else if (url=='recommandations.php')                         $("#Plus").addClass('actuelle');
	}) // les lignes précédentes changent le css de l'onglet de la page actuelle.
</SCRIPT> 

<div class='container-fluid toper'>

<a href="index.php" class="inline" id='logo'> <img src="images/logo.png" alt="LOGO" style="width:80px;height:80px;"></a>

<h1 class="inline">StaticStick</h1>

<h3 class='toper-right'>Le site de gestion de parties en ligne le plus simple!</h3>

</div>

<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="80">
  <ul class="nav navbar-nav">
    <li id='Accueil'><a href="index.php">Accueil</a></li>
    <li id='Parties'><a href="parties.php">Parties</a></li>
    <li id='Joueuses'><a href="joueuses.php">Joueuses</a></li>
    <li id='Equipes'><a href="equipes.php">Equipes</a></li>
    <li id='Lieux'><a href="lieux.php"> Lieux </a></li>
    <li id='Plus'><a href="recommandations.php"> Plus... </a></li>
  </ul>
</nav>
  
</div>

