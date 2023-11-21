<?php

require_once 'src/languages/Language.php';

class LanguageViewHelper
{
    public static function displaySingleLanguage(Language $language): string
    {
        $output = '<div>';
        $output .= "<div class='snippet-filename'>$language->name</div>";
        $output .= '</div>';

        return $output;
    }
}