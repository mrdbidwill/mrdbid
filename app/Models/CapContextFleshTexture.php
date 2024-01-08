<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CapContextFleshTexture extends Model
{
    private $id;

    private $name;

    private $comments;

    private $description;

    private $source;

    private $entered_by;

    private $created_at;

    private $updated_at;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param  mixed  $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param  mixed  $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return mixed
     */
    public function getComments()
    {
        return $this->comments;
    }

    /**
     * @param  mixed  $comments
     */
    public function setComments(string $comments): void
    {
        $this->comments = $comments;
    }

    public function getDescription()
    {
        return $this->discription;
    }

    /**
     * @param  mixed  $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function getEnteredBy()
    {
        return $this->entered_by;
    }

    /**
     * @param  mixed  $entered_by
     */
    public function setEnteredBy(int $entered_by): void
    {
        $this->entered_by = $entered_by;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @return mixed
     */
    public function getUpdatedAt()
    {
        return $this->updated_at;
    }
}
