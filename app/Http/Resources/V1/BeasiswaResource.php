<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BeasiswaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'idBeasiswa' => $this->id,
            'namaBeasiswa' => $this->nama_beasiswa,
            'idMitra' => $this->id_mitra,
            'deskripsi' => $this->deskripsi,
            'angkatanAwal' => $this->angkatan_awal,
            'angkatanAkhir' => $this->angkatan_akhir,
            'semMin'=> $this->sem_min,
            'semMax'=>$this->sem_max,
            'status'=>$this->status,

            'jurusanbeasiswas' => JurusanBeasiswaResource::collection($this->whenLoaded('jurusanbeasiswas'))
        ];
    }
}
