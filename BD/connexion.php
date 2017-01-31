<?php

$serveur = "localhost";
$user = "admin";
$mdp = "adminLIF4";

// Créer connexion
$BD = new mysqli($serveur, $user, $mdp, 'projetmg');
mysqli_set_charset($BD, 'utf8');//permet aux accents de bien passer.

// Check connexion
if ($BD->connect_error) {
    die("Connection failed: " . $BD->connect_error);
}
?>