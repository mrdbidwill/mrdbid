<?php

namespace Database\Factories;

use App\Models\Soup;
use App\Models\Specimen;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

class SoupFactory extends Factory
{
    protected $model = Soup::class;

    public function definition(): array
    {
        return [
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'soup_name' => $this->faker->name(),
            'soup_description' => $this->faker->text(),

            'soup_relation' => Specimen::factory(),
        ];
    }
}
