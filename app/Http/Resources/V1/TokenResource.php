<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TokenResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'idToken' => $this->id,
            'idKlien'=>$this->id_klien,
            'token'=>$this->token,
            'levelKlien'=>$this->level_klien
        ];
    }
}
