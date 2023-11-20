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
        $query = $this->db->prepare('SELECT * FROM `entries`;');
        $query->execute();
        $entries = $query->fetchAll();

        $entryObjects = [];

        foreach($entries as $entry) {
            $entryObjects[] = new Entry($entry['id'], $entry['description'], $entry['language_id']);
        }

        return $entryObjects;
    }

}