<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SoupRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'soup_name' => ['required'],
            'soup_description' => ['nullable'],
            'soup_relation' => ['required', 'exists:specimens'],
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
