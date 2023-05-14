<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreBeasiswaRequest extends FormRequest
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
            'namaBeasiswa'=> ['required'],
            'idMitra'=> ['required'],
            'deskripsi'=> ['required'],
            'angkatanAwal'=> ['required'],
            'angkatanAkhir'=> ['required'],
            'semMin'=> ['required'],
            'semMax'=> ['required'],
            'status'=> ['required', Rule::in(['1','2'])]
        ];

        
    }
    protected function prepareForValidation() {
            $this->merge([
                'nama_beasiswa' => $this->namaBeasiswa,
                'id_mitra' => $this->idMitra,
                'angkatan_awal' => $this->angkatanAwal,
                'angkatan_akhir' => $this->angkatanAkhir,
                'sem_min'=>$this->semMin,
                'sem_max'=>$this->semMax
            ]);
    }
}
