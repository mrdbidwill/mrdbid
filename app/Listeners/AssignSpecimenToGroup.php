<?php

namespace App\Listeners;

use App\Events\SpecimenCreated;
use App\Models\Group;

class AssignSpecimenToGroup
{
    /**
     * Handle the event.
     */
    public function handle(SpecimenCreated $event): void
    {
        $specimen = $event->specimen;

        // Find the group belonging to the specimen's user where the name matches "January"
        $group = Group::where('user_id', $specimen->user_id)
            ->where('name', 'January') // Update name if necessary
            ->first();

        if ($group) {
            // Attach the specimen to the group
            $specimen->groups()->syncWithoutDetaching([$group->id]);
        }
    }
}
