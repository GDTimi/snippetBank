<?php

require_once 'src/database/Database.php';

require_once 'src/languages/LanguagesModel.php';

// Fetching the language data to populate the dropdown options
$db = connectToDb();
$languagesModel = new LanguagesModel($db);
$languages = $languagesModel->getAllLanguages();

echo "<pre>";
var_dump($_POST);
echo "</pre>";

?>

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


    <title>Add Entry</title>
</head>
<body>
    <?php 
    include 'src/header/header.php';
    ?> 

    <h1 class="page-title">addNewEntry(?)</h1>

    <div class="form-container" id="form-container">
        <form class="form" method="Post">

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

            <input type="button" id="dummy" value="+ snippet" onclick="addSnippet();"/>

            <input type="submit" id="submit" value="Add new entry" />
        </form>  
    </div>
    
</body>
</html>