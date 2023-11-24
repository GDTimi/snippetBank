# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 11.1.2-MariaDB-1:11.1.2+maria~ubu2204)
# Database: collection
# Generation Time: 2023-11-24 10:00:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `title`, `description`)
VALUES
	(2,'Codewars 6 kyu: Multiples of 3 or 5','If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.\n\nFinish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.\n\nAdditionally, if the number is negative, return 0.\n\nNote: If the number is a multiple of both 3 and 5, only count it once.'),
	(3,'Fading button','Adding a fading effect to an HTML5 button using CSS'),
	(4,'Link Tables','Solves the problem of needing to have more than one ID, allows many to many relationships. \n\nCreate a new table that only holds ‘parent’ and matching ‘child’ IDs.'),
	(5,'PHPUnit','Inside your project directory:\n	Have a subdirectory named tests\n	Inside the tests directory, you must have a file for every PHP file inside your application (with the same filenames)\n	Test files should include the real files using require to get access to the actual function to be tested'),
	(6,'Props in React','Data can be passed into components via props. This data can then be accessed by the specified props and the dot accessor.'),
	(7,'Media query','CSS feature to apply different styling depending on different “media”.'),
	(21,'PHPUnit example (cow)','An example of setting up unit tests using PHPUnit'),
	(22,'Basic Database connect function','A simple function to setup a connection to a DB in PHP.'),
	(23,'PHPUnit setup and usage',''),
	(25,'Button over Image','https://www.w3schools.com/howto/howto_css_button_on_image.asp'),
	(27,'JavaScript Event Listener','How to setup an event listener in JS'),
	(32,'Test',''),
	(33,'Processing URL Params in PHP','Example code of setting up and passing parameters in the URL, then using $_GET to use it.');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `name`)
VALUES
	(1,'JavaScript'),
	(2,'PHP'),
	(3,'HTML'),
	(4,'CSS'),
	(5,'SQL'),
	(6,'Visual Basic');

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `snippets`;

CREATE TABLE `snippets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `codesnippet` mediumtext NOT NULL,
  `entry_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;

INSERT INTO `snippets` (`id`, `filename`, `codesnippet`, `entry_id`, `language_id`)
VALUES
	(1,'','function solution(number){\n  if (number >= 0) {\n    let total = 0;\n    \n    for (let i = 0; i < number; i++) {\n      if (i % 3 == 0 || i % 5 == 0) {\n        total += i;\n      }\n    }\n    \n    return total;\n  }\n  \nreturn 0;\n}',2,1),
	(2,'index.html','<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\n<link rel=\"stylesheet\" href=\"index.css\">\n\n</head>\n<body>\n\n<h2>Fading Buttons - \"Fade out Effect\"</h2>\n\n<button class=\"btn\">Hover Over Me</button>\n\n</body>\n</html>',3,3),
	(3,'index.css','.btn {\n  background-color: #f4511e;\n  border: none;\n  color: white;\n  padding: 16px 32px;\n  text-align: center;\n  font-size: 16px;\n  margin: 4px 2px;\n  opacity: 1;\n  transition: 0.3s;\n}\n\n.btn:hover {opacity: 0.6}',3,4),
	(4,'','SELECT *\n	FROM `tablename`\n	INNER JOIN `linktablename`\n		ON `tablename`.`id` = `linktablename`.`id`\n	INNER JOIN `othertablename`\n		ON `linktablename`.`id` = `othertablename`.`id`;',4,5),
	(5,'GreeterTest.php','<?php \n  \nrequire_once \'src/Greeter.php\'; \nrequire_once \'src/User.php\'; \n  \nuse PHPUnit\\Framework\\TestCase; \n  \nclass GreeterTest extends TestCase \n{ \n   public function test_getMessage_fnameOnly(): void \n   { \n        $mockUser = $this->createMock(User::class); \n        $mockUser->method(\'getFirstName\')->willReturn(\'Ash\'); \n        $mockUser->method(\'getLastName\')->willReturn(\'\'); \n  \n        $expected = \'Welcome Ash\'; \n  \n        $greeter = new Greeter($mockUser); \n        $result = $greeter->getMessage(); \n  \n        $this->assertEquals($expected, $result); \n   }  \n  \n   public function test_getMessage_bothNames(): void \n   { \n    $mockUser = $this->createMock(User::class); \n    $mockUser->method(\'getFirstName\')->willReturn(\'Ash\'); \n    $mockUser->method(\'getLastName\')->willReturn(\'Coles\');     \n  \n    $expected = \'Hello Ash Coles!\';   \n     \n    $greeter = new Greeter($mockUser); \n    $result = $greeter->getMessage(); \n  \n    $this->assertEquals($expected, $result); \n   } \n} ',5,2),
	(6,'Button.jsx','function Button (props) { \n	return ( \n	<a className={\"button \" + props.colour} href={props.link} target=\"_blank\">{props.text}</a> \n	)\n} ',6,1),
	(7,'Button.css','.button { \n	background-color: teal; \n	font-size: 1.5rem; \n	padding: 10px; \n	border-radius: 8px; \n	box-shadow: 2px 2px 4px black; \n \n	margin: 20px; \n} \n \n.button.red { \n	background-color: red; \n} \n \n.button.green { \n	background-color: green; \n} ',6,4),
	(8,'App.jsx','function App() { \n\n	return ( \n	<> \n	<Button text=\"Red\" link=\"http://www.youtube.com\" colour=\"red\"/> \n  \n	<Button text=\"Learn more\" link=\"http://www.youtube.com\" /> \n \n	<Button text=\"Green\" link=\"http://www.facebook.com\" colour=\"green\"/> \n	</> \n	) \n} ',6,1),
	(9,'','/* mobile first - default styling will be a column layout */\nmain {\n  	display: flex;\n	flex-direction: column;\n	flex-wrap: nowrap;\n}\n\n/* we create a breakpoint at 400px screen width - any bigger and the layout will be a row */\n@media screen and (min-width: 400px) {\n	flex-direction: row;\n  	flex-wrap: wrap;\n}\n\n/* we can choose to have even more breakpoints if we care that much */\n@media screen and (min-width: 800px) {\n  	flex-wrap: nowrap; /* on a large screen, the row is not allowed to wrap */\n}',7,4),
	(20,'Cow.php','<?php\r\n\r\ndeclare(strict_types=1);\r\n\r\nclass Cow\r\n{\r\n    public function eat(Grass $food): string\r\n    {\r\n        return \"mmmm {$food->getFoodType()}\";\r\n    }\r\n}',21,2),
	(21,'Grass.php','<?php\r\n\r\ndeclare(strict_types=1);\r\n\r\nclass Grass\r\n{\r\n    private string $foodType = \'Grass\';\r\n\r\n    public function getFoodType(): string\r\n    {\r\n        return $this->foodType;\r\n    }\r\n}',21,2),
	(22,'CowTest.php','<?php\r\n\r\nrequire_once \'src/Cow.php\';\r\nrequire_once \'src/Grass.php\';\r\n\r\nuse PHPUnit\\Framework\\TestCase;\r\n\r\nclass CowTest extends TestCase\r\n{\r\n    public function test_eat_success(): void\r\n    {\r\n        // Because the Cow now depends on another object (Grass)\r\n        // we don\'t just pass the dependency into the Cow\r\n        // because that is not a unit test - testing 2 things at once\r\n\r\n        // Instead, we make a fake \'mock\' version of the dependency\r\n        $grassMock = $this->createMock(Grass::class);\r\n        // We look at what methods the mock needs to have\r\n        // and we make a dumb fake version of those methods\r\n        $grassMock->method(\'getFoodType\')->willReturn(\'Grass\');\r\n\r\n        // Set the result we expect\r\n        $expected = \'mmmm Grass\';\r\n\r\n        $cow = new Cow();\r\n        // We pass our mock version of grass into a cow\r\n        $result = $cow->eat($grassMock);\r\n\r\n        // Perform an assertion\r\n        $this->assertEquals($expected, $result);\r\n    }\r\n\r\n    // With malformed tests, we are making sure the function /\r\n    // object properly rejects the wrong kind of data\r\n    public function test_eat_malformed(): void\r\n    {\r\n        // Creating a test input that is the wrong data type\r\n        $testFood = [\'Grass\', \'Hay\'];\r\n\r\n        // Telling PHPUnit that we WANT to get a type error\r\n        $this->expectException(TypeError::class);\r\n\r\n        $cow = new Cow();\r\n        $cow->eat($testFood);\r\n        // Trigger the type error, because we\'re passing\r\n        // in the wrong datatype\r\n    }\r\n}',21,2),
	(23,'','<?php\r\n\r\nfunction connectToDb(): PDO {\r\n    $db = new PDO(\'mysql:host=db; dbname=onlinestore\', \'root\', \'password\');\r\n    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);\r\n    return $db;\r\n}\r\n\r\n?>',22,2),
	(24,'','<?php\r\n\r\n// Installing PHPUnit:\r\n// Create a .gitignore file in the root of your project that just contains the word vendor\r\n// Git add, commit and push the ignore file\r\n// Run composer require --dev phpunit/phpunit\r\n// Add commit and push the json files created\r\n// Good to go!\r\n\r\n// Running PHP Unit:\r\n// from the root of your repo, use the cmd: phpunit tests\r\n// where tests is the name of the folder that contains the unit tests',23,2),
	(26,'','<div class=\"container\">\r\n  <img src=\"img_snow.jpg\" alt=\"Snow\">\r\n  <button class=\"btn\">Button</button>\r\n</div> ',25,3),
	(27,'','/* Container needed to position the button. Adjust the width as needed */\r\n.container {\r\n  position: relative;\r\n  width: 50%;\r\n}\r\n\r\n/* Make the image responsive */\r\n.container img {\r\n  width: 100%;\r\n  height: auto;\r\n}\r\n\r\n/* Style the button and place it in the middle of the container/image */\r\n.container .btn {\r\n  position: absolute;\r\n  top: 50%;\r\n  left: 50%;\r\n  transform: translate(-50%, -50%);\r\n  -ms-transform: translate(-50%, -50%);\r\n  background-color: #555;\r\n  color: white;\r\n  font-size: 16px;\r\n  padding: 12px 24px;\r\n  border: none;\r\n  cursor: pointer;\r\n  border-radius: 5px;\r\n}\r\n\r\n.container .btn:hover {\r\n  background-color: black;\r\n} ',25,4),
	(30,'','var inputElement = document.createElement(\'input\');\r\ninputElement.type = \"button\"\r\ninputElement.addEventListener(\'click\', function(){\r\n    gotoNode(result.name);\r\n});\r\n\r\n​document.body.appendChild(inputElement);​',27,1),
	(31,'','var inputElement = document.createElement(\'input\');\r\ninputElement.type = \"button\"\r\ninputElement.addEventListener(\'click\', function(){\r\n    gotoNode(result.name);\r\n});\r\n\r\n​document.body.appendChild(inputElement);​',30,1),
	(34,'Test.html','Test code for snippet',32,3),
	(35,'index.php','<?php\r\nrequire_once \'src/functions.php\';\r\n\r\n$db = connectToDb();\r\n\r\n// Fetch the product data \r\n$query = $db->prepare(\r\n    \'SELECT `id`, `title`, `price`, `image`\r\n    FROM `products`;\'\r\n); \r\n\r\n// Execute the query \r\n$query->execute(); \r\n$result = $query->fetchAll(); \r\n?>\r\n\r\n\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n\r\n    <link rel=\"stylesheet\" href=\"index.css\">\r\n    <title>Products Homepage</title>\r\n</head>\r\n<body>\r\n    <?php \r\n    include \'header.php\';\r\n    ?> \r\n\r\n    <h1 class=\"page-title\">Products Homepage</h1>\r\n\r\n    <div class=\"products\"> \r\n    <?php \r\n    // Loop through the results and display each product one at a time \r\n    foreach ($result as $product) { \r\n        $formattedPrice = number_format((float)$product[\'price\'], 2, \'.\', \'\');\r\n\r\n        echo \'<div class=\"product\">\'; \r\n            echo \"<h3>{$product[\'title\']}</h3>\"; \r\n            // echo \"<div>£{$product[\'price\']}</div>\"; \r\n            echo \"<div>£{$formattedPrice}</div>\"; \r\n            echo \"<img src=\'{$product[\'image\']}\' />\"; \r\n            echo \"<br />\";\r\n            echo \"<a class=\'product-button\' href=\'./editProduct.php?productid={$product[\'id\']}&producttitle={$product[\'title\']}\'>\"; \r\n                echo \"Edit {$product[\'title\']}\"; \r\n            echo \'</a>\'; \r\n\r\n        echo \'</div>\'; \r\n    } \r\n    ?> \r\n    </div>    \r\n\r\n</body>\r\n</html>',33,2),
	(36,'editProduct.php','<?php\r\n\r\nrequire_once \'src/functions.php\';\r\n\r\n$db = connectToDb();\r\n\r\nif (!isset($_GET[\'productid\'])) {\r\n    $productid = 0;\r\n} else {\r\n    $productid = $_GET[\'productid\'];\r\n}\r\n\r\nif(\r\n    isset($_POST[\'title\']) && \r\n    isset($_POST[\'description\']) && \r\n    isset($_POST[\'price\']) &&\r\n    isset($_POST[\'image\']) &&\r\n    isset($_POST[\'category_id\'])\r\n    ) {\r\n    $title = $_POST[\'title\'];\r\n    $description = $_POST[\'description\'];\r\n    $price = $_POST[\'price\'];\r\n    $image = $_POST[\'image\'];\r\n    $category_id = $_POST[\'category_id\'];\r\n\r\n    $db = connectToDb();\r\n\r\n    $success = updateProduct($db, $productid, $title, $description, $price, $image, $category_id);\r\n}\r\n\r\n// Fetch the product data \r\n$query = $db->prepare(\r\n    \'SELECT  `id`, `title`, `description`, `price`, `image`, `category_id`\r\n	    FROM `products`\r\n		    WHERE `id` = :productid;\'\r\n); \r\n\r\n$query->bindParam(\'productid\', $productid);\r\n\r\n// Execute the query \r\n$query->execute(); \r\n$resultProduct = $query->fetch(); \r\n\r\n// Fetch the category data \r\n$query = $db->prepare(\r\n    \'SELECT `id`, `name`\r\n    FROM `categories`;\'\r\n); \r\n\r\n// Execute the query \r\n$query->execute(); \r\n$resultCategories = $query->fetchAll(); \r\n\r\n?>\r\n\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n\r\n    <link rel=\"stylesheet\" href=\"index.css\">\r\n    <title>Add Product</title>\r\n</head>\r\n<body>\r\n    <?php \r\n    include \'header.php\';\r\n    ?> \r\n\r\n    <h1 class=\"page-title\">Edit Product</h1>\r\n    <div class=\"form-container\">\r\n        <form class=\"form\" method=\"Post\">\r\n            <label for=\"title\">Title:</label>\r\n            <input type=\"text\" id=\"title\" name=\"title\" required=\"true\"\r\n                <?php \r\n                    echo \"value=\'{$resultProduct[\"title\"]}\'\";\r\n                ?>            \r\n            />\r\n\r\n            <label for=\"description\">Description:</label>\r\n            <input type=\"text\" id=\"description\" name=\"description\" required=\"true\"\r\n                <?php \r\n                    echo \"value=\'{$resultProduct[\"description\"]}\'\";\r\n                ?>              \r\n            />\r\n\r\n            <label for=\"price\">Price:</label>\r\n            <input type=\"number\" id=\"price\" name=\"price\" step=\"0.01\" required=\"true\"\r\n                <?php \r\n                    echo \"value=\'{$resultProduct[\"price\"]}\'\";\r\n                ?>               \r\n            />\r\n\r\n            <label for=\"image\">Image link:</label>\r\n            <input type=\"text\" id=\"image\" name=\"image\" required=\"true\"\r\n                <?php \r\n                    echo \"value=\'{$resultProduct[\"image\"]}\'\";\r\n                ?>                      \r\n            />\r\n\r\n            <label for=\"category_id\">Category ID:</label>\r\n            <select id=\"category_id\" name=\"category_id\" required=\"true\">\r\n                <?php \r\n                // Loop through the results and populate the categories setting default to the current product category \r\n                foreach ($resultCategories as $category) {\r\n                    if($category[\'id\'] == $resultProduct[\'category_id\']) {\r\n                        echo \"<option value={$category[\'id\']} selected=\'selected\'>\";\r\n                    } else {\r\n                        echo \"<option value={$category[\'id\']}>\";\r\n                    }\r\n                    echo \"{$category[\'name\']}</option>\";\r\n                } \r\n                ?> \r\n            </select>\r\n\r\n            <input type=\"submit\" value=\"Edit product\" />\r\n        </form>  \r\n    </div>\r\n\r\n    <?php\r\n    if(isset($success) && $success) {\r\n        echo \"<div class=\'form-submission-result\'>Product $title has been successfully edited! </div>\";\r\n    } \r\n    ?>\r\n</body>\r\n</html>\r\n',33,2);

/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
