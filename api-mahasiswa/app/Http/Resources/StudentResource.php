<?php

namespace App\Http\Resources;

use App\Models\Status;
use App\Models\Academic;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $academic = Academic::where('id', '=', $this->id)->first();
        $status = Status::where('id', '=', $this->id)->first();

        return [
            'id' => (string)$this->id,
            'attributes' => [
                'nama' => $this->name,
                'nim' => $this->nim,
                'jenis_kelamin' => $this->sex,
                'foto  ' => $this->photo ,
            ],
            'relationship' => [
                'fakultas' => $academic->faculty,
                'juruan' => $academic->major,
                'jenjang' => $academic->level,
                'ipk' => $academic->gpa,
                'angkatan' => $status->batch,
                'semester_terdaftar' => $status->registered_semester,
                'status' => $status->status,
            ],
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
