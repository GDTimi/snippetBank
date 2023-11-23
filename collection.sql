# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 11.1.2-MariaDB-1:11.1.2+maria~ubu2204)
# Database: collection
# Generation Time: 2023-11-22 15:21:31 +0000
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
	(23,'PHPUnit setup and usage','');

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
	(5,'SQL');

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
	(24,'','<?php\r\n\r\n// Installing PHPUnit:\r\n// Create a .gitignore file in the root of your project that just contains the word vendor\r\n// Git add, commit and push the ignore file\r\n// Run composer require --dev phpunit/phpunit\r\n// Add commit and push the json files created\r\n// Good to go!\r\n\r\n// Running PHP Unit:\r\n// from the root of your repo, use the cmd: phpunit tests\r\n// where tests is the name of the folder that contains the unit tests',23,2);

/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
