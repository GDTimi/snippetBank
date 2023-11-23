<?php

require_once 'src/entries/entries.php';

use PHPUnit\Framework\TestCase;

class EntriesTest extends TestCase
{
    public function test_postToSnippetIDArray_successWithResults(): void
    {
        // Prepare some test inputs
        $inputArray = [
            "snippet0_filename" => "Test.html",
            "snippet0_codesnippet" => "Test code for snippet",
            "snippet0_language_id" => "3",
            "title" => "Test",
            "description" => ""
        ]; 

        // Set an expected result
        $expected = ["snippet0"];

        // Compare the expected result with the actual result
        $result = postToSnippetIDArray($inputArray);
        $this->assertEquals($expected, $result);
    }

    public function test_postToSnippetIDArray_successNoResults(): void
    {
        // Prepare some test inputs
        $inputArray = [
            "title" => "Test",
            "description" => ""
        ]; 

        // Set an expected result
        $expected = [];

        // Compare the expected result with the actual result
        $result = postToSnippetIDArray($inputArray);
        $this->assertEquals($expected, $result);
    }
}
?>