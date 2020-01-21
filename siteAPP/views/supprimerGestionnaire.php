<?php
$gestionnaires = $bdd->query('SELECT * FROM gestionnaires');
?>
<form method="post" action="traitement.php">
<table border=1 cellpadding=2 cellspacing=5>
<tr>
    <th> identifiant </th>
    
    <th> nom </th>
                 
    <th> prénom </th>
    <th> mot de passe </th>
                 
    <th> Taille </th>
                 
    <th> Poids </th>
                 
    <th> Age </th>
                 
</tr>
             
<?php
             
while($donnees = $gestionnaires->fetch()){
?>
<tr>
    <td><?php echo $donnees['identifiant'];?></td>
    <td><?php echo $donnees['prénom'];?></td>
        <td><?php echo $donnees['nom'];?></td>
        <td><?php echo $donnees['mot de passe'];?></td>
        <td><?php echo $donnees['Taille'];?></td>
        <td><?php echo $donnees['Poids'];?></td>
        <td><?php echo $donnees['Age'];?></td>
    
    <td><a href="traitement.php?supprimer=<?php echo $donnees['identifiant'];?>">supprimer</a></td>
</tr>
<?php

             
</table>

if(isset($_GET['supprimer'])){ 
         
$req="DELETE FROM gestionnaires WHERE identifiant =  :identifiant";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':identifiant', $_GET['supprimer'], PDO::PARAM_INT);  
$stmt->execute();
}

?>