<?php

// Entry entity class, to represent data from the database
readonly class Entry
{
    public int $id;
    public string $title;
    public string $description;

    public function __construct(int $id, string $title, string $description)
    {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
    }

}