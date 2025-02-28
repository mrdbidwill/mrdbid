<?php

namespace App\Livewire;

use App\Models\Specimen;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Livewire\Component;

class SpecimenForm extends Component
{
    public $specimen_name;

    public $common_name;

    public $specimen_location_now;

    public $description;

    public $comment;

    public $location_found_city;

    public $location_found_county;

    public $state_id;

    public $country_id;

    public $location_public_y_n = false;

    public $share_data_y_n = false;

    public $month_found;

    public $day_found;

    public $year_found;

    public $fungus_type;

    public $entered_by;

    // Dropdown options
    public $countries = [];

    public $states = [];

    public $specimen_locations = [];

    public $fungus_types = [];

    public $days = [];

    public $months = [];

    public $years = [];

    public $uniqueError = '';

    public function mount()
    {
        // Preload dropdown options for the form
        $this->countries = DB::table('countries')->pluck('name', 'id')->toArray();
        $this->specimen_locations = DB::table('specimen_locations_now')->pluck('name', 'id')->toArray();
        $this->fungus_types = DB::table('fungus_types')->pluck('name', 'id')->toArray();

        $this->days = range(1, 31);
        $this->months = range(1, 12);
        $this->years = range(1954, 2025); // Only allow years from 1954 to 2025
    }

    public function updatedCountryId()
    {
        // Dynamically load states based on selected country
        $this->states = DB::table('states')
            ->where('country_id', $this->country_id)
            ->pluck('name', 'id')
            ->toArray();
        $this->state_id = null; // Reset selected state
    }

    public function updatedSpecimenName()
    {
        // Real-time validation for unique specimen name
        $this->validate([
            'specimen_name' => [
                'required',
                'string',
                'min:3',
                'max:255',
                Rule::unique('specimens', 'specimen_name')
                    ->where('user_id', Auth::id()), // Ensure unique per user
            ],
        ]);
        $this->uniqueError = '';
    }

    public function submit()
    {
        // Validation for ALL form fields
        $validatedData = $this->validate([
            'specimen_name' => 'required|string|min:3|max:255',
            'common_name' => 'sometimes|string|min:3|max:255',
            'specimen_location_now' => 'sometimes|integer',
            'description' => 'sometimes|string|max:1024',
            'comment' => 'sometimes|string|max:1024',
            'location_found_city' => 'sometimes|string|min:3|max:255',
            'location_found_county' => 'sometimes|string|min:3|max:255',
            'state_id' => 'sometimes|integer',
            'country_id' => 'sometimes|integer',
            'location_public_y_n' => 'sometimes|boolean',
            'share_data_y_n' => 'sometimes|boolean',
            'month_found' => 'sometimes|integer|min:1|max:12',
            'day_found' => 'sometimes|integer|min:1|max:31',
            'year_found' => 'sometimes|integer|min:1954|max:2025',
            'fungus_type' => 'sometimes|integer',
            'entered_by' => 'sometimes|integer',
        ]);

        // Add user ID field for saving
        $validatedData['user_id'] = Auth::id();

        // Save the data to the `specimens` table
        Specimen::create($validatedData);

        // Provide feedback and redirect
        session()->flash('success', 'Specimen created successfully!');

        return redirect()->route('specimens.index');
    }

    public function render()
    {
        return view('livewire.specimen-form');
    }
}
