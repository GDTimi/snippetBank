<?php

require_once 'src/entries/Entry.php';
require_once 'src/snippets/SnippetViewHelper.php';

class EntryViewHelper
{
    public static function displayAllEntries(array $entries, array $snippets, array $languages): string
    {
        $output = '';

        foreach ($entries as $entry) {
            $output .= '<div class ="entry">';
            $output .= "<h3>$entry->title</h3>";
            $output .= "<p class='entry-description'>$entry->description</p>";
            
            // Code snippet(s) inserted here as required
            foreach($snippets as $snippet) {
                if($snippet->entry_id === $entry->id) {
                    $output .= SnippetViewHelper::displaySingleSnippetMini($snippet, $languages);
                }
            }
            $output .= '</div>';           
        }

        return $output;
    }
}