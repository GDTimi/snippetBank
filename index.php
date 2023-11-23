<?php

var_dump($_GET);

require_once 'src/database/Database.php';

require_once 'src/entries/EntriesModel.php';
require_once 'src/entries/EntryViewHelper.php';
require_once 'src/languages/LanguagesModel.php';
require_once 'src/snippets/SnippetsModel.php';

$db = connectToDb();

$entriesModel = new EntriesModel($db);

$snippetsModel = new SnippetsModel($db);
$snippets = $snippetsModel->getAllSnippets();

// Fetching the language data to populate the dropdown options
$languagesModel = new LanguagesModel($db);
$languages = $languagesModel->getAllLanguages();

// Process the entries based on any filter parameters
if (isset($_GET['language_id'])) {
    $language_id = $_GET['language_id'];

    if($language_id == 0) {
        $entries = $entriesModel->getAllEntries();
    } else {
        $language = $languagesModel->getLanguageById($language_id);
        
        $entries = $entriesModel->getEntriesByLanguage($language->id);
        var_dump($entries);
    }
} else {
    $entries = $entriesModel->getAllEntries();    
}


?>

<!-- Process the $languages data, ready for JS dropdown use -->
<script>
let languagesArrayJSON= <?php echo json_encode($languages); ?>;
let languageOptionsHTMLString = "<option value=0>All</option>";

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

    <title>Code snippets home</title>
</head>
<body>
    <?php 
    include 'src/header/header.php';
    ?> 

    <h1 class="page-title">snippetBank(All)</h1>

    <div class="form-container" id="form-container">
        <form class="form" action="index.php" id="filterForm" method="GET">
            <script>
            let div = document.createElement('div');
                // div.setAttribute('class', 'snippet-container');
                div.setAttribute('id', 'language_id');
                div.innerHTML = `
                    <label for="language_id">Language:</label>
                    <select id="language_id" name="language_id" required="true">
                        ${languageOptionsHTMLString}              
                        ?> 
                    </select>      
                `;
                document.getElementById('filterForm').appendChild(div);
            </script>

            <input type="submit" id="submit" value="Filter snippets" />
        </form>  
    </div>

    <div class="entries" id="entries"> 
        <?php
            echo EntryViewHelper::displayAllEntries($entries, $snippets, $languages);
        ?>
    </div>
    
</body>
</html>