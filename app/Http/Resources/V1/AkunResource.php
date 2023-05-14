<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AkunResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'idAkun' => $this->id,
            'username' => $this->username,
            'email' => $this->email,
            'password'=>$this->password,
            'level'=>$this->level
        ];
    }
}
