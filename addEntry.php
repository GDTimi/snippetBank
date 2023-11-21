<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="master.css">

    <title>Add Entry</title>
</head>
<body>
    <?php 
    include 'src/header/header.php';
    ?> 

    <h1 class="page-title">addNewEntry(?)</h1>

    <div class="form-container">
        <form class="form" method="Post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required="false"/>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required="false"/>

            <input type="button" value="Add snippet" />

            <input type="submit" value="Add new entry" />
        </form>  
    </div>
    
</body>
</html>