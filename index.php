<?php

require_once 'src/entries/EntriesModel.php';

function connectToDb(): PDO {
    $db = new PDO('mysql:host=db; dbname=collection', 'root', 'password');
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $db;
}

$db = connectToDb();

$entriesModel = new EntriesModel($db);

$entries = $entriesModel->getAllEntries();

echo '<pre>';
echo var_dump($entries);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>


