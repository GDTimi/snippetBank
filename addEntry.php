<?php

require_once 'src/database/Database.php';

require_once 'src/entries/Entries.php';
require_once 'src/entries/EntriesModel.php';
require_once 'src/languages/LanguagesModel.php';
require_once 'src/snippets/SnippetsModel.php';

$db = connectToDb();

$entrySuccess = false;

// Form submission processing
if(isset($_POST['title'])) {
    $title = $_POST['title'];
    $description = $_POST['description'];

    $entriesModel = new EntriesModel($db);
    $entrySuccess = $entriesModel->addNewEntry($title, $description);

    // Parse the $POST data for snippet(s), insert to the snippets table if found
    if($entrySuccess) {
        $newEntryID = $db->lastInsertId();
        $snippetIDArray = [];
        $snippetIDArray = postToSnippetIDArray($_POST);

        // Loop through the snippet IDs if available, and insert new entries into the snippets table 
        if(count($snippetIDArray) > 0) {
            $snippetsModel = new SnippetsModel($db); 

            foreach ($snippetIDArray as $snippet) {
                $filename = $_POST["{$snippet}_filename"];
                $codesnippet = $_POST["{$snippet}_codesnippet"];
                $entry_id = $newEntryID;
                $language_id = $_POST["{$snippet}_language_id"];
    
                $snippetsModel->addNewSnippet($db, $filename, $codesnippet, $entry_id, $language_id);                         
            } 
        }
    }
}

// Fetching the language data to populate the dropdown options
$languagesModel = new LanguagesModel($db);
$languages = $languagesModel->getAllLanguages();
?>

<!-- Process the $languages data, ready for JS dropdown use -->
<script>
let languagesArrayJSON= <?php echo json_encode($languages); ?>;
let languageOptionsHTMLString = "";

languagesArrayJSON.forEach((language) => { 
languageOptionsHTMLString += `"<option value=${language.id}>${language.name}</option>";`;
}) 
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="master.css">

    <script type="text/javascript" src="src/entries/Entries.js"></script>


    <title>snippetBank() - add new entry</title>
</head>
<body>
    <?php 
    include 'src/header/header.php';
    ?> 

    <h1 class="page-title">addNewEntry(?)</h1>

    <div class="form-container" id="form-container">
        <form class="form" id="entry-form" method="Post">

            <!-- The main code snippet container, where snippets can be added and removed -->
            <div class ="entry-large">
                <h3>Snippet(s):</h3>

                <div id="snippet-hold">

                </div>
            </div>

            <!-- The base entry form-->            
            <label for="title">Title*:</label>
            <input type="text" id="title" name="title" required="true"/>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description"/>

            <script>
                let inputElement = document.createElement('input');
                inputElement.type = "button";
                inputElement.value = "+ snippet";
                inputElement.addEventListener('click', function(){
                    addSnippet(languageOptionsHTMLString);
                });
                document.getElementById('entry-form').appendChild(inputElement);
            </script>

            <input type="submit" id="submit" value="Add new entry" />

            <?php
            if($entrySuccess) {
                echo '<h2>New snippet entry added!</h2>';
            }
            ?>

        </form>  
    </div>
    
</body>
</html>

