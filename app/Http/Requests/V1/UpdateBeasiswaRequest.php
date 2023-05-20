<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateBeasiswaRequest extends FormRequest
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
        $method = $this->method();

        if($method == 'PUT') {
            return [
                'namaBeasiswa'=> ['required'],
                'mitraId'=> ['required'],
                'deskripsi'=> ['required'],
                'angkatanAwal'=> ['required'],
                'angkatanAkhir'=> ['required'],
                'semMin'=> ['required'],
                'semMax'=> ['required'],
                'status'=> ['required', Rule::in(['1','2'])]
            ];
        }else{
            return [
                'namaBeasiswa'=> ['sometimes','required'],
                'mitraId'=> ['sometimes','required'],
                'deskripsi'=> ['sometimes','required'],
                'angkatanAwal'=> ['sometimes','required'],
                'angkatanAkhir'=> ['sometimes','required'],
                'semMin'=> ['sometimes','required'],
                'semMax'=> ['sometimes','required'],
                'status'=> ['sometimes','required', Rule::in(['1','2'])]
            ];
        }
        
        
    }
    protected function prepareForValidation() {

        if($this->namaBeasiswa){
            $this->merge(['nama_beasiswa' => $this->namaBeasiswa,]);
        }
        if($this->mitraId){
            $this->merge(['mitra_id' => $this->mitraId]);
        }
        if($this->angkatanAwal){
            $this->merge(['angkatan_awal' => $this->angkatanAwal,]);
        }
        if($this->angkatanAkhir){
            $this->merge(['angkatan_akhir' => $this->angkatanAkhir,]);
        }
        if($this->semMin){
            $this->merge(['sem_min'=>$this->semMin,]);
        }
        if($this->semMax){
            $this->merge(['sem_max'=>$this->semMax]);
        }

        // $this->merge([
        //     'nama_beasiswa' => $this->namaBeasiswa,
        //     'id_mitra' => $this->idMitra,
        //     'angkatan_awal' => $this->angkatanAwal,
        //     'angkatan_akhir' => $this->angkatanAkhir,
        //     'sem_min'=>$this->semMin,
        //     'sem_max'=>$this->semMax
        // ]);
    }
}
