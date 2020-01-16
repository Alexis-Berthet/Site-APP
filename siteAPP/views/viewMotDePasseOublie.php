<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="views/CSS/CSSviewMotDePasseOublie.css">
    <title>Mot de passe oublié</title>
</head>

<body>
    
    <br/> <br/>
    
    <div class="mot_de_passe_oublie">
        <br/>
        <form method="post" action="index.php?action=mot_de_passe_oublie">
            <h3> Mot de passe oublié ? </h3>
            <p id="saisie_mail"> Saisir votre adresse mail pour recevoir le code de vérification: </p>
            <br/> 
            <input placeholder="Email" type="email" name="email" id="email" required>
            <label for="email"> </label>
                     
            <br/> <br/>
            <input type="submit" value="Envoyer"> 
            <br/> <br/>
    </div> 
    <br/> <br/>
    
</body>
</html>