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

    public function getAllSnippets(): Array
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

    public function addNewSnippet($db, string $filename, string $codesnippet, int $entry_id, int $language_id): bool 
    {
        $query = $db->prepare(
            'INSERT INTO `snippets` (`filename`, `codesnippet`, `entry_id`, `language_id`)
                VALUES (:filename, :codesnippet, :entry_id, :language_id);'
            );
    
        // Bind params
        $query->bindParam(':filename', $filename);
        $query->bindParam(':codesnippet', $codesnippet);
        $query->bindParam(':entry_id', $entry_id);
        $query->bindParam(':language_id', $language_id);
    
        $success = $query->execute();
        return $success;
    }
}