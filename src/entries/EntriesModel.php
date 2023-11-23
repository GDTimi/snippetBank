<?php

require_once 'src/entries/Entry.php';

// EntriesModel, to handle database queries for the entries table
class EntriesModel
{
    public PDO $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function getAllEntries()
    {
        $query = $this->db->prepare('
        SELECT `id`, `title`, `description`
            FROM `entries`;
        ');
        $query->execute();
        $entries = $query->fetchAll();

        $entryObjects = [];

        foreach($entries as $entry) {
            $entryObjects[] = new Entry($entry['id'], $entry['title'], $entry['description']);
        }

        return $entryObjects;
    }

    public function addNewEntry(string $title, string $description): bool 
    {

        $query = $this->db->prepare('
            INSERT INTO `entries` (`title`, `description`)
                VALUES (:title, :description);
            ');
    
        // Bind params
        $query->bindParam(':title', $title);
        $query->bindParam(':description', $description);
    
        $success = $query->execute();
        return $success;
    }

}