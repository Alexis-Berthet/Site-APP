<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resultats Admin</title>
    <link rel="stylesheet" href="views/CSS/CSSviewResultatsAdmin.css">
</head>
<body>
<div class="limiter">
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100 ver1">
                <div class="table100-head">
                    <table>
                        <thead>
                        <tr class="row100 head">
                            <th class="cell100 column1">Nom</th>
                            <th class="cell100 column2">Prenom</th>
                            <th class="cell100 column3">Mail</th>
                            <th class="cell100 column4"><a id="test" href="index.php?action=see_test($user)">Tests</a></th>
                            <th class="cell100 column5"><a id="supprimer" href="index.php?action=delete($user)">Supprimer</a></th>
                        </tr>
                        </thead>
                    </table>
                </div>

                <div class="table100-body">
                    <table>
                        <tbody>
                        <tr class="row100 body">
                            <td class="cell100 column1">Like a butterfly</td>
                            <td class="cell100 column2">Boxing</td>
                            <td class="cell100 column3">9:00 AM - 11:00 AM</td>
                            <td class="cell100 column4">Aaron Chapman</td>
                            <td class="cell100 column5">10</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>