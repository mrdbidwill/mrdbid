<?php

namespace Database\Factories;

use App\Models\SpecimenGroup;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

class SpecimenGroupFactory extends Factory
{
    protected $model = SpecimenGroup::class;

    public function definition(): array
    {
        return [
            'member_id' => $this->faker->randomNumber(),
            'name' => $this->faker->name(),
            'comments' => $this->faker->word(),
            'description' => $this->faker->text(),
            'entered_by' => $this->faker->randomNumber(),
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ];
    }
}
