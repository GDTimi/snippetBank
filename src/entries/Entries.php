<?php

/* Entries functions for data processing and handling */

function postToSnippetIDArray(array $postArray): array {
    $snippetIDArray = [];

        // Populate the snippet ID array with unique snippet IDs
        foreach ($postArray as $key => $value) {
            if(str_starts_with($key, "snippet")) {
                $snippetIDArray[] = strtok($key, '_') ;
            }
           }
    $snippetIDArray = array_unique($snippetIDArray);

    return $snippetIDArray;
}

?>