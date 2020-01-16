<?php

function checkIn($identifiant, $mot_de_passe)
{
    $db = dbConnect();
    $mot_de_passe = hash($mot_de_passe);
    $req = $db->prepare("SELECT adresseMail FROM personne WHERE adresseMail=:identifiant AND motDePasse=:mot_de_passe");
    $req->bindValue(':identifiant', $identifiant);
    $req->bindValue(':mot_de_passe', $mot_de_passe);
    $req->execute();
    return $req->fetch();
}

function getID($identifiant)
{
    $db = dbConnect();
    $req = $db->prepare("SELECT N°Inscription FROM personne WHERE adresseMail=:identifiant");
    $req->bindValue(':identifiant', $identifiant);
    return $req->fetch();
}

function getRole($identifiant)
{
    $db = dbConnect();
    $req = $db->prepare("SELECT role FROM personne WHERE adresseMail=:identifiant");
    $req->bindValue(':identifiant', $identifiant);
    $req->execute();
    return $req->fetch();
}