<?php
require "modeles/database_connexion.php";
require "modeles/model.php";

function seeHome()
{
    require "views/template/header.php";
    require "views/viewHome.php";
    require "views/template/footer.php";
}

function seeConnexion()
{
    see_header();
    switch ($_SESSION["role"]) {
        case "gest" :
            require "views/viewAccueilGestionnaire.php";
            break;
        case "admin" :
            require "views/viewAccueilAdmin.php";
            break;
        case "user" :
            require "views/viewResultatsUtilisateur.php";
        default :
            require "views/viewConnexion.php";
            break;
    }
    require "views/template/footer.php";
}

function seeMotDePasseOublie()
{
    require "views/template/header.php";
    require "views/viewMotDePasseOublie.php";
    require "views/template/footer.php";
}

function seeContact()
{
    require "views/template/header.php";
    require "views/viewContact.php";
    require "views/template/footer.php";
}

function seeForum()
{
    require "views/template/header.php";
    require "views/viewForum.php";
    require "views/template/footer.php";
}

function erreurConnexion()
{
    require "views/template/header.php";
    require "views/viewConnexion.php";
    echo "Cette combinaison adresse mail et mot de passe est incorrecte";
    require "views/template/footer.php";
}

function mentions()
{
    require "views/template/header.php";
    require "views/viewMentions.php";
    require "views/template/footer.php";
}

function connexion()
{
    if ($_POST["identifiant"] && $_POST["mot_de_passe"]) {
        $identifiant = htmlspecialchars($_POST["identifiant"]);
        $mot_de_passe = htmlspecialchars($_POST["mot_de_passe"]);
        $mail = checkIn($identifiant, $mot_de_passe);
        if ($mail[0] == $identifiant) {
            $id = getID($identifiant);
            $role = getRole($identifiant);
            $_SESSION["inscriptionID"] = $id[0];
            $_SESSION["role"] = $role[0];
            seeConnexion();
        } else {
            erreurConnexion();
        }
    } else {
        erreurConnexion();
    }
}

function see_donnees_utilisateur()
{
    require "views/template/header.php";
    require "views/viewInscrireGestionnaire.php";
    require "views/template/footer.php";

}

function see_inscrire_gestionnaire()
{
    require "views/template/header.php";
    require "views/viewInscrireGestionnaire.php";
    require "views/template/footer.php";

}

function see_supprimer_gestionnaire()
{
    require "views/template/header.php";
    require "views/viewInscrireGestionnaire.php";
    require "views/template/footer.php";

}

function see_inscrire_nouvel_utilisateur()
{
    require "views/template/header.php";
    require "views/viewInscrireGestionnaire.php";
    require "views/template/footer.php";

}

function see_supprimer_utilisateur()
{
    require "views/template/header.php";
    require "views/viewInscrireGestionnaire.php";
    require "views/template/footer.php";
}

function see_user_data()
{
    see_header();
    require "views/viewResultatsUtilisateur.php";
    require "views/template/footer.php";
}

function see_header()
{
    switch ($_SESSION["role"]) {
        case "admin" :
            require "views/template/headerAdmin.php";
            break;
        case "gest" :
            require "views/template/headerGest.php";
            break;
        case "user":
            require "views/template/headerUtilisateur.php";
            break;
        default :
            require "views/template/header.php";
    }
}
