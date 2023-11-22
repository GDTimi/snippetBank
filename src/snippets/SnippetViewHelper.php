<?php

require_once 'src/snippets/Snippet.php';
require_once 'src/languages/LanguageViewHelper.php';

class SnippetViewHelper
{
    public static function displaySingleSnippetMini(Snippet $snippet, array $languages): string
    {
        $output = '<div class="snippet-container">';
        
        $output .= "<div class='snippet-filename'>$snippet->filename</div>";
        $output .= "<textarea class='snippet-codeblock-mini' readonly>$snippet->codesnippet</textarea>";
        $output .= LanguageViewHelper::displaySingleLanguage($languages[$snippet->language_id - 1]);
        
        $output .= '</div>';

        return $output;
    }
}