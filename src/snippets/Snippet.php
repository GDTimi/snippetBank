<?php

// Snippet entity class, to represent data from the database
readonly class Snippet
{
    public int $id;
    public string $filename;
    public string $codesnippet;
    public int $entry_id;
    public int $language_id;

    public function __construct(int $id, string $filename, string $codesnippet, int $entry_id, int $language_id)
    {
        $this->id = $id;
        $this->filename = $filename;
        $this->codesnippet = $codesnippet;
        $this->entry_id = $entry_id;
        $this->language_id = $language_id;
    }

}