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

        // var_dump($snippet->language_id);
        $output .= LanguageViewHelper::displaySingleLanguage($languages[$snippet->language_id - 1]);
        // $output .= LanguageViewHelper::displaySingleLanguage($languages[2]);
        
        $output .= '</div>';

        return $output;
    }
}