<?php

namespace App\Http\Resources\V1;

use App\Models\Mitra;
use App\Models\Beasiswa;
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
        $statusreplacement = "";
        if($this->status == 1){
            $statusreplacement = "Aktif";
        }else{
            $statusreplacement = "Tidak Aktif";
        }
        
        $mitranama = Beasiswa::join('mitras','mitras.id','=','mitra_id')
        ->where('beasiswas.id', $this->id)->first();

        return [
            'idBeasiswa' => $this->id,
            'namaBeasiswa' => $this->nama_beasiswa,
            'idMitra' => $this->mitra_id,
            'deskripsi' => $this->deskripsi,
            'angkatanAwal' => $this->angkatan_awal,
            'angkatanAkhir' => $this->angkatan_akhir,
            'semMin'=> $this->sem_min,
            'semMax'=>$this->sem_max,
            'status'=>$statusreplacement,
            'ipkMin'=> $this->ipk_min,
            'namaMitra' => $mitranama->nama_mitra,
            'linkDaftar' => $this->link_daftar,
            'image' => $this->image,
            'jurusanbeasiswas' => JurusanBeasiswaResource::collection($this->whenLoaded('jurusanbeasiswas')),
            'mitras' => MitraResource::collection($this->whenLoaded('mitras')),
        ];
    }
}
