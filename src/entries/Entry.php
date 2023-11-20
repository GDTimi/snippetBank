<?php

// Entry entity class, to represent data from the database
readonly class Entry
{
    public int $id;
    public string $title;
    public string $description;
    public int $language_id;

    public function __construct(int $id, string $title, string $description, int $language_id)
    {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->language_id = $language_id;
    }

}