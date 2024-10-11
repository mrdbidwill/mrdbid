<?php

namespace Tests\Feature;

use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class MBListQueryTest extends TestCase
{
    /**
     * Test retrieving genus based on query.
     *
     * @return void
     */
    public function testRetrievesGenusBasedOnQuery()
    {
        $query = 'agari'; // Replace 'ro' with the term you want to test

        // Execute the query
        $results = DB::connection('MBList')->table('list')
            ->where('Rank_', 'gen')
            ->where('Taxon_name', 'like', '%'.$query.'%')
            ->select('Taxon_name')
            ->distinct()
            ->get();

        // Assert the results are as expected
        $this->assertNotEmpty($results, 'Query returned no results');
        foreach ($results as $result) {
            $this->assertStringContainsString($query, $result->Taxon_name, 'The taxon name should contain the query term');
        }
    }
}
