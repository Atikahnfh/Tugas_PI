<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class BulkStoreJurusanBeasiswaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user = $this->user( );

        return $user != null && $user->tokenCan('*');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            '*.beasiswaId'=> ['required'],
            '*.idBeasiswakhsjrsn'=> ['required','integer'],
            '*.ipkMin'=> ['required']

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
            $obj['beasiswa_id'] = $obj['beasiswaId'] ?? null;
            $obj['id_beasiswakhsjrsn'] = $obj['idBeasiswakhsjrsn'] ?? null;
            $obj['ipk_min'] = $obj['ipkMin'] ?? null;
            $data[] = $obj;

        }

        $this->merge($data);



    }
}
