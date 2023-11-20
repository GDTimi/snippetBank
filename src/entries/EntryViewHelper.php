<?php

require_once 'src/entries/Entry.php';

class EntryViewHelper
{
    public static function displayAllEntries(array $entries): string
    {
        $output = '';

        foreach ($entries as $entry) {
            $output .= '<div>';
            $output .= "<p>$entry->description</p>";
            $output .= "<p>$entry->language_id</p>";
            $output .= '</div>';           
        }

        return $output;
    }
}