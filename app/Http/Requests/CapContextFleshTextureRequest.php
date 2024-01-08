<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CapContextFleshTextureRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['required'],
            'comments' => ['nullable'],
            'description' => ['required'],
            'source' => ['required', 'integer'],
            'entered_by' => ['required', 'integer'],
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
