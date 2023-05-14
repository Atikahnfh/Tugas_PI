<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class JurusanbeasiswaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'idJrsnBeasiwa' => $this->id,
            'idBeasiswa' => $this->beasiswa_id,
            'idKhsJurusan' => $this->id_beasiswakhsjrsn,
            'ipkMin' => $this->ipk_min
        ];
    }
}
