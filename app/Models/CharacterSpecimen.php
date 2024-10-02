<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CharacterSpecimen extends Model
{
    use HasFactory;

    protected $table = 'character_specimens';

    protected $fillable = [
        'id',
        'character_id',
        'specimen_id',
        'character_value',
        'entered_by',
    ];

    /*
    public function index(): View
    {

        $character_specimen = CharacterSpecimen::get();

        return view('character_specimens.index', ['character_specimens' => $character_specimen]);
    }
*/

    public static function getSetCharactersBySpecimenId($specimen_id)
    {
        return self::where('specimen_id', $specimen_id)->get();
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getCharacterId(): int
    {
        return $this->character_id;
    }

    public function setCharacterId(int $character_id): void
    {
        $this->character_id = $character_id;
    }

    public function getSpecimenId(): int
    {
        return $this->specimen_id;
    }

    public function setSpecimenId(int $specimen_id): void
    {
        $this->specimen_id = $specimen_id;
    }

    public function getCharacterValue(): string
    {
        return $this->character_value;
    }

    public function setCharacterValue(string $character_value): void
    {
        $this->character_value = $character_value;
    }

    public function getEnteredBy(): int
    {
        return $this->entered_by;
    }

    // Method to get character_specimens by specimen_id

    public function setEnteredBy(int $entered_by): void
    {
        $this->entered_by = $entered_by;
    }
}
