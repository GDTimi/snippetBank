<?php

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
$languageName = 'All';
$language_id = 0;
$search_text = "";

// Process the entries based on any filter parameters
if (isset($_GET['language_id']) && isset($_GET['search_text'])) {
    $language_id = $_GET['language_id'];
    $search_text = $_GET['search_text'];

    if($language_id > 0) {
        $language = $languagesModel->getLanguageById($language_id);
        $languageName = $language->name;  
        $language_id = $language->id;      
    }

    $entries = $entriesModel->getEntriesByParameters($language_id, $search_text);

} else {
    $entries = $entriesModel->getAllEntries();    
}

?>

<!-- Process the $languages data, ready for JS dropdown use -->
<script>
let languagesArrayJSON= <?php echo json_encode($languages); ?>;
let languageOptionsHTMLString = "<option value=0>All</option>";

let languageDefault = <?php echo $language_id ?>;

languagesArrayJSON.forEach((language) => {
    // Set the default value if it matches
    if(language.id == languageDefault) {
        languageOptionsHTMLString += `"<option value=${language.id} selected="selected">${language.name}</option>";`;
    } else {
        languageOptionsHTMLString += `"<option value=${language.id}>${language.name}</option>";`;
    }
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

    echo "<h1 class='page-title'>snippetBank($languageName)</h1>";
    ?> 

    <div class="form-container" id="form-container">
        <form class="form" action="index.php" id="filterForm" method="GET">
            <script>
            let div = document.createElement('div');
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
            <div>
            <label for="searchText">Search text:</label>
            <input type="text" name="search_text" value= <?php echo $search_text; ?>>  
            </div>
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