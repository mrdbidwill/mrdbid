<?php

namespace Database\Factories;

use App\Models\Specimen;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Specimen>
 */
class SpecimenFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => fake()->numberBetween(1, 1000),
            'specimen_name' => fake()->lastName(),
            'common_name' => fake()->firstName(),
            'description' => 'Generic description',
            'comment' => 'Generic comment',
            'specimen_location_now' => fake()->numberBetween(1, 5),
            'location_found_city' => fake()->city(),
            'location_found_county' => 'Generic county',
            'state' => fake()->numberBetween(1, 70),
            'country' => fake()->numberBetween(1, 3),
            'location_public_y_n' => fake()->numberBetween(0, 1),
            'share_data_y_n' => fake()->numberBetween(0, 1),
            'month_found' => fake()->numberBetween(1, 12),
            'day_found' => fake()->numberBetween(1, 31),
            'year_found' => fake()->numberBetween(2000, 2023),
            'fungus_type' => fake()->numberBetween(1, 5),
            'entered_by' => fake()->numberBetween(1, 5),
        ];
    }
}
