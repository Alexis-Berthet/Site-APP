<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="views/CSS/CSSviewConnexion.css">
    <title>Page de connexion</title>
</head>
<body>
<br/> <br/>

<div class="connect">
    <br/>
    <form method="post" action="index.php?action=connexion">
        <label for="identifiant">
            <input placeholder=" Identifiant" type="text" name="identifiant" id="identifiant" required>
        </label>
        <br/> <br/>
        <label for="Mot de passe">
            <input placeholder=" Mot de passe (8 caractères minimum)" type="password" name="mot_de_passe"
                   id="mot de passe"
                   minlength="8" required>
        </label>
        <br/> <br/>
        <input type="submit" value="Se connecter">

        <p id="mdp_oublie"><a href="index.php?action=see_mot_de_passe_oublie">Mot de passe oublié</a></p>

        <br/> <br/>
</div>
<br/> <br/>
</body>
</html>


