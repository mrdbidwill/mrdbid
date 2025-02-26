<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

class SpecimenControllerTest extends TestCase
{
    use RefreshDatabase;

    #[test]
    public function test_it_validates_specimen_creation_data(): void
    {
        // Create and authenticate a test user
        $user = User::factory()->create();
        $this->actingAs($user);

        // Submit invalid data
        $response = $this->post('/specimens', [
            'specimen_name' => '', // Missing required field
            'common_name' => '', // Missing required field

        ]);

        // Assert that the response indicates a validation failure
        $response->assertStatus(302);

        // Assert specific validation errors were returned for missing fields
        $response->assertSessionHasErrors([
            'specimen_name',
            'common_name',
            'specimen_location_now',
            'location_found_city',
            'location_found_county',
            'state_id',
            'country_id',
        ]);
    }

    #[test]
    public function test_it_creates_a_new_specimen(): void
    {
        // Create and authenticate a test user
        $user = User::factory()->create();
        $this->actingAs($user);

        // Submit valid data
        $response = $this->post('/specimens', [
            'specimen_name' => 'test-specimen',
            'common_name' => 'test-common',
            'description' => 'test-description',
            'comment' => 'test-comment',
            'specimen_location_now' => 1,
            'location_found_city' => 'Blakeley',
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

        // Assert the request was a success (302 redirect)
        $response->assertStatus(302);

        // Verify the database contains the new specimen
        $this->assertDatabaseHas('specimens', [
            'specimen_name' => 'test-specimen',
            'user_id' => $user->id,
        ]);
    }
}
