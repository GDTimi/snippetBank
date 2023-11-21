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

    <h1 class="page-title" id="test">addNewEntry(?)</h1>

    <!-- The main code snippet container -->
    <div class ="entry-large">
        <h3>Snippets:</h3>

        <div id="snippet-hold">

        </div>
    </div>

    <div class="form-container" id="form-container">
        <form class="form" method="Post">
            <label for="title">Title (optional):</label>
            <input type="text" id="title" name="title"/>

            <label for="description">Description (optional):</label>
            <input type="text" id="description" name="description"/>

            <input type="button" id="dummy" value="+ snippet" onclick="addSnippet();"/>

            <input type="submit" id="submit" value="Add new entry" />
        </form>  
    </div>
    
</body>
</html>