<?php

function checkIn($identifiant, $mot_de_passe)
{
    $db = dbConnect();
    $req = $db->prepare("SELECT mail FROM personne WHERE mail=:identifiant AND mot_de_passe=:mot_de_passe");
    $req->bindValue(':identifiant',$identifiant);
    $req->bindValue(':mot_de_passe',$mot_de_passe);
    $req->execute();
    return $req->fetch();
}

function getID($identifiant)
{
    $db = dbConnect();
    $req = $db->prepare("SELECT inscriptionID FROM personne WHERE mail=:identifiant");
    $req->bindValue(':identifiant',$identifiant);
    return $req->fetch();
}

function getRole($identifiant)
{
    $db = dbConnect();
    $req = $db->prepare("SELECT role FROM personne WHERE mail=:identifiant");
    $req->bindValue(':identifiant',$identifiant);
    $req->execute();
    return $req->fetch();
}