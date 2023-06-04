<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Jurusanbeasiswa;
use App\Models\Beasiswa;
use App\Models\Jurusan;

class JurusanbeasiswaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $idreplacement = null;
        if(!$this->idjrsnbeasis){
            $idreplacement = $this->id;
        }else{
            $idreplacement = $this->idjrsnbeasis;
        }

        $getnama = JurusanBeasiswa::join('beasiswas', 'beasiswas.id', '=','beasiswa_id')
        ->join('jurusans', 'jurusans.id', '=','id_beasiswakhsjrsn')
            ->where('jurusanbeasiswas.id', $idreplacement)->first();

        
        
        return [
            'idJrsnBeasiwa' => $idreplacement,
            'idBeasiswa' => $this->beasiswa_id,
            'idKhsJurusan' => $this->id_beasiswakhsjrsn,
            'namaBeasiswa' => $getnama->nama_beasiswa,
            'namaJurusan' => $getnama->nama_jurusan
        ];
    }
}
