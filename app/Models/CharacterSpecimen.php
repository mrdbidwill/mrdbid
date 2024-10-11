<?php

namespace App\Models;

use App\Models\Lookup\Character;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use LaravelIdea\Helper\App\Models\_IH_CharacterSpecimen_C;
use LaravelIdea\Helper\App\Models\Lookup\_IH_Character_C;

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

    public static function getUnSetCharactersBySpecimenId($specimen_id)
    {
        $setCharacterIds = self::getSetCharactersBySpecimenId($specimen_id);
        //dd($setCharacterIds);

        // dd(Character::whereNotIn('id', $setCharacterIds)->get());

        return Character::whereNotIn('id', $setCharacterIds)->get();
    }

    public static function getSetCharactersBySpecimenId($specimen_id)
    {
        return self::where('specimen_id', $specimen_id)->pluck('character_id')->all();
    }

    public function getAllCharacters(): Collection|array|_IH_Character_C
    {
        // Method that should return a collection of all character
        return Character::all(); // For example
    }

    public function getSetCharacters(): _IH_CharacterSpecimen_C|array
    {
        // Method that should return a collection of set characters
        return CharacterSpecimen::where('specimen_id=$specimen_id', true)->get(); // Example
    }
}
