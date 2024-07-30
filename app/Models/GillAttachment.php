<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GillAttachment extends Model
{
    public string $name;

    public string $description;

    public string $comments;

    public int $source;

    public int $entered_by;

    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    public function getComments(): string
    {
        return $this->comments;
    }

    public function setComments(string $comments): void
    {
        $this->comments = $comments;
    }

    public function getSource(): int
    {
        return $this->source;
    }

    public function setSource(int $source): void
    {
        $this->source = $source;
    }

    public function getEnteredBy(): int
    {
        return $this->entered_by;
    }

    public function setEnteredBy(int $entered_by): void
    {
        $this->entered_by = $entered_by;
    }
}
