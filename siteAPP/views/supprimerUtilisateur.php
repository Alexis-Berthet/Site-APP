<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="supprimerUtilisateur.css">
        <title>SuppUtil</title>
    </head>
    <body>
        

        <h3>Supprimer un utilisateur :</h3>
   
        <br>        
        <br> 
        <br> 
        
        <?php
        
        if (!isset($_POST['numero']))
        {
            ?>
            
            <form action="SuppUtil.php" method="post">
            <p>Entrez un numéro d'utilisateur à supprimer : 
            
            <input name="numero" />
            <input type="submit" value="Supprimer" />
            </p>
            </form>
            <?php
        }
        
        else
        {
            
            try
            {
                $bdd = new PDO('mysql:host=localhost;dbname=mydb;charset=utf8', 'root', '');
            }
            catch(Exception $e)
            {
                die('Erreur : '.$e->getMessage());
            }
         
            $reponse = $bdd->query('SELECT * FROM personne WHERE N°Inscription ='.$_POST['numero'].' ');
            $request = $bdd->query('DELETE * FROM personne WHERE  N°Inscription ='.$_POST['numero'].'');
            while ($donnees = $reponse->fetch())
            {
                $resultat = $bdd->query($request);
                //$bdd->query($request);
                if ($resultat == FALSE) { 
                    $Color = "white";
                    echo '<center>'.'<div style="Color:'.$Color.'">'.'Echec de la requête.<br />'; 
                } 
                else { 
                    $Color = "white";
                    echo '<center>'.'<div style="Color:'.$Color.'">'.$donnees['nom'].' '.$donnees['nom'].' a bien été supprimé'.'</div>';
                }
                
                 
            }
            $reponse->closeCursor(); 

        }

        ?>
        
    </body>
</html>
