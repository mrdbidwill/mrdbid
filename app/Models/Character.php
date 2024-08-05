<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Character extends Model
{
    use HasFactory;

    public int $id;

    public string $name;

    public int $display_options;

    public int $look_up_y_n;

    public int $parts;

    public int $source;

    public int $entered_by;

    protected $fillable = [
        'id',
        'name',
        'display_options',
        'look_up_y_n',
        'parts',
        'source',
        'entered_by',
    ];

    public function getId(): string
    {
        return $this->id;
    }

    public function setId(string $id): void
    {
        $this->name = $id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function getDisplayOptions(): int
    {
        return $this->display_options;
    }

    public function setDisplayOptions(int $display_options): void
    {
        $this->display_options = $display_options;
    }

    public function getLookUpYN(): int
    {
        return $this->look_up_y_n;
    }

    public function setLookUpYN(int $look_up_y_n): void
    {
        $this->look_up_y_n = $look_up_y_n;
    }

    public function getParts(): int
    {
        return $this->parts;
    }

    public function setParts(int $parts): void
    {
        $this->parts = $parts;
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

    public function specimens(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
