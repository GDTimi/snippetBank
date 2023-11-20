<?php

// Entity class - Entry
readonly class Entry
{
    public int $id;
    public string $description;
    public int $language_id;

    public function __construct(int $id, string $description, int $language_id)
    {
        $this->id = $id;
        $this->description = $description;
        $this->language_id = $language_id;
    }

}