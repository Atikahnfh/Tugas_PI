<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KlienResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'idKlien'=>$this->id,
            'usernameKlien'=>$this->username_klien,
            'emailKlien'=>$this->email_klien,
            'passwordKlien'=>$this->password_klien,

        ];
    }
}
