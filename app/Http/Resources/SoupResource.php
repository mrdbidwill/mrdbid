<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin \App\Models\Soup */
class SoupResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'id' => $this->id,
            'soup_name' => $this->soup_name,
            'soup_description' => $this->soup_description,

            'soup_relation' => $this->soup_relation,
        ];
    }
}
