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
        
        SELECT `entries`.`id`, `entries`.`title`, `entries`.`description`,
                `languages`.`id` AS "language id", `languages`.`name`,
                `snippets`.`filename`, `snippets`.`codesnippet` 
            FROM `entries`
                INNER JOIN `languages`
                    ON `entries`.`language_id` = `languages`.`id`
                LEFT JOIN `snippets`
                    ON `snippets`.`entry_id` = `entries`.`id`;
        ');
        $query->execute();
        $entries = $query->fetchAll();

        $entryObjects = [];

        foreach($entries as $entry) {
            $entryObjects[] = new Entry($entry['id'], $entry['title'], $entry['description'], $entry['language id']);
        }

        return $entryObjects;
    }

}