<?php

require_once 'src/database/Database.php';

use PHPUnit\Framework\TestCase;

class DatabaseTest extends TestCase
{
    public function test_connectToDb_success(): void
    {
        $db = $this->createMock(PDO::class);

        $this->assertIsObject($db);
    }

    public function test_connectToDb_malformed(): PDO
    {
        $db = "Incorrect type";

        // Telling PHPUnit that we WANT to get a type error
        $this->expectException(TypeError::class);

        return $db;
    }
}

?>