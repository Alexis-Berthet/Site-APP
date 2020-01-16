<?php
session_start();
require "controllers/controller.php";

if (isset($_GET["action"])) {
    $action = htmlspecialchars($_GET["action"]); // Petite fonction de sécurité

    switch ($action) {
        case "see_home":
            seeHome();
            break;
        case "see_connexion":
            seeConnexion();
            break;
        case "see_mot_de_passe_oublie":
            seeMotDePasseOublie();
            break;
        case "see_contact":
            seeContact();
            break;
        case "see_forum":
            seeForum();
            break;
        case "connexion":
            connexion();
            break;
        case "see_mentions" :
            mentions();
            break;
        case "see_donnees_utilisateurs" :
            see_donnees_utilisateur();
            break;
        case "see_inscrire_gestionnaire" :
            see_inscrire_gestionnaire();
            break;
        case "see_supprimer_gestionnaire" :
            see_supprimer_gestionnaire();
            break;
        case "see_inscrire_nouvel_utilisateur" :
            see_inscrire_nouvel_utilisateur();
            break;
        case "see_supprimer_utilisateur" :
            see_supprimer_utilisateur();
            break;
        case "see_user_data":
            see_user_data();
            break;

        default:
            echo "404 Not found";
            break;
    }
} else {
    $_SESSION["role"]='invite';
    seeHome();
}
