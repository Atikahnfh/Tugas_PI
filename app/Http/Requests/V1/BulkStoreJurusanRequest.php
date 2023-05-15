<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class BulkStoreBeasiswaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            '*.namaJurusan'=> ['required'],
        ];

        
    }
    protected function prepareForValidation() {
        // $this->merge([
        //     'nama_beasiswa' => $this->namaBeasiswa,
        //     'id_mitra' => $this->idMitra,
        //     'angkatan_awal' => $this->angkatanAwal,
        //     'angkatan_akhir' => $this->angkatanAkhir,
        //     'sem_min'=>$this->semMin,
        //     'sem_max'=>$this->semMax
        // ]);

        $data = [];

        foreach($this->toArray() as $obj) {
            $obj['nama_jurusan'] = $obj['namaJurusan'] ?? null;
           
            $data[] = $obj;

        }

        $this->merge($data);



    }
}
