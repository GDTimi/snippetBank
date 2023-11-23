<?php

require_once 'src/database/Database.php';

require_once 'src/entries/EntriesModel.php';
require_once 'src/entries/EntryViewHelper.php';
require_once 'src/languages/LanguagesModel.php';
require_once 'src/snippets/SnippetsModel.php';

$db = connectToDb();

$entriesModel = new EntriesModel($db);
$entries = $entriesModel->getAllEntries();

$snippetsModel = new SnippetsModel($db);
$snippets = $snippetsModel->getAllSnippets();

$languagesModel = new LanguagesModel($db);
$languages = $languagesModel->getAllLanguages();

// Fetching the language data to populate the dropdown options
$languagesModel = new LanguagesModel($db);
$languages = $languagesModel->getAllLanguages();
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

    <h1 class="page-title">snippetBank(All)</h1>

    <div class="form-container" id="form-container">
        <form class="form" id="filter-form" method="Post">
            <select id="language_id" name="language_id" required="true">
            <option value=0>All</option>
            </select>  
        </form>  
    </div>

    <div class="entries"> 
        <?php
            echo EntryViewHelper::displayAllEntries($entries, $snippets, $languages);
        ?>
    </div>
    
</body>
</html>


