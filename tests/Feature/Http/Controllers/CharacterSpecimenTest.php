<?php

namespace Tests\Feature\Http\Controllers;

use Tests\TestCase;

class CharacterSpecimenTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_example(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
