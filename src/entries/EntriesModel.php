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

    public function getAllEntries(): array
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

    public function getEntriesByLanguage(int $language_id): array
    {
        $query = $this->db->prepare('
        SELECT *
        FROM `entries`
            INNER JOIN `snippets`
                ON `entries`.`id` = `snippets`.`entry_id`
            INNER JOIN `languages`
                ON `snippets`.`language_id` = `languages`.`id`
                WHERE `snippets`.`language_id` = :language_id
                    GROUP BY `entries`.`id`;
        ');

        $query->bindParam('language_id', $language_id);

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