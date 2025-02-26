<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\WithFaker;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

// use Illuminate\Foundation\Testing\RefreshDatabase;

class SpecimenControllerTest extends TestCase
{
    // use RefreshDatabase, WithFaker;
    use WithFaker;

    #[test]
    public function test_it_validates_specimen_creation_data(): void
    {
        // Make a POST request with incomplete data
        $response = $this->post('/specimens', [
            // Intentionally leave out required fields (e.g., 'specimen_name')
            'specimen_name' => '', // This should trigger validation failure
            'common_name' => 'Test Common',
            'description' => 'Test Description',
            'comment' => 'Test Comment',
            'specimen_location_now' => '', // Example of missing required field
            'location_found_city' => '',
            'state_id' => '',
            // More data here...
        ]);

        // Assert response status for redirects due to validation error
        $response->assertStatus(302);

        // Assert specific validation errors are present in the session
        $response->assertSessionHasErrors([
            'specimen_name',
            'specimen_location_now',
            'location_found_city',
            'state_id',
            // Include other required fields here
        ]);
    }

    #[test]
    public function test_it_creates_a_new_specimen(): void
    {
        // Create a test user and authenticate
        $user = $this->createUser();
        $this->actingAs($user);

        // Send POST request with valid data
        $response = $this->post('/specimens', [
            'specimen_name' => 'this_is_a_test_specimen_name',
            'common_name' => $this->faker->word,
            'description' => $this->faker->sentence,
            'comment' => $this->faker->sentence,
            'specimen_location_now' => 1,
            'location_found_city' => $this->faker->city,
            'location_found_county' => 'Baldwin',
            'state_id' => 1,
            'country_id' => 1,
            'location_public_y_n' => 1,
            'share_data_y_n' => 1,
            'month_found' => 1,
            'day_found' => 15,
            'year_found' => 2024,
            'fungus_type' => 1,
            'entered_by' => $user->id,
        ]);

        // Assert the response is a redirect (302)
        $response->assertStatus(302);

        // Verify the data was inserted into the database
        $this->assertDatabaseHas('specimens', [
            'specimen_name' => 'this_is_a_test_specimen_name',
            'user_id' => $user->id,
        ]);
    }

    // Helper function (if you need to create users)
    private function createUser()
    {
        return User::factory()->create();

    }
}
