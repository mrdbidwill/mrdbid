<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataSource extends Model
{
    public string $title;

    public string $author;

    public string $page;

    public int $type;

    public int $comment;

    public int $my_rating;

    public string $my_comment;

    public int $entered_by;

    protected $fillable = [
        'title',
        'author',
        'page',
        'type',
        'comment',
        'my_rating',
        'my_comment',
        'entered_by',
    ];

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $title): void
    {
        $this->title = $title;
    }

    public function getAuthor(): string
    {
        return $this->author;
    }

    public function setAuthor(string $author): void
    {
        $this->author = $author;
    }

    public function getPage(): string
    {
        return $this->page;
    }

    public function setPage(string $page): void
    {
        $this->page = $page;
    }

    public function getType(): int
    {
        return $this->type;
    }

    public function setType(int $type): void
    {
        $this->type = $type;
    }

    public function getComment(): int
    {
        return $this->comment;
    }

    public function setComment(int $comment): void
    {
        $this->comment = $comment;
    }

    public function getMyRating(): int
    {
        return $this->my_rating;
    }

    public function setMyRating(int $my_rating): void
    {
        $this->my_rating = $my_rating;
    }

    public function getMyComment(): string
    {
        return $this->my_comment;
    }

    public function setMyComment(string $my_comment): void
    {
        $this->my_comment = $my_comment;
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
