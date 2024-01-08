<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SpecimenRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'specimen_name' => ['required'],
            'specimen_owner' => ['required', 'integer'],
            'comments' => ['nullable'],
            'common_name' => ['required'],
            'date_month_found' => ['required', 'integer'],
            'date_day_found' => ['required', 'integer'],
            'date_year_found' => ['required', 'integer'],
            'location_found_county' => ['required'],
            'location_found_city' => ['nullable'],
            'state' => ['required', 'integer'],
            'country' => ['required', 'integer'],
            'annulus_position' => ['required', 'integer'],
            'cap_context_flesh_texture' => ['required', 'integer'],
            'entered_by' => ['required', 'integer'],
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
