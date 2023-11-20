<?php

require_once 'src/entries/Entry.php';

class EntryViewHelper
{
    public static function displayAllEntries(array $entries): string
    {
        $output = '';

        foreach ($entries as $entry) {
            $output .= '<div class ="entry">';
            $output .= "<h3>$entry->title</h3>";
            $output .= "<p class='entry-description'>$entry->description</p>";
            // Code snippet(s) goes here
            $output .= '</div>';           
        }

        return $output;
    }
}