<?php

require_once 'src/languages/Language.php';

// LanguagesModel, to handle database queries for the languages table
class LanguagesModel
{
    public PDO $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function getLanguageById(int $id): Language 
    {
        $query = $this->db->prepare('SELECT `id`, `name` FROM `languages` WHERE `id` = :id;');
        $query->bindParam(':id', $id);
        $query->execute();
        $language = $query->fetch();

        $languageObject = new Language(
            $language['id'], 
            $language['name'], 
        );
        return $languageObject;
    }

    public function getAllLanguages()
    {
        $query = $this->db->prepare('
        SELECT `id`, `name`
        FROM `languages`;
        ');
        $query->execute();
        $languages = $query->fetchAll();

        $languageObjects = [];

        foreach($languages as $language) {
            $languageObjects[] = new Language($language['id'], $language['name']);
        }

        return $languageObjects;
    }

}