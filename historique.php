<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="Historique.css">
        <title>Historique</title>
    </head>
    <body>
    	

    	<h3>Historique des tests :</h3>
   
    	<br>   		
    	<br> 
    	<br> 
    	
    	<?php
    	
		if (!isset($_POST['numero']))
		{
			?>
			
        	<form action="Historique.php" method="post">
            <p>Entrez un numéro d'utilisateur
            
            <input name="numero" />
            <input type="submit" value="Valider" />
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
            
            $reponse = $bdd->query('SELECT * FROM test WHERE Personne_N°Inscription ='.$_POST['numero'].' ');
            
			while ($donnees = $reponse->fetch())
            {
                $Color = "white";
                echo '<center>'.'<div style="Color:'.$Color.'">'.'Test numéro '.$donnees['n°test']. ' effectué le : '. $donnees['date'] .'<a class="lien" href="http://google.fr">  Lien vers le test '.$donnees['n°test'].'</a>'.'<br />'.'</div>';
            }
            $reponse->closeCursor(); 

		}

		?>
		
    </body>
</html>
