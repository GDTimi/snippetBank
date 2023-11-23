<?php

require_once 'src/languages/Language.php';

class LanguageViewHelper
{
    public static function displaySingleLanguage(Language $language): string
    {
        $output = "<div class='snippet-language'>$language->name</div>";

        return $output;
    }
}