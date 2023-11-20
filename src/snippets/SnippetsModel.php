<?php

require_once 'src/snippets/Snippet.php';

// EntriesModel, to handle database queries for the entries table
class SnippetsModel
{
    public PDO $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function getAllSnippets()
    {
        $query = $this->db->prepare('
        SELECT `id`, `filename`, `codesnippet`, `entry_id`, `language_id`
        FROM `snippets`;
        ');
        $query->execute();
        $snippets = $query->fetchAll();

        $snippetObjects = [];

        foreach($snippets as $snippet) {
            $snippetObjects[] = new Snippet(
                $snippet['id'], 
                $snippet['filename'], 
                $snippet['codesnippet'],
                $snippet['entry_id'],
                $snippet['language_id']
            );
        }

        return $snippetObjects;
    }
}