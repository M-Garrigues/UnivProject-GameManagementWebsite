<SCRIPT>

function afficheStats()
{
	if ( $('#B_annee').prop('checked')) 
	{
      $('#divAnnee').show();
      $('#divLieu').hide();
	}
    else
    {
      $('#divLieu').show();
      $('#divAnnee').hide();
    }
}

</SCRIPT>



<?php
include('BD/connexion.php');

$i =0;
?>




<h3 class="text-center"> Statistiques</h3>
<br>


<div class="form-group ">
	<div class="col-sm-2 "> 
	</div>
	<div class="col-sm-8 ">
		<input type="radio" name="statistiqueB" value="annee" id="B_annee" checked="checked" onclick="afficheStats()" /> <label for="B_annee">Par années</label>
		&nbsp;
		<input type="radio" name="statistiqueB" value="lieu" id="B_lieu" onclick="afficheStats()"/> <label for="B_lieu">Par lieux</label>
	</div>
</div>






<div id="divAnnee" class="divStats" style="text-center;">

<table class="table table-striped tabstats" >
    <thead>
      <tr>
        <th>Année</th>
        <th>Joueuses</th>
      </tr>
    </thead>
    <tbody>
    

<?php

$resultJoueuses1 = $BD->query("SELECT year(dateNJ), COUNT(*) AS nb_joueuse FROM joueuses GROUP BY year(dateNJ) ORDER BY nb_joueuse DESC ");


 while( $i<5) 
 	{
 		
 		$row = $resultJoueuses1->fetch_assoc();

 		echo"<tr>";
        	echo "<td>". $row["year(dateNJ)"]."</td>";
        	echo "<td>" . $row["nb_joueuse"]. "</td>";
      	echo"</tr>";


      $i++;
    }

    $resultJoueuses1->close();
?>

	</tbody>
</table>

<table class="table table-striped tabstats" >
  <thead>
    <tr>
      <th>Année</th>
      <th>Parties</th>
    </tr>
  </thead>
  <tbody>

<?php

  $resultParties1 = $BD->query("SELECT year(dateP), COUNT(*) AS nb_parties FROM parties GROUP BY year(dateP) ORDER BY nb_parties DESC ");
$i = 0;

  while( $i<5) 
  {
    
    $row = $resultParties1->fetch_assoc();

    echo"<tr>";
          echo "<td>". ($row["year(dateP)"])."</td>";
          echo "<td>" . $row["nb_parties"]. "</td>";
        echo"</tr>";


      $i++;
  }

?>
  </tbody>
</table>
</div>




<div id="divLieu" class="divStats" style="display:none;">

<table class="table table-striped tabstats" >
  <thead>
    <tr>
      <th>Villes</th>
      <th>Joueuses</th>
    </tr>
  </thead>
  <tbody>

<?php


$resultJoueuses2 = $BD->query("SELECT villeJ, COUNT(*) AS nb_joueuse FROM joueuses GROUP BY villeJ ORDER BY nb_joueuse DESC ");
$i = 0;

  while( $i<5) 
 	{
 		
 		$row = $resultJoueuses2->fetch_assoc();

 		echo"<tr>";
        	echo "<td>". ($row["villeJ"])."</td>";
        	echo "<td>" . $row["nb_joueuse"]. "</td>";
      	echo"</tr>";


      $i++;
  }
?>
	</tbody>
</table>


<table class="table table-striped tabstats" >
  <thead>
    <tr>
      <th>Lieux</th>
      <th>Parties</th>
    </tr>
  </thead>
  <tbody>

<?php

  $resultParties2 = $BD->query("SELECT lieuJ, COUNT(*) AS nb_parties FROM parties NATURAL JOIN lieuJ GROUP BY lieuJ ORDER BY nb_parties DESC ");
$i = 0;

  while( $i<5) 
  {
    
    $row = $resultParties2->fetch_assoc();

    echo"<tr>";
          echo "<td>". ($row["lieuJ"])."</td>";
          echo "<td>" . $row["nb_parties"]. "</td>";
        echo"</tr>";


      $i++;
  }

?>
  </tbody>
</table>
</div>

