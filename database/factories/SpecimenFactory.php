<?php

namespace Database\Factories;

use App\Models\Specimen;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

class SpecimenFactory extends Factory
{
    protected $model = Specimen::class;

    public function definition(): array
    {
        return [
            'specimen_name' => $this->faker->name(),
            'specimen_owner' => $this->faker->randomNumber(),
            'comments' => $this->faker->word(),
            'common_name' => $this->faker->name(),
            'date_month_found' => $this->faker->randomNumber(),
            'date_day_found' => $this->faker->randomNumber(),
            'date_year_found' => $this->faker->randomNumber(),
            'location_found_county' => $this->faker->word(),
            'location_found_city' => $this->faker->city(),
            'state' => $this->faker->randomNumber(),
            'country' => $this->faker->country(),
            'annulus_position' => $this->faker->randomNumber(),
            'cap_context_flesh_texture' => $this->faker->randomNumber(),
            'entered_by' => $this->faker->randomNumber(),
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ];
    }
}
