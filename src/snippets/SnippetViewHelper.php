<?php

require_once 'src/snippets/Snippet.php';

class SnippetViewHelper
{
    public static function displaySingleSnippetMini(Snippet $snippet): string
    {
        $output = '<div class="snippet-container">';
        $output.= "<textarea class='snippet-codeblock-mini' readonly>$snippet->codesnippet</textarea>";
        $output.= '</div>';

        return $output;
    }
}