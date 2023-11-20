<?php

require_once 'src/entries/EntriesModel.php';
require_once 'src/entries/EntryViewHelper.php';

function connectToDb(): PDO {
    $db = new PDO('mysql:host=db; dbname=collection', 'root', 'password');
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $db;
}

$db = connectToDb();

$entriesModel = new EntriesModel($db);

$entries = $entriesModel->getAllEntries();

// echo '<pre>';
// echo var_dump($entries);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="master.css">

    <title>Code snippets home</title>
</head>
<body>
    <?php 
    include 'src/header/header.php';
    ?> 

    <h1 class="page-title">Code Snippets Home</h1>

    <?php
        echo EntryViewHelper::displayAllEntries($entries);
    ?>
    
</body>
</html>


